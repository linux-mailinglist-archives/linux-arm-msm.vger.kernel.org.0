Return-Path: <linux-arm-msm+bounces-45225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEB6A13510
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1850165597
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2D019D8A7;
	Thu, 16 Jan 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mI2zfvRr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F719343E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015248; cv=none; b=FpcZMogAZOAnZCMXgMBY/ZweSSh8HpRpwFXBIEVwCL82Yok+1zlD2uCjX4XwrkxCUwE8qxaIdJ0Yu/C0s+u60gFZbQD+/4L4kbujNoMjE2B1Opgixoq5KaYHBhqzuFGNI1Hk7oNl1Gl16cehhCFg+qEH3GMlndgb8Q2nK9YK3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015248; c=relaxed/simple;
	bh=560PXxlOTc4mniDZ5ZTov+E+G+juhfVO79AF3azY1dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAhidfFZfUfylynUUT8RR+gM1sF6exevzkhoWfUXNpQrft43FZxZ0fn8WRUJNOKVP2W+mpkExc2x5Ic+sy+l6+sEGtlvHgqQ2XYJ3oGLQ8nCuyBBH81mzo1q8VehDNtopZMAgotmqjAgl3FVfIFWcAfvubnI1iT3sVmEJ7Dmrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mI2zfvRr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so619707e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737015244; x=1737620044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t41KpxpKiU9abnGV0MjlkX9oMb/HoUfrr8CVsTbI+OU=;
        b=mI2zfvRrR86vDNjGJsIgY058qbf5RrP9j4EGjdrTZk0ITxuuMSgz8GgtaPZUuyiKQ2
         03RgkKOplHfOuerf7yLMhJinBHJP5RBn8EDaUpuxo5sQ4xuOv9tgIbiFSbYh5ms79+S8
         nS/J7XDXR+IXdgv1ZHxPFrkk4/NMSTp6y+hQtyERuXHIGvSOEf//lGZcVe+wKmOABOoS
         5E9Bs4BjKH04nYjGdAnDQ8piUvEZuqgbuKzZlo8hKFYx4ENfDdJ6u6yBfAOfvtPpwHNW
         pmvsV8yrokY+wVq+rJPrayE7G8Spn34oZntbY4HVTKQU6q2VVNcS+OQqnxLHSM7aXUdG
         dTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015244; x=1737620044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t41KpxpKiU9abnGV0MjlkX9oMb/HoUfrr8CVsTbI+OU=;
        b=BsSLLYkAQJAAw9U8tci2ZMzGJlgcSc2FHpvZSqWPyk55mygbqSwHdT8kkng7sshLqJ
         ltIaJxIBmzkFEkPBMrNrwOCaKrkxMHk6RKgB+Fg9GU68mHyaYAdhIttMbxesjUNU699s
         q4GcSQg6NpFjR0O51IQtDPIikwQEudDBWlnZ0gJDqWWyqQfoPc2lQJ4mmEOh9jGEtEY9
         7n4N2yeTiN/J5iQJAkOONM2HY+VfmCAPvjBBZxnXPSny0v0XY8JCIdNTZjYDG8qGgWta
         tNKJ7e/NmYwQdWD0Qmx2V0X3+4/ZKH8afBtgNO1L4bwvCVe9CBQOLYBT+owOQjjBXh7K
         G+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVCZZdZQlVRR6XcmLW5JTMTLOGDS4RsZOf2j8FWzIraxUVJpzq6Wn2NZmkFFgCZN8YBWVIyfiHXATurisWn@vger.kernel.org
X-Gm-Message-State: AOJu0YwZm2CpIAKYmM4RNkR3envFJKkyXewtPqbffhpvfWRDn2u0fgJr
	fv00NlnqJ+/NoOVkLB8VSybpgDY45eDrTy7pusFR5uBVXzWXLPrr8OtDqdCZPZA=
X-Gm-Gg: ASbGncvqtKRsQCLOUlFia3LQRerBcpXjWpmdK35S+gPt/JFggnciUKbmdB9Nhl1u9vB
	iZn4nmLxihrzYsPQEHwlO3/F59btRJaA6Wh+5G17zz0ZBm4RPxwEKBXY+Z69neJB6ayH5nz0Bv/
	SwuaGDb4JMJGgZ5BtAni9kdnWpUL3uWJyeOcfrU2o2sAMDeHA+TeEMd76gOVoyBvTk6dHH6otPt
	IsYFGTsLEwkG6Z8LqL/cCxeSLBYYy73wAs3Vdd6khuK3t96D8gZnvN0TY2FfVxr/qW521nrIBZJ
	NFStdZlqb1dCNbAwLMKRHvtU8Ff58wbdVXW3
X-Google-Smtp-Source: AGHT+IHBGWgnjQbQaF7K39jBjnb5AglvlmCjor+nRLMUd3AeoVpr507kxz0M1FRsCHGe5AtcazMUqw==
X-Received: by 2002:a05:6512:39c3:b0:542:2972:4e59 with SMTP id 2adb3069b0e04-54284558d26mr10512351e87.28.1737015244267;
        Thu, 16 Jan 2025 00:14:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becafaasm2224934e87.239.2025.01.16.00.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:14:03 -0800 (PST)
Date: Thu, 16 Jan 2025 10:14:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/16] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:02PM +0800, Jun Nie wrote:
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair in quad-pipe case, thus a LM pair should not blend any content
> that cross the half of screen in this case. Clip plane into pipes per
> left and right half screen ROI if topology is quad pipe case.
> 
> The clipped rectangle on every half of screen will be split further
> by half if its width still exceeds limit.

futher handled by two pipes if its width exceeds a limit for a single
pipe.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  11 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 138 +++++++++++++++++++---------
>  4 files changed, 112 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 5ae640da53fbf..a900220deeb35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1361,6 +1361,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
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
> index 0b148f3ce0d7a..b14bab2754635 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
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

Commit message doesn't describe why this is necessary at all. Why isn't
it enough to check pipe->sspp as the code has been doing up to this
point?

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3795576e2eedd..4bcd7b1a05c16 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg init_pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> +	u32 num_lm;
> +	int stage_id, num_stages;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
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
> @@ -886,35 +887,93 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
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
> +	 * But we may have 2 rect to split wide plane that exceeds limit with 1
> +	 * config for 2:2:1. So need to handle both wide plane splitting, and
> +	 * plane on right half for quad-pipe case. Check dest rectangle

only on the right side?

> +	 * left/right clipping first, then check wide rectangle splitting in
> +	 * every half next.
> +	 */
> +	num_stages = (num_lm + 1) / 2;

-- 
With best wishes
Dmitry

