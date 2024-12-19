Return-Path: <linux-arm-msm+bounces-42877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 217DA9F8879
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 00:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4FB21889D6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5CC1D6DBF;
	Thu, 19 Dec 2024 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8PCoVg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572EC1BC9E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 23:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734650615; cv=none; b=WBFmKUhYmh7ZrhjjbVXJBCmUUnzPF5NO65Nf5t1VIYeg9iM/0J6ARinyZCC+p1RPjv9GY0Z+FMva4HK5LsJZhyn4Hl15VebgcFE5mrCZibp++6wdAlos0mrb8UF5kdEmxWZ9XUGHcMC0EzJVHrG2JS66AWa3gqhwCNW2AIqt9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734650615; c=relaxed/simple;
	bh=IZF8EOTO0zJD9Xg/4Y+3RWpToEG3UqyEpctKDj0bzrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdri0LmmCmLfd0Yb+fuEOLvhKe7I0iO1mwu9hY4r+FToXLCX/CiYVKv48hqIYJ/r404IhiPUUjRw37waq9YSI1PE7mV1h9sPzMjHXEH5XqDQfHdHjKRM3pXozW+iLqTEaJCe1ee9g4CItM8VfRlKMcQDPI+anjiSb9mZyPCnnDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8PCoVg8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f22fd6832so1261091e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734650610; x=1735255410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxThDL0M06erJx0i5xoAon/SNo0zan2/74JVtKWH2hI=;
        b=u8PCoVg8XME55yKt2VxiUWSu/0dJPhQEc5Wd3qK7Qv35+tBffpIi/wBIlgVG3V2uPq
         vwR5ftrdn356MWmMlhFRULYGJ1CUQkjM6ddoJGjpqldgCj3sb3Li/7rNpfPyZggAOMTy
         zlsDtxINJgAM43sQ+Bxk4sfP6cXPQcYT7TIqeR6ZSlK6fG9VDU3yRaV5VxbEG1G6eV2f
         xA8nNA5ul5oeKgTq3DjjE3HzYVhl3CZsJQUyyflsg+oCk2qssu+Cz5R8qomOgFUmEstg
         a4IZcG1c3AJq9VIEbz5GfliYzx7VGfl1NlQAG+qan4JqW929/SE9o4pv6fkiXXYVKFiu
         2f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734650610; x=1735255410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxThDL0M06erJx0i5xoAon/SNo0zan2/74JVtKWH2hI=;
        b=uy0uCcI4xTcjC7rWcbAsPeUrKq+GRcWGFiKzgwS5pmLypYLzDo7B1oqgkZyKXTMNw6
         2G47E5aK3Dy5Ju+HL4sAqjljHUOO+8rIUY1yDXLQNHcu35CgC+B7SXm23ThGmkChmg77
         2RAv1uvfEnnF/XAR8WGJ9jDQn09JqKKOMSJjgcK18GjR9P5Z3ZT3DsE6WUGukdeG2f68
         OScN33mGZR851yCAqgOZMEmq76kwqcKMHOek4IECKqEvytGUf3SBRyncXmbMK+WFPaHm
         oMtYdMgUIcNSx//0w1M+ODXKm2oCO1NvYVTlML+crTVwEZJ6X5tdFUcnIt4/iC2RyZ5Q
         sdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2OuEG6JbKBHDUV3zlg9c/iY+samPmeUle7uHXaH56xCy6ict+nP59oombL7BDljeQFOL2IzeiDPTDlHEs@vger.kernel.org
X-Gm-Message-State: AOJu0YwxJt3uonDGJbVUYE0/V4O04iwcLjcV2GUy4iq8zLHNQMVrmyGU
	Y5NoIAqpt02hCxn7OzWDUgy6dk92Ijco0Yb2D27QBgLt8t3rPVOKU7aeFnoDe5I=
