Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5C631008C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 16:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfKRP5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 10:57:35 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:49764
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727334AbfKRP5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 10:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574092654;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=0uOLVzLMI7MHc8k6E5GevpIZG9gm0SmkADc/SJd5Z0U=;
        b=nzhklT8FJBBpz9mH5tKwRtUpH1XOKlOCBtyRMBv00av7yQeRn+rOJ/TZSd4JjXlT
        O7PDyrw20tAB+EsdXNP45lJPJHKPmvjdAiAucANqsvx0iKoV2Dgx7jXx0YnwqBc4ruE
        3E4w6ZCQW9sQZiDxkn6Ku9rmj9pRtW5nqVIRCJLA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574092654;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=0uOLVzLMI7MHc8k6E5GevpIZG9gm0SmkADc/SJd5Z0U=;
        b=dMEH59FehjHpOlh1Lqk7BxDNcQD0y4BBHDv2fxpTiTYed2NYqjFk9CblgN4fr8md
        UGn+UsgW0BnVQ78tpnngSMYSbh1GyU3+4hz3YL/zBn77YV+I52jVg7MHvguUY1E6OYT
        1Kexlqa5TKb8cIQv7RiY/PUh7Hc8igJ9g3HxG0uY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79463C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 18 Nov 2019 15:57:34 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 2/4] drm/msm/gpu: add support for ocmem
 interconnect path
Message-ID: <0101016e7f3bc614-0b50ca10-6ca3-459e-831c-af9e18acbacf-000000@us-west-2.amazonses.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20191117114825.13541-1-masneyb@onstation.org>
 <20191117114825.13541-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117114825.13541-3-masneyb@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.11.18-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Nov 17, 2019 at 06:48:23AM -0500, Brian Masney wrote:
> Some A3xx and all A4xx Adreno GPUs do not have GMEM inside the GPU core
> and must use the On Chip MEMory (OCMEM) in order to be functional.
> There's a separate interconnect path that needs to be setup to OCMEM.
> Add support for this second path to the GPU core.
> 
> In the downstream MSM 3.4 sources, the two interconnect paths for the
> GPU are between:
> 
>   - MSM_BUS_MASTER_GRAPHICS_3D and MSM_BUS_SLAVE_EBI_CH0
>   - MSM_BUS_MASTER_V_OCMEM_GFX3D and MSM_BUS_SLAVE_OCMEM
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  6 +++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 20 ++++++++++++++++----
>  drivers/gpu/drm/msm/msm_gpu.h           |  3 ++-
>  3 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 85f14feafdec..7885e382fb8f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -132,7 +132,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>  	 * Eventually we will want to scale the path vote with the frequency but
>  	 * for now leave it at max so that the performance is nominal.
>  	 */
> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +	icc_set_bw(gpu->gfx_mem_icc_path, 0, MBps_to_icc(7216));
>  }
>  
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
> @@ -714,7 +714,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	}
>  
>  	/* Set the bus quota to a reasonable value for boot */
> -	icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
> +	icc_set_bw(gpu->gfx_mem_icc_path, 0, MBps_to_icc(3072));
>  
>  	/* Enable the GMU interrupt */
>  	gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
> @@ -858,7 +858,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>  		a6xx_gmu_shutdown(gmu);
>  
>  	/* Remove the bus vote */
> -	icc_set_bw(gpu->icc_path, 0, 0);
> +	icc_set_bw(gpu->gfx_mem_icc_path, 0, 0);
>  
>  	/*
>  	 * Make sure the GX domain is off before turning off the GMU (CX)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0783e4b5486a..d1cc021c012c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -887,9 +887,20 @@ static int adreno_get_pwrlevels(struct device *dev,
>  	DBG("fast_rate=%u, slow_rate=27000000", gpu->fast_rate);
>  
>  	/* Check for an interconnect path for the bus */
> -	gpu->icc_path = of_icc_get(dev, NULL);
> -	if (IS_ERR(gpu->icc_path))
> -		gpu->icc_path = NULL;
> +	gpu->gfx_mem_icc_path = of_icc_get(dev, "gfx-mem");
> +	if (!gpu->gfx_mem_icc_path) {
> +		/*
> +		 * Keep compatbility with device trees that don't have an
> +		 * interconnect-names property.
> +		 */
> +		gpu->gfx_mem_icc_path = of_icc_get(dev, NULL);
> +	}
> +	if (IS_ERR(gpu->gfx_mem_icc_path))
> +		gpu->gfx_mem_icc_path = NULL;
> +
> +	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> +	if (IS_ERR(gpu->ocmem_icc_path))
> +		gpu->ocmem_icc_path = NULL;

This is the part where I am reminded that icc_set_bw doesn't check
IS_ERR_OR_NULL and even worse, icc_put warns on IS_ERR and it makes 
me grumble.

>  	return 0;
>  }
> @@ -976,7 +987,8 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
>  	for (i = 0; i < ARRAY_SIZE(adreno_gpu->info->fw); i++)
>  		release_firmware(adreno_gpu->fw[i]);
>  
> -	icc_put(gpu->icc_path);
> +	icc_put(gpu->gfx_mem_icc_path);
> +	icc_put(gpu->ocmem_icc_path);
>  
>  	msm_gpu_cleanup(&adreno_gpu->base);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c9dc8..e72e56f7b0ef 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -111,7 +111,8 @@ struct msm_gpu {
>  	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
>  	uint32_t fast_rate;
>  
> -	struct icc_path *icc_path;
> +	struct icc_path *gfx_mem_icc_path;
> +	struct icc_path *ocmem_icc_path;

I'm not sure if we want a bulk rename of the main path.  icc_path and
ocmem_icc_path seem to be reasonable names and not overly confusing especially
if we added some documentation to the header).


>  	/* Hang and Inactivity Detection:
>  	 */
> -- 
> 2.21.0
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
