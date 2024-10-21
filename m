Return-Path: <linux-arm-msm+bounces-35166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88D9A5D12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5D61C2196D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1316E1D460F;
	Mon, 21 Oct 2024 07:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DtcSBRL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBCB1D26E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495799; cv=none; b=dpUMe28SXJJAPRWFhs2E2VHXI0u2kNuMranbpkcEaV0VANFd64A1zBqzuaHViBX4ptmDIFu6VyEqcZ4LRO9/kiWyNVg34QTsFP29zW2Gg2lMtVp6DPrsgnwjNa0Uy1OH1krlK69RzHaNGKUVbj5kD2zNhw3i3Hhh/HBAqxjbMw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495799; c=relaxed/simple;
	bh=ccghK1rZWyDtkZQcOREz7ARLrOL1DYBYTH9L0R9+UKc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MkAWbN5AOsTbEZnpvKln4QIvWZY0adF5eE7pbntIrMqd73btHsagDrNQFCo7X3m6LDdlRh4rxLAYNWGgXIBn47T6xSoX8xdZ7K2kPQIWN4s41HbzGMZy8Ilj3qTDuEjY33mabZHQa1tZ/H8ja6JSPlA7sJYpCLjWwiJwGKvos18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DtcSBRL5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so45473745e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495795; x=1730100595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNOZqddaoOrk8/x4u3nq9GdRCqUuOFLmAqZeR4UqCCw=;
        b=DtcSBRL5gz7p0z/PxHA+m0x44xfZsQ3BvF6d+hpj5DhpnrmuuBxFE8yIcv2s3rQjkh
         1xL+3xI8IGyvC5ApAi9fVlbvOoq3kZ9Uwiq5jK/WIUdme7roiJGwfghwGUNltuIGdx9T
         z1l22fbUuxV+aPCDS983kiCtsIBOAWfPJIbncS9ZybJEw3h1jff3SccklgpwQ88YqYPx
         5or34fROiFSfbxNK1NL9I4FAVZLfthnxM7mrRBfTAIrahIsnk6wcdc+WXdY1bWZ6yBdf
         fVbNKLPt/PrPy07OjSsJMIESyVmdr3QMClv6sLltl3gljBMVnWmlLmp0F4mwZ7xOLblK
         s+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495795; x=1730100595;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YNOZqddaoOrk8/x4u3nq9GdRCqUuOFLmAqZeR4UqCCw=;
        b=HO6+IiTua2lxWe398cMo8Pj7J1c9gGciKWY4Wwtq+63J1oRsWBKePjvjSA1I6r8VmU
         9FGcCXTh5aYIxdnQLpUrB8Iv4ihratwCzkM210Gmadmczi6dnU+X1uKNszS/jFcUHqfD
         MQSAk4wlaq0Tb3ikqMX49wIaMEF6ilXY0ua2/IcchgSqr0ELhpRBV1ss5FbV3Q+0dhiE
         qAnI0YsuwNYRx0EiRBhmHTIu6uTc7onkrRvy1e7488rxWuxwx/gmN684JhGQzXNCmC+S
         w9u7YegDvWjLWb/la845HSPY9MmaNvZTgF0Fpdqwp5rIEK85V27wp23j3vasm2pYZCbh
         gI/A==
X-Forwarded-Encrypted: i=1; AJvYcCWraajmC3IG7qY9IgOkfleUsZtboA32U2QhI+ZcgbGRMa8iYR5wTIoPEiqjZiqmThP7z2aAjS0DSzmJpE/s@vger.kernel.org
X-Gm-Message-State: AOJu0YxwsCPJuyvhbxdwyvQ74HQSw5lG0iq4JTaS6H4qKCRjHE9ZdXSM
	0+nbWm9jAbZIh02AA6h4pYEbVuaLKSBbYFw8+TpiY6mmo3L2at98GbN8UQHNKf4=
X-Google-Smtp-Source: AGHT+IFJuoUGb5krhAn5cqCgAJnC/ljP9vnIC3rDFQBRXtRPQG7LFSg4zpy9bDNhkNTbxSQjbnPvqQ==
X-Received: by 2002:a05:600c:1d04:b0:431:1a98:cb40 with SMTP id 5b1f17b1804b1-43161667bddmr62590085e9.18.1729495794803;
        Mon, 21 Oct 2024 00:29:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5709efsm47712795e9.10.2024.10.21.00.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:29:54 -0700 (PDT)
Message-ID: <28fb5aed-0387-4c16-96fb-c2c23ae315b0@linaro.org>
Date: Mon, 21 Oct 2024 09:29:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/6] drm/bridge: display-connector: allow YCbCr 420 for
 HDMI and DP
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
 <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-3-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Allow YCbCr 420 output for HDMI and DisplayPort connectors. Other
> bridges in the chain still might limit YCbCr 420 support on the
> corresponding connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/bridge/display-connector.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index ab8e00baf3f1..aab9ce7be94c 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -270,6 +270,10 @@ static int display_connector_probe(struct platform_device *pdev)
>   	/* All the supported connector types support interlaced modes. */
>   	conn->bridge.interlace_allowed = true;
>   
> +	if (type == DRM_MODE_CONNECTOR_HDMIA ||
> +	    type == DRM_MODE_CONNECTOR_DisplayPort)
> +		conn->bridge.ycbcr_420_allowed = true;
> +
>   	/* Get the optional connector label. */
>   	of_property_read_string(pdev->dev.of_node, "label", &label);
>   
> 

I think we should make sure all HDMI bridges can filter out 420 before
landing this, no ?

Neil

