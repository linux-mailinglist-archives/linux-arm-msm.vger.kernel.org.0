Return-Path: <linux-arm-msm+bounces-44590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEBA07858
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E75957A28E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 14:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D229219A9B;
	Thu,  9 Jan 2025 14:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HlZC8PzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCBF290F
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431209; cv=none; b=BfMrnqF5npcEOLh0m0077DH2QvExpmMSGsT3W16zPwSUovMsABzyj4cXCFjCVUMQi9N/LZPD8uFgq49A0pzgb5lN4ViE+pFi+AHyYWl+05ftXbwYVJI/8eY3VTB/R1QDP22xUx4lKkZF317xrXAD5cM8BnD+ezxNHZqDmTEmmHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431209; c=relaxed/simple;
	bh=2WdcMabuVAjQgy9zf8p6BR8HP2wZEalq56QloyqgWEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SiTiCjp9OorRWNgttOc0mqNzabCurj6WNxJneMQ951b6Xwaf9rMbV5WpZWw27XjM6QOY9wQth+3kixqECNwb2QOSpwzq121tFn94wpIrhzVS+993pruTqyuTpcIvuyMAs7o6tpbFi0ej7cEm8wubRgkb+jLn8jV0e0cuGVx3oUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HlZC8PzI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509D7pWm010229
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jan 2025 14:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aB6lV9Fxcqe5tCkJY3CudmVwaSxhtt2f5fKrWhaIRXI=; b=HlZC8PzIXk02fd8b
	gYSbzo0sQVjGxJMSF4Ldw6G+a/zaxdnn1NEV7yNDqf/0aF7UvLE0yk8P6cI5NIvB
	om4laKoLXWCoQck1mZJ+OS7ydnuGQhx/n/1zfK1BUHGAo2Sh/gNnD/KnE54/Z/Np
	Jw0wAl1tmiXkTnMweWoIq9/RQlYBsGOqMkgvFg/gdAiySdUnsBwVhgTIG9WXVVke
	ZE+uZ675VsdkeEpaG5FZGK3OijfQZ1ggSC15bvpFYXCZ5TGSFB7Unfm9E5RLeUhA
	nlWd5kjQXdMIy37o/aHswhPI5sOhRBANQZ2UNx3xEg34ZlKTUKQWg579rGJGV2EV
	iPaHWA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442f2kr3s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 14:00:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467bb3eeb04so560741cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 06:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431206; x=1737036006;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aB6lV9Fxcqe5tCkJY3CudmVwaSxhtt2f5fKrWhaIRXI=;
        b=fLBMO0ocamZOUxzeA9ZOYoDIZ2LEhjHs6yn5ZDIi6jiSRYY5P2eXGBWtUbcfMQegCD
         TAbimvBkX/n3EX+7s9jA/ddw1yZV9CHzwTmtZSS9MAcG1LTRJs+rS7nUVBIIwK8h8T2m
         l2LyklB/fJQ9hu4hvRYrhVXmMrIM5PhOhg0xrTmiJ9CH3Y3VYTVJ7pl6nQigdirHrBfp
         wCq3lwwXLTyDxTQWEYjuBnM/6Gds8jxLBWVHjO5lL4PclUvC7vSQ9H1OWKmcQAZj/FZK
         8Xq8ky4C1uP3FVyRVj3Cd+NAsEabdqEWR5xwnYArKOU3RIAvULeSed72HPkJspUOqTpF
         11rg==
X-Forwarded-Encrypted: i=1; AJvYcCWhktIhmrFLT6pypWu+xgjHm1EBCH1v/qjFlipqmRcfp4r7y8Pgn6dXkiL0q5L0Z7wHfkc3LGPCAbwjknqA@vger.kernel.org
X-Gm-Message-State: AOJu0YwoAuuNeCDtBDmDpUHEGtKSfW57iDC38irdcUj6Q92bkeepfxHW
	uCH+BT7jmUmRi6zJy/4RcacpvXJj7Zp+WAtY8XItVJGCrdbLiO5SfyBH47Ar347h8FHOQpYwqE/
	v4yVa32JtuWkzsnl9GpCUDxzKs+wfM74oMNIw4a+5D2j+DiGAUk9bPM2YtahUSII/
X-Gm-Gg: ASbGncsqdClkuOvSsyTdZeUSChdHXn7i+KxT/m2C9SSSyv3zMnk6fckdl49/sCNN0l6
	PtlGdPX4qgdCMtQnOV9eSwBtYv5KlssjgkyeFsIM0hhYNBZh1KiCfnIqDZHsd9VgkUf8ojVHofw
	OxjYUkfcKVzpsaxFN/nboj6cTGVnflDPGRva6u6E67ck8z1hjqZ0uk+9q5vFi4qM13WYRYSnF5W
	5hEsfIHygjTOD5QJWTUdBU3be4JaVBWrZNtz3ZoxZzwlfr0C8CCFwZrePa03RKHEXT76oav38dE
	JYA0NvcsqmkPfHfbVq2mnfxjedCYSaBJnoU=
