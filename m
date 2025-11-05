Return-Path: <linux-arm-msm+bounces-80435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70475C35033
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 11:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40C744E3D37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 10:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE972BCF54;
	Wed,  5 Nov 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEBhuqAf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dvcyn5Jo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960223183F
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 10:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336976; cv=none; b=KHb9Y17JBD57qhvNghFctVOjrA6yCkog8ZCG6zDWuobma4jbo31/dYNvpWdCk3I8MjvDAuCNTsnlJkXbSN9YahmXk67IPARyvtGPxrM7gigNliqg1d4M98SqG9yeoYlp9dXu9uwPYd0aL+7ITZKBZHszMSO6p3FFDNymhK7pElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336976; c=relaxed/simple;
	bh=HnAad4lzGBUYjbuxXOZB8V6WhYsxdOZ+G3HhtcB3SLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aur+dwbYFNMvHNaE44+zk+dQsLLpzmGdQIKhHBcHP1ctVY34sG6qDxQW+mJ3VKxqrJ09xjKkBME6tVDDmLYQx6AgaTJGkFFH9hfRK6vDX+Ar1PbkqzGFzH/eG3hUIeZgaZIyNUKwHwZlZdTTduLeZl0aMrqvQSoDgQ8DNluwNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEBhuqAf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dvcyn5Jo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57vF3M161210
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 10:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+7mJqRdv9CzahvJIT/1lcBXKam/uxssND9O44YePDk=; b=aEBhuqAf+0++nF9n
	gWx1b9GBd8VrZuGccax4DCt9VSiNft46om2guZ69f0bBxLOAdNStjSAnf9b2Cq6T
	8oVsHCkJzbkOgFVuuyU1FZ68iGxNbJBaZJKsfPhmRpxuRT5XveiXLkbBWg6lj4oz
	yJQwEHKWtunGFuYdzUAScE33qvU5jHUuMYev5ct5Eieh0Ex8qJ7GJMXBvphAPlx3
	MmfCqkr1ujywez0c7ZccmnOR5Qy8yLI5JXfxtHFey3NJZCMG+TvJQTpPxHS6obvZ
	zibXylKm6kCA1+kkerI6nJw/X/CINtGM1VVu/e+TN9A5HUbCl8Im+AVk6dcbzi2S
	8cIsQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt0bvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 10:02:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-890921c382eso200989185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 02:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762336973; x=1762941773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+7mJqRdv9CzahvJIT/1lcBXKam/uxssND9O44YePDk=;
        b=dvcyn5Joo+i7Fsue+K1VmO/OU99znNy67/JkgFOiqZm21MfcVhtR6iOtwoQ9meiD2A
         9Pidy6VAJB9ZRU5k0KbdcXaEQzeAPi/wChvdQDzL7nO5lgGc2CHzO8rNXUKczA6YG19+
         1vxFmvLh2iyw8tauIb1nViWXRyg3gD+WAxKuVA46zRSc8QEMy9FRRVhgv9XKsCZBod1y
         iY4SxJLMTYB7ZGXehjxI7pwRHoHsDSbFOR8sIhj4bHF2IjoeoRgE1H2c2TzbX5iA5kIc
         977iaUgyQ/zBE36iwTj4IxVRV/3Xn3Uh0YZ7DqWGa18RiYTsFn8lG7hFzwrIR9ecYRXZ
         dXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762336973; x=1762941773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+7mJqRdv9CzahvJIT/1lcBXKam/uxssND9O44YePDk=;
        b=jBC6+mn21VWBi0r76RghwWdevrthuIKMQ7YwPlr0f9ZU81SwZTU0yU5HUJq6Ofhorp
         MyDu13jT4uCw9A1Tq+PRze3gPOn2kD7ZWqJn1xeYVv+SeLIZjr01uWR1vbfet4fQO/E3
         z7NOb0cuygIJLmblI9KH6i9s95c7qL6WiFtctUcsi4OZBJCuPpXiIH9kvLl2Sk10LrXT
         2MZbEU/o1EuaQL/a/9O+np5s3l+QcERXGinVCnER5obtsMKy/IVumhLDfWzAA4u9598Z
         rATgLMx3wxW1qZOfooU9ztpbiqaeXQpo6wSRp+Smg3HGxvELgbwiqjLiArGBexEIe0kZ
         3Ufg==
X-Gm-Message-State: AOJu0YxBtB6DViMqLft6Dl0DuTVUyx5fA7aFT6pfhKhZaP144ZSVJmre
	zgQpRiO1PtJZoLqd4fVUqEiZkE5jvZc/VGAHEOG/uEws1JiKowcbRa+uQs+ZEvS81xskOwqLya3
	7K4E+HeJDuhOZ8Mdynu1oBwTt1lOrmm+wdqLfb4zWVA4m83jvjktQGaIkxW4jUBLnL2TL7JDP71
	Vb
X-Gm-Gg: ASbGncvaT4PCfPoLoYIPJYQ4uDYTYZtqQ+jymdVyI96OlW5+TBZLRliCFdYqEaQ0SZi
	ew7qTtwWUWYBmr065zTZOwzPc7kSF3zBoZb5erbZ7IL8ESqk6i9XQaQwu+J1JIvc/vCnARg+8oH
	nmWLIDDON94DvSaBbndykSFdJ+hKAESZ0r65JMoczx0Totj281a+aTMvrl5GlZ6E/LLQHsZs42Z
	zXxVqBEeSJso/dxACPHDqQN7E2pWonoW8nFcKVdTbNVbnfv4baTta1foOgVRrFYefceqT+20VYE
	A/VRIxtYiXdvbvRabZ4w6VcjJ2B1AYIY3EsfXNhibNe2aX88F7KRmoJIuaDv+uDgQkPa3IiVGFz
	VmmXeLz39al4bpvR4o28o0orhDjtRjuvdskNllP5Lm/OpTMrcj618Y+Jp
X-Received: by 2002:a05:620a:4490:b0:8b1:95e2:4827 with SMTP id af79cd13be357-8b2207ce66bmr248211985a.0.1762336973099;
        Wed, 05 Nov 2025 02:02:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmlPUmABC0KXNowYoFlfnhU2/PAbD4c7vgDL6QH3w4O1cjeIvVXsezcMv6JNbv1CkYPYMAVA==
X-Received: by 2002:a05:620a:4490:b0:8b1:95e2:4827 with SMTP id af79cd13be357-8b2207ce66bmr248208685a.0.1762336972351;
        Wed, 05 Nov 2025 02:02:52 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7240540d7csm437308766b.71.2025.11.05.02.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 02:02:51 -0800 (PST)
Message-ID: <03dce1ab-3ef4-4441-b363-ca0a58664e96@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 11:02:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add backlight support for eDP panel
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
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
 <4d0f1892-8aa6-4282-8c36-75f1e46cbae1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4d0f1892-8aa6-4282-8c36-75f1e46cbae1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA3MyBTYWx0ZWRfX3ypfZx4IIYc7
 MHqBNfv2dhPV+TLYHs0DQv2ttXti7RuMnrqnHRG7D8C/87BhS9bMwV+xya+RpIjemMj+cvgyFe6
 PchwJu34lvhCD80ywW4FnylP3zgTO/7lHIxoS8cnX6k/OObO6E7kr2yfC8cUvcqeStplCYnj4Xs
 TKT9+NW/cfNyhZEDWvS1IUOMBKryCveLyq4WW9mWCawmDhCUXrG299N+a30daKp0WfhGtmmSYuo
 cnv5LmpKDWLoEd/l4Ip1/Fj+RGezvSS6N6iCxYH/B2o5S+h7SciC+VdmS7Qg69E98dyWYW7JXKG
 hJN8Pt8SAqbZAIqECEBXEpmr1V1TP830RjAFrYuQl1BaEHou+fo2cAqwtQAcjQuPgHCqv5Xb1t5
 QBz9hUx3PcLpBXPwFFm89t0oVCgNKw==
