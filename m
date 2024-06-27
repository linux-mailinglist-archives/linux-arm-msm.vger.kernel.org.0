Return-Path: <linux-arm-msm+bounces-24465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF291A727
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32C21F250B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8933F179647;
	Thu, 27 Jun 2024 12:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWpQSEd6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C500B179641
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493131; cv=none; b=nEaisIVsIklVX5D9iIVPUHdKoLdR3F9mBDakWGbT8X7boi0BwHr8DTwv2O2/VRaWrFvZbNUWheyLtwdJvMvdWsKA2Wz60R/9iyxXkankAbtFgkTTuabKoSeZkNn1tuTUn7jkuaAzne483z1IDGaW4Pjyg01RN16D9TC10IWwn1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493131; c=relaxed/simple;
	bh=BFJqvvwzgXTKnp7wUm5ylIIF+ac6I/VvpFUBscUMLaQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ITXwKbz6JCoOyKaahknM7qGE6HhjsvZQgfeTcPV5leRxx3SAC1n5CiFpQvmBkn5tBohVvWNlscQCwva83gMBlVyxpR+rAa0GZIUkFat3/+S/R/bxMaA/Whj6bT8k1tk5HD77l85t1jWBCEqHiiVtfXNtRbB2mwbX5I3ToOCjxhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWpQSEd6; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cdea1387eso5645771e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719493128; x=1720097928; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggWXmRs7jIjON8UjWfc25bUS0kEkQZXlxcRlo0AHzgg=;
        b=jWpQSEd6anVyS74GIgt1yVL25x7BRquCykpoZL6yshzf4Nzqy/jIk078YaQS5Hke+z
         HORPXsw4aJqhunr4juiNEW7gCfkAfTuJWafICbhX59acnSjtB8mMkVhGC5wCW/3xP80t
         5kgkcz9Qf0Nb6F6NJlri3VlgbQXlq05/5PJaXq30tAk0eSTufcugprwgmVBqjFt02ZYd
         luEdghRuPER72tjurEFt/MZFK51g5l0LjrHXO/d0O3UnQ7cH3tifWczzIqGVLJp3a42B
         NV9zsh8b/ctMZAf4xYsO+auf5NeDk/v00JP4VDFCfABMlwfg0exMS8dx3tymW0IMI6JJ
         UoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719493128; x=1720097928;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ggWXmRs7jIjON8UjWfc25bUS0kEkQZXlxcRlo0AHzgg=;
        b=RcgwKziHXcC8R/E6MIyHoSHrMrFp2UcF2zH7OLTr0e/uW8oR3GlddGfsYTE+V8b4WZ
         V5+q5Ke4y2Vpt0FLZd447T96yjc0VnGOPfQxJI0pupZfUqfhzmb1/eBVO+Yr4qze5d1v
         SnPcNKdhOh8+czFdZe7USpSNZm5bc+vX+LDQmMBaBWmBk11ZxSyAWBqJlHuJNRsAkZ1v
         J+87No6OkYcpZ6ZoEFBaTPKRb6/Bek3SAtEqEpkowD+tq4FgwO/J2HPHVwXsFD+cC5md
         VRXX+WgA0C3assRu1SezfrsLmEQqxyEcrFzap4YM5NcKF3tAi9y9666LK+hF0dBZLGxd
         Oc8A==
X-Gm-Message-State: AOJu0Yw5e1o1Cuk9AyqeDfrdxNW3nKKy6E4gMC5oCISIWo5WMca1reRc
	Ml+nhBJc9z9Eo4j7cT3XWQZn+h1nq1vUcb/La4RjziGZaLFi7h+G0x5BcGgH/1w=
X-Google-Smtp-Source: AGHT+IEiqcyM7j5d8vMA37q8FTy4bbA4eRCNMZ56T3o6exzKO9FDtm3+D1xRJ3+j2E0oItZOMaGibw==
X-Received: by 2002:a19:e043:0:b0:52c:e121:c927 with SMTP id 2adb3069b0e04-52ce18647f7mr8070668e87.62.1719493127407;
        Thu, 27 Jun 2024 05:58:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bc59f5sm26436015e9.42.2024.06.27.05.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 05:58:47 -0700 (PDT)
Message-ID: <bfc333a1-52da-4e4e-9917-09840ac5ebea@linaro.org>
Date: Thu, 27 Jun 2024 14:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/6] ASoC: codecs: wsa884x: parse port-mapping information
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
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
In-Reply-To: <20240626-port-map-v1-4-bd8987d2b332@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 13:55, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/codecs/wsa884x.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..72ff71bfb827 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>   	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>   	wsa884x->sconfig.type = SDW_STREAM_PDM;
>   
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");
> +
>   	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
>   	pdev->prop.simple_clk_stop_capable = true;
>   	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