X-Gm-Gg: ASbGncsLaJj5cemZoqAvGOXqGvyG60lMHG+M+vYcdwB9FT6LbHI3mtDUeq9AZ345L6/
	MxSdsTVpHQLUBU6XbNYdH96o0dEIaDG1LmDjcSEeo1emzIs+sgkwO/Tu3t3CyDYT7eVFlCWW/qJ
	kFMcT3pj61keP6fjwcXTGpLbojHF2Lui9riw8mmy4Q2eFtzSoWH1wxNxrLHOCijPuJWJYrpHdan
	OAROc2JteF+fzJ2VyejC5dkW7Kpq01RXX+5oU6lWnpIaPSxfSw1Bq4cEAb4E/HMIkOHLqLLuvTH
	gNPY5znZvtSX8+C/78SuHStjROCCbadyfUNR
X-Google-Smtp-Source: AGHT+IFu0ygVXVlyCFAI0wBOu30+Rp41ZnPG7y4HSy3cifT6hr1Q9oJ3Obolj498eR0Zp694u+g7Yg==
X-Received: by 2002:a05:6512:3f18:b0:540:23dd:2139 with SMTP id 2adb3069b0e04-5422953fd6cmr137566e87.29.1734650610402;
        Thu, 19 Dec 2024 15:23:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b06a4a3sm3513521fa.71.2024.12.19.15.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 15:23:29 -0800 (PST)
Date: Fri, 20 Dec 2024 01:23:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 13/15] drm/msm/dpu: Support quad-pipe in SSPP checking
Message-ID: <smr36w34y6ygi2lb2omuswc3oygryizjhq6r6bzrgznv46anhy@jnuranf3opdw>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-13-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:31PM +0800, Jun Nie wrote:
> Move requreiment check to routine of every pipe check. There will be
> multiple SSPPs for quad-pipe case in future. Only check valid pipe
> as some pipes are for multi-rect or right half of screen that may
> not be used.

This highlights an issue in the current wide planes implelentation.
Please move this to the top of the series, provide a proper commit
message, describing the issue, and add a proper Fixes tag.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 86 +++++++++++++++----------------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index fca6e609898a6..1cd98892898a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -730,12 +730,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>  		struct dpu_sw_pipe *pipe,
>  		struct dpu_sw_pipe_cfg *pipe_cfg,
> -		const struct msm_format *fmt,
> -		const struct drm_display_mode *mode)
> +		const struct drm_display_mode *mode,
> +		struct drm_plane_state *new_plane_state)
>  {
>  	uint32_t min_src_size;
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	int ret;
> +	const struct msm_format *fmt;
> +	uint32_t supported_rotations;
> +	const struct dpu_sspp_cfg *pipe_hw_caps;
> +	const struct dpu_sspp_sub_blks *sblk;
> +
> +	pipe_hw_caps = pipe->sspp->cap;
> +	sblk = pipe->sspp->cap->sblk;
> +
> +	/*
> +	 * We already have verified scaling against platform limitations.
> +	 * Now check if the SSPP supports scaling at all.
> +	 */
> +	if (!sblk->scaler_blk.len &&
> +	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +	      drm_rect_width(&new_plane_state->dst)) ||
> +	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> +	      drm_rect_height(&new_plane_state->dst))))
> +		return -ERANGE;
> +
> +	fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +		supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +						   supported_rotations);
>  
>  	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>  
> @@ -981,49 +1009,19 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	const struct msm_format *fmt;
> -	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> -	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
> -	int ret = 0;
> -
> -	pipe_hw_caps = pipe->sspp->cap;
> -	sblk = pipe->sspp->cap->sblk;
> -
> -	/*
> -	 * We already have verified scaling against platform limitations.
> -	 * Now check if the SSPP supports scaling at all.
> -	 */
> -	if (!sblk->scaler_blk.len &&
> -	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -	      drm_rect_width(&new_plane_state->dst)) ||
> -	     (drm_rect_height(&new_plane_state->src) >> 16 !=
> -	      drm_rect_height(&new_plane_state->dst))))
> -		return -ERANGE;
> -
> -	fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -		supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -						   supported_rotations);
> -	r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -					  &crtc_state->adjusted_mode);
> -	if (ret)
> -		return ret;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int ret = 0, i;
>  
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +	for (i = 0; i < PIPES_PER_PLANE; i++) {
> +		pipe = &pstate->pipe[i];
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		if (!pipe_cfg->valid || !pipe->sspp)
> +			continue;
> +		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +						  &crtc_state->adjusted_mode,
> +						  new_plane_state);
>  		if (ret)
>  			return ret;
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

