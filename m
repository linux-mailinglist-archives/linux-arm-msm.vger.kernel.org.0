Return-Path: <linux-arm-msm+bounces-40906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C288E9E84AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 12:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20DE228163A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Dec 2024 11:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB61448E0;
	Sun,  8 Dec 2024 11:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+bfxCX4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044C1448DC
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Dec 2024 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733657966; cv=none; b=nswb9xkFTq3qC1M2AYryDPda6bmgkDL4jlTQ5Q0pj4bKrjPiRPzV3r3d2dneyMVDS0sJg6ZMccH5I6ZuOEm2jHSqyBDbp6VynZDqtTcubGssheLaCm3e67aYAGHc00Yik5Sih6+kGxwA/htwy703wo/ooJSjCCXS0VWOMBsUtkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733657966; c=relaxed/simple;
	bh=jQk/Q7ElUFDJ8+2z16EsiGL4/k6YTUMKj3wkKJkf2G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxpEe/nR29BzhhtfolKS16UDQ1nNfzbV3DpMrbY9aI5NZFy0WUZsX+Y4/NNlIedo662MW/H0ow/yu7dCK+xe/OuG5/tbBP10AIX8EymCgk0X4E9scJGJH9W4TIrpyg9jG4F0XfoDZI2pnTAB8GC4twQ/wqgY+mQXgNvzjwDXgck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+bfxCX4; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so298159e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Dec 2024 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733657963; x=1734262763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9morjBPw/QOjQQuL/hx7w1FC0q/DCLfzZD9bWcXHsg=;
        b=D+bfxCX4WQMLLCHwzT43hp0Sm07dB8/0QFiLz6E6cDknd0cjLwNUyur6wZVx7mu02b
         EkxPVGbCRShkHOFyerrZZzeyGRLnxUt8tg7xulpXdQa2DWgUd0GUfPjP+JqtWnXnVLqq
         /gYLAa+v5idTTqoYRDyjDpGLkte545CZ/MP3wb9QIOfMj1alLNjV/bcGqygZS3XBEJMr
         1MXAloKa0F/BPYa5W5bbRlwUhKzcKeQiFKrqmLFmgRRDlvghPoMfEBAE8Zuj9BP6gOdC
         kb5nsPZJ8DAg9hGevjVP9wIrp7p9ld3VdTfo3MHBR1SOrHao8/INeeNnfdoMKNeBBEkK
         OL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733657963; x=1734262763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9morjBPw/QOjQQuL/hx7w1FC0q/DCLfzZD9bWcXHsg=;
        b=pvDtQ/vIiRlW5ZQ4xdG2MqLkYDKQLHuAY7ldKFsNBkpBxrL8mzXqTap1sMVXuJxhPY
         NMqgv/tnfghH5tEHZxTiav9WD+RTkwA1oDchEPCPjWtsPBSvnCyGpqZkK2NiqO6wxtL2
         IS60nNNssQYFJz16RoR1dVKF/d0/hxAMaksTfU5zEoBGrLBiU6AuLaOkzGyuixWz/NLI
         WY+vNUD6pJ+n9FdpK/p9vvMR2EU1y8pRfnOWLK844eQAlm8aMyujGFk9UWN2MRZqnEUX
         LA3X7BhA/ATsdP6tTrUXGmjm6NR9ukKa7OrYF6H9QeiwxGOC/JSJNad+zmgVJEGLZVL9
         2w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqcf4b7ixVpdDNw3VJe/5J59ZPQMoeqgccIIOk53LbhYZ+sE/ewkCpT2FGE5GVPY7iZvSL6epFDMgwzk43@vger.kernel.org
X-Gm-Message-State: AOJu0YxIHqrqhOE5dMJ3t1MIjpop76p5G48rhJdL9I8ngNav3gqTfsBj
	ijxAKByOoXPbNYelqxZ4rmStZeSFteQ9127Gg45TRLu1PDRfiZp6N0/JJkClnho=
