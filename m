Return-Path: <linux-arm-msm+bounces-35192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 209EB9A60C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 11:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0BF028262B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4B81E3797;
	Mon, 21 Oct 2024 09:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hNtB4ltj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608B194C79
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504560; cv=none; b=hwnsKOcLZbV9NeiYiNjrr8SshXB5ydW1fAUfc1bhNHsjbIgSwgMameRM977aT9L2vGQTkB7wkUjjBx4NssBXLGlJt3ZafFbbNumdB1nZvWmGXNzuC3px5mdvEyC95Tf4xbzeMzMxEmLgoSZGvIpjv/vnIGr6lrYNSOG9lz45Kvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504560; c=relaxed/simple;
	bh=aCPplQNHBSp7ixtlvVKNeQb0ld7g2/qr5WKCYSFaPBI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MAysVCV6LWiEtazP0gP1HaBjDN4kPnlNfZ//r7Mo8nX/ppIki32lt1HMhoCcJE8icMu7OgZDjhVV5FKy6oO6WosU5de6T1qI7wc++hwcEk7ekgb7OgCsYdOuUG7YRLDVaYM6Az8BoJhfuutEDsUV17DqO9o6pajyGaK7VQJIWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hNtB4ltj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so15526735e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729504557; x=1730109357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly9QzvkDQwHbhqCl2zYl2fNRI7r46h78qQTGBELbePs=;
        b=hNtB4ltjI5B7MbU5AoKG8TPQpuoxz26YEwoc5onwTcGosdFPtMF1b8Fbi3+NcNWe90
         rmlQg9i6HcLWVIb3QO2fP5wO0CwM+VGXRnXQjSx0YuEqNzavKqRPHB5JaHDBv9wRxTN3
         ywz8zhOmQiosKyn/AY6nYqjA8VROI3S6KfT1DYgrAXQKcsFrgvjZoDTBiSXcS9xGQyqN
         cGKnnfELWtQkP8UZfEGEEZiNFNzAYJply6lehf3dXD5c/ytql98Q9bdYf/1F+w3xgm8G
         aVw3NLvh9X5bUmFrRUqtWXhWRfgs3AoSRXHyqQHlzZ0DAudIfn1GyeUF80QLxboC5UhE
         7Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729504557; x=1730109357;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ly9QzvkDQwHbhqCl2zYl2fNRI7r46h78qQTGBELbePs=;
        b=R3eTwlncYWQkWCrke1nKkn+WzN5Hp7Xb3K9HvLCr0nz6+5KuyfugU19xRazXE0VE4L
         mPG12rbu4NwlEfRn0a3E1+SNxaxfpAhJIjm63XKsqB2QRW9jPsbOwBMfo+Gkd3OPDkLZ
         bXXo1QVU5OZbdNI5Axa6EN8HcYyBnE6JznBBepMD8b9P0RejUZRqibTS5KY6gQTebY5L
         z82yBIdDozKJdBkJ3yUIIWDo0YuNb007jWCpjbw8vjt0xP4CnREhpmrEMmiDKiYCEalA
         GIfoCpXSs7l11mJxFv7B5JPooHtnycNcZ1c9jqVtDXW6VBCWkQDw61Vuww3ypLK5Nt2R
         iANw==
X-Forwarded-Encrypted: i=1; AJvYcCW4q9iRhUHEY/eINYAvcKienjryprv164hy3Y32nkhqxH/5VSCJsFXLnM0ZNjTj+6O+XhX8JLvYU4tE0rhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YziZl2JGEyvHkzAl/mOplyR3aOJ4lQ6uc8N9if9A8woE6FTh6fE
	ZBA8kE+9p3+AHJzUn7sQwXWJ9nEfA8cv8uAIjQjTmyhg399tCzoOMDpgnAmA9q4=
X-Google-Smtp-Source: AGHT+IGObxU10ZGfZ87Oq/bHgK2wd5Q6KMGknCnnY1ElFcpU0HfA1xR2NwKT5e6iZbBblacYId1lVw==
X-Received: by 2002:a05:600c:1e28:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-431615991f4mr85416045e9.0.1729504556750;
        Mon, 21 Oct 2024 02:55:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57ba0bsm51558885e9.15.2024.10.21.02.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:55:56 -0700 (PDT)
Message-ID: <a19cae79-b50b-4faf-a81d-39e00d563053@linaro.org>
Date: Mon, 21 Oct 2024 11:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/6] drm/display: bridge_connector: handle
 ycbcr_420_allowed
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
 <20241019-bridge-yuv420-v1-1-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-1-d74efac9e4e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Follow the interlace_allowed example and calculate drm_connector's
> ycbcr_420_allowed flag as AND of all drm_bridge's ycbcr_420_allowed
> flags in a chain. This is one of the gaps between several
> bridge-specific connector implementations and drm_bridge_connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>   include/drm/drm_bridge.h                       | 5 +++++
>   2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 3da5b8bf8259..320c297008aa 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -397,11 +397,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	bridge_connector->encoder = encoder;
>   
>   	/*
> -	 * TODO: Handle doublescan_allowed, stereo_allowed and
> -	 * ycbcr_420_allowed.
> +	 * TODO: Handle doublescan_allowed and stereo_allowed.
>   	 */
>   	connector = &bridge_connector->base;
>   	connector->interlace_allowed = true;
> +	connector->ycbcr_420_allowed = true;
>   
>   	/*
>   	 * Initialise connector status handling. First locate the furthest
> @@ -414,6 +414,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	drm_for_each_bridge_in_chain(encoder, bridge) {
>   		if (!bridge->interlace_allowed)
>   			connector->interlace_allowed = false;
> +		if (!bridge->ycbcr_420_allowed)
> +			connector->ycbcr_420_allowed = false;
>   
>   		if (bridge->ops & DRM_BRIDGE_OP_EDID)
>   			bridge_connector->bridge_edid = bridge;
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 75019d16be64..e8d735b7f6a4 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -802,6 +802,11 @@ struct drm_bridge {
>   	 * modes.
>   	 */
>   	bool interlace_allowed;
> +	/**
> +	 * @ycbcr_420_allowed: Indicate that the bridge can handle YCbCr 420
> +	 * output.
> +	 */
> +	bool ycbcr_420_allowed;
>   	/**
>   	 * @pre_enable_prev_first: The bridge requires that the prev
>   	 * bridge @pre_enable function is called before its @pre_enable,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

