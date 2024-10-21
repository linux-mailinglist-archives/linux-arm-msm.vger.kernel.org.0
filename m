Return-Path: <linux-arm-msm+bounces-35248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD29A688C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78163287667
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C591EF935;
	Mon, 21 Oct 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1x2io/Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B128A1EF92C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729513966; cv=none; b=awJSntGY3Yv48bmTwwWBqbo3JEDb4J07owyxx0l6m8f57854UDZg4F80zKXZ7KW5/CJCfhogONRsFSx9+/Q+2RkQYwCwSlXRKwhtO+SdKVJOQ8rs84VEr904PSei5nd4h3ZBH9Uh6e6zO9MiEVP2CPGKO1YGm0QFq2Ivtmm0joI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729513966; c=relaxed/simple;
	bh=4XJdHOeLB0HksEUioBvTCNJuvmjFzA4qDeHZmTgcxDo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZszR7FnVM+JkaquP13jbzYB6LqKPI9hh8xpXH4Y72CcqtoVqMtGyP6XApAbWuQzgYc2W25QIn6q+wTD0d+IHJ6gOw8c7t91cc6UOIhzZlRkicNy/tUbnBJn+WM+dXxq0UxaX3UC2FHx0LFKEQBKvxF3bqPZkJ2aMd0VAInB0TCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1x2io/Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d447de11dso3525251f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729513963; x=1730118763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xK977l4SMZlVVZ120SxoAqshGqpipjnvBMfJGymAJIY=;
        b=X1x2io/QqWxUP6JOdsuunUNEE9UbQELC8Q/q0Ev6A597GwfGT7xI/m+JfPCdEYdl3S
         dzFzlZ37bp+8QP7qCvKmCIUJxib4YLkx0MmpbA9Rdhrv1GLWBlPcK4l0H/gNStm8AX1V
         VdcXL+iYI4jXHmb5XRrPtoy2incHiHxveBMGb52qwrPYVgC00J+hYdruKUEF/HjYw14y
         LFxoA0tIiiTrNcKlbONsVDVOznmeAQ8Ynf32sHvVg0GknwZiMxBevZTomxBUXeXabn90
         eh/xQgUeKuTGZidX63Bq8dbUHuw/KUuOfnhrAbRL5po1Y8kYDxrN9vWZCRHpF6EeLrHm
         wncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729513963; x=1730118763;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xK977l4SMZlVVZ120SxoAqshGqpipjnvBMfJGymAJIY=;
        b=CLn9bixSQVXuKBWjXoQFj7QyZxXtkwVkL1Pb3a+01Qm6xFwdcGmP1MoQrv3LKKQDrt
         Om9bOXeQJYlLD9FQKo1hg+SLKIsLzfBjBnB2LrAqRu+8zjuENM0HIKnxKTim3/3oOduI
         VVXz+Qx73t1C83wkbmKsauCvawehgaF02yaUCIZnX/rq4iFppxYlXz0+apipse2wpTaN
         UKEe/7PROwNsa1HTZSymJlBf5JcviImePZ6KLMNqZiV+mWtUGgp7DLCwp6g1q2Cwxsrl
         CmWE2L3iszlCloejC2QU7TqRPxRecOESIIkJBNDXVCQoo0TZbtI9iGu+QR0RZtjzT4WV
         GIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWM0uafL4UlvNlwnVZqlJmNhshV4b7PmoQ21trKCG8F11DvysD5U+iac7IvX0xTTdYGwDMnKrduEgXlwjI@vger.kernel.org
X-Gm-Message-State: AOJu0YwPAxJUlb2uyAg/dnpg1TJ6MHA5AEEW14M8VmUTA2NnemhIHPm6
	ZzFJWUr0bLa34zzwiHfCzu4TZvjYUrH4MjLsgpluig6LvHygAAKmNBHX0rfC/Jk=
X-Google-Smtp-Source: AGHT+IEF5fcgC6ODgI4jJBJx2i1qOREjjBxmOShJ8ylB9dd5vueXyrRW5QKR45FnVPpf8X+wIJuZhg==
X-Received: by 2002:adf:ec8a:0:b0:37d:4ef1:1820 with SMTP id ffacd0b85a97d-37eb487c281mr7320360f8f.40.1729513962869;
        Mon, 21 Oct 2024 05:32:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a587f4sm4249896f8f.52.2024.10.21.05.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 05:32:42 -0700 (PDT)
Message-ID: <a2d20619-0724-4b16-a9a5-4a3680f21c99@linaro.org>
Date: Mon, 21 Oct 2024 14:32:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> One of the features that drm_bridge_connector can't handle currently is
> setting of the ycbcr_420_allowed flag on the connector. Add the flag to
> the drm_bridge struct and propagate it to the drm_connector as AND of
> all flags in the bridge chain.
> 
> As an example of the conversion, enable the flag on the DW HDMI bridge,
> MSM DP bridge, display connector drivers (for DisplayPort and HDMI
> outputs) and AUX bridges.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (6):
>        drm/display: bridge_connector: handle ycbcr_420_allowed
>        drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
>        drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
>        drm/bridge: aux: allow interlaced and YCbCr 420 output
>        drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge

How do you plan to merge this serie ?

>        drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag
> 
>   drivers/gpu/drm/bridge/aux-bridge.c            |  4 ++++
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  4 ++++
>   drivers/gpu/drm/bridge/display-connector.c     |  4 ++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      |  3 +++
>   drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++--
>   drivers/gpu/drm/drm_atomic.c                   |  2 ++
>   drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++--
>   drivers/gpu/drm/msm/dp/dp_drm.c                | 10 ++++------
>   drivers/gpu/drm/msm/dp/dp_drm.h                |  7 ++++---
>   include/drm/drm_bridge.h                       |  5 +++++
>   10 files changed, 36 insertions(+), 13 deletions(-)
> ---
> base-commit: 7f796de9da37b78e05edde94ebc7e3f9ee53b3b4
> change-id: 20241018-bridge-yuv420-aab94d4575de
> 
> Best regards,

Neil