X-Gm-Gg: ASbGnct/NNcJsTwO345foYnRc6Zx5GtsSNv26CMl8bHWV2oWi+HJ0TfioX5nasZvV81
	KiH1u8mj7DmHkdrREh3ZsoNaoaPVw7VNWIHQGzqOv0C+K2ZYH13UE5NywHqBn/MapzmJ2vlCRx/
	3Qq4vo38MzLsTHLHgzMYruLQw70+W3EofgAP3L64PnOHkHrushMvnVCdZ0PGC26lcF/h0IeDEae
	P7H9Jh1JCnPO4k0xiKqlC29F2xZq+dP+NK449flc/xO0f0BRVmjmXF8Yo7uZ6zsjN9aUVEI1EAr
	I6+JqsvlDjqjLy7Tzmh1qQCy9Rx44Q==
X-Google-Smtp-Source: AGHT+IEmYeJ2ZQRN84qHuhel52Yb+lkGV4iCWlUilYcgQ5pTjCo0FNpG1AeVpIwExJma9YYEjfC7yQ==
X-Received: by 2002:a05:6512:3dac:b0:540:1d37:e6c with SMTP id 2adb3069b0e04-5401d371124mr371746e87.30.1733657962669;
        Sun, 08 Dec 2024 03:39:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e36421f61sm680978e87.137.2024.12.08.03.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 03:39:21 -0800 (PST)
Date: Sun, 8 Dec 2024 13:39:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
	Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 15/45] drm/msm/dp: convert dp_display_set_mode() to use
 dp_panel argument
Message-ID: <zw4np7nvrd627wvrdveisnfuyep5vp7rmrxm4vnmpmqiz7enev@uarpgh753fyc>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-15-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-15-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:31:46PM -0800, Abhinav Kumar wrote:
> Convert dp_display_set_mode() to use the dp_panel passed to it
> as an argument rather than the cached one in dp_display_private.

Why?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 60 ++++++++++++++++++-------------------
>  1 file changed, 30 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index b506159191184a2a2c83d0735260ac040a33be98..5fa6c003cf6c51eae77573549a555a00dc33f476 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -798,16 +798,38 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  }
>  
>  static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> -			       struct msm_dp_display_mode *mode)
> +				   const struct drm_display_mode *adjusted_mode,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp_display_private *dp;
> +	struct msm_dp_display_mode msm_dp_mode;
>  
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> +
> +	if (msm_dp_display_check_video_test(msm_dp_display))
> +		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> +	else /* Default num_components per pixel = 3 */
> +		msm_dp_mode.bpp = msm_dp_panel->connector->display_info.bpc * 3;
> +
> +	if (!msm_dp_mode.bpp)
> +		msm_dp_mode.bpp = 24; /* Default bpp */
> +
> +	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
> +
> +	msm_dp_mode.v_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> +
> +	msm_dp_mode.h_active_low =
> +		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	msm_dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&msm_dp_display->connector->display_info, adjusted_mode) &&
> +		msm_dp_panel->vsc_sdp_supported;
> +
> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, &msm_dp_mode.drm_mode);
> +	msm_dp_panel->msm_dp_mode.bpp = msm_dp_mode.bpp;
> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 = msm_dp_mode.out_fmt_is_yuv_420;
> +	msm_dp_panel_init_panel_info(msm_dp_panel);
>  
> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> -	msm_dp_panel_init_panel_info(dp->panel);
>  	return 0;
>  }
>  
> @@ -1662,34 +1684,12 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
>  {
>  	struct msm_dp_display_private *msm_dp_display;
>  	struct msm_dp_panel *msm_dp_panel;
> -	struct msm_dp_display_mode msm_dp_mode;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	msm_dp_panel = msm_dp_display->panel;
>  
> -	memset(&msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> -
> -	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> -	else /* Default num_components per pixel = 3 */
> -		msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> -
> -	if (!msm_dp_mode.bpp)
> -		msm_dp_mode.bpp = 24; /* Default bpp */
> -
> -	drm_mode_copy(&msm_dp_mode.drm_mode, adjusted_mode);
> -
> -	msm_dp_mode.v_active_low =
> -		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> -
> -	msm_dp_mode.h_active_low =
> -		!!(msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> -
> -	msm_dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> -		msm_dp_panel->vsc_sdp_supported;
>  
> -	msm_dp_display_set_mode(dp, &msm_dp_mode);
> +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>  
>  	/* populate wide_bus_support to different layers */
>  	msm_dp_display->ctrl->wide_bus_en =
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

