Return-Path: <linux-arm-msm+bounces-49-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 514A77E38F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 11:22:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5872B20C0F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 10:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD82B1401A;
	Tue,  7 Nov 2023 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PiRDMvxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D4514007
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 10:22:34 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB43CF7
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 02:22:32 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32df66c691dso3101708f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699352551; x=1699957351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEV9oX9UBQAViKbcIQzqZTUe4k+rpi0cksLLzh9Xx4Y=;
        b=PiRDMvxiPOPgW5FbvP/mCiHK29Jbs/2Pi5to/aIQgGck2ZeVY0Uih4QHy1+Mj9FIQ8
         brCyL7qzw7oFeyCvqFneYJ/LzPhkNBfx/TC63BQ5r5505GUM9E7vtPeMF9obV7602uXE
         bV+xgVdYB/u32ND79no9Axcuoehq9Fsi1rKNR2O/sqtMxWgWOuVKQYHMDL0Wad1x9ecr
         WC2sN+5pFWP9fQAAPLilf0OjKBxp8uRtVxDEeGWF7tjGOMCR0+kO07pmtFcTsL2XHIud
         lSuIFS57g3cHvWsHvlTLJoKGU+xIkxV6WaKL7Rcw9mHNtBZnAEVBM6SxgZVm2acsZ2HC
         +nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699352551; x=1699957351;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEV9oX9UBQAViKbcIQzqZTUe4k+rpi0cksLLzh9Xx4Y=;
        b=EVy98ezTQ6QRF4RbCqpnXzVRPpqm4HEkWSxqpKXbUcSfuMYRWbcbPdjVyabye8vQj5
         jt/cSUg8k37FK+ZCMKt3hEqFJkYLpBN71GG44+mh3n3oYM0PeJCBbhBDKeUy0ISlzT7g
         tlMiiRtSCvaW78o55uFGUBhpjY6A76dLY77NnU/3R6IfAn/vILWaC/2B7u3ixUYhWFnY
         MzODI9FN0JSOg5/i+9yCfyT0TOWIruPwH0R2Tt/z3xtOTiJrAoWU07M5AyB8rnIQMP3X
         himepuEYjH4BGuRyJOFNsqsuN4aG2jkEHEWoakm7jLDz3FHJBw+yqOrTy5ERonPakMeR
         U9YQ==
X-Gm-Message-State: AOJu0YzL8F87A/eP+uxA1PgzmJuevZIRTujllGj0kzF0ODFQcLwQcFlp
	RIQpkYTEs5bIM0irk/qpOII6KA==
X-Google-Smtp-Source: AGHT+IELd/ZOsTX3cWFt/YYZKl1XTdUsXNBM7hh26LaWnlPiANCDuLxk1kAIx1GhFvl3SEkhQYcuPA==
X-Received: by 2002:a05:6000:1ac7:b0:32d:8e54:29f7 with SMTP id i7-20020a0560001ac700b0032d8e5429f7mr26220648wry.64.1699352551027;
        Tue, 07 Nov 2023 02:22:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2a5d:8c92:1477:cee7? ([2a01:e0a:982:cbb0:2a5d:8c92:1477:cee7])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4406000000b003196b1bb528sm1924781wrq.64.2023.11.07.02.22.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:22:30 -0800 (PST)
Message-ID: <bd70fb6f-e84d-4abe-9930-5dbc687cbb80@linaro.org>
Date: Tue, 7 Nov 2023 11:22:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: correct Soundwire node
 name
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231107102111.16465-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231107102111.16465-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2023 11:21, Krzysztof Kozlowski wrote:
> Soundwire Devicetree bindings expect the Soundwire controller device
> node to be named just "soundwire":
> 
>    sc8280xp-lenovo-thinkpad-x13s.dtb: soundwire-controller@3210000: $nodename:0: 'soundwire-controller@3210000' does not match '^soundwire(@.*)?$'
> 
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index e5bc9c51ceff..3af3625dd5e6 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -2730,7 +2730,7 @@ rxmacro: rxmacro@3200000 {
>   			status = "disabled";
>   		};
>   
> -		swr1: soundwire-controller@3210000 {
> +		swr1: soundwire@3210000 {
>   			compatible = "qcom,soundwire-v1.6.0";
>   			reg = <0 0x03210000 0 0x2000>;
>   			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> @@ -2806,7 +2806,7 @@ wsamacro: codec@3240000 {
>   			status = "disabled";
>   		};
>   
> -		swr0: soundwire-controller@3250000 {
> +		swr0: soundwire@3250000 {
>   			reg = <0 0x03250000 0 0x2000>;
>   			compatible = "qcom,soundwire-v1.6.0";
>   			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> @@ -2843,7 +2843,7 @@ lpass_audiocc: clock-controller@32a9000 {
>   			#reset-cells = <1>;
>   		};
>   
> -		swr2: soundwire-controller@3330000 {
> +		swr2: soundwire@3330000 {
>   			compatible = "qcom,soundwire-v1.6.0";
>   			reg = <0 0x03330000 0 0x2000>;
>   			interrupts = <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

