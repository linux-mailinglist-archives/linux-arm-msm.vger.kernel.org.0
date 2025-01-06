Return-Path: <linux-arm-msm+bounces-43980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A22A0215F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 10:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 684083A1D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B211D1D6193;
	Mon,  6 Jan 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K6qXxuzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089191D63CF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736154158; cv=none; b=r+G4iST55rVCTIzbb8rJrvvQT8o4g1VZij0cEV7xjsSmeH+YL/GbSS9pvGfvldd7VUriuMtRGmm25EQ8/dkAKAdptBN7hqcmcnSyAq1OtdeVm26BkkE9lOf7hENWi2cGfiamur3y9oZ5MJ89KPqSHKoduJmULj0w3d0mjSiN+yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736154158; c=relaxed/simple;
	bh=zN6cNtbN9aJCKQpwWmtwKrh6lox+xMy9t4TSIEnywJo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s8nVAC3ZFylj3F37lnNcMltxqYpka//1xlTlrb2YuyZJFcyTG+89HKWFAnwDjlPd+jSXw0maCzGvyJ98dx6Zoty+Aamc1nKJTRiPq/wDHieGGMnoOSOrkhfCKDvSUtPVI4oID8d8sXyspoP9YpEG8ZkYxv7TuSRbyCYHgZv7v3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K6qXxuzI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436a03197b2so48582095e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736154153; x=1736758953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1X/ZDkNCWW8X3sCK4HrBNWtfckvGJZik2rALRxWU+F0=;
        b=K6qXxuzII8FuFJK3c28IxkWGYAJ9/Lc+r0bFtt6Q77siw5VodE3JNY606isjBMsUMd
         b5P2Zkcxdf+WoSwEj8eYfJn1a9uMTrahOaKBcKddg6N6JZMxb3XuNpHFj0yvykfXJvzN
         PINI89wddoCKURCcGagy0ivFau0ph22wxTX4rRI1M9m9L4X+hbRJGPPmofAMRbw/gaQO
         rU9gMyhf8b1OGSoJEiYsJMzBNbo08l5IvKye2wBWa3NSwB1cG30V7/lK+1O1m4lu0vow
         2invE50BavUpnL8oDnttL1IDxVbt7QBCWj0ZZYFYjM8aud+E+z/0DDEhELpqxX+n0H/9
         8usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154153; x=1736758953;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1X/ZDkNCWW8X3sCK4HrBNWtfckvGJZik2rALRxWU+F0=;
        b=muxo6z4FHBErGKrMS8MOSf6+3mtd8Fhv4ucpUMJS5ZrMfhPyVpqu3nV/Hn0vgoWnzm
         NbLM2RPw7zqJCwvXE+3E6W0GiTsJu7vlO3NuxY6x5M3dJGHxSprzzIzVKjI+mR73EhNf
         EtniqsQdbnlezYApLhQKb4yyUpy0fLJP1hIm0vFKM/Dz4kJRhUtTpIwfnF4uxsKNJRrH
         eYjFooFaB4vwjCO4bor7bc7qs15FmqKRSCqt9p60EZ8m1tXYnsi5Wd/R6YZnuCf14zGK
         LMxgytuVAsUZLQeQslCNo1caNeRxMV7oku9lwY8kU3oE78QtiU/FFHZ/XQiK3X66ar8b
         N11Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjPCrXvWSEJikcncGq/UGBSFcnrGOTU5M9TfOTLwDsLmI3FlJCUywXgi0FMEH7stIDOrFPhir/buoqT0bk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3qqqii1eITgKRzp7cN4kTkAIra4ij09Kw8yuO/iqJ2VvMXO9
	nGAY+6DoNXOoIgj85eVoyNABcRMtcLKjWfBd42npS8eksWGJCn3h2s2TGwKvPHI=
