Return-Path: <linux-arm-msm+bounces-42869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F17C9F87D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEEE91897FFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5D41C9DF0;
	Thu, 19 Dec 2024 22:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zy8FaoVK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242951A0BF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647198; cv=none; b=GnQnksEAYZDTSe4z05LIogUi8haGwp+ecOzN7MTPhpLB61LlbV5oYG33KeNzmh8rXhMNqvSpafWxfCkjpb37t2uTvugXfaAn49OPf/5qMfPHe5ln3wa4YqEbbdH2zKYmHKfaHVZpaLGhwYfan+ouKTJ73F6Cl0eGQhO+amdXtoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647198; c=relaxed/simple;
	bh=KjKag5mDqv6PG2v8UxcwOTt1CFkrU8djHGAIK/fTQ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cS/rKtyyL6rrYpjUSdfD1KoVLOLcgy/SEjSFaoAv/IKK/eC+XELR/KVPmUc9g+83hUrKYv+fHkChJ/VGOcrqVXkqtO18Hi5iYckHWblZjWALTeujq3tlwLkQJXRxEvgYUftOj0PaughYLsbvU38pOYZoKkK42c8CwVvTNYEciUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zy8FaoVK; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30225b2586cso24511291fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734647193; x=1735251993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n0cdI0iSMXmPnSL9AAuRz0+iRAjA99LezWXi0Idmv5o=;
        b=zy8FaoVKAiZzCqmxtmhXwkfXUQDL1Ia63lkAiVEDhxYY4SEiYf/mxFATsRYC3KyL9x
         VLDXUbZMwO0tdRZVhbX0A31ALB4HC2P5Yb3gR03IbuX/kkEhSkVGOVUeoZIaV6+j9wwS
         tfWjK34mTUb4HVn/h6sOtXSr+2JumHu6tSj0JGMtxb3B4hkLZpnhHqYD5TIQ0f5dJgGg
         4OWD2+Uzp1dSUZSW/N60y9Gr/oUFjN6MbySOIvavyiCc70bWlBVoPtIVPp35VdBx7fCW
         W3amcxRB4F7sLZihX1l4QFXWX6oTjTPJ6Y1QgjAfE9iiWQLcTsdJfW7evbA2pS4NEJFB
         /lYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734647193; x=1735251993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0cdI0iSMXmPnSL9AAuRz0+iRAjA99LezWXi0Idmv5o=;
        b=v34z7zLCfhiq1+cXgtybYDGUzGf7XZtkQeLCo7snvcwT3AteaGX4lHuMMk9JdOkxFI
         zTSjhAbN+vkUkXv5W2y5GyxuJZtVASKFwrGgNpvLquwFKcV2E7E+OJ1I8RNVNpwHhMRY
         3ARWYBphixFSu3ki4Mn0bew7pEWpSdmzo7Q7F/3wUwnZG58yVa8KMmibjviF+pMgh+mH
         EJo+GeJD97YKw6ioYDThJeJYR3TsZ9Fztd0dw+tjN5BgLS4TBIXJp80hv0CpZ9tKpvYM
         i6iK1kXBnPJhgc6TMMKLxy6/sUANOek+rqGsZsHkHxJdTgFxIZEIlOMiQAHmplv89Wze
         DBmw==
X-Forwarded-Encrypted: i=1; AJvYcCUHS/Pb1D/0QKmbFDNQsjai6ohheixiV//KpO7IYPY4RrIet5ZkgsLlRyVGyuyNRv4qkj/5TB5sVYEOZCex@vger.kernel.org
X-Gm-Message-State: AOJu0YywLw6xDBkl0RU8jFVV+tn0HnTbPy+qjv1AoXxoxGe7ThgOU/jl
	Fk6CcEyOJf4SS+uXarvYEBmA/AMOOQnQLIvf5gVSRhfQpLikCaZNJR+YVlFe5b8=
X-Gm-Gg: ASbGncscZYfxXSfdxTJDRY6bduABAA2O16jh6jem+Pa3gd2HxbzlQ31ZvbnSc7dPJ/M
	CqRLTSUF4ru0YX9zLP2fOljal6jYmg2Vl37DaANrhSYB1cDWaYBME4YUUGb1y9fZk9lOPyuvRfB
	Wvi6eYJAMuXLnMzerktBJ2sHDi283XLh0wbPh9zp4FsOP3eGIfNvJD9PTZxOFzy0Ax2+SGrqcpz
	nbB8ivndVaD6Rir8jvhwZJRZKHUGviBDxnNkl9VpiM3q3+HqEiOBCt/bVtY/3CAjacpe7IiAnTx
	glLfLJpXmUzGJ1joPwemK/1mi/fw5ppRtzTu
