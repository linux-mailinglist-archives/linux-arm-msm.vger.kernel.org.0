Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26EC8A1AA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 15:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfH2NEj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 09:04:39 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:35183 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726985AbfH2NEj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 09:04:39 -0400
Received: by mail-yw1-f67.google.com with SMTP id g19so1106476ywe.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 06:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jbt8QVuKSyj/sWQ72n57ax07Z6OSVIi5b7yOSbu/iaA=;
        b=cnNhSiUI5Y8Aorow788RFQl6zZ3NHK14DJ8y8HvjApt1P5EMwS0HUx4q/gfDtXDqNw
         lkpAaomVKvQ1tcAUf+q77rRaPCJJZKV/0rGryQWXskP/OBBCDrY+Nd89tqoxenRGQqLR
         yDn9TS/LcOz3pYNOQcO9sObX7Rtc/YPSDIb6C6/IVjel/dSqJ9mGJzedqjbb9OL+N6+o
         SrFnm9Wq9BsLPzjIrxBbiMAyTDAms2dmvCeJer+1LnLbxkChyf8x3Up7RNh1a69dGqu/
         O67aNQa3bDPxRASG7Bt2kbInLkEp12AVR2/+iXvwpQGG27M+FzdcWE7hB6+M5znGCUsz
         WNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jbt8QVuKSyj/sWQ72n57ax07Z6OSVIi5b7yOSbu/iaA=;
        b=cfrcrKSzLxO6a1o4Tu5C+ubsSdj2inB6OVVjiUKpMyZm6Og+vVIvjdbqrAuB8dB9F9
         PwRS3OCyz78cuanw6wSiKIVZP97tns1xAXU0mJlLIwO9elmIQyHe1Twxwwniija0WxJE
         XgkgHkEFq0SC6fL8LMutBq5i1N2JP88tXpuTT/9i10BMJZoUWRp54+ozyfTK5wWrPxUa
         vUFL1C6m0Ex5Qz9xmAQsoFsiyZbCneCJMaOuDmnjHIk+esZb5PTGvEsDgGOUaOFpnctk
         S8DSbH9bRE2iZV//HJTEiFIw9dOeviqm4gmulCCvlJUTDmEQAPQBIvkgHXT6z5T2s7nR
         ZDLw==
X-Gm-Message-State: APjAAAVtuiXXk7xUkBH81K9pNH+W2pJwKVipjSYnex5W1Wvi4obW9xoz
        u+eTXSwDDeNl9JCLOJsn1WCoUg==
X-Google-Smtp-Source: APXvYqxlv5dMHxddcEVgVm1vPth9+XsALvqjG1C8iU2wgMSOIhQ7CLZvCEH1dw0B9q1yyV85VcTGUQ==
X-Received: by 2002:a81:a6c1:: with SMTP id d184mr6487059ywh.468.1567083878220;
        Thu, 29 Aug 2019 06:04:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d195sm450214ywb.101.2019.08.29.06.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 06:04:36 -0700 (PDT)
Date:   Thu, 29 Aug 2019 09:04:33 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Enrico Weigelt <info@metux.net>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/9] drm/msm: add kms->wait_flush()
Message-ID: <20190829130433.GE218215@art_vandelay>
References: <20190827213421.21917-1-robdclark@gmail.com>
 <20190827213421.21917-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827213421.21917-5-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 27, 2019 at 02:33:34PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> First step in re-working the atomic related internal API to prepare for
> async updates pending.. ->wait_flush() is intended to block until there
> is no in-progress flush.
> 
> A crtc_mask is used, rather than an atomic state object, as this will
> later be used for async flush after the atomic state is destroyed.
> 
> This replaces ->wait_for_crtc_commit_done()
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Hi Rob,
A few nits below, but lgtm overall


> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 11 ++++++-
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 17 ++++++----
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 17 ++++++----
>  drivers/gpu/drm/msm/msm_atomic.c         | 42 ++++++++++--------------
>  drivers/gpu/drm/msm/msm_kms.h            |  9 +++--
>  5 files changed, 54 insertions(+), 42 deletions(-)
> 

/snip

> index e5aae1645933..639cc88c31a1 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -10,28 +10,6 @@
>  #include "msm_gem.h"
>  #include "msm_kms.h"
>  
> -static void msm_atomic_wait_for_commit_done(struct drm_device *dev,
> -		struct drm_atomic_state *old_state)
> -{
> -	struct drm_crtc *crtc;
> -	struct drm_crtc_state *new_crtc_state;
> -	struct msm_drm_private *priv = old_state->dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -	int i;
> -
> -	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i) {
> -		if (!new_crtc_state->active)
> -			continue;
> -
> -		if (drm_crtc_vblank_get(crtc))
> -			continue;
> -
> -		kms->funcs->wait_for_crtc_commit_done(kms, crtc);
> -
> -		drm_crtc_vblank_put(crtc);
> -	}
> -}
> -
>  int msm_atomic_prepare_fb(struct drm_plane *plane,
>  			  struct drm_plane_state *new_state)
>  {
> @@ -51,11 +29,28 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
>  	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
>  }
>  
> +/* Get bitmask of crtcs that will need to be flushed.  The bitmask
> + * can be used with for_each_crtc_mask() iterator, to iterate
> + * effected crtcs without needing to preserve the atomic state.
> + */
> +static unsigned get_crtc_mask(struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state;
> +	struct drm_crtc *crtc;
> +	unsigned i, mask = 0;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> +		mask |= BIT(crtc->index);

mask |= drm_crtc_mask(crtc);

> +
> +	return mask;
> +}
> +
>  void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  {
>  	struct drm_device *dev = state->dev;
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct msm_kms *kms = priv->kms;
> +	unsigned crtc_mask = get_crtc_mask(state);
>  
>  	kms->funcs->prepare_commit(kms, state);
>  
> @@ -70,8 +65,7 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>  		kms->funcs->commit(kms, state);
>  	}
>  
> -	msm_atomic_wait_for_commit_done(dev, state);
> -
> +	kms->funcs->wait_flush(kms, crtc_mask);
>  	kms->funcs->complete_commit(kms, state);
>  
>  	drm_atomic_helper_commit_hw_done(state);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index c7588a42635e..8562bbfd5dca 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -34,9 +34,8 @@ struct msm_kms_funcs {
>  	void (*prepare_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
>  	void (*commit)(struct msm_kms *kms, struct drm_atomic_state *state);
>  	void (*complete_commit)(struct msm_kms *kms, struct drm_atomic_state *state);
> -	/* functions to wait for atomic commit completed on each CRTC */
> -	void (*wait_for_crtc_commit_done)(struct msm_kms *kms,
> -					struct drm_crtc *crtc);
> +	void (*wait_flush)(struct msm_kms *kms, unsigned crtc_mask);
> +
>  	/* get msm_format w/ optional format modifiers from drm_mode_fb_cmd2 */
>  	const struct msm_format *(*get_format)(struct msm_kms *kms,
>  					const uint32_t format,
> @@ -98,4 +97,8 @@ struct msm_mdss {
>  int mdp5_mdss_init(struct drm_device *dev);
>  int dpu_mdss_init(struct drm_device *dev);
>  
> +#define for_each_crtc_mask(dev, crtc, crtc_mask) \
> +	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head) \

drm_for_each_crtc

> +		for_each_if (BIT((crtc)->index) & (crtc_mask))
> +
>  #endif /* __MSM_KMS_H__ */
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
