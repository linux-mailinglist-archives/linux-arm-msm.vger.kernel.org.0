Return-Path: <linux-arm-msm+bounces-42876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEA19F8867
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 00:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4FB18854EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA3AF1C5F1E;
	Thu, 19 Dec 2024 23:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AUZLhgGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16961BC9E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734650215; cv=none; b=rIFSKplOCjhpiCnHJ797wG3eIltcyUdd/VSoIWmQROR0hdTmnpJmR1VgQ2ecCfP11BnTS98FEhb2yuOPV7+X3JSzYoPhH7JkezcQlf6TBVyU/YlOBFwPZLSiqVlhlYZHSuuVY6Vc5JSfKE+XCo33lcF8vI9MjRnNhe4fTlx7xdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734650215; c=relaxed/simple;
	bh=TBQqn6FkFbKyVJaYltTgl9w/0cG0S7a5/8HTuDGQNfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwdfFNz1G6Wz4opMpILoA5Foz8jFXLDtBaq+dcvSb6tg2E2p/lUZxwuvf9KRygtYzqpA80s7kX7BnvPAlOi/vA/5pZ4yImyNY9fXd6sr1yik190eQjSV6N15wSMtKzl0Tw+XNat+yYKTGJ6N2U99OnCfq4MQ5dMVwbXKWXyP2H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AUZLhgGE; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1475663e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734650212; x=1735255012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6HWo+881Quflq0pkoSecFgDw3nrb8xLYm5hDOOzQDg=;
        b=AUZLhgGEx54W7im39o6ikCgnJwpZvFESDDxJdtUJKWNcTZlrqJTT+d+xmxVVTwYQPa
         JJoFF2Bf8WxjCvtr10dBVh1PzN3Q2L4Y0dfFruK2ym6DGzm3TgpfLwinF9OZDjEadjgN
         AwFSveFN9KVOmXnMithNY6xX8hsQKP0z7i1BAYZIy54uueLnq+wJl9ppYlAM7+ct9W+Q
         MC2rsOP6lMlFiyR8MPpTEdRF4GHWdcwzQ2IEJnF+2R8KI6aTSYQaeH7qidhr2PxHrdup
         YIOSr7Bgxt+1YFeQUJPGGH1CIsSIqF9TZcU3AcxBtPKM5RQ7mg7MLKYGSWrapnFll1zK
         Og6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734650212; x=1735255012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6HWo+881Quflq0pkoSecFgDw3nrb8xLYm5hDOOzQDg=;
        b=ZhZvrTM2fJu/xUyW2KFKVH4UkoH4RJ584z0WXVjI4XxpMRHMMb7XB9PL2AKJiXjymM
         MiGU5SiTEBGSJ0vMrsvvi6RcnAiVjcH3I3tPR4UqIzfsBPsxhIEFu60WXpmgTtc4Arpg
         TkUW5PNOA2hnDGx6U8hhXjQpQIFv+VPY4PNVTAUNQhb0ei7MxG2fUS+j62+HRb6Z7okp
         azCm1IEbhhLLBG6ERNpCGjqwzg3cNPuwPt0xBfd1WLoOAij6Uul7aNQs5iVksf3qsJ2r
         1k/JR7RHx5egNiRC11po2VE11r4U7V55nz/sTnNQFxP9nKKtoT8eAn+m93D63Llf/X+X
         AZeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW7d/x3CvgHfnCWLxl3hOgDd0AnTbIlKWfeFjUeC4+3ewZ9fUDawt6GG1f2XwnxF936BVD8E4Ga5VV8SPW@vger.kernel.org
X-Gm-Message-State: AOJu0YxgS+RbT2I4zFYNSV13nqptr0QWiu/+DZ9NKoMLtEPrGdS79/kL
	vT2OSlPnp1IeQ+rrn4uKiAv/15a96p5PVMD/yMAvDDLlEgJZQidcjJaKyGl0tzA=
X-Gm-Gg: ASbGnctcoqDmfB99jCbzETm5DgIwcJ89zyI8ajLSSXdT5l65beypa+ntKQBVgXqKJpO
	H7UFRUUwFNLlhRZ3p8BlZompTmyoNuTFlLqWHcBB5D0W/L7ODAMxSO3BEw0eXic60h+oqUKClCT
	HRw/rnKzhTiP5jV0DVUbYR3x4ewzKPCp/bwg1vdPi15cGkulr8tu1jxTbg8SBLAA5L0Bf8ff4xt
	PqJiIlhidAog4+0fFpzeIbpoJ0O9iAzHbBE4jNshbtIXI/lBdUZKTD4YuX4mA0hIwWPODELspY2
	dgbXVnhA202L9GvZYmZQkyPUCT53pyeZvgsz
