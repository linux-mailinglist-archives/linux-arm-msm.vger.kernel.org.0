Return-Path: <linux-arm-msm+bounces-45220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C56A13485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:00:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD4B3A65A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B632819AD8B;
	Thu, 16 Jan 2025 08:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CSUUmFKV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E311991C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014411; cv=none; b=Wc47WStwGZyokjboa9gAt+aec/FXvxq5oU4ZKYfMzT2S01ySEVzjBmYvGXZ9ejETkDziM3fydLIvIwRSw3OT76G41s0gwhopBSV15V/Cw/TOCQCEcRs0Zz5rZTmWNanUVOVrmNcJRF2YKsoiSpjG2dddcuc4RQRafbMw+fIy8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014411; c=relaxed/simple;
	bh=YYtMK/CEI6Qx8Sau9fp86WS9fMvdG0oGZMWxqbXCYMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lXxccANEUL3VDe2ebCylDcV3Ylw1eeHFKjkUEUMfjfxzw5fsuRDhl1XLHGX77wopPBVQPLLNBd29gr57EMUwrZS/gHOHQpXSr1l6rDSjmshYbnKYzVszm0ovxsNyuJmF+HwfCQKPYskzE4Iqg+EHYu4h8yFz2iV8+bYgt/IGYuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CSUUmFKV; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30613037309so6299991fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737014407; x=1737619207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lgyf5JiYt/UCif8qeLhgiYqdVOVIbRTpmNxirzt3IWw=;
        b=CSUUmFKVOgKcDMlUAfhGaOYUW3eE3eLEhub5Llhh3qQBh9j1VwRRD5WYdHh6TrO1W9
         iSvGEwHLLOdAUkctj8uvPOFdNoQdZVvaFGx8q0XkgADObQKbp0GuwTx1s2Dc1THXlUF+
         2RrQBH4cXPCKl+eD03yYpKo29FWP6KDMhODldRlGgHrxd7T+bY5HxqPXII/qHouZtdhl
         ZwkhmKbsONNR9xL+xd8DarCTi/G2I4gwekYTQ9Ar+pLhFo7qtTPphDYKjS2LtiCLkGLa
         ZvEx27phv3XXvGl8iVLFSBF1piLadKKDV+itcO7ZsBc04tKaduuMX0scM46WtwM5+Nej
         jqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014407; x=1737619207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lgyf5JiYt/UCif8qeLhgiYqdVOVIbRTpmNxirzt3IWw=;
        b=QU2VWOjW2Hua6o7u1b46CGJMx3lFhaDCLjqdic2JUhE+4wP1NIkKQR8ROl6XMtuWoI
         Shq8znSN6STX6802GyuC0rtmshRCyUErwT2VmHUHwJTPQzHi7a2pI+zKWrbe7MUw7gN1
         TICaXJXP9kCqiEhTCZk9kSLP8TRuma04jJvNSRDMypKdhz9vBR3wzeBKBb7g5gWqYP5w
         RCCnxuIfiRFn1XkqzZm/FQFpU5Wb7HWoycBtrerYxBVTusw67IxgZd/7ALOQKf26UDI5
         vEj4rOpFVC+IsZMb/b37viJU2/VV68sGHGt9ZnLeoQiRbG+dSztQJWRiBbMezGphOK5M
         KZrA==
X-Forwarded-Encrypted: i=1; AJvYcCUV9zxNbq9Mr9c2wY4vZC28T0Q1EtgNKHboOohP0troC1/9gfMiAJfc9XSLCPTG16YOGixhIMX3ZHEWlt4g@vger.kernel.org
X-Gm-Message-State: AOJu0YwzcneiNJyuzreXNFSpeFaBwoNLhnMEBGCXuasz6a/LjICCAD92
	H/eVLbO/0OnMqfOvk/+dLKDwa1NHKa7ZN08sqxoB3PGYzY0Z9IKFDGA4ZDR6jZI=
X-Gm-Gg: ASbGncsgHjOIM+YMpY88N2SCJ1eQb7avM/Z1F0+x+8L98Chef3lHHjoLP3+vE85S+9+
	atApDgPs8gAuh0j2dlqbEgtQ/Mg+EANTjkClJCwOzcDbse7givFNTNw7R9UEsdxs1SmWuCH9xDt
	kuds+86EBnsv8d4JuZg7LtgUenWvvsca+Jpv/eR7WqTum70j3ONAxID9cEdZ9qvKqNXkPEJjv6J
	b+RgcGC4rl5OljSNFaeeUf5QonDzUOhkgS5rSJxyFfw+HBZ6BaHVNhd8oyrX4AWlC0x1gRAvAie
	XK9d0a5h3GMjUL/XBe+yHjcmvB5zdd4A2WEW
X-Google-Smtp-Source: AGHT+IFOaFHKG3vmAlVkEzYZ24zEYUc38XEeNvhDkvKm3dmyy/fhphY/O3DbCvmhPom0YOhbVNmABQ==
X-Received: by 2002:a2e:bea3:0:b0:300:1dbd:b252 with SMTP id 38308e7fff4ca-305f459a2aamr103241301fa.7.1737014406705;
        Thu, 16 Jan 2025 00:00:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c78c5sm24065041fa.93.2025.01.16.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:00:05 -0800 (PST)
Date: Thu, 16 Jan 2025 10:00:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] drm/msm/dpu: handle pipes as array
Message-ID: <l6z2skrj2tvlnqok44yepqs32keuz3wsfpgsacesrxi3q4s4xb@oiicfia3tkef>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-10-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:59PM +0800, Jun Nie wrote:
> Store pipes in array with removing dedicated r_pipe. There are
> 2 pipes in a drm plane at most currently, while 4 pipes are
> required for quad-pipe case. Generalize the handling to pipe pair
> and ease handling to another pipe pair later.

With the first sentence being moved to the end of the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor issues below, please address them in the next version.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  35 +++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 167 +++++++++++++++++-------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  12 +--
>  3 files changed, 112 insertions(+), 102 deletions(-)

> @@ -853,6 +855,9 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> +	/* move the assignment here, to ease handling to another pairs later */

Is it a TODO comment? It reads like an order.

> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>  	/* state->src is 16.16, src_rect is not */
>  	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
>  

> @@ -1387,17 +1394,28 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
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
> +		/*
> +		 * clear multirect for the right pipe so that the SSPP
> +		 * can be further reused in the solo mode
> +		 */
> +		if (pipe->sspp && i == 1) {

Wouldn't it be better to `&& i % 2 != 0`? Then, I think, this condition
can stay even in quad-pipe case.

> +			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +
> +			if (pipe->sspp->ops.setup_multirect)
> +				pipe->sspp->ops.setup_multirect(pipe);
> +		}
>  	}
>  
>  	pstate->pending = true;

-- 
With best wishes
Dmitry

