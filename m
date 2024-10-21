Return-Path: <linux-arm-msm+bounces-35195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E23C49A60DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 053491C2169B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939931E47A0;
	Mon, 21 Oct 2024 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BqCuirFT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440531E3DC8
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504666; cv=none; b=lzNtYifrBq2JhCZBudkHm/qosqvySfQyMrLw0R2Bf7Uz312xl+ainGX9fn0+YmPTy0iA5ddJw4/6I3ZvqlJ6Q4uocWCp0pgSM2x+mn7CwPtnFIC3pSWzXbQFr1H8odN3Ha3u/nrr3Gww/yLzf+LmXjRi08lv6tzPYx3hnRJaCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504666; c=relaxed/simple;
	bh=qXhoyDNVvXc+6IIV9TKTG0lhVgcA5+9rjg/KityqydE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sY6abuRU2rTo2P4yrLNsHTHWNw4mCaK9Zfzti8j7b/5ZDQucM0Zq6r88DkuavVTNNnXvAtP55J6SLDMLF/o5fPjAVPl+0gsKhtmGBLrLsUetYbREgQzLg1EKltKCwEgcQKDMTwvS0udIypEUUOADslV+aYx86XmTu8Pp0XmzANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BqCuirFT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso41635485e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729504662; x=1730109462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFJZ4BI8JgbDyIrmdc3YWzeoobktonPl/4kNXWfXXdA=;
        b=BqCuirFTliFqN1AKJXxu7meIjhpdUJuTD6UKfeXWVugBz/uHgtIN+Fdjw31GYfttwY
         kkKE2JvWT2TYbirIqWzptlr7ll2FpXzp0vwSNz95QpXBsEM41EC7pzMPP0gF68PAtrxY
         ElvU/m0AGPP7C8qZth6Vv4AHtz+thakf9BkUHiASwzcVVdb8zyuSE+nePzQpPzYRcyiV
         3mLp7qHn7+vSKmn/zZ+/67GFhLN44cIhkUVE1HV1TDgyx6MQZFZAsB5qgcikMWI3WJ/g
         5Jshb8YZMWo7vcXeDr5gBEStxb0cLUTfSjOy1yONmLd2ewzXEBi4jjeQCvf7PK6ULnB1
         Lq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504662; x=1730109462;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YFJZ4BI8JgbDyIrmdc3YWzeoobktonPl/4kNXWfXXdA=;
        b=RchczCL8GYv57aaLJVQ17xCmVm01SktmBh5I1g0FjJ/UjHl7CKKgCod9Fy6oFV4t9U
         znfT72LjwbIFEinyqk6qQtaLDUZnkEYFtwABzZycbX4UEvpuDM/IYVLoEnlI1N2XLT0K
         ho/R11uI0HnLuSsiRAFOkXVrCbP/rUocZxe3cOob/AeeKg+ZNNY3UnyL3FgT03VcVrRG
         R3i/99TPuQwE7LcQulZh9cd//M55kS7Pzec4BwV+siJVvnnZkoiF026UIgv5ZJGHu0Bv
         HW2xTPYJEINrpfCVtp7nWHF0H87JOdHtPr3dbfHB3nPE0APCggVILRNYL2iPVrICrtAE
         w+jA==
X-Forwarded-Encrypted: i=1; AJvYcCXl77mz0LAT+vfcYF89KpK3GUxJ4kGwnPDfwKsxfGyOh+bWNXq9FebJfdPjaXlvDEEqsIx/4ub0wMl4+i4C@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZaOb/zNfj1hDGW+DqAjFcesruI/7A5lpnqm9e30+rSyevdPF
	+VfacROS3AxXyOUsArht01SguCXtA12qJEvyHqFvoVeSACZV1qotpa6jnwTFUJw=
X-Google-Smtp-Source: AGHT+IGeGSva1dCGKJK0ItMljEFaN9RGTBSz4M7spLmPszck8GeOtwhoBXXlA6N5i6PY8nRM5qgSIQ==
X-Received: by 2002:a05:600c:3b08:b0:42c:b4f2:7c30 with SMTP id 5b1f17b1804b1-43161687de8mr86397695e9.23.1729504662459;
        Mon, 21 Oct 2024 02:57:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b35sm3926555f8f.2.2024.10.21.02.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:57:42 -0700 (PDT)
Message-ID: <3731a3d4-6435-4594-b97f-45c10d9cfcfd@linaro.org>
Date: Mon, 21 Oct 2024 11:57:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 5/6] drm/msm/dp: migrate the ycbcr_420_allowed to
 drm_bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Instead of forcing the ycbcr_420_allowed flag to be set on the created
> drm_connector, set it on the drm_bridge instance and allow
> drm_bridge_connecgtor to propagate it to the drm_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++------
>   drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++---
>   3 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e1228fb093ee..0ddd8abca499 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1467,14 +1467,14 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	ret = dp_bridge_init(dp_display, dev, encoder);
> +	ret = dp_bridge_init(dp_display, dev, encoder, yuv_supported);
>   	if (ret) {
>   		DRM_DEV_ERROR(dev->dev,
>   			"failed to create dp bridge: %d\n", ret);
>   		return ret;
>   	}
>   
> -	dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
> +	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
>   	if (IS_ERR(dp_display->connector)) {
>   		ret = PTR_ERR(dp_display->connector);
>   		DRM_DEV_ERROR(dev->dev,
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 1b9be5bd97f1..7eb1621f9e7f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -289,7 +289,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
>   };
>   
>   int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> -			struct drm_encoder *encoder)
> +		   struct drm_encoder *encoder, bool yuv_supported)
>   {
>   	int rc;
>   	struct msm_dp_bridge *dp_bridge;
> @@ -304,6 +304,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>   	bridge = &dp_bridge->bridge;
>   	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
>   	bridge->type = dp_display->connector_type;
> +	bridge->ycbcr_420_allowed = yuv_supported;
>   
>   	/*
>   	 * Many ops only make sense for DP. Why?
> @@ -351,8 +352,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
>   }
>   
>   /* connector initialization */
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> -					    bool yuv_supported)
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
> +					    struct drm_encoder *encoder)
>   {
>   	struct drm_connector *connector = NULL;
>   
> @@ -363,9 +364,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
>   	if (!dp_display->is_edp)
>   		drm_connector_attach_dp_subconnector_property(connector);
>   
> -	if (yuv_supported)
> -		connector->ycbcr_420_allowed = true;
> -
>   	drm_connector_attach_encoder(connector, encoder);
>   
>   	return connector;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index 45e57ac25a4d..ae632fcc407c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -19,10 +19,11 @@ struct msm_dp_bridge {
>   
>   #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
>   
> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> -					    bool yuv_supported);
> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
> +					    struct drm_encoder *encoder);
>   int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> -			struct drm_encoder *encoder);
> +		   struct drm_encoder *encoder,
> +		   bool yuv_supported);
>   
>   void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>   			     struct drm_bridge_state *old_bridge_state);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

