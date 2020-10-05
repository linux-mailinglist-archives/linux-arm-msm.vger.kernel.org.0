Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954002837D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 16:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgJEOaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 10:30:01 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:56481 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725954AbgJEOaA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 10:30:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601908199; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=iCAzjch+kt+mTNL+rkwZf4UMRj93yANN0E0yvLN4NkE=; b=bokZN8lZ73fUL6YAom+SnakwnMCBIQtrc8BQigOsnFI9GbHlZcsvkW4gGabRDXMQireSQCHN
 RtzaRgn4xUDUdohyHuJHT1RNJwQqMDkhAP0k1R+CwJIHctU+1Q1Po1aoEhQsVLPkq0KKBnHs
 QIWy6xbgyWkkf4sOgHpGdnb40ig=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f7b2dd8d63768e57bf0b1d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 14:29:44
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3A0AFC433F1; Mon,  5 Oct 2020 14:29:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A830C433CB;
        Mon,  5 Oct 2020 14:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A830C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 5 Oct 2020 08:29:39 -0600
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
Subject: Re: [Freedreno] [PATCH 09/14] drm/msm: Drop struct_mutex from the
 retire path
Message-ID: <20201005142939.GH4204@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201004192152.3298573-10-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004192152.3298573-10-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Oct 04, 2020 at 12:21:41PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that we are not relying on dev->struct_mutex to protect the
> ring->submits lists, drop the struct_mutex lock.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index c9ff19a75169..5e351d1c00e9 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -707,7 +707,7 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  		msm_gem_active_put(&msm_obj->base);
>  		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
> -		drm_gem_object_put_locked(&msm_obj->base);
> +		drm_gem_object_put(&msm_obj->base);
>  	}
>  
>  	pm_runtime_mark_last_busy(&gpu->pdev->dev);
> @@ -722,11 +722,8 @@ static void retire_submit(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
>  
>  static void retire_submits(struct msm_gpu *gpu)
>  {
> -	struct drm_device *dev = gpu->dev;
>  	int i;
>  
> -	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
> -
>  	/* Retire the commits starting with highest priority */
>  	for (i = 0; i < gpu->nr_rings; i++) {
>  		struct msm_ringbuffer *ring = gpu->rb[i];
> @@ -756,15 +753,12 @@ static void retire_submits(struct msm_gpu *gpu)
>  static void retire_worker(struct work_struct *work)
>  {
>  	struct msm_gpu *gpu = container_of(work, struct msm_gpu, retire_work);
> -	struct drm_device *dev = gpu->dev;
>  	int i;
>  
>  	for (i = 0; i < gpu->nr_rings; i++)
>  		update_fences(gpu, gpu->rb[i], gpu->rb[i]->memptrs->fence);
>  
> -	mutex_lock(&dev->struct_mutex);
>  	retire_submits(gpu);
> -	mutex_unlock(&dev->struct_mutex);
>  }
>  
>  /* call from irq handler to schedule work to retire bo's */
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
