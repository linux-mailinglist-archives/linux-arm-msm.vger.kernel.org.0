Return-Path: <linux-arm-msm+bounces-11313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31499857A58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFFC288C5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D114EB56;
	Fri, 16 Feb 2024 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wIHSeC1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E40F4E1D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708079583; cv=none; b=UcQ8GRaYcpKHRXCBKdDil3M08ux/tVUsD9Tf4o/4TGdRACoUylTac7nt6lgW1U2XJxtp6956zOd2PvvWlW5o0LANXDoN7Rm8fpguapUql290VX27/q6ETsUo+2m3Jkyx3Ufr0+84TLI4ktO7ibIb1VWThu9fvqzl4YqJKuM/gZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708079583; c=relaxed/simple;
	bh=pxwzx5kB80QMEodtNWjHHfr73oHpaRhGMMqhZkUTBn4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=fKPCNvG/oXAeaU/JSY+uo/pKwXsVlWGR4kO6FG66iYFyK7cYRq+nS525D2OCZHGrerT1/X6BoDzWtzCuJ8b7xRsQGSt9lqV2xVlU9+WiWLdERbCWlRbdH7yaNInpaq+FJVxTfHTL08C6Bs1F4SgqqKvAwDBLppJelHc58Xj9dWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wIHSeC1b; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51299d29e43so101884e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 02:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708079579; x=1708684379; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMbxU1cj4AlsYwIsgCEwPs2BixckI2B8kxHIhwU7JYI=;
        b=wIHSeC1bbRabp+VMxr9eFiH5XZPqTbwU+uJqEAlkDns5Aazq4UhH2hTAcKyp+BEEBY
         eHK2BTs0rIXjgtWtQtdrcnaCUMMBHYzhVvmgjB4qf49LQvpVfzHsVpS2fqi4Qq2xgD6B
         yJwU76eFkPj6pF51kS6ehTwl3kzSQVnq2Fu94H5gm7w1yVpsaqf/hWlXANoRyHr3CQFJ
         dQ0YdtqHpZzbVtM+KU1CYwwbOF6GM/gYiaE5V3i8L5CIofSZihcvzGpDyEvmCCyiizww
         Tvf1F66gey2xWjuJ2KM0VGrjdq0ZacOKLSUPQG7/Ds5NDiBzKm2x4XwSaRS1n83dykcd
         oQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708079579; x=1708684379;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IMbxU1cj4AlsYwIsgCEwPs2BixckI2B8kxHIhwU7JYI=;
        b=S9q4E8MiI5lf0iME/w8AK+hEhkljzXbw8OtHNMvCd7d7gG+92N9JaNhaML7CcOdZ9T
         RQfvwUS8zg814V68m+U/vvvzRzn28Lrruq9EGr1WbEt/0NtzVNRKJdykNYJHZNdKBz9w
         nCNK8EMhLAzpInabxdMI4rT96/hn1Zh0LMd7IRAuGiFSgi1Vxfba+Ia6oDkrhXTOhCd6
         wSKuP7nPwzHJnIssPyuN687sb4DO8vhyrckfh6kd7KhADtA4wBtqO3urX1NiHi1/bqku
         ovGZPHE4pc18GjKXpXTU7wsvaN5joFe6mJamJt5Ejkncdd7INuMYrZjJYSil9b+mkPES
         2O/w==
X-Forwarded-Encrypted: i=1; AJvYcCVkJF6CcUj9eLYEr8E+/TtFMIutRdRlhNxVCw0gj1OghjpQcgm/cYVNtYZsHoa/tE3vPJgg8h2mjz6jRuUvaSPl6cZO3Clw8zBHuU2Bcg==
X-Gm-Message-State: AOJu0YzSSBL9kLZ/9O9rZf/t+INehJjPk5Fplphdz3njZM1A/Atj07AR
	TbeZlr63Rcx+V2WzNhogY8GWP0xajLBEf6HxFUNC6BefoxDzHU1D8cm0BpFJYDo=
X-Google-Smtp-Source: AGHT+IGFZtxqLSA6putEUMAD7EpOHwwqh+2loxvsmeMfH50OhCntOMdEH0XOC2b7X+b4r0cxo+Bq2Q==
X-Received: by 2002:ac2:4c8a:0:b0:511:2f76:e093 with SMTP id d10-20020ac24c8a000000b005112f76e093mr3125845lfl.58.1708079579184;
        Fri, 16 Feb 2024 02:32:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:814e:29c1:3729:78fa? ([2a01:e0a:982:cbb0:814e:29c1:3729:78fa])
        by smtp.gmail.com with ESMTPSA id j11-20020adff54b000000b0033b43a5f53csm1786281wrp.103.2024.02.16.02.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 02:32:58 -0800 (PST)
Message-ID: <f60d5399-79f3-4b3c-833f-4b7131929355@linaro.org>
Date: Fri, 16 Feb 2024 11:32:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: qcom: sm8650-lpass-lpi: correct Kconfig name
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240216102435.89867-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240216102435.89867-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/02/2024 11:24, Krzysztof Kozlowski wrote:
> Use proper model name in SM8650 LPASS pin controller Kconfig entry.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: c4e47673853f ("pinctrl: qcom: sm8650-lpass-lpi: add SM8650 LPASS")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/pinctrl/qcom/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index e0f2829c15d6..24619e80b2cc 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -125,7 +125,7 @@ config PINCTRL_SM8550_LPASS_LPI
>   	  platform.
>   
>   config PINCTRL_SM8650_LPASS_LPI
> -	tristate "Qualcomm Technologies Inc SM8550 LPASS LPI pin controller driver"
> +	tristate "Qualcomm Technologies Inc SM8650 LPASS LPI pin controller driver"
>   	depends on ARM64 || COMPILE_TEST
>   	depends on PINCTRL_LPASS_LPI
>   	help

Thx for noticing


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

