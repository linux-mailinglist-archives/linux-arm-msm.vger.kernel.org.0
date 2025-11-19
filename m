Return-Path: <linux-arm-msm+bounces-82456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 42275C6D8F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 10:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8BAF03A0027
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 09:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CE9330B08;
	Wed, 19 Nov 2025 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FT+cD2Uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C46330310
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542830; cv=none; b=BmiPb7B/jlC+sNuFv83pc+/kRouoZM94kLKoASZWk5LzPJ2K5bgLB/mcm50IbQabSrg7yooLkBdDVAOF5nv5oEQ0w1Ef7QWtRJXx7ttgl63IZYl7jZOavtSEQZu58cIBDHMUQ/NOAWVcx+Gedr4dQ6b7hZBIG32s1m4bN/5iRbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542830; c=relaxed/simple;
	bh=apPETYlGfuXnfVmULi3TMIxRbtt9GCrIvCgIC//NDsk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YqZDAjIv/0R160D+ggpzh039+r/d2a+d7P/qwRon8k7qxiUmjt6l6uiBL3e8UQWWoBWa+ddCQk7PAJxIWATbTO2vW8LrXaJ57S9xFICw8j9EJswIi9e2c1q0yqZQAouEecx/8GEGCBme/EAIEbo9XbIrVd1J2ve/+hEiXMQpg5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FT+cD2Uz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so64563805e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 01:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763542827; x=1764147627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4o2tM+ArrmsFsspYg0k3nWsLzZ8YFxjOnE7FsUFX8Ek=;
        b=FT+cD2UzfS4Hcu2kJ179qy4kS77lDiKW9+nNOif8MmRwK3tI8X/714xfjI8bfPv8uw
         Y1vQ/6quDqqA6u5Kj6ZFlv/EZwPcXj4cBD/1P5n7GqZAQNLNLUzWe9DeSZmEeyQQqlGv
         0lOGFWxZ0YLGd9ujYYvbEcmIAPSs8DCOBtlPjgInyfZt220pV1+LJqMSrtZjBcxWrMai
         U5Z0/eWGmkCEqkBrOmSNWUS1DpfBYGGXZLWzSQ94Wx9idNPd69oKYj5Hx1s0457CEkok
         jo7fMUhIWKB756vZ56K0OFdYmntunS5pN1X+AE01MkJJiPLaosOYKLP8Dy+c/k67ctwa
         JPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542827; x=1764147627;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4o2tM+ArrmsFsspYg0k3nWsLzZ8YFxjOnE7FsUFX8Ek=;
        b=lULSH8M9obQNF/XsZY27RRpOcdg7EbOuZSqJpt6awEASKfsM7CDDR0O/owu1+nPpZ1
         mb32tUWBBCgCzFpTW2c1CDxfHWy5LKWcNXR2GIlbKPYgYOgCfDTqvXRZtwltNHahs4s5
         fNx00y4qtFuo6nJUT/pn+U7t/jnfTCPIKj1i80A13qcsb6bQVo5R3CRwZXSmtYgWY2+9
         ksd6+eAcktXk6slxFRyibJ7NnwuLkR5A0Hum/e2iotsk7uYn979pG/PT8PIJKFQxqws0
         227muMVqtuXTe6koQRSuoe694pGndTE8tORsY5//7Ljd0ZK9ZHhGazs9fT7jboKokhMq
         ZmtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkbammHuKAhHZ2TZvc9lsSkw7iX5MvF1ziRrX8QGrgSnO4SrMi1ii50Qp/siBFkbLmQ9323AuU7Gmcwt/q@vger.kernel.org
X-Gm-Message-State: AOJu0YzfbfLExY7/Fbwx4RGAcWtL+hING171jLrVtnKrF2ykCNBvcXKV
	0m/B8skbglKn1b2/ChsbIs6DgNHS7Xq05ebYSSQo46HCQsCTexzq73m4iPZR/BVIUuw=
X-Gm-Gg: ASbGncuptMB10Qh/FAfpTPLe/VJuibVjlRS9JQjc9UyDlWbU8y2YxvvtWGYKA+T34gL
	Hsj3+KyDVtV76xNc2eUMRl7viv/xTV9bEOje9N42n2mub5wrq5Qk8JrPGr19sDbbw4ywiVGb+Lm
	epcSoaJA0L+rEPxWt6vCCgKQR6tAS8migg2U4Q/VSIBk2iSbLuGnFNfI0x6AP9V8r/mpfAz4txK
	+FBTAhpX9cU87ymUYvvLFsutf2sNMNAY7GCBuH2/kVv9umApWd/DgXUbMDEuNM8ig2sdJtR7nAc
	IJOe5Pr7z3dIJ8RJYaSRV6R+PtIH63CXbtsiw+FTA0w1KH2oYFT0gG5YH3/L+sxgTtdufKWFOCk
	1yeASBk/wrGoDYI8fmD5EnK3X7btn7FF0LKFaEDkO1wCsJCdmJTXG+VBjHn5lE7CF40d6r5lSX7
	gK1gqH8ruqiScRc5ImxbHfQnc/gAygTt7SNKRGm7RIwDXNxeB8KEFMBi28vG0sKt2nkk5J7B8Qa
	g==
X-Google-Smtp-Source: AGHT+IFOiVbrUh5e/ITksR8f1dPUzOzEpp+5udtg2l5yOafnfxD8Gq4qiWMiWFM5lEmQkA2cz8MWYw==
X-Received: by 2002:a05:600c:4505:b0:477:5c45:8100 with SMTP id 5b1f17b1804b1-4778fe9638dmr181221955e9.24.1763542826616;
        Wed, 19 Nov 2025 01:00:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b103db28sm42889625e9.14.2025.11.19.01.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 01:00:23 -0800 (PST)
Message-ID: <e879a799-e415-4ba5-ad2e-301c16124825@linaro.org>
Date: Wed, 19 Nov 2025 10:00:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable EC drivers for Qualcomm-based
 laptops
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119082408.49712-2-krzk@kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20251119082408.49712-2-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/25 09:24, Krzysztof Kozlowski wrote:
> Enable the drivers for Embedded Controllers present on laptops with
> Qualcomm SoCs: Acer Aspire 1, Huawei Matebook E Go, Lenovo Yoga C630 and
> Lenovo Thinkpad T14s.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   arch/arm64/configs/defconfig | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8d6a1bb1e03e..7030b27528c6 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1383,6 +1383,10 @@ CONFIG_CROS_EC_RPMSG=m
>   CONFIG_CROS_EC_SPI=y
>   CONFIG_CROS_KBD_LED_BACKLIGHT=m
>   CONFIG_CROS_EC_CHARDEV=m
> +CONFIG_EC_ACER_ASPIRE1=m
> +CONFIG_EC_HUAWEI_GAOKUN=m
> +CONFIG_EC_LENOVO_YOGA_C630=m
> +CONFIG_EC_LENOVO_THINKPAD_T14S=m
>   CONFIG_COMMON_CLK_RK808=y
>   CONFIG_COMMON_CLK_SCMI=y
>   CONFIG_COMMON_CLK_SCPI=y

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