X-Received: by 2002:ac8:5886:0:b0:462:fb51:7801 with SMTP id d75a77b69052e-46c71040002mr36306001cf.8.1736431205597;
        Thu, 09 Jan 2025 06:00:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHz6oviDM2Ng5jXzCOeYi0PMdc5ozE3N+YdEkSzutKHJJLhQqLbTeg12VNsNVoTxwrdhcNYJA==
X-Received: by 2002:ac8:5886:0:b0:462:fb51:7801 with SMTP id d75a77b69052e-46c71040002mr36305631cf.8.1736431205087;
        Thu, 09 Jan 2025 06:00:05 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046d7e3sm611132a12.60.2025.01.09.06.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:00:03 -0800 (PST)
Message-ID: <4f0ca97e-ac6c-4b73-ab19-c91c6f3eb697@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:00:01 +0100
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
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
 <Z1H1BHAeO-0832Ea@linaro.org>
 <6vfrlwir6sfommhn3met6wnjm76lnnxw4rdwzq75b7lzcy4jep@2cbcfvb3tvr2>
 <Z3-XoDgUgdS7DDvm@linaro.org>
 <0f9e456b-cd54-4496-a2d2-795aae744385@oss.qualcomm.com>
 <Z3_PPOwPNOPkZPkz@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z3_PPOwPNOPkZPkz@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TtMMpVyIbpUGVM9csnfA6q8RchiqfueA
X-Proofpoint-ORIG-GUID: TtMMpVyIbpUGVM9csnfA6q8RchiqfueA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090111

