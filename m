Return-Path: <linux-arm-msm+bounces-24456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772591A69A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 14:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC14D1F271CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 12:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4B515EFB4;
	Thu, 27 Jun 2024 12:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SMu51P7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC01156F42
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719491585; cv=none; b=BqqMlNdyOPQxx02+yadCQz6FGNX1u93IvxAIXPFJWsBqx1UFzovPjnuGvXeRzueIct3GoNLCTypxKU7ogYAngwc1ZXoVjNFx6Lch46x81sE6pPGgX4CyhNOMVa8MF1L+Cp9bgoCMY6Md7x8Qsytn1d5QRx+V20WKrIewXvkxUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719491585; c=relaxed/simple;
	bh=HOQlVvB6ONgJGpF5LO61XvacpwRZojOWxOnMTQxDv5g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=cQX7VrzJLGcuvBkRDCU2v4bq870+jjsa7UxrHfZ+JPlgM4ZQYjUR+FMRghMNBpg0w9F8sBfuWtRssy50uKzGOAdEWDOKLzJpCCLuH+BxTNGfHr7Vmo0oLP3YUgwHYQR3iHdxvfp3+TaXfEeCprZpWIJKfGVnSOP0hGDsTdajmsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SMu51P7F; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so94872421fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 05:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719491581; x=1720096381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgL5RlzT052Xo6m0Ii8rB0nB/3yeo2P8PyN4dZnkXV0=;
        b=SMu51P7FfHFIFr6xRoEuBplNlXdTaPD9Q7DgodoU1doW/iBuki+NKmyUD8titlgvsK
         uA4I9yYhA8ZAJ6kZfS9aqhUgvS742GCTiZWntACW00A5hIVMYTgTOZ8fcR3Ek1KrjajF
         xSCIfpcwOEYFP3AIm4CRLqP1kG8A9fBaMni+XfZo8V/gguZH2S0vcgLufX2Gt5fzKKk6
         iXrnE7FhT4u9c7caT3F0OLVuBa1KohUM9i2ZECECDXNYruD4uuWGBFHgYLqRIZ3WgwMw
         qE+BvHvgW+Y1ArzvUTHfX6cMUGYt3o3eNIiYaLpU3729B9trEBM/NjO5M8pbjvOZ3wu0
         JaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719491581; x=1720096381;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bgL5RlzT052Xo6m0Ii8rB0nB/3yeo2P8PyN4dZnkXV0=;
        b=K3B/scT6g4tIO4b0/X12gGfRGRxPO5mBE4A7M2O+xeJY+xhEhxyAOlnArRhsH8NOhV
         Niz2jLi9JmV1PTqa6gcwVzcbgzoSenkonFxoSSjUJ86kXTisyB+R+7a7nczT7LWx+7aN
         4kMUFXXlFJ1dd0l0hCW6PFx37NW0j++HEj41LClx5kYSMRAWJbhUZCPFIqtYm0w0Z6NF
         BQMv8Wwth/dd8nK7g/7I3n8C92NdLs/Q7GCMZWzrDmamXFC32WVVIhd8PYAucZv7XchZ
         K4uRr37/4xBOd4O0bKw1YieG2GMMRqfmnkfH/vkV/i0O4KVxV5wTOWA+iAhMUKceo3R6
         5qTg==
X-Forwarded-Encrypted: i=1; AJvYcCWbyI2/d5ZEF7o06HcH1Yfdh6VZTp2lB1+Xdq9cVgRP73E4/rIrGxN8agJ8wxB79LqRR1s8xHoWC8sAWLJRxv0jbua6+NPhCQQzQ1hYig==
X-Gm-Message-State: AOJu0Yzwb4rGX8znyFH/n2QCuygrLpMm2FYbkJXhLrtxs9i0SKVZ3DzS
	CVQVDrWcJAnBj5FTCx4asmxJZi3sjW7/FJ7JCgPw79+IKFVJfgQriW9qrl9YNXs=
X-Google-Smtp-Source: AGHT+IF4pp20DjWohnq1wdqVv5cvhH5Eu1hShIg/CqHNa2hXHfSeWtjmXq7F9YQnMjBuDA/BbSnkYQ==
X-Received: by 2002:a2e:890d:0:b0:2eb:e258:717f with SMTP id 38308e7fff4ca-2ec5b2f0400mr82649941fa.42.1719491580730;
        Thu, 27 Jun 2024 05:33:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a? ([2a01:e0a:982:cbb0:feeb:faed:66fa:9e6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c82463d4sm64911665e9.10.2024.06.27.05.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 05:33:00 -0700 (PDT)
Message-ID: <acf50dcb-fbb4-4ed1-8fb1-ef0b4c78916b@linaro.org>
Date: Thu, 27 Jun 2024 14:32:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550-qrd: add port mapping to
 speakers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240627122015.30945-1-krzysztof.kozlowski@linaro.org>
 <20240627122015.30945-3-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240627122015.30945-3-krzysztof.kozlowski@linaro.org>
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
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index d27820fb5fc0..de40cb623c8c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -935,6 +935,7 @@ north_spkr: speaker@0,0 {
>   		sound-name-prefix = "SpkrLeft";
>   		vdd-1p8-supply = <&vreg_l15b_1p8>;
>   		vdd-io-supply = <&vreg_l3g_1p2>;
> +		qcom,port-mapping = <1 2 3 7 10 13>;
>   	};
>   
>   	/* WSA8845, Speaker South */
> @@ -948,6 +949,7 @@ south_spkr: speaker@0,1 {
>   		sound-name-prefix = "SpkrRight";
>   		vdd-1p8-supply = <&vreg_l15b_1p8>;
>   		vdd-io-supply = <&vreg_l3g_1p2>;
> +		qcom,port-mapping = <4 5 6 7 11 13>;
>   	};
>   };
>   

At some point I got the exact same change, but I guess I was missing the WSA macro register
shift so this did nothing...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

