Return-Path: <linux-arm-msm+bounces-44647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38218A07D99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 17:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B17B188CA5E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BA19221DAE;
	Thu,  9 Jan 2025 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UiVsYazX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3621B192
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736440346; cv=none; b=ZymWQN8iyWUhDhAe7HhVsdM87FWVnRwTPNJWCws7hAP8yUGVOgt4+PX+HqPFvpwWRKKsIVSGP7ErbKebRSf6VKwXVXfE9i5PLBmVL5csE1k/dK4MsfP8VjRnTI3KZMXEmklpciCA02aFRe0cXZmol32HwtvLHCAVrfhNey958h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736440346; c=relaxed/simple;
	bh=jpvqrcF4hGRAxo2viLIcicgd8PEE9sV/j/+ugYMxkww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYsGiSMVCV2cXlR3k2+J9O5x56vGslyIo76a+q6bRaUhnuCGdHsJN12HR4cHXArQlT33ClXU9+M+1zc1Xdc0AXjhdxZb5X00aQVmgvDVpav6sTpOhQ/AnFxuxpAeMoo+du5WB82y1JF0CDsbLUJuMl20Ex+qvifqSQk8IgCb9OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UiVsYazX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509FHvPf023737
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 16:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZIf3KDfTUTVomLYZRx8BxgSZSw37kPH65pTsVw4Nvw=; b=UiVsYazXkmQIFXiB
	fZsUUsyHc2C3bUWH6UG7xYtIBFj5/+594ouyTZ9AwtjHUmtpQAJ3e7wDmJMKs9+q
	GTkN/e+YxibZndC6xwwNNA8Jq245tg/Kervm/VfuP4iTCqyk/TpZjDs39TDd4rHf
	A6GSChgabG4tVKnM/ZSlbXlq+eFYVe/B4zClgcbVkEZekp6jxJa3bhg4qmcuciOJ
	UDQO0uCUt8K+wRuI6n8VBZmqCbCdcRg38ArsHF6+WbJipiOY8UuU9batKsG7dl9m
	Fnqo7HaqNgBw4hNX351DULqka4uujfgHxswH22wH4nkye+jIokRQnSX5i8lHDEhR
	HpXk7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442gyj05we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 16:32:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a437e5feso2807881cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 08:32:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736440342; x=1737045142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZIf3KDfTUTVomLYZRx8BxgSZSw37kPH65pTsVw4Nvw=;
        b=Wrven5yQYSYIhHV8imHaVuaXQDPcM3c9BpOLNwXzgJKrrtx27RHblghfqlW1grFjmi
         moecFSO9SennGuR2007VQdbjGpBqpaJ6qyAqP9uhJxAd6RVt7y7YNI3P7hbGbYXCDHHT
         nDPhTaZlNJn7eCaRPY6keCDC3tyJOVQi9f4+uPzHEcK/19YFOyNgP7LflVvTZZjjQKZZ
         I1LZX2Q72bklRvh5gtcyPH/xnEWIMyRW9Aeq6DfI4ZWXd/TBW20Rrkfx8r1j9OILGi6P
         JEoFtez02y6Ibhq5na70Q+VHJ3gHuYGRC8ksIASmKscC2+JhO1yrimcz7Q8+8sZlqgnr
         s0lg==
X-Forwarded-Encrypted: i=1; AJvYcCV/PWOXnfY9lyTIFU5zKP9Y0iN1Po1dE6EoApZJBU3by9cNZhyX0h/mOmJ2TK0We8Y2644yjWpTzF/FAD+l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6aDpn7MOF8aAPgmNWZS6IrF2L6mtp1/1c6XpAtJF4OkaURnz
	zc+QL0Ej+uFQ9OeZuDFeZXyJoCtoPo601D7NpVNIEykBNSB2tDQNWuBzgrnm2kqL/m5CC+mMMOo
	538Akei+r5JW7Gk4fNtEoQlfsGXEevCwk76E8EgnbLXmp4bTM7PpPNJAQDKYoHpQH
