Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5921BEC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 22:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfEMUco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 16:32:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46353 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfEMUcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 16:32:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id y11so7788835pfm.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UzVOW4+OtCm98/Ue4nBATFT7n58mc+iYO2oR5TpDKaQ=;
        b=z60ibMFqK837aU0kMc2Ddajt/3OqcFSzX1UIPoUDq8qWWrTOiFXpyJ/1IRpvcwvTa9
         xhdjmqTU6JNpbEZxeh4FBluO9Zf6lV/z/T1Hc1C/ic0sx/o5LsDkBSwpZ7msdo3PELiT
         LzYyqbHzeKuue8Y4NqGNSFVyPcqasONQmj+OfRt1BmrPeCys+mtZty5iBx8XIodOQtaS
         LEbi/3pDC4awXth8ohze0eqU0YVV86sTcwsjW63QA3nAkhCjvOZIWGAkW3maYlrr+BLL
         2A5nv+fcAWz/UTxesDmaQ6fQ5liiC0mUg5Oxw/1KD5Mi0lx/8uoUfQIxgV1KNP5u83M/
         LtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UzVOW4+OtCm98/Ue4nBATFT7n58mc+iYO2oR5TpDKaQ=;
        b=heJZf7fo3GtbTdnrlISNVtNTPSMnAui0XGS1HVwHjydsl8gJ2p737HH5Jse7yzP+D9
         OuoiSrWZDytsEG2+c+wFxB5zioF8tj41XB5zJhm6e9hRDT5HKTRqpjYTsTF2+ZKHPOE7
         2S2d2+vt318Lmc9P0YgzF9xJBQs03EWH1ArqDTnSEyVklpVC8aQwe1f7UYVihguItckA
         oPu7VhD7PkWYjGAEgwywtBWqPcuZbjNtzISAsBwW71k6cGaQ6sLlHwptdXNJ27XSp5/P
         Gy3/ErZ25p3iLh08H8mjcvgHtDuagKHMXzyzmIkpZ61PizCwDLPM0WJp2znxzJZrqSgo
         QOhQ==
X-Gm-Message-State: APjAAAUWXOXCAAYpIgdbSZzevjj9FidU8AMtKyqFcGm+IwB9NExu57U8
        /kCH13hgxV+vId6cExq48AnnSQ==
X-Google-Smtp-Source: APXvYqxJMGs7bxkaprwPMiopGVkKJYFQYtABq0nOE83dF3CaEG82kyxNc3hc/sd7R2gIo9zS+S9jiA==
X-Received: by 2002:a63:fd4a:: with SMTP id m10mr34486700pgj.302.1557779562276;
        Mon, 13 May 2019 13:32:42 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v2sm8332088pgr.2.2019.05.13.13.32.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 13:32:41 -0700 (PDT)
Date:   Mon, 13 May 2019 13:32:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org
Subject: Re: [PATCH v2 1/6] drm: msm: remove resv fields from msm_gem_object
 struct
Message-ID: <20190513203239.GA9527@builder>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <20190509020352.14282-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509020352.14282-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 May 19:03 PDT 2019, Brian Masney wrote:

> The msm_gem_object structure contains resv and _resv fields that are
> no longer needed since the reservation object is now stored on
> drm_gem_object. msm_atomic_prepare_fb() and msm_atomic_prepare_fb()
> both referenced the wrong reservation object, and would lead to an
> attempt to dereference a NULL pointer. Correct those two cases to
> point to the correct reservation object.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Fixes: dd55cf6929e6 ("drm: msm: Switch to use drm_gem_object reservation_object")

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This resolves a NULL-pointer dereference about to show up in v5.2-rc1,
so please pick this up for -rc.

Regards,
Bjorn

> ---
> Patch introduced in v2
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 +---
>  drivers/gpu/drm/msm/msm_atomic.c          | 4 +---
>  drivers/gpu/drm/msm/msm_gem.c             | 3 ---
>  drivers/gpu/drm/msm/msm_gem.h             | 4 ----
>  4 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index da1f727d7495..ce1a555e1f31 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -780,7 +780,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
>  	struct dpu_hw_fmt_layout layout;
>  	struct drm_gem_object *obj;
> -	struct msm_gem_object *msm_obj;
>  	struct dma_fence *fence;
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	int ret;
> @@ -799,8 +798,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
>  	 *       implicit fence and fb prepare by hand here.
>  	 */
>  	obj = msm_framebuffer_bo(new_state->fb, 0);
> -	msm_obj = to_msm_bo(obj);
> -	fence = reservation_object_get_excl_rcu(msm_obj->resv);
> +	fence = reservation_object_get_excl_rcu(obj->resv);
>  	if (fence)
>  		drm_atomic_set_fence_for_plane(new_state, fence);
>  
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index f5b1256e32b6..131c23a267ee 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -49,15 +49,13 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>  	struct msm_drm_private *priv = plane->dev->dev_private;
>  	struct msm_kms *kms = priv->kms;
>  	struct drm_gem_object *obj;
> -	struct msm_gem_object *msm_obj;
>  	struct dma_fence *fence;
>  
>  	if (!new_state->fb)
>  		return 0;
>  
>  	obj = msm_framebuffer_bo(new_state->fb, 0);
> -	msm_obj = to_msm_bo(obj);
> -	fence = reservation_object_get_excl_rcu(msm_obj->resv);
> +	fence = reservation_object_get_excl_rcu(obj->resv);
>  
>  	drm_atomic_set_fence_for_plane(new_state, fence);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 31d5a744d84f..947508e8269d 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -973,9 +973,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
>  	msm_obj->flags = flags;
>  	msm_obj->madv = MSM_MADV_WILLNEED;
>  
> -	if (resv)
> -		msm_obj->base.resv = resv;
> -
>  	INIT_LIST_HEAD(&msm_obj->submit_entry);
>  	INIT_LIST_HEAD(&msm_obj->vmas);
>  
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c5ac781dffee..812d1b1369a5 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -86,10 +86,6 @@ struct msm_gem_object {
>  
>  	struct llist_node freed;
>  
> -	/* normally (resv == &_resv) except for imported bo's */
> -	struct reservation_object *resv;
> -	struct reservation_object _resv;
> -
>  	/* For physically contiguous buffers.  Used when we don't have
>  	 * an IOMMU.  Also used for stolen/splashscreen buffer.
>  	 */
> -- 
> 2.20.1
> 
