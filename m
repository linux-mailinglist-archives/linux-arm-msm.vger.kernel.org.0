Return-Path: <linux-arm-msm+bounces-45226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AEA13524
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416141881C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998E91AAE1E;
	Thu, 16 Jan 2025 08:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lV94wHYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C51A4F3C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737015503; cv=none; b=R7JGjQviTJdcj2uWuIHDTUZGLqhCC9PFvh6GerCuWzhe1F/q+Cj+zDAudNNqxWo0i+Zceo6Dmz7Bm5Ea6MvS/oqIkV2kiKsqRZlM/MMhM6bKVg4PW+B1vp8bGmv35tpBCzszOo5uXe0JR8uL05WsU949aKohHkcn8ATNo572/S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737015503; c=relaxed/simple;
	bh=N4kslca+Ks/jwFmlEIN73q0qpvay04SGBAzmOJKs/ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctIkpegk1BWS8zb960RyQgeI2hWqh/M/tAE9c9YbvFTNSBIXIqGVxZfiiuK0r6wgMP2Ty0gOvLOlvITHhShrcs+Kwx/qePNN+V8A+OaxOwg49uAWTiTsntoofEwKBn2JKZsEDqFpcyuyxgdC+f2BjbBQpLMV2oUwSp+2pl+UPSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lV94wHYQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so528499e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737015499; x=1737620299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BBRYijatydQgVzSiuVY77R+uqeAtmhSMfg8qktQdI/U=;
        b=lV94wHYQOLop8udfjgJs8s7BGVks7ZoKfIWTuz3KjzZJ8NSUZ+I+qJZ0Nh4ttQBTZf
         k4CTBmDk4t6eCZl7Z7gnnCOKrclBBJ9aSE47yj65EDYCML8XJ0X3zVV8Gzt1wvuBfBLC
         YQlCysyzOODwWbzZzbg3iVkeEPkxAPafzWNWo8VCuLx9FNnl6ojiWmIe4CgF+5WPXz1C
         Rl4Q29CCygjVN4vrsTRniA/TIV9JnUERCxAcGvwYb136kVxcExfHi/fqE9BNy3+FGObQ
         QYGOs+pTZV8zYwC07+N/+yRSC/3vcrHq0iHcDrNQPWhm+9eMvdejKV0DfG86ut7vfNva
         jw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737015499; x=1737620299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBRYijatydQgVzSiuVY77R+uqeAtmhSMfg8qktQdI/U=;
        b=G0voH6C9DF8wQF0YCVNwQzKpQ80/FO8CqsDnwoBjw2D2VBatKIKJuadB/IEy5M5NYy
         4WaTzhVMHSliCw3EpxyT0lEQqvSTZV6FB4BNVIm5tIPbbCUR9cohephB69lxoLquFelg
         wMizfd/9YoCH1XVuQhOxdIQt5yuj1rvUDjPeb49LajSelnR9bP0OJjvGHw9usptX1XIw
         G/eickn9zYBAmyiNp52tbXJv7JNDVHGMIEJ1cBeqC2ghfwd4jtU0XNgYPkinYzhwWOFI
         lpaklsQtzusFoiHiRVBF6N0Kv/27UHmobMRiGctUVpc2dg48Ziy7OrtUeZ/G7HjClmWk
         /QlA==
X-Forwarded-Encrypted: i=1; AJvYcCVBgMrZTvnm2sCbSyDYu2lPO+Qum7v2/jG8xUozT0PZgdwn6KTvcDXv2VKVZGXgI56QXfHqW/JZh4XY6zoF@vger.kernel.org
X-Gm-Message-State: AOJu0YxiRke8PezcP889Q1YqFzgQPLWLqf9KBJHOpC0cK74Q/HyMKarb
	COWkN77ynV5IOyb7aDPUKM7FSgsQibYf/QOyUTsrdmO3NMvcd33ZbycBNQY0Wx8=
X-Gm-Gg: ASbGncsJoQ/lNXPkaAYKVaRhFhV23tHE50oXa9AaqT4zH2VYLnN8ZKSnQ/3+QuYOgvV
	nxHlecOvlVdaSrkWTWtRStxnON7uTWIgViWU+vVPWKjM9HbGpdJiyAKTw/BlxaaxvYOnyrY2hqI
	XbTGKNoQ571bkS6GFsW9e9I8nXYu3RJZM3141I0kt0jJmhpSRIRYO2z9pgZLB1pPq8HGJWAIyP1
	uuppwEVicbCwgeZsVqQSZ/u6IlTl+ajQZZnksqy6cVfiG/ZWpC1HFiNJD22qFKFz55/D9EWmyEr
	Ipq2T2Fn7caY53P2DHVH9nhntLdvqsNL48Rm
X-Google-Smtp-Source: AGHT+IHm/RgPW0rZIyr7zzNsP5cCSYP/kctP25DgzTdzFj0fBdGSrUSkIQkujtSiMXV0EQOUkS0mRA==
X-Received: by 2002:a05:6512:3ba3:b0:542:2e04:edc5 with SMTP id 2adb3069b0e04-542844ad9edmr10919173e87.0.1737015499468;
        Thu, 16 Jan 2025 00:18:19 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be499afsm2223831e87.49.2025.01.16.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:18:19 -0800 (PST)
Date: Thu, 16 Jan 2025 10:18:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> Support SSPP assignment for quad-pipe case with unified method.
> The first 2 pipes can share a set of mixer config and enable
> multi-rect mode if condition is met. It is also the case for
> the later 2 pipes.

Missing problem description.

Also, shouldn't this patch come before the previous one?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4bcd7b1a05c16..d96f4405a4c26 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1171,8 +1171,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_sw_pipe *r_pipe;
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1180,11 +1181,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> @@ -1198,24 +1194,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (!pipe_cfg->valid)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    r_pipe_cfg->valid &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
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

