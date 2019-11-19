Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9E14100FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 01:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfKSAEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 19:04:45 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:45786
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726809AbfKSAEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 19:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574121883;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
        bh=OlbgppkuQo/Y6oDZ30f1NHoNLeu2B2S5yJCvYaZxH5Q=;
        b=OMBtJutSJiYIJAqMax/vXP1EFpvpiwZSbr3e18U+odRGZqZKuNuKx0z+dt6+paQ/
        qtcLbV+TTeLI505kd9h0dX+Gfc8BFGAmc5rADllI+ssl+aUBOBBdNaMPk6KOk/fiSbs
        8efg8rutwvlsUg9FqJtWYyz7FvhIawX+fAjLEC4k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574121883;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
        bh=OlbgppkuQo/Y6oDZ30f1NHoNLeu2B2S5yJCvYaZxH5Q=;
        b=d2U1XrFewAIOHFPiORdZsrW4oawqMz2xbTVhm2f9JVZVyjqNdg1ezqFd1uIgYsTy
        D4sf4wm9ZPQFb7qfZSHSR00NA9CB3HfCwTC16vNKdlvVpbEgnzHSLGp1A0hQBBR++mJ
        csX/1JXZ8feVN+9pbPAah3v6H5ANPMOoEgxdYP4A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5295AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 19 Nov 2019 00:04:43 +0000
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/a6xx: restore previous freq on resume
Message-ID: <0101016e80f9c77a-4b58f055-0911-4d98-887d-0f1df32cdbc8-000000@us-west-2.amazonses.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191118234043.331542-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191118234043.331542-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2019.11.19-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 18, 2019 at 03:40:38PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Previously, if the freq were overriden (ie. via sysfs), it would get
> reset to max on resume.

Devfreq goes to sleep assuming that the hardware will still be at the same
frequency when it wakes up but the GMU sneaks out in the middle of the night
and takes the hardware for a joyride.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 3 +++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2ca470eb5cb8..b64867701e5a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -149,6 +149,8 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
>  		if (freq == gmu->gpu_freqs[perf_index])
>  			break;
>  
> +	gmu->current_perf_index = perf_index;
> +
>  	__a6xx_gmu_set_freq(gmu, perf_index);
>  }
>  
> @@ -741,8 +743,8 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  	gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_MASK, ~A6XX_HFI_IRQ_MASK);
>  	enable_irq(gmu->hfi_irq);
>  
> -	/* Set the GPU to the highest power frequency */
> -	__a6xx_gmu_set_freq(gmu, gmu->nr_gpu_freqs - 1);
> +	/* Set the GPU to the current freq */
> +	__a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
>  
>  	/*
>  	 * "enable" the GX power domain which won't actually do anything but it
> @@ -1166,6 +1168,8 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>  	gmu->nr_gpu_freqs = a6xx_gmu_build_freq_table(&gpu->pdev->dev,
>  		gmu->gpu_freqs, ARRAY_SIZE(gmu->gpu_freqs));
>  
> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
> +
>  	/* Build the list of RPMh votes that we'll send to the GMU */
>  	return a6xx_gmu_rpmh_votes_init(gmu);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 39a26dd63674..2af91ed7ed0c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -63,6 +63,9 @@ struct a6xx_gmu {
>  	struct clk_bulk_data *clocks;
>  	struct clk *core_clk;
>  
> +	/* current performance index set externally */
> +	int current_perf_index;
> +
>  	int nr_gpu_freqs;
>  	unsigned long gpu_freqs[16];
>  	u32 gx_arc_votes[16];
> -- 
> 2.23.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
