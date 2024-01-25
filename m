Return-Path: <linux-arm-msm+bounces-8326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2A83CE64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 22:20:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9832896F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 21:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E83745C6;
	Thu, 25 Jan 2024 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w179iDrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369613A242
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706217631; cv=none; b=scigszX6tii2lmgZXqBZBnXQKO11IwkZh2lpymjJaAJxb88EWzPmOMxmJ7qF5yQtZm6E4hCnqg7rzjVUrvNjXv6nqlim3+VAt1CStrX72tJolE8KK0i1tFV5mJepnBZskgkj3+k2b+6w7MLeudOhxeEs4xqQt9P1UcXeWEp5uME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706217631; c=relaxed/simple;
	bh=YpuoNgturrpIC1YceiWfHga+9w2sMCSwpJsrJ+PTF90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajWcrUehva61D5thsTwPLYCTJaI79+job0sRpnsc6sdIww1Vv4U0Yh84vVLT2vqMzhmyfHhorPY3vGVhWWGj7gZFPHVQ61GRIX9DklGlsfERQRiTJwD4PfPJKLxtsQrOn09JYm7brl9Y4fM0SYY4rts1zaObqWfRkReqie3XNeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w179iDrB; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf1c3b23aeso12383981fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706217627; x=1706822427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLrlWFYstTsTJtWHkx0V41MjP6qrBm8WjHVjemyC3G0=;
        b=w179iDrB96ZfO8hZO9W6+ozuWnvr+30bzd574BLedis8qff3jEK+QcP1IKyuue8ZuT
         ox2LLNP5H8LAcnd1qrzmEmt9BLqjMEbaZIbWf7qLjyqpqAnvBl18FnCzavInrnOuzT4O
         xgj3jOUfSE12Wh0RhsXkWU2yEYDS5XGkx5JUlzU7/JV66u9UnJqO3KvLkNo+k4NB+06g
         6lmMyeT+iCgYDxEZ9p0un64ApD1CMGal5SezUds69Ct73ekqR02QjA0/K176/J/H8wse
         RzVetqvvxPJLQkZi+Gd7Dm1VrwqISJ0BqoAuPcVwbZeWtcgx1DemAnyWLoQiSSIwDzCN
         rUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706217627; x=1706822427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLrlWFYstTsTJtWHkx0V41MjP6qrBm8WjHVjemyC3G0=;
        b=YO/CApmvS5bIDh8aUsNOdz0SfDy145YYjbPyxG/5Fz4wAOhvSYOEsqqv/DoN9FBrDe
         du7ulKpMZdkEwTY8EFVUiAapItmoFu4+Zt5oM/6yy5YnY/M7LSHqPXgD/bQHTldS/lvq
         NUeRke4Rnrb4ny4PoQb+McBMUaqzx/WHjXuJCl/QN7UJol2lTbruV4sTvlqUjsmZhcMo
         Ts9JK0ggpTezhz7Wy1O8BV8cz4+mv6D7OpgAITwxVda/X5rdi7SIpJqQp+vJWXQZVY/u
         FGxSj159/HX5ck8MjDGFGYg7//2PEDDEKGFIWYmqJC8HzOHrC5wtO3JIQj+7B0pIgUfJ
         3eRg==
X-Gm-Message-State: AOJu0Yyhb31huhXnPDSXC538VIuS7eSYyUr1ort6eu187s5eT+B2Wkgj
	nywfuo0fniAMJPA2RSGN1F7kv9CS8MRQM1i1rmuzBb4Odm4TLESna3EiktJebYU=
X-Google-Smtp-Source: AGHT+IH3i6HTno+Z6faG1+5ez7O4xYJPP++BGsJbxl78zsvgPngWzFj9zIjiBtKxDIIcDyQxV/S8sg==
X-Received: by 2002:a2e:b5d7:0:b0:2cf:73b:26ae with SMTP id g23-20020a2eb5d7000000b002cf073b26aemr66424ljn.22.1706217627223;
        Thu, 25 Jan 2024 13:20:27 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p3-20020a2e8043000000b002cd91d0ceefsm376763ljg.33.2024.01.25.13.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 13:20:26 -0800 (PST)
Message-ID: <0c6e94ef-4e9f-420b-92d9-785ee9f6ae30@linaro.org>
Date: Thu, 25 Jan 2024 23:20:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/dp: store mode YUV420 information to be
 used by rest of DP
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org,
 neil.armstrong@linaro.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-5-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-5-quic_parellan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/01/2024 21:38, Paloma Arellano wrote:
> Wide bus is not supported when the mode is YUV420 in DP. In preparation
> for changing the DPU programming to reflect this, the value and
> assignment location of wide_bus_en for the DP submodules must be
> changed. Move it from boot time in dp_init_sub_modules() to run time in
> dp_display_mode_set.
> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
>   drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9df2a8b21021e..ddac55f45a722 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -784,10 +784,6 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error_ctrl;
>   	}
>   
> -	/* populate wide_bus_supported to different layers */
> -	dp->ctrl->wide_bus_en = dp->wide_bus_supported;
> -	dp->catalog->wide_bus_en = dp->wide_bus_supported;
> -
>   	return rc;
>   
>   error_ctrl:
> @@ -808,6 +804,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
>   	drm_mode_copy(&dp->panel->dp_mode.drm_mode, &mode->drm_mode);
>   	dp->panel->dp_mode.bpp = mode->bpp;
>   	dp->panel->dp_mode.capabilities = mode->capabilities;
> +	dp->panel->dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;

Why do we need it in dp_panel too?

>   	dp_panel_init_panel_info(dp->panel);
>   	return 0;
>   }
> @@ -1402,6 +1399,9 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> +	if (dp->dp_mode.out_fmt_is_yuv_420)
> +		return false;
> +
>   	return dp->wide_bus_supported;
>   }
>   
> @@ -1615,6 +1615,15 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   
>   	dp_display->dp_mode.h_active_low =
>   		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	dp_display->dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> +
> +	/* populate wide_bus_support to different layers */
> +	dp_display->ctrl->wide_bus_en =
> +		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
> +	dp_display->catalog->wide_bus_en =
> +		dp_display->dp_mode.out_fmt_is_yuv_420 ? false : dp_display->wide_bus_supported;
>   }
>   
>   void dp_bridge_hpd_enable(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index a0dfc579c5f9f..6ec68be9f2366 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -19,6 +19,7 @@ struct dp_display_mode {
>   	u32 bpp;
>   	u32 h_active_low;
>   	u32 v_active_low;
> +	bool out_fmt_is_yuv_420;
>   };
>   
>   struct dp_panel_in {

-- 
With best wishes
Dmitry