X-Gm-Gg: ASbGncvUWZi2htL2LcbFQ69EfxxS4z92xhm7xaSa27R+b+efTeF4fcUuDzvqsjw5BU0
	VhDxy73XI745JiyDr2hTBWppgynupovYpbsSBDwg7H1nsGYsOSYALYi6KQwBY2hf3XoAzxUWTHW
	2aesE96zqLvFr+0mP2+uuI9zu3pEjyuGZs4PxwVgSnZjrVq9MKtR4HFHq8QK9SkxTvNtoQtvG5j
	M4ukqwi6Hr0uqJkWKG5hMbdN/AC0BkxOUKwe3YRRiaI9CgJG7T43m0NZ6bmOQw78RLtCl16FlZz
	jUPDytwgqwI3jryCgqNjQK0QdjP++lRasno=
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr39248661cf.6.1736440341965;
        Thu, 09 Jan 2025 08:32:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESaLiH5Dn+ta1J2zWfqZW6hkxUZtVhHNn5etUsvoGD8pVb16ljFLPIw5/lLiL31svbqdd3Uw==
X-Received: by 2002:a05:622a:1a9a:b0:467:5fd2:9963 with SMTP id d75a77b69052e-46c71003a8bmr39248401cf.6.1736440341474;
        Thu, 09 Jan 2025 08:32:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b32sm85164866b.122.2025.01.09.08.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 08:32:20 -0800 (PST)
Message-ID: <49739b30-bc48-4c4c-b1e1-f70fd9a65144@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 17:32:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
 <Z1H1BHAeO-0832Ea@linaro.org>
 <6vfrlwir6sfommhn3met6wnjm76lnnxw4rdwzq75b7lzcy4jep@2cbcfvb3tvr2>
 <Z3-XoDgUgdS7DDvm@linaro.org>
 <0f9e456b-cd54-4496-a2d2-795aae744385@oss.qualcomm.com>
 <Z3_PPOwPNOPkZPkz@linaro.org>
 <4f0ca97e-ac6c-4b73-ab19-c91c6f3eb697@oss.qualcomm.com>
 <Z3_vMrFfdIne4yVl@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z3_vMrFfdIne4yVl@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DO4YyAVLgkXSrUgkKLJ-UuR8quFvnwQq
X-Proofpoint-ORIG-GUID: DO4YyAVLgkXSrUgkKLJ-UuR8quFvnwQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090132

