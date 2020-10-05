Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC4C2837B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 16:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgJEO1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 10:27:32 -0400
Received: from z5.mailgun.us ([104.130.96.5]:46740 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbgJEO1c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 10:27:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601908051; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=DHcSEjF/HzYiIfs0XqKVg+q/aLepeBFFSSuhWlIOrLw=; b=Z+hnkG/PSGdUjNb1E8sviG/6pAB4wnRvdY/B0nqZ4xQVeTc1rCER3D4ktYA5FMgHuwOmYAEP
 /B8nbHmQajCzlS5nyiyBL+qkeAsusv43l7BX0MdYn6iTg6t35qy29VN6/sZ7ClAG5xYeMKhE
 kltlh6UeH2OCkN47ebExbHKcq4A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f7b2d3c83370fa1c10312ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:27:08
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8366DC433FF; Mon,  5 Oct 2020 14:27:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82D8FC433CA;
        Mon,  5 Oct 2020 14:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82D8FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 5 Oct 2020 08:27:03 -0600
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
Subject: Re: [Freedreno] [PATCH 07/14] drm/msm: Refcount submits
Message-ID: <20201005142703.GF4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-8-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-8-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 04, 2020 at 12:21:39PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Before we remove dev->struct_mutex from the retire path, we have to deal
> with the situation of a submit retiring before the submit ioctl returns.
> 
> To deal with this, ring->submits will hold a reference to the submit,
> which is dropped when the submit is retired.  And the submit ioctl path
> holds it's own ref, which it drops when it is done with the submit.
> 
> Also, add to submit list *after* getting/pinning bo's, to prevent badness
> in case the completed fence is corrupted, and retire_worker mistakenly
> believes the submit is done too early.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h        |  1 -
>  drivers/gpu/drm/msm/msm_gem.h        | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_gem_submit.c | 12 ++++++------
>  drivers/gpu/drm/msm/msm_gpu.c        | 21 ++++++++++++++++-----
>  4 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 50978e5db376..535f9e718e2d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -277,7 +277,6 @@ void msm_unregister_mmu(struct drm_device *dev, struct msm_mmu *mmu);
>  
>  bool msm_use_mmu(struct drm_device *dev);
>  
> -void msm_gem_submit_free(struct msm_gem_submit *submit);
>  int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  		struct drm_file *file);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index a1bf741b9b89..e05b1530aca6 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -136,6 +136,7 @@ void msm_gem_free_work(struct work_struct *work);
>   * lasts for the duration of the submit-ioctl.
>   */
>  struct msm_gem_submit {
> +	struct kref ref;
>  	struct drm_device *dev;
>  	struct msm_gpu *gpu;
>  	struct msm_gem_address_space *aspace;
> @@ -169,6 +170,18 @@ struct msm_gem_submit {
>  	} bos[];
>  };
>  
> +void __msm_gem_submit_destroy(struct kref *kref);
> +
> +static inline void msm_gem_submit_get(struct msm_gem_submit *submit)
> +{
> +	kref_get(&submit->ref);
> +}
> +
> +static inline void msm_gem_submit_put(struct msm_gem_submit *submit)
> +{
> +	kref_put(&submit->ref, __msm_gem_submit_destroy);
> +}
> +
>  /* helper to determine of a buffer in submit should be dumped, used for both
>   * devcoredump and debugfs cmdstream dumping:
>   */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index e1d1f005b3d4..7d653bdc92dc 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -42,6 +42,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	if (!submit)
>  		return NULL;
>  
> +	kref_init(&submit->ref);
>  	submit->dev = dev;
>  	submit->aspace = queue->ctx->aspace;
>  	submit->gpu = gpu;
> @@ -60,12 +61,12 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>  	return submit;
>  }
>  
> -void msm_gem_submit_free(struct msm_gem_submit *submit)
> +void __msm_gem_submit_destroy(struct kref *kref)
>  {
> +	struct msm_gem_submit *submit =
> +			container_of(kref, struct msm_gem_submit, ref);
> +
>  	dma_fence_put(submit->fence);
> -	spin_lock(&submit->ring->submit_lock);
> -	list_del(&submit->node);
> -	spin_unlock(&submit->ring->submit_lock);
>  	put_pid(submit->pid);
>  	msm_submitqueue_put(submit->queue);
>  
> @@ -805,8 +806,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>  	submit_cleanup(submit);
>  	if (has_ww_ticket)
>  		ww_acquire_fini(&submit->ticket);
> -	if (ret)
> -		msm_gem_submit_free(submit);
> +	msm_gem_submit_put(submit);
>  out_unlock:
>  	if (ret && (out_fence_fd >= 0))
>  		put_unused_fd(out_fence_fd);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8d1e254f964a..fd3fc6f36ab1 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -712,7 +712,12 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  	pm_runtime_mark_last_busy(&gpu->pdev->dev);
>  	pm_runtime_put_autosuspend(&gpu->pdev->dev);
> -	msm_gem_submit_free(submit);
> +
> +	spin_lock(&ring->submit_lock);
> +	list_del(&submit->node);
> +	spin_unlock(&ring->submit_lock);
> +
> +	msm_gem_submit_put(submit);
>  }
>  
>  static void retire_submits(struct msm_gpu *gpu)
> @@ -786,10 +791,6 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	submit->seqno = ++ring->seqno;
>  
> -	spin_lock(&ring->submit_lock);
> -	list_add_tail(&submit->node, &ring->submits);
> -	spin_unlock(&ring->submit_lock);
> -
>  	msm_rd_dump_submit(priv->rd, submit, NULL);
>  
>  	update_sw_cntrs(gpu);
> @@ -816,6 +817,16 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  		msm_gem_active_get(drm_obj, gpu);
>  	}
>  
> +	/*
> +	 * ring->submits holds a ref to the submit, to deal with the case
> +	 * that a submit completes before msm_ioctl_gem_submit() returns.
> +	 */
> +	msm_gem_submit_get(submit);
> +
> +	spin_lock(&ring->submit_lock);
> +	list_add_tail(&submit->node, &ring->submits);
> +	spin_unlock(&ring->submit_lock);
> +
>  	gpu->funcs->submit(gpu, submit);
>  	priv->lastctx = submit->queue->ctx;
>  
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
