Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4B825DED9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 18:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgIDQBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 12:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgIDQA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 12:00:28 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08029C061246
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 09:00:24 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id e23so6311687otk.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l7LoSFQsLXDiF4Ji50t4+0OWRIPdPxzSD1bzh5bWiVM=;
        b=eiIw4NsX/hyoaaz/4K6N1vOyEUOseagRphmbmaYrEF6mHxd2oVHydbdxC9ZQ9YFYxm
         nL2oGB3LfRzX/80v0sedNSZxTdaNpZFFLXXCBdUChphm2FX6yQgON4tQihG1DsVfYLZx
         dVPb5044+cKlSIz1QXm9DkbHXOJbnnTTwA6joHib4R/9W9CEsh1kVz087skXVlHTIwJb
         3/VeiT+B1dsInWZ3bWxBRyLBYjOeyR3suSnpmOnVFdDsU3XFOo+cD8OiV8fYyDWmksib
         djSM17ZBDsqJUjoG5vrupPycQozkYxOkbYelyjKaYjL+qmblPnKtCxWRPql6Sx+I/S0c
         01ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l7LoSFQsLXDiF4Ji50t4+0OWRIPdPxzSD1bzh5bWiVM=;
        b=XpmcTXt6atU36mWdHNBBUAGqMVywHoZtODz/1nq9dLFlHLiw6MfVbJdoMJaDwKZsQi
         2KNH1fqARKZsagk2ap81sAVtfvBht0t5RIq3mj2D/blKoBKfY1jbdIenAvh/9a39F7Wk
         sFsvrQ192cZ0Ht3F4+o+0S8/2Xr8hbQ6DKGUrtsFj0NqyDGONRW8PCWU1P6y5KoWnHfn
         cGPnE+6nxUgoNr3YpYHRVjhnM4CN8ZtGM6p6dqXqtsGkx2NqlHpX54Crk1Yucg3gftLZ
         9wNNHzpUGCVRsAOyGGk9Rxo0XKhthBOg6MDGdOBGQ2EWgx6Rz7xYFzzOIAN88NbPem9u
         KY4g==
X-Gm-Message-State: AOAM531v7aTEiTgRFZ8cy0cCcSs0fFDtb9hqWrchilZQPigb39rrkhOy
        AoE/dgoHPCRdx/nYx3tGLaXEEz3jBy7TyA==
X-Google-Smtp-Source: ABdhPJwEPb6TXkzRGgvBsJjfupGmCtXahK43pSYpwnSmjBaRhRAFXuNxknYwxjhASOP7uTdjp/NgDw==
X-Received: by 2002:a9d:7095:: with SMTP id l21mr6105710otj.224.1599235223846;
        Fri, 04 Sep 2020 09:00:23 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id t1sm1370247ooi.27.2020.09.04.09.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 09:00:23 -0700 (PDT)
Date:   Fri, 4 Sep 2020 11:00:18 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Hanna Hawa <hannah@marvell.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 14/20] iommu/arm-smmu: Prepare for the adreno-smmu
 implementation
Message-ID: <20200904160018.GH3715@yoga>
References: <20200901164707.2645413-1-robdclark@gmail.com>
 <20200901164707.2645413-15-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901164707.2645413-15-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 01 Sep 11:46 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Do a bit of prep work to add the upcoming adreno-smmu implementation.
> 
> Add an hook to allow the implementation to choose which context banks
> to allocate.
> 
> Move some of the common structs to arm-smmu.h in anticipation of them
> being used by the implementations and update some of the existing hooks
> to pass more information that the implementation will need.
> 
> These modifications will be used by the upcoming Adreno SMMU
> implementation to identify the GPU device and properly configure it
> for pagetable switching.
> 
> Co-developed-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

As I built the handoff support on top of this patch I ended up
reworking the alloc_context_bank() prototype to something I found a
little bit cleaner.

