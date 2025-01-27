Return-Path: <linux-arm-msm+bounces-46268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F6A1D7B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6CB63A5550
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F35B1FF609;
	Mon, 27 Jan 2025 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iCS7nPIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF42125A643
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986760; cv=none; b=ZA/2xxv1m8EOJVzooX0va7QdoCEDuwc0JbE3QEI5gGRv5KDc6Lc7bGw40g5SePjuHB0vbPM/A0aefEZVGp88LpLKXeTL08wc5wHvcSTULxTwTVk3QdfyDoQH2dLXMObUS6gW8+j8tmmNNzcBl5zrnFQc9agNVJ3Q/tzPn1HAYVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986760; c=relaxed/simple;
	bh=SND6uGvEPvfnUqX/+92sbJDudJspWViGzgfQq8nn0SM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hp1+zBwO8QeP2U3XvZa6KL37Ka7fWK0UYZp+EcYeQY5dWbRtpz+OlRFmk6gYC8ebA0lxUYj9WHHegkXp8z9uJUN036VmFYZgNaw53jiRb4UBewk9MnI5g+L85ffXGhqkugmfIuCJW3gNHkHAppJAImXE8pD0dtSEix/zrTRUAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iCS7nPIc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so47789835e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 06:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737986755; x=1738591555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmIECpzivJaX0vHkARDWli/xyjmyuprRkzh5c2QSGfE=;
        b=iCS7nPIchSL+6YOF2YsJxRpZm+8nMMuCL8QZgZWRqJ/2Xh3Y4WeN2ZJHOT2ZWjt2Sw
         Q32b9yo7oHXswBO0z58n67HP+V/hKCwufzYEJdsX++UvtDdsnRpplKEzfSnHThVdcDaT
         E96Dh8nC5Ha4mDvLDBxZD83KBS/eZ734UjCLKH5BlP9fIQo3cK0/X9WwjQet2+fbofyr
         Et2lwUChDmIVsqEzEI0WOG9K2DE+5gnDx9vhU+Nkbu87cq2aHCS5NpHsjZcAY6+LMbYP
         Wx2WQ9nx07wCNlhbc9qKi6qb/IkGbEKhaLDweuyGB+rQmXe6ce7OisWxjaZyGdWorMbk
         +Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986755; x=1738591555;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YmIECpzivJaX0vHkARDWli/xyjmyuprRkzh5c2QSGfE=;
        b=LMObB9rdfGvPAbnNU6WzMbEvYadkoxK42CYKebSENwyPLKAjMzaZr07+9YWSJCa0bx
         /tjiOlwR6VuOXA5744qpaB/ciayge2b9VKTFptj6HpOFGeCy1spLLCOj18vxWw18jcYS
         SxNL1HVdySwGdQis3LI6+byAoP9XqwPDMmWJUTEOHQ5DnAOU9deg/X7FdoEsr/cSG62p
         4d3LxcHDXfkAzSsHT0/ZGyiYr6jEz8aVnDL/tRA8WnVoSiVEfV6lcLV+PyMGgYJzr2rz
         BqHn/aepX8Clyi3CW0hPkWWneoxnItI5lmiZNOHeTmGDyGZjdSpI6pBaUjH0HaFE43IN
         qjUw==
X-Gm-Message-State: AOJu0YyI+B0QRFvPT6y8HpyKDXIEy1+Eer+8J42dSr05ftRSevK2vBEn
	/2z6s1mMul+HBjfusvj8o9tO9GZxJD3lZpnMZEJhfG8fVaEubiWROtVoZA5Q94g=
X-Gm-Gg: ASbGncsO6mfdIR2cP8O4XivfoONugEgJVQjFJt/xStzno0kQKN+6ApHVITrAPDCl+2a
	2UgOtyuDMvDDNI+7akEHilhKkd0+4GWwWHveR9aNgSmnMxvYPRDsF9baCeglRR4e7pBFyWKa6YI
	O2GyWQ2BaM/8k66RiV6ZLWNqTCxx+Pac6Owf6ki2Ny7gCCAU5qiclr6XNnd9xG0+/36HDkDpvJm
	+8E11oB9rhbUfpWyNmVrqsEW/sTcY4xqQXjZngf3q0ZBCJHWW06gG7islep7iAEsHoCmDtZbMip
	PxGy5AVEpFExVECiXYiyfQK72oK3V+x4sHfI+mNxwZqGXYXRIUAPGpQ=
