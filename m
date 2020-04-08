Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85061A2160
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 14:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgDHMJs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 08:09:48 -0400
Received: from foss.arm.com ([217.140.110.172]:37864 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727896AbgDHMJs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 08:09:48 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5703C31B;
        Wed,  8 Apr 2020 05:09:47 -0700 (PDT)
Received: from [10.57.55.221] (unknown [10.57.55.221])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA7BA3F73D;
        Wed,  8 Apr 2020 05:09:43 -0700 (PDT)
Subject: Re: [RFC PATCH 17/34] iommu/arm-smmu: Store device instead of group
 in arm_smmu_s2cr
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
References: <20200407183742.4344-1-joro@8bytes.org>
 <20200407183742.4344-18-joro@8bytes.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <98c10a41-d223-e375-9742-b6471c3dc33c@arm.com>
Date:   Wed, 8 Apr 2020 13:09:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407183742.4344-18-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-07 7:37 pm, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> This is required to convert the arm-smmu driver to the
> probe/release_device() interface.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/arm-smmu.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index a6a5796e9c41..3493501d8b2c 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -69,7 +69,7 @@ MODULE_PARM_DESC(disable_bypass,
>   	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
>   
>   struct arm_smmu_s2cr {
> -	struct iommu_group		*group;
> +	struct device			*dev;
>   	int				count;
>   	enum arm_smmu_s2cr_type		type;
>   	enum arm_smmu_s2cr_privcfg	privcfg;
> @@ -1100,7 +1100,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
>   	/* It worked! Now, poke the actual hardware */
>   	for_each_cfg_sme(cfg, fwspec, i, idx) {
>   		arm_smmu_write_sme(smmu, idx);
> -		smmu->s2crs[idx].group = group;
> +		smmu->s2crs[idx].dev = dev;
>   	}
>   
>   	mutex_unlock(&smmu->stream_map_mutex);
> @@ -1495,11 +1495,15 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   	int i, idx;
>   
>   	for_each_cfg_sme(cfg, fwspec, i, idx) {
> -		if (group && smmu->s2crs[idx].group &&
> -		    group != smmu->s2crs[idx].group)
> +		struct iommu_group *idx_grp = NULL;
> +
> +		if (smmu->s2crs[idx].dev)
> +			idx_grp = smmu->s2crs[idx].dev->iommu_group;

For a hot-pluggable bus where logical devices may share Stream IDs (like 
fsl-mc), this could happen:

   create device A
   iommu_probe_device(A)
     iommu_device_group(A) -> alloc group X
   create device B
   iommu_probe_device(B)
     iommu_device_group(A) -> lookup returns group X
   ...
   iommu_remove_device(A)
   delete device A
   create device C
   iommu_probe_device(C)
     iommu_device_group(C) -> use-after-free of A

Preserving the logical behaviour here would probably look *something* 
like the mangled diff below, but I haven't thought it through 100%.

Robin.

----->8-----
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87af42b..e88612ee47fe 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1100,10 +1100,8 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)
         iommu_group_put(group);

         /* It worked! Now, poke the actual hardware */
-       for_each_cfg_sme(fwspec, i, idx) {
+       for_each_cfg_sme(fwspec, i, idx)
                 arm_smmu_write_sme(smmu, idx);
-               smmu->s2crs[idx].group = group;
-       }

         mutex_unlock(&smmu->stream_map_mutex);
         return 0;
@@ -1500,15 +1498,17 @@ static struct iommu_group 
*arm_smmu_device_group(struct device *dev)
         }

         if (group)
-               return iommu_group_ref_get(group);
-
-       if (dev_is_pci(dev))
+               iommu_group_ref_get(group);
+       else if (dev_is_pci(dev))
                 group = pci_device_group(dev);
         else if (dev_is_fsl_mc(dev))
                 group = fsl_mc_device_group(dev);
         else
                 group = generic_device_group(dev);

+       for_each_cfg_sme(fwspec, i, idx)
+               smmu->s2crs[idx].group = group;
+
         return group;
  }
