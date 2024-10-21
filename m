Return-Path: <linux-arm-msm+bounces-35191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805039A60BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 976741C20D29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473691E32AC;
	Mon, 21 Oct 2024 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hcKIWbFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7D51E1C25
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504501; cv=none; b=YhzPJgp/vowf39p/hBUurZneaf319Ih+xKX/xXNZ3bqrEnrOVCGxe5eVlllzWE3yXXFRyWgbT6A7NBqRs3utAQft/Y651IOegmlFsG1o4zcbZ2wr1FKDOrD7xvy9Nswji7ZLd5hvOLx8TuvRVwBET1mkyDkpNXywttUiXISm+mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504501; c=relaxed/simple;
	bh=B8kXuogX2mA5q2qhHUjFQT6+8gMhHBjKX1d/0OfMugI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ssqM+gLDocJ6ZSVOD7cGRAW6FxNxzIFXcDv+zwtT8aLVEaYYfr9Heo+EbYPuGPePsHD+7RWvraHusJEUSwzdYBc/IthdecuG6A37Sdfce9K0waOJS9UrE/hXn/ph13TQrKdtw5NB+Cm/ziG6oE8XPB5z9EwLhIy1h1HGow3I6Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hcKIWbFq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314b316495so40870925e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729504497; x=1730109297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAPgS81fU8WqlF/LuQRpx0NWQV7ciXlZDMNUwqEFwws=;
        b=hcKIWbFqzX/2BqE8vPtSMVJoS6a9LiwpzsRBo/TVy9RhClxg1xgdMzm6xTrOHWcewb
         rTwj8rF+bMcSxD5MN8dNVZWsO07OAtxA2OXNKJL666/Bg2lUuAti/ckW2SDm43vL6235
         bDt/Bdium9SOa3DE3q0Yyyvnwm1dIxn7U9FMR9fMGUq6uo/F/3OfYpzPXSnqfobppckz
         Lgy1g1HHVmI+uWVGAJnG4h+XbhBOrAe2Y2VTjFsxDRv/2gGdjwsewkaCI0KKqI7Es/zD
         EnsTn1lV6p5O0VY0eT+DnhJ23VVBrN645RdDsEuSbYMPJ+rhhPogOysllMrIwPy75tYy
         wnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504497; x=1730109297;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sAPgS81fU8WqlF/LuQRpx0NWQV7ciXlZDMNUwqEFwws=;
        b=vMWescslvGqxRlBhLxQbRmg5rzff/VTuCnTczu2aZ8ntAvHo2xTpqf1ZWVKsnjGWQE
         ZylXA628UB8KZxmFvOLKZVf3r+oLJ2TTPce0Hpagl32a0x3QV7TelIIdPwAexqpkLBZ4
         kLsVj/8+pZ51CeevmCtt6M4ucmRwbQ6XawtfPrcm9PJuAGe+4ndefcUZ1E6g1ObNr+ZA
         Akd7Z+KIX+9pkSGCimjHICzkB8YUxzpfFp9wHf5aFgut+YmTTZ25KJ7x6VLTKEDKG7+0
         FVmpiXhVDOon+bS6P/FNSp9oTF+W7ILXWtIJJT6+vau00iWlk3+QDEBxYsoz6jOmPoC7
         6h+w==
X-Forwarded-Encrypted: i=1; AJvYcCUd5DUEYiwTo8FfJP5fDpFzQtTtDTtDGPUrKaMHzsAC7attpuEBAM6bhQpr4bW61FbDQvfUmtM8qigcEQE7@vger.kernel.org
X-Gm-Message-State: AOJu0YyUpb7SR+Nghz0O2t2U++mkZFuLq5Zu2hojtgSe2g1Seicz072o
	RnDPyJZRml5ffzmUzIIQqj/JZS1m7Yt7+R8nhJUmbt68/SEWmLPYW0Mg0J5SWvo=
X-Google-Smtp-Source: AGHT+IELxYkWLSigx/VF6jV9gkVikRzLwmcqDdsuj1mv4meEXk5esFNW/w5twSNROrhMuWotuOZ7TA==
X-Received: by 2002:a05:600c:35cd:b0:431:5d4c:5eff with SMTP id 5b1f17b1804b1-43161636f5cmr76546685e9.2.1729504497213;
        Mon, 21 Oct 2024 02:54:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57112esm52517435e9.6.2024.10.21.02.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:54:56 -0700 (PDT)
Message-ID: <7d2c6c91-9218-4e13-81dd-d1f3ffa4801e@linaro.org>
Date: Mon, 21 Oct 2024 11:54:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/6] drm/bridge: aux: allow interlaced and YCbCr 420
 output
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
 <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-4-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> As both aux bridges are merely passthrough bridges, mark them as
> supporting interlaced and YCbCr 420 data. Other bridges in the chain
> still might limit interlaced and YCbCr 420 data support on the
> corresponding connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c     | 4 ++++
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b29980f95379..e3e95ccec1ae 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -120,6 +120,10 @@ static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
>   	data->bridge.funcs = &drm_aux_bridge_funcs;
>   	data->bridge.of_node = data->dev->of_node;
>   
> +	/* passthrough data, allow everything */
> +	data->bridge.interlace_allowed = true;
> +	data->bridge.ycbcr_420_allowed = true;
> +
>   	return devm_drm_bridge_add(data->dev, &data->bridge);
>   }
>   
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 6886db2d9e00..48f297c78ee6 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -180,6 +180,10 @@ static int drm_aux_hpd_bridge_probe(struct auxiliary_device *auxdev,
>   	data->bridge.ops = DRM_BRIDGE_OP_HPD;
>   	data->bridge.type = id->driver_data;
>   
> +	/* passthrough data, allow everything */
> +	data->bridge.interlace_allowed = true;
> +	data->bridge.ycbcr_420_allowed = true;
> +
>   	auxiliary_set_drvdata(auxdev, data);
>   
>   	return devm_drm_bridge_add(data->dev, &data->bridge);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

