Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2542B4CAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732148AbgKPRZl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:25:41 -0500
Received: from z5.mailgun.us ([104.130.96.5]:16939 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730854AbgKPRZk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:25:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605547539; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ubwksu+2cE0DKBoNZBkN+tiTw5genF8NV37stNzyi/8=; b=AjdV3CWS1af6aBrULdma3Xf53fmvAqR15f3+y34Gg4Jcsd1oFsqdLl7f06Mh2utAokekKhGR
 oWOv6jvshnIsaacSWcfRCF9xT1r9K2A8ggnWkzmxInorCDoD97S9KL+wjylYR8m6V1AEqSEB
 QfS+7fCQ1FOGt2oia7H5BfQeh6s=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fb2b60d37ede2253b1a1098 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 17:25:33
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1A368C43461; Mon, 16 Nov 2020 17:25:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE1FFC433ED;
        Mon, 16 Nov 2020 17:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE1FFC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 16 Nov 2020 10:25:27 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, hch@lst.de,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [RESEND PATCH v2 4/5] drm/msm: add
 DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
Message-ID: <20201116172527.GC16856@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
        freedreno@lists.freedesktop.org, hch@lst.de,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Sean Paul <sean@poorly.run>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-5-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-5-jonathan@marek.ca>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 14, 2020 at 10:17:12AM -0500, Jonathan Marek wrote:
> This makes it possible to use the non-coherent cached MSM_BO_CACHED mode,
> which otherwise doesn't provide any method for cleaning/invalidating the
> cache to sync with the device.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.h |  2 ++
>  drivers/gpu/drm/msm/msm_gem.c | 23 +++++++++++++++++++++++
>  include/uapi/drm/msm_drm.h    | 20 ++++++++++++++++++++
>  4 files changed, 66 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index bae48afca82e..3f17acdf6594 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -959,6 +959,26 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
>  	return msm_submitqueue_remove(file->driver_priv, id);
>  }
>  
> +static int msm_ioctl_gem_sync_cache(struct drm_device *dev, void *data,
> +		struct drm_file *file)
> +{
> +	struct drm_msm_gem_sync_cache *args = data;
> +	struct drm_gem_object *obj;
> +
> +	if (args->flags & ~MSM_GEM_SYNC_CACHE_FLAGS)
> +		return -EINVAL;
> +
> +	obj = drm_gem_object_lookup(file, args->handle);
> +	if (!obj)
> +		return -ENOENT;
> +
> +	msm_gem_sync_cache(obj, args->flags, args->offset, args->end);
> +
> +	drm_gem_object_put(obj);
> +
> +	return 0;
> +}
> +
>  static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
> @@ -971,6 +991,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(MSM_GEM_SYNC_CACHE,    msm_ioctl_gem_sync_cache,    DRM_RENDER_ALLOW),
>  };
>  
>  static const struct vm_operations_struct vm_ops = {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 22ebecb28349..f170f843010e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -318,6 +318,8 @@ void msm_gem_active_get(struct drm_gem_object *obj, struct msm_gpu *gpu);
>  void msm_gem_active_put(struct drm_gem_object *obj);
>  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t *timeout);
>  int msm_gem_cpu_fini(struct drm_gem_object *obj);
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end);
>  void msm_gem_free_object(struct drm_gem_object *obj);
>  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
>  		uint32_t size, uint32_t flags, uint32_t *handle, char *name);
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 3d8254b5de16..039738696f9a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -797,6 +797,29 @@ int msm_gem_cpu_fini(struct drm_gem_object *obj)
>  	return 0;
>  }
>  
> +void msm_gem_sync_cache(struct drm_gem_object *obj, uint32_t flags,
> +		size_t range_start, size_t range_end)
> +{
> +	struct msm_gem_object *msm_obj = to_msm_bo(obj);
> +	struct device *dev = msm_obj->base.dev->dev;
> +

On a6xx targets with I/O coherency you can skip this (assuming that the IOMMU
flag has been set for this buffer). I'm not sure if one of the other patches
already does the bypass but I mention it here since this is the point of
no-return.

Jordan

> +	/* exit early if get_pages() hasn't been called yet */
> +	if (!msm_obj->pages)
> +		return;
> +
> +	/* TODO: sync only the specified range */
> +
> +	if (flags & MSM_GEM_SYNC_FOR_DEVICE) {
> +		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_TO_DEVICE);
> +	}
> +
> +	if (flags & MSM_GEM_SYNC_FOR_CPU) {
> +		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
> +				msm_obj->sgt->nents, DMA_FROM_DEVICE);
> +	}
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static void describe_fence(struct dma_fence *fence, const char *type,
>  		struct seq_file *m)
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index 474497e8743a..c8288f328528 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -319,6 +319,24 @@ struct drm_msm_submitqueue_query {
>  	__u32 pad;
>  };
>  
> +/*
> + * Host cache maintenance (relevant for MSM_BO_CACHED)
> + * driver may both clean/invalidate (flush) for clean
> + */
> +
> +#define MSM_GEM_SYNC_FOR_DEVICE		0x1
> +#define MSM_GEM_SYNC_FOR_CPU		0x2
> +
> +#define MSM_GEM_SYNC_CACHE_FLAGS	(MSM_GEM_SYNC_FOR_DEVICE | \
> +					 MSM_GEM_SYNC_FOR_CPU)
> +
> +struct drm_msm_gem_sync_cache {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 offset;
> +	__u64 end;      /* offset + size */
> +};
> +
>  #define DRM_MSM_GET_PARAM              0x00
>  /* placeholder:
>  #define DRM_MSM_SET_PARAM              0x01
> @@ -336,6 +354,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
>  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
>  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> +#define DRM_MSM_GEM_SYNC_CACHE         0x0D
>  
>  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
>  #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
> @@ -348,6 +367,7 @@ struct drm_msm_submitqueue_query {
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> +#define DRM_IOCTL_MSM_GEM_SYNC_CACHE     DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_GEM_SYNC_CACHE, struct drm_msm_gem_sync_cache)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
