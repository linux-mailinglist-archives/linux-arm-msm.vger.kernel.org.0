Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615EC3A6DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 19:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbhFNR5D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 13:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233199AbhFNR5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 13:57:02 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B18C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 10:54:59 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id k21-20020a4a2a150000b029024955603642so2849279oof.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 10:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RZlshWzShRr/1bxvI5qOhZ1dQlVIKovO57VSbDQdZFU=;
        b=Mg3/SfBqtNf7mgH1NsaYekPfohhc46bBdfe4bze5h9yw87oo0g6Tubo8ceS0mU4lbS
         YrOJFVzXaEREnDk6QfLMegA5sA6jXbkra30Y973xYjAvkOLGCa3A3XLBTjbArGSWzcRu
         ZLZHp7MrBMIAw/rtyRje/sdFpR7oFAH9f4PXGR+eNGrUt1rwBipxF+U8qVJy01+Z2ctI
         35RAPRCWroEBmT6zTirlKX3h/6nh5vLfRKkt3FYFZ4W7bnVbJ8wK2sfwV4nH4s9AZN4J
         MUSi42oyIsBS+fWSQTZ13sb55pNj3zjUfChF3o6gwZDXfPr4at+lupCH2JUBCkpb5G3/
         r+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RZlshWzShRr/1bxvI5qOhZ1dQlVIKovO57VSbDQdZFU=;
        b=VtzCjKP4pOZoMVVQIe7Zr49w1JV17gCYg+1Gt4gL/HiYjkbUSiU9Iq5cNbYcId3t5h
         ZKf+drL21E4w2VaBlydnRaVrcFEStO4gcUsRUWjdA8XsKIgRu8WX9LIMlT6b7qYJUSM3
         kcNIkBqTXZQUaZ2FjekYffuHk5+lMvK8cKT3/Z8AJrCnLwr4IwdrtlpOjTXEhQopITYR
         2lK+3GUZygaqoBDx3x0Cz9/0sBXY6Z0zeEGX4lQw+74XPRf5bVPqoxJDDuHfZe8opOwS
         MmI+D4Xf5FZuhx1fQRSe+2PusWiEwBdK91aM0L2/KBe+N9DQdjNarT4bXVCf/0cpQhd7
         MW6g==
X-Gm-Message-State: AOAM531RfptPb/kAxKYH+3lVTIeEexsvhJ12OjCrnqMSKzPhzSJNNOJn
        8Vk4eEvrCYHtzrCcifa4fegH7w==
X-Google-Smtp-Source: ABdhPJz1bHjlWmc11NEr6kmjCyfD8umeBOwZX3ymRU4S8kgueYx+/o5al/nmOVkubv+jft5vHI4vzQ==
X-Received: by 2002:a05:6820:29b:: with SMTP id q27mr14003988ood.32.1623693299312;
        Mon, 14 Jun 2021 10:54:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 2sm3400587ota.58.2021.06.14.10.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 10:54:58 -0700 (PDT)
Date:   Mon, 14 Jun 2021 12:54:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 4/5] iommu/arm-smmu-qcom: Add stall support
Message-ID: <YMeX8NnVw80b9Qpe@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-5-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Rob Clark <robdclark@chromium.org>
> 
> Add, via the adreno-smmu-priv interface, a way for the GPU to request
> the SMMU to stall translation on faults, and then later resume the
> translation, either retrying or terminating the current translation.
> 
> This will be used on the GPU side to "freeze" the GPU while we snapshot
> useful state for devcoredump.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  include/linux/adreno-smmu-priv.h           |  7 +++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index b2e31ea84128..61fc645c1325 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -13,6 +13,7 @@ struct qcom_smmu {
>  	struct arm_smmu_device smmu;
>  	bool bypass_quirk;
>  	u8 bypass_cbndx;
> +	u32 stall_enabled;
>  };
>  
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> @@ -23,12 +24,17 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  static void qcom_adreno_smmu_write_sctlr(struct arm_smmu_device *smmu, int idx,
>  		u32 reg)
>  {
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
> +
>  	/*
>  	 * On the GPU device we want to process subsequent transactions after a
>  	 * fault to keep the GPU from hanging
>  	 */
>  	reg |= ARM_SMMU_SCTLR_HUPCF;
>  
> +	if (qsmmu->stall_enabled & BIT(idx))
> +		reg |= ARM_SMMU_SCTLR_CFCFG;
> +
>  	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
>  }
>  
> @@ -48,6 +54,31 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
>  	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
>  }
>  
> +static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu_domain->smmu);
> +
> +	if (enabled)
> +		qsmmu->stall_enabled |= BIT(cfg->cbndx);
> +	else
> +		qsmmu->stall_enabled &= ~BIT(cfg->cbndx);
> +}
> +
> +static void qcom_adreno_smmu_resume_translation(const void *cookie, bool terminate)
> +{
> +	struct arm_smmu_domain *smmu_domain = (void *)cookie;
> +	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +	u32 reg = 0;
> +
> +	if (terminate)
> +		reg |= ARM_SMMU_RESUME_TERMINATE;
> +
> +	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
> +}
> +
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>  
>  static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
> @@ -173,6 +204,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
>  	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
>  	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
>  	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
> +	priv->set_stall = qcom_adreno_smmu_set_stall;
> +	priv->resume_translation = qcom_adreno_smmu_resume_translation;
>  
>  	return 0;
>  }
> diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
> index 53fe32fb9214..c637e0997f6d 100644
> --- a/include/linux/adreno-smmu-priv.h
> +++ b/include/linux/adreno-smmu-priv.h
> @@ -45,6 +45,11 @@ struct adreno_smmu_fault_info {
>   *                 TTBR0 translation is enabled with the specified cfg
>   * @get_fault_info: Called by the GPU fault handler to get information about
>   *                  the fault
> + * @set_stall:     Configure whether stall on fault (CFCFG) is enabled.  Call
> + *                 before set_ttbr0_cfg().  If stalling on fault is enabled,
> + *                 the GPU driver must call resume_translation()
> + * @resume_translation: Resume translation after a fault
> + *
>   *
>   * The GPU driver (drm/msm) and adreno-smmu work together for controlling
>   * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
> @@ -60,6 +65,8 @@ struct adreno_smmu_priv {
>      const struct io_pgtable_cfg *(*get_ttbr1_cfg)(const void *cookie);
>      int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
>      void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
> +    void (*set_stall)(const void *cookie, bool enabled);
> +    void (*resume_translation)(const void *cookie, bool terminate);
>  };
>  
>  #endif /* __ADRENO_SMMU_PRIV_H */
> -- 
> 2.31.1
> 
