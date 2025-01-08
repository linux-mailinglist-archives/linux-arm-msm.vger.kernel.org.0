Return-Path: <linux-arm-msm+bounces-44438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C96A063C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:54:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E896F16719C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B9A2010F6;
	Wed,  8 Jan 2025 17:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="BJ1gloSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA75220102C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 17:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736358837; cv=none; b=lfR1pRYzaAYtoW86ASFgm7hlFto7H1/P0fVP64cTR2ZjVhYRlwUNdPkSX4i/E+YwcfNFwsjkQT1L51fEf+Jl3CzTqbUn6EWLxaEA/Y/95wB+Uo8l3KYPu3uzlmJUZ8GL8sJKR1QfZliAJ9bn4FTabK6bsP7KilU1Cn6OQckUZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736358837; c=relaxed/simple;
	bh=gKnCJmsyWtVRMIJBDmJZPW0P0SLqfx+E2xEg2fiObik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIfBCtyWyLyJT4BbcCCmRHqA10L56ScexvEkXKTajXuvw5LylO4TAkGYeE6DHctNdJ8uPhodh4HwF9jA0ctotkNKi9VlM9kF9XVmU1NN2dL145UP6C98G/4fwkjMRm0SFVjKAeksiwhtESLaUVZWfvjDQAvqMXDvjkfaKsodxSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=BJ1gloSY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385ddcfc97bso51405f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 09:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1736358834; x=1736963634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmdWrs2jHDEmmEMkasPJyPoJ7fSCFbpJIamlNm9Sk5M=;
        b=BJ1gloSYyM6E+aDyMSZRSLCCvOLQp5VjUPblQJI4IdIbIk260p47eimwsnFhkiztq9
         Tdn+FwQxo8dHcpJM7qHZ7QvsdfqSthMiwOKVEbf/TjBl0KJhPo1RuRPfj8keI+lLgvMs
         +1doMDFLwFyJzxyDOtwIHxH2HxEkOOnyiH8mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358834; x=1736963634;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmdWrs2jHDEmmEMkasPJyPoJ7fSCFbpJIamlNm9Sk5M=;
        b=QkCD/8B0XPFuxBbqXoI+Xr7XPE4qFP+Axo0B3WiAw1ilK8MnU29N1i4blLJ+U9nhq2
         I7Z1H39i+n6L8x+ZRAPrMKgk/myagOaEUK0Cv1jZkB6w+dlgL79XzjiNkk7DwmZFAE4k
         vWz66BintjSwmm1q1a52RuZ2x81iXnqR0GCrwPmAHcbFfU36DKXjCRF+VCjUOfplOaUo
         s2UxbrJRKxKu9ri7ZBiFLGu2+yuXBzsmW+gVLQYU6JbglNE+Xc2um022nb+0jsYTpRcM
         FMvEcRIrl9LewfNQYN0DBEeEyofRnWWMSC7gBMiT33oZbyPcu8YQcJH3tF67o1yqqOHl
         Y2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7TNr+uJNIfbUEYNJBMvonvzQz8paJ3W/m8gbknwxtuIY1km0A9fOUtQl9bK3BV10nQ70B9R68+BNqLkeh@vger.kernel.org
X-Gm-Message-State: AOJu0YwuvTqOhqbn2akeKI+6+hJ/v5k4990g4W3G33rx3s7S182/QuGJ
	42DwVgDd7pJU06ZtlLNP+VBXMDZ/YetAxr1zJbx4LQAa5PWeCP6g+va4f0kpcm4=
X-Gm-Gg: ASbGnct3r9xv9jV02PyrSqVmNp+5ozXyiZSIlD8SDDMMsAqG7UFpcKHG+b85ZcDHUOH
	5KJEo7WbA/clQD9RoE/1v/YpxkE7a7MJYjhqe/8rzporoiJc7l1oUCFFODKGPKf5KoCcfe9jzz+
	9h0jLCTgie+vxVJXPYT34jYYqASyGeKSoyva+M3jD/V8dcsrLKkGsLsYiwZWN1doIb/2ItvplWu
	0rD6lYhBcIo+VhHd2lrmE1vF7IUTFPc/S3TGM8fhxiDcg9Fn/bcLgomZ/HE8tszTXim
X-Google-Smtp-Source: AGHT+IESGumvopPHwdo16lhCKZSlZSATyddXlTtzfFDd2Vbs39HCO1l7Kd+MplsNzinHv34TBxZd3w==
X-Received: by 2002:a05:6000:4b04:b0:386:4a24:1916 with SMTP id ffacd0b85a97d-38a87317c6dmr2835622f8f.55.1736358833954;
        Wed, 08 Jan 2025 09:53:53 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84705esm53745644f8f.44.2025.01.08.09.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 09:53:53 -0800 (PST)
Date: Wed, 8 Jan 2025 18:53:51 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
Message-ID: <Z367rzpzt00F0sK9@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Chandan Uddaraju <chandanu@codeaurora.org>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Sravanthi Kollukuduru <skolluku@codeaurora.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Archit Taneja <architt@codeaurora.org>,
	Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
X-Operating-System: Linux phenom 6.12.3-amd64 

