Return-Path: <linux-arm-msm+bounces-45213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D194FA1341B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BCF83A5F4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D72193407;
	Thu, 16 Jan 2025 07:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0R6D/QP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6924D192598
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737013493; cv=none; b=YlPsCWd9FUqRTzpHYzui+H6RZuKyJ4L8WdKkMDaO/1I0ZC6sPqnWQXybaSHs+KwffAdZVVBsh2mLxv+WSCqVJfyrvPmF+SsIz8hoR78xWukiLMkX2PEj3gAKq1ER92JsJ30LQeuxYPEwt65rs5lsgNCaQZ2JwrghVhTJxIZRIiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737013493; c=relaxed/simple;
	bh=tpNvx06/Qo09orsjMpjlQNh1WpdSHaHiNO8WcqIAFzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiUycxR6bXXHtq6DO7gwJ0Z+pvQncdqsiykqsAWYjjjaOwUl7Rg95d9ucTPC2rXqZOl6yRt95qRR7uZiY0vDCt0sp3GGzC+fYnqsKcN9pLmPrGMxihb6XtfpIu7zJjFdkS0MfX2WDez/68p5cnw3weEJDuG3n8sCWOTZx1sL7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0R6D/QP; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54024ecc33dso631083e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737013488; x=1737618288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=biWHg2wuipNHtb9c736XZ1E0I9QutQIX2+ua4fhICWM=;
        b=p0R6D/QPaYj5GJh6mcmJRV8XKu1/c45n7yzbZDpRoyT0kP2B4nNbaOIrNCyROYwEN7
         M9dUkEyajOybGM63qHjfK9dwLMYeZBe8vb4r9N2r+KfimG4Ua7isVIHSykxvoAj/JuAb
         3y30Os2olZfUTBiSzp07c9AnBX6MT3q2WpX+vgiVUhVQlfZqiJKCUwya4dJfT9XFzgpQ
         Wp+KY/nm5j7DFtLjHEWjbLkNWjrt4/7Dh2eTLTxtHUtp6ZST1kZoT2jRn4AlKzzYc3g8
         kR6RSeh5usTfAJIgp4i+SdnASvW4MZBf/AxdMWy56TDgEvR6nECIKJU3Cpzq4jgHqYz4
         8iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737013488; x=1737618288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biWHg2wuipNHtb9c736XZ1E0I9QutQIX2+ua4fhICWM=;
        b=Ys6vJoOtHqKAf8sPvEYdvWi33mztCEAXxtx3R5VeQ9pCG5TzEFupjOIkI7Vx6wey9W
         P0LXz/X1HveN0Ues8vz3EdJWTPuZiRQdkeMrdnI3pKH2NxRn68Js1HBabWgLGzOANSFp
         Vo2mjKrk7NuNxTnXfa774lN+TmuReF0BB0OQvs0BisAMcbVLj2aFv1GJngj33/vo/+gx
         UmfQe/C8lI/eh5o9+4fWck1rQV1oT51u8GuTVm8joefXObS/Vh5mzYRPOb59gyq5Ky9x
         EhBKcv4bIm7YP9PK5nSrKOJMWN3utryjPJuezpP6wEvo/8MNAI0Rm7Bl4EFmxys4AYP5
         Mdgw==
X-Forwarded-Encrypted: i=1; AJvYcCW873LrFCPCVjNYAl6CRxY9sRmp4l3YhFGRjSem7CjINXXwKa8O45q3suB3g/LsnJS6Qb3TUwA1MJU6MKFp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2cuSScyDB5GtQwpFw+GVMbjHxoUlMBDrl46tzXeY+9Lhas6dq
	rHAAcMaCwDb/+qk+YlTaLkjLzWCwKVlj4rP3nwmTu+bRz2KHfMrwOkMlxC5Bi04=
X-Gm-Gg: ASbGncuZLtp1qU3/6cXmfrjT8Mtqck0AIssUqlH2J09tBkEOHn+yllhUBBM4MvNqfIz
	NioZhignuX5MT9FY+aPC/fTNdbK+8RObuMid0lDtC5ZRai/rgYeLHgGYx9SOn27wd7iBfwm0fb5
	7WEYeDCurHqEfdVTxCfq+UqJubRK6LFnkaCJvx594phuFHYqoaDvzsps9zoN6I5m1mCT6VGwLcZ
	pvtQk66ztPisRepzAMpCGmXSzTcnT9g/i7zCpML5++yuPGtGK1jSx+n70PN5bRf3r8xCp2mpI50
	C2Va8U21wcDpcsRB9Vj6iIm6sX4KAGe6eA0B
X-Google-Smtp-Source: AGHT+IGP3X/DhrTrRTJZo+m0r+8hfYqADmOR9+u8sYo6uCVZreubMvDUnUbXM6AGdo5Z5Ar4u7c3/A==
X-Received: by 2002:a05:6512:33ca:b0:53d:f1cb:6266 with SMTP id 2adb3069b0e04-54284546a9emr10464522e87.28.1737013488460;
        Wed, 15 Jan 2025 23:44:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec20b8sm2267448e87.216.2025.01.15.23.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:44:48 -0800 (PST)
Date: Thu, 16 Jan 2025 09:44:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Message-ID: <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> Move requreiment check to routine of every pipe check. As sblk
> and pipe_hw_caps of r_pipe are not checked in current implementation.

Jun, please. I know I might be sounding like a PITA. Please start by
providing the problem description. Refer to the
Documentation/process/submitting-patches.rst, it has pretty good
explanation of what should be written and why.

> 
> Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
>  1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index cf923287dcd05..2b75a6cf4e670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
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
> @@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe *pipe = &pstate->pipe;
>  	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -	const struct msm_format *fmt;
>  	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -	uint32_t supported_rotations;
> -	const struct dpu_sspp_cfg *pipe_hw_caps;
> -	const struct dpu_sspp_sub_blks *sblk;
>  	int ret = 0;
>  
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
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +					  &crtc_state->adjusted_mode,
> +					  new_plane_state);
>  	if (ret)
>  		return ret;
>  
>  	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -						  &crtc_state->adjusted_mode);
> +		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
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

