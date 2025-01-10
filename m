Return-Path: <linux-arm-msm+bounces-44721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5574A08CEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9B5F16A690
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7145D20C47C;
	Fri, 10 Jan 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GgTnQcrm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD620B21D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502598; cv=none; b=oJCusY5sPhXCyoGY8YVa1PF/fb6v2uk2Vmf0hECoMyBmOvq/YFraLybysYAkZBBxRN+DrQimtf1d/fWmS81DBvAK0twCZbcoU6MAirdA4ubS1K4c9bhBRZeirdln8BXVsXdOXmL+11iULVrzgNKUly1pn3gJDIt9W/xlY355Pxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502598; c=relaxed/simple;
	bh=ixzcY9bhc4itgtRPI04BKLdv7pMOIE5OJSgTAqqIUok=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qIE4S0YwEcnynsgWnYSkb1wZ1Lo4o98+jfTnZwrilXFNetQs5VhnakXDd4u5fS6xCj6SHNSU9epmONHlps85dOwhQBe+EFlP7TtIuoJAThruRepot8Qs17dkUm4xpFZYotlwBqz1dc7H6OLb9nxYhw9AJJi/hs3FlH5XM3SmNaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GgTnQcrm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436345cc17bso13949635e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736502592; x=1737107392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbDK5f06YhkS3rOvZsRq9rCVpQL4CuzP6RKmI1gTIEA=;
        b=GgTnQcrmwlsETYmhytG6eoPRkXcJr8UsDNZUM+rQtzRo8T0nL8Q6VBpaLYSqHmUKgT
         HOfRcDmxApe9unPiSBhJ5ib74oLDSpNv++wzqGL5vHEQzbJkd04nlzIFi49CkMmPw9KS
         +JBh6j8Vmc9WhXmywz8gm71tnm+JQpbs7cZYJL3KfXCwEiCn14rukPD6bdxzb231PKqc
         aox0enLq55rdDRZV2hDP9lpTZqkMra1GEmoT9dtiMxVTe/cuGNrD0FQHs5u+P7453wLf
         s8ydXcEBajzOKoMkL80Q9GVrCPYYUEC7fc+MOrqAEEvvk6XYs25OdMWO0+uA9A65C7xL
         ZJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502592; x=1737107392;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gbDK5f06YhkS3rOvZsRq9rCVpQL4CuzP6RKmI1gTIEA=;
        b=EfErW5Zx83PM8IAo5ofw0fFaFVbr290lWNv4hO+kZ/HeAPEbS7Bkbeo/mIjbnqzhtN
         jnC2AAddVs5P/BZzIclZJGJwqvP7r63jnGk9LCfuE8jtsH53g/5O9ytW43FAChyJ94V8
         Vst2Ts5bXZ+ZvjcxFI1gqhhuJ+1mgbiOIOIK4rdWObx26eReywS33GI3rBfigFnWazE2
         vdPxkqrVUvQJQdYeBxdGhdYk39FfZL+T6RS0rAC0NCu3u1LUhASgBRKTT+ZMRssbp/EM
         yFhptHO3KWXCkNqpPSy625z10MjkUPXd84lrWeMjsxW0YiEY15qBeUCIKoOADYjCHEzl
         N+/A==
X-Forwarded-Encrypted: i=1; AJvYcCXhbYvSlsTUxO8AYuYlaCCZziCMfBZJCggMw2c5xNZ0m7PMvyf65rkhRe4mJlUhQpBTu/1HNJJY2tRb9ODm@vger.kernel.org
X-Gm-Message-State: AOJu0YwyVQSmzeny1ZyHzUqf8V9K/8ThvNui0LN8XTwKIAcS7NquH838
	T/zY9oaAo4K5Vpi1II61xnzsjFqmw02zuhmV+AdMT7UZLJyeu3nYHnfunNqQJWs=
