Return-Path: <linux-arm-msm+bounces-42878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F103C9F8884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 00:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BA81622DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF2D1EC01C;
	Thu, 19 Dec 2024 23:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bT0eXXZC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAF1DC98D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 23:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734651045; cv=none; b=HHRCGYEIrUoNG85Ek2izmu1JFD8ptRYrstw5DcvQXh+kR8k8fVUGVyIHhXppib06L5BdJH1bbecpLL6UUwC8QRXKfEPLL1wyulw/1QlhSlWQc6W/gdgwQcqH4pzP842P73r3xBwo32Vzqp2+iE+gbq0DnCmj2xgCrSz67VXbnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734651045; c=relaxed/simple;
	bh=kaEpzsBb5BuUleo/fMwIpVGR7nEXBHlQW3zmYTGwKGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJJEiyBcsS9dY390ZGritLv1BU9DXFGoxnpxKa2xmnMyqLFXS8NmB3eH3ieDeejd4yIm3FRZZ8mNtkpblTuDZJ6vHpMpf38WDvXWFEufes6FdPTW5l8kPHJw3B8gYd8ty27BCx0dMOVD+iP6FcoVtgpstTZA3SAaTHex6d89j14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bT0eXXZC; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54024aa9febso1367893e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734651042; x=1735255842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6eBWKvRM2MPJILKOAmrHC0njuvo1MCMYU0j99S0slw=;
        b=bT0eXXZCUlKLAQOiR7RyQU3qrZRoqMhp4gtAaOQMCAEDwXFVoHlhnFtXu01vXa7xIm
         f9zLa8bV404VZXxn3a/rQmcf8YbFLNSNYkBWDgh7/wxTZdLSGEDngBs/mmU9KvvXabOI
         IyfKjKqa0iBKv5XYODIVHodID2Tm7Yf5Vq4wQHC1Kc0j6PpjyqsJQqCUDHB6P6pc6dhk
         tkr8ROkoKP2U4KK360mnOlUcyQ4sBy7q8GWHKZW1FspRksgLC2TPkfV9n3Ov45J2+ueI
         mc2L9urcAV2zjocjo6VK0acTV/dSgw8pSbnYj8IjUNdQfDqJE858hMnLC1Kwo3GrPvG/
         grlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734651042; x=1735255842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6eBWKvRM2MPJILKOAmrHC0njuvo1MCMYU0j99S0slw=;
        b=vdZYd/IbdIGVDRhEfJGd8MqGgao9sLpwaMcwoRIQzvTnr2ANDj5rxaiJ8p7+LohUfb
         baBI1GLkrpAVRAMq9RNG0yh8qB1Z+UR+UiSINPxAbSV9Qk+jndF8wFv3ZInZ9RayDQR0
         o4sDx+Sr5AdMaOL7Ld+kErLIew05mGpOCOtyuhEa7wxowfky7WNBkqHb7ZKB+23G+/NC
         Vrx9tibvjr8U6Jo36gb3Rj9AdBNDu8sHQyk+xSKWJYv2F3ECBjzaOIzt4umoTBkCbL8F
         OVoVlbnDWoJqKLSKhoFeOFikZX8GKhw/GNDEhAPHmf/EC2NtN0KWSkF0DHo/lyyb/ak5
         EJoA==
X-Forwarded-Encrypted: i=1; AJvYcCX9bDKGU38OIOK9rl7zm6JZXeDpt9tetmffYPx6fYHtBFK+EryjPQ6jyxwuRNrxMg/md8ThJbplXsb3lmSu@vger.kernel.org
X-Gm-Message-State: AOJu0YyTU3AkoSwCG3+Kn5BbiyJ7iRaaMNMx2ENyOlnXAkbq90MUGd7R
	wOL3GGrSzJpKGJwuoaDoj1c3NHYF7qBVgGRD/ourxMHnDcjXgNN7/EIsA9ujFy8=
X-Gm-Gg: ASbGncur3/uG/q9PHD+Mq/EZfops8L+piktCkiIW949EXfRdlOk4bFW3HXJiPM6cpUh
	8QgvYaaNXal+Bc08q9D6VvRSUUF+KZa1u8NqdfzoE6+CefdNT/HpKFqq+3uM8Od5AmnP0HxsW5i
	MfYm00u0UP2bYQVYm9MNwTN8SDoIWuw9NtCDx+/j6eCvWu2SeopHhqTVMHnjGwzRHgFL1dW/ys/
	DkTwQDmfoVilCKTZSqBkhMbUTZtjrj/rLP9Mb5XPTaEitkaPyICr4NiK7PzV2vHpAkHjKYREJJq
	Rmsnt+UwIDmNcMrKIUkIWwuTXmwOH/P1wKIK
X-Google-Smtp-Source: AGHT+IFVHf/rBMz3VrQOkPvPS2BjI7hYgByylqDkoLhYqr+25u8TOAePX5JNhA1si7R/9FpPW6Crfw==
X-Received: by 2002:a05:6512:3b9c:b0:540:2208:cce with SMTP id 2adb3069b0e04-54229538a96mr150346e87.24.1734651041461;
        Thu, 19 Dec 2024 15:30:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236006b0sm311092e87.106.2024.12.19.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 15:30:40 -0800 (PST)
Date: Fri, 20 Dec 2024 01:30:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <3scdlpwphzguuwffpzwaqt6puedqrozpscrmyavq6a4fx73n6s@5dmcb23ky3ph>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:32PM +0800, Jun Nie wrote:
> Support SSPP assignment for quad-pipe case with unified method.
> The first 2 pipes can share a set of mixer config and enable
> multi-rect mode if condition is met. It is also the case for
> the later 2 pipes.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 67 ++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 1cd98892898a4..57ccb73c45683 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1163,12 +1163,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate;
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1176,12 +1173,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	/* TODO: loop below code for another pair later */
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1195,24 +1186,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> +			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
> +			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
> +			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];

I'd rather not have r_pipe / r_pipe_cfg for the second pipe in the pair.
Please move them under the if.

Also take a look at [1]. I'm not asking to rebase on top of that change,
it need to be reviewed by other parties, but please keep it in mind.

[1] https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

> +
> +			if (!pipe_cfg->valid)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    r_pipe_cfg->valid &&
> +			    !dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
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

