Return-Path: <linux-arm-msm+bounces-45223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D5A134B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 09:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A161888580
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70A1991B2;
	Thu, 16 Jan 2025 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbsFinLL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D6381AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 08:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014906; cv=none; b=X9AZx2ZqfbFI7y6DL+7s9AePlowyZBT9Esy5dZpRJbboDVSK3SW4QJhh5CV2Eyx0aRyJ1o/n1LIXN4uwq3pbIA9MNWR0yRR3oE+YvctYlec9vWHDf+XKAqwq+OK7Mdfn5P27xu+H9IFgxT+CVZjtfuiKPg9yww8aeJZQG0HVt14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014906; c=relaxed/simple;
	bh=xdvo2mP0UY5Bj8gx2DSd80+ERViqDwGLQ6Gafzt2piU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDj6v5dzz7s8lb+yGiTnUM80TLxFGA21xgP3JgpWBwup0+F19WQRx7vxJmnShjhWCz/cr6MlvAGfGndpv4N1rKaXLcrAqiG9Ynl2NJZ29N+6M2ZagFKeZngO4JBQNeHK4cn9dM38c+C/BcOyNKRp2h086H4+ulFfIkS7qGWlw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbsFinLL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso762414e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 00:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737014902; x=1737619702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
        b=WbsFinLLKbHCkij9g8woHeJB9U47XBkhPcs03lcgQZLFiYcr1o3ewXeV6NGiUyNNSq
         SpLFhx5PX8X1qTVkhGtnCSlg77hkDCzxlcIkAazKbyweu7duXLq46o+lFICjpgIaICVx
         HvQ9o0KWIHnviwXypq19SbPQvpsRgpR02yxB4xqr0VQiIF+mILMSlbvhHEejJRexOhoO
         mfzhilrmDRvsaPtKkqQwalCV5C/AjLwbF5F47/aDfGKtuh2XgbfLBCJ6qI4Nr2E2OQFg
         B5J228uE64urAfLNScbwi7xhTNAxb0PMQRiN7bbWWNTRGnIY5VOEN8/wYwlYBL4sMKNu
         LN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014902; x=1737619702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvjQGS9v3GeYSYSe2LBAG448Vja+LlRvw7uplzopV8w=;
        b=Vqa0mTgU6rD3A9Nq+enWhgvy7EHFaBWQ8Ac5V6msV/b+/DLQZvdLkDXfjJSg+NllGb
         ilKEH35lBUAszvYNa7gDr9hWTwaCY1aRc+QW5b7o5Nj3RViYQ0CrYzxA2Z/hDOFjEOyG
         mhOixvYrWTK+8lZLksDJlLlES9MZBYpOzzosl4ecIRyPGwv9aEXHjAJ+NtfRFhaGgS4f
         /A7wUdexCDe3drQSguJZEtDyObuzAe30TYoFfwGi9vCYMpYzUVZlcg+SxxdtKxtVDqnI
         ojrLSyqP8AQGesV0wHW6JQcyiMgIacujcUt50rmL4nqT/6DUC0oC2dCwggBZp3VhHUWl
         M8tA==
X-Forwarded-Encrypted: i=1; AJvYcCXkgVoOGBepqyS2zr3W1ChrF8I7RoTbhdwB+5dMDC4pYm83OtGN6NqBIQtOk5jMZsCMa+TUZ0Wr1JKeHu6u@vger.kernel.org
X-Gm-Message-State: AOJu0YxNRjePXJrL/pFQtdqA3PT3DkyOyTtCNWhht4bYNLaCuDA4TyUP
	0xbCrRVnbsZ2pefBEpqVU1CHbHo2GxVVxrYH5r0MGLMzFbEIxan5Zk0nrhPrNvg=
X-Gm-Gg: ASbGncvnRbT4UGGruFFB7FGm5sZDJT7g+iVTEaWsTlo8ViMV5DmqDz+Ai/gYyxNmdoA
	LO37hfFWeBOdL3tE+g1WX18MmLRj1e5aMgg5muaR01kN7+Qw19FSU/r3C6gUKUoACsGGoV8XYO+
	t8MVMfHtNvtLphILT8rL7QGPWFNMsyycuNpTUyns1m1eBLnfjuALdGieB5pzW+oaYd/5xamqqqp
	VJaslckoojlOaiwNiIhLKgfqG+wgX7ZEuI6Y5/5SobLrEmxiqH++dtwxHh4E+i2aNrPdoXfxLi5
	wsqz0FsP9B4sigfJKmWeYbLHT1tiN6OVf0va
X-Google-Smtp-Source: AGHT+IGEHcCQjP4XA6TrXiXXldBmt08e0Vh4nxPE4SnDPCPsbcrbar+E8zfVOYTqQoHRGtLyWIB3yw==
X-Received: by 2002:a05:6512:a8e:b0:540:3572:1864 with SMTP id 2adb3069b0e04-542845b35b6mr9642052e87.44.1737014902298;
        Thu, 16 Jan 2025 00:08:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec067asm2271621e87.186.2025.01.16.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 00:08:21 -0800 (PST)
Date: Thu, 16 Jan 2025 10:08:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/16] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <actkdpr62j55cez7sbszrsjgsax7lwzlzk4qqe7rmqfo2y3u4a@2xro4eo56a25>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-12-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:26:01PM +0800, Jun Nie wrote:
> Currently, only 2 pipes are used at most for a plane. A stage structure
> describes the configuration for a mixer pair. So only one stage is needed
> for current usage cases. The quad-pipe case will be added in future and 2
> stages are used in the case. So extend the stage to an array with array size
> STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
> stage structure.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 42 +++++++++++++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 81474823e6799..5ae640da53fbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -401,7 +401,6 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  				       struct dpu_hw_stage_cfg *stage_cfg
>  				      )
>  {
> -	uint32_t lm_idx;
>  	enum dpu_sspp sspp_idx;
>  	struct drm_plane_state *state;
>  
> @@ -426,8 +425,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>  	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
>  
>  	/* blend config update */
> -	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
> -		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
> +	mixer->lm_ctl->ops.update_pending_flush_sspp(mixer->lm_ctl, sspp_idx);

No. This is required if two LMs use different CTLs.

>  }
>  
>  static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 5f010d36672cc..64e220987be56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>  #define DPU_MAX_PLANES			4
>  #endif
>  
> +#define STAGES_PER_PLANE		2

it's 1, not 2.

>  #define PIPES_PER_PLANE			2

#define PIPES_PER_PLANE		(PIPES_PER_STAGE * STAGES_PER_PLANE)

>  #define PIPES_PER_STAGE			2
>  #ifndef DPU_MAX_DE_CURVES
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