On 9.01.2025 2:29 PM, Stephan Gerhold wrote:
> On Thu, Jan 09, 2025 at 01:57:17PM +0100, Konrad Dybcio wrote:
>> On 9.01.2025 10:32 AM, Stephan Gerhold wrote:
>>> On Wed, Jan 08, 2025 at 05:07:47PM -0600, Bjorn Andersson wrote:
>>>> On Thu, Dec 05, 2024 at 07:46:28PM +0100, Stephan Gerhold wrote:
>>>>> On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
>>>>>> On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
>>>>>>> On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
>>>>>>>> On 03/12/2024 18:44, Stephan Gerhold wrote:
>>>>>>>>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
>>>>>>>>>
>>>>>>>>>  - "MIC BIASn" enables an internal regulator to generate the output
>>>>>>>>>    with a configurable voltage (qcom,micbiasN-microvolt).
>>>>>>>>>
>>>>>>>>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
>>>>>>>>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
>>>>>>>>>    This is intended for low-power VA (voice activation) use cases.
>>>>>>>>>
>>>>>>>>> The audio-routing setup for the X1E80100 CRD currently specifies both
>>>>>>>>> as power supplies for the DMICs, but only one of them can be active
>>>>>>>>> at the same time. In practice, only the internal regulator is used
>>>>>>>>> with the current setup because the driver prefers it over pull-up mode.
>>>>>>>>>
>>>>>>>>> Make this more clear by dropping the redundant routes to the pull-up
>>>>>>>>> "VA MIC BIASn" supply. There is no functional difference except that we
>>>>>>>>> skip briefly switching to pull-up mode when shutting down the microphone.
>>>>>>>>>
>>>>>>>>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
>>>>>>>>
>>>>>>>> If there is no functional difference and this is just redundant, then
>>>>>>>> there is nothing to fix, so drop the tag. But the point is that users
>>>>>>>> might want the low-power VA. You claim they don't want... sure, I am
>>>>>>>> fine with that but there is nothing to fix in such case.
>>>>>>>>
>>>>>>>
>>>>>>> The fix here is that two mutually exclusive power supplies for the DMIC
>>>>>>> are specified in the device tree. You can only have one of them active
>>>>>>> at the same time. The Linux driver handles that gracefully, but the
>>>>>>> device tree is still wrong and IMO deserves a fixes tag.
>>>>>>>
>>>>>>> The functional difference is that we skip briefly switching to pull-up
>>>>>>> mode when shutting down the microphone. Users won't notice that, but
>>>>>>> it's not the intended behavior.
>>>>>>>
>>>>>>> I don't claim that users don't want to switch to the low-power pull-up
>>>>>>> mode (VA MIC BIASn). However, we would need a different mechanism to
>>>>>>> give them the option to switch at runtime. "audio-routing" just
>>>>>>> specifies static routes, so the current description does not allow
>>>>>>> switching between the two modes either.
>>>>>>
>>>>>> Is there no existing mechanism to alter this at runtime?
>>>>>>
>>>>>
>>>>> I don't think so... Since it's currently exposed as two separate DAPM
>>>>> supplies (instead of a mux or similar) you can only choose between one
>>>>> of them in the static routes specified by "audio-routing" in the DT.
>>>>>
>>>>> I tried looking at how downstream handles this, but this left me even
>>>>> more confused than I was before. :-) On CRD we currently have the
>>>>> following routes in DT:
>>>>>
>>>>> 	"VA DMIC0", "MIC BIAS3",
>>>>> 	"VA DMIC1", "MIC BIAS3",
>>>>> 	"VA DMIC2", "MIC BIAS1",
>>>>> 	"VA DMIC3", "MIC BIAS1",
>>>>> 	"VA DMIC0", "VA MIC BIAS3",
>>>>> 	"VA DMIC1", "VA MIC BIAS3",
>>>>> 	"VA DMIC2", "VA MIC BIAS1",
>>>>> 	"VA DMIC3", "VA MIC BIAS1",
>>>>>
>>>>> MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
>>>>> But if you look at e.g. SM8550 downstream they have:
>>>>>
>>>>> 	"TX DMIC0", "MIC BIAS3",
>>>>> 	"TX DMIC1", "MIC BIAS3",
>>>>> 	"TX DMIC2", "MIC BIAS1",
>>>>> 	"TX DMIC3", "MIC BIAS1",
>>>>> 	"VA DMIC0", "VA MIC BIAS3",
>>>>> 	"VA DMIC1", "VA MIC BIAS3",
>>>>> 	"VA DMIC2", "VA MIC BIAS1",
>>>>> 	"VA DMIC3", "VA MIC BIAS1";
>>>>>
>>>>> Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
>>>>> TX macro DMIC, and the low-power one for the VA macro DMIC. That would
>>>>> be fine.
>>>>>
>>>>> Now the question is: If we can use the DMIC through both the TX and the
>>>>> VA macro, and we're not doing voice activation, why are we using the VA
>>>>> macro in the first place?
>>>>>
>>>>> @Srini: Do you remember why?
>>>>>
>>>>
>>>> What's the verdict regarding this?
>>>>
>>>
>>> We started discussing this, but did not come to a conclusion yet if we
>>> should be recording from the DMICs using the TX macro instead of the VA
>>> macro.
>>>
>>> The patch I submitted is still valid though, independent of that
>>> question. Since we're not doing voice activation we want to have the
>>> "full quality" MIC BIAS supply, not the low-power one.
>>
>> Can/should we discuss a new sound API to make this toggleable?
>>
>> Do these microphones physically connect to muxable inputs, or does this
>> depend on board wiring?
>>
> 
> The WCD938x codec has 4 MIC_BIAS output pins that are typically used as
> power supply for microphones. Inside the codec there is an option to
> drive these output pins in one of two modes:
> 
>  1. Internal regulator to generate the output with a configurable
>     voltage (qcom,micbiasN-microvolt). Exposed as "MIC BIASn" supply in
>     the Linux driver.
> 
>  2. "Pull-up mode" that bypasses the internal regulator and directly
>     outputs fixed 1.8V from the VDD_PX pin. Exposed as "VA MIC BIASn"
>     supply in the Linux driver.
> 
> The board-specific part here is only which microphone is wired to which
> MIC BIAS pin (e.g. DMIC0 -> MIC BIAS3, DMIC2 -> MIC BIAS1 etc). 
> 
> Both options will work if the microphone can operate at 1.8V. In that
> case, I think generally we want (1) for normal audio use cases and (2)
> for low-power use cases (like "voice activation").
> 
> Apparently the same applies for the "macro" to use. TX macro should be
> used for normal audio, and VA macro only for low-power use cases. With
> that there is a clear mapping:
> 
>  - TX macro DMICs -> full power "MIC BIAS" supply
>  - VA macro DMICs -> low-power "VA MIC BIAS" supply
> 
> I don't see why someone would want to change this mapping, so I don't
> think it's worth making this user configurable.
> 
> Given that we're currently using the VA macro for normal audio, we
> should describe VA macro DMICs -> full power "MIC BIAS" supply for now
> and ideally migrate to using the TX macro later.

So, in short, if I understood you correctly, audio comes in through a
hardwired connection to a given macro, but the bias pins can be configured
to output the bias voltage through any of the macros.

In that case, I agree only keeping the one matching the macro the mics
are connected to is the solution here

Konrad

