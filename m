Return-Path: <linux-arm-msm+bounces-33862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CA199872E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C9ADB258DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F041C9EA4;
	Thu, 10 Oct 2024 13:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsMvQYRw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EB61C9DFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728565713; cv=none; b=new1JojBPpg3+pvVFAAMKxRCuxnCvvu6GZ/+7k+spHTSwkFAdaczgWDQB7Zj1JCbGBUl3/j1HDnKPYpewNCYarcs/BAeSHQv+BZ7DpOo+JlK0jCHu792k/cREgt7IX7pwNSGr819J0pNkgBrCpe4ZhTABt2Y6Fg9tihXAhCbaEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728565713; c=relaxed/simple;
	bh=LkNTpd4ROgxZZlpCKnYdieN3ypqoZmci8ePAl8Nwxd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwMFtkL65PmQlzw5iZ2Om+XO4qW9yNEtH2wJ20tVFSoc3ZZ40BPdLffLUkz++1FLM7f9N+qpBcGwLjQT46ALtWcwI34j+Vvcv7PZWWl45I15g87g3jkOpixnPrdNdNvYA31CzLCO8F9gCX8JFpmLkuvCUGu21yP9W1l3Pi4SxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsMvQYRw; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fabe5c8c26so8462631fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728565707; x=1729170507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jaq7liW82RR849pRI8XbbRkmC3ASF0tSU7ok70rJo+g=;
        b=RsMvQYRwlVV/VyNSLMXe/95197HL4NeIyJxhMTvy5Z8s5gE7VIdrEpLEe8ykF+wuGO
         1kNnqEIW3ELFWMCCP388DHIckb4GBPr6vBw4Fzgo+1DDR5peULcgIADbSSZFLtjxzBc1
         3PGGUUvACjjf54dOkX4Gr/GOxL0mLAEioGhJsLU7Sp28Plw8TQf6YkP3wTQ3BqJ0J8hB
         PPF4haQV4ez40MW9iTsZV2/8KRR1wYy4/54Z5tjOBXWSh9ZkvF1cgQ2eFr8l6eRAKQtr
         ea9xGsf3eJECr2S4RYKowd0/SRnFy9WZwHUpH4z0mYY65nhr30aFueP9c+KIUSLEZzHF
         BvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728565707; x=1729170507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jaq7liW82RR849pRI8XbbRkmC3ASF0tSU7ok70rJo+g=;
        b=F2Vr5BXILyicNc4H4uAt+TQqdSq2j+FWtMyqiTPjRKl9dEnqF5i8RayKaF4jdMe7D4
         tuLREiuAO7xNcTHJ9oYK71MVkof6cbNT8OGMnMHTIQd70JaDIGQKrKxzIEE6JikbeSDu
         fRwS5ylJnJuRKHt1kGD7FI9w+KGd+OlaVINL4FZWE0Yrmz1uZ3fN8uIicyubW/oEiP/f
         d6pEuSa5ovkCMF7hbZyOVl5BvxgG4JER43kbrAsim3Pm2pW2Bo24MzhsAtHol9poyObw
         06adLvxmXaGCg13jiBXrBTQaoo2CSzmKLZ5HecFY4K8s++7Jdg5Xi2QtAu98l5ITBaMk
         bUZg==
X-Forwarded-Encrypted: i=1; AJvYcCURmYeIH7cmgO4iG7dmKflp3eBhOpFqJyv7cPRHY6AoIl+UjsK2Cq50324kt+EREOVTinSYpDbPidVCGc6A@vger.kernel.org
X-Gm-Message-State: AOJu0YyG12jkhITNTa/ymOjNzZCddcadxre5EuUnKCui83lttU32/LDt
	NjNLBq9Aq971qHq3QnA1N7GvCKV4JLtBcNk7LyInAmVqQxe5HBmdAXAJ/oTrOGo=
X-Google-Smtp-Source: AGHT+IEICurksyoZuecP5FPvxp30drF7sqQ1tUGjdcEd7eGYqIX705ef4X3aCF43P7uAZ04K2hZdZQ==
X-Received: by 2002:a2e:131a:0:b0:2fa:cd30:8e11 with SMTP id 38308e7fff4ca-2fb187e65f0mr32540871fa.43.1728565706952;
        Thu, 10 Oct 2024 06:08:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb24706462sm2009851fa.99.2024.10.10.06.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:08:25 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:08:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/14] drm/msm/dpu: handle pipes as array
Message-ID: <kuvbcodnbgsgetkudbce32rajy6kg3lpxhcx6cvgm6bi7ekoki@smmnpdrwhbqn>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-5-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-5-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:18PM GMT, Jun Nie wrote:
> Store pipes in array with removing dedicated r_pipe. There are
> 2 pipes in a drm plane at most currently. While 4 pipes are
> needed for new usage case. This change generalize the handling
> to pipe pair and ease handling to another pipe pair later.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  34 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 ++++++++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h |  10 +-
>  4 files changed, 111 insertions(+), 112 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 3e0e6e9757da5..9656b1df0f122 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  
>  	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>  				   state, to_dpu_plane_state(state), stage_idx,
> -				   format->pixel_format,
> +				   format->pixel_format, pipe,
>  				   modifier);

Doesn't seem to be related.

>  
>  	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
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
> @@ -1387,15 +1382,12 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
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
> +		if (pstate->pipe[i].sspp) {
> +			seq_printf(s, "\tsspp[%d]:%s\n",
> +				   i, pstate->pipe[i].sspp->cap->name);
> +			seq_printf(s, "\tmultirect[%d]: mode: %d index: %d\n",
> +				   i, pstate->pipe[i].multirect_mode,
> +				   pstate->pipe[i].multirect_index);
>  		}

