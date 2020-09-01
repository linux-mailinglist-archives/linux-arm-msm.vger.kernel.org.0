Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F6D25873B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 07:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIAFFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 01:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgIAFFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 01:05:05 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEA60C061290
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:05:05 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id 3so81917oih.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2020 22:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RnDgJkGWhi/Qn1HlxW7EpsCiAIeQ1NnBbVD0tNRH8sg=;
        b=AaDz//TpVHrTH9z17qkhwu4dYmAKtDEtzZnhx8N0awIVX8INMo5xxwjgXy919WXpoy
         3k7ifcSbtEBfnGTrELRjsa8Yc9MY8Td9vP2kkymJVOKnaOeaEp7ZzWvqyc9XXjy69Kj1
         NXrEcCWAVWJl5I0J9l2jGQ5c3k6mRfzCZ1p5a57b/HnNIic/MIIqJkBEW83zhYdONvYY
         FPaXJ8ox7n6ObqThrLfmL+ZZMljqrtgOeVeaSplpD2gF/Dk88Dl4hm/f5RFZ8r4eIWoZ
         c4LfGKi5H5HyJGM20PZxFGICgXAZ20YW5SgE7n+yulx9PvS7xjLafM7hRkBa1UVkco80
         2pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RnDgJkGWhi/Qn1HlxW7EpsCiAIeQ1NnBbVD0tNRH8sg=;
        b=ChSyLzIa2aaHFvww9hTqhq4Wj/E7Ewx6u7xseXjiaeuJwt7WR8LkVvtMF1TIVvf7cB
         FqRA0yLbPCHhVgsI+c2qibdUiAUfcL1XH3LfvagnctETlPBCEyUZm+z7dXWAjWBQw6ST
         IYu21egbVfYaFCk767cFOt3lmkuaLI6JP0uqHFVcFIu9i8EdhPobkIah2BeciXnsd5EE
         s7cdBXIkK1b/bSjScPEaQuzAZGjZlokoVvPAyt1+ELqAk12xi3jS9Yoonfdcl1uigPbY
         gYzfLD/vpTnNIZQI+1Pkz6K8osNYdLDIbRT2Up+X/r7AS8E8ZXNivHDF415TRkM9hgKd
         ONIw==
X-Gm-Message-State: AOAM531m7E0dr0F45LRvqyBbaI+cK8kAxDPOLo28hyfuv2B/60O5Cw00
        uFG2U1uTk0iBA75a/sFvfjLtoQ==
X-Google-Smtp-Source: ABdhPJx9S39or4NhgXd4fIuOKNIo6wYcZ/fCimE1WKYwxJcWWoTNj3lvhAhkWcj5Dio5B3+p3XY5Ig==
X-Received: by 2002:aca:ed42:: with SMTP id l63mr78213oih.178.1598936704280;
        Mon, 31 Aug 2020 22:05:04 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id r189sm2036660oih.51.2020.08.31.22.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 22:05:03 -0700 (PDT)
Date:   Tue, 1 Sep 2020 00:05:00 -0500
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
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/19] drm/msm: Add a context pointer to the submitqueue
Message-ID: <20200901050500.GS3715@yoga>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200814024114.1177553-12-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814024114.1177553-12-robdclark@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 13 Aug 21:41 CDT 2020, Rob Clark wrote:

> From: Jordan Crouse <jcrouse@codeaurora.org>
> 
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


> Co-developed-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c         |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h         | 20 ++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_gem.h         |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c  |  6 +++---
>  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
>  drivers/gpu/drm/msm/msm_submitqueue.c |  3 +++
>  6 files changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7d641c7e3514..01845a3b8d52 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -594,6 +594,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> +	kref_init(&ctx->ref);
>  	msm_submitqueue_init(dev, ctx);
>  
>  	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
> @@ -615,7 +616,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
>  static void context_close(struct msm_file_private *ctx)
>  {
>  	msm_submitqueue_close(ctx);
> -	kfree(ctx);
> +	msm_file_private_put(ctx);
>  }
>  
>  static void msm_postclose(struct drm_device *dev, struct drm_file *file)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index af259b0573ea..4561bfb5e745 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -57,6 +57,7 @@ struct msm_file_private {
>  	struct list_head submitqueues;
>  	int queueid;
>  	struct msm_gem_address_space *aspace;
> +	struct kref ref;
>  };
>  
>  enum msm_mdp_plane_property {
> @@ -428,6 +429,25 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
>  
>  void msm_submitqueue_destroy(struct kref *kref);
>  
> +static inline void __msm_file_private_destroy(struct kref *kref)
> +{
> +	struct msm_file_private *ctx = container_of(kref,
> +		struct msm_file_private, ref);
> +
> +	kfree(ctx);
> +}
> +
> +static inline void msm_file_private_put(struct msm_file_private *ctx)
> +{
> +	kref_put(&ctx->ref, __msm_file_private_destroy);
> +}
> +
> +static inline struct msm_file_private *msm_file_private_get(
> +	struct msm_file_private *ctx)
> +{
> +	kref_get(&ctx->ref);
> +	return ctx;
> +}
>  
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 972490b14ba5..9c573c4269cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,6 +142,7 @@ struct msm_gem_submit {
>  	bool valid;         /* true if no cmdstream patching needed */
>  	bool in_rb;         /* "sudo" mode, copy cmds into RB */
>  	struct msm_ringbuffer *ring;
> +	struct msm_file_private *ctx;
>  	unsigned int nr_cmds;
>  	unsigned int nr_bos;
>  	u32 ident;	   /* A "identifier" for the submit for logging */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 8cb9aa15ff90..1464b04d25d3 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -27,7 +27,7 @@
>  #define BO_PINNED   0x2000
>  
>  static struct msm_gem_submit *submit_create(struct drm_device *dev,
> -		struct msm_gpu *gpu, struct msm_gem_address_space *aspace,
> +		struct msm_gpu *gpu,
>  		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
>  		uint32_t nr_cmds)
>  {
> @@ -43,7 +43,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  		return NULL;
>  
>  	submit->dev = dev;
> -	submit->aspace = aspace;
> +	submit->aspace = queue->ctx->aspace;
>  	submit->gpu = gpu;
>  	submit->fence = NULL;
>  	submit->cmd = (void *)&submit->bos[nr_bos];
> @@ -677,7 +677,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> -	submit = submit_create(dev, gpu, ctx->aspace, queue, args->nr_bos,
> +	submit = submit_create(dev, gpu, queue, args->nr_bos,
>  		args->nr_cmds);
>  	if (!submit) {
>  		ret = -ENOMEM;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index f91b141add75..97c527e98391 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -190,6 +190,7 @@ struct msm_gpu_submitqueue {
>  	u32 flags;
>  	u32 prio;
>  	int faults;
> +	struct msm_file_private *ctx;
>  	struct list_head node;
>  	struct kref ref;
>  };
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 90c9d84e6155..c3d206105d28 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
>  	struct msm_gpu_submitqueue *queue = container_of(kref,
>  		struct msm_gpu_submitqueue, ref);
>  
> +	msm_file_private_put(queue->ctx);
> +
>  	kfree(queue);
>  }
>  
> @@ -83,6 +85,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>  
>  	write_lock(&ctx->queuelock);
>  
> +	queue->ctx = msm_file_private_get(ctx);
>  	queue->id = ctx->queueid++;
>  
>  	if (id)
> -- 
> 2.26.2
> 
