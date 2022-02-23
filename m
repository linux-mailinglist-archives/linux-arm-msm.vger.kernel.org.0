Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5934C0FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 11:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbiBWKAp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 05:00:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231278AbiBWKAo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 05:00:44 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E37789CDD
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:00:16 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 29so14075810ljv.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 02:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KjRNk806df2NZEel6HR0OBFdyY3J+pUWSPWymkVLPFs=;
        b=L/bY7Hd1l+NE0lFKNPvrvbtKA+XRH/B1g+zl0CBMHf/q7KNnSoiuYRVL+GdIdRu1IU
         jrVFSmUItFlCIugoop31cLAIbtcFbVdtB2BvYqtNBNr7apVUmRt9Cc37Htgd3rUuPH3B
         g4MQqif+5yZMCyEKGfvZe7wXepuSL+tw9pRz1zdE3p13WM9nef9ZGDsiHm+eA5KXGMFU
         sWQJ3/39FchyTtEDvkg1YqK0CDXAxVRIUBNZFZQb+78j35FjxGXDUpuDGKQj0rPwgqQD
         huufR2YpUHPecD21q9oD/HXSt0tVK6cfsMl0V/NbX75r7eDLf6Dmo3VQ4bFkydRu1cnw
         +bnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KjRNk806df2NZEel6HR0OBFdyY3J+pUWSPWymkVLPFs=;
        b=nZiUxWPNR30+Y6hlDf8Sc9kpFszNT6yXrGztTHzGlMMo4mFqvuQegaQPpRxFgb/ERZ
         nYtLjhZvxz5fpg1Qcfhe6cl8sSeKXpwboIY298BS+9y7PNFZ3KFH6stfSqzXhlreP3o2
         7gltBPKecohEHjQO+LxpGi9ureMVOAckdCvaIt/boTf1J/UoDR9h4TmEUboId2tGPb7N
         A0EQaogXTeUSTzU0BbQS3UXPqa8w8lekZwPms06YdvtyFzJBek8RkTiQf/hdKOpX20mZ
         sDEgufgonZiIWBwZJLM3WT/DN7clCDZEAyNMmOHf4LcOp4IwDt6yV1VQW131vAwizF9h
         j0Sw==
X-Gm-Message-State: AOAM531YWCwAf+8V/n9Sgpo8kGa54LA8ynAI67qkF1D5rFpHqawFKyJ0
        Y1ip3Kw5AECuz1Wz4mG31feJ/g==
X-Google-Smtp-Source: ABdhPJxxwkBk1LLX9rUTnnMEKW4AA0UWWQGeRBmkSIs6AjPNN93uUfCEPcR6QiXqHXV3t9MDtNakAQ==
X-Received: by 2002:a2e:9048:0:b0:246:1988:3105 with SMTP id n8-20020a2e9048000000b0024619883105mr19507617ljg.404.1645610414892;
        Wed, 23 Feb 2022 02:00:14 -0800 (PST)
Received: from [192.168.43.7] ([94.25.228.217])
        by smtp.gmail.com with ESMTPSA id s5sm1618518lfr.55.2022.02.23.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 02:00:14 -0800 (PST)
Message-ID: <a065a843-e7c3-a75b-aa8e-d4b264146df0@linaro.org>
Date:   Wed, 23 Feb 2022 13:00:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm: Avoid dirtyfb stalls on video mode displays
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Mark Yacoub <markyacoub@google.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        David Heidelberg <david@ixit.cz>, Xu Wang <vulab@iscas.ac.cn>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20220219193957.577054-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220219193957.577054-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/02/2022 22:39, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Someone on IRC once asked an innocent enough sounding question:  Why
> with xf86-video-modesetting is es2gears limited at 120fps.
> 
> So I broke out the perfetto tracing mesa MR and took a look.  It turns
> out the problem was drm_atomic_helper_dirtyfb(), which would end up
> waiting for vblank.. es2gears would rapidly push two frames to Xorg,
> which would blit them to screen and in idle hook (I assume) call the
> DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
> dirty rects, which would stall until the next vblank.  And then the
> whole process would repeat.
> 
> But this is a bit silly, we only need dirtyfb for command mode DSI
> panels.  So lets just skip it otherwise.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 13 +++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  9 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  1 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c |  9 ++++
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  1 +
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h  |  1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c |  8 +++
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h  |  1 +
>   drivers/gpu/drm/msm/msm_fb.c              | 64 ++++++++++++++++++++++-
>   drivers/gpu/drm/msm/msm_kms.h             |  2 +
>   11 files changed, 109 insertions(+), 1 deletion(-)
> 

