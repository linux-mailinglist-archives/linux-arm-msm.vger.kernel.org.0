Return-Path: <linux-arm-msm+bounces-42875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BC69F8800
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 23:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D358916B118
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32841C07CB;
	Thu, 19 Dec 2024 22:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g3Mmlo5U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD591BDABE
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 22:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734648057; cv=none; b=LdyjG0OS3BLZdkQ3n558iiTPHz94a3SAAH8oF2HkH/I2KxK2Cj+AYwSSMcexAEj85u2A7BqJB5p6tJVd7cGZhzuVJ6GLGOofK1RnLYleitLwAyZUjz/DTi0zAlthDWYeNJrTL0Rh/QKwiDVjbRu88oxdeR2UGETnqh/lqsehcl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734648057; c=relaxed/simple;
	bh=mXlTVHnp/S/8j+ts5R33cX4c5E17821wsjFhUY6dTJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+Fpp0Oqn1yt/eivbBUkgort0dYnnEoLXAQcU899gwrjN+E7Vlwr+uDuVFdwrfLzAlk7XNLII75MdqRimcFh1BNmqm3OxKIrjbOJx6qRRPMmmV4IVsZEgjBO/khpYiFSZj1tsBF9vS+nbn10YGiiMPHO/ChWElT6DNFFvDui5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g3Mmlo5U; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401b7f7141so1018437e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 14:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734648054; x=1735252854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vh2BxipYNQWFszB8ZE0t+5AT9BL7t6v/D0gD+HOidz4=;
        b=g3Mmlo5Us+Zfvov+0DxjObnqe4tw4eS6NraUFR3ASdkGW13Sqo5NDmnAD2aDlSmWZB
         t+MPEHwLWC3cvWA4Wl4AerYXUNi7OSnw6mWZvIs4zrHogrust/spuQjreuuvNSh41p1P
         wWNMFZZxfdIsK6qfxB6+HJ64sadk94nmDgFtOe0n/+vealuJFrjm+e8Eq24LiF1VNHz0
         oG5tb6/Ll0WsUJ7+xR21eEb7zwGh+6Mmbdrt0kbaTFxggdyC/q8BP7i3JFR3by3LHJ4P
         PKEzKcHylVCN/8tBwMMlOpyLcdE5XVwrQl6P1+X3cNQU0egOWIcZZOtzuw8dkr9mFKU6
         9Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734648054; x=1735252854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh2BxipYNQWFszB8ZE0t+5AT9BL7t6v/D0gD+HOidz4=;
        b=bY1PcsPlf9OeCr/Zda20rRGVKQjJX5JxgR4ctC/SDXN+k2nDnjlmHwFH7q/AduGf8K
         eKaoVdbVt0PSCJuW5z6Cw3q04s7pfOUPogugh8K2jVydN7rkUSsCqO7oW4ZSYxOFywPg
         p9ifzIp3OyuY2VwGKz7IIEt05c9SGGrYHkRW6FSYOEadviJAotB8QW6oFpWS4h0CyibY
         j8ODxfJ2RcO062+yrk/ZvyDSkLCk1I3URcJxJ6LBi0QjLp4sDwLLRRZtpQelyw/9SZbq
         DMeRPDaeZJVz278QlqL+r5+Wqnw73qouMz0YYvaNPdOLX8Lkeg2SUTXP7AITTPbm7kQk
         7A8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5anSgeOk7+2ZJJeKclHDXLFttswwsIyO+hF8T/5lGfHCYS+qQwdS574Hl+9rUscuJcyUKgpU8vAxHJ8If@vger.kernel.org
X-Gm-Message-State: AOJu0YwLdmfjD6VrLVtzdzqhi7g/llRZ8mWtGQ4aAwo9zIHcRjS7q0Ch
	nAcXdeejQO1/EMsT8v2NNN4gqHTWA7XfC+6JCB/tT+tiSbNz4M4DhR6G7kjWZ0M=
X-Gm-Gg: ASbGncvdo7nmQz5zAHabhcpuuE17mGwx44zQ4+cj7lYwRhmkhtCLehtq/2S66//So97
	KF+2k82C4ItXauHZhF58nfSxKdlcG6pWnHTWzbDpOoJ6uVKznoxk/Md9k76vRbrkoWy+XFzcpvm
	luwtLyS+FlIn539OUxXs0QdCX/7damMu4Dcvv9PXhrWPL+2smAR86BkcikthxHUFO9KulKk01AA
	5bFr0M8VxXnCIHeULn8C0l+INRHUFYmG24bNe7MIFV/FyGe/l5eqaMO9U5YeRdDbOfSWp4gIxU1
	crF4Abqyk1bQ7HmQ03PpQ428zshEaLd88Hy+