So perhaps you would be interested in squashing
https://lore.kernel.org/linux-arm-msm/20200904155513.282067-2-bjorn.andersson@linaro.org/
into this patch?

Otherwise, feel free to add my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c      | 69 ++++++----------------
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      | 51 +++++++++++++++-
>  3 files changed, 68 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index a9861dcd0884..88f17cc33023 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -69,7 +69,7 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
>  }
>  
>  static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
> -		struct io_pgtable_cfg *pgtbl_cfg)
> +		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
>  	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
>  					      struct cavium_smmu, smmu);
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 8e884e58f208..68b7b9e6140e 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -65,41 +65,10 @@ module_param(disable_bypass, bool, S_IRUGO);
>  MODULE_PARM_DESC(disable_bypass,
>  	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
>  
> -struct arm_smmu_s2cr {
> -	struct iommu_group		*group;
> -	int				count;
> -	enum arm_smmu_s2cr_type		type;
> -	enum arm_smmu_s2cr_privcfg	privcfg;
> -	u8				cbndx;
> -};
> -
>  #define s2cr_init_val (struct arm_smmu_s2cr){				\
>  	.type = disable_bypass ? S2CR_TYPE_FAULT : S2CR_TYPE_BYPASS,	\
>  }
>  
> -struct arm_smmu_smr {
> -	u16				mask;
> -	u16				id;
> -	bool				valid;
> -};
> -
> -struct arm_smmu_cb {
> -	u64				ttbr[2];
> -	u32				tcr[2];
> -	u32				mair[2];
> -	struct arm_smmu_cfg		*cfg;
> -};
> -
> -struct arm_smmu_master_cfg {
> -	struct arm_smmu_device		*smmu;
> -	s16				smendx[];
> -};
> -#define INVALID_SMENDX			-1
> -#define cfg_smendx(cfg, fw, i) \
> -	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
> -#define for_each_cfg_sme(cfg, fw, i, idx) \
> -	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
> -
>  static bool using_legacy_binding, using_generic_binding;
>  
>  static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> @@ -234,19 +203,6 @@ static int arm_smmu_register_legacy_master(struct device *dev,
>  }
>  #endif /* CONFIG_ARM_SMMU_LEGACY_DT_BINDINGS */
>  
> -static int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> -{
> -	int idx;
> -
> -	do {
> -		idx = find_next_zero_bit(map, end, start);
> -		if (idx == end)
> -			return -ENOSPC;
> -	} while (test_and_set_bit(idx, map));
> -
> -	return idx;
> -}
> -
>  static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
>  {
>  	clear_bit(idx, map);
> @@ -578,7 +534,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>  	}
>  }
>  
> -static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
> +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  {
>  	u32 reg;
>  	bool stage1;
> @@ -665,7 +621,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
>  }
>  
>  static int arm_smmu_init_domain_context(struct iommu_domain *domain,
> -					struct arm_smmu_device *smmu)
> +					struct arm_smmu_device *smmu,
> +					struct device *dev)
>  {
>  	int irq, start, ret = 0;
>  	unsigned long ias, oas;
> @@ -780,10 +737,20 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> -	ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
> +
> +	smmu_domain->smmu = smmu;
> +
> +	if (smmu->impl && smmu->impl->alloc_context_bank)
> +		ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
> +				start, smmu->num_context_banks);
> +	else
> +		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
>  				      smmu->num_context_banks);
> -	if (ret < 0)
> +
> +	if (ret < 0) {
> +		smmu_domain->smmu = NULL;
>  		goto out_unlock;
> +	}
>  
>  	cfg->cbndx = ret;
>  	if (smmu->version < ARM_SMMU_V2) {
> @@ -798,8 +765,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	else
>  		cfg->asid = cfg->cbndx;
>  
> -	smmu_domain->smmu = smmu;
> -
>  	pgtbl_cfg = (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	= smmu->pgsize_bitmap,
>  		.ias		= ias,
> @@ -810,7 +775,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	};
>  
>  	if (smmu->impl && smmu->impl->init_context) {
> -		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
> +		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
>  		if (ret)
>  			goto out_clear_smmu;
>  	}
> @@ -1194,7 +1159,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return ret;
>  
>  	/* Ensure that the domain is finalised */
> -	ret = arm_smmu_init_domain_context(domain, smmu);
> +	ret = arm_smmu_init_domain_context(domain, smmu, dev);
>  	if (ret < 0)
>  		goto rpm_put;
>  
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index f3e456893f28..59ff3fc5c6c8 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -256,6 +256,21 @@ enum arm_smmu_implementation {
>  	QCOM_SMMUV2,
>  };
>  
> +struct arm_smmu_s2cr {
> +	struct iommu_group		*group;
> +	int				count;
> +	enum arm_smmu_s2cr_type		type;
> +	enum arm_smmu_s2cr_privcfg	privcfg;
> +	u8				cbndx;
> +};
> +
> +struct arm_smmu_smr {
> +	u16				mask;
> +	u16				id;
> +	bool				valid;
> +	bool				pinned;
> +};
> +
>  struct arm_smmu_device {
>  	struct device			*dev;
>  
> @@ -331,6 +346,13 @@ struct arm_smmu_cfg {
>  };
>  #define ARM_SMMU_INVALID_IRPTNDX	0xff
>  
> +struct arm_smmu_cb {
> +	u64				ttbr[2];
> +	u32				tcr[2];
> +	u32				mair[2];
> +	struct arm_smmu_cfg		*cfg;
> +};
> +
>  enum arm_smmu_domain_stage {
>  	ARM_SMMU_DOMAIN_S1 = 0,
>  	ARM_SMMU_DOMAIN_S2,
> @@ -350,6 +372,11 @@ struct arm_smmu_domain {
>  	struct iommu_domain		domain;
>  };
>  
> +struct arm_smmu_master_cfg {
> +	struct arm_smmu_device		*smmu;
> +	s16				smendx[];
> +};
> +
>  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  {
>  	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> @@ -400,14 +427,35 @@ struct arm_smmu_impl {
>  	int (*cfg_probe)(struct arm_smmu_device *smmu);
>  	int (*reset)(struct arm_smmu_device *smmu);
>  	int (*init_context)(struct arm_smmu_domain *smmu_domain,
> -			struct io_pgtable_cfg *cfg);
> +			struct io_pgtable_cfg *cfg, struct device *dev);
>  	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>  			 int status);
>  	int (*def_domain_type)(struct device *dev);
>  	irqreturn_t (*global_fault)(int irq, void *dev);
>  	irqreturn_t (*context_fault)(int irq, void *dev);
> +	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
> +			struct device *dev, int start, int max);
>  };
>  
> +#define INVALID_SMENDX			-1
> +#define cfg_smendx(cfg, fw, i) \
> +	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
> +#define for_each_cfg_sme(cfg, fw, i, idx) \
> +	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)
> +
> +static inline int __arm_smmu_alloc_bitmap(unsigned long *map, int start, int end)
> +{
> +	int idx;
> +
> +	do {
> +		idx = find_next_zero_bit(map, end, start);
> +		if (idx == end)
> +			return -ENOSPC;
> +	} while (test_and_set_bit(idx, map));
> +
> +	return idx;
> +}
> +
>  static inline void __iomem *arm_smmu_page(struct arm_smmu_device *smmu, int n)
>  {
>  	return smmu->base + (n << smmu->pgshift);
> @@ -472,6 +520,7 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *nvidia_smmu_impl_init(struct arm_smmu_device *smmu);
>  struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu);
>  
> +void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
>  int arm_mmu500_reset(struct arm_smmu_device *smmu);
>  
>  #endif /* _ARM_SMMU_H */
> -- 
> 2.26.2
> 
