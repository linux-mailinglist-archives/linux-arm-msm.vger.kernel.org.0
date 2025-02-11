Return-Path: <linux-arm-msm+bounces-47529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42EA306A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:07:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88CE3A5915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF71E1F12E3;
	Tue, 11 Feb 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nMZyb7jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A61D63FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739264833; cv=none; b=N2X8XdkTHAHk/PsLHCgX7Wh3AtcsKcEWKaQE5EyV28+VujxLza7DB2EGAz9G7xWF6sNvY8q1s+va/OKWNFBTSXF2I2vdTclYiUDU+LDnA2jwPsNPIyI+CAUtt66SvcBF2HjFtG10yknyPd3OMtfO2jyV/jEohoehwkSCEhzIb2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739264833; c=relaxed/simple;
	bh=y1f2KOqUZV55ZpZgy+bBqBRTPS30GRYUD0zVrY86E58=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tzoOQVkObibSYM5PrJUXMjSx1WiEybSjXdw9qaKkOjiseaOFQ9EcItB7FUSlLoMekpXG6wiSliWaaDydJD9VvpK/1oaRm8ejuNuupik0ahwY6EuI8EatSUYPcQKYY6OfaX0ibKbYchb8rwXlGsnPjp+W76x8XDnZlUPY90hUvOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nMZyb7jy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so36308165e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739264829; x=1739869629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEkw8mZ9lpxD+Y89tTOOotL+Ya0/so0WoVdJiViSyms=;
        b=nMZyb7jycqiZyCFx/awZHJf13C2WaZNnH72LzG1QtoRdJ8oouhVyRVpL/oC6vBJHUh
         Zbfbf4TaDzqsoTccl0oZpRxl4AWRNqDTYR3X7c+622ovoKJFh4uFpl3egk1jiQ+yF+09
         /Wq8l/Vs76a/2NWnqYGfNOccK6Jce8QRksEeCTWH2T3qZXkNHi5sq+RKRp257FlhOecj
         rhejUJLZVkZl4HBXd6Ay2gNkaMGQo30+PzqcRiLXcKM0URWZ4aBAeJJZy3rIYHugsdxJ
         9p3gVEfNFmTmibsTyLzZCXKey4pAIzNGuw3lEnXYgqmhzh4BfGwXmstPuZlX8ZchleMJ
         O2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739264829; x=1739869629;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fEkw8mZ9lpxD+Y89tTOOotL+Ya0/so0WoVdJiViSyms=;
        b=qsLXAe7oAG2p5Izr9LkPoLIHKCd78kAp06caGq1oL4ZNahC8fklupOagHzyCiqZCvV
         FRjuv4PB1UYy5RChm3RuPXK42kXn7lUvKt/U4TVAwqIJI5N0QhLAYv7hB5sR+R31kQ0r
         I2qHQDCEpDknpC+W0M62VoIGc+tultX62RxsDOdCBrBH5/n+DtWW9idwR8iibBDp6lPr
         IlOF6OuaUg2uxfo224cGHYKp3cPRMZsudGUgsHOlt+QPYeMF7EyRVUr2OEMATFZyNlgx
         yPjmgH7cV51eYUF/hMGe36eavihHRYql8eSXjMY7aPeMDZ1ET1B3yaF8525iW2kevf/x
         nFAA==
X-Gm-Message-State: AOJu0YwWPlC+i14qs6kiJgWYZBxsnQEp7ZM1VqKvHkuyADJA9zLG2mPy
	OXvfzTl4J/7tHEHfq5vR65Y+Itp5ckSdhJznC1aLDDFnCU4gOA3K4sXcYoQuwZg=
X-Gm-Gg: ASbGncuus4W5KYbpfdRHiI/YtrajXALn/giu67kDjXknlXWY1S+u+q8PO1g39JKITws
	0Eq7MwA3PuJSuZPzrx8GjOz4CPY7X0TwrszzKz2R0i0nJkMOZuDhlOhL1VNTLnjTaRAPnyJVpnW
	fN1c6Hmg1wvRk3rLph7AZ4OyZJVyK4gIrfBKVX8BfpgPAVULjmvoRCVLbb+DewaEb1lm0xSW/K0
	ysjZu6EvH7+usKACXnySCgT5AFDg/IrDIeHjCbua/Xznfo62jmXDQwU3AVTsHNsCUTNBCyaIp6o
	Texx6TDEq0phSyTrt5xNh/8TU3wi+wIAd/CREiWvlIpDnyboRCPh4xQVZl2Zmx6Vbkcr
X-Google-Smtp-Source: AGHT+IGHVpSlPQyU0cjYdq4UHMFuNEQDdRE6G+6jYmgVYfWj+t1f7CCzyuHhzxKg1Gx+7it/eNAXag==
X-Received: by 2002:a05:600c:1e11:b0:436:5fc9:309d with SMTP id 5b1f17b1804b1-439249b2bafmr161317725e9.30.1739264829255;
        Tue, 11 Feb 2025 01:07:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01? ([2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dce18d6f9sm10698324f8f.29.2025.02.11.01.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:07:08 -0800 (PST)
Message-ID: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Date: Tue, 11 Feb 2025 10:07:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
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
In-Reply-To: <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/02/2025 17:32, Konrad Dybcio wrote:
> On 10.02.2025 10:32 AM, Neil Armstrong wrote:
>> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
>> add the missing cpu-cfg path to fix the dtbs check error.
>>
>> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>>   
>>   			power-domains = <&dispcc MDSS_GDSC>;
>>   
>> -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
>> -			interconnect-names = "mdp0-mem";
>> +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
> 
> QCOM_ICC_TAG_ALWAYS
> 
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> 
> QCOM_ICC_TAG_ACTIVE_ONLY
> 
> w that

So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/

I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