X-Google-Smtp-Source: AGHT+IEt4/eMp/y1Apol7QWoRib0WgvjbLHCpW5b0S3ge8gl3DIGCRdf7XNwtxVsFbf2qGT8HzCfyA==
X-Received: by 2002:a05:6512:108a:b0:540:1a40:ab0d with SMTP id 2adb3069b0e04-5422953fef2mr88735e87.28.1734648053813;
        Thu, 19 Dec 2024 14:40:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5fe9sm299180e87.48.2024.12.19.14.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:40:52 -0800 (PST)
Date: Fri, 20 Dec 2024 00:40:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/15] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <i6ch4bagrbotwp4u4x2spvw7crztyk6dph6i5wfz5k3guyrhxl@clmriesuuaa5>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-11-92c7c0a228e3@linaro.org>

On Thu, Dec 19, 2024 at 03:49:29PM +0800, Jun Nie wrote:
> Blend pipes by set of mixer pair config.

You are repeating commit subject, so this phrase can be dropped. But
more importantly, I don't understand it. What do you mean?

> The first 2 pipes are for left
> half screen with the first set of mixer pair config. And the later 2 pipes
> are for right in quad pipe case. A stage structure serves a mixer pair,
> that is coupled with 2 pipes. So the stage array number is defined as
> STAGES_PER_PLANE.

And I still have problems understanding your commit message. This might
sound like a joke, but it is not. If my commit message are not clear,
I'm getting more or less the same response. Please consider asking one
of your colleagues to help you with the commit messages.

And another usual comment: describe why, not what. Start by describing
the problem instead of writing a text about the change itself.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 6841d0504d450..6ef7e6ed00238 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	const struct msm_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>  
> -	uint32_t lm_idx, i;
> +	uint32_t lm_idx, stage, i, pipe_idx;
>  	bool bg_alpha_enable = false;
>  	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>  
> @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>  			bg_alpha_enable = true;
>  
> -		for (i = 0; i < PIPES_PER_PLANE; i++) {
> -			if (!pstate->pipe[i].sspp)
> -				continue;
> -			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> -			_dpu_crtc_blend_setup_pipe(crtc, plane,
> -						   mixer, cstate->num_mixers,
> -						   pstate->stage,
> -						   format, fb ? fb->modifier : 0,
> -						   &pstate->pipe[i], i, stage_cfg);
> +		/* loop pipe per mixer pair that's served by a stage structure */

served?

> +		for (stage = 0; stage < PIPES_PER_PLANE / STAGES_PER_PLANE; stage++) {
> +			for (i = 0; i < PIPES_PER_STAGE; i++) {
> +				pipe_idx = i + stage * PIPES_PER_STAGE;
> +				if (!pstate->pipe[pipe_idx].sspp)
> +					continue;
> +				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
> +				_dpu_crtc_blend_setup_pipe(crtc, plane,
> +							   mixer, cstate->num_mixers,
> +							   pstate->stage,
> +							   format, fb ? fb->modifier : 0,
> +							   &pstate->pipe[pipe_idx], i,
> +							   &stage_cfg[stage]);

This is not correct. It will make all LM CTLs to be programmed to flush
this SSPP, while actually they should only be flushed for a
corresponding pair.

> +			}
>  		}
>  
>  		/* blend config update */
> @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	struct dpu_crtc_mixer *mixer = cstate->mixers;
>  	struct dpu_hw_ctl *ctl;
>  	struct dpu_hw_mixer *lm;
> -	struct dpu_hw_stage_cfg stage_cfg;
> +	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
>  	int i;
>  
>  	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
> @@ -516,9 +521,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	}
>  
>  	/* initialize stage cfg */
> -	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> +	memset(&stage_cfg, 0, sizeof(stage_cfg));
>  
> -	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
> +	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg[0]);

stage_cfg instead of &stage_cfg[0], unless you are passing just one
stage config.

>  
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		ctl = mixer[i].lm_ctl;
> @@ -535,8 +540,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  			mixer[i].mixer_op_mode,
>  			ctl->idx - CTL_0);
>  
> +		/*
> +		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +		 * There is 4 mixers at most. The first 2 are for the left half, and

There is 1 mixer, there are 4 mixers.

> +		 * the later 2 are for the right half.
> +		 */
>  		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&stage_cfg);
> +			&stage_cfg[i / 2]);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 68867c2f40d4b..27ef0771da5d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -32,6 +32,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2
>  #define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

