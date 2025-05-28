Return-Path: <linux-arm-msm+bounces-59728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A741DAC6F07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 19:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A511883EFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9232E28BA8B;
	Wed, 28 May 2025 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVoCgbHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967528C851
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 17:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452608; cv=none; b=gUP7o5BNW5oaVnkf+nfcGNRwSCx4IRw+9+4bhqdKmsgPlnOxiLmv8RXV+RjTs/ZR8Ve8ojQw1QT91fsAbTBRsmXe9ivhtyNkfqdxfG7SUI9bXxmzfsBI9HJN5bKynkk40mzXKaNAS41JO+/hq32SoYdSkxhgzZa9mKafydk0fzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452608; c=relaxed/simple;
	bh=aL3+xlCaNJSD026jdhb5AxVZ23NA04y0Q8DxSMNwrhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M53flsZkduFaxG8z2gHjAKWqD2jtMD+rZVgw8OIHGbt29LiT+UtA5qnXPwJvcM0ZPuMDcRRVs78ZEsNuEkM3F+JBrPn92NAzk6AZ+lDKsSFbeGX6VEdgKYas1nFcr1T5zmP0dveC+p6jws/Cjz/IOsvODWs89OBGxYPMrSwPit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVoCgbHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCfCPB007169
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 17:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl3rxy3XyRO/W+KpEldHk5plTWWoNP6INHawG9aWMTc=; b=dVoCgbHji7KO6yES
	Xerfk1nZgXs/dLs+1fyNs6iReFjNzzVn9q36T7JxR1m+3PsGIy8A1prbaFKneImP
	DW8pzsVR6mSyDvoFqDkSl8L6GxCS1zThIYKIQrbId0MfqDUrrgayoyMRhFZv43fX
	U3IsLdk/NYeM/9gtZc29+0cGavLZ6FFY7f9ysM/OEIRaaaJq/YikYZTyqoeLI2Rb
	1yBm8f113XNclxNgeRSlCjxqTh2j+u9xPHrC4a3Oi8WRGXRlHiCYhK31Ps8XjUOR
	ABCCW6tw/roJDqoygFC89e+0381i6DJuVK2FQ1vYkhhqpYuXQuWp+N+OtiwopV01
	Poq7LQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549jxnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 17:16:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ad42d6bcso152722485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 10:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452603; x=1749057403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rl3rxy3XyRO/W+KpEldHk5plTWWoNP6INHawG9aWMTc=;
        b=b4+JwN55/XvDgCSa/P+1dZEKR+VblbAJ6n+4szLz/T6jUBui0KkNlkLUn6UOOho0Hg
         +78eoq/w9rq6a79IzRXjMH4WTR1GgdlmWnigtYKfSdS2OORurj0dqZfCMoFGT/DVQLS4
         UyXS4qO35Nq5oQQERD6ubE3Ed5MlFKRwdsgqmKCzTNq+iZWc8OJtY/4u3JtNqBhTXdvx
         ex4LPa5fwMjtufCZcHzRf/5u78ICLHU7Zww1WJ13z+BWJ1tUunHxeR5SWF/wHwv4Z89f
         +xIeINPogaWpP83abD/r5E/TxKL6IEFSa8VrrPTd/PXosSOB9vjyuvbqz4xYzGsFIUdt
         7U5w==
X-Forwarded-Encrypted: i=1; AJvYcCWJhPUOmxJwFz7OzsjoY5+bpxumWWwteIn+v12k77/GsdW/IB5hiA+1bg93l/K0qKCdvHqufVhyhuJJKlby@vger.kernel.org
X-Gm-Message-State: AOJu0YwN5Yl9I0lLQBfDNoQvJq5Ob41ig6szD2FIi8mS7HDLzaciGGq7
	LflVkEmDHY0spPlj7RMWbU6GPAJz7GxfXPKm9N6BvPUycYMSJvqjmXPjf4DSe5dwfnQjeSeGTZf
	tWJDZOBfBjncXNdw5QYjXlYchhPESDa73dnSf063E8sYS5nCnmd1I6OgHvcP3ViRe32ER
X-Gm-Gg: ASbGncvFNgyvGI7+edz7QwwC+CiHGVkqQOEmPpZ9SxIiVRtzspleUtZWWom1fgF/XHU
	IRAjkb0L/2ytmF4niQt+vjm8jMSAaQ8hbMZ9GcNmMoQUz74iK+yF9/FxnElOYA5JUQe7DS9ThWm
	kwvVmijdufPne9xg5aF0SGqcf+XlWAWJ/tQU9MjNERukvxY+DbHGQVnIZBQH73OJsntmdOC4q6j
	eq2pEu3JRMvydzdT2FIZgp5zK/FKLYkWtysdB0xUkp70UJFSp9o+R4lswMUQPVQ4B3SsvWcfYYu
	arkc5/RxBkx3pVFKzGk3b4YK613QA9g4q+aWzQr5Qc8RHqfD7LYceB/WHYQUzuANXw==
X-Received: by 2002:a05:620a:410e:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cf535240abmr166200185a.8.1748452603480;
        Wed, 28 May 2025 10:16:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2lnLLqcEflYr54m8J13/Eqky3HDBtiGQN/lG4ZbKrr1DA3OuSD2/oz15zp4Lpg0pBXwGAig==
X-Received: by 2002:a05:620a:410e:b0:7c5:75ad:5c3a with SMTP id af79cd13be357-7cf535240abmr166198185a.8.1748452603001;
        Wed, 28 May 2025 10:16:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d7941fcsm1035588a12.57.2025.05.28.10.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 10:16:42 -0700 (PDT)
