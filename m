Return-Path: <linux-arm-msm+bounces-5153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E9A8167F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 09:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BD6B1C22444
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 08:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A1612B7A;
	Mon, 18 Dec 2023 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FQDHakPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBF12B71
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 08:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3ad3ad517so784895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 00:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702887720; x=1703492520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0QEjs1Jg1kz4BkfgQOg0LY+rMkPfi56QP0+9ep3H8I=;
        b=FQDHakPOktFOCraz/DMaum86XtZPtaBGXIGFkS1Z+TQ7oikh995xC8MM1DiNunqet2
         YAX5rgvdnA05bfpckU4sn2N1+QBKxNtsx5SfuX4siKTD0NR1YKbUs5nxR2SnMs47/KVH
         HwhA4gWZBaSB9rIc50hRPV5dBU1Ei3VH5h+HGqXfB6CnC1eVqveD+zDxOQbxZFbpgkiP
         9sogXJ7L6G7hyP03GsfWqE16PS5LM0wfxf/z5S2oIHItL6ztPQ1+pf8xweQ7ErhgW/p6
         OgghGAwdemTDpsd9XbkMosFMOAcVKbOJvPbenOFK7utZDuq1SMQXIm8ydHWT7qkQ79h5
         OOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702887720; x=1703492520;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i0QEjs1Jg1kz4BkfgQOg0LY+rMkPfi56QP0+9ep3H8I=;
        b=au0MLSJKSN1eqso+SGJe3Y7EqH+MYUkos2VVBf6RueChwE30lN5V/Ml5FBowH6L7Ym
         JSffzeCRT/g79oGPyn2+gVrdYHu9mSHcinMA5e6AbtZ9qGwJFs9UKMUHX1ghScGGXKi9
         h1qVPa53rO90QZRspAzzcnAojhsYwYpsSeS5DXgRCpB9ZsEyGQASs1w8hGLZrsiDlbOq
         e978AA0aPkaivSjBfRNBqM/jb6FdVjz0nIAiszg5Np3UoqlEB7eqoA3Spk+/FqrRExkp
         QvkQIVR/uJa1L8dmeiQjWX18BUUreTDXntrxZqfHYRS50ZSrA6qHIjVid/X0P0FDHgpa
         kxWQ==
X-Gm-Message-State: AOJu0YyUQRpNUarC6F42ZeFOdWhrzSRRGZNSwDj5nmkFPQ3mGMY8cEzT
	5RCFHqK/r7RKVd1R47RhIZDaAA==
X-Google-Smtp-Source: AGHT+IHH/VJngh1h4Twl3A0LIkPfDZJx2LyXecl9lddnCK5jb40U8/11sJPG9CpUb1qda/iILrQf/g==
X-Received: by 2002:a17:903:25c3:b0:1d3:b860:5a99 with SMTP id jc3-20020a17090325c300b001d3b8605a99mr379449plb.71.1702887720233;
        Mon, 18 Dec 2023 00:22:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b425:da5d:c0cf:a505? ([2a01:e0a:982:cbb0:b425:da5d:c0cf:a505])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902d68300b001d2ed17751asm1034446ply.261.2023.12.18.00.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 00:21:59 -0800 (PST)
Message-ID: <8491febf-de39-4dd5-891f-fd844b83b7b4@linaro.org>
Date: Mon, 18 Dec 2023 09:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: properly refcount DT nodes in aux bridge
 drivers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/12/2023 00:59, Dmitry Baryshkov wrote:
> The aux-bridge and aux-hpd-bridge drivers didn't call of_node_get() on
> the device nodes further used for dev->of_node and platform data. When
> bridge devices are released, the reference counts are decreased,
> resulting in refcount underflow / use-after-free warnings. Get
> corresponding refcounts during AUX bridge allocation.
> 
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")
> Fixes: 26f4bac3d884 ("drm/bridge: aux-hpd: Replace of_device.h with explicit include")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/aux-bridge.c     | 2 +-
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index 49d7c2ab1ecc..54d721db0ea6 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -57,7 +57,7 @@ int drm_aux_bridge_register(struct device *parent)
>   	adev->id = ret;
>   	adev->name = "aux_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = parent->of_node;
> +	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_bridge_release;
>   
>   	ret = auxiliary_device_init(adev);
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> index 1999a053d59b..bb55f697a181 100644
> --- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
> @@ -68,9 +68,9 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
>   	adev->id = ret;
>   	adev->name = "dp_hpd_bridge";
>   	adev->dev.parent = parent;
> -	adev->dev.of_node = parent->of_node;
> +	adev->dev.of_node = of_node_get(parent->of_node);
>   	adev->dev.release = drm_aux_hpd_bridge_release;
> -	adev->dev.platform_data = np;
> +	adev->dev.platform_data = of_node_get(np);
>   
>   	ret = auxiliary_device_init(adev);
>   	if (ret) {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