X-Gm-Gg: ASbGnctdythADeeyu0Lm+Wyw4DPgAbSDPAChumXVhrPaayC6SH2WrEyLPvl6kHNYPd5
	tyQBf++/BmbTFcM5DgkU3B5r5vURLmF7BG1iSWm9378sAcV8BgSHaJX/MWhMtDUqPbO1DJv3G/O
	fYGXE4auwxwlyHCGDe3JiQERtapgj7OjPvepFt+4efkM6ywQ6fYF6r4PkNNSXtKNZZnOh+CgM/Y
	6UvMBt/b/R7CZEx1rsoLLJ0E9EUk7mD+2rKeXyjMSwixzCgU7DbWc2NXOw2Cex5iw2GeptLwVty
	v8c9XSpu0mv+f1tKXy6HeOZ+13R9Z31Ftg==
X-Google-Smtp-Source: AGHT+IGL+mgVVa8hYlwA7WHndQ3P4195VhfTBlhrimtO8ioPAJhhNJqvncPecCh9TP7ivQaTGtdadw==
X-Received: by 2002:a05:600c:138e:b0:431:55c1:f440 with SMTP id 5b1f17b1804b1-436e26f5f3fmr101258995e9.30.1736502592554;
        Fri, 10 Jan 2025 01:49:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8? ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89df1sm80587885e9.27.2025.01.10.01.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 01:49:52 -0800 (PST)
Message-ID: <f105e797-4b78-470f-95b5-6d6b025dc576@linaro.org>
Date: Fri, 10 Jan 2025 10:49:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: add missing cache node for cpu1
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250109-topic-sm8650-cpu1-missing-cache-v1-1-0e85148a48a8@linaro.org>
 <549d15ae-34db-497c-89d7-c9b9c18d8681@oss.qualcomm.com>
 <99747e37-1288-4d70-a678-0a73bb4c3b3f@linaro.org>
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
In-Reply-To: <99747e37-1288-4d70-a678-0a73bb4c3b3f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/01/2025 10:44, Neil Armstrong wrote:
> On 09/01/2025 19:30, Konrad Dybcio wrote:
>> On 9.01.2025 4:24 PM, Neil Armstrong wrote:
>>> Add the missing l2-cache node for the cpu1
>>>
>>> Fixes: 20eb2057b3e4 ("arm64: dts: qcom: sm8650: change labels to lower-case")
>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>
>> subject: missing `sm8650:`
> 
> Damn
> 
>>
>>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..832f3a2c400e8348847bc24b27397e2a0dc08db8 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>> @@ -119,6 +119,13 @@ cpu1: cpu@100 {
>>>               qcom,freq-domain = <&cpufreq_hw 0>;
>>>               #cooling-cells = <2>;
>>> +
>>> +            l2_100: l2-cache {
>>> +                compatible = "cache";
>>> +                cache-level = <2>;
>>> +                cache-unified;
>>> +                next-level-cache = <&l3_0>;
>>> +            };
>>>           };
>>
>> You likely wanted to hook up this new node to CPU1 as well.
>>
>> Reading some Arm docs [1], it seems like with A520 specifically, both shared
>> and unique cache slices are permitted, depending on whether they're
>> implemented as single- or dual-core complexes (not to be confused with
>> multi-threading)
>>
>> [2] suggests CA720s always have their own cache pools
>>
>> In 8650's case, the slowest cluster has a shared L2 cache, whereas cores 2-7
>> have their own pools, so this patch is incorrect.
> 
> Damn you're right, so the cpu1 cache should be linked to the cpu0 cache somehow

Well, stupid me, it's already done... sorry for the noise and thx for your review

Neil

> 
> Thanks,
> Neil
> 
>>
>> Konrad
>>
>> [1] https://developer.arm.com/documentation/102517/0004/The-Cortex-A520--core/Cortex-A520--core-configuration-options
>> [2] https://developer.arm.com/documentation/102530/0001/L2-memory-system
> 


