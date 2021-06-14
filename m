Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFA93A6D3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 19:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233510AbhFNRdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 13:33:17 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:36619 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235509AbhFNRdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 13:33:16 -0400
Received: by mail-oi1-f182.google.com with SMTP id r16so14736492oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xLux/4m5ofoODBdUbT7Ehl5QrekB6WictYiNsn1mOWI=;
        b=BmXLqT56g32BvBM3bzR5kCvabeozm5NrpVSpsIpgvkOTPWRPJlxZ/z/D73OSBK/6W5
         6A5m0lZLGJQrk0wbOzn8azG01wcz2L7fv3KIn5f+5da/PfQrL2Jj+557OyLbNa9Lqrer
         8KztQ1xFxpDOcaY4LfrVezdrtI0n1Y6Elzgs5dh8Hl1F/TueJNJO4giGIFov47dp7kTZ
         AGxDoJ2L3ig2rYKdAyR0GGF3tq0K5rTrQW3NZH8wS/6twS9QR0yZeHE5iOjmi1EOxiwm
         upaQMi/vLbzIB1+4Elozh2AyCxcKDl1DyEq3zToBpNm8On3qgzOIKhkII3HppjMv2rnf
         /qAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xLux/4m5ofoODBdUbT7Ehl5QrekB6WictYiNsn1mOWI=;
        b=jIlH1mvHOJHVOPEzXXz34wX3dHVDEaMd6U6xXCPJWXhY9o3eX5S55U/mtyYdQxjxlL
         O57Z8CZtmS7TVOwzhHLckpczbQNe+9RGCI82D6/94z1JesVrTzYE7pTgYhFC41w4UkUw
         VX1KAuQrNBb13SXvhKeAORK74E6z2Ay6WKHDXu+GWbCWpRu7ofa2NfbMtX3baDmrKh4a
         9TKYDC1XM3uWTBYMYpY2DOxSiIFpGJSKwyPNvSRxJOoEb3niZ2xnjJcvM+MBRv6dvjYU
         mpHtdxO+w/EaTi4UZ7jJcIdxD5FOS6x3KuOG9tYV5KdP56ltrb4Sl7az2cYxmBxeuaTf
         ak+Q==
X-Gm-Message-State: AOAM530NAVYXxOAObcAHmcyuqLrVXrdW+5GFYnT3H8Vln9acZnPK/uNK
        56WKkM3rMJAmJlt7Mme7K2KmcQ==
X-Google-Smtp-Source: ABdhPJw8j+3e3AKEgROrlKNjzXSDsCtRrFzgE31HIB9XuZeQfTHZGaNm//El0eGHEbYeJRKmO7lkjg==
X-Received: by 2002:aca:ac47:: with SMTP id v68mr11196061oie.160.1623691813324;
        Mon, 14 Jun 2021 10:30:13 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f7sm3169502oot.36.2021.06.14.10.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 10:30:12 -0700 (PDT)
Date:   Mon, 14 Jun 2021 12:30:10 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/5] iommu/arm-smmu-qcom: Add an adreno-smmu-priv
 callback to get pagefault info
Message-ID: <YMeSIv1bkZEverhO@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-3-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Add a callback in adreno-smmu-priv to read interesting SMMU
> registers to provide an opportunity for a richer debug experience
> in the GPU driver.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

I presume this implies that more generic options has been discussed.
Regardless, if further conclusions are made in that regard I expect that
this could serve as a base for such efforts.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 17 ++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
>  include/linux/adreno-smmu-priv.h           | 31 +++++++++++++++++++++-
>  3 files changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 98b3a1c2a181..b2e31ea84128 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -32,6 +32,22 @@ static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>  
> +static void qcom_adreno_smmu_get_fault_info(const void *cookie,
> +		struct adreno_smmu_fault_info *info)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
> +	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
> +	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
> +	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
> +	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
> +	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
> +	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>  
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -156,6 +172,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->cookie = smmu_domain;
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
> +	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
>  
>  	return 0;
>  }
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index c31a59d35c64..84c21c4b0691 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -224,6 +224,8 @@ enum arm_smmu_cbar_type {
>  #define ARM_SMMU_CB_FSYNR0		0x68
>  #define ARM_SMMU_FSYNR0_WNR		BIT(4)
>  
> +#define ARM_SMMU_CB_FSYNR1		0x6c
> +
>  #define ARM_SMMU_CB_S1_TLBIVA		0x600
>  #define ARM_SMMU_CB_S1_TLBIASID		0x610
>  #define ARM_SMMU_CB_S1_TLBIVAL		0x620
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index a889f28afb42..53fe32fb9214 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -8,6 +8,32 @@
>  
>  #include <linux/io-pgtable.h>
>  
> +/**
> + * struct adreno_smmu_fault_info - container for key fault information
> + *
> + * @far: The faulting IOVA from ARM_SMMU_CB_FAR
> + * @ttbr0: The current TTBR0 pagetable from ARM_SMMU_CB_TTBR0
> + * @contextidr: The value of ARM_SMMU_CB_CONTEXTIDR
> + * @fsr: The fault status from ARM_SMMU_CB_FSR
> + * @fsynr0: The value of FSYNR0 from ARM_SMMU_CB_FSYNR0
> + * @fsynr1: The value of FSYNR1 from ARM_SMMU_CB_FSYNR0
> + * @cbfrsynra: The value of CBFRSYNRA from ARM_SMMU_GR1_CBFRSYNRA(idx)
> + *
> + * This struct passes back key page fault information to the GPU driver
> + * through the get_fault_info function pointer.
> + * The GPU driver can use this information to print informative
> + * log messages and provide deeper GPU specific insight into the fault.
> + */
> +struct adreno_smmu_fault_info {
> +	u64 far;
> +	u64 ttbr0;
> +	u32 contextidr;
> +	u32 fsr;
> +	u32 fsynr0;
> +	u32 fsynr1;
> +	u32 cbfrsynra;
> +};
> +
>  /**
>   * struct adreno_smmu_priv - private interface between adreno-smmu and GPU
>   *
> @@ -17,6 +43,8 @@
>   * @set_ttbr0_cfg: Set the TTBR0 config for the GPUs context bank.  A
>   *                 NULL config disables TTBR0 translation, otherwise
>   *                 TTBR0 translation is enabled with the specified cfg
> + * @get_fault_info: Called by the GPU fault handler to get information about
> + *                  the fault
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -31,6 +59,7 @@ struct adreno_smmu_priv {
>      const void *cookie;
>      const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
>      int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
> +    void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
>  };
>  
> -#endif /* __ADRENO_SMMU_PRIV_H */
> \ No newline at end of file
> +#endif /* __ADRENO_SMMU_PRIV_H */
> -- 
> 2.31.1
> 
