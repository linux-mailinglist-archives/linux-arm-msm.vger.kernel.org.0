Return-Path: <linux-arm-msm+bounces-11072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B985523C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D6FD1F23D76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FAC2604AB;
	Wed, 14 Feb 2024 18:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iur337Yt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443112FB22
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707935830; cv=none; b=WQffp5sS3K16lS/VYjztgb5V0n6OD54WAoRRPuwYlotdpiRAwZCgkWfdz4D6TaChyi3b85D1dhTU0mmiK6MJLUzoMj7xylbGDoGjXUDQOHQ4e3ZltQmPd5S/gdx0xSq8bjInWSQoUdqi8T1SSh9e37XYkKYwKdEm1Wz/tGZOmrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707935830; c=relaxed/simple;
	bh=UrEEb5quc78wOsXy6JAcbCfTcVsvQ1QNPX+Y5Evyklo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0IWNUxpx55+Jp6MutsGTtWbRAwysRp9B1ejIlZfukfrPO8BTyLDGw1sVzmC6+AALceA00d1OLp0wcAFiH9ZXudK9LRwJwVs+CS1qC9YmGFUdFJXUKrGaSSHOXIgPq8fb7WS+C3jVebx8za8A9p7N+qSNojjViy5taNjboIQ0qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iur337Yt; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707935829; x=1739471829;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UrEEb5quc78wOsXy6JAcbCfTcVsvQ1QNPX+Y5Evyklo=;
  b=iur337Yt8yrST1FgSmd4jItTRRsyO3UGV6ii6m+B1r4WDg+AqsarGA6s
   XYHkwgmkKvqT5clKCCeKd4+MZ+815v5h7YLBSDPnSDd1v36Vjuu01JMp1
   1vy6uNpILGb0vY8ug1MTJX5sdLRa8oV4pqFAWDIk47ntXlVD3Y6T4J9L1
   nCibp3EmiAApgckRzJtBgf5CMc9OcpmhfxBsj8ffWhaQJZyTVZYMkfigs
   pSYTmb7rbEyTxcLbD2Rfv8oXoy7LhlH+mX7PNGIqUlQpP94f8ZIxbtsuM
   s2DBfDKPDiUSxcrKdqlb3lRABfB+nc7xSTlhGinj63nbJoBYF6vMiaDk9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1872990"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="1872990"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 10:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826369708"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="826369708"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 14 Feb 2024 10:37:03 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 14 Feb 2024 20:37:02 +0200
Date: Wed, 14 Feb 2024 20:37:02 +0200
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
Message-ID: <Zc0ITrmhQ8CWMXMq@intel.com>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
 <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914050706.1058620-2-dmitry.baryshkov@linaro.org>
X-Patchwork-Hint: comment

On Thu, Sep 14, 2023 at 08:06:55AM +0300, Dmitry Baryshkov wrote:
> The helper drm_atomic_helper_check_plane_state() runs several checks on
> plane src and dst rectangles, including the check whether required
> scaling fits into the required margins. The msm driver would benefit
> from having a function that does all these checks except the scaling
> one. Split them into a new helper called
> drm_atomic_helper_check_plane_noscale().

