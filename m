Return-Path: <linux-arm-msm+bounces-49796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F859A49075
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:39:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3B816F024
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE6D1A9B5D;
	Fri, 28 Feb 2025 04:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDPbUTcF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BCA1ADC9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717588; cv=none; b=ouBemkpzjfQ8a6PJMPealbBvoY1YYEAO1GYETN0RRxj2BIcLOXAAMF/ZPGB+/6AjJ6YyxB01JrZPFvLcAGmXIfdkwEWCcIXXARQbExVXiy5buyoPAN7zFNCj+FqYa+ZnmbJlm0snegdtmPeclbCf+I+nHR5uqbC+iR072Ch1BH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717588; c=relaxed/simple;
	bh=XBbghQUqoT9zl7hjKLpvNgYWZx4LiZKyyLTJV1lVHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnl8sMRSZm54kuFPMMIrqjcROeawI7rEn9xSD35q0pGnqKB6s0JGOjI7HjfCyfKNec7BjMT+yz00/gni6Pj02zrkDBJYFot1VVneExibct6S57liYtdbpZ0x2pJqbr50dFwkZuW9DskEZnBjU7O2IAnbD7sXdo0gqw5tMqP3Lyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDPbUTcF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5494e7ad57fso438074e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740717584; x=1741322384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t3/MIfx773wjuQMH+TAWe/YUS0t51KLheOq9LWJO68g=;
        b=wDPbUTcFjpeysKd0hLn1+207z+korHDfaM74HJMhl21vFckF/ZcvET67pG59yF97+c
         Pg0rzFcwHidJ8dQli5hO15tXefIPEEth29K5TNQjkWjQtTWet17DUToXS/2MuiVqnTre
         XPaY4KEgA+iSuJLZkw0o2RzWRamCq/2Pfax4RLAUf12zLlI8/4lcEMwX+tZUNE5nu3zX
         Nh+fmfHBBUO3SnAnXHgz7Z+hf+M/dyUDq1NICkX5k+//qOR5U///brA3ZCUMEAe3HctS
         +3sw6H2K2gryTGm5H7TsMk0Xg6d0M0CV0Llzb0YW909kvFn70QJz8ZaG1yHG+ofzYzAc
         g5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717584; x=1741322384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3/MIfx773wjuQMH+TAWe/YUS0t51KLheOq9LWJO68g=;
        b=YZtjRKaQXjUM7PuokQRsZCMHDoEZuj+jwoy+ZVC4Pr8Bujn+Nkyfhz0qRLLhYgY9fZ
         nWdxg7QJnQyqYSufX+px/CAxy7CnZTCz9zLfzT1poRM3WkrgPl9QaVALb8nq/5OR8d3g
         yMSBuFirBh8EN5Ct1lKLopplR/ErimWBOWv4FOtB0qdmAlm5tAw+wAeX+5ge4Nt8fOjm
         tvPLaOyhscG6sBZPYgxVXIcAwtmrEU04P7mBKC41A+8AT1vwkC/2U9QT8rsWwxTMLh2Z
         /hm4iQf3AgQgLoyONgj2RwH1y4n2V8l4DQZjtcmLikMKKHNMLk/02WoLZ0ffISicbvAV
         hvgw==
X-Forwarded-Encrypted: i=1; AJvYcCVvlPh+RahX3GqEVst9ElAIBsumCWFc3OVTGHjxhh+uazT7khxQ2vQrHhba9ROufok3pfuc9YQD46HDHJQ+@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIHexIUpP95p5U8OhFphughzo1Mf5iNb6e+6sNxu47xYQM5Kl
	LVpcROmO59uNXw8E4hzP1QaK2lrREw5xy/H7ey60zQBH7VuE1gogywTM7hcO01w=
X-Gm-Gg: ASbGncsscoIAXQkN/ITCfz2YFx+kZL5LaNqh+vBwuTNP6YJjXpqbZ78UAPAHVngSael
	PlcZtd5LPg18+9CVNSXK86mLyV9+JOILYwNKvc/YQTmju1pA45xjozsDEJbw8Y5V9ZYsZ/slPF0
	+SaGDSzhJ8WXfFfYp1L6iE8X00zMFrvGAgy8UD9gZoUrSESR0hy2X9WZ0fZMIo/lGxxfJjtuu/V
	4b7S9N2q04O7/Rd585rbnusU1E6L+UhzPP5C9veaCG9vaJLK7i5wSJfX0gefY08a93ArvRpxfQb
	J1RV4pG2t2PKpF382ZdcDmFKiAxNPv+myUilTRmtmnXhNWCAUPQPEa8J41+RV28avBluZGhwsa7
	rman35g==
X-Google-Smtp-Source: AGHT+IFzdRDUvFtdJ8+IGgeDJSTgkwAGTDf8+ZHuGxd9RaHvWBONVJP3iDWwDWh9JCasSnbBlOn/nA==
X-Received: by 2002:a05:6512:3f04:b0:545:2300:924d with SMTP id 2adb3069b0e04-5494c328342mr684654e87.22.1740717584159;
        Thu, 27 Feb 2025 20:39:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd032sm348540e87.243.2025.02.27.20.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:39:42 -0800 (PST)
Date: Fri, 28 Feb 2025 06:39:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>

On Wed, Feb 26, 2025 at 08:31:02PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++-----------
>  3 files changed, 58 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f954cd8c6aed3a222723 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * @state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca42546fbc421609f72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate;
>  	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(plane_state->fb),
> -					      dpu_kms->catalog->caps->max_linewidth)) {
> -		/* multirect is not possible, use two SSPP blocks */
> -		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!r_pipe->sspp)
> -			return -ENODEV;
> -
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			struct dpu_sw_pipe *r_pipe;
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			/* use solo SSPP for the 2nd pipe in pipe pair */
> +			if (i % PIPES_PER_STAGE != 0)
> +				goto use_solo_sspp;

With this in place, do we need the nested loops? Wouldn't it be enough
to loop through the all pipes in a single run, as this condition will
force solo SSPP for the second pipes?

> +
> +			/*
> +			 * Check multi-rect opportunity for the 2nd pipe in the
> +			 * pair. SSPP multi-rect mode cross mixer pairs is not
> +			 * supported.
> +			 */
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +				continue;
> +			}
> +use_solo_sspp:
> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +					pipe->sspp->idx - SSPP_NONE, i);
> +		}
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

