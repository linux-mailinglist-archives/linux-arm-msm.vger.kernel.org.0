Return-Path: <linux-arm-msm+bounces-44874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7058DA0B4C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 11:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 411403A23F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 10:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5E722C33E;
	Mon, 13 Jan 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kix5QH1S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3131822AE78
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736765157; cv=none; b=ZNBcfMqijDrWjqvESYtqLHu9O+c8CXNVZt7owgCqSu39LNAAwCucLm+0eqFg+04r+JQwk/JKR7VDCrGmuPluvAOPeBwirBalolX0+EPvI0AoILLvEQFpL5uPne0dY//xgURWCr0yRXlwaO3w9RtQgsbGOUXNnSOP/QgbkPWDCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736765157; c=relaxed/simple;
	bh=th0Pa9/QADvWRhfo7Knx/NJ77U9f3xc17Pxzy7okQi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gDNY6aM+dS9pnCPjcLh7UOFSWUPiBgmveXxUIh8/DKe1kEX6tQeXH9XuaTkhieE9lVbVXcYZX38NEjAKaM+F3uYKEun2H26GQbnHPuFvU8YFIP4jqQWzuThotKLvK8nvObR8I/c3ddIYfdOLwvySVqygc0oGaXGckK42RADU5iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kix5QH1S; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385d7f19f20so2072784f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 02:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736765152; x=1737369952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1cPUFzwsNh1Qbx10EVjwJYJO/KgBZ7O1LEl7A2FwMo=;
        b=kix5QH1SghDuJ+XffY2ZvaT/zIgcFXeSAldEDPLHVJntZXCbd9ar6Z8fjnh+srhlT4
         81hozKg4StCvLErRA2Jr/uOcDwuUGN2b5qV7yDDu4T3OW4A6MIs4/1oRHhpuI505JzYB
         l2PtXuVDslO8/bRwRNpVtzvrSaxXUXRaD/zQDrAA45rWiql9eaGTr2J9dnO1qqd2lK1z
         gXHR8HP7o/YcKIDluVaVWErbffHR1i2GY68pUNiwMVK+1SCrPdw0F/BNQwUYWHMte4kp
         Zv4/5nn0xXVe5W2DbU0Rj1dsHC7fo6KyW4XpTGJY2WwwiYTTAiVdVxhfbm4JVs9X4WII
         U/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736765152; x=1737369952;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v1cPUFzwsNh1Qbx10EVjwJYJO/KgBZ7O1LEl7A2FwMo=;
        b=KuFmGBlkNhYCcUU3QHgcaYRgSLNMzngT+j1PV+T+8RpaH2csjpTsrIhSNsaaXuvO1m
         O+JFdiw8iZFxCSD5iOlCWtNUnmsmgtwmRFFyXmmV/9ke30yjPueQHL4RMvJcBbxgwhcW
         oiVwv5v94a3kEqlfTwdpH2Uhvxj35QHS7L7F1QP+JoDRMTd2xRT12M9lettLGK/vaGj6
         6jetsZn1hx8LttBy25hcaFSMsh2we3WAMQJws4uw9tqUVaAuTaqofn8j2hQp2kvWM28L
         DNARRWTE1cyh3MH++/r4nLMJ71c0C9NxR0hf/XxpocHm0gwH1xpuMQX9bzC8nq7siOZf
         fiQw==
X-Gm-Message-State: AOJu0Yx2O6iUi4XFOQLMJdLkNa60F3NKljYfOjazrKvH6MFgqbn3/Rey
	rSr4pQvnWF6sqQ7nnOwQ8QAlkUgcSm5w+fq5Cz6K5wXUvbyirVKxt8M20tZaNj8=
