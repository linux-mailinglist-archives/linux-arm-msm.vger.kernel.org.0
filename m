Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDCC1A92F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 08:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389858AbgDOGKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 02:10:23 -0400
Received: from mga06.intel.com ([134.134.136.31]:20146 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731298AbgDOGKV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 02:10:21 -0400
IronPort-SDR: dSuo3T3idle2qp5g+E3kGD33taojMR5EGDQKBaIbqVU7adnzVZJrO+9LVCrq+NBX8DHqhmJUnm
 iP7yDhogvvhQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2020 23:10:10 -0700
IronPort-SDR: Xrzeker15iDL0GxYgNylnyNCcgOHg/5LrDmSleRIXI69KwIrj67IOyQN42jm1/hyg4yAT+vZ4w
 my6GtVMJbzjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,385,1580803200"; 
   d="scan'208";a="363586963"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.208]) ([10.254.210.208])
  by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2020 23:10:04 -0700
Cc:     baolu.lu@linux.intel.com, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v2 13/33] iommu: Export bus_iommu_probe() and make is safe
 for re-probing
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-14-joro@8bytes.org>
From:   Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1853992c-47a6-3724-812c-a52558c13732@linux.intel.com>
Date:   Wed, 15 Apr 2020 14:10:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414131542.25608-14-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020/4/14 21:15, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add a check to the bus_iommu_probe() call-path to make sure it ignores
> devices which have already been successfully probed. Then export the
> bus_iommu_probe() function so it can be used by IOMMU drivers.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/iommu.c | 6 +++++-
>   include/linux/iommu.h | 1 +
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 834a45da0ed0..a2ff95424044 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1615,6 +1615,10 @@ static int probe_iommu_group(struct device *dev, void *data)
>   	if (!dev_iommu_get(dev))
>   		return -ENOMEM;
>   
> +	/* Device is probed already if in a group */
> +	if (iommu_group_get(dev) != NULL)

Same as
	if (iommu_group_get(dev))
?

By the way, do we need to put the group if device has already been
probed?

Best regards,
baolu
