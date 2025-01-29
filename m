Return-Path: <linux-arm-msm+bounces-46516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF9A21F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D95CC1646C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B91149C69;
	Wed, 29 Jan 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sdsBj7MG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1338E1D934D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161573; cv=none; b=nTWggB5/Z8EeDH/FpaI/xNB/aabhArVMCXZdXpMcX61C2lk5eZyxcHLZiyLzjU1yHTUXePwkjLtaNMR9GdgfPbftBhLKl/i8RDUD8n31mvV1r/wx9Fe76muCae/vLa+C+13zhf8ncvaJh6Jfh2UCFBazoqJyNNyp3UpBfoq+b84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161573; c=relaxed/simple;
	bh=kPq7/hsS/8OKjb6gmJApMof5oROF6MQ0eTv3Pmrzeyw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WFbzFlFWZ+1i60P5bwYIN7lnt2wyrPEeqtwvrvPQ1YGtmsBAZqT6o/3D2Nec5Ltfs4iLYXLSr2fyKuygfW50dJ0mzEoCIzIyNZYBDg5M99ij7jya6Af2Q5I82z8qHJpuIdruseZEl9tGf0+8Ez13zIcREVCSP7TDfbfKvLY3YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sdsBj7MG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so70848275e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738161569; x=1738766369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I10NoHY+u/TvRxYfRQBnrpAvzZWfiMl3M75oWoE1K/c=;
        b=sdsBj7MGGb0isX8y9LjnsN/JOrv/UxbljHan+jNMJV39xVJS6JCH+evW1mVYHwROIq
         WaBzm/Hsz92v28nApvYoIUt/3FbkZTDuCIOQOxJ3KrXNHX6XWP325EnHjMBw9ATza6qS
         pUBcdYBej/fUSYXB8k4RpkXJDMZc2f6n1rTzGdrJr/EVRiHIIDcOHJnhDlO3uhwX2cpd
         VA5lXxr5zuAFOH6EttPDrYA8yshtaVS3Xy8feZ3KbDPscFLVg6jquHy9363a2wfeA2eG
         e9Ald/pBRjhVj8IiiHlE5I/X463OxkY2fAD+bRCPEEr7Km0J7pb2wyGY4Z9pmUxdHRFs
         Ojfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161569; x=1738766369;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I10NoHY+u/TvRxYfRQBnrpAvzZWfiMl3M75oWoE1K/c=;
        b=WjTG22nhdwfk17ItiU9OfnNh8hEKQIsHk3eoO2hitL8ON5JYJGi5XP/ziZf+7ypd7H
         kd5Zlvp2LfzsM0PzyyFahRBQwDcEfCKUKTRgDMWKC5ijgrMYgzVMHgCd/I7aGaXNZ/dj
         mPUoaNaYs9CdZ+X7O4tFyoX28thdtPwScVs3x+0IEbSf/5rbB674JSFTXAtTx6XPUdI3
         W4rHlaqBll3e/Tp9FpHBJQhVChXg/4lXruzWgrs5NhsXcZFN3kbfizWXUFWI94U1r2/N
         9yjvZIdsOxy+NtK9OATrQrPcJnzH/YnbG+wvaXOIXGmyVuv9GeZy7fsK/x018Ip3DaMM
         xUvA==
X-Gm-Message-State: AOJu0YxjWL47Aj2X/qehawZfDImPSLFJyzMyV6LpuhnVG0kVXaoP5UZv
	gajTYobUcyjgQGLRF3ImpCmatcvRKlA4/+P190ntdtpwcXWLMaqStXvJsnON//U=
X-Gm-Gg: ASbGncsasouLaJnNPNgUl+nX1Th5R4BV570+QQ380zfVqnsRaF9RbLz1PAVOW5LoaUJ
	U2qTmPtIHwlpzVVJDNF0ou6QBkEA/EXV2taUam2p6Z5tvmzagwZnkYgD8+5z+pGdKeCUjAcmJxA
	3Z9VvDra0avKlX9uIVL3LRTDkJil4x01UqUa6xPKyOgT+Z4QLanbPmXmIOzD7V9lBB22PxkQqXq
	MOzWzvg0agqSL5pp2BEjz7lEPo2p2+oYf1j+WCNIcAhJ7woOK+b3BLhomi/mVPBlkcPzwAT1CrV
	Nl+6VlVNFZqTMR/Lw7RiinihtaSx+fhHPbo4cCgb9LeDpiv5B0iipW0vF3Mg5MVg3Nqf
X-Google-Smtp-Source: AGHT+IGxUTn9q33mrdjmNDYY+yLLOmERoqF8GBK29zVWeuX1W4trQ+CIFQRiUJ3GApzGMTYWcdoJ5A==
X-Received: by 2002:a05:600c:83ce:b0:431:5632:448b with SMTP id 5b1f17b1804b1-438dc41d5c4mr24792125e9.25.1738161569123;
        Wed, 29 Jan 2025 06:39:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e? ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bad16sm17687999f8f.68.2025.01.29.06.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:39:28 -0800 (PST)