X-Gm-Gg: ASbGncs8YYSY9qxJ/dhdkTvbH/391eFsSvmj6OdbT/f7IHXBYgD+ULnf/4zMQYLaFCC
	QUPOInJbmQvrPfeQVm+ToonEeCln83wYTRVMlheygU2bsHB6EgkJF13vz9wMTSknTYZKbm/2iOd
	6MbV6r6DgYznhbdMgAgfZ+/oXWpj1ROrjCl/YhhNiLuqopMqpRYBdQPbLSH6HEREr57aNZH/Itt
	pn8j30Qnhs4FcOFu+lB9sKkE1Df1vWQ+hhLyoGLjAXtOg/PFGzHgS/omR+3QJkjSTRuyqZTUnqO
	8oQ0qyV4SJmBX+ULksSsZHYulDQ3fgg=
X-Google-Smtp-Source: AGHT+IGV9V9tYCbI3l9Vg38OHZMvUdoHz/iGVE/XhWxS7C+Vfxx6ggQkZ0YWwLsqwwW6crrVzpY1Ew==
X-Received: by 2002:adf:a41e:0:b0:385:ec9b:e442 with SMTP id ffacd0b85a97d-38a8733a391mr14490597f8f.40.1736765152407;
        Mon, 13 Jan 2025 02:45:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1062:7a9:f363:72f2? ([2a01:e0a:982:cbb0:1062:7a9:f363:72f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d0fasm12053707f8f.19.2025.01.13.02.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 02:45:51 -0800 (PST)
Message-ID: <c09192f4-30ae-4dd8-bc88-2aaf02088374@linaro.org>
Date: Mon, 13 Jan 2025 11:45:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
 <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
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
In-Reply-To: <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2025 11:28, Akhil P Oommen wrote:
> On 1/10/2025 4:06 PM, Neil Armstrong wrote:
>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>
>> Since the GMU does a better job at maintaining the GPUs temperature in an
>> acceptable range by taking in account more parameters like the die
>> characteristics or other internal sensors, it makes no sense to try
>> and reproduce a similar set of constraints with the Linux devfreq thermal
>> core.
> 
> Just FYI, this description is incorrect. SM8650's GMU doesn't do any
> sort of thermal management.

Ok, thx for confirming this, in our tests the temperature steadily stayed
at a max trip point when setting them higher. But perhaps it's a side effect
of other mitigations.

Are the new trip points still ok ? they are derived from the downstream DT.

Thanks,
Neil

> 
> -Akhil.
> 
>>
>> Instead, set higher temperatures in the GPU trip points corresponding to
>> the temperatures provided by Qualcomm in the dowstream source, which will
>> trigger the devfreq thermal core if the GMU cannot handle the temperature
>> surge, and try our best to avoid reaching the critical temperature trip
>> point which should trigger an inevitable thermal shutdown.
>>
>> Fixes: 497624ed5506 ("arm64: dts: qcom: sm8650: Throttle the GPU when overheating")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 48 ++++++++++++++++++------------------
>>   1 file changed, 24 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 95509ce2713d4fcc3dbe0c5cd5827312d5681af4..e9fcf05cb084b7979ecf0f4712fed332e9f4b07a 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -6173,19 +6173,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu0_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6206,19 +6206,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu1_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6239,19 +6239,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu2_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6272,19 +6272,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu3_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6305,19 +6305,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu4_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6338,19 +6338,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu5_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6371,19 +6371,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu6_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>> @@ -6404,19 +6404,19 @@ map0 {
>>   
>>   			trips {
>>   				gpu7_alert0: trip-point0 {
>> -					temperature = <85000>;
>> +					temperature = <95000>;
>>   					hysteresis = <1000>;
>>   					type = "passive";
>>   				};
>>   
>>   				trip-point1 {
>> -					temperature = <90000>;
>> +					temperature = <115000>;
>>   					hysteresis = <1000>;
>>   					type = "hot";
>>   				};
>>   
>>   				trip-point2 {
>> -					temperature = <110000>;
>> +					temperature = <125000>;
>>   					hysteresis = <1000>;
>>   					type = "critical";
>>   				};
>>
> 


