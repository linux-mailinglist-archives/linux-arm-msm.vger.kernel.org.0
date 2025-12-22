Return-Path: <linux-arm-msm+bounces-86115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA4CD4D46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D21B4300763E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F678303A35;
	Mon, 22 Dec 2025 06:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOKWRQT/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cgwdBUjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FEF2F851
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766386738; cv=none; b=uwsFEaMprZQOxcnBlI51vPG6YtQoPsRiFyVmnPjLygsAjdB6POKxVZ3hl6e2Qunr6uq3QrRSqIbAPTRifdAiVlsSHeM+btiJSnDrNkPz+Nle2LoWAtXQHHZiX0cyVzyD1GtmhjMbRPS2oRqZuvBxCFNeRu0X0mc1pg4KtKcVeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766386738; c=relaxed/simple;
	bh=BC2DATRVLjyGGrI+/IOZpGrlevdSZVA+kZM7aOv6gs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KitammC4t50PKMxWZwqYl0ipoMliYXanaYDpcciTczvBffGiZrH6b5dPUaku5MoGRC74jTU6FuAjWu7gZTXJApd1q9ydq6hWK3Dt1dc9WJgoyzYxFqwSKwSWw7kNzn84Yx/04EggX83UlIAdc5x+Nk8ECvkyV4kDsaiy+xObrik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOKWRQT/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgwdBUjB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLMgrBg3732860
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=; b=JOKWRQT/Rb5Me+Q0
	IADVjaPsTvHas15qk1e4hTv0HmtQWVt32pwpLO7ZhwLBuQgwxuyXkbeEbOOYHcD7
	zAfxBttIlnzjdNDMSQXdHLS6/lNEDkqu/z8tlp1FDjqXeZ+ofaE18ADp5EB0/uLV
	UYFajkuRb6//ncxlhA+sA6SpKy1qbddJoNTHxmLuWh0gPXC2ufaGKZshVw6uNdyz
	Xsn8Kw8bsE82CT3itnV8H3wmHX8e2PyZzd0Ckra5cwq4dV/8Yl9Dx/IpO+E+n78E
	Q+x9uJbVlzKXkm6mDWz1E2L3TRkPEN/nICrUS6KJSW/AXfM5B/GO9lXDqjnrFxHD
	vBpI3w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtc11x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:58:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7bad1cef9bcso7496370b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766386735; x=1766991535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=;
        b=cgwdBUjB4aHF1yeGsVlSlK84/IGArPCMnGO/VyR70fxLy2oj8GOe9cCV4nf6u00An1
         4uRQ838+GIVzOhN8bQZ8VO28wukxmmXrWmh+CuajGvVJIW9F2K9GjQzkEphjKpSqs1xM
         KowBS9VISP24EIRlJRzYx6j5gCFhRnZjHhSEzaRVMEF+qhcm8KiNb4wbcckefuylbsFb
         iX+sPUW0zCSU9N9ZzIbuaoG6DYLp/ZSqfqhARq2QPIwx0XiF1EVkKqUb5W7izZdQhQbl
         DHus3LExisb7TNJf8j6/LF2AcRHQv3c8g+6e79B4DxqLONGOSFtmKUxCwjoGaPEvT6D7
         qBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766386735; x=1766991535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMxuqKVWm3OclsZ+GWtTTlP0TisA0si8nmJC4yO6AdI=;
        b=b47M6O8AJWTuEiez9wIyVmHYw9HI7rdqb9zIpj2vMqSJulai3kwR7cPzZBCYcI91v9
         Gse9VQcXj31A2PVhNfa45GuqOe/EiwTPBOusrOeb+RLSpkzwtWOoZKjZpC7hQ6lq3Ge4
         PfKorc0vjihb80LniGm0Q9V9a8Keykv9kgeIANvGHka0IIZRKn1D8aV+jpIIA/sIfpQ9
         m57jsw7hVZeQY3bOwZIrPs5blgQrGUCqQzIAKDysXuEiXE1j2w7NcD+qzCEAXLB8O7hY
         Ktseu/qLtH8yd9eD1Jllzz31xgQRI3OX6ujfxiFoCCIDBGuzvlWpWDeZRWlIgrx7vIQC
         zPHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSsbJi5z7eI1q8xoQJYq7KM1AeqI9DnmWBUSU7yRkt2Zsz2l+LikuFhlX0LKNlajyanFe1VCI6vUlnBKCx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3lS8uAYROG8sRgFu6XtLm7HdrdRyF88j/XqhBCG8ni/OBwZup
	rjXUGIR47bn73Ccdpy9SrXJywcKVMWT3+moU9eQ/n7irettqt6sQJZgsj39abjQ4MeM0N3XZBj1
	Hrc76mHJs2gO+32mtcanXtpypYj+uT77E5JCcYy2PV4D3tTTVmjd7W/kU0tmFvbqjNlD6
