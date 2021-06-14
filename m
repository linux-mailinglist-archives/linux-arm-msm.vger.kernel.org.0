Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5741A3A6D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233975AbhFNRtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 13:49:24 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:40538 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233430AbhFNRtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 13:49:23 -0400
Received: by mail-oi1-f176.google.com with SMTP id d19so11153127oic.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 10:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rXKjNT2DEQ+IjQBlthoE18k+nd+0vhAfMPZEBbyfCC8=;
        b=RUAS26ksqnGrksv0ADjeHmswCRZGzsWMeghWKsPORY5CnhcxC6j651IJyHCpXlfxh8
         M0IKJ5SawnPUoJePIW1SEfim06ZK/jUnkCyOvAzwVGYHwEdax4GlGHotOfNo9Uz/dUxm
         4nfPk6g4aK7tJ5Ralc4+WT6yrBvYunYVdH1WsUm9BpLM6pZ70zdUiPGkXbcCK3lCYdXN
         QHGv+0HG8+nRGclzxvKuCS+uEbez+1/HPYddxOZ1/I5GDgQ6C904ZOs2qC0/GYbhEC80
         gN4R14z0R2Kk0cB5Cq9dlSycia18TnLomiwTXtPf9WlZ/UnqRPvATqv0LBMFiDQK+7e0
         Rfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rXKjNT2DEQ+IjQBlthoE18k+nd+0vhAfMPZEBbyfCC8=;
        b=izOAsnsRnLpA1V/N3qIreFo1J6nhzvOCnM2Eql7tOLXilpeEeBN133fIDVRiDdax2j
         iF3qpoyLH0nUpMCLyHwJa12dz7yFsq2jnWoG3mw33OCDsRtl2WoIrlHLDsssUQkwWZCG
         Q5zdlnj3O5h+cgjqAtvfKVknbMWAk+dCQNr8179nVMDU6EhCwYXTNtGqHuTRYW33OlxG
         FsclPv7Lxl13JodbUeqWWlp6Yjr6BtCS+8jNRCtmxYMa+/3hxUuJ2Z27IcM0S6DhPpcv
         AuHZoNRLXmy/qFQcNcL6Y1qbmksdQmO1P2xJ8xlKOlnXCq2l5vxB/SCSNpwLtTYK1a32
         5GTg==
X-Gm-Message-State: AOAM53312QdUckVdfILPm5+g0f3akRvqBmRNO4nAi2KEWJSMWS1xXVfD
        P3czQDY+CgaHyBVhakHhRVeMpg==
X-Google-Smtp-Source: ABdhPJzjix9ubs+vvMy13RtCwO8rWq1+FOxT0/leOq0IYpn/f3BoQpF2UMUWAQIXErl205viOPXo5Q==
X-Received: by 2002:aca:c441:: with SMTP id u62mr172892oif.31.1623692780015;
        Mon, 14 Jun 2021 10:46:20 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v203sm1578401oib.37.2021.06.14.10.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 10:46:19 -0700 (PDT)
Date:   Mon, 14 Jun 2021 12:46:17 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
Message-ID: <YMeV6XzSxQp/Tmr1@yoga>
References: <20210610214431.539029-1-robdclark@gmail.com>
 <20210610214431.539029-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610214431.539029-4-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Use the new adreno-smmu-priv fault info function to get more SMMU
