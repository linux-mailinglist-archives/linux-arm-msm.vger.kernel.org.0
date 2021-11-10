Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CBC44C462
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 16:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232077AbhKJPbu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 10:31:50 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:11234 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231811AbhKJPbt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 10:31:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636558142; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=oMeas4CJdev7rH6eOO7SATLTTz7lb/FnVSsLtDM/czY=; b=RUBfZZNy15F8Ym7wGqUmPlYpI8+0DA895MhXId5TvY0U+HeOGgSg2zxL/80hAaMhsaaDLDFe
 D1d7MBsTQ+eiW4DLe90fNPMJJn3wD3Py0XYwFNOxmcu9Y5YSIVldb57/+lyAJ/5haRPa/CdJ
 ynwU4C7726AbequKCLzpbtpITp4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 618be532a4b510b38f56a9cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 15:28:50
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 655BAC43460; Wed, 10 Nov 2021 15:28:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.185.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38A5EC4338F;
        Wed, 10 Nov 2021 15:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 38A5EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <e9e50cad-2341-cb25-ef84-0d61a2cb7469@codeaurora.org>
Date:   Wed, 10 Nov 2021 20:58:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v4 07/13] drm/msm: Track "seqno" fences by idr
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-8-robdclark@gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <20210728010632.2633470-8-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/28/2021 6:36 AM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Previously the (non-fd) fence returned from submit ioctl was a raw
> seqno, which is scoped to the ring.  But from UABI standpoint, the
> ioctls related to seqno fences all specify a submitqueue.  We can
> take advantage of that to replace the seqno fences with a cyclic idr
> handle.
> 
> This is in preperation for moving to drm scheduler, at which point
> the submit ioctl will return after queuing the submit job to the
> scheduler, but before the submit is written into the ring (and
> therefore before a ring seqno has been assigned).  Which means we
> need to replace the dma_fence that userspace may need to wait on
> with a scheduler fence.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++--
>   drivers/gpu/drm/msm/msm_fence.c       | 42 ---------------------------
>   drivers/gpu/drm/msm/msm_fence.h       |  3 --
>   drivers/gpu/drm/msm/msm_gem.h         |  1 +
>   drivers/gpu/drm/msm/msm_gem_submit.c  | 23 ++++++++++++++-
>   drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
>   drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
>   7 files changed, 61 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 9b8fa2ad0d84..1594ae39d54f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
>   	ktime_t timeout = to_ktime(args->timeout);
>   	struct msm_gpu_submitqueue *queue;
>   	struct msm_gpu *gpu = priv->gpu;
> +	struct dma_fence *fence;
>   	int ret;
>   
>   	if (args->pad) {
> @@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
>   	if (!queue)
>   		return -ENOENT;
>   
> -	ret = msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence, &timeout,
> -		true);
> +	/*
> +	 * Map submitqueue scoped "seqno" (which is actually an idr key)
> +	 * back to underlying dma-fence
> +	 *
> +	 * The fence is removed from the fence_idr when the submit is
> +	 * retired, so if the fence is not found it means there is nothing
> +	 * to wait for
> +	 */
> +	ret = mutex_lock_interruptible(&queue->lock);
> +	if (ret)
> +		return ret;
> +	fence = idr_find(&queue->fence_idr, args->fence);
> +	if (fence)
> +		fence = dma_fence_get_rcu(fence);
> +	mutex_unlock(&queue->lock);
> +
> +	if (!fence)
> +		return 0;
>   
> +	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
> +	if (ret == 0) {
> +		ret = -ETIMEDOUT;
> +	} else if (ret != -ERESTARTSYS) {
> +		ret = 0;
> +	}
> +
> +	dma_fence_put(fence);
>   	msm_submitqueue_put(queue);
> +
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
> index b92a9091a1e2..f2cece542c3f 100644
> --- a/drivers/gpu/drm/msm/msm_fence.c
> +++ b/drivers/gpu/drm/msm/msm_fence.c
> @@ -24,7 +24,6 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>   	strncpy(fctx->name, name, sizeof(fctx->name));
>   	fctx->context = dma_fence_context_alloc(1);
>   	fctx->fenceptr = fenceptr;
> -	init_waitqueue_head(&fctx->event);
>   	spin_lock_init(&fctx->spinlock);
>   
>   	return fctx;
> @@ -45,53 +44,12 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
>   		(int32_t)(*fctx->fenceptr - fence) >= 0;
>   }
>   
> -/* legacy path for WAIT_FENCE ioctl: */
> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> -		ktime_t *timeout, bool interruptible)
> -{
> -	int ret;
> -
> -	if (fence > fctx->last_fence) {
> -		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
> -				fctx->name, fence, fctx->last_fence);
> -		return -EINVAL;

Rob, we changed this pre-existing behaviour in this patch. Now, when 
userspace tries to wait on a future fence, we don't return an error.

I just want to check if this was accidental or not?

-Akhil.

> -	}
> -
> -	if (!timeout) {
> -		/* no-wait: */
> -		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
> -	} else {
> -		unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
> -
> -		if (interruptible)
> -			ret = wait_event_interruptible_timeout(fctx->event,
> -				fence_completed(fctx, fence),
> -				remaining_jiffies);
> -		else
> -			ret = wait_event_timeout(fctx->event,
> -				fence_completed(fctx, fence),
> -				remaining_jiffies);
> -
> -		if (ret == 0) {
> -			DBG("timeout waiting for fence: %u (completed: %u)",
> -					fence, fctx->completed_fence);
> -			ret = -ETIMEDOUT;
> -		} else if (ret != -ERESTARTSYS) {
> -			ret = 0;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>   /* called from workqueue */
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>   {
>   	spin_lock(&fctx->spinlock);
>   	fctx->completed_fence = max(fence, fctx->completed_fence);
>   	spin_unlock(&fctx->spinlock);
> -
> -	wake_up_all(&fctx->event);
>   }
>   
>   struct msm_fence {
> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
> index 6ab97062ff1a..4783db528bcc 100644
> --- a/drivers/gpu/drm/msm/msm_fence.h
> +++ b/drivers/gpu/drm/msm/msm_fence.h
> @@ -49,7 +49,6 @@ struct msm_fence_context {
>   	 */
>   	volatile uint32_t *fenceptr;
>   
> -	wait_queue_head_t event;
>   	spinlock_t spinlock;
>   };
>   
> @@ -57,8 +56,6 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
>   		volatile uint32_t *fenceptr, const char *name);
>   void msm_fence_context_free(struct msm_fence_context *fctx);
>   
> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
> -		ktime_t *timeout, bool interruptible);
>   void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>   
>   struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index da3af702a6c8..e0579abda5b9 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -320,6 +320,7 @@ struct msm_gem_submit {
>   	struct ww_acquire_ctx ticket;
>   	uint32_t seqno;		/* Sequence number of the submit on the ring */
>   	struct dma_fence *fence;
> +	int fence_id;       /* key into queue->fence_idr */
>   	struct msm_gpu_submitqueue *queue;
>   	struct pid *pid;    /* submitting process */
>   	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 4f02fa3c78f9..f6f595aae2c5 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
>   			container_of(kref, struct msm_gem_submit, ref);
>   	unsigned i;
>   
> +	if (submit->fence_id) {
> +		mutex_lock(&submit->queue->lock);
> +		idr_remove(&submit->queue->fence_idr, submit->fence_id);
> +		mutex_unlock(&submit->queue->lock);
> +	}
> +
>   	dma_fence_put(submit->fence);
> +
>   	put_pid(submit->pid);
>   	msm_submitqueue_put(submit->queue);
>   
> @@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   		goto out;
>   	}
>   
> +	/*
> +	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
> +	 * to the underlying fence.
> +	 */
> +	mutex_lock(&queue->lock);
> +	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
> +			submit->fence, 0, INT_MAX, GFP_KERNEL);
> +	mutex_unlock(&queue->lock);
> +	if (submit->fence_id < 0) {
> +		ret = submit->fence_id = 0;
> +		submit->fence_id = 0;
> +		goto out;
> +	}
> +
>   	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>   		struct sync_file *sync_file = sync_file_create(submit->fence);
>   		if (!sync_file) {
> @@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   
>   	msm_gpu_submit(gpu, submit);
>   
> -	args->fence = submit->fence->seqno;
> +	args->fence = submit->fence_id;
>   
>   	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
>   	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 96efcb31e502..579627252540 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
>    *             which set of pgtables do submits jobs associated with the
>    *             submitqueue use)
>    * @node:      node in the context's list of submitqueues
> + * @fence_idr: maps fence-id to dma_fence for userspace visible fence
> + *             seqno, protected by submitqueue lock
> + * @lock:      submitqueue lock
>    * @ref:       reference count
>    */
>   struct msm_gpu_submitqueue {
> @@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
>   	int faults;
>   	struct msm_file_private *ctx;
>   	struct list_head node;
> +	struct idr fence_idr;
> +	struct mutex lock;
>   	struct kref ref;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 9e9fec61d629..66f8d0fb38b0 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
>   	struct msm_gpu_submitqueue *queue = container_of(kref,
>   		struct msm_gpu_submitqueue, ref);
>   
> +	idr_destroy(&queue->fence_idr);
> +
>   	msm_file_private_put(queue->ctx);
>   
>   	kfree(queue);
> @@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>   	if (id)
>   		*id = queue->id;
>   
> +	idr_init(&queue->fence_idr);
> +	mutex_init(&queue->lock);
> +
>   	list_add_tail(&queue->node, &ctx->submitqueues);
>   
>   	write_unlock(&ctx->queuelock);
> 

