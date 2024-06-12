Return-Path: <linux-arm-msm+bounces-22483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 411709058D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC604B29054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F45181BB5;
	Wed, 12 Jun 2024 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="feI28k/w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D4181B99
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209560; cv=none; b=gu6P1xetV0/kcaimekXYDuJgo3N4Ok+2ANypLsVUqWAzn3rIdHnZsY6l+RUGkuntOM0NNyUoT8GXNWug6eah7jY6l1hDGAzbnk51CTqHcn9THtNLeSixrSnFi+ONp9hLzWB3ITyptsM6WOwvamlpc5ZGnM5u8BBM/uZtFD6dq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209560; c=relaxed/simple;
	bh=OUH8r7nm7X4nzLEM+Gx/H8Ae5zfR46RGnrG2zg0KtaA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RUEgpi5UpI21nSqHjWAXYhlX6QFlztWI//IUZG4vL/tYPW9HG//HdWNWmBcmuEiRSx+PC1HnxuIG40RNdOpaomW3++N8zzqTBWLx1x0C07uatnQ1owNsos90vZDhQjUM5lcmnhWSaOA1/pDBK44fml/IjEdtcwrjuZhxt5C6M+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=feI28k/w; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42281d8cd2dso465365e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718209557; x=1718814357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qs3pRP5kMn8rl5PB08ax90BdQl8ujqUfgl1Yv7Tm4AU=;
        b=feI28k/w8OEo0NXVyfMBn7TI8rYla7xvgTrT6wM55isj64wdY4Q8YVVAjeDmjA7wvO
         nyiAg4PwpWKrdkACita61dwy5G2AS1uaa96kATC3G2m2+ClYqx1+rihGCG/KRQSzBYFb
         5vp3Z7vlHM8R9t8hC/iHktgdmTS9/TDN0DfYtT4biCs7ONCTKRgVeobBvIOduMZvKpxR
         Hg62C1ro78CQarK2nbiBB8WP4I6KUg9kq+8Ykss1ub0implu6q0cdvnqU5XoRBLK3DYN
         oZjjKnfDqRy6dl6JmMeZR+GeZjIK0yVOMn+yQDAYXL2xrlrz3lSkLxAkTTbZTgy0aS4K
         r4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718209557; x=1718814357;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qs3pRP5kMn8rl5PB08ax90BdQl8ujqUfgl1Yv7Tm4AU=;
        b=PkMh+MBF3l5tIYjhBNn1jvhgPhmNRukCT+JXK5wbGiuWSIkQMcW7UCmHcu8m4B68iI
         tf0+oHcxVS1yxSrjkmoVJugOzrsvgzjkz/KmI4LSa7RpvXnpvmSGulWX/6lMm72Q82qi
         DF21LnDyxUU7OT5+G1ysyuReAxunvphqvf06em9hFO6h3w29lKH2uvPjX+utWHmB59AG
         VursaXnrke350809vEwMjGAm2i6SGwy5Mh5YHWqtBPewWZzkbTTT4YG/5ETdHeYJnrv4
         LSD5z+1mFCG5VmO77wj9LAAO0sRRRKAWqmqBzEWFtF6Sg9lVBphKTZ0Xr5UqScnBiRtE
         GLxw==
X-Forwarded-Encrypted: i=1; AJvYcCVWHcyZh3X5KKBHNC14pe2+ZsktdLsexj0luPGOdTbJqXBDKrO7GMGW6pNPlcQPEN9XUOXqY9GQvGIW3OvTc6QPWTciWHVb0gqYZ7ggzQ==
X-Gm-Message-State: AOJu0YxozMIeEbgC7s7pzHXSSW2z3Y8lAlFE0C1L5nxpJzKlmzOoXS4+
	/j77UHeScNKsIBqkTocGEnI2+l50IRqFb0crypzZCwetMnBu4iL2ME4vE33/0bw=
X-Google-Smtp-Source: AGHT+IE7UzmRmGpStIY9W0Tm1pW+g8Hn+VED4MtUAMIa4Y8YYdZAVgW7/F0NlfTjwqNHthlaxXQQ3A==
X-Received: by 2002:a05:600c:3d94:b0:421:819c:5d76 with SMTP id 5b1f17b1804b1-422862a77a1mr18654405e9.9.1718209557332;
        Wed, 12 Jun 2024 09:25:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb? ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870f0c65sm32402695e9.27.2024.06.12.09.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 09:25:56 -0700 (PDT)
Message-ID: <ba14fae0-a0d3-41cb-b24b-0ad8cdbb1e5c@linaro.org>
Date: Wed, 12 Jun 2024 18:25:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 22/23] ASoC: codecs: wcd939x: Drop unused RX/TX direction
 enum
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
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
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-22-0d15885b2a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2024 18:15, Krzysztof Kozlowski wrote:
> The enum with RX/TX soundwire direction is not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   sound/soc/codecs/wcd939x.h | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
> index a6c9c6cee056..0aa4d9d542c6 100644
> --- a/sound/soc/codecs/wcd939x.h
> +++ b/sound/soc/codecs/wcd939x.h
> @@ -903,11 +903,6 @@ enum wcd939x_rx_sdw_channels {
>   	WCD939X_HIFI_PCM_R,
>   };
>   
> -enum {
> -	WCD939X_SDW_DIR_RX,
> -	WCD939X_SDW_DIR_TX,
> -};
> -
>   struct wcd939x_priv;
>   struct wcd939x_sdw_priv {
>   	struct sdw_slave *sdev;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