> debug registers and print the current TTBR0 to debug per-instance
> pagetables and figure out which GPU block generated the request.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  4 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 76 +++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/msm_iommu.c       | 11 +++-
>  drivers/gpu/drm/msm/msm_mmu.h         |  4 +-
>  4 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index f46562c12022..eb030b00bff4 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1075,7 +1075,7 @@ bool a5xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return true;
>  }
>  
> -static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static int a5xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>  	struct msm_gpu *gpu = arg;
>  	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> @@ -1085,7 +1085,7 @@ static int a5xx_fault_handler(void *arg, unsigned long iova, int flags)
>  			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(6)),
>  			gpu_read(gpu, REG_A5XX_CP_SCRATCH_REG(7)));
>  
> -	return -EFAULT;
> +	return 0;
>  }
>  
>  static void a5xx_cp_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c7f0ddb12d8f..fc19db10bff1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1032,18 +1032,88 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  	msm_gpu_hw_init(gpu);
>  }
>  
> -static int a6xx_fault_handler(void *arg, unsigned long iova, int flags)
> +static const char *a6xx_uche_fault_block(struct msm_gpu *gpu, u32 mid)
> +{
> +	static const char *uche_clients[7] = {
> +		"VFD", "SP", "VSC", "VPC", "HLSQ", "PC", "LRZ",
> +	};
> +	u32 val;
> +
> +	if (mid < 1 || mid > 3)
> +		return "UNKNOWN";
> +
> +	/*
> +	 * The source of the data depends on the mid ID read from FSYNR1.
> +	 * and the client ID read from the UCHE block
> +	 */
> +	val = gpu_read(gpu, REG_A6XX_UCHE_CLIENT_PF);
> +
> +	/* mid = 3 is most precise and refers to only one block per client */
> +	if (mid == 3)
> +		return uche_clients[val & 7];
> +
> +	/* For mid=2 the source is TP or VFD except when the client id is 0 */
> +	if (mid == 2)
> +		return ((val & 7) == 0) ? "TP" : "TP|VFD";
> +
> +	/* For mid=1 just return "UCHE" as a catchall for everything else */
> +	return "UCHE";
> +}
> +
> +static const char *a6xx_fault_block(struct msm_gpu *gpu, u32 id)
> +{
> +	if (id == 0)
> +		return "CP";
> +	else if (id == 4)
> +		return "CCU";
> +	else if (id == 6)
> +		return "CDP Prefetch";
> +
> +	return a6xx_uche_fault_block(gpu, id);
> +}
> +
> +#define ARM_SMMU_FSR_TF                 BIT(1)
> +#define ARM_SMMU_FSR_PF			BIT(3)
> +#define ARM_SMMU_FSR_EF			BIT(4)
> +
> +static int a6xx_fault_handler(void *arg, unsigned long iova, int flags, void *data)
>  {
>  	struct msm_gpu *gpu = arg;
> +	struct adreno_smmu_fault_info *info = data;
> +	const char *type = "UNKNOWN";
>  
> -	pr_warn_ratelimited("*** gpu fault: iova=%08lx, flags=%d (%u,%u,%u,%u)\n",
> +	/*
> +	 * Print a default message if we couldn't get the data from the
> +	 * adreno-smmu-priv
> +	 */
> +	if (!info) {
> +		pr_warn_ratelimited("*** gpu fault: iova=%.16lx flags=%d (%u,%u,%u,%u)\n",
>  			iova, flags,
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
>  			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
>  
> -	return -EFAULT;
> +		return 0;
> +	}
> +
> +	if (info->fsr & ARM_SMMU_FSR_TF)
> +		type = "TRANSLATION";
> +	else if (info->fsr & ARM_SMMU_FSR_PF)
> +		type = "PERMISSION";
> +	else if (info->fsr & ARM_SMMU_FSR_EF)
> +		type = "EXTERNAL";
> +
> +	pr_warn_ratelimited("*** gpu fault: ttbr0=%.16llx iova=%.16lx dir=%s type=%s source=%s (%u,%u,%u,%u)\n",
> +			info->ttbr0, iova,
> +			flags & IOMMU_FAULT_WRITE ? "WRITE" : "READ", type,
> +			a6xx_fault_block(gpu, info->fsynr1 & 0xff),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(4)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(5)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(6)),
> +			gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(7)));
> +
> +	return 0;
>  }
>  
>  static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 50d881794758..6975b95c3c29 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
>  		unsigned long iova, int flags, void *arg)
>  {
>  	struct msm_iommu *iommu = arg;
> +	struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> +	struct adreno_smmu_fault_info info, *ptr = NULL;
> +
> +	if (adreno_smmu->get_fault_info) {
> +		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
> +		ptr = &info;
> +	}
> +
>  	if (iommu->base.handler)
> -		return iommu->base.handler(iommu->base.arg, iova, flags);
> +		return iommu->base.handler(iommu->base.arg, iova, flags, ptr);
> +
>  	pr_warn_ratelimited("*** fault: iova=%16lx, flags=%d\n", iova, flags);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
> index 61ade89d9e48..a88f44c3268d 100644
> --- a/drivers/gpu/drm/msm/msm_mmu.h
> +++ b/drivers/gpu/drm/msm/msm_mmu.h
> @@ -26,7 +26,7 @@ enum msm_mmu_type {
>  struct msm_mmu {
>  	const struct msm_mmu_funcs *funcs;
>  	struct device *dev;
> -	int (*handler)(void *arg, unsigned long iova, int flags);
> +	int (*handler)(void *arg, unsigned long iova, int flags, void *data);
>  	void *arg;
>  	enum msm_mmu_type type;
>  };
> @@ -43,7 +43,7 @@ struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
>  struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
>  
>  static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
> -		int (*handler)(void *arg, unsigned long iova, int flags))
> +		int (*handler)(void *arg, unsigned long iova, int flags, void *data))
>  {
>  	mmu->arg = arg;
>  	mmu->handler = handler;
> -- 
> 2.31.1
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
