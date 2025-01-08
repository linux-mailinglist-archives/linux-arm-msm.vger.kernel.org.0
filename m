Return-Path: <linux-arm-msm+bounces-44441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CFA06477
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 19:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79663167061
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 18:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D852E201116;
	Wed,  8 Jan 2025 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIXV0my8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C452010F6
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 18:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736361154; cv=none; b=ksmNMDIEt0LKZgf/OcpdrMFVfqgb4pR0IziKHuZ/sc9VT+hC526MSqqb36ad3fiGruMnmrgmXhhJ4FgXOFZjIJU5oGthbmiwBZEIhQSVcRxBseJmwrLBnu5fl5qHOjHO1+WCchZUDz2iIu+Ge6qjLZTZoK0VXDWUTNEB1z8uK2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736361154; c=relaxed/simple;
	bh=M2jWAJjArY291ieHg14u/U6bneQRiAZOTDAYXroDIGs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYa7jkq1zAywUGGcYdoZ8ixhFNEmV1ASjbt0tJYxq34PiXL/BLHERcZ/CUxRDURVQ89sGfjfA4gtRfRnZnZ1tMiTBO7iiwNWOQLqM9KeUzOq5VqcbkauzzHerAGiMxReksoi2dvWFFPpvpYexOKvUfnoTrmjP2PDbr4o0H2gg9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIXV0my8; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-305d840926fso31717091fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736361149; x=1736965949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0T+0mL7iv46IwFlcF+LpDNgC3tlPvqLC5ee3E8FWwhI=;
        b=yIXV0my8oC7cXOV/WDOhURN2VvPdXmuZCgDSjoWme/pBHHqbTMaYmcvpTRo6HGL2CV
         ZHwuijdsaasOblGyLgdkTWdA8YswcMym+/3gvfnLzOsRXvyYX9IL0sw5UP7QL3ZPihm7
         L6IR1icZQ1Cv0SU2OJe+Uvqd8+fRqNSP/9w4slTtf5V1JZ+RUSExrmvAcueCxfZnaGHl
         NXM+PB2OsPxnG3oPLHjQxVQXDXoJxNeOfjPyx/uxgAHk0OdKfazNn1JX481iTAMhjwSe
         xoLvRplvn2E+cen46+n5C1WhBHagZuSvCHYsXR/wEAD7GwHOVbn6EZhv95JjeO8KqF/M
         UOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361149; x=1736965949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0T+0mL7iv46IwFlcF+LpDNgC3tlPvqLC5ee3E8FWwhI=;
        b=wj3SaBmVrz1KlwOEXm2A9xQ55kpSEuZ3M6xl5fcdGWKk8VGbzHRuCcfkcb7RIkWjjp
         CTha+WmFaQPd3hHWNErtj/UMRIEBWi1/byjbbxEGdUk93qlfYGfOkHtJ8h+LTV1x9rua
         JKeJV4jMelPlIxKBYbz0pH7kwxSjBszH8XmORLE8Jn/SCZD8MQJEuxGBjXRMLAUyw7Hy
         MsaAg1p1OqGg08Xjce5esgGlnufeB3qmrR/oBfeKaKkcrtEQJEBCfC3a3J3h/tgUu59+
         Y3egOwpb8swfuh9F9zCF1wpyzuSOWMUAtmQqREu6mW1h3koeGaDL/iciaW1V/AdqS27X
         xO2A==
X-Forwarded-Encrypted: i=1; AJvYcCUYEgs7FcZB1FEN1jNSKDT8G8E1IUHRcwmu+FWgngU/VXgaa7LxqXFwscW9lrdDsG/8etvdEBgcuvod+Vsp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs1YjcYUxhgpvxY3oyO8EjYUJ5S2br69vN9VknvWJFwj0zkUtg
	2m3HKR6PB68w0LcS0B83rNEShyYhPxsyYhi/5QMicBK5+m9jpBZeawjLTbbsozc=