X-Google-Smtp-Source: AGHT+IEPup9TppQoY0J7ZhNTetTZ64N5MxFhblDQ9h7EjYB+AszAfInHdhBkY097bmqluDqex4wo3A==
X-Received: by 2002:a2e:b887:0:b0:300:1f5f:e24f with SMTP id 38308e7fff4ca-30469bfda0cmr1115671fa.15.1734647192985;
        Thu, 19 Dec 2024 14:26:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9b9c4sm3467181fa.31.2024.12.19.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:26:31 -0800 (PST)
Date: Fri, 20 Dec 2024 00:26:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/15] drm/msm/dpu: handle pipes as array
Message-ID: <qog7sgurpn4hhfavmcqgajekz3e5e62sreneykna6bupoqdz5b@b2u5tlpobpdy>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-8-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-8-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:26PM +0800, Jun Nie wrote:
> Store pipes in array with removing dedicated r_pipe. There are
> 2 pipes in a drm plane at most currently. While 4 pipes are

, while

> needed for new usage case.

What is "usage case"? Which use case is a new one?

> This change generalize the handling
> to pipe pair and ease handling to another pipe pair later.

See Documentation/process/submitting-patches.rst, look for "This patch"

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 170 +++++++++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
>  3 files changed, 113 insertions(+), 104 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 41c9d3e3e3c7c..a0284b1425b1f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	const struct msm_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>  
> -	uint32_t lm_idx;
> +	uint32_t lm_idx, i;
>  	bool bg_alpha_enable = false;
>  	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>  
> @@ -463,20 +463,15 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>  			bg_alpha_enable = true;
>  
> -		set_bit(pstate->pipe.sspp->idx, fetch_active);
> -		_dpu_crtc_blend_setup_pipe(crtc, plane,
> -					   mixer, cstate->num_mixers,
> -					   pstate->stage,
> -					   format, fb ? fb->modifier : 0,
> -					   &pstate->pipe, 0, stage_cfg);
> -
> -		if (pstate->r_pipe.sspp) {
> -			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
> +		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +			if (!pstate->pipe[i].sspp)
> +				continue;
> +			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
>  			_dpu_crtc_blend_setup_pipe(crtc, plane,
>  						   mixer, cstate->num_mixers,
>  						   pstate->stage,
>  						   format, fb ? fb->modifier : 0,
> -						   &pstate->r_pipe, 1, stage_cfg);
> +						   &pstate->pipe[i], i, stage_cfg);
>  		}
>  
>  		/* blend config update */
> @@ -1440,15 +1435,15 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  		seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>  			state->crtc_x, state->crtc_y, state->crtc_w,
>  			state->crtc_h);
> -		seq_printf(s, "\tsspp[0]:%s\n",
> -			   pstate->pipe.sspp->cap->name);
> -		seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
> -			pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
> -		if (pstate->r_pipe.sspp) {
> -			seq_printf(s, "\tsspp[1]:%s\n",
> -				   pstate->r_pipe.sspp->cap->name);
> -			seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
> -				   pstate->r_pipe.multirect_mode, pstate->r_pipe.multirect_index);
> +
> +		for (i = 0; i < PIPES_PER_STAGE; i++) {
> +			if (pstate->pipe[i].sspp) {

Here and further on: please make the code uniform. I liked the
`if (!sspp) continue;' style. Could you please switch all the places to
use the same pattern.

> +				seq_printf(s, "\tsspp[%d]:%s\n",
> +					   i, pstate->pipe[i].sspp->cap->name);
> +				seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
> +					   i, pstate->pipe[i].multirect_mode,
> +					   pstate->pipe[i].multirect_index);
> +			}
>  		}
>  
>  		seq_puts(s, "\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 098abc2c0003c..aaf934ec96be5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>  	struct msm_drm_private *priv = plane->dev->dev_private;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>  	u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
> +	int i;
>  
>  	DPU_DEBUG_PLANE(pdpu, "\n");
>  
> @@ -632,12 +633,12 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>  		return;
>  
>  	/* update sspp */
> -	_dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -				   fill_color, fmt);
> -
> -	if (pstate->r_pipe.sspp)
> -		_dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> -					   fill_color, fmt);
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (pstate->pipe[i].sspp)
> +			_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> +						   &pstate->pipe_cfg[i].dst_rect,
> +						   fill_color, fmt);
> +	}
>  }
>  
>  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -799,8 +800,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg *pipe_cfg;
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
>  	uint32_t max_linewidth;
>  
> @@ -825,6 +826,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>  	/* state->src is 16.16, src_rect is not */
>  	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>  
> @@ -921,11 +925,11 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>  	const struct msm_format *fmt;
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>  	uint32_t supported_rotations;
>  	const struct dpu_sspp_cfg *pipe_hw_caps;
>  	const struct dpu_sspp_sub_blks *sblk;
> @@ -1010,10 +1014,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>  	const struct drm_crtc_state *crtc_state = NULL;
>  	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
>  
> @@ -1057,7 +1061,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  		drm_atomic_get_old_plane_state(state, plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>  	struct drm_crtc_state *crtc_state;
> -	int ret;
> +	int ret, i;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1072,8 +1076,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  		 * resources are freed by dpu_crtc_assign_plane_resources(),
>  		 * but clean them here.
>  		 */
> -		pstate->pipe.sspp = NULL;
> -		pstate->r_pipe.sspp = NULL;
> +		for (i = 0; i < PIPES_PER_STAGE; i++)
> +			pstate->pipe[i].sspp = NULL;
>  
>  		return 0;
>  	}
> @@ -1110,19 +1114,22 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
> +	int i;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   plane_state->crtc);
>  
>  	pstate = to_dpu_plane_state(plane_state);
> -	pipe = &pstate->pipe;
> -	r_pipe = &pstate->r_pipe;
> -	pipe_cfg = &pstate->pipe_cfg;
> -	r_pipe_cfg = &pstate->r_pipe_cfg;
>  
> -	pipe->sspp = NULL;
> -	r_pipe->sspp = NULL;
> +	/* TODO: loop below code for another pair later */

Drop the comment, it is not relevant for this patch.

> +	pipe = &pstate->pipe[0];
> +	r_pipe = &pstate->pipe[1];
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i++)
> +		pstate->pipe[i].sspp = NULL;
>  
>  	if (!plane_state->fb)
>  		return -EINVAL;
> @@ -1212,6 +1219,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>  {
>  	struct dpu_plane *pdpu;
>  	struct dpu_plane_state *pstate;
> +	int i;
>  
>  	if (!plane || !plane->state) {
>  		DPU_ERROR("invalid plane\n");
> @@ -1232,8 +1240,8 @@ void dpu_plane_flush(struct drm_plane *plane)
>  		/* force 100% alpha */
>  		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>  	else {
> -		dpu_plane_flush_csc(pdpu, &pstate->pipe);
> -		dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> +		for (i = 0; i < PIPES_PER_STAGE; i++)
> +			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>  	}
>  
>  	/* flag h/w flush complete */
> @@ -1334,15 +1342,19 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct drm_plane_state *state = plane->state;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>  	struct drm_crtc *crtc = state->crtc;
>  	struct drm_framebuffer *fb = state->fb;
>  	bool is_rt_pipe;
>  	const struct msm_format *fmt =
>  		msm_framebuffer_format(fb);
> -	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	struct dpu_hw_fmt_layout layout;
> +	int ret, i;
> +
> +	ret = dpu_format_populate_plane_sizes(fb, &layout);
> +	if (ret) {
> +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> +		return;
> +	}

The patch is supposed to change pipe/r_pipe and pipe_cfg / r_pipe_cfg
into arrays. How did it get this chunk? Is it releavent for this patch
or did it come from another patch?

>  
>  	pstate->pending = true;
>  
> @@ -1357,12 +1369,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>  			crtc->base.id, DRM_RECT_ARG(&state->dst),
>  			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>  
> -	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> -				   drm_mode_vrefresh(&crtc->mode),
> -				   &pstate->layout);
> -
> -	if (r_pipe->sspp) {
> -		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> +	/* move the assignment here, to ease handling to another pairs later */
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> +					   &pstate->pipe_cfg[i], fmt,
>  					   drm_mode_vrefresh(&crtc->mode),
>  					   &pstate->layout);
>  	}
> @@ -1370,15 +1382,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
>  	if (pstate->needs_qos_remap)
>  		pstate->needs_qos_remap = false;
>  
> -	pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
> -						    &crtc->mode, pipe_cfg);
> -
> -	pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> -
> -	if (r_pipe->sspp) {
> -		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> +	pstate->plane_fetch_bw = 0;
> +	pstate->plane_clk = 0;
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (!pstate->pipe[i].sspp)
> +			continue;
> +		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> +							     &crtc->mode, &pstate->pipe_cfg[i]);
>  
> -		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +		pstate->plane_clk = max(pstate->plane_clk,
> +					_dpu_plane_calc_clk(&crtc->mode,
> +							    &pstate->pipe_cfg[i]));
>  	}
>  }
>  
> @@ -1386,17 +1400,24 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  {
>  	struct drm_plane_state *state = plane->state;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe *pipe;
> +	int i;
>  
> -	trace_dpu_plane_disable(DRMID(plane), false,
> -				pstate->pipe.multirect_mode);
> +	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
>  
> -	if (r_pipe->sspp) {
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		trace_dpu_plane_disable(DRMID(plane), false,
> +					pstate->pipe[i].multirect_mode);
>  
> -		if (r_pipe->sspp->ops.setup_multirect)
> -			r_pipe->sspp->ops.setup_multirect(r_pipe);
> +		if (pipe->sspp && i == 1) {

Add a comment, why this is being done. It was idiomatic (more or less)
when it was r_pipe, not it demands some words. E.g. "clear multirect for
the right pipe so that the SSPP can be further reused in the solo mode"

> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			if (pipe->sspp->ops.setup_multirect)
> +				pipe->sspp->ops.setup_multirect(pipe);
> +		}
>  	}
>  
>  	pstate->pending = true;
> @@ -1491,31 +1512,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>  		const struct drm_plane_state *state)
>  {
>  	const struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	const struct dpu_sw_pipe *pipe = &pstate->pipe;
> -	const struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +	const struct dpu_sw_pipe *pipe;
> +	const struct dpu_sw_pipe_cfg *pipe_cfg;
> +	int i;
>  
>  	drm_printf(p, "\tstage=%d\n", pstate->stage);
>  
> -	if (pipe->sspp) {
> -		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> -		drm_printf(p, "\tmultirect_mode[0]=%s\n",
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[%d]=%s\n", i,
>  			   dpu_get_multirect_mode(pipe->multirect_mode));
> -		drm_printf(p, "\tmultirect_index[0]=%s\n",
> +		drm_printf(p, "\tmultirect_index[%d]=%s\n", i,
>  			   dpu_get_multirect_index(pipe->multirect_index));
> -		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> -		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> -	}
> -
> -	if (r_pipe->sspp) {
> -		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> -		drm_printf(p, "\tmultirect_mode[1]=%s\n",
> -			   dpu_get_multirect_mode(r_pipe->multirect_mode));
> -		drm_printf(p, "\tmultirect_index[1]=%s\n",
> -			   dpu_get_multirect_index(r_pipe->multirect_index));
> -		drm_printf(p, "\tsrc[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> -		drm_printf(p, "\tdst[1]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&r_pipe_cfg->dst_rect));
> +		drm_printf(p, "\tsrc[%d]=" DRM_RECT_FMT "\n", i,
> +			   DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		drm_printf(p, "\tdst[%d]=" DRM_RECT_FMT "\n", i,
> +			   DRM_RECT_ARG(&pipe_cfg->dst_rect));
>  	}
>  }
>  
> @@ -1553,14 +1569,16 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +	int i;
>  
>  	if (!pdpu->is_rt_pipe)
>  		return;
>  
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -	_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
> -	if (pstate->r_pipe.sspp)
> -		_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		if (pstate->pipe[i].sspp)
> +			_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> +	}
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>  #endif
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> index acd5725175cdd..052fd046e8463 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
> @@ -18,10 +18,8 @@
>   * struct dpu_plane_state: Define dpu extension of drm plane state object
>   * @base:	base drm plane state object
>   * @aspace:	pointer to address space for input/output buffers
> - * @pipe:	software pipe description
> - * @r_pipe:	software pipe description of the second pipe
> - * @pipe_cfg:	software pipe configuration
> - * @r_pipe_cfg:	software pipe configuration for the second pipe
> + * @pipe:	software pipe description array
> + * @pipe_cfg:	software pipe configuration array
>   * @stage:	assigned by crtc blender
>   * @needs_qos_remap: qos remap settings need to be updated
>   * @multirect_index: index of the rectangle of SSPP
> @@ -35,10 +33,8 @@
>  struct dpu_plane_state {
>  	struct drm_plane_state base;
>  	struct msm_gem_address_space *aspace;
> -	struct dpu_sw_pipe pipe;
> -	struct dpu_sw_pipe r_pipe;
> -	struct dpu_sw_pipe_cfg pipe_cfg;
> -	struct dpu_sw_pipe_cfg r_pipe_cfg;
> +	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
> +	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
>  	enum dpu_stage stage;
>  	bool needs_qos_remap;
>  	bool pending;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

