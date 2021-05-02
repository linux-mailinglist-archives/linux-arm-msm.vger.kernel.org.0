Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBED2370ED3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 21:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhEBTr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 15:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbhEBTr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 15:47:57 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41EFEC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 12:47:04 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id v123so2487695ioe.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 12:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=LJl1rWi+H/YWnHh7uuzQa/Bps0BJvOfQAeiB4qm7bUE=;
        b=DwSDCQo3ZRKnYl3dEjBzvLVuy8s2Jdv9ranzBfHg0+tyyYLvONlP0r122FyurmPW4f
         caSD6pUJM1AIU2qhi2x2dF0+RO5jsVHA0FiF6JDljwvwBjyAbYjyHrirz0ymiwyvSvJD
         SMwOqzmvwN04RaO5atGz/xHmtVjygrMFaknqZD96mNF09kgNRJWYWMHEUrjE9IFEgUjr
         tn+68xsAM5El2dNIr6G8cDnT1oggiJCxRMe/BaofOZ2ZwPWpxJGnI2kpBIQxrnlf4lZy
         oM+3Ke873KeEJHOAzduc2Qor84mlAk+JzL5r1T1cBNmAjSbrdR7l8+Bzlv21vDrGogrr
         Undg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=LJl1rWi+H/YWnHh7uuzQa/Bps0BJvOfQAeiB4qm7bUE=;
        b=mshcTlxE1lWrkD3+JTUGgbKHhyXQTW1T74n17XrsOVW+zaBxshX9buxpyILqoOEBhv
         K69kUeLBxHS95qhMk5WrfdJ4EDbvF5A4l7+caZKrsU8tTR61Zl8PnheEoaWgypoZVhKD
         TWhVtSUllv70JAe7Wg3mQ4YRvKuV6FlKq7nc62YngnMFocKiz+jAlRjb3TGWiohB2Kwy
         8Hca4CyDOZumQHjs/UVaRoZy42jdowWeR5Oqoyy1aT+Rblz3u1G2cS2yT+ZQB8i4kSXs
         Lh0jiQ0WPFFpHkB9JOKAM/elpbDdztWZuQshbcwcQV20QknmJCnk7fN5/ugvT9G1cJPn
         y7Ug==
X-Gm-Message-State: AOAM530j+XADIoSXqTBIzrZbFIjYIpGrDhqItKcgpZDzBaAE3iHycdO3
        TxQEb3jMm/LsVR+PJgeu9LrmDw==
X-Google-Smtp-Source: ABdhPJyAsYK/AQSJOv+LyIbdJVqwImnVon/lyG+r3uT2Mp+gIzcnuBWh/WN9wNijHQ/crP1mVurLtw==
X-Received: by 2002:a02:a512:: with SMTP id e18mr8229261jam.130.1619984823577;
        Sun, 02 May 2021 12:47:03 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id g26sm4433791iom.14.2021.05.02.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 12:47:02 -0700 (PDT)
Date:   Sun, 2 May 2021 13:47:00 -0600
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm/msm: Periodically update RPTR shadow
Message-ID: <20210502194700.si5jysge2gftjdpw@cosmicpenguin.net>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210428193654.1498482-1-robdclark@gmail.com>
 <20210428193654.1498482-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428193654.1498482-3-robdclark@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 28, 2021 at 12:36:49PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> On a5xx and a6xx devices that are using CP_WHERE_AM_I to update a
> ringbuffer read-ptr shadow value, periodically emit a CP_WHERE_AM_I
> every 32 commands, so that a later submit waiting for ringbuffer
> space to become available sees partial progress, rather than not
> seeing rptr advance at all until the GPU gets to the end of the
> submit that it is currently chewing on.

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 29 ++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 27 +++++++++++++++++++------
>  2 files changed, 45 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 0c8faad3b328..5202f1498a48 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -18,6 +18,18 @@ static void a5xx_dump(struct msm_gpu *gpu);
>  
>  #define GPU_PAS_ID 13
>  
> +static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> +
> +	if (a5xx_gpu->has_whereami) {
> +		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
> +		OUT_RING(ring, lower_32_bits(shadowptr(a5xx_gpu, ring)));
> +		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
> +	}
> +}
> +
>  void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  		bool sync)
>  {
> @@ -30,11 +42,8 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  	 * Most flush operations need to issue a WHERE_AM_I opcode to sync up
>  	 * the rptr shadow
>  	 */
> -	if (a5xx_gpu->has_whereami && sync) {
> -		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
> -		OUT_RING(ring, lower_32_bits(shadowptr(a5xx_gpu, ring)));
> -		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
> -	}
> +	if (sync)
> +		update_shadow_rptr(gpu, ring);
>  
>  	if (unlikely(ring->overflow))
>  		return;
> @@ -171,6 +180,16 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  			ibs++;
>  			break;
>  		}
> +
> +		/*
> +		 * Periodically update shadow-wptr if needed, so that we
> +		 * can see partial progress of submits with large # of
> +		 * cmds.. otherwise we could needlessly stall waiting for
> +		 * ringbuffer state, simply due to looking at a shadow
> +		 * rptr value that has not been updated
> +		 */
> +		if ((ibs % 32) == 0)
> +			update_shadow_rptr(gpu, ring);
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4a4728a774c0..2986e36ffd8d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -52,21 +52,25 @@ static bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  	return true;
>  }
>  
> -static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +static void update_shadow_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -	uint32_t wptr;
> -	unsigned long flags;
>  
>  	/* Expanded APRIV doesn't need to issue the WHERE_AM_I opcode */
>  	if (a6xx_gpu->has_whereami && !adreno_gpu->base.hw_apriv) {
> -		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -
>  		OUT_PKT7(ring, CP_WHERE_AM_I, 2);
>  		OUT_RING(ring, lower_32_bits(shadowptr(a6xx_gpu, ring)));
>  		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
>  	}
> +}
> +
> +static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> +{
> +	uint32_t wptr;
> +	unsigned long flags;
> +
> +	update_shadow_rptr(gpu, ring);
>  
>  	if (unlikely(ring->overflow))
>  		return;
> @@ -148,7 +152,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = submit->ring;
> -	unsigned int i;
> +	unsigned int i, ibs = 0;
>  
>  	a6xx_set_pagetable(a6xx_gpu, ring, submit->queue->ctx);
>  
> @@ -184,8 +188,19 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  			OUT_RING(ring, lower_32_bits(submit->cmd[i].iova));
>  			OUT_RING(ring, upper_32_bits(submit->cmd[i].iova));
>  			OUT_RING(ring, submit->cmd[i].size);
> +			ibs++;
>  			break;
>  		}
> +
> +		/*
> +		 * Periodically update shadow-wptr if needed, so that we
> +		 * can see partial progress of submits with large # of
> +		 * cmds.. otherwise we could needlessly stall waiting for
> +		 * ringbuffer state, simply due to looking at a shadow
> +		 * rptr value that has not been updated
> +		 */
> +		if ((ibs % 32) == 0)
> +			update_shadow_rptr(gpu, ring);
>  	}
>  
>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP_0_LO,
> -- 
> 2.30.2
> 
