Return-Path: <linux-arm-msm+bounces-41161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8619EA0C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 22:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5718B282415
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 21:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B4C199FC5;
	Mon,  9 Dec 2024 21:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IjqS4a7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB485C5E
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 21:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733778259; cv=none; b=caPBKnTNp+CakarStMo5FfknbWpPLZgiFWFKiXful8ZTwRSiSedf/FdODItOgLIOUgo+85cWTtCczGKC+Uc0HNh+PAjTr+EHfXVMcbiOCgTx3Ff/88foigEi3M1OtCZ/sI8D0WxvOStiK3ZswUzUuOFQAGmH98umOr5rQFeMVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733778259; c=relaxed/simple;
	bh=mErQLaZMSehpj+0TcfYb3qU5y759ZkKuAh0LUXHnOJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oklSvV3/cAp4yOup0hu5tKuwyoLKhGkWCTa20dALPrMVhI8kG+MIpyxF5SVgGiz0TAa+0SRG0qJkU1sZVhqZTTdhxoOJJNOS/TFebyaLfhlPFzLRfV1Gz1nPgkzCQj6GmiGkpuWGlrqjSemutNY+ZP9p5z5jOCh3/y5UKRbDK34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IjqS4a7o; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30229d5b22fso9277041fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 13:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733778255; x=1734383055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ma5GtyG8ioog91EhM+P4GWHWrGCT15M/sea78+XBKE=;
        b=IjqS4a7o4XFkH+7w//FPT+Z+oazWHy/B3AH4f/KerZlhiRFiT1dHh6+WK6hXSfh498
         fY0s/kPWUPENJHaFlZWkS/zUKoP9gVt0TIu/fqK8JlrktK+r8epC7yNzUrORqjptw6sI
         n+eSahjYPYxAukPvuaVKW2lTqCPsAEjEMxH1FB/ysE69sSPyrOt2DMe6TRoeBxwFzDM7
         tvMiSReWeiDB9Mt78FCgX78xiTyCU58M5I32SBuXYFj6q10l+wTUoJZfTRXI3RvMr3GK
         jkA0FbA+9ETMV6SDWIdo49RpfhWa3Ve8zWmJG6Ukh6fG3BZWDpQwU87BjYVcHKEgvWuB
         EwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733778255; x=1734383055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ma5GtyG8ioog91EhM+P4GWHWrGCT15M/sea78+XBKE=;
        b=K006gH/xXTQIA5Oyx1YFEaIA11KgVvOv4qdumxWVFcsn+5m/4+x3pRBZFxOL/Yry8l
         FUK/APOwRSPMV831sT5BKf0zy+85FK6M6LkP7xYXviCcdOjz0Pil2U8lUTymNGQOuggc
         6RgcqEk/hBY32LTSftLk1GwZH6o9g99kVkSxDNePdAvsHUetROuvejI6Aek6G7hN83LN
         MHOh0bTZ7UEVYxjaWSM0OsL0mWsgOmUq3hLfDAsJo3l6jU+WubLHGwhlKR1rGmeXjdG9
         4PYIBRG4T1WGpJtQNBA/EpY/RYLFI4evwwgX94lfUzeDRwHm2KEdcw5WWr580oYDDCxn
         JoZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU5yZKr7bL2s62QLEGnO3eeogM/yRHKvnOT/bIfptrc6+I4hmgt4Fz7Q36W9vyPbt3scxui7+NvFPVFy/9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQDeKBfJG7SHkGPj7kWKB8fmlxixMck4xCFWLMvM54qJ4YDSz0
	QxKaD2efczH+tExj11kbP2UKxFywFLnQnNIqbWJ/BCqjDZkU1n3smM4B3GeDC+w=
X-Gm-Gg: ASbGncuqvYeFRunxaa1GwjRpoVfxp8mR7plBSxlOE/Q59A54C+VgLpICpnRNcKdbCCG
	gOsvNjuSevnUzQpMXUdYBGYqfby3pTCv8r9ul7gRBEFDYxqC0Bsqcld6RIZdSYPOmG4+y/12gBu
	MQ3OJKx+Kf7KsMmWKBSmvQ9NNS2RdTRfIGys75BFzad/txXJ0DDNABV8M7gc93Zl+VHSX95OmON
	q77FuU8k0BbTswP0b3OLH3J0PMVO2mTQ0HOfWq+dbMMbT2L3pFFaWLAJMyWcjxM8zzFrkOdbh8D
	hEyCkKHY1kjZU9tjMdGG8niBYS9CLRSfKA==
X-Google-Smtp-Source: AGHT+IGyoN5lvEyWoIQKeZ0cauegZG/9/HnT3c9dEG7V7kOpedR0OZrCmSQf0J/flV38TzNZUm43Vg==
X-Received: by 2002:a05:651c:541:b0:302:2c61:a1d3 with SMTP id 38308e7fff4ca-3022fd89c5dmr7913551fa.36.1733778255053;
        Mon, 09 Dec 2024 13:04:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30220d0b34fsm4716121fa.60.2024.12.09.13.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 13:04:13 -0800 (PST)
Date: Mon, 9 Dec 2024 23:04:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: check dpu_plane_atomic_print_state() for
 valid sspp
Message-ID: <d5yfas7yzilvjryrtdi2miaw5khnycm7egn4dd5ff3vu7z4op5@oit2xvsyx5l5>
References: <20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-check-state-before-dump-v1-1-7a9d8bc6048f@quicinc.com>

On Mon, Dec 09, 2024 at 12:37:51PM -0800, Abhinav Kumar wrote:
> Similar to the r_pipe sspp protect, add a check to protect
> the pipe state prints to avoid NULL ptr dereference for cases when
> the state is dumped without a corresponding atomic_check() where the
> pipe->sspp is assigned.
> 
> Fixes: 31f7148fd370 ("drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/67
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 3ffac24333a2a5b01135d4ece418432d4a74dc04..fe3fd9587ec61f241ccb8c28925c7902b92bcdcd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1333,14 +1333,17 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
>  	const struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>  	const struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>  
> -	drm_printf(p, "\tstage=%d\n", pstate->stage);
> -
> -	drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> -	drm_printf(p, "\tmultirect_mode[0]=%s\n", dpu_get_multirect_mode(pipe->multirect_mode));
> -	drm_printf(p, "\tmultirect_index[0]=%s\n",
> -		   dpu_get_multirect_index(pipe->multirect_index));
> -	drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> -	drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +	if (pipe->sspp) {
> +		drm_printf(p, "\tstage=%d\n", pstate->stage);

Please keep pstate->stage out of the if() statement. LGTM otherwise.

> +
> +		drm_printf(p, "\tsspp[0]=%s\n", pipe->sspp->cap->name);
> +		drm_printf(p, "\tmultirect_mode[0]=%s\n",
> +			   dpu_get_multirect_mode(pipe->multirect_mode));
> +		drm_printf(p, "\tmultirect_index[0]=%s\n",
> +			   dpu_get_multirect_index(pipe->multirect_index));
> +		drm_printf(p, "\tsrc[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->src_rect));
> +		drm_printf(p, "\tdst[0]=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&pipe_cfg->dst_rect));
> +	}
>  
>  	if (r_pipe->sspp) {
>  		drm_printf(p, "\tsspp[1]=%s\n", r_pipe->sspp->cap->name);
> 
> ---
> base-commit: 9d6a414ad31e8eb296cd6f2c1834b2c6994960a0
> change-id: 20241209-check-state-before-dump-2a015ace5f49
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry

