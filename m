Return-Path: <linux-arm-msm+bounces-80433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48EC3500C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290E1467852
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B3730BBBA;
	Wed,  5 Nov 2025 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lGt3Kh0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NU2UyahC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9E30AD00
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336718; cv=none; b=dmUXAhYBYByEb2GtWS6KEs+Iue8upkCi+NRtwrvI0m1ZPMukdhE/8fhZP5uw8mTUvVLyJ2s4o2qwvc89RqeLkiE7jw4VAXHzK1FK8K3SDyWvmnP7moV05X4k/xmRt7dn4/nOxqFSM/L6FdaqOzIdhNocm6ENWQv8j8P+5+um5uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336718; c=relaxed/simple;
	bh=vOhz5ndzH3AgkTvkxsMHHFtz4RzDalJMyAfA0L0yuWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s9P+A5238f9YJuRDWQcvNJ4hUO6Nz2wYbNViXcdVmXCJovnJ1B8blliaw+p5Xw+iJKa/wVV93/vRL37+kUADAmYsBakzQjDoa2UBd4U4Lu57BRbdha4NsoEcICm771uOI6vK07NZIHwJEw9I2AqtHSiI4DW0AUam5ki/AyMTJZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lGt3Kh0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NU2UyahC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A581c5K2904351
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	skwKvBPBxOR6Rt5VCpoChZ8BBo4UGnCPo15CcKo22xg=; b=lGt3Kh0PN8YlXW5Z
	yXpez3F2M5USIkHd6GRRArE2YULtHk31mQY6V19RXsg/nzOkIQmEYvREM62vw7U0
	C8Ol0+Be+t/uxsLcdohe/+gaNWHTcusczITdVc8n+7uvrE0BtWykEWs31BxgX5K8
	K3pV21ySegQGGwS7Q4K8yAw4HgQwFUIijuLUXJnogHH+1vrZ8xV+YQfESLL4i2wK
	Bzv2Kgo4cQAnje8gkDWW3s8Y9eYPHKbuXYjQ78lHdkZ0sniMeCC38LhhkBVCZ3ab
	2Pmp0pa8mrsf+P64Z0mGvB/t7QCk9veGTv53qc8KyAqwHhosVl6I+Cwfy2azVG4y
	CSFi3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7mbbtv78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:58:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8a54cd09b97so2792595185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762336715; x=1762941515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=skwKvBPBxOR6Rt5VCpoChZ8BBo4UGnCPo15CcKo22xg=;
        b=NU2UyahCkXLHCTWb1c8hjzHm/n1jtqrBAmCtIUPLP09+XldS95ZNU/J+3mKQ+ncEbs
         gcCLHQgxzZXYG06wZisrXrJDXuQBTVsA0Yj8poUuFHMJ3vT+E9+sPSXC39dmKt+ilP64
         PQBpp4LQ7CBvyKW3Z8JUSIajEBkmraRh52tVEUMix9DfhCGq9a6lImyDxmYy+I4CDOLe
         oCImcD9EjNJNdLM5RRos/ly+IWTbnPmavNF8QNe2YApWfdNov54vbPnQ4CCGS/4vovYP
         5uQA7v6hNYhANRPc+pFVYT5Lerd/tbM6mHZu5fv/oKcCWevSOXpPrr0ReGR90/2z1lWI
         dv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336715; x=1762941515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=skwKvBPBxOR6Rt5VCpoChZ8BBo4UGnCPo15CcKo22xg=;
        b=UwzkqVUW8LaYPYopHbS9SqnxbYR1ynVkck2OVVKLdxgdt7oD/hPMw8AK1az/tiBPFU
         jYJ6qAJ6L6TCCU6d9BwSk3hobuw51EKMkgWv+HnembNpQTJK7f6RmyPxTDwdb099Ros3
         2tktuCmrhK0EekKngl9McOxOVaGc2jQ0ouUvs1geCy+W/y8RaiBWlP9hAm16F74gRL+t
         1qn8HrqhYTPlsMWvbQTLPeBSE4RcUqaPeFFYLDDOncGm+c78HaxecYTogouoGZPqASrV
         3zTLwTN3MNhnaJO9HwQBGW2z8Z+gOhr1w2d/uyx412W/UX2frtivRXuA2N7EmXXE0PeK
         oP4w==
X-Gm-Message-State: AOJu0Yxcti9NFDZA5EgqXcNYbvMv8q+pCaFghAWbl56lozHrxdKK3Fzf
	7rAdESlLsj9bcScO+pG8UzTlKsID8JLMjHdUOhrc8QKZs62J/HBK5z2UZatSylrwz6/aCIVtljj
	DY5dI4YOyqEFTzXE2ecrPtZzs+9KjQ36HSU03yewAPnWaAX13tIezXIj5DgJm8DjwlCVe
X-Gm-Gg: ASbGncuwpOpgn8GhLN4H15e5acJGXL6b4bpL24+ffJFH3m2CIIsKuxQD+XQYaRKhDRd
	jh2y92Jc/DYrS5REM1gboXeeV07Vk79ne1UFb2iio5YXfu/iszZZvIfMJCMbQFpQleOxYBMFvbm
	4MlsxPJu7XrvozvExFCqRz1hflzBPBnDn3m1Z+B3h2MqpH4gECuwStxaWHtVmBtxaJXaUyCkfpq
	Wfy1PzfPX5TX+NpTv3SbOH5eHm7VQ/mbEqm3Ch5SDGv5takyTlp4h1pI3boMOco1v0KTL747NTh
	QkaP9ionhfUXnkmaCw29D3MoiuJGnkJqkWPxTdmcUy70l1MrDNvh6U8cb/f3UR9YjrRUtZtZXze
	ybhGbzFaRwRWP8qtYSF1bw+l6