On 9.01.2025 4:45 PM, Stephan Gerhold wrote:
> On Thu, Jan 09, 2025 at 03:00:01PM +0100, Konrad Dybcio wrote:
>> On 9.01.2025 2:29 PM, Stephan Gerhold wrote:
>>> On Thu, Jan 09, 2025 at 01:57:17PM +0100, Konrad Dybcio wrote:
>>>> On 9.01.2025 10:32 AM, Stephan Gerhold wrote:
>>>>> On Wed, Jan 08, 2025 at 05:07:47PM -0600, Bjorn Andersson wrote:
>>>>>> On Thu, Dec 05, 2024 at 07:46:28PM +0100, Stephan Gerhold wrote:
>>>>>>> On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
>>>>>>>> On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
>>>>>>>>> On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>>>> On 03/12/2024 18:44, Stephan Gerhold wrote:
>>>>>>>>>>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
>>>>>>>>>>>
>>>>>>>>>>>  - "MIC BIASn" enables an internal regulator to generate the output
>>>>>>>>>>>    with a configurable voltage (qcom,micbiasN-microvolt).
>>>>>>>>>>>
>>>>>>>>>>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
>>>>>>>>>>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
>>>>>>>>>>>    This is intended for low-power VA (voice activation) use cases.
>>>>>>>>>>>
>>>>>>>>>>> The audio-routing setup for the X1E80100 CRD currently specifies both
>>>>>>>>>>> as power supplies for the DMICs, but only one of them can be active
>>>>>>>>>>> at the same time. In practice, only the internal regulator is used
>>>>>>>>>>> with the current setup because the driver prefers it over pull-up mode.
>>>>>>>>>>>
>>>>>>>>>>> Make this more clear by dropping the redundant routes to the pull-up
>>>>>>>>>>> "VA MIC BIASn" supply. There is no functional difference except that we
>>>>>>>>>>> skip briefly switching to pull-up mode when shutting down the microphone.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
>>>>>>>>>>
>>>>>>>>>> If there is no functional difference and this is just redundant, then
>>>>>>>>>> there is nothing to fix, so drop the tag. But the point is that users
>>>>>>>>>> might want the low-power VA. You claim they don't want... sure, I am
>>>>>>>>>> fine with that but there is nothing to fix in such case.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> The fix here is that two mutually exclusive power supplies for the DMIC
>>>>>>>>> are specified in the device tree. You can only have one of them active
>>>>>>>>> at the same time. The Linux driver handles that gracefully, but the
>>>>>>>>> device tree is still wrong and IMO deserves a fixes tag.
>>>>>>>>>
>>>>>>>>> The functional difference is that we skip briefly switching to pull-up
>>>>>>>>> mode when shutting down the microphone. Users won't notice that, but
>>>>>>>>> it's not the intended behavior.
>>>>>>>>>
>>>>>>>>> I don't claim that users don't want to switch to the low-power pull-up
>>>>>>>>> mode (VA MIC BIASn). However, we would need a different mechanism to
>>>>>>>>> give them the option to switch at runtime. "audio-routing" just
>>>>>>>>> specifies static routes, so the current description does not allow
>>>>>>>>> switching between the two modes either.
>>>>>>>>
>>>>>>>> Is there no existing mechanism to alter this at runtime?
>>>>>>>>
>>>>>>>
>>>>>>> I don't think so... Since it's currently exposed as two separate DAPM
>>>>>>> supplies (instead of a mux or similar) you can only choose between one
>>>>>>> of them in the static routes specified by "audio-routing" in the DT.
>>>>>>>
>>>>>>> I tried looking at how downstream handles this, but this left me even
>>>>>>> more confused than I was before. :-) On CRD we currently have the
>>>>>>> following routes in DT:
>>>>>>>
>>>>>>> 	"VA DMIC0", "MIC BIAS3",
>>>>>>> 	"VA DMIC1", "MIC BIAS3",
>>>>>>> 	"VA DMIC2", "MIC BIAS1",
>>>>>>> 	"VA DMIC3", "MIC BIAS1",
>>>>>>> 	"VA DMIC0", "VA MIC BIAS3",
>>>>>>> 	"VA DMIC1", "VA MIC BIAS3",
>>>>>>> 	"VA DMIC2", "VA MIC BIAS1",
>>>>>>> 	"VA DMIC3", "VA MIC BIAS1",
>>>>>>>
>>>>>>> MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
>>>>>>> But if you look at e.g. SM8550 downstream they have:
>>>>>>>
>>>>>>> 	"TX DMIC0", "MIC BIAS3",
>>>>>>> 	"TX DMIC1", "MIC BIAS3",
>>>>>>> 	"TX DMIC2", "MIC BIAS1",
>>>>>>> 	"TX DMIC3", "MIC BIAS1",
>>>>>>> 	"VA DMIC0", "VA MIC BIAS3",
>>>>>>> 	"VA DMIC1", "VA MIC BIAS3",
>>>>>>> 	"VA DMIC2", "VA MIC BIAS1",
>>>>>>> 	"VA DMIC3", "VA MIC BIAS1";
>>>>>>>
>>>>>>> Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
>>>>>>> TX macro DMIC, and the low-power one for the VA macro DMIC. That would
>>>>>>> be fine.
>>>>>>>
>>>>>>> Now the question is: If we can use the DMIC through both the TX and the
>>>>>>> VA macro, and we're not doing voice activation, why are we using the VA
>>>>>>> macro in the first place?
>>>>>>>
>>>>>>> @Srini: Do you remember why?
>>>>>>>
>>>>>>
>>>>>> What's the verdict regarding this?
>>>>>>
>>>>>
>>>>> We started discussing this, but did not come to a conclusion yet if we
>>>>> should be recording from the DMICs using the TX macro instead of the VA
>>>>> macro.
>>>>>
>>>>> The patch I submitted is still valid though, independent of that
>>>>> question. Since we're not doing voice activation we want to have the
>>>>> "full quality" MIC BIAS supply, not the low-power one.
>>>>
>>>> Can/should we discuss a new sound API to make this toggleable?
>>>>
>>>> Do these microphones physically connect to muxable inputs, or does this
>>>> depend on board wiring?
>>>>
>>>
>>> The WCD938x codec has 4 MIC_BIAS output pins that are typically used as
>>> power supply for microphones. Inside the codec there is an option to
>>> drive these output pins in one of two modes:
>>>
>>>  1. Internal regulator to generate the output with a configurable
>>>     voltage (qcom,micbiasN-microvolt). Exposed as "MIC BIASn" supply in
>>>     the Linux driver.
>>>
>>>  2. "Pull-up mode" that bypasses the internal regulator and directly
>>>     outputs fixed 1.8V from the VDD_PX pin. Exposed as "VA MIC BIASn"
>>>     supply in the Linux driver.
>>>
>>> The board-specific part here is only which microphone is wired to which
>>> MIC BIAS pin (e.g. DMIC0 -> MIC BIAS3, DMIC2 -> MIC BIAS1 etc). 
>>>
>>> Both options will work if the microphone can operate at 1.8V. In that
>>> case, I think generally we want (1) for normal audio use cases and (2)
>>> for low-power use cases (like "voice activation").
>>>
>>> Apparently the same applies for the "macro" to use. TX macro should be
>>> used for normal audio, and VA macro only for low-power use cases. With
>>> that there is a clear mapping:
>>>
>>>  - TX macro DMICs -> full power "MIC BIAS" supply
>>>  - VA macro DMICs -> low-power "VA MIC BIAS" supply
>>>
>>> I don't see why someone would want to change this mapping, so I don't
>>> think it's worth making this user configurable.
>>>
>>> Given that we're currently using the VA macro for normal audio, we
>>> should describe VA macro DMICs -> full power "MIC BIAS" supply for now
>>> and ideally migrate to using the TX macro later.
>>
>> So, in short, if I understood you correctly, audio comes in through a
>> hardwired connection to a given macro, but the bias pins can be configured
>> to output the bias voltage through any of the macros.
>>
> 
> That's not entirely right. In our case here, the digital data from the
> DMIC goes directly to both the TX and VA macro. The power supply comes
> directly from the WCD983x codec. So the macro isn't involved in the bias
> voltage at all. Perhaps a picture will help:
> 
>                              +------+                         
>                         Data |      |  Power                  
>                           +--+ DMIC |<----------------+       
>                           |  |      |                 |       
>                           |  +------+                 |       
>     +---------------------+---+    +------------------+------+
>     | SoC  +----------+   |   |    | WCD983x       MIC_BIAS1 |
>     |      | TX Macro |<--+   |    |                  ^      |
>     |      +----------+   |   |    | +-----------+    |      |
>     |      +----------+   |   |    | | Regulator +----X--+   |
>     |      | VA Macro |<--+   |    | +-----------+       |   |
>     |      +----------+       |    |       ^          VDD_PX |
>     +-------------------------+    +-------+-----------------+
>                                            |             ^    
>                                            |             |    
> 
> X inside the WCD983x is where we can make the choice, if we want to use
> the internal regulator or output VDD_PX on MIC_BIAS1 directly. 
> 
> We can also choose to consume the microphone data either via the TX
> macro or the VA macro. IIRC there is no mux for this, the data just ends
> up in both at the same time.
> 
> Does that help explain it?

I think that's a "sadly, yes" ;)

Because that means we can switch the mics to e.g. the VA macro for
low power always-listening usecases at runtime (e.g. screen off), but we
may want to push it back to the RX macro for $reasons. And I'm assuming
there's probably $reasons2 to use the matching bias output from WCD..

Unless both $reasons are bogus, in which case we should probably stick
to keeping the bias and consuming macro paired to make the DT look sane

Konrad

