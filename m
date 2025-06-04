Return-Path: <linux-arm-msm+bounces-60187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73828ACD930
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 10:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A023A4F46
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 08:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDBC26A1B0;
	Wed,  4 Jun 2025 07:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXAO13eg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4118627FD60
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 07:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023988; cv=none; b=T7tD0BGYg6fE3Nw7r8xH+G5YF0oQ01AGKLQXZ6W3Sriq5V0W5TF5uQlihb2/nXgp+yyp9HabzsJ2e4PWnkT6jiuhdNg22yXs28DE7mSOoRK+JH/qZF5nrFsmOWLSEiN0V4gPZjdVHHiIE7PEk8IaIFxlA4CMeI6YhdHoZAVq2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023988; c=relaxed/simple;
	bh=TJ5otxNsHhue9kp4JXa7XfPZv5e97Dox5cS+GSYrlT8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ux+CBUU0aIgwtI7fhmi2FZCVxFWnr9n6HGi9j9LVDAVrCAjpr4C65djGQf8798bONwMsxljQ8QcQ1zUDAhZ9mamhUwkAnreNbJwikz12pl3tkNcXv3h8EE2Au3n8vDogeoRfwPQ/FagMxSwrhnaJDMCLy/5XWo7t1lenWvETalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXAO13eg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so458404f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749023983; x=1749628783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDUJHOjsk0PN4jC3b9Kzo/hTk1CO4cybzs8qYU3UL94=;
        b=mXAO13egYSdDdYCLlH3DzfjX/zrDbwDRxYdcXmq1CzIuDRguKcochKQGFZUEvHcutA
         +jemyVbGkBjQjZt/w2L9XtkTqk3WT5Oryt4eAx5bdbLjs6q5sggJvzt+dwwUKkYEJFYE
         7WaI7ewbyZAOucteFxqMKM7G9oz8U/Rfr08w7ZcIjEgnCo2wF6QTGJBthIUHYYGQnSVo
         S9HhnVp49i3teaS4wC6vQe4b+WNyhB9bFqdPAPzg08X9GUO8PuG9b3s3JSXi5Gaf/Z0L
         qH8dPU+fbBEDEd8l7lCh3saBu9c6K9Ai77ZP8BKT6jWrtdHTRm9lXeeHDY32v9rMKkaZ
         0Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023983; x=1749628783;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wDUJHOjsk0PN4jC3b9Kzo/hTk1CO4cybzs8qYU3UL94=;
        b=nE3Z2Ib8jB/t3IkHv9L4611FQCjDMdNU5ojjWIv1TFsE5A3RyTPlvCbdZGZH+Wjc9P
         8NMVkfEn7CFWZf5nTedhvmOOeRhE79g45HF2QDXOlbolv145ScVPmtWq+B8yed245I68
         FNOccM+09Q3WE8plrNcIY8kfHGT/AFMHi0V8jFV9NQV1rekaGcobB85VEji4bvA7ID8T
         EnBmXfRVGToEgsB2Q1vJureE9f9YkJ2d2ERiULgcRSlrVJTsICpXH7CCGrSw1g097I/a
         mI7NAaT8U3YRfPwF5txte/ZR0lCxHNmaX9tEOEWsQfsADAVQ3G1kYDTkO7S80QI+Tp7g
         biLA==
X-Gm-Message-State: AOJu0YyJK5tqZZcLGjUGIMdu8eHRNhs1kB6CWHcRaoxasHCeMsFStnKz
	wNiUKQ0gXeOb/N/B2j5/vCnBNDcWHcMSSASbjx4j+YCV8+aKJjZBGK1+GCOP1wTbq3U=
X-Gm-Gg: ASbGncu+RKR5OdAObZtrZPRACUVbxvKTTcQanKfPCKQ1sSQaDy2k75ds74ApiwuU3n+
	HtcvalCbC1Dv3A7eY+WSKGQtc2ZoZ42Nrtyxao4577HFiEMSW0ofqHeQLPLlsBDdBNFYuryy2tY
	cP9OZaTwyH/hkKr2hu/e/AXD6/XzAsaOhakGjuEUWK5FFKxJ5pBlDBilRNHHUyE2d+XRRX1jU3o
	H+ROPkCr25h5mOHXEoTD2p8+8727Eoo4rirVpZej8UCunTTqSrUuvK8TC71D4LTxEuWMOKWX/du
	pFE3cKu4trjzGwnYrKLNETkB9lpOYhVs9fp7K0vdW+GW//F46NwBll+KWMcCerYG1uk9l66UI+D
	TGe8lV9miwH6cojxURHbAB7CVdQ==
X-Google-Smtp-Source: AGHT+IEDZ3/g9hD5+uGWHuQy8gvoJHTUxKeNTODioWLsBtUDdVVJGD+TwYyLZLT16loC4wLG5RZzDQ==
X-Received: by 2002:a05:6000:2511:b0:3a5:1241:afde with SMTP id ffacd0b85a97d-3a51d512446mr1448546f8f.9.1749023983473;
        Wed, 04 Jun 2025 00:59:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8? ([2a01:e0a:3d9:2080:fef9:cf1c:18f:2ab8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f0097813sm21105303f8f.72.2025.06.04.00.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:59:43 -0700 (PDT)
Message-ID: <6b47f616-178c-44c9-a086-ee5dc4d1ae2c@linaro.org>
Date: Wed, 4 Jun 2025 09:59:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Correct the max voltage for
 vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, david.collins@oss.qualcomm.com,
 jishnu.prakash@oss.qualcomm.com
References: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
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
In-Reply-To: <20250604-sm8550-correct-vreg_l6n_3p3-voltage-v1-1-18cd01a69ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2025 08:27, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> logs:
> 
> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> 
> regulator summary:
> 
> regulator     use open bypass  opmode   voltage current  min     max
> ---------------------------------------------------------------------
> ..
> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> ..
> 
> Correct the max value to 3200000uV, so that it is aligned to voltages
> allowed by the regulator.
> 
> Also, correct the phandle name of 'vreg_l6n_3p3' to 'vreg_l6n_3p2',
> so it reflect this change in settings.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-hdk.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts         | 6 +++---
>   arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts | 6 +++---
>   4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> index 29bc1ddfc7b25f203c9f3b530610e45c44ae4fb2..fe46699804b3a8fb792edc06b58b961778cd8d70 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
> @@ -857,10 +857,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index 5648ab60ba4c4bfaf5baa289969898277ee57cef..1e95a2849146e3eeea9f68085ac504e32b63fdaf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -624,10 +624,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 3a6cb279130489168f8d20a6e27808647debdb41..5a33d7d7ac923c7c0bf6aeb51d0db728e65883ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -700,10 +700,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> index 7d29a57a2b540708fa88fb59e821406f400a3174..073040fbd7ba215169adbe3862d3e1f6d2c786e0 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
> @@ -485,10 +485,10 @@ vreg_l5n_1p8: ldo5 {
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> -		vreg_l6n_3p3: ldo6 {
> -			regulator-name = "vreg_l6n_3p3";
> +		vreg_l6n_3p2: ldo6 {
> +			regulator-name = "vreg_l6n_3p2";
>   			regulator-min-microvolt = <2800000>;
> -			regulator-max-microvolt = <3304000>;
> +			regulator-max-microvolt = <3200000>;
>   			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
> 
> ---
> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
> change-id: 20250603-sm8550-correct-vreg_l6n_3p3-voltage-cba298bc0294
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