X-Received: by 2002:a05:620a:2585:b0:8ab:8037:509c with SMTP id af79cd13be357-8b220ae81c4mr334534885a.12.1762336714627;
        Wed, 05 Nov 2025 01:58:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8l03hnzW8Hq2aiIwQ+wxlKKDIhW9it9JC9psm6aSHXGhR6kT0qk35yVC1xi3wmIamoJadyg==
X-Received: by 2002:a05:620a:2585:b0:8ab:8037:509c with SMTP id af79cd13be357-8b220ae81c4mr334533385a.12.1762336714113;
        Wed, 05 Nov 2025 01:58:34 -0800 (PST)
Received: from [10.64.68.119] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f51eed83sm370413685a.1.2025.11.05.01.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:58:33 -0800 (PST)
Message-ID: <4d0f1892-8aa6-4282-8c36-75f1e46cbae1@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 17:58:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251028-hamoa_dvt_backlight-v1-1-97ecb8d0ad01@oss.qualcomm.com>
 <b5d9d47b-7fb2-4ce4-9bc8-0d28395b78db@oss.qualcomm.com>
 <0cf2521b-8d05-42f0-aab8-35cd370e599e@oss.qualcomm.com>
 <8caa1cec-d881-4e77-8d77-be043f8d13d6@oss.qualcomm.com>
 <c33ae377-454e-4f7c-8af3-0738cf0cf701@oss.qualcomm.com>
 <d9d0947e-66a1-4ed0-b784-53c38bca784f@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <d9d0947e-66a1-4ed0-b784-53c38bca784f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YRylm4pHK5Ll_yvWkrbzq-iVMKplP8-d
X-Proofpoint-GUID: YRylm4pHK5Ll_yvWkrbzq-iVMKplP8-d
X-Authority-Analysis: v=2.4 cv=MK1tWcZl c=1 sm=1 tr=0 ts=690b1fcb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hMESfBkPYkNm0GZuxn0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3MyBTYWx0ZWRfX9CRwc3zgHkBr
 YZCXFVumZdhxVQq/r+TE98uMvZ99pDWEbErUnHJpkvTQnkTUyQvaeHh2auTs43/ySFUq0dzlTch
 ViJFk2Z6sHopxIp/kayQmpyQtl+dqSOOo5g+vqxjiqCf67SnHTFDQxVoSDVPLaUo6LckKEklpEi
 j9pDA+VgtMdygwGe4gevFc6vZoms3T+Mnz/gJrGry1a4mGLhCNH7GGqFvXJOy69XKmXXZvNoiz7
 zEx4kP5oSc3Ve/T9LS9+7r0Iu7ozUkVuv0yEl6qX74hZgbLfvvdllxZv/W1Oe9XkVBCs6UPrAJh
 NbO7C3gKww0u33f/DlUcyrlSslZdsrypWPZvM3tQ9gdFvmpht/ixfYPRkydPFVVtcpjzmtCsLBZ
 QTo2qLMElTgbvu3YjNTzc0F6RODpjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050073



On 10/30/2025 7:27 PM, Konrad Dybcio wrote:
> On 10/30/25 12:07 PM, Yongxing Mou wrote:
>>
>>
>> On 10/30/2025 5:41 PM, Konrad Dybcio wrote:
>>> On 10/30/25 10:08 AM, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 10/28/2025 5:08 PM, Konrad Dybcio wrote:
>>>>> On 10/28/25 8:04 AM, Yongxing Mou wrote:
>>>>>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>>>>>> control node in kernel DTS due to some meta may not enable the backlight.
>>>>>>
>>>>>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>>>>>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>>>>>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> The subject must say "hamoa-iot-evk:"
>>>> Thanks and got it , will fix it in next version.>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 55 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>> @@ -17,6 +17,16 @@ aliases {
>>>>>>             serial1 = &uart14;
>>>>>>         };
>>>>>>     +    backlight: backlight {
>>>>>> +        compatible = "pwm-backlight";
>>>>>> +        pwms = <&pmk8550_pwm 0 5000000>;
>>>>>
>>>>> Try adjusting the backlight value.. you'll find some funny behavior
>>>>> near the max level.. which reminds me I should send some fixes for
>>>>> some laptop DTs
>>>>>
>>>>    I tried sliding the backlight between the maximum and minimum values. It seems that at a certain sliding speed, when approaching the maximum value, there is some brightness flickering. Is this the phenomenon you’re referring to?> [...]
>>>
>>> "maybe" - for me it was the brightness actually going down beyond ~80%
>>>
>>> The issue is that the PWM hardware can't really do a period that's
>>> == 5000000 ns
>>>
>>> But it seems like this is no longer an issue since the driver now
>>> rounds up to the closest supported value, see last couple commits
>>> to drivers/leds/rgb/leds-qcom-lpg.c
>>>
>>> Konrad
>> Oh,thanks for sharing that. I saw the phenomenon you mentioned. Previously, my baseline had already merged this patch series: https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org/, so I didn’t observe the ‘brightness actually going down beyond ~80%.’and just very slight flickering. After I reverted patches, it indeed appeared.  So here i want to confirm,
>> pwms = <&pmk8550_pwm 0 5000000>
>> can i keep the value 5000000 ?
> 
> I think so.. perhaps make sure the period is appropriate for
> the backlight device at the other end since you mentioned it's
> flickering
> 
> Konrad
Compared to ‘brightness actually going down beyond ~80%’, this is just a 
very slight flicker that only occurs when sliding the brightness bar at 
a specific speed.It won’t occur in most cases. Also tried another value 
pwms = <&pmk8550_pwm 0 4266537>, and it looks the same, so can we keep 
it at 5000000 here?


