Return-Path: <linux-arm-msm+bounces-24458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906591A69F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3151C241D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A3C15ECFA;
	Thu, 27 Jun 2024 12:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zerBwzW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83D15ECEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491606; cv=none; b=YW6DPszFPfuGyI+54fBmdoJqx7n3hlYm2K55slZhrSvjmZG3VqQjLq7OzvR2Hms+aYJ8VpVyHWKAbBNTaUimsyY3Ux0zY7oUswOrpb//ox+Fr0dOIUNQgNM79JVhpmAJTaQ+sDLQWsYE/qLmanWkYcMCOz48mI3mOeKFzX0nH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491606; c=relaxed/simple;
	bh=FKu7h2CrzfpqbFFVjCEemoKSuRxILyYxIMw5GwiiAlM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=rF30bi5FcncN3Gp7IlMG63hgB9DjVKwouwJUwoiRFZbfVEazj+rEFUq0YeGck/+0EZm5awdpCpHiVW2rw/bIr/0iktHag4H7vCn3XD9vCPoIcqSmnnatPxBeqJhVwjAxT9pOnSzhzUsIfIoHDKNIYh8OMV2AJyoKGe8ozguU8NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zerBwzW5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ed5ac077f5so24257111fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719491603; x=1720096403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+IgSdfM/vHkRT6iolawcPUETT8e7KP7OY6NFAw9j9A=;
        b=zerBwzW5DV8c8+AVR4FNT82QEwsSs74gh6fzQGok56IsjXIGyW7+T4wnEscjiRmQBM
         latC60BqEgbLJ/xXfvfqaXaCc+ZTfQ4GfZbWTiZ9BFnsWzLEBlTZObTa0uewFOXV2oJx
         a4qyPJHe0SI6FsqTSVUw6TL/3FXapw196vRMFkX7WIIhf/F4+sz9tcwzO+uI6y+H++qc
         659FuQKE9U6vhtcZsqEQaFQuuvMYvOAZ7OiiXz6PspUzWuqAnu8i5aC7Ym1g7+aby9uT
         7XVndbcC+wymL4sgnGMmX9IIUJtmavJSUbCE45YeABXmbwv2oKi/hzhYFnU+/O6HSGmc
         8NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719491603; x=1720096403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y+IgSdfM/vHkRT6iolawcPUETT8e7KP7OY6NFAw9j9A=;
        b=IfpjxRa7moENX5dNWOccNT3hMRiezhY5gS7JmzF+nLscKju9RGR9R5vepFXkjSQyEk
         RN7jIytI+9g+eE0kq+tJvUas/+bNm12JCNL742+vXRoZBuIvbUz56y7nllrBG0Z2pXRv
         B0kQ7ZpI575xyERMwdYY7KcMBh5HX0HvGh4wHFBNoykxXKnYyCxVamUl6AjUAweaBCKT
         hr/yOp5UqvEJKn5hoxUX0dhJVklfa/wdYV1IICi8urGhN3ihex4MwAwLuf3VOyTY3H7p
         qF8b2EIJgYQOofm/tTEf8tQ1u02BHS06kqEkfzPpdlKf9fBOT4jPV03Jh0ZhHGN0YlvW
         gPsw==
X-Forwarded-Encrypted: i=1; AJvYcCVcejp1cfG4fr/KTeJvdPcYZn3GbX52ppjqN7xuci83Gr7ePqmGXX2bf+UFJHUB1/SXcTfwBQ0SZh+KtwL1KM+r9BE4yXszxTNP3ZX6bA==
X-Gm-Message-State: AOJu0Yz9qfoo7iiwSctI2QbjzArp8HzmHAKM5rMUSRoPMJhUDiKK5IQ2
	jmQL19FfWR7xG2zaGfVyA5vlZcPBBWrfUAMiJeA6GhRvubwxQtI6quCWLtrT2QM=
X-Google-Smtp-Source: AGHT+IEdwXJj2/W9HISdtPqx06RJN14hIO49fhIBq/t8/7bILAAqutemgqzWHTBTL+9deo0EPQAP1Q==
X-Received: by 2002:a2e:9cd4:0:b0:2ec:520d:f1dd with SMTP id 38308e7fff4ca-2ec593be843mr79089181fa.3.1719491602963;
        Thu, 27 Jun 2024 05:33:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bd6bdesm24235455e9.48.2024.06.27.05.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 05:33:22 -0700 (PDT)
Message-ID: <2cce537f-cf6a-4b85-b7a7-91c14602bca4@linaro.org>
Date: Thu, 27 Jun 2024 14:33:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8550-hdk: add port mapping to
 speakers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 14:20, Krzysztof Kozlowski wrote:
> Add appropriate mappings of Soundwire ports of WSA8845 speaker.  This
> solves second (south) speaker sound distortions when playing audio.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Bindings:
> https://lore.kernel.org/all/20240626-port-map-v1-3-bd8987d2b332@linaro.org/
> 
> Can be applied independently, if bindings are fine.
> ---
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index e0dc03a97771..2e12219006c9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -1106,6 +1106,7 @@ north_spkr: speaker@0,0 {
>   
>   		#sound-dai-cells = <0>;
>   		sound-name-prefix = "SpkrLeft";
> +		qcom,port-mapping = <1 2 3 7 10 13>;
>   	};
>   
>   	/* WSA8845, Speaker South */
> @@ -1123,6 +1124,7 @@ south_spkr: speaker@0,1 {
>   
>   		#sound-dai-cells = <0>;
>   		sound-name-prefix = "SpkrRight";
> +		qcom,port-mapping = <4 5 6 7 11 13>;
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

