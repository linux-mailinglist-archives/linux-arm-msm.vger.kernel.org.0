Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CEB2837A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 16:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbgJEOYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 10:24:22 -0400
Received: from z5.mailgun.us ([104.130.96.5]:13202 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgJEOYW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 10:24:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601907861; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=j+q6qQHi3OFDDwad/nySobttr3Dg5t06eOfbu86u5fQ=; b=QHQvBTdjhn4UPiZ0Y92Ld1+VEzJ8+UXUXwqLMbtdNgJ9YgA8aojmenQw/tcTd28W46ush/HL
 gMWvO+Y1+tg3adz5hiFaT7eWW7rdfY6IPtqBHFWfzUF7Sk84HVc7OkrymhP+3uynsa86nJMP
 yQ5dgbW66kUMPom+xZEt2KJVzc0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f7b2c6206d81bc48dbd961a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:23:30
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABC47C433FF; Mon,  5 Oct 2020 14:23:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A55C4C433C8;
        Mon,  5 Oct 2020 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A55C4C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 5 Oct 2020 08:23:25 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 06/14] drm/msm: Protect ring->submits with
 it's own lock
Message-ID: <20201005142325.GE4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-7-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-7-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 04, 2020 at 12:21:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> One less place to rely on dev->struct_mutex.
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c        | 37 ++++++++++++++++++++++------
>  drivers/gpu/drm/msm/msm_ringbuffer.c |  1 +
>  drivers/gpu/drm/msm/msm_ringbuffer.h |  6 +++++
>  4 files changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index aa5c60a7132d..e1d1f005b3d4 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -63,7 +63,9 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  void msm_gem_submit_free(struct msm_gem_submit *submit)
>  {
>  	dma_fence_put(submit->fence);
> +	spin_lock(&submit->ring->submit_lock);
>  	list_del(&submit->node);
> +	spin_unlock(&submit->ring->submit_lock);
>  	put_pid(submit->pid);
>  	msm_submitqueue_put(submit->queue);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index ca8c95b32c8b..8d1e254f964a 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -270,6 +270,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  {
>  	struct msm_gem_submit *submit;
>  
> +	spin_lock(&ring->submit_lock);
>  	list_for_each_entry(submit, &ring->submits, node) {
>  		if (submit->seqno > fence)
>  			break;
> @@ -277,6 +278,7 @@ static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  		msm_update_fence(submit->ring->fctx,
>  			submit->fence->seqno);
>  	}
> +	spin_unlock(&ring->submit_lock);
>  }
>  
>  #ifdef CONFIG_DEV_COREDUMP
> @@ -430,11 +432,14 @@ find_submit(struct msm_ringbuffer *ring, uint32_t fence)
>  {
>  	struct msm_gem_submit *submit;
>  
> -	WARN_ON(!mutex_is_locked(&ring->gpu->dev->struct_mutex));
> -
> -	list_for_each_entry(submit, &ring->submits, node)
> -		if (submit->seqno == fence)
> +	spin_lock(&ring->submit_lock);
> +	list_for_each_entry(submit, &ring->submits, node) {
> +		if (submit->seqno == fence) {
> +			spin_unlock(&ring->submit_lock);
>  			return submit;
> +		}
> +	}
> +	spin_unlock(&ring->submit_lock);
>  
>  	return NULL;
>  }
> @@ -523,8 +528,10 @@ static void recover_worker(struct work_struct *work)
>  		for (i = 0; i < gpu->nr_rings; i++) {
>  			struct msm_ringbuffer *ring = gpu->rb[i];
>  
> +			spin_lock(&ring->submit_lock);
>  			list_for_each_entry(submit, &ring->submits, node)
>  				gpu->funcs->submit(gpu, submit);
> +			spin_unlock(&ring->submit_lock);
>  		}
>  	}
>  
> @@ -711,7 +718,6 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  static void retire_submits(struct msm_gpu *gpu)
>  {
>  	struct drm_device *dev = gpu->dev;
> -	struct msm_gem_submit *submit, *tmp;
>  	int i;
>  
>  	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> @@ -720,9 +726,24 @@ static void retire_submits(struct msm_gpu *gpu)
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct msm_ringbuffer *ring = gpu->rb[i];
>  
> -		list_for_each_entry_safe(submit, tmp, &ring->submits, node) {
> -			if (dma_fence_is_signaled(submit->fence))
> +		while (true) {
> +			struct msm_gem_submit *submit = NULL;
> +
> +			spin_lock(&ring->submit_lock);
> +			submit = list_first_entry_or_null(&ring->submits,
> +					struct msm_gem_submit, node);
> +			spin_unlock(&ring->submit_lock);
> +
> +			/*
> +			 * If no submit, we are done.  If submit->fence hasn't
> +			 * been signalled, then later submits are not signalled
> +			 * either, so we are also done.
> +			 */
> +			if (submit && dma_fence_is_signaled(submit->fence)) {
>  				retire_submit(gpu, ring, submit);
> +			} else {
> +				break;
> +			}
>  		}
>  	}
>  }
> @@ -765,7 +786,9 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	submit->seqno = ++ring->seqno;
>  
> +	spin_lock(&ring->submit_lock);
>  	list_add_tail(&submit->node, &ring->submits);
> +	spin_unlock(&ring->submit_lock);
>  
>  	msm_rd_dump_submit(priv->rd, submit, NULL);
>  
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
> index 1b6958e908dc..4d2a2a4abef8 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> @@ -46,6 +46,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>  	ring->memptrs_iova = memptrs_iova;
>  
>  	INIT_LIST_HEAD(&ring->submits);
> +	spin_lock_init(&ring->submit_lock);
>  	spin_lock_init(&ring->preempt_lock);
>  
>  	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
> diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
> index 4956d1bc5d0e..fe55d4a1aa16 100644
> --- a/drivers/gpu/drm/msm/msm_ringbuffer.h
> +++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
> @@ -39,7 +39,13 @@ struct msm_ringbuffer {
>  	int id;
>  	struct drm_gem_object *bo;
>  	uint32_t *start, *end, *cur, *next;
> +
> +	/*
> +	 * List of in-flight submits on this ring.  Protected by submit_lock.
> +	 */
>  	struct list_head submits;
> +	spinlock_t submit_lock;
> +
>  	uint64_t iova;
>  	uint32_t seqno;
>  	uint32_t hangcheck_fence;
> -- 
> 2.26.2
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
