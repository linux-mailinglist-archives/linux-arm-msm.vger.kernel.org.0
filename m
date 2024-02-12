Return-Path: <linux-arm-msm+bounces-10713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F42A851B5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55275280C17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 17:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F7C3E474;
	Mon, 12 Feb 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUUQ17OD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929993D994
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707758823; cv=none; b=ZryBxmZ2wF79hduE7svWrOhx9+h6WtjD/v78xYRujDXaVvp/BXtPUL88W3GFl4XhbBbrMtjRHbOU5iS4m/DY4ZCliTgRBG0uGCwdFSjsiFdQ1dOn+0q4qgjaB3BhedlRvoQv5E+2vPVJKKWCL3k4TKgJZIjX1clMOvi/QG78/Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707758823; c=relaxed/simple;
	bh=eRpE+p2gDAqbio4o2IafAz/Ksuz9evtmD6c2xPfWbh8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=k4xY41CdQ5eMV401gL8dzfhhCK8RsXExCxccnoWwenCubeO0AQEdV+guKtH3XttEyBmEd+hOND0UbyNGk2Wx+RIUs9aAl44jWwqzlFKZygERUUG/l9g0oJwwgVJs/xy3wEGIAztZ5y3vlLR60GDr+ejrY13zuEE9ZDraFX7ovs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dUUQ17OD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-410d57a533dso8675085e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 09:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707758820; x=1708363620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR5//BC16l7qRMmQbswVo1VZ/yW9gK+/473czGYmDlU=;
        b=dUUQ17ODEu41teOkJXUT6VKFo13r6VclUD3MAsuR2bNHKBnx/elyIJzpaoPJjPzJkG
         xNZD5FWlgfslw9ZCkygaKNUHSCNmmxq5S2n8CT/l+U14WCWv35YEvazH9xxb1IPOHZJH
         +cP3eOWQ7Hz3emHbF5JWWjNFqutAN0e1RjXN9RFmHS3Ls26FHJN+dhjh4kroan/4r3X/
         CcWqirthuLY/AsXyuFCRMXSaumTRS3LSsj+8qL2H80ItgzOmd6yCjsg6TRBjSpyX64gU
         Do+513EiTy3tCW5H8JqlCjJf9lvwVktGxumqLgpyxE73jhNsPtK/qjAvFk1Y00F553yp
         RPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707758820; x=1708363620;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QR5//BC16l7qRMmQbswVo1VZ/yW9gK+/473czGYmDlU=;
        b=LF0Z9Ky8aJkZjiZKJ9O/UYspfqz87DJzWTjCFCQN3YUgt9XXgI2/a5OiPjpn5vPevz
         pOcVCZ1XXQA1qbh63yjmW1teebtDNHTuwKf94yb2lKAtU1fA1RiT8LuHBt+EHv6oolM5
         IIRt+3rIRxz3vkSEippoiP6zYFIGYwaWBUew7Ow1Z61UHkOfHLFpTQmElgKZN16Ug4dC
         tBQE4OPfFDRcDMt+4gJXcle4NQW3VfEajWC1Bj9bdK9R7nkuarW+zncxrejveUdUBekF
         qblAqy5W6sqv85X+OHLRaLbvklJBRrTQMlI81WQENLSN1P3OUVIfivOwGIFjiw8aty4a
         +l1g==
X-Forwarded-Encrypted: i=1; AJvYcCXMz1zdDMF4bGL/N8BBC6Z4McEGEvkBdYCsbJ5zNQbzQ1yBX0Y8va78lbONbvX/4yP4vetMw27+SSlKDyKulhfgtzjfyk6MxRe/JQjnHA==
X-Gm-Message-State: AOJu0YxXOC7ImOXakfR/VTH479OmRUv+6pQeaexXlBcP5LBiGNreTu+q
	2nh6dlTxPFaMHQJiFVbsYLB3VBLgJM7aUxCDabha4JFEzIQdJqnLpRtMj4lfvmo=
X-Google-Smtp-Source: AGHT+IEhKdGwsPL9JzP5ocUbKVoC5jxrrgHNWAJYlz/lX+/UNDcoC3W1InZ2+cgg4pdLm2FuXogSVQ==
X-Received: by 2002:a05:600c:470f:b0:410:bd9e:c6 with SMTP id v15-20020a05600c470f00b00410bd9e00c6mr4191906wmo.17.1707758819832;
        Mon, 12 Feb 2024 09:26:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdEFnZwbWXeilbQ90xohh2+o8hBxzM1nc/AGe0td3Kvo0nRI3/GALPV2sjJjSOjAZr0uPoetRPNOw+HLS43fY1q75BvZa7fbZuFxElYdAMrEMkgv83Yq7Vcio1Dj7DkVrpeommO53OfDF+z5MrNTkR909do0veclLEa1rfxLzsD73/06EAtGkU6UmP5cTpHRyMWxh6er6BAEAVMTD6bEYzVl3docc27wfFD00shMvLzbj88r0S+ExmX1GRxIvfVxE34yyzOHmnimDTgQT+sNixB0vVRpfHBXESmPAlHi6EPw==
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id k14-20020a056000004e00b0033afc81fc00sm7266685wrx.41.2024.02.12.09.26.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:26:59 -0800 (PST)
Message-ID: <741d48db-4950-43c8-a1a8-aba4b975204b@linaro.org>
Date: Mon, 12 Feb 2024 18:26:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/5] arm64: dts: sm8650: correct DMIC2 and DMIC3 pin
 config node names
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212172335.124845-1-krzysztof.kozlowski@linaro.org>
 <20240212172335.124845-4-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240212172335.124845-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2024 18:23, Krzysztof Kozlowski wrote:
> Correct the TLMM pin configuration and muxing node names used for DMIC2
> and DMIC3 (dmic01 -> dmic23).  This has no functional impact, but
> improves code readability and avoids any confusion when reading the DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 2df77123a8c7..27b3917c1327 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2919,7 +2919,7 @@ data-pins {
>   				};
>   			};
>   
> -			dmic02_default: dmic02-default-state {
> +			dmic23_default: dmic23-default-state {
>   				clk-pins {
>   					pins = "gpio8";
>   					function = "dmic2_clk";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