X-Google-Smtp-Source: AGHT+IHtcaQUcq0dFWE0DNDrm1RyTGJhTil5NQArdVtFbzEw0uqQZ2MlJJ5fgSFsaJYAOrBRRkmTqg==
X-Received: by 2002:a05:6512:1245:b0:53e:2c74:d65a with SMTP id 2adb3069b0e04-5422958201dmr145044e87.41.1734650211620;
        Thu, 19 Dec 2024 15:16:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832089sm306018e87.268.2024.12.19.15.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 15:16:51 -0800 (PST)
Date: Fri, 20 Dec 2024 01:16:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 12/15] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <srrxipyabkfycfnkz6h62257lw2ecxgoldoh7fbs72ekszztem@oa3ohbgndy4a>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-12-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-12-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:30PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair,

Only in case of the quad-pipe topology.

> thus no content of any pipe shall cross the LM pair.

You have swapped the cause and the consequence. 

> We need
> to clip plane into pipes per left and right half screen ROI if topology
> is quad pipe.
> 
> The clipped rectangle on every half of screen will be split further
> by half if its width still exceeds limit.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |   7 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   6 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 108 +++++++++++++++++++++-------
>  4 files changed, 97 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6ef7e6ed00238..bad75af4e50ab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1363,6 +1363,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
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
> index 0b148f3ce0d7a..d1bb3f84fe440 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -264,4 +264,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +/**
> + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> + * state: Pointer to drm crtc state object
> + */

Rewrite to be a proper kerneldoc, move it to the function body.

> +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 56a0edf2a57c6..39fe338e76691 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
>   *             such as decimation, flip etc to program this field
>   * @dest_rect: destination ROI.
>   * @rotation: simplified drm rotation hint
> + * @valid: notify that this pipe and config is in use
>   */
>  struct dpu_sw_pipe_cfg {
>  	struct drm_rect src_rect;
>  	struct drm_rect dst_rect;
>  	unsigned int rotation;
> +	bool valid;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 46c6b6126fe5c..fca6e609898a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -802,8 +802,14 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe *pipe;
> +	struct dpu_sw_pipe *r_pipe;
> +	struct dpu_sw_pipe_cfg init_pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> +	u32 num_lm;
> +	int stage_id, num_stages;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -826,13 +832,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	/* move the assignment here, to ease handling to another pairs later */
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
>  
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
>  
>  	fb_rect.x2 = new_plane_state->fb->width;
>  	fb_rect.y2 = new_plane_state->fb->height;
> @@ -857,34 +860,87 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&init_pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split plane with 1 config for 2:2:1.
> +	 * So need to handle super wide plane splitting, and plane on right half

What is 'super wide'?

> +	 * for quad-pipe case. Check dest rectangle left/right clipping
> +	 * first, then check super wide rectangle splitting in every half next.
> +	 */
> +	num_stages = (num_lm + 1) / 2;
> +	/* iterate mixer configs for this plane, to separate left/right with the id */
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		struct drm_rect mixer_rect = {stage_id * mode->hdisplay / num_stages, 0,
> +					(stage_id + 1) * mode->hdisplay / num_stages,
> +					mode->vdisplay};
> +		int cfg_idx = stage_id * PIPES_PER_STAGE;
> +
> +		pipe = &pstate->pipe[cfg_idx];
> +		r_pipe = &pstate->pipe[cfg_idx + 1];
> +		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> +		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> +
> +		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +		pipe_cfg->dst_rect = new_plane_state->dst;
> +
> +		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +				" vs clip window " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect),
> +				DRM_RECT_ARG(&mixer_rect));
> +
> +		/*
> +		 * If this plane does not fall into mixer rect, check next
> +		 * mixer rect.
> +		 */
> +		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> +					  &pipe_cfg->dst_rect,
> +					  &mixer_rect)) {
> +			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> +			memset(pipe, 0, 2 * sizeof(struct dpu_sw_pipe));

No need to memset, just set valid to false.
Also it is incorrect to memset the pipe, you've just lost the
pipe->sspp, which is set if the non-virtual implementation is in play.

> +			continue;
>  		}
>  
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	} else {
> -		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -	}
> +		pipe_cfg->valid = true;
> +		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> +		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> +
> +		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +
> +		/* Split super wide rect into 2 rect */

Why is it super wide? Just wide.

> +		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> +		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +				return -E2BIG;
> +			}
> +
> +			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> +			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> +			r_pipe_cfg->valid = true;
> +			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:"
> +					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect),
> +					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		} else {
> +			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> +			memset(r_pipe, 0, sizeof(struct dpu_sw_pipe));

Again, drop the memsets.

> +		}
>  
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +		drm_rect_rotate_inv(&pipe_cfg->src_rect,
>  				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);

You've dropped the rotation of the right rectangle. Why?

> +	}
>  
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