X-Proofpoint-GUID: 9Ro_4TBpwH0RUQnLS17AxzpJg8q6avMc
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b20ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=eZhEbVVfMUXm6rNhgUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9Ro_4TBpwH0RUQnLS17AxzpJg8q6avMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050073

On 11/5/25 10:58 AM, Yongxing Mou wrote:
> 
> 
> On 10/30/2025 7:27 PM, Konrad Dybcio wrote:
>> On 10/30/25 12:07 PM, Yongxing Mou wrote:
>>>
>>>
>>> On 10/30/2025 5:41 PM, Konrad Dybcio wrote:
>>>> On 10/30/25 10:08 AM, Yongxing Mou wrote:
>>>>>
>>>>>
>>>>> On 10/28/2025 5:08 PM, Konrad Dybcio wrote:
>>>>>> On 10/28/25 8:04 AM, Yongxing Mou wrote:
>>>>>>> Previously, the eDP panel backlight was enabled via UEFI. Added backlight
>>>>>>> control node in kernel DTS due to some meta may not enable the backlight.
>>>>>>>
>>>>>>> Aligned with other x1e80100-based platforms: the PWM signal is controlled
>>>>>>> by PMK8550, and the backlight enable signal is handled by PMC8380.
>>>>>>>
>>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>>> ---
>>>>>>
>>>>>> The subject must say "hamoa-iot-evk:"
>>>>> Thanks and got it , will fix it in next version.>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 55 ++++++++++++++++++++++++++++++
>>>>>>>     1 file changed, 55 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>>> index 36dd6599402b4650b7f8ad2c0cd22212116a25fe..fda1b3a3c7673be74832c27849231cba4bc1f25f 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
>>>>>>> @@ -17,6 +17,16 @@ aliases {
>>>>>>>             serial1 = &uart14;
>>>>>>>         };
>>>>>>>     +    backlight: backlight {
>>>>>>> +        compatible = "pwm-backlight";
>>>>>>> +        pwms = <&pmk8550_pwm 0 5000000>;
>>>>>>
>>>>>> Try adjusting the backlight value.. you'll find some funny behavior
>>>>>> near the max level.. which reminds me I should send some fixes for
>>>>>> some laptop DTs
>>>>>>
>>>>>    I tried sliding the backlight between the maximum and minimum values. It seems that at a certain sliding speed, when approaching the maximum value, there is some brightness flickering. Is this the phenomenon you’re referring to?> [...]
>>>>
>>>> "maybe" - for me it was the brightness actually going down beyond ~80%
>>>>
>>>> The issue is that the PWM hardware can't really do a period that's
>>>> == 5000000 ns
>>>>
>>>> But it seems like this is no longer an issue since the driver now
>>>> rounds up to the closest supported value, see last couple commits
>>>> to drivers/leds/rgb/leds-qcom-lpg.c
>>>>
>>>> Konrad
>>> Oh,thanks for sharing that. I saw the phenomenon you mentioned. Previously, my baseline had already merged this patch series: https://lore.kernel.org/all/20250305-leds-qcom-lpg-fix-max-pwm-on-hi-res-v4-0-bfe124a53a9f@linaro.org/, so I didn’t observe the ‘brightness actually going down beyond ~80%.’and just very slight flickering. After I reverted patches, it indeed appeared.  So here i want to confirm,
>>> pwms = <&pmk8550_pwm 0 5000000>
>>> can i keep the value 5000000 ?
>>
>> I think so.. perhaps make sure the period is appropriate for
>> the backlight device at the other end since you mentioned it's
>> flickering
>>
>> Konrad
> Compared to ‘brightness actually going down beyond ~80%’, this is just a very slight flicker that only occurs when sliding the brightness bar at a specific speed.It won’t occur in most cases. Also tried another value pwms = <&pmk8550_pwm 0 4266537>, and it looks the same, so can we keep it at 5000000 here?

As I said, just put whatever the backlight that the PWM controller
outputs to expects.

Konrad

