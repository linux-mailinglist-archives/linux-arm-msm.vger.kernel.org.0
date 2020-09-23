Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16598275AB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 16:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgIWOu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 10:50:58 -0400
Received: from z5.mailgun.us ([104.130.96.5]:32659 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726839AbgIWOuy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 10:50:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600872653; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ESkeylNUl1FVxKx50DfBnz4zr7RE1eH47m6PTA1AtBw=; b=wV4ej7/1jHHlN7eJ/LV+3amoKbauE5tQaSYQgafnW8xFp96WG8PiNSS7UJhYjK86SOz0ot9L
 rBW83nqtstgSlchrsMhTRiYeYdERuAQLDtx5nLyevh6c5Wjb2GbfdZ32tW5bkfuU5goEkbq6
 YQ2yYyRni/4ttJi3fLyEriJFEdE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f6b60ccd8a57df5abcf0c23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 23 Sep 2020 14:50:52
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9283AC43382; Wed, 23 Sep 2020 14:50:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95E42C433CA;
        Wed, 23 Sep 2020 14:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 95E42C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 23 Sep 2020 08:50:47 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org
Subject: Re: [PATCH v2 1/2] drm/msm: Fix premature purging of BO
Message-ID: <20200923145047.GB31425@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, jonathan@marek.ca, robdclark@gmail.com,
        dianders@chromium.org
References: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600786527-7343-1-git-send-email-akhilpo@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 22, 2020 at 08:25:26PM +0530, Akhil P Oommen wrote:
> In the case where we have a back-to-back submission that shares the same
> BO, this BO will be prematurely moved to inactive_list while retiring the
> first submit. But it will be still part of the second submit which is
> being processed by the GPU. Now, if the shrinker happens to be triggered at
> this point, it will result in a premature purging of this BO.
> 
> To fix this, we need to refcount BO while doing submit and retire. Then,
> it should be moved to inactive list when this refcount becomes 0.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> Changes in v2:
> 	1. Keep Active List around
> 	2. Put back the deleted WARN_ON
> 
>  drivers/gpu/drm/msm/msm_drv.h |  5 ++---
>  drivers/gpu/drm/msm/msm_gem.c | 32 ++++++++++++++++----------------
>  drivers/gpu/drm/msm/msm_gem.h |  4 +++-
>  drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++----
>  4 files changed, 28 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 3193274..28e3c8d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -309,9 +309,8 @@ void msm_gem_put_vaddr(struct drm_gem_object *obj);
>  int msm_gem_madvise(struct drm_gem_object *obj, unsigned madv);
>  int msm_gem_sync_object(struct drm_gem_object *obj,
>  		struct msm_fence_context *fctx, bool exclusive);
> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> -		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence);
> -void msm_gem_move_to_inactive(struct drm_gem_object *obj);
> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
> +void msm_gem_active_put(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
>  void msm_gem_free_object(struct drm_gem_object *obj);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 76a6c52..14e14ca 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -743,31 +743,31 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
>  	return 0;
>  }
>  
> -void msm_gem_move_to_active(struct drm_gem_object *obj,
> -		struct msm_gpu *gpu, bool exclusive, struct dma_fence *fence)
> +void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu)
>  {
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
>  	WARN_ON(msm_obj->madv != MSM_MADV_WILLNEED);
> -	msm_obj->gpu = gpu;
> -	if (exclusive)
> -		dma_resv_add_excl_fence(obj->resv, fence);
> -	else
> -		dma_resv_add_shared_fence(obj->resv, fence);
> -	list_del_init(&msm_obj->mm_list);
> -	list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +
> +	if (!atomic_fetch_inc(&msm_obj->active_count)) {
> +		msm_obj->gpu = gpu;
> +		list_del_init(&msm_obj->mm_list);
> +		list_add_tail(&msm_obj->mm_list, &gpu->active_list);
> +	}

I'm not sure if all the renaming and reorganization are really needed here -
this is the meat of the change and it would have fit in reasonably well with the
existing function design.

>  }
>  
> -void msm_gem_move_to_inactive(struct drm_gem_object *obj)
> +void msm_gem_active_put(struct drm_gem_object *obj)
>  {
> -	struct drm_device *dev = obj->dev;
> -	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +	struct msm_drm_private *priv = obj->dev->dev_private;
>  
> -	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> +	WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
>  
> -	msm_obj->gpu = NULL;
> -	list_del_init(&msm_obj->mm_list);
> -	list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +	if (!atomic_dec_return(&msm_obj->active_count)) {
> +		msm_obj->gpu = NULL;
> +		list_del_init(&msm_obj->mm_list);
> +		list_add_tail(&msm_obj->mm_list, &priv->inactive_list);
> +	}

Same.

Jordan
>  }
>  
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout)
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 7b1c7a5..a1bf741 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -88,12 +88,14 @@ struct msm_gem_object {
>  	struct mutex lock; /* Protects resources associated with bo */
>  
>  	char name[32]; /* Identifier to print for the debugfs files */
> +
> +	atomic_t active_count;
>  };
>  #define to_msm_bo(x) container_of(x, struct msm_gem_object, base)
>  
>  static inline bool is_active(struct msm_gem_object *msm_obj)
>  {
> -	return msm_obj->gpu != NULL;
> +	return atomic_read(&msm_obj->active_count);
>  }
>  
>  static inline bool is_purgeable(struct msm_gem_object *msm_obj)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 29c8d73c..55d1648 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -698,8 +698,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  	for (i = 0; i < submit->nr_bos; i++) {
>  		struct msm_gem_object *msm_obj = submit->bos[i].obj;
> -		/* move to inactive: */
> -		msm_gem_move_to_inactive(&msm_obj->base);
> +
> +		msm_gem_active_put(&msm_obj->base);
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
>  		drm_gem_object_put_locked(&msm_obj->base);
>  	}
> @@ -774,6 +774,7 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  
>  	for (i = 0; i < submit->nr_bos; i++) {
>  		struct msm_gem_object *msm_obj = submit->bos[i].obj;
> +		struct drm_gem_object *drm_obj = &msm_obj->base;
>  		uint64_t iova;
>  
>  		/* can't happen yet.. but when we add 2d support we'll have
> @@ -786,9 +787,11 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  		msm_gem_get_and_pin_iova(&msm_obj->base, submit->aspace, &iova);
>  
>  		if (submit->bos[i].flags & MSM_SUBMIT_BO_WRITE)
> -			msm_gem_move_to_active(&msm_obj->base, gpu, true, submit->fence);
> +			dma_resv_add_excl_fence(drm_obj->resv, submit->fence);
>  		else if (submit->bos[i].flags & MSM_SUBMIT_BO_READ)
> -			msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
> +			dma_resv_add_shared_fence(drm_obj->resv, submit->fence);
> +
> +		msm_gem_active_get(drm_obj, gpu);
>  	}
>  
>  	gpu->funcs->submit(gpu, submit);
> -- 
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