X-Gm-Gg: AY/fxX58SEBAsNfW2Ar1a9QQuV2mkddD5p3b7s4V3Zxg7LedgddlbBpy2FOYjqaF1fm
	67OqDTkSwgmC8Vx06fpDit3YBwHTjtkZK/WGC5SykxbO/Du2bhZhBM99clOGVGtJCfXZTCd/xW9
	ufR/DPFoiixpoSeWjpdXqhl1jcjEU6DZi/7rD4h2lfAn8Ry8Cuy4PrHvgbE14MhUUE1qSPRyGPE
	SnB4u+upSNZY868INUMKw/e/QZRaM6ZEh1TJh0qixUx9m9yW28yNrRiwix55gDXnqoemgWSn+xb
	vBtxEmG6uLPATUMpAdBDYZGcUnCTfHje+M+kIo/6WVln63R5W6/rPDrHr6pQBromvAOw1LEZMOi
	5tC4ZTOiQyjmLVH+isRQ52CNoHjn3qGdRszas0nxK5yyklNFaRE1d1CSjanBPqblNDVnS7CpVvp
	k=
X-Received: by 2002:a05:6a00:7613:b0:7ff:acc3:2f40 with SMTP id d2e1a72fcca58-7ffacc33e69mr7059154b3a.26.1766386735076;
        Sun, 21 Dec 2025 22:58:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEO+6I8pHuD+xmFtIYOJqkUxAi0nAsXhcjYzo9deCdZ2wwdODhLF8KzB5WTxUNjuepx5+QCTg==
X-Received: by 2002:a05:6a00:7613:b0:7ff:acc3:2f40 with SMTP id d2e1a72fcca58-7ffacc33e69mr7059129b3a.26.1766386734539;
        Sun, 21 Dec 2025 22:58:54 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a1a2asm9254539b3a.41.2025.12.21.22.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 22:58:54 -0800 (PST)
Message-ID: <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:58:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <20251211133723.GA859302-robh@kernel.org>
 <dfa43a63-ca14-4dd7-a7ab-acd95748a8b9@oss.qualcomm.com>
 <a9537dc9-c767-4909-8b1c-6e939ce4f3fc@kernel.org>
 <2db74a3e-4aeb-4e87-9fe8-5c9693bfb67c@arm.com>
 <46afd4f6-f287-4d19-bc68-f2f6eac36e6a@oss.qualcomm.com>
 <95ac571a-1c8f-45d9-9874-648d4123ce18@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <95ac571a-1c8f-45d9-9874-648d4123ce18@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BjmGMKs0iIDQKAWshR7xnU2JT3I6xMP0
X-Proofpoint-GUID: BjmGMKs0iIDQKAWshR7xnU2JT3I6xMP0
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6948ec2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W9kkhuXnUgcddjO-hjkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2MSBTYWx0ZWRfX/6Yu+QcnhWrc
 LFgFQ+hhtQDSaJN1UqKoJaPh0Wu0xZUND8KNsKV7h8ut0/CGhjJ3G/BOJ0UHDKzgal+d2UI8VIS
 /WzLi12W0TrJcLP+9lplUyaANYBrZ68jsVRnNsTHJgxR0E8ig0hzjORZfluezbBE+h5XxcTdwha
 zv4NW1KxR0+kOpcR72MNM5TlfA79ODZrMU4Ag1yrsEHK7otm+QM9hCR3i7NfmtBwjkANbeQ11LM
 tHej1N38TOf/LwtN/x6vwQn3KF9ZPwhFLRbfPXPtcu/vJOL/UwMHrZNTB+gXAgRJvONJ+Ks09V1
 6rCxZZeoKnsAbeGhxnJbvqA2E5KbNodtsEJHiW1bnNwozB85evJcFOTn4kxk/lAhrnK+UEuKfa8
 nFA6Kk/UCqLs5HioLx6XiIbXOEq3Qt+/FcDyMDrRQfsnM5nrwHpmuSWr+BeRTFIZYDdfOGeoW7o
 QN/T9RCTYRXG5uvhZ5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220061



On 12/19/2025 5:54 PM, Suzuki K Poulose wrote:
> On 19/12/2025 02:05, Jie Gan wrote:
>>
>>
>> On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
>>> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>>>> On 12/12/2025 02:12, Jie Gan wrote:
>>>>>
>>>>>
>>>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>>>> triggered
>>>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>>>> register
>>>>>>> of CTCU device will enable the interrupt.
>>>>>>>
>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 + 
>>>>>>> + + ++++++++++++++
>>>>>>>    1 file changed, 17 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/ 
>>>>>>> qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/ 
>>>>>>> arm/qcom,coresight- ctcu.yaml
>>>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>>>        items:
>>>>>>>          - const: apb
>>>>>>> +  interrupts:
>>>>>>> +    items:
>>>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>>>> +      - description: Byte cntr interrupt for the second etr device
>>>
>>> This is really vague. How do you define first vs second ? Probe order ?
>>> No way. This must be the "port" number to which the ETR is connected
>>> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
>>> filter) connected to the CTCU. I was under the assumption that they
>>> are identified as "ports" (input ports). I don't really understand how
>>> this interrupt mapping works now. Please explain it clearly.
>>>
>>
>> Sorry for the misunderstanding.
>>
>> Each ETR device should have its own interrupt line and an IRQ register 
>> within the CTCU device, as defined by the specification. In existing 
>> projects, the maximum supported number of ETR devices is 2.
>>
>> Each interrupt is directly mapped to a specific ETR device, for example:
>> tmc@1000 → interrupt line 0
>> tmc@1001 → interrupt line 1
>>
>> The suggestion to identify devices by ‘ports’ is much clearer than my 
>> previous explanation, as it explicitly shows which device is connected 
>> to which port.
> 
> Thanks for confirming.
> 
>>
>>>>>>> +
>>>>>>> +  interrupt-names:
>>>>>>> +    items:
>>>>>>> +      - const: etrirq0
>>>>>>> +      - const: etrirq1
>>>>>>
>>>>>> Names are kind of pointless when it is just foo<index>.
>>>>>
>>>>> Hi Rob,
>>>>>
>>>>> I was naming them as etr0/etr1. Are these names acceptable?
>>>>
>>>> Obviously irq is redundant, but how does etr0 solves the problem of
>>>> calling it foo0?
>>>>
>>>> I don't think you really read Rob's comment.
>>>>
>>>>> The interrupts are assigned exclusively to a specific ETR device.
>>>>>
>>>>> But Suzuki is concerned that this might cause confusion because the 
>>>>> ETR
>>>>> device is named randomly in the driver. Suzuki suggested using 
>>>>> ‘port-0’
>>>>> and ‘port-1’ and would also like to hear your feedback on these names.
>>>>
>>>> There is no confusion here. Writing bindings luckily clarifies this 
>>>> what
>>>> the indices in the array mean.
>>>
>>> The point is there are "n" interrupts. Question is, could there be more
>>> devices(ETRs) connected to the CTCU than "n".
>>>
>>> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
>>>
>>> TMC-ETR0 -> CTCU-Port0
>>>
>>> TMC-ETR1 -> CTCU-Port2
>>> TMC-ETR2 -> CTCU-Port3
>>>
>>> Now, how many interrupts are described in the DT ? How do we map which
>>> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
>>> from the port is possible, with the topology).
>>>
>>
>> Got your point and it's much clearer.
>>
>>> This is what I raised in the previous version. Again, happy to hear
>>> if there is a standard way to describe the interrupts.
>>>
>>> Suzuki
>>>
>>>
>>>>
>>>>>
>>>>> Usually, the probe sequence follows the order of the addresses. In our
>>>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its 
>>>>> address
>>>>> is lower.
>>>>
>>>> How is this even relevant? You are answering to something completely
>>>> different, so I don't think you really tried to understand review.
>>>>
>>
>> My previous explanation was definitely unclear. As Suzuki suggested, 
>> mapping the interrupt to the port number (to identify the relevant 
>> device based on topology) makes sense and provides a much easier way 
>> to understand the relationship between the interrupt and the ETR device.
>>
>> So with the suggestion, here is the new description about the interrupts:
>>
>>    interrupts:
>>      items:
>>        - description: Interrupt for the ETR device connected to in-port0.
>>        - description: Interrupt for the ETR device connected to in-port1.
>>
>>   interrupt-names:
>>      items:
>>       - const: port0
>>       - const: port1
> 
> Which brings us back to the question I posted in the previous version. 
> Do we really need a "name" or are there other ways to define, a sparse
> list of interrupts ?
> 

Each interrupt is dedicated to a specific ETR device. While we can 
retrieve the list of interrupts using of_irq_get, we cannot guarantee 
that the obtained interrupt corresponds to the correct ETR device?
I believe it would be better to have an interrupt-name property, so we 
can assign the name in the data structure and retrieve the interrupt by 
its name, ensuring it maps to the correct ETR device.

Thanks,
Jie



