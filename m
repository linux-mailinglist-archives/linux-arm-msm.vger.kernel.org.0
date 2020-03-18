Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A923318A847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 23:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgCRWeG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 18:34:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgCRWeG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 18:34:06 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B80E2076F;
        Wed, 18 Mar 2020 22:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584570845;
        bh=wCFIzWLWMkiT8lTa8V+0C/JqIcP9mF/QSeauJauOzpI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jmjErUMUP3x8nQ2xrxHLZ7HcxmyYxXZuBqYoP0HKb8n1iNax7keZ66Z5nV2hT9Xwy
         ZYI1GsHQyJsEab3G+3TvMJqIQu3rsUe1b4WZw0dapl4Hf1XBCMN5GmNgLQg8HCgPes
         UaPg5INpoTdSpoqu9rNcUV9ovHMuUyc5w8bNNfLU=
Date:   Wed, 18 Mar 2020 22:34:00 +0000
From:   Will Deacon <will@kernel.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org, robin.murphy@arm.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 2/5] iommu/arm-smmu: Add support for TTBR1
Message-ID: <20200318223400.GA10304@willie-the-truck>
References: <1580248819-12644-1-git-send-email-jcrouse@codeaurora.org>
 <1580248819-12644-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580248819-12644-3-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 28, 2020 at 03:00:16PM -0700, Jordan Crouse wrote:
> Add support to enable TTBR1 if the domain requests it via the
> DOMAIN_ATTR_SPLIT_TABLES attribute. If enabled by the hardware
> and pagetable configuration the driver will configure the TTBR1 region
> and program the domain pagetable on TTBR1. TTBR0 will be disabled.
> 
> After attaching the device the value of he domain attribute can
> be queried to see if the split pagetables were successfully programmed.
> The domain geometry will be updated as well so that the caller can
> determine the active region for the pagetable that was programmed.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  drivers/iommu/arm-smmu.c | 48 +++++++++++++++++++++++++++++++++++++++++-------
>  drivers/iommu/arm-smmu.h | 22 ++++++++++++++++------
>  2 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 16c4b87..23b22fa 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -557,11 +557,17 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>  			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
>  			cb->ttbr[1] = 0;
>  		} else {
> -			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> -			cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -						  cfg->asid);
> -			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -						 cfg->asid);

I think it would be clearer if you set the ASID in TTBR0 unconditionally
here...

> +			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +				cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +							 cfg->asid);
> +				cb->ttbr[1] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +			} else {
> +				cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +				cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +							  cfg->asid);

... and then OR'd in the TTBR base here.

> +				cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +							 cfg->asid);
> +			}
>  		}
>  	} else {
>  		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> @@ -675,6 +681,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  	enum io_pgtable_fmt fmt;
>  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	unsigned long quirks = 0;
>  
>  	mutex_lock(&smmu_domain->init_mutex);
>  	if (smmu_domain->smmu)
> @@ -743,6 +750,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		oas = smmu->ipa_size;
>  		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
>  			fmt = ARM_64_LPAE_S1;
> +
> +			/*
> +			 * We are assuming that split pagetables will always use
> +			 * SEP_UPSTREAM so we don't need to reduce the size of
> +			 * the ias to account for the sign extension bit
> +			 */
> +			if (smmu_domain->split_pagetables)
> +				quirks |= IO_PGTABLE_QUIRK_ARM_TTBR1;
>  		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
>  			fmt = ARM_32_LPAE_S1;
>  			ias = min(ias, 32UL);
> @@ -812,6 +827,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  		.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
>  		.tlb		= smmu_domain->flush_ops,
>  		.iommu_dev	= smmu->dev,
> +		.quirks		= quirks,
>  	};
>  
>  	if (smmu_domain->non_strict)
> @@ -825,8 +841,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  
>  	/* Update the domain's page sizes to reflect the page table format */
>  	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -	domain->geometry.aperture_end = (1UL << ias) - 1;
> -	domain->geometry.force_aperture = true;
> +
> +	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +		domain->geometry.aperture_start = ~0UL << ias;
> +		domain->geometry.aperture_end = ~0UL;
> +	} else {
> +		domain->geometry.aperture_end = (1UL << ias) - 1;
> +		domain->geometry.force_aperture = true;
> +		smmu_domain->split_pagetables = false;
> +	}

Why do you only force the aperture for TTBR0?

> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 8d1cd54..53053fd 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -172,6 +172,7 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_TCR_SH0		GENMASK(13, 12)
>  #define ARM_SMMU_TCR_ORGN0		GENMASK(11, 10)
>  #define ARM_SMMU_TCR_IRGN0		GENMASK(9, 8)
> +#define ARM_SMMU_TCR_EPD0		BIT(7)
>  #define ARM_SMMU_TCR_T0SZ		GENMASK(5, 0)
>  
>  #define ARM_SMMU_VTCR_RES1		BIT(31)
> @@ -343,16 +344,25 @@ struct arm_smmu_domain {
>  	struct mutex			init_mutex; /* Protects smmu pointer */
>  	spinlock_t			cb_lock; /* Serialises ATS1* ops and TLB syncs */
>  	struct iommu_domain		domain;
> +	bool				split_pagetables;
>  };
>  
>  static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
>  {
> -	return ARM_SMMU_TCR_EPD1 |
> -	       FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> -	       FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> -	       FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> -	       FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> -	       FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
> +		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
> +		FIELD_PREP(ARM_SMMU_TCR_ORGN0, cfg->arm_lpae_s1_cfg.tcr.orgn) |
> +		FIELD_PREP(ARM_SMMU_TCR_IRGN0, cfg->arm_lpae_s1_cfg.tcr.irgn) |
> +		FIELD_PREP(ARM_SMMU_TCR_T0SZ, cfg->arm_lpae_s1_cfg.tcr.tsz);
> +
> +       /*
> +	* When TTBR1 is selected shift the TCR fields by 16 bits and disable
> +	* translation in TTBR0
> +	*/
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +		return (tcr << 16) | ARM_SMMU_TCR_EPD0;
> +
> +	return tcr | ARM_SMMU_TCR_EPD1;
>  }

Please give this a single return statement, i.e.

	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
		tcr = (tcr << 16) | ARM_SMMU_TCR_EPD0;
	else
		tcr |= ARM_SMMU_TCR_EPD1;

	return tcr;

Will