X-Google-Smtp-Source: AGHT+IEuX53cl5AhvFl6UxR4rx7guKL6qOB7LkFsvvryRf/3+O4uJts8oX0v2xXNAulQf8f7Q55JgA==
X-Received: by 2002:a05:600c:1c83:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-438913be56bmr369166745e9.5.1737986755009;
        Mon, 27 Jan 2025 06:05:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d5a2:c9a1:da0:83a4? ([2a01:e0a:982:cbb0:d5a2:c9a1:da0:83a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48ae29sm137326215e9.22.2025.01.27.06.05.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:05:54 -0800 (PST)
Message-ID: <d4c1958a-1454-4b71-a006-6bd108781b09@linaro.org>
Date: Mon, 27 Jan 2025 15:05:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 00/24] ARM / arm64: dts: qcom: Use the header with DSI phy
 clock IDs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
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
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2025 14:47, Krzysztof Kozlowski wrote:
> Use the header with DSI phy clock IDs to make code more readable.
> Changes done with sed with alignment/wrapping fixups. Verified with
> dtx_diff.
> 
> Depends on:
> https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
> 
> Please wait with merging till this hit mainline.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (24):
>        ARM: dts: qcom: msm8226: Use the header with DSI phy clock IDs
>        ARM: dts: qcom: msm8974: Use the header with DSI phy clock IDs
>        ARM: dts: qcom: msm8916: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8917: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8939: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8953: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8976: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8996: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: msm8998: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: qcm2290: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sc7180: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sc8180x: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sdm630: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sdm670: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sdm845: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm6115: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm6125: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm6350: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8150: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8250: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8350: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8450: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8550: Use the header with DSI phy clock IDs
>        arm64: dts: qcom: sm8650: Use the header with DSI phy clock IDs
> 
>   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi            |  9 +++++----
>   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi            | 21 +++++++++++++--------
>   arch/arm64/boot/dts/qcom/msm8916.dtsi               |  9 +++++----
>   arch/arm64/boot/dts/qcom/msm8917.dtsi               |  9 +++++----
>   arch/arm64/boot/dts/qcom/msm8939.dtsi               | 13 +++++++------
>   arch/arm64/boot/dts/qcom/msm8953.dtsi               | 17 +++++++++--------
>   arch/arm64/boot/dts/qcom/msm8976.dtsi               | 17 +++++++++--------
>   arch/arm64/boot/dts/qcom/msm8996.dtsi               | 21 +++++++++++++--------
>   arch/arm64/boot/dts/qcom/msm8998.dtsi               | 17 +++++++++--------
>   arch/arm64/boot/dts/qcom/qcm2290.dtsi               |  9 +++++----
>   arch/arm64/boot/dts/qcom/sc7180.dtsi                | 11 +++++++----
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi               |  9 +++++----
>   arch/arm64/boot/dts/qcom/sdm630.dtsi                |  9 +++++----
>   arch/arm64/boot/dts/qcom/sdm660.dtsi                | 12 ++++++------
>   arch/arm64/boot/dts/qcom/sdm670.dtsi                | 16 +++++++++-------
>   arch/arm64/boot/dts/qcom/sdm845-db845c.dts          |  3 ++-
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts             |  3 ++-
>   arch/arm64/boot/dts/qcom/sdm845.dtsi                | 21 +++++++++++++--------
>   arch/arm64/boot/dts/qcom/sm6115.dtsi                |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm6125.dtsi                |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm6350.dtsi                |  8 +++++---
>   arch/arm64/boot/dts/qcom/sm8150-hdk.dts             |  3 ++-
>   arch/arm64/boot/dts/qcom/sm8150.dtsi                | 17 +++++++++--------
>   .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi   |  3 ++-
>   arch/arm64/boot/dts/qcom/sm8250.dtsi                | 21 +++++++++++++--------
>   arch/arm64/boot/dts/qcom/sm8350.dtsi                | 15 +++++++++------
>   arch/arm64/boot/dts/qcom/sm8450.dtsi                | 21 +++++++++++++--------
>   arch/arm64/boot/dts/qcom/sm8550.dtsi                | 17 +++++++++--------
>   arch/arm64/boot/dts/qcom/sm8650.dtsi                | 17 +++++++++--------
>   29 files changed, 210 insertions(+), 154 deletions(-)
> ---
> base-commit: 1df6c90cce2d90ca54e18b498e7d8928d07ee0dd
> change-id: 20250127-dts-qcom-dsi-phy-clocks-79c6968df235
> 
> Best regards,

Thanks !
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