I have checked your previous dirtyfb patch (and corresponding discussion).

I'm not fond of the idea of acquiring locks, computing the value, then 
releasing the locks and reacquiring the locks again. I understand the 
original needs_dirtyfb approach was frowned upon. Do we have a chance of 
introducing drm_atomic_helper_dirtyfb_unlocked()? Which would perform 
all the steps of the orignal helper, but without locks acquirement (and 
state allocation/freeing)?

[skipped]

> diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
> index 4d34df5354e0..1b0648baeae2 100644
> --- a/drivers/gpu/drm/msm/msm_fb.c
> +++ b/drivers/gpu/drm/msm/msm_fb.c
> @@ -24,10 +24,72 @@ struct msm_framebuffer {
>   static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
>   		const struct drm_mode_fb_cmd2 *mode_cmd, struct drm_gem_object **bos);
>   
> +static int msm_framebuffer_dirtyfb(struct drm_framebuffer *fb,
> +				   struct drm_file *file_priv, unsigned int flags,
> +				   unsigned int color, struct drm_clip_rect *clips,
> +				   unsigned int num_clips)
> +{
> +	struct msm_drm_private *priv = fb->dev->dev_private;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_plane *plane;
> +	bool needs_flush = false;
> +	int ret = 0;
> +
> +	/*
> +	 * When called from ioctl, we are interruptible, but not when called
> +	 * internally (ie. defio worker)
> +	 */
> +	drm_modeset_acquire_init(&ctx,
> +		file_priv ? DRM_MODESET_ACQUIRE_INTERRUPTIBLE : 0);
> +
> +retry:
> +	drm_for_each_plane(plane, fb->dev) {
> +		struct drm_plane_state *plane_state;
> +		struct drm_crtc *crtc;
> +
> +		ret = drm_modeset_lock(&plane->mutex, &ctx);
> +		if (ret)
> +			goto out;
> +
> +		if (plane->state->fb != fb) {
> +			drm_modeset_unlock(&plane->mutex);
> +			continue;
> +		}
> +
> +		crtc = plane->state->crtc;
> +
> +		ret = drm_modeset_lock(&crtc->mutex, &ctx);
> +		if (ret)
> +			goto out;
> +
> +		if (priv->kms->funcs->needs_dirtyfb(crtc)) {
> +			needs_flush = true;
> +			break;
> +		}
> +	}
> +
> +out:
> +	if (ret == -EDEADLK) {
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +
> +	if (needs_flush) {

This bit triggers my paranoia. The driver computes the value with the 
locks being held and then performs some action depending on the computed 
value after releasing the locks.

I'd prefer to acquire modesetting locks for all the planes (and allocate 
atomic state), check if the dirtyfb processing is needed, then call 
drm_atomic_helper_dirtyfb_unlocked() withith the same locks section.

> +		ret = drm_atomic_helper_dirtyfb(fb, file_priv, flags,
> +						color, clips, num_clips);
> +	}
> +
> +	return ret;
> +}
> +
>   static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
>   	.create_handle = drm_gem_fb_create_handle,
>   	.destroy = drm_gem_fb_destroy,
> -	.dirty = drm_atomic_helper_dirtyfb,
> +	.dirty = msm_framebuffer_dirtyfb,
>   };
>   
>   #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 2a4f0526cb98..eb870d499d1e 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -117,6 +117,8 @@ struct msm_kms_funcs {
>   			struct drm_encoder *encoder,
>   			struct drm_encoder *slave_encoder,
>   			bool is_cmd_mode);
> +	bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> +
>   	/* cleanup: */
>   	void (*destroy)(struct msm_kms *kms);
>   


-- 
With best wishes
Dmitry