On Sun, Dec 22, 2024 at 07:00:42AM +0200, Dmitry Baryshkov wrote:
> Some drivers might fail to follow the restrictions documented for
> drm_atomic_helper_check_modesets(). In order to catch such an issues,
> add the drm_atomic_state->dirty_needs_modeset field and check it in
> drm_atomic_check_only(). Make sure that neither of atomic_check()
> callbacks can set that field without calling
> drm_atomic_helper_check_modesets() again.
> 
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot of creating this patch. But looking at it I'm not so sure I
actually had a good idea, since there's still lots of ways for drivers to
change drm_atomic_crtc_needs_modeset() that we miss. And trying to use an
inverted bitfield of all crtc that we've run through in check_modeset, and
then in atomic_check_only compare it against all crtc that need a modeset
also has corner cases it gets wrong I think, like just not using the
helpers in specific case, I think something like i915's fastset would trip
that.

Plus there's lots more corners that drivers have gotten creatively wrong,
so I feel like really clear docs is the best we can do.

So unless you think it was really useful to fix msm I feel like best to
skip this. Apologies for making you put work in here :-/
-Sima

> ---
>  drivers/gpu/drm/drm_atomic.c        |  3 ++
>  drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
>  include/drm/drm_atomic.h            | 10 +++++
>  3 files changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
>  		}
>  	}
>  
> +	WARN_RATELIMIT(state->dirty_needs_modeset,
> +		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
> +
>  	if (!state->allow_modeset) {
>  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
>  
>  	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
>  		const struct drm_encoder_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  		struct drm_encoder *encoder;
>  		struct drm_bridge *bridge;
>  
> @@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
>  		encoder = new_conn_state->best_encoder;
>  		funcs = encoder->helper_private;
>  
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		bridge = drm_bridge_chain_get_first_bridge(encoder);
>  		ret = drm_atomic_bridge_chain_check(bridge,
>  						    new_crtc_state,
> @@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
>  				return -EINVAL;
>  			}
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> @@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
>  	return 0;
>  }
>  
> +static int
> +connector_atomic_check(struct drm_atomic_state *state,
> +		       struct drm_connector *connector,
> +		       struct drm_connector_state *old_connector_state,
> +		       struct drm_connector_state *new_connector_state)
> +{
> +	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> +	struct drm_crtc_state *new_crtc_state;
> +	bool old_needs_modeset = false;
> +	int ret;
> +
> +	if (new_connector_state->crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
> +	if (new_crtc_state)
> +		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +	if (funcs->atomic_check)
> +		ret = funcs->atomic_check(connector, state);
> +	else
> +		ret = 0;
> +
> +	if (new_crtc_state) {
> +		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_atomic_helper_check_modeset - validate state object for modeset changes
>   * @dev: DRM device
> @@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  	int i, ret;
>  	unsigned int connectors_mask = 0, user_connectors_mask = 0;
>  
> +	state->dirty_needs_modeset = false;
> +
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
>  		user_connectors_mask |= BIT(i);
>  
> @@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		return ret;
>  
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> -
>  		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>  
>  		/*
> @@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				new_crtc_state->connectors_changed = true;
>  		}
>  
> -		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, state);
> +		ret = connector_atomic_check(state, connector,
> +					     old_connector_state, new_connector_state);
>  		if (ret) {
>  			drm_dbg_atomic(dev,
>  				       "[CONNECTOR:%d:%s] driver check failed\n",
> @@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  	 * has been called on them when a modeset is forced.
>  	 */
>  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> -
>  		if (connectors_mask & BIT(i))
>  			continue;
>  
> -		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, state);
> +		ret = connector_atomic_check(state, connector,
> +					     old_connector_state, new_connector_state);
>  		if (ret) {
>  			drm_dbg_atomic(dev,
>  				       "[CONNECTOR:%d:%s] driver check failed\n",
> @@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
>  		const struct drm_plane_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  
>  		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
>  
> @@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  		if (!funcs || !funcs->atomic_check)
>  			continue;
>  
> +		if (new_plane_state->crtc)
> +			new_crtc_state = drm_atomic_get_new_crtc_state(state,
> +								       new_plane_state->crtc);
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		ret = funcs->atomic_check(plane, state);
>  		if (ret) {
>  			drm_dbg_atomic(plane->dev,
> @@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  				       plane->base.id, plane->name);
>  			return ret;
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
> +		bool old_needs_modeset = false;
>  
>  		funcs = crtc->helper_private;
>  
>  		if (!funcs || !funcs->atomic_check)
>  			continue;
>  
> +		if (new_crtc_state)
> +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
>  		ret = funcs->atomic_check(crtc, state);
>  		if (ret) {
>  			drm_dbg_atomic(crtc->dev,
> @@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  				       crtc->base.id, crtc->name);
>  			return ret;
>  		}
> +
> +		if (new_crtc_state) {
> +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> +
> +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> +		}
>  	}
>  
>  	return ret;
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -408,6 +408,16 @@ struct drm_atomic_state {
>  	 */
>  	bool duplicated : 1;
>  
> +	/**
> +	 * @dirty_needs_modeset:
> +	 *
> +	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
> +	 * unexpected way. Usually this means that driver implements atomic
> +	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
> +	 * toggled by one of its atomic_check() callbacks.
> +	 */
> +	bool dirty_needs_modeset : 1;
> +
>  	/**
>  	 * @planes:
>  	 *
> 
> -- 
> 2.39.5
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

