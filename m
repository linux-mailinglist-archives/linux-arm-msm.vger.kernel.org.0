Return-Path: <linux-arm-msm+bounces-2679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF57FEC39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 10:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D2428213C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 09:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD233A266;
	Thu, 30 Nov 2023 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSDbyNPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0036310E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 01:53:01 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b57fa7a85so2924905e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701337980; x=1701942780; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VX9OtQcXfdg8VOb659Uu3GVae5kVEXsq6e2PqcBRuP8=;
        b=OSDbyNPuxEbjuamGdmsxp/Nd9pNRqVtKBmnbsVRQ7Gk7EC9lAIeCp3rGTXyqX+wYGK
         1bkM4ZBRg6bIvB8WNh0P2fccAnxaek6Tae6ICUOAG3cNwhSBtTSrS8vl4gyohEOF4umR
         7GO3J7FZjlmga4qAMPjgCen4pWHEv/fKiq2dU02G+F5tBsha+qa1sQBdBPUTjwnobAVB
         GEKT/0O1ogu0xowPI6YK4voU2HtqXdEaJYeketugQx7GFhEmKmWsC/1bxU0un+nZSQsZ
         uSdtAsDMoIbyn9XfrDCiIRJZSOGmK4owU6YjTgUnYJmEaBMJ3xNouZkAuX9dOt9NwTHd
         oJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701337980; x=1701942780;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VX9OtQcXfdg8VOb659Uu3GVae5kVEXsq6e2PqcBRuP8=;
        b=eVHo6frEvhtOZGE/F578q0ws4M3cg+UKxN6GnvuNLVeuTg90xNOISkuxmTvqXsYbcS
         Sj/E18+IBBLJtjDmAMLByZN3GlFyveMMQiFmaLVWblvPcR5K5Bam9qxuhxMyoBVWY2qN
         1pw3bjSMIgb6owrtNyS+bLT9CsY4Deus0Ryyx0vhePm5KE72V+29ihuz4S4ZZQ7+Rpk6
         gxwMAgy2ad9ho/Yy8BJyknkKUqH+yVv2r9BTfEY2OGCn6vk4tPNoAU52pErXHvi9gLuM
         5O0X3CQMp5VsEGmv/IHSN9ps0XvU7t7puCr30Q3PkF6pH3d5y/breVBVieXNJ3eeWr5S
         bSDw==
X-Gm-Message-State: AOJu0YzVbVxckynt/Zl27SujvkcrR4BXxsdg5n1HIiZCdqw3GpAf/R/h
	HxF/DKjAw2LL4VeRpCYOKCB0gg==
X-Google-Smtp-Source: AGHT+IHHl2mg78BXo5WweteQ1vmiNkQtS/uB8Mw5r+/FfhpNISnN4kbE+gb6c/yEJdDyK5K6Rat8hg==
X-Received: by 2002:a05:600c:3550:b0:40b:4072:54de with SMTP id i16-20020a05600c355000b0040b407254demr12497610wmq.13.1701337980309;
        Thu, 30 Nov 2023 01:53:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:41c9:3acd:a6e2:5242? ([2a01:e0a:982:cbb0:41c9:3acd:a6e2:5242])
        by smtp.gmail.com with ESMTPSA id p36-20020a05600c1da400b0040b478da760sm1358964wms.48.2023.11.30.01.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 01:52:59 -0800 (PST)
Message-ID: <995fae78-0fe7-4fe3-a42b-2b9397f0d555@linaro.org>
Date: Thu, 30 Nov 2023 10:52:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: correct TX Soundwire clock
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231129140537.161720-1-krzysztof.kozlowski@linaro.org>
 <20231129140537.161720-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231129140537.161720-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2023 15:05, Krzysztof Kozlowski wrote:
> The TX Soundwire controller should take clock from TX macro codec, not
> VA macro codec clock, otherwise the clock stays disabled.  This looks
> like a copy-paste issue, because the SC8280xp code uses here correctly
> clock from TX macro.  The VA macro clock is already consumed by TX macro
> codec, thus it won't be disabled by this change.
> 
> Fixes: 61b006389bb7 ("arm64: dts: qcom: sm8550: add Soundwire controllers")
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 52e8f4c52426..2fd3faacf554 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -2199,7 +2199,7 @@ swr2: soundwire@6d30000 {
>   			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "core", "wakeup";
> -			clocks = <&lpass_vamacro>;
> +			clocks = <&lpass_txmacro>;
>   			clock-names = "iface";
>   			label = "TX";
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

