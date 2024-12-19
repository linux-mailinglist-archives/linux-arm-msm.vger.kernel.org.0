Return-Path: <linux-arm-msm+bounces-42871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AC39F87DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4986166C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503A11C5CC5;
	Thu, 19 Dec 2024 22:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGZrZsZv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F8C1BEF81
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647378; cv=none; b=fZZvEZYv6oUlJ/ERZZsVKH/y4qfZpQn161BjAAS462L25Zvze76zwC4R8I/mALdhPnjYIx+AoFlHgNeJ1KUgS3W/SSaf8EtDhQPs7NwYYijJjI40835uxCNycp2moIqKhPRaUGElwsGAjtjayRXOq7Mn5R0321OGtY1UGpW/1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647378; c=relaxed/simple;
	bh=H+whKh8UyV1F6BNhGKhlJKuI3hjdjUsm6IfN0FtKsFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRak+pX5Z/puLp4YPJAhNrEuja6O9I83EktleRB2RRu3GI7RNowNUVO5S7IVTy1/wlIKSRC5f3A8tMORosIAhonLSa5LN6jV/cKmILaziwLhvvNgVwPm+jrEoZ/Ou9f8Xxs0fi5UT1vJx+SQR9aAnVWaOoRDwaT+WSbWF4JfVgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGZrZsZv; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so1273311e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734647374; x=1735252174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
        b=TGZrZsZvmfuIBzOylVJytLrgN/246bj/V4fvQw6pnqdZ+Z6Lxgfi27xOj++pqUyBF5
         ReTNoDOpjg/1GkZwpsGMByh4NiwsUBVO3rQaNBdK/oI9hQkrjuoK4nv/efoeU4zJ5PGh
         OeIW3wg9fKGj4CNJAfNtIXcKR9bdUXvzAeRWM/i17a2rCbBlym+MyLCc2MO+ZnE/09l0
         4dwndH8P909nZxSGQuoTCD9ZNblAiV5Gp7m/PaC+uYcD5hfewm+Lb7nuk60d/azUEESS
         Td+fBaOgbbFyjFmLYZ/sPMEsk5O0bx70SEblde7TEKfUjGhXB475//DZxugVR+xJnvcq
         62Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734647374; x=1735252174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktf00blgG2REd1F7A4BFFcm/g9cGAbuNL5IjQ8xXSgo=;
        b=uyepjdw3ZW4XBYN5BwCg5/B9cZmL4mj/Ays2V1aA7WdIVycrJj/iKFGQ9O1Hln+V9k
         G13T680Q9WzYZuty0Jeq8/Hfyx/uunlNEoEC1MaFy0Bj2PUxQDkGIoBtrlXkqSrywFaD
         T6CtvXtuvCSwCTNPo11NH5fGY/fphL40dP76Lj+Hc1r91xvoZutOExztCQKtXqWdPSRc
         VyYIoR3gyTxrw3B3OleS+dqIipyglEZDSA6cQhqr3PgmlAbW9mJBBXBV7PbfzvK12Crh
         r4+ZAAh+Rxh/DqhRXjCKLVo3XUH/jDaBdSOqkHTKVOQ+TinRn/wEVGHrWVlv66lNTfCn
         mbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUYp/CbcP18IErMgEV/9d2f49dK10zzu3VSzR4BvnkanFNc3yuo/nFpJIY1V78m5qiyW3vOjIGSnChPapv@vger.kernel.org
X-Gm-Message-State: AOJu0YxYs0BHAHMs83CkX7IAN+UN5trZMG0px/lrkczXTSN5At7GMNVd
	K4k/XNPuY/Pzpoo+fFkt1wlcjVwHfPrJiEqQIUdWONfxR8kHnsG3gKi3WSI1lJs=
X-Gm-Gg: ASbGnctBQ89J9sC6wNRT83iw1/AkZy/PmR9W50YTRgrL29duKc0oplakL7L9q9BeXmc
	DdBvCgrKiDeCU3nOnNvei6pGTyWLqZUlcjHj6YPmzlVinxCK//XkwbWV3vikeS1bgN+ZvTl4+/R
	xvJn+V+gcJtEvSC9T1PQDzJfFVPoRx3avIK2pTslRm9KtiODV2K2pKjrIKcULBFmVeRGcjeUnQk
	znQ9+leuCmh6dlvtKpHjnKDHoYKQsMk/otu5MUaVaRrfHbWh3JY77iYJZcSkJg77AQv7vruYP8T
	XQVDBU86AEIfrX7XIJEoSBsO6GtWZZPWxDGG
X-Google-Smtp-Source: AGHT+IFMM7IxIREim+tWSsfHbYnZXp42QWfaJbZuCEzIN329HrV4/pAlBkqpNqL2/3JQwCfAxNPnzw==
X-Received: by 2002:a05:6512:3087:b0:540:1a33:dede with SMTP id 2adb3069b0e04-54229533383mr60123e87.21.1734647374424;
        Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f66fbsm291938e87.21.2024.12.19.14.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:29:34 -0800 (PST)
Date: Fri, 20 Dec 2024 00:29:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
Message-ID: <zaz73zvyczdvrhwdo32el5seefuo2ocgst2jnh2rjsfz42vyy3@pkebgkbo5xd3>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:28PM +0800, Jun Nie wrote:
> Add pipe as trace argument to ease converting pipe into
> pipe array later.

Isn't it already converted in on of the previous patches? Also you are
adding it to a particular trace function, trace_dpu_crtc_setup_mixer().

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 72ed8749cd716..6841d0504d450 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  
>  	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>  				   state, to_dpu_plane_state(state), stage_idx,
> -				   format->pixel_format,
> +				   format->pixel_format, pipe,
>  				   modifier);
>  
>  	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
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