Message-ID: <41ee75df-2244-45ad-956c-e17ea5804dbe@oss.qualcomm.com>
Date: Wed, 28 May 2025 19:16:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: watchdog: qcom-wdt: Document
 qcom,imem property
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
 <20250519-wdt_reset_reason-v4-3-d59d21275c75@oss.qualcomm.com>
 <20250520-portable-anteater-of-respect-c7be5c@kuoka>
 <37bd619d-242e-4488-8d45-c2c85612bee9@oss.qualcomm.com>
 <b8003fdf-66a1-47e1-8c78-069f0739ea37@kernel.org>
 <85e30c0c-ea77-47da-9fd9-4293c7a78c75@oss.qualcomm.com>
 <8efa9abd-bf7d-4f9d-969b-70c0452fc2b5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8efa9abd-bf7d-4f9d-969b-70c0452fc2b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o0evIb-1iIJt_Q6yQwbVtRhPSFYcPnV2
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=683744fc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=DivZRyEUkxVDCtRtIxkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1MCBTYWx0ZWRfXwH/uaVN8HMoC
 UI6/U0mKC3Zi2DOtBs9qYa01+EmGRTf2SREfU4+8WnYw9+Ybev0INX+n0su6KOwHlZNPURdA/i+
 v6Rx4ISheu1QFRTJmpGxpFOe8plyST/hcPpBMGC8eFLaDsFG+MUt9kyc5S0ppDOXJw5TAuZUq5Y
 hmAnIwZTSVlMLoIr6ng0A8NjDTtPBfwoHAfcZachH6e0ItZKNDUHAxpsq7wJ8XB5bERzLLXtPdE
 +e0ALOCev94UAmx+Qy44qLx8PzhQwSFt7xRqNIsjbQYzA/GANmTqr02KtRS+zYoIyyxRrl3B21j
 RunrGfQwxN5OaASpvjm1Pm8gTAlgfVD6xhOL+bdkkreMk411n2vkX9vjPxfqf6rm/ADBLGlEW+y
 b4nOlk+QintnDr3o/20IJ59qFl6MU50eP2mDMcCgvI+iDAJgTTbVF2p2Eehdw/2so8mMQTWk
X-Proofpoint-ORIG-GUID: o0evIb-1iIJt_Q6yQwbVtRhPSFYcPnV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280150

On 5/23/25 4:35 PM, Kathiravan Thirumoorthy wrote:
> 
> On 5/22/2025 9:15 PM, Konrad Dybcio wrote:
>> On 5/21/25 8:53 AM, Krzysztof Kozlowski wrote:
>>> On 20/05/2025 18:00, Konrad Dybcio wrote:
>>>> On 5/20/25 9:25 AM, Krzysztof Kozlowski wrote:
>>>>> On Mon, May 19, 2025 at 02:04:03PM GMT, Kathiravan Thirumoorthy wrote:
>>>>>> Document the "qcom,imem" property for the watchdog device on Qualcomm
>>>>>> IPQ platforms. Use this property to extract the restart reason from
>>>>>> IMEM, which is updated by XBL. Populate the watchdog's bootstatus sysFS
>>>>>> entry with this information, when the system reboots due to a watchdog
>>>>>> timeout.
>>>>>>
>>>>>> Describe this property for the IPQ5424 watchdog device and extend support
>>>>>> to other targets subsequently.
>>>>>>
>>>>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in v4:
>>>>>>     - New patch
>>>>>> ---
>>>>>>   .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 20 ++++++++++++++++++++
>>>>>>   1 file changed, 20 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>>> index 49e2b807db0bc9d3edfc93ec41ad0df0b74ed032..bbe9b68ff4c8b813744ffd86bb52303943366fa2 100644
>>>>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>>>>>> @@ -81,6 +81,16 @@ properties:
>>>>>>       minItems: 1
>>>>>>       maxItems: 5
>>>>>>   +  qcom,imem:
>>>>> Shoouldn't this be existing 'sram' property? If IMEM is something
>>>>> similar to OCMEM, then we already use sram for that.
>>>> We specifically want a handle to a predefined byte in IMEM, something akin
>>>> to qcom,4ln-config-sel in
>>>>
>>>> Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>>> Nothing stops that with sram. Above example is poor, because it mentions
>>> syscon. There is no hardware as syscon. Does not exist. What is IMEM
>>> here, what is this relationship?
>> IMEM is indeed a small block of on-die SRAM. In this context, another subsystem
>> may write a magic value at a known offset that would correspond to the platform
>> having been rebooted by the watchdog. Now why the wdt register is cleared in the
>> first place, I have no clue.
> 
> 
> Thanks, Konrad for chiming in and providing the background information. With respect to the WDT register, when the interrupt is triggered, I see the expire bit is set in the watchdog register. The bite interrupt is handled by TZ and TZ does the system reboot. After the system reboots, bit is cleared. I have cross checked with the design team and they confirmed that the behavior is expected one.
> 
> Krzysztof, Based on the discussions from the previous versions, I have made the changes. Can you help to guide me on how to handle this? Should I just name the property as "sram" and point to the sub block in the IMEM region like how it is done at [1][2], which is more or like similar to what I have submitted in V1 of this series[3] Or is the current approach acceptable? Or some other way to handle this?
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-1-b5d536291c7f@oss.qualcomm.com/T/#u
> 
> [2] https://lore.kernel.org/linux-arm-msm/20250523-topic-ipa_imem-v1-2-b5d536291c7f@oss.qualcomm.com/T/#u
> 
> [3] https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

Let's go with desired-value-in-dt here.. I don't trust the firmware
to never change. `sram` is prooobably fine, let's hear from Krzysztof

Konrad