What's the point in eliminating a nop scaling check?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 110 ++++++++++++++++++++++------
>  include/drm/drm_atomic_helper.h     |   7 ++
>  2 files changed, 96 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..2d7dd66181c9 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>  EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>  
>  /**
> - * drm_atomic_helper_check_plane_state() - Check plane state for validity
> + * drm_atomic_helper_check_plane_noscale() - Check plane state for validity
>   * @plane_state: plane state to check
>   * @crtc_state: CRTC state to check
> - * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> - * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
>   * @can_position: is it legal to position the plane such that it
>   *                doesn't cover the entire CRTC?  This will generally
>   *                only be false for primary planes.
> @@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
>   * RETURNS:
>   * Zero if update appears valid, error code on failure
>   */
> -int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> -					const struct drm_crtc_state *crtc_state,
> -					int min_scale,
> -					int max_scale,
> -					bool can_position,
> -					bool can_update_disabled)
> +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> +					  const struct drm_crtc_state *crtc_state,
> +					  bool can_position,
> +					  bool can_update_disabled)
>  {
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_rect *src = &plane_state->src;
>  	struct drm_rect *dst = &plane_state->dst;
>  	unsigned int rotation = plane_state->rotation;
>  	struct drm_rect clip = {};
> -	int hscale, vscale;
>  
>  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
>  
> @@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  
>  	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
>  
> -	/* Check scaling */
> -	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> -	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> -	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->plane->dev,
> -			    "Invalid scaling of plane\n");
> -		drm_rect_debug_print("src: ", &plane_state->src, true);
> -		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> -		return -ERANGE;
> -	}
> -
>  	if (crtc_state->enable)
>  		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
>  
> @@ -921,6 +905,90 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
> +
> +/**
> + * drm_atomic_helper_check_plane_scale() - Check whether plane can be scaled
> + * @plane_state: plane state to check
> + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> + *
> + * Checks that a desired plane scale fits into the min_scale..max_scale
> + * boundaries.
> + * Drivers that provide their own plane handling rather than helper-provided
> + * implementations may still wish to call this function to avoid duplication of
> + * error checking code.
> + *
> + * RETURNS:
> + * Zero if update appears valid, error code on failure
> + */
> +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> +					int min_scale,
> +					int max_scale)
> +{
> +	struct drm_framebuffer *fb = plane_state->fb;
> +	struct drm_rect src;
> +	struct drm_rect dst;
> +	int hscale, vscale;
> +
> +	if (!plane_state->visible)
> +		return 0;
> +
> +	src = drm_plane_state_src(plane_state);
> +	dst = drm_plane_state_dest(plane_state);
> +
> +	drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_state->rotation);
> +
> +	hscale = drm_rect_calc_hscale(&src, &dst, min_scale, max_scale);
> +	vscale = drm_rect_calc_vscale(&src, &dst, min_scale, max_scale);
> +	if (hscale < 0 || vscale < 0) {
> +		drm_dbg_kms(plane_state->plane->dev,
> +			    "Invalid scaling of plane\n");
> +		drm_rect_debug_print("src: ", &plane_state->src, true);
> +		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> +		return -ERANGE;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_check_plane_scale);
> +
> +/**
> + * drm_atomic_helper_check_plane_state() - Check plane state for validity
> + * @plane_state: plane state to check
> + * @crtc_state: CRTC state to check
> + * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
> + * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> + * @can_position: is it legal to position the plane such that it
> + *                doesn't cover the entire CRTC?  This will generally
> + *                only be false for primary planes.
> + * @can_update_disabled: can the plane be updated while the CRTC
> + *                       is disabled?
> + *
> + * Checks that a desired plane update is valid, and updates various
> + * bits of derived state (clipped coordinates etc.). Drivers that provide
> + * their own plane handling rather than helper-provided implementations may
> + * still wish to call this function to avoid duplication of error checking
> + * code.
> + *
> + * RETURNS:
> + * Zero if update appears valid, error code on failure
> + */
> +int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> +					const struct drm_crtc_state *crtc_state,
> +					int min_scale,
> +					int max_scale,
> +					bool can_position,
> +					bool can_update_disabled)
> +{
> +	int ret;
> +
> +	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state, can_position, can_update_disabled);
> +	if (ret < 0)
> +		return ret;
> +
> +	return drm_atomic_helper_check_plane_scale(plane_state, min_scale, max_scale);
> +}
>  EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
>  
>  /**
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 536a0b0091c3..32ac55aea94e 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -52,6 +52,13 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  int
>  drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
>  					 struct drm_connector_state *conn_state);
> +int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
> +					  const struct drm_crtc_state *crtc_state,
> +					  bool can_position,
> +					  bool can_update_disabled);
> +int drm_atomic_helper_check_plane_scale(struct drm_plane_state *plane_state,
> +					int min_scale,
> +					int max_scale);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
>  					int min_scale,
> -- 
> 2.39.2

-- 
Ville Syrjälä
Intel