X-Gm-Gg: ASbGncvOGNLl4ttfThWHjA2W8hyB9kSfKo++uPgAQ/b4NUxLEO6yHBvqZd3pDK9mxem
	qAtSknYaJXL+zRyBq3Clk4F+Xkqc9oeCEKweB8GNTG5kQOsIZJwJVysHxH7Zw2TdIADQnQcqGw6
	FxiZaV21YGNnREaYhnetsaxxGATaFbBko0OWlzu+ol5vZcM9SF/eoFjsj7uY1AZjMQBu1N5olXP
	FXAFEDuokh1CW9UKe8TYPyf7Jbi/2QF5wG8b0AMKlSuju4/UMNpwwiNiJmkc0XbXzr2SpasVQtF
	ENYGQw9tcZDAyNWcP4IBuGVtKK6clgq77ofU
X-Google-Smtp-Source: AGHT+IG1xpbnZieMEXVc7bFuqI0b6Whc2XStjuLNuTmGUWrDF/JGwR78uXx5jK01HIrhoMocaKNhAQ==
X-Received: by 2002:a05:651c:556:b0:302:3356:7c55 with SMTP id 38308e7fff4ca-305f454741fmr8733161fa.10.1736361149182;
        Wed, 08 Jan 2025 10:32:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b06a467sm63142631fa.90.2025.01.08.10.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:32:27 -0800 (PST)
Date: Wed, 8 Jan 2025 20:32:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Chandan Uddaraju <chandanu@codeaurora.org>, 
	Jeykumar Sankaran <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, 
	Sravanthi Kollukuduru <skolluku@codeaurora.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
Message-ID: <qiqmaotvdfnq66oth6eqcun5n7stmfyw7zyyjxxlh72gst722a@t6zb764t2ttz>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
 <Z367rzpzt00F0sK9@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z367rzpzt00F0sK9@phenom.ffwll.local>

On Wed, Jan 08, 2025 at 06:53:51PM +0100, Simona Vetter wrote:
> On Sun, Dec 22, 2024 at 07:00:42AM +0200, Dmitry Baryshkov wrote:
> > Some drivers might fail to follow the restrictions documented for
> > drm_atomic_helper_check_modesets(). In order to catch such an issues,
> > add the drm_atomic_state->dirty_needs_modeset field and check it in
> > drm_atomic_check_only(). Make sure that neither of atomic_check()
> > callbacks can set that field without calling
> > drm_atomic_helper_check_modesets() again.
> > 
> > Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Thanks a lot of creating this patch. But looking at it I'm not so sure I
> actually had a good idea, since there's still lots of ways for drivers to
> change drm_atomic_crtc_needs_modeset() that we miss. And trying to use an
> inverted bitfield of all crtc that we've run through in check_modeset, and
> then in atomic_check_only compare it against all crtc that need a modeset
> also has corner cases it gets wrong I think, like just not using the
> helpers in specific case, I think something like i915's fastset would trip
> that.

I think we should try to get something merged. I mean, the documentation
was there, but it didn't prevent driver authors from being creative, as
you wrote. So, having false negatives should be fine. We just have not
to trigger false warning reports. I will try giving it another tought.

> 
> Plus there's lots more corners that drivers have gotten creatively wrong,
> so I feel like really clear docs is the best we can do.
> 
> So unless you think it was really useful to fix msm I feel like best to
> skip this. Apologies for making you put work in here :-/

I think it's useful to prevent us (authors) from doing nasty things :-/

