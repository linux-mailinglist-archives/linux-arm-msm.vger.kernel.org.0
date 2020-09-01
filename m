Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01D625873F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 07:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgIAFGX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 01:06:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIAFGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 01:06:23 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF58CC0612A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:06:22 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id t7so117186otp.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hkyu3+s8OJYVpnZgzZ0Y1cK429wCgNzMKr8LFCmxp9M=;
        b=QjxXvDNqDwKmV0ZtOf/s/s6AjBa/dOLL2I+Dnni38TSvCP9q6LwhOMXBCtIa5FTxf1
         9twbPAButQmRS8Se6ZyC13QUB6AjmMxoVftuh2MMZc0aZ6dMFoGT5Ym1tNnxVJH9S1kO
         7SHrb8ICi7Ds9xNTYScxdgcPl6GVh5Pc30cT41QCULz7mp2VX0Fh7S3uXiIIB7ZIH3fW
         xY3FKcBstLhvkuYWui1PXYemxJDVLPuAPRmBssdkJqKveYp6R1Zwx8FRlicv/psP+F+P
         IPpxSR2MpHb3pVdQHW5byoI8O5lLCxUwcpnAxV9QnF+bgbexxum1RjWr3kJoEzUy6OHY
         LX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hkyu3+s8OJYVpnZgzZ0Y1cK429wCgNzMKr8LFCmxp9M=;
        b=avsnahYfE6PrAPPkJ/aQ8hGMuU7wiSoqGmUZ349cK1ZSvHE5ruZAT4G8pHeugtTgdd
         QOtBxKGbnT2LRQ9lUA6rduE636GiJOAEkOceLnTvfCLdECWUjwV3eRGCm5hs4KS8AbEb
         y4TmX2ZoDszHhavNU57g/B1pP87+7Qzly/WA7IJk0RIWcOrBnri7QwbSIJHvKiXO4q/v
         Xhb1K5CD4e1UN2NsMljzRFqQn5C3A6m/BRbKvZP3A3edHpuNAeQwUoHNVqmUuoYg6dFD
         5tIM3artbkDLXDxZskEGGKjwkVk8rY0qtEVBNODy9iK5vvQ0Uuxc89oSg+j+LIs5GWoL
         g0hw==
X-Gm-Message-State: AOAM532vi+gcvHWWoRxkJlT7TkewZKsSvLsod/gi4xZN1J3UGLe0T8iN
        GiZ+z/9/H3WkeZdC/fXASUtsaQ==
X-Google-Smtp-Source: ABdhPJzR/XXKXJ0D6YzJ3MfZrKYHe2w5oQ1+x1E6wHKnKrGyQ18aPiFJSdNoINPUaZZrb75wvyVaZA==
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr147606otr.147.1598936782091;
        Mon, 31 Aug 2020 22:06:22 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id i23sm35706oos.17.2020.08.31.22.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 22:06:21 -0700 (PDT)
Date:   Tue, 1 Sep 2020 00:06:18 -0500
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
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Emil Velikov <emil.velikov@collabora.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 12/19] drm/msm: Drop context arg to gpu->submit()
Message-ID: <20200901050618.GT3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-13-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-13-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Now that we can get the ctx from the submitqueue, the extra arg is
> redundant.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> [split out of previous patch to reduce churny noise]
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  6 ++----
>  7 files changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 9e63a190642c..eff2439ea57b 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -43,8 +43,7 @@ static void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>  		gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
>  }
>  
> -static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -	struct msm_file_private *ctx)
> +static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
>  	struct msm_ringbuffer *ring = submit->ring;
> @@ -57,7 +56,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>  		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>  			break;
>  		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == ctx)
> +			if (priv->lastctx == submit->queue->ctx)
>  				break;
>  			/* fall-thru */
>  		case MSM_SUBMIT_CMD_BUF:
> @@ -103,8 +102,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>  	msm_gpu_retire(gpu);
>  }
>  
> -static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -	struct msm_file_private *ctx)
> +static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> @@ -114,7 +112,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  
>  	if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
>  		priv->lastctx = NULL;
> -		a5xx_submit_in_rb(gpu, submit, ctx);
> +		a5xx_submit_in_rb(gpu, submit);
>  		return;
>  	}
>  
> @@ -148,7 +146,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>  			break;
>  		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == ctx)
> +			if (priv->lastctx == submit->queue->ctx)
>  				break;
>  			/* fall-thru */
>  		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c5a3e4d4c007..5eabb0109577 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -81,8 +81,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>  	OUT_RING(ring, upper_32_bits(iova));
>  }
>  
> -static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -	struct msm_file_private *ctx)
> +static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -115,7 +114,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>  			break;
>  		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -			if (priv->lastctx == ctx)
> +			if (priv->lastctx == submit->queue->ctx)
>  				break;
>  			/* fall-thru */
>  		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index d2dbb6968cba..533a34b4cce2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -457,8 +457,7 @@ void adreno_recover(struct msm_gpu *gpu)
>  	}
>  }
>  
> -void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -		struct msm_file_private *ctx)
> +void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -472,7 +471,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  			break;
>  		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>  			/* ignore if there has not been a ctx switch: */
> -			if (priv->lastctx == ctx)
> +			if (priv->lastctx == submit->queue->ctx)
>  				break;
>  			/* fall-thru */
>  		case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index e55abae365b5..848632758450 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -269,8 +269,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>  		const struct firmware *fw, u64 *iova);
>  int adreno_hw_init(struct msm_gpu *gpu);
>  void adreno_recover(struct msm_gpu *gpu);
> -void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -		struct msm_file_private *ctx);
> +void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>  void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 1464b04d25d3..aa5c60a7132d 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -785,7 +785,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	msm_gpu_submit(gpu, submit, ctx);
> +	msm_gpu_submit(gpu, submit);
>  
>  	args->fence = submit->fence->seqno;
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 806eb0957280..e1a3cbe25a0c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -520,7 +520,7 @@ static void recover_worker(struct work_struct *work)
>  			struct msm_ringbuffer *ring = gpu->rb[i];
>  
>  			list_for_each_entry(submit, &ring->submits, node)
> -				gpu->funcs->submit(gpu, submit, NULL);
> +				gpu->funcs->submit(gpu, submit);
>  		}
>  	}
>  
> @@ -747,8 +747,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
>  }
>  
>  /* add bo's to gpu's ring, and kick gpu: */
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -		struct msm_file_private *ctx)
> +void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>  	struct drm_device *dev = gpu->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
> @@ -788,8 +787,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>  			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
>  	}
>  
> -	gpu->funcs->submit(gpu, submit, ctx);
> -	priv->lastctx = ctx;
> +	gpu->funcs->submit(gpu, submit);
> +	priv->lastctx = submit->queue->ctx;
>  
>  	hangcheck_timer_reset(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 97c527e98391..1f96ac0d9049 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -45,8 +45,7 @@ struct msm_gpu_funcs {
>  	int (*hw_init)(struct msm_gpu *gpu);
>  	int (*pm_suspend)(struct msm_gpu *gpu);
>  	int (*pm_resume)(struct msm_gpu *gpu);
> -	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -			struct msm_file_private *ctx);
> +	void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>  	void (*flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  	irqreturn_t (*irq)(struct msm_gpu *irq);
>  	struct msm_ringbuffer *(*active_ring)(struct msm_gpu *gpu);
> @@ -290,8 +289,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
>  		uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
>  
>  void msm_gpu_retire(struct msm_gpu *gpu);
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -		struct msm_file_private *ctx);
> +void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>  
>  int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
> -- 
> 2.26.2
> 