Message-ID: <16cdcbe6-510b-4a9a-9341-eb600f34e595@linaro.org>
Date: Wed, 29 Jan 2025 15:39:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: harmonize all unregulated
 thermal trip points
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250129-topic-sm8650-other-thermal-fixes-v1-1-2ceb36bdcd6e@linaro.org>
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
In-Reply-To: <20250129-topic-sm8650-other-thermal-fixes-v1-1-2ceb36bdcd6e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/01/2025 11:40, Neil Armstrong wrote:
> While the CPUs thermal is handled by the LMH, and GPU has a passive
> cooldowm via the HLOS DCVS, all the other thermal blocks only have
> hot and critical and no passive/active trip points.
> 
> Passive or active thermal management for those blocks should
> be either defined if somehow we can express those in DT or
> in the board definition if there's an active cooling device
> available.
> 
> Cleanup the trip points names and adjust the temperatures to
> the downstream reference implementation where the following
> trip points are defined:
> - "reset-mon" to 115C
> - "thermal-engine" to 125C
> where we can map them to hot and critical trip points.
> 
> In the case a passive or active cooling device would be
> available, the downstream reference implementation uses
> the 95C "tj" trip point, as we already use for the
> gpuss thermal blocks.

As I was told, the tsens MAX_THRESHOLD which leads to a system
monitor thermal shutdown is set at 120C, so I need to update this
patch accordingly.

Neil

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on:
> - https://lore.kernel.org/all/20250129-topic-sm8650-thermal-cpu-idle-v3-0-62ab1a64098d@linaro.org/
> ---
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 170 +++++++++++++++++------------------
>   1 file changed, 85 insertions(+), 85 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 3ec3a65ddd612e83cab6a1f574813aed2e99b4cf..0dd81aad8c5b6e710b31f489205444b154d898be 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -5843,14 +5843,14 @@ aoss0-thermal {
>   			thermal-sensors = <&tsens0 0>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				aoss0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				aoss0-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -5861,14 +5861,14 @@ cpuss0-thermal {
>   			thermal-sensors = <&tsens0 1>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				cpuss0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				cpuss0-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -5879,14 +5879,14 @@ cpuss1-thermal {
>   			thermal-sensors = <&tsens0 2>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				cpuss1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				cpuss1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -5897,14 +5897,14 @@ cpuss2-thermal {
>   			thermal-sensors = <&tsens0 3>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				cpuss2-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				cpuss2-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -5915,14 +5915,14 @@ cpuss3-thermal {
>   			thermal-sensors = <&tsens0 4>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				cpuss3-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				cpuss3-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6053,14 +6053,14 @@ aoss1-thermal {
>   			thermal-sensors = <&tsens1 0>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				aoss1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				aoss1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6133,14 +6133,14 @@ nsphvx0-thermal {
>   			thermal-sensors = <&tsens2 6>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphvx0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
> -				nsphvx1-critical {
> -					temperature = <110000>;
> +				nsphvx0-critical {
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6153,14 +6153,14 @@ nsphvx1-thermal {
>   			thermal-sensors = <&tsens2 7>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphvx1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				nsphvx1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6173,14 +6173,14 @@ nsphmx0-thermal {
>   			thermal-sensors = <&tsens2 8>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphmx0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				nsphmx0-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6193,14 +6193,14 @@ nsphmx1-thermal {
>   			thermal-sensors = <&tsens2 9>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphmx1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				nsphmx1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6213,14 +6213,14 @@ nsphmx2-thermal {
>   			thermal-sensors = <&tsens2 10>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphmx2-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				nsphmx2-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6233,14 +6233,14 @@ nsphmx3-thermal {
>   			thermal-sensors = <&tsens2 11>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				nsphmx3-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				nsphmx3-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6253,14 +6253,14 @@ video-thermal {
>   			thermal-sensors = <&tsens1 12>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				video-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				video-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6273,14 +6273,14 @@ ddr-thermal {
>   			thermal-sensors = <&tsens1 13>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				ddr-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				ddr-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6291,14 +6291,14 @@ camera0-thermal {
>   			thermal-sensors = <&tsens1 14>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				camera0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				camera0-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6309,14 +6309,14 @@ camera1-thermal {
>   			thermal-sensors = <&tsens1 15>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				camera1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				camera1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6327,14 +6327,14 @@ aoss2-thermal {
>   			thermal-sensors = <&tsens2 0>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				aoss2-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				aoss2-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6609,14 +6609,14 @@ modem0-thermal {
>   			thermal-sensors = <&tsens2 9>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				modem0-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				modem0-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6627,14 +6627,14 @@ modem1-thermal {
>   			thermal-sensors = <&tsens2 10>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				modem1-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				modem1-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6645,14 +6645,14 @@ modem2-thermal {
>   			thermal-sensors = <&tsens2 11>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				modem2-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				modem2-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> @@ -6663,14 +6663,14 @@ modem3-thermal {
>   			thermal-sensors = <&tsens2 12>;
>   
>   			trips {
> -				trip-point0 {
> -					temperature = <90000>;
> -					hysteresis = <2000>;
> +				modem3-hot {
> +					temperature = <115000>;
> +					hysteresis = <5000>;
>   					type = "hot";
>   				};
>   
>   				modem3-critical {
> -					temperature = <110000>;
> +					temperature = <125000>;
>   					hysteresis = <0>;
>   					type = "critical";
>   				};
> 
> ---
> base-commit: 2616c1ec96d966abb922248fe48b12dbd4297dfc
> change-id: 20250129-topic-sm8650-other-thermal-fixes-72a431ca91a5
> 
> Best regards,


