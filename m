Return-Path: <linux-arm-msm+bounces-11076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A9855292
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C56211F28F6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CA313475E;
	Wed, 14 Feb 2024 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y4JuY8Zq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4992A127B74
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707936442; cv=none; b=YSqaonh2wu0v6Kic3IeovSCqDPjFYKBx8vZwxOjmVgdEkXFqUsk20MGWFqVoK8AHovnf2hjfjvb5/KjzOIzUE8/0qua65zpnxRtWF/oJs6kWA6ylteRMF2YBfmcb53ZTzWIVYohSbYAj5lYp3RtPmUcZHdL8NNWNabKoWzapfGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707936442; c=relaxed/simple;
	bh=kv9GFhLGcM/tJ0uJ9XtGtdsnS/iKDHwH/idb+LGM6iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqEIRYgcz3QAFHECHKXxQIk2F9RmlqQmlGXEwaRkoz61YLuWiwEbPS+Z0TBQUyGaq003HcY/j028kgTetIOmW3pfaUMpkmpAkhND9LY+ZftFrbBpI1hfMNM21GB6GvMw2zKoaA+yTtQUzQdoPiZSq2U1Ey7JQxhwrMdHtsdAFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y4JuY8Zq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707936440; x=1739472440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kv9GFhLGcM/tJ0uJ9XtGtdsnS/iKDHwH/idb+LGM6iU=;
  b=Y4JuY8ZqqN58t8zlxRQbR4MBeZwXCoDMSODqOi5Wnf+4w9GEW7eLi4gZ
   6zIHw69FfYNs3IwUzJ1l3P9fsQ8hp0z6z7REwt9nLNotcMHcM6AeXjLVU
   pt6UQy2XkAaTnN5HNKk+UGNnLrxA1gqszsb0kap+KOp2ZNBgvF+RfmCt6
   4wCKJsEL4pi+261iE4Cg+dIIbGRlbZ+aDYrPttF6I4nVqHRRbaJoxBtOL
   Z55yS7D4Sh1Oqz+GVPPj2zSDs8hjZYRjztE9a1a+2Ma5wqC6jbrZprumL
   CyPei8fXBpxSty/+jCE45JTncVmKTefKiLsTlfjLFCQlSNuMQiQB3yIpk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1874243"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1874243"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 10:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369713"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="826369713"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:47:14 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 14 Feb 2024 20:47:13 +0200
Date: Wed, 14 Feb 2024 20:47:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Message-ID: <Zc0KsfrI57XL7Efk@intel.com>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
 <Zc0ITrmhQ8CWMXMq@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zc0ITrmhQ8CWMXMq@intel.com>
X-Patchwork-Hint: comment

On Wed, Feb 14, 2024 at 08:37:02PM +0200, Ville Syrj�l� wrote:
> On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> > The helper drm_atomic_helper_check_plane_state() runs several checks on
> > plane src and dst rectangles, including the check whether required
> > scaling fits into the required margins. The msm driver would benefit
> > from having a function that does all these checks except the scaling
> > one. Split them into a new helper called
> > drm_atomic_helper_check_plane_noscale().
> 
> What's the point in eliminating a nop scaling check?

Actually, what are you even doing in there? Are you saying that
the hardware has absolutely no limits on how much it can scale
in either direction?

> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 110 ++++++++++++++++++++++------
> >  include/drm/drm_atomic_helper.h     |   7 ++
> >  2 files changed, 96 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 292e38eb6218..2d7dd66181c9 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> >  EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> >  
> >  /**
> > - * drm_atomic_helper_check_plane_state() - Check plane state for validity
> > + * drm_atomic_helper_check_plane_noscale() - Check plane state for validity
> >   * @plane_state: plane state to check
> >   * @crtc_state: CRTC state to check
> > - * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> > - * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> >   * @can_position: is it legal to position the plane such that it
> >   *                doesn't cover the entire CRTC?  This will generally
> >   *                only be false for primary planes.
> > @@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> >   * RETURNS:
> >   * Zero if update appears valid, error code on failure
> >   */
> > -int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> > -					const struct drm_crtc_state *crtc_state,
> > -					int min_scale,
> > -					int max_scale,
> > -					bool can_position,
> > -					bool can_update_disabled)
> > +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> > +					  const struct drm_crtc_state *crtc_state,
> > +					  bool can_position,
> > +					  bool can_update_disabled)
> >  {
> >  	struct drm_framebuffer *fb = plane_state->fb;
> >  	struct drm_rect *src = &plane_state->src;
> >  	struct drm_rect *dst = &plane_state->dst;
> >  	unsigned int rotation = plane_state->rotation;
> >  	struct drm_rect clip = {};
> > -	int hscale, vscale;
> >  
> >  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
> >  
> > @@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  
> >  	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
> >  
> > -	/* Check scaling */
> > -	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> > -	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> > -	if (hscale < 0 || vscale < 0) {
> > -		drm_dbg_kms(plane_state->plane->dev,
> > -			    "Invalid scaling of plane\n");
> > -		drm_rect_debug_print("src: ", &plane_state->src, true);
> > -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> > -		return -ERANGE;
> > -	}
> > -
> >  	if (crtc_state->enable)
> >  		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
> >  
> > @@ -921,6 +905,90 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
> > +
> > +/**
> > + * drm_atomic_helper_check_plane_scale() - Check whether plane can be scaled
> > + * @plane_state: plane state to check
> > + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> > + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> > + *
> > + * Checks that a desired plane scale fits into the min_scale..max_scale
> > + * boundaries.
> > + * Drivers that provide their own plane handling rather than helper-provided
> > + * implementations may still wish to call this function to avoid duplication of
> > + * error checking code.
> > + *
> > + * RETURNS:
> > + * Zero if update appears valid, error code on failure
> > + */
> > +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> > +					int min_scale,
> > +					int max_scale)
> > +{
> > +	struct drm_framebuffer *fb = plane_state->fb;
> > +	struct drm_rect src;
> > +	struct drm_rect dst;
> > +	int hscale, vscale;
> > +
> > +	if (!plane_state->visible)
> > +		return 0;
> > +
> > +	src = drm_plane_state_src(plane_state);
> > +	dst = drm_plane_state_dest(plane_state);
> > +
> > +	drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_state->rotation);
> > +
> > +	hscale = drm_rect_calc_hscale(&src, &dst, min_scale, max_scale);
> > +	vscale = drm_rect_calc_vscale(&src, &dst, min_scale, max_scale);
> > +	if (hscale < 0 || vscale < 0) {
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Invalid scaling of plane\n");
> > +		drm_rect_debug_print("src: ", &plane_state->src, true);
> > +		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> > +		return -ERANGE;
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_check_plane_scale);
> > +
> > +/**
> > + * drm_atomic_helper_check_plane_state() - Check plane state for validity
> > + * @plane_state: plane state to check
> > + * @crtc_state: CRTC state to check
> > + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> > + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> > + * @can_position: is it legal to position the plane such that it
> > + *                doesn't cover the entire CRTC?  This will generally
> > + *                only be false for primary planes.
> > + * @can_update_disabled: can the plane be updated while the CRTC
> > + *                       is disabled?
> > + *
> > + * Checks that a desired plane update is valid, and updates various
> > + * bits of derived state (clipped coordinates etc.). Drivers that provide
> > + * their own plane handling rather than helper-provided implementations may
> > + * still wish to call this function to avoid duplication of error checking
> > + * code.
> > + *
> > + * RETURNS:
> > + * Zero if update appears valid, error code on failure
> > + */
> > +int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> > +					const struct drm_crtc_state *crtc_state,
> > +					int min_scale,
> > +					int max_scale,
> > +					bool can_position,
> > +					bool can_update_disabled)
> > +{
> > +	int ret;
> > +
> > +	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state, can_position, can_update_disabled);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return drm_atomic_helper_check_plane_scale(plane_state, min_scale, max_scale);
> > +}
> >  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
> >  
> >  /**
> > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> > index 536a0b0091c3..32ac55aea94e 100644
> > --- a/include/drm/drm_atomic_helper.h
> > +++ b/include/drm/drm_atomic_helper.h
> > @@ -52,6 +52,13 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  int
> >  drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> >  					 struct drm_connector_state *conn_state);
> > +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> > +					  const struct drm_crtc_state *crtc_state,
> > +					  bool can_position,
> > +					  bool can_update_disabled);
> > +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> > +					int min_scale,
> > +					int max_scale);
> >  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> >  					const struct drm_crtc_state *crtc_state,
> >  					int min_scale,
> > -- 
> > 2.39.2
> 
> -- 
> Ville Syrj�l�
> Intel

-- 
Ville Syrj�l�
Intel

