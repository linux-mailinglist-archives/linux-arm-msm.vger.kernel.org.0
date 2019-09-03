Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C2BA7506
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2019 22:35:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbfICUfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Sep 2019 16:35:46 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:38889 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbfICUfp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Sep 2019 16:35:45 -0400
Received: by mail-yb1-f193.google.com with SMTP id o18so2640592ybp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 13:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CCmZXDU8hII/oPQEk4xk+sYCKIhOs8ZdjOsuhWBZZxs=;
        b=UTCEIvCWoE+TlZVQBqEF4lIlBw8YlYoZLkmynDhTDFelojh86O2JavJd/pg5va2Cf/
         5RqMg1lEcoQfQrHbh935Ytz22aGN+ssA8bRDSEhkKXf5tY84I0M+2DCBldNlF5triNyc
         lSfF1waAjOtpyrPT0mAQkY8esUS2swUT2dy6tl8QRcSj432zIjPHr6YhnELtt9ni/6Sh
         Ui7hXvmvgUnCgVdIV3JyTqa3qfF0VklVvvNk//L/7pw7Q/RYT9hJ6xfh/J7hiuk/ryig
         CW9ApNiSJX/3YEY8BsCDOrt8pCdIEI6QFxfkEi1rZynhM9fg9U6qcNMLovM/d5KamYeT
         2gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CCmZXDU8hII/oPQEk4xk+sYCKIhOs8ZdjOsuhWBZZxs=;
        b=mOMqgK1fIAmJOCbGV4oZ9FS2q7QujmBZvtwnTetChSZe3+hR0YYJC2h+w2QzXP84YU
         s8Uh96DPbgfDk/35L6jlmC1k4e6kKCPIPJYYnCbGcA41Vnrr9WwDkEX7xKRWDOUSStlr
         /Oc+hYX8jiuzm3OZm5/z+nWyoH327mLb8bew3/D8b/HeIKlkUixs+EqQOsIqWO6jUyeu
         GKA7WYjrs3rNkt8bJVKHkcDDsYp85dCGsCizfncETMCprk6IrVCJ7OmUJSvZP4CDAzNA
         oXIYs6d2ak2TfLQsVrnW2TY03TpOQlkjYyVyXoM2JdSeE9AgQtEAUpplgReR3YwOdo/x
         yRvQ==
X-Gm-Message-State: APjAAAWVZWqYNuMuZHj3g4V3Lhk8E3dNYYxTqXgfJ7syqpq0Ic5xJlZ2
        snDmgIoq9ONgNzCLkoF/aMx9uA==
X-Google-Smtp-Source: APXvYqy8g1mBOb7K1U09k6Ez7iW03mjbA3SdJqinbKJU2xpiBP7jLPxkLAMtEEziXA9IvKK8dpR76w==
X-Received: by 2002:a25:318a:: with SMTP id x132mr25948221ybx.276.1567542944864;
        Tue, 03 Sep 2019 13:35:44 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id u67sm431997ywf.44.2019.09.03.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 13:35:44 -0700 (PDT)
Date:   Tue, 3 Sep 2019 16:35:44 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/10] drm/msm: convert kms->complete_commit() to
 crtc_mask
Message-ID: <20190903203544.GK218215@art_vandelay>
References: <20190829164601.11615-1-robdclark@gmail.com>
 <20190829164601.11615-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829164601.11615-6-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 09:45:13AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Prep work for async commits, in which case this will be called after we
