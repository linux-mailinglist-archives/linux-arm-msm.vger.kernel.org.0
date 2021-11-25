Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60E045D5A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 08:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240263AbhKYHl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 02:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235848AbhKYHj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 02:39:56 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47FAC061748
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 23:36:45 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id c32so14053744lfv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 23:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hiObrTf9v1RU1iPUzjRKa2X5bHrBY+vq37yRCw4SQfg=;
        b=xJM97+HaGHEuZbldHf8LtFpYrwkTEqoHiVBbrK47linMt8oiBxA8Q+Qa5bKTWGnw93
         XcyV+jt1YOZvvDZXyeMRa+bf2+Dki0Pbl9WPvD+R6yNOehkWitsG0HRqjOar7eJpts93
         wjZotE0QJy04G+Sw5MwR9bF4X8ATSBtxX1D5BQQ0Nb3Bm6GDwDB27FOcdQbtEkSOcwzr
         rgwqHrTUJ1LRpzqdIaI8hcMh+kHvgJBw1OYlAxCZvznaoB1mgrKGl6uskjA/ModEUbou
         Z9zB2NPuKCSWxZAMrLWPQE5wsgU7xuANt7DdKVwhxG2QPerbDL3LrTP4yTGPfLQ430Qh
         wDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hiObrTf9v1RU1iPUzjRKa2X5bHrBY+vq37yRCw4SQfg=;
        b=x4viRYIDDfiw8+1+HpEuf/dnquPl3CMEgKoYPQzDwi/G2jn763c1+3tRDnQwnADTpU
         66qDN5teXqc8y7c9PhKZsGuZJXbWFHcEB9sAskxtR04zvHqfYfx7bJSAZaEDgp6GocjA
         BOjevS4aAFfZR1Tg7zJjZvC4NnaFJ53H4c8vJeK2OGX36vqHcjNDeO6V2Ie4agXDI3Nv
         GgiDhF0NuT1yG693YvT90hnRtSgPIA9aZLZ5i2DkquDPbYvf1N82MqX91ip6tGT3Cs0n
         JOOzHhzXLzsdHFBbW78NKtG3CUkAkAbZAY809Ins18RkMvuNg8Sp3cH+6MU1t61WtDqH
         lM5g==
X-Gm-Message-State: AOAM531jnkHRvM13kKq6UzD3eKq/0eVIbruJPi33BYFZ/itasMp5B0qD
        61LQKLVBadBJU51ZLt5EKakCCwEGPFSdsg==
X-Google-Smtp-Source: ABdhPJwqZErZYiffJ6x0dq1P6hgBrtHAkjYogcBg0mpyDkFuQEt7j0rZdxzcrn+0CDA9aTRgaTJlLw==
X-Received: by 2002:ac2:5a0a:: with SMTP id q10mr22360431lfn.610.1637825803819;
        Wed, 24 Nov 2021 23:36:43 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j15sm195193lfg.167.2021.11.24.23.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 23:36:43 -0800 (PST)
Subject: Re: [PATCH 1/2] drm/msm: Handle ringbuffer overflow
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dave Airlie <airlied@redhat.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210428193654.1498482-1-robdclark@gmail.com>
 <20210428193654.1498482-2-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e6f04ed5-100d-6ef9-c272-1a1370e45579@linaro.org>
Date:   Thu, 25 Nov 2021 10:36:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210428193654.1498482-2-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/04/2021 22:36, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Currently if userspace manages to fill up the ring faster than the GPU
> can consume we (a) spin for up to 1sec, and then (b) overwrite the
> ringbuffer contents from previous submits that the GPU is still busy
> executing.  Which predictably goes rather badly.
> 
> Instead, just skip flushing (updating WPTR) and reset ring->next back to
> where it was before we tried writing the submit into the ringbuffer, and
> return an error to userspace (which can then try again).
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Rob, you've posted this patch, but never merged it. Should it be merged 
at some point?

