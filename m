Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61BEE18F92B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 17:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCWQCi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 12:02:38 -0400
Received: from foss.arm.com ([217.140.110.172]:51468 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727202AbgCWQCh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 12:02:37 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393571FB;
        Mon, 23 Mar 2020 09:02:37 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95033F7C3;
        Mon, 23 Mar 2020 09:02:34 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
To:     Joerg Roedel <joro@8bytes.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "guohanjun@huawei.com" <guohanjun@huawei.com>,
        Sudeep Holla <Sudeep.Holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
Date:   Mon, 23 Mar 2020 16:02:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320091414.3941-11-joro@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Joerg,

Thanks for tackling this!

On 2020-03-20 9:14 am, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions and simplify the code
> where possible with this change.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/arm-smmu.c | 57 +++++++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 980aae73b45b..7aa36e6c19c0 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -98,12 +98,15 @@ struct arm_smmu_master_cfg {
>   	s16				smendx[];
>   };
>   #define INVALID_SMENDX			-1
> -#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
> -#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
> -#define fwspec_smendx(fw, i) \
> -	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
> -#define for_each_cfg_sme(fw, i, idx) \
> -	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
> +#define __fwspec_cfg(dev) ((struct arm_smmu_master_cfg *)dev_iommu_priv_get(dev))
> +#define fwspec_smmu(dev)  (__fwspec_cfg(dev)->smmu)
> +#define fwspec_smendx(dev, i)				\
> +	(i >= dev_iommu_fwspec_get(dev)->num_ids ?	\
> +		INVALID_SMENDX :			\
> +		__fwspec_cfg(dev)->smendx[i])
> +#define for_each_cfg_sme(dev, i, idx) \
> +	for (i = 0; idx = fwspec_smendx(dev, i), \
> +	     i < dev_iommu_fwspec_get(dev)->num_ids; ++i)

Yikes, this ends up pretty ugly, and I'd prefer not have this much 
complexity hidden in macros that were intended just to be convenient 
shorthand. Would you mind pulling in the patch below as a precursor?

Other than that, the rest of the series looks OK at a glance. We should 
also move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather 
than "firmware" data, but let's consider that separately as this series 
is already long enough.

Thanks,
Robin.

----->8-----
Subject: [PATCH] iommu/arm-smmu: Refactor master_cfg/fwspec usage

In preparation for restructuring iommu_fwspec, refactor the way we
access the arm_smmu_master_cfg private data to be less dependent on
the current layout.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/iommu/arm-smmu.c | 42 +++++++++++++++++++++-------------------
  1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87af42b..b4978f45a7f2 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -98,12 +98,10 @@ struct arm_smmu_master_cfg {
  	s16				smendx[];
  };
  #define INVALID_SMENDX			-1
-#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
-#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
-#define fwspec_smendx(fw, i) \
-	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
-#define for_each_cfg_sme(fw, i, idx) \
-	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
+#define cfg_smendx(cfg, fw, i) \
+	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
+#define for_each_cfg_sme(cfg, fw, i, idx) \
+	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)

  static bool using_legacy_binding, using_generic_binding;

@@ -1069,7 +1067,7 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)

  	mutex_lock(&smmu->stream_map_mutex);
  	/* Figure out a viable stream map entry allocation */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
  		u16 mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwspec->ids[i]);

@@ -1100,7 +1098,7 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)
  	iommu_group_put(group);

  	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		arm_smmu_write_sme(smmu, idx);
  		smmu->s2crs[idx].group = group;
  	}
@@ -1117,14 +1115,14 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)
  	return ret;
  }

-static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
+static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg,
+				      struct iommu_fwspec *fwspec)
  {
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_device *smmu = cfg->smmu;
  	int i, idx;

  	mutex_lock(&smmu->stream_map_mutex);
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (arm_smmu_free_sme(smmu, idx))
  			arm_smmu_write_sme(smmu, idx);
  		cfg->smendx[i] = INVALID_SMENDX;
@@ -1133,6 +1131,7 @@ static void arm_smmu_master_free_smes(struct 
iommu_fwspec *fwspec)
  }

  static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
+				      struct arm_smmu_master_cfg *cfg,
  				      struct iommu_fwspec *fwspec)
  {
  	struct arm_smmu_device *smmu = smmu_domain->smmu;
@@ -1146,7 +1145,7 @@ static int arm_smmu_domain_add_master(struct 
arm_smmu_domain *smmu_domain,
  	else
  		type = S2CR_TYPE_TRANS;

-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
  			continue;

@@ -1162,8 +1161,9 @@ static int arm_smmu_attach_dev(struct iommu_domain 
*domain, struct device *dev)
  {
  	int ret;
  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu;
  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_master_cfg *cfg;
+	struct arm_smmu_device *smmu;

  	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
  		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
@@ -1177,10 +1177,11 @@ static int arm_smmu_attach_dev(struct 
iommu_domain *domain, struct device *dev)
  	 * domains, just say no (but more politely than by dereferencing NULL).
  	 * This should be at least a WARN_ON once that's sorted.
  	 */
-	if (!fwspec->iommu_priv)
+	cfg = fwspec->iommu_priv;
+	if (!cfg)
  		return -ENODEV;

-	smmu = fwspec_smmu(fwspec);
+	smmu = cfg->smmu;

  	ret = arm_smmu_rpm_get(smmu);
  	if (ret < 0)
@@ -1204,7 +1205,7 @@ static int arm_smmu_attach_dev(struct iommu_domain 
*domain, struct device *dev)
  	}

  	/* Looks ok, so add the device to the domain */
-	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
+	ret = arm_smmu_domain_add_master(smmu_domain, cfg, fwspec);

  	/*
  	 * Setup an autosuspend delay to avoid bouncing runpm state.
@@ -1475,7 +1476,7 @@ static void arm_smmu_remove_device(struct device *dev)
  		return;

  	iommu_device_unlink(&smmu->iommu, dev);
-	arm_smmu_master_free_smes(fwspec);
+	arm_smmu_master_free_smes(cfg, fwspec);

  	arm_smmu_rpm_put(smmu);

@@ -1487,11 +1488,12 @@ static void arm_smmu_remove_device(struct device 
*dev)
  static struct iommu_group *arm_smmu_device_group(struct device *dev)
  {
  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
+	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_device *smmu = cfg->smmu;
  	struct iommu_group *group = NULL;
  	int i, idx;

-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (group && smmu->s2crs[idx].group &&
  		    group != smmu->s2crs[idx].group)
  			return ERR_PTR(-EINVAL);
-- 
2.17.1