> no longer have the atomic state object.
> 
> This drops some wait_for_vblanks(), but those should be unnecessary, as
> we call this after waiting for flush to complete.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  7 +------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h |  4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 20 ++++----------------
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  8 ++------
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  4 +---
>  drivers/gpu/drm/msm/msm_atomic.c         |  2 +-
>  drivers/gpu/drm/msm/msm_kms.h            |  2 +-
>  7 files changed, 11 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e7354aef9805..31debd31ab8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -389,13 +389,8 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
>  	kthread_queue_work(&priv->event_thread[crtc_id].worker, &fevent->work);
>  }
>  
> -void dpu_crtc_complete_commit(struct drm_crtc *crtc,
> -		struct drm_crtc_state *old_state)
> +void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>  {
> -	if (!crtc || !crtc->state) {
> -		DPU_ERROR("invalid crtc\n");
> -		return;
> -	}
>  	trace_dpu_crtc_complete_commit(DRMID(crtc));
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 10f78459f6c2..5174e86124cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -244,10 +244,8 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc);
>  /**
>   * dpu_crtc_complete_commit - callback signalling completion of current commit
>   * @crtc: Pointer to drm crtc object
> - * @old_state: Pointer to drm crtc old state object
>   */
> -void dpu_crtc_complete_commit(struct drm_crtc *crtc,
> -		struct drm_crtc_state *old_state);
> +void dpu_crtc_complete_commit(struct drm_crtc *crtc);
>  
>  /**
>   * dpu_crtc_init - create a new crtc object
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index df421b986bc3..606815e50625 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -320,27 +320,15 @@ static void dpu_kms_commit(struct msm_kms *kms, struct drm_atomic_state *state)
>  	}
>  }
>  
> -static void dpu_kms_complete_commit(struct msm_kms *kms,
> -		struct drm_atomic_state *old_state)
> +static void dpu_kms_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
> -	struct dpu_kms *dpu_kms;
> -	struct msm_drm_private *priv;
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>  	struct drm_crtc *crtc;
> -	struct drm_crtc_state *old_crtc_state;
> -	int i;
> -
> -	if (!kms || !old_state)
> -		return;
> -	dpu_kms = to_dpu_kms(kms);
> -
> -	if (!dpu_kms->dev || !dpu_kms->dev->dev_private)
> -		return;
> -	priv = dpu_kms->dev->dev_private;
>  
>  	DPU_ATRACE_BEGIN("kms_complete_commit");
>  
> -	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i)
> -		dpu_crtc_complete_commit(crtc, old_crtc_state);
> +	for_each_crtc_mask(dpu_kms->dev, crtc, crtc_mask)
> +		dpu_crtc_complete_commit(crtc);
>  
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 32dcb1d7860c..a6a056df5878 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -116,17 +116,13 @@ static void mdp4_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  		mdp4_crtc_wait_for_commit_done(crtc);
>  }
>  
> -static void mdp4_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
> +static void mdp4_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
> -	int i;
>  	struct drm_crtc *crtc;
> -	struct drm_crtc_state *crtc_state;
> -
> -	drm_atomic_helper_wait_for_vblanks(mdp4_kms->dev, state);
>  
>  	/* see 119ecb7fd */
> -	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +	for_each_crtc_mask(mdp4_kms->dev, crtc, crtc_mask)
>  		drm_crtc_vblank_put(crtc);
>  
>  	mdp4_disable(mdp4_kms);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 440e000c8c3d..7a19526eef50 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -163,14 +163,12 @@ static void mdp5_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  		mdp5_crtc_wait_for_commit_done(crtc);
>  }
>  
> -static void mdp5_complete_commit(struct msm_kms *kms, struct drm_atomic_state *state)
> +static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
>  {
>  	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
>  	struct device *dev = &mdp5_kms->pdev->dev;
>  	struct mdp5_global_state *global_state;
>  
> -	drm_atomic_helper_wait_for_vblanks(mdp5_kms->dev, state);
> -
>  	global_state = mdp5_get_existing_global_state(mdp5_kms);
>  
>  	if (mdp5_kms->smp)
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 4ca4b654c221..bdcc92fbacb3 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -66,7 +66,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  	}
>  
>  	kms->funcs->wait_flush(kms, crtc_mask);
> -	kms->funcs->complete_commit(kms, state);
> +	kms->funcs->complete_commit(kms, crtc_mask);
>  
>  	drm_atomic_helper_commit_hw_done(state);
>  
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index a112dfb36301..10dd171b43f8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -33,7 +33,7 @@ struct msm_kms_funcs {
>  	/* modeset, bracketing atomic_commit(): */
>  	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
>  	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
> -	void (*complete_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
> +	void (*complete_commit)(struct msm_kms *kms, unsigned crtc_mask);
>  	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
>  
>  	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