> -Sima
> 
> > ---
> >  drivers/gpu/drm/drm_atomic.c        |  3 ++
> >  drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
> >  include/drm/drm_atomic.h            | 10 +++++
> >  3 files changed, 82 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >  		}
> >  	}
> >  
> > +	WARN_RATELIMIT(state->dirty_needs_modeset,
> > +		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
> > +

Maybe it should be drm_warn or drm_info for now, instead of full WARN().

> >  	if (!state->allow_modeset) {
> >  		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> >  			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
> >  
> >  	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
> >  		const struct drm_encoder_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  		struct drm_encoder *encoder;
> >  		struct drm_bridge *bridge;
> >  
> > @@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
> >  		encoder = new_conn_state->best_encoder;
> >  		funcs = encoder->helper_private;
> >  
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		bridge = drm_bridge_chain_get_first_bridge(encoder);
> >  		ret = drm_atomic_bridge_chain_check(bridge,
> >  						    new_crtc_state,
> > @@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
> >  				return -EINVAL;
> >  			}
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> > @@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
> >  	return 0;
> >  }
> >  
> > +static int
> > +connector_atomic_check(struct drm_atomic_state *state,
> > +		       struct drm_connector *connector,
> > +		       struct drm_connector_state *old_connector_state,
> > +		       struct drm_connector_state *new_connector_state)
> > +{
> > +	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > +	struct drm_crtc_state *new_crtc_state;
> > +	bool old_needs_modeset = false;
> > +	int ret;
> > +
> > +	if (new_connector_state->crtc)
> > +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
> > +	if (new_crtc_state)
> > +		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +	if (funcs->atomic_check)
> > +		ret = funcs->atomic_check(connector, state);
> > +	else
> > +		ret = 0;
> > +
> > +	if (new_crtc_state) {
> > +		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> >  /**
> >   * drm_atomic_helper_check_modeset - validate state object for modeset changes
> >   * @dev: DRM device
> > @@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  	int i, ret;
> >  	unsigned int connectors_mask = 0, user_connectors_mask = 0;
> >  
> > +	state->dirty_needs_modeset = false;
> > +
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
> >  		user_connectors_mask |= BIT(i);
> >  
> > @@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  		return ret;
> >  
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> > -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > -
> >  		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> >  
> >  		/*
> > @@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  				new_crtc_state->connectors_changed = true;
> >  		}
> >  
> > -		if (funcs->atomic_check)
> > -			ret = funcs->atomic_check(connector, state);
> > +		ret = connector_atomic_check(state, connector,
> > +					     old_connector_state, new_connector_state);
> >  		if (ret) {
> >  			drm_dbg_atomic(dev,
> >  				       "[CONNECTOR:%d:%s] driver check failed\n",
> > @@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  	 * has been called on them when a modeset is forced.
> >  	 */
> >  	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
> > -		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
> > -
> >  		if (connectors_mask & BIT(i))
> >  			continue;
> >  
> > -		if (funcs->atomic_check)
> > -			ret = funcs->atomic_check(connector, state);
> > +		ret = connector_atomic_check(state, connector,
> > +					     old_connector_state, new_connector_state);
> >  		if (ret) {
> >  			drm_dbg_atomic(dev,
> >  				       "[CONNECTOR:%d:%s] driver check failed\n",
> > @@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  
> >  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >  		const struct drm_plane_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  
> >  		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
> >  
> > @@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  		if (!funcs || !funcs->atomic_check)
> >  			continue;
> >  
> > +		if (new_plane_state->crtc)
> > +			new_crtc_state = drm_atomic_get_new_crtc_state(state,
> > +								       new_plane_state->crtc);
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		ret = funcs->atomic_check(plane, state);
> >  		if (ret) {
> >  			drm_dbg_atomic(plane->dev,
> > @@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  				       plane->base.id, plane->name);
> >  			return ret;
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> >  		const struct drm_crtc_helper_funcs *funcs;
> > +		bool old_needs_modeset = false;
> >  
> >  		funcs = crtc->helper_private;
> >  
> >  		if (!funcs || !funcs->atomic_check)
> >  			continue;
> >  
> > +		if (new_crtc_state)
> > +			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> >  		ret = funcs->atomic_check(crtc, state);
> >  		if (ret) {
> >  			drm_dbg_atomic(crtc->dev,
> > @@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  				       crtc->base.id, crtc->name);
> >  			return ret;
> >  		}
> > +
> > +		if (new_crtc_state) {
> > +			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
> > +
> > +			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
> > +		}
> >  	}
> >  
> >  	return ret;
> > diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> > index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
> > --- a/include/drm/drm_atomic.h
> > +++ b/include/drm/drm_atomic.h
> > @@ -408,6 +408,16 @@ struct drm_atomic_state {
> >  	 */
> >  	bool duplicated : 1;
> >  
> > +	/**
> > +	 * @dirty_needs_modeset:
> > +	 *
> > +	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
> > +	 * unexpected way. Usually this means that driver implements atomic
> > +	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
> > +	 * toggled by one of its atomic_check() callbacks.
> > +	 */
> > +	bool dirty_needs_modeset : 1;
> > +
> >  	/**
> >  	 * @planes:
> >  	 *
> > 
> > -- 
> > 2.39.5
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
With best wishes
Dmitry