X-Gm-Gg: ASbGncvOWPc/YDIzNgR0piXEY3+m63KUQDrwt2LAIFwjNZYILaL+/H5S+FrghpQzTte
	bglrbGkBgx6Klw2R+c2Qhxm/rtbvM6Np114nf3P/A0bTn5UCVnVIrMQcWZR7ww9gq71vv6Fs2K9
	o5Q1IlZb+pRh+SvvYyxPhh4Iw+TPwXHZyrEXWSyZRYHM2llPO1yFXngAQfyogFizwoe126Sc8zh
	72dSBBBbtfH8tExWAmirfCxRTF4yvhPf00qcdF6MD1e406xbH5Fipcfg7OZetMEy8B/MhZS+Cv6
	+SHyC0Ppke9IIpyHqVb/bcYMjWKz
X-Google-Smtp-Source: AGHT+IGVLNi4KxAR5zn3TLctoTzfFbKjgf2tASfSCZQgcBpDQBVMgKeI8WUrv/7QV21NMsnfImtXDQ==
X-Received: by 2002:a05:600c:3b24:b0:436:2923:d23a with SMTP id 5b1f17b1804b1-43668b7a683mr386777485e9.33.1736154153034;
        Mon, 06 Jan 2025 01:02:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm558552025e9.24.2025.01.06.01.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:02:32 -0800 (PST)
Message-ID: <a7c8e50c-0884-4315-ae00-9c5d35c2b258@linaro.org>
Date: Mon, 6 Jan 2025 10:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-topic-sm8650-thermal-cpu-idle-v1-0-faa1f011ecd9@linaro.org>
 <20250103-topic-sm8650-thermal-cpu-idle-v1-2-faa1f011ecd9@linaro.org>
 <CAF6AEGtVFo8BBUeg=UQDTCP=LLRHLc-V1roa=wHECpLm=Mh_gg@mail.gmail.com>
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
In-Reply-To: <CAF6AEGtVFo8BBUeg=UQDTCP=LLRHLc-V1roa=wHECpLm=Mh_gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/01/2025 21:00, Rob Clark wrote:
> On Fri, Jan 3, 2025 at 6:38 AM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>
>> Since the GMU does a better job at maintaining the GPUs temperature in an
>> acceptable range by taking in account more parameters like the die
>> characteristics or other internal sensors, it makes no sense to try
>> and reproduce a similar set of constraints with the Linux devfreq thermal
>> core.
>>
>> Instead, set higher temperatures in the GPU trip points corresponding to
>> the temperatures provided by Qualcomm in the dowstream source, which will
>> trigger the devfreq thermal core if the GMU cannot handle the temperature
>> surge, and try our best to avoid reaching the critical temperature trip
>> point which should trigger an inevitable thermal shutdown.
> 
> to we need something like this on other recent SoCs, like x1e?

Probably yes, but I don't have physical access to the platorm..

Neil

> 
> BR,
> -R
> 
>> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------------
>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 448374a32e07151e35727d92fab77356769aea8a..ddcb57886eb5eac2a70d28e6ad68fc6820b5dcf1 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -6507,19 +6507,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu0_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6540,19 +6540,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu1_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6573,19 +6573,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu2_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6606,19 +6606,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu3_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6639,19 +6639,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu4_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6672,19 +6672,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu5_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6705,19 +6705,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu6_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>> @@ -6738,19 +6738,19 @@ map0 {
>>
>>                          trips {
>>                                  gpu7_alert0: trip-point0 {
>> -                                       temperature = <85000>;
>> +                                       temperature = <95000>;
>>                                          hysteresis = <1000>;
>>                                          type = "passive";
>>                                  };
>>
>>                                  trip-point1 {
>> -                                       temperature = <90000>;
>> +                                       temperature = <115000>;
>>                                          hysteresis = <1000>;
>>                                          type = "hot";
>>                                  };
>>
>>                                  trip-point2 {
>> -                                       temperature = <110000>;
>> +                                       temperature = <125000>;
>>                                          hysteresis = <1000>;
>>                                          type = "critical";
>>                                  };
>>
>> --
>> 2.34.1
>>
>>