> ---
>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  3 +++
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  3 +++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++-
>   drivers/gpu/drm/msm/msm_gem_submit.c    |  7 +++++-
>   drivers/gpu/drm/msm/msm_gpu.c           | 33 +++++++++++++++++++++++--
>   drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.h    |  5 ++++
>   7 files changed, 72 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index ce13d49e615b..0c8faad3b328 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -36,6 +36,9 @@ void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>   		OUT_RING(ring, upper_32_bits(shadowptr(a5xx_gpu, ring)));
>   	}
>   
> +	if (unlikely(ring->overflow))
> +		return;
> +
>   	spin_lock_irqsave(&ring->preempt_lock, flags);
>   
>   	/* Copy the shadow to the actual register */
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index d553f62f4eeb..4a4728a774c0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -68,6 +68,9 @@ static void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>   		OUT_RING(ring, upper_32_bits(shadowptr(a6xx_gpu, ring)));
>   	}
>   
> +	if (unlikely(ring->overflow))
> +		return;
> +
>   	spin_lock_irqsave(&ring->preempt_lock, flags);
>   
>   	/* Copy the shadow to the actual register */
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 0f184c3dd9d9..a658777e07b1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -467,6 +467,9 @@ void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring, u32 reg)
>   {
>   	uint32_t wptr;
>   
> +	if (unlikely(ring->overflow))
> +		return;
> +
>   	/* Copy the shadow to the actual register */
>   	ring->cur = ring->next;
>   
> @@ -788,12 +791,31 @@ static uint32_t ring_freewords(struct msm_ringbuffer *ring)
>   	return (rptr + (size - 1) - wptr) % size;
>   }
>   
> +static bool space_avail(struct msm_ringbuffer *ring, uint32_t ndwords)
> +{
> +	if (ring_freewords(ring) >= ndwords)
> +		return true;
> +
> +	/* We don't have a good way to know in general when the RPTR has
> +	 * advanced.. newer things that use CP_WHERE_AM_I to update the
> +	 * shadow rptr could possibly insert a packet to generate an irq.
> +	 * But that doesn't cover older GPUs.  But if the ringbuffer is
> +	 * full, it could take a while before it is empty again, so just
> +	 * insert a blind sleep to avoid a busy loop.
> +	 */
> +	msleep(1);
> +
> +	return false;
> +}
> +
>   void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
>   {
> -	if (spin_until(ring_freewords(ring) >= ndwords))
> +	if (spin_until(space_avail(ring, ndwords))) {
>   		DRM_DEV_ERROR(ring->gpu->dev->dev,
>   			"timeout waiting for space in ringbuffer %d\n",
>   			ring->id);
> +		ring->overflow = true;
> +	}
>   }
>   
>   /* Get legacy powerlevels from qcom,gpu-pwrlevels and populate the opp table */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5480852bdeda..4bc669460fda 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -683,6 +683,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   	submitid = atomic_inc_return(&ident) - 1;
>   
>   	ring = gpu->rb[queue->prio];
> +
> +	GEM_WARN_ON(ring->overflow);
> +
>   	trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
>   		args->nr_bos, args->nr_cmds);
>   
> @@ -829,7 +832,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   		}
>   	}
>   
> -	msm_gpu_submit(gpu, submit);
> +	ret = msm_gpu_submit(gpu, submit);
> +	if (ret)
> +		goto out;
>   
>   	args->fence = submit->fence->seqno;
>   
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index ab7c167b0623..7655ad9108c8 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -787,7 +787,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
>   }
>   
>   /* add bo's to gpu's ring, and kick gpu: */
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> +int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   {
>   	struct drm_device *dev = gpu->dev;
>   	struct msm_drm_private *priv = dev->dev_private;
> @@ -834,9 +834,38 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>   	spin_unlock(&ring->submit_lock);
>   
>   	gpu->funcs->submit(gpu, submit);
> -	priv->lastctx = submit->queue->ctx;
>   
>   	hangcheck_timer_reset(gpu);
> +
> +	if (unlikely(ring->overflow)) {
> +		/*
> +		 * Reset the ptr back to before the submit, so the GPU
> +		 * doesn't see a partial submit:
> +		 */
> +		ring->next = ring->cur;
> +
> +		/*
> +		 * Clear the overflow flag, hopefully the next submit on
> +		 * the ring actually fits
> +		 */
> +		ring->overflow = false;
> +
> +		/*
> +		 * One might be tempted to remove the submit from the
> +		 * submits list, and drop it's reference (and drop the
> +		 * active reference for all the bos).  But we can't
> +		 * really signal the fence attached to obj->resv without
> +		 * disturbing other fences on the timeline.  So instead
> +		 * just leave it and let it retire normally when a
> +		 * later submit completes.
> +		 */
> +
> +		return -ENOSPC;
> +	}
> +
> +	priv->lastctx = submit->queue->ctx;
> +
> +	return 0;
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d7cd02cd2109..2dd2ef1f8328 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -302,7 +302,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
>   		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
>   
>   void msm_gpu_retire(struct msm_gpu *gpu);
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
> +int msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>   
>   int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>   		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index fe55d4a1aa16..d8ad9818c389 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -40,6 +40,8 @@ struct msm_ringbuffer {
>   	struct drm_gem_object *bo;
>   	uint32_t *start, *end, *cur, *next;
>   
> +	bool overflow;
> +
>   	/*
>   	 * List of in-flight submits on this ring.  Protected by submit_lock.
>   	 */
> @@ -69,6 +71,9 @@ void msm_ringbuffer_destroy(struct msm_ringbuffer *ring);
>   static inline void
>   OUT_RING(struct msm_ringbuffer *ring, uint32_t data)
>   {
> +	if (ring->overflow)
> +		return;
> +
>   	/*
>   	 * ring->next points to the current command being written - it won't be
>   	 * committed as ring->cur until the flush
> 


-- 
With best wishes
Dmitry
