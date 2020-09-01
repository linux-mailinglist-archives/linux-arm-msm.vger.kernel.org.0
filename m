Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0688E25865C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 05:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgIADl3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 23:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726131AbgIADl2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 23:41:28 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63A7AC0612FF
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 20:41:28 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e23so7315264otk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 20:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m9Iy8xTCC/lsqmeyypdzVoGtMOlOgKNaC8wzlU8V0Ak=;
        b=OvdGgx8zL65e4Bb0BcRh6yN/3q4dC8gjuaK+3Fhp4cUpG3iCDerutJodNY03OjYGP8
         Z7IeLMMyALrTbMCIheI/0pB9cFz8WOgmYMVVS4jpwYTel3xiCmjFIAmT/aZASLFaWd4T
         +KlMM+ZpXAHZxi2uxzJUWy5SvcX11B11Qn9yVD/wZUxJXte8pEL7w7rNAxWAuhIc35CN
         Z0PV5saGr80uO1fKWdefggxhfofcB5C9jh2zqS75yi2w1Q6GwKLqlIfRw7Z3vzdZXDaD
         QEF2clVJcASNZMrwB69e21JElbzPC9VzX1JB4pr5/tr3grZpDwrj/YjhqCs18KZRH2GG
         u1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m9Iy8xTCC/lsqmeyypdzVoGtMOlOgKNaC8wzlU8V0Ak=;
        b=owOo0Ylcr/S/mnoDldL+Vex5ALg1QSOmBp8Wmhtb9ISUhDZqz3e8fV5ofrn8j+YN1b
         AYQOsx2R+j9ZuvpV4fMkqyLJrCqfU3O+lGANoMdRFBsUGgkdUn2Tm5Xsf/26kAvfKccX
         CWPb0nEJGAlLxPrWH7v+8RCA7gFyK2uuetmJgKrmGq/ZmPci6MlNk2c5a49Mjezm5AkW
         yugHEh9L/hMYnBAHFfMo9aNEtmr0KkmtCqd1plUC1mCwZtW9bJJ8Wgk4w8Tx9TX5+wRC
         Y5e2n56dJFfOPamG5m7uPRDSblqbHdqXw2Ga/L1rM7vLN9SGPKy0TtSq9hrI6vqYJBFe
         /yVA==
X-Gm-Message-State: AOAM530Cf9NV9eZVrxn+P6eXSpFbnBb9R4bx1JKhTbCdOOJm0c8zOpAW
        BilAfJ9vrXgaFR2p8RGXDCVMTqYlgQhXAA==
X-Google-Smtp-Source: ABdhPJxtDOjj0e1mP0NY8oxLhIt6qsoBW5DDUq2IVcRAKAsm/7RnzzUFwBc3Sk1qfl66he83RS8k5Q==
X-Received: by 2002:a9d:63c5:: with SMTP id e5mr9472otl.46.1598931687626;
        Mon, 31 Aug 2020 20:41:27 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id b79sm908112oii.33.2020.08.31.20.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 20:41:27 -0700 (PDT)
Date:   Mon, 31 Aug 2020 22:41:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/19] iommu/arm-smmu: Add support for split pagetables
Message-ID: <20200901034123.GL3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-4-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:40 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Enable TTBR1 for a context bank if IO_PGTABLE_QUIRK_ARM_TTBR1 is selected
> by the io-pgtable configuration.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 21 ++++++++++++++++-----
>  drivers/iommu/arm/arm-smmu/arm-smmu.h | 25 +++++++++++++++++++------
>  2 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 37d8d49299b4..976d43a7f2ff 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -552,11 +552,15 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
>  			cb->ttbr[0] = pgtbl_cfg->arm_v7s_cfg.ttbr;
>  			cb->ttbr[1] = 0;
>  		} else {
> -			cb->ttbr[0] = pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> -			cb->ttbr[0] |= FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -						  cfg->asid);
> +			cb->ttbr[0] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> +				cfg->asid);
>  			cb->ttbr[1] = FIELD_PREP(ARM_SMMU_TTBRn_ASID,
> -						 cfg->asid);
> +				cfg->asid);

The old indentation seems more appropriate.

Apart from that this looks sensible.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> +
> +			if (pgtbl_cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1)
> +				cb->ttbr[1] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
> +			else
> +				cb->ttbr[0] |= pgtbl_cfg->arm_lpae_s1_cfg.ttbr;
>  		}
>  	} else {
>  		cb->ttbr[0] = pgtbl_cfg->arm_lpae_s2_cfg.vttbr;
> @@ -822,7 +826,14 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
>  
>  	/* Update the domain's page sizes to reflect the page table format */
>  	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
> -	domain->geometry.aperture_end = (1UL << ias) - 1;
> +
> +	if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +		domain->geometry.aperture_start = ~0UL << ias;
> +		domain->geometry.aperture_end = ~0UL;
> +	} else {
> +		domain->geometry.aperture_end = (1UL << ias) - 1;
> +	}
> +
>  	domain->geometry.force_aperture = true;
>  
>  	/* Initialise the context bank with our page table cfg */
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index 83294516ac08..f3e456893f28 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -169,10 +169,12 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_TCR			0x30
>  #define ARM_SMMU_TCR_EAE		BIT(31)
>  #define ARM_SMMU_TCR_EPD1		BIT(23)
> +#define ARM_SMMU_TCR_A1			BIT(22)
>  #define ARM_SMMU_TCR_TG0		GENMASK(15, 14)
>  #define ARM_SMMU_TCR_SH0		GENMASK(13, 12)
>  #define ARM_SMMU_TCR_ORGN0		GENMASK(11, 10)
>  #define ARM_SMMU_TCR_IRGN0		GENMASK(9, 8)
> +#define ARM_SMMU_TCR_EPD0		BIT(7)
>  #define ARM_SMMU_TCR_T0SZ		GENMASK(5, 0)
>  
>  #define ARM_SMMU_VTCR_RES1		BIT(31)
> @@ -350,12 +352,23 @@ struct arm_smmu_domain {
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
> +	if (cfg->quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
> +		tcr = (tcr << 16) & ~ARM_SMMU_TCR_A1;
> +		tcr |= ARM_SMMU_TCR_EPD0;
> +	} else
> +		tcr |= ARM_SMMU_TCR_EPD1;
> +
> +	return tcr;
>  }
>  
>  static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
> -- 
> 2.26.2
> 