I don't expect that this will work.

>  
>  		seq_puts(s, "\n");
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4df7cfed4d230..e7006fb8c7734 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -429,7 +429,7 @@ static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>  		uint32_t chroma_subsmpl_h, uint32_t chroma_subsmpl_v,
>  		unsigned int rotation)
>  {
> -	uint32_t i;
> +	int i;

Why?

>  	bool inline_rotation = rotation & DRM_MODE_ROTATE_90;
>  
>  	/*
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
> @@ -808,8 +809,8 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
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
> @@ -834,6 +835,9 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>  	/* state->src is 16.16, src_rect is not */
>  	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>  
> @@ -916,11 +920,11 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
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
> @@ -975,10 +979,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
>  
>  	if (new_plane_state->crtc)
> @@ -1056,7 +1060,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>  		drm_atomic_get_old_plane_state(state, plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>  	struct drm_crtc_state *crtc_state;
> -	int ret;
> +	int ret, i;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1071,8 +1075,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
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
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
>  	const struct msm_format *fmt;
>  	uint32_t max_linewidth;
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
> +	/* loop below code for another pair later */

??

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
> @@ -1228,6 +1235,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>  {
>  	struct dpu_plane *pdpu;
>  	struct dpu_plane_state *pstate;
> +	int i;
>  
>  	if (!plane || !plane->state) {
>  		DPU_ERROR("invalid plane\n");
> @@ -1248,8 +1256,8 @@ void dpu_plane_flush(struct drm_plane *plane)
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
> @@ -1349,20 +1357,16 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	struct msm_gem_address_space *aspace = kms->base.aspace;
>  	struct dpu_hw_fmt_layout layout;
>  	bool layout_valid = false;
> -	int ret;
> +	int ret, i;
>  
>  	ret = dpu_format_populate_layout(aspace, fb, &layout);
>  	if (ret)
> @@ -1381,12 +1385,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>  			crtc->base.id, DRM_RECT_ARG(&state->dst),
>  			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>  
> -	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> -				   drm_mode_vrefresh(&crtc->mode),
> -				   layout_valid ? &layout : NULL);
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
>  					   layout_valid ? &layout : NULL);
>  	}
> @@ -1394,15 +1398,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
> +							&crtc->mode, &pstate->pipe_cfg[i]);

Wrong indentation

>  
> -		pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +		pstate->plane_clk = max(pstate->plane_clk,
> +					_dpu_plane_calc_clk(&crtc->mode,
> +							    &pstate->pipe_cfg[i]));
>  	}
>  }
>  
> @@ -1410,17 +1416,24 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  {
>  	struct drm_plane_state *state = plane->state;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +	struct dpu_sw_pipe *pipe;
> +	int i;
> +
> +	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
>  
> -	trace_dpu_plane_disable(DRMID(plane), false,
> -				pstate->pipe.multirect_mode);
> +		trace_dpu_plane_disable(DRMID(plane), false,
> +					pstate->pipe[i].multirect_mode);
>  
> -	if (r_pipe->sspp) {
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +		if (pipe->sspp && pipe->multirect_index == DPU_SSPP_RECT_1) {

if (i > 1)

> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>  
> -		if (r_pipe->sspp->ops.setup_multirect)
> -			r_pipe->sspp->ops.setup_multirect(r_pipe);
> +			if (pipe->sspp->ops.setup_multirect)
> +				pipe->sspp->ops.setup_multirect(pipe);
> +		}
>  	}
>  
>  	pstate->pending = true;
> @@ -1515,30 +1528,26 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
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
> -		drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> -		drm_printf(p, "\tmultirect_index[0]=%s\n",
> +	for (i = 0; i < PIPES_PER_STAGE; i++) {
> +		pipe = &pstate->pipe[i];
> +		if (!pipe->sspp)
> +			continue;
> +		pipe_cfg = &pstate->pipe_cfg[i];
> +		drm_printf(p, "\tsspp[%d]=%s\n", i, pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[%d]=%s\n", i,
> +			   dpu_get_multirect_mode(pipe->multirect_mode));
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
> @@ -1576,14 +1585,16 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
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
> index e225d5baceb09..39945e0d1b851 100644
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
> @@ -34,10 +32,8 @@
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
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 5307cbc2007c5..cb24ad2a6d8d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>  		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
>  		 uint32_t stage_idx, uint32_t pixel_format,
> -		 uint64_t modifier),
> +		 struct dpu_sw_pipe *pipe, uint64_t modifier),
>  	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
> -		pixel_format, modifier),
> +		pixel_format, pipe, modifier),
>  	TP_STRUCT__entry(
>  		__field(	uint32_t,		crtc_id		)
>  		__field(	uint32_t,		plane_id	)
> @@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>  		__entry->dst_rect = drm_plane_state_dest(state);
>  		__entry->stage_idx = stage_idx;
>  		__entry->stage = pstate->stage;
> -		__entry->sspp = pstate->pipe.sspp->idx;
> -		__entry->multirect_idx = pstate->pipe.multirect_index;
> -		__entry->multirect_mode = pstate->pipe.multirect_mode;
> +		__entry->sspp = pipe->sspp->idx;
> +		__entry->multirect_idx = pipe->multirect_index;
> +		__entry->multirect_mode = pipe->multirect_mode;
>  		__entry->pixel_format = pixel_format;
>  		__entry->modifier = modifier;
>  	),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

