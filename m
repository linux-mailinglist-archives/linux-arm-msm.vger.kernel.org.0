Return-Path: <linux-arm-msm+bounces-86175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD28CD54BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22BE13007FFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16731E9B1A;
	Mon, 22 Dec 2025 09:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvXHqyos";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez4xV9Oz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF625D208
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395078; cv=none; b=uKIOJPGQWbbFCSpoF4EJCsGIUvxUAfuBUJPUF3H5SMpcbc2EYRpUljdRPooyX7RKKZfX1EWzLR90UETvf7uXVDEZUtAURUvif9f1wG1Uv6IJs36/n8AxyuBVmLTTp1W9LT8ikFI+1z/N+R2+89Ng+5kYEudMm2DUNduBhbEwvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395078; c=relaxed/simple;
	bh=+FEaQLbLEgdyd6u561VwKgGNRqatI2FPptfNTdDwsKI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=J90s8ub8rrTJ6rF1bGlUB5tC1rXkFx/S91vJtnoNh9sc1UyfVTDglxUnGviJld9pLRgOgM4W1cTkPGz+RMf/lYptQg6rv+oDbbSddR0ctYLeslt8pj3TjgXkWao+GjFRdJOgB5Z21oUCE0A0rWi6N9WeJIcfa7svEykkaQ+5lUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvXHqyos; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez4xV9Oz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5g5fq2189489
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=; b=XvXHqyosqkf5mEuR
	Qqb93hukytJtYn4r/jdvksqJ/9Dl58okN3JXi6FD5b65ekgCxbDaQ0DGZAetNUtQ
	OZsjVyunQRYUDPa0nLU3fWHg5epJF2Knj7spqjvzo3vsYmna/Q63poOCGSohunoz
	IAybYcwQYbCkHbVxPV0qW4tdOCU/vonKo570GHztPgZiZWeQV7PCwkZKGKIPPhN+
	/Tg9cGFGacDVyQrMoHwfq1epfneViiCLp4+WM/G+i+qr1LMRDN7485aMjLElulKD
	2hj9e/QLf09OudkHLpyOuCbejxNsW6MeI7tr720CFcJm/jM0aE/TfSW/dorq/lqc
	kBaHFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8mq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:17:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso6076877b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766395075; x=1766999875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=;
        b=ez4xV9Oz2Yzo0hTyra8QPsBn/qjK+HQi8M2QPqFgB4MKbLCkK3P4pFK9Vv1HIpsCxw
         qy7OZ1fXISCzSjWnXS5svQXhTAPpsQnUO5sTqD/0bxRmFwfd32uSSKIZKTEiQsQuNc1l
         B/CED91pxfVDFlLvtny8eppFRqI0MBrK3C0ooZscANLYB1q3Iu/X4VErV5s3o6PTxOMZ
         5tpYgVjSBeqrdn8z6+BUfe4sHxlNaSS5crwEveAuSIS6929f36piR9/6TDetUsb3G97U
         9mGTDDH+VUqa7om5E6gxfNJZ4iJPiTw2OiSAyLyQM3IeyVNx7WQTdp4H9GgfbkDeBpZf
         Fjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766395075; x=1766999875;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHYcFna9IBP8yPCXPx/jCY/LQ258ays+0WQDfP2UK7s=;
        b=mrr5bLNUorePx24X7FpvYyNOOdwxljRvBQGpEWhRW5Z0Xw/XhcqNWIplfESzQr5/1e
         RRNIkkWx8YFrPvdkfJHceHFmWD8GqlsUHxBd2JvF2W4ULVzJj/lwpXWprHWQYrh4v8yO
         FWIUdN7O6qO5SKMxm7tmVGFLfMzAbLsMzdI2Cx3tAw/Hkf3tRqsLQ1WaFFtYdZhE1N+K
         WfEOxwKj6/HOb0yV+Wwe7EnCf8vEPfTzbYfUIyCkQhHcR0ppS84oTH3zrbgG0mAvex+z
         xagpB/8QjsULG/I+akFBrlWgbaGWo5vVL5izhRA2TziAgkv7KAaEoa/+/KgEGCD8HEIp
         c0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWzEodz/usHwz65UQ8KEka6UiBHAbm4Nkl0KXbvq8Gty5kY9B4rzuUs6vKnUcyNnhdY8ky31UDgMkqMlHgV@vger.kernel.org
X-Gm-Message-State: AOJu0YzhndsIQwel8WfvpZ7OU0mZCvxLjI9xiy+dMFCP/5fbJmUblJZ1
	IZpNHhM2Ser+gYuhYjF9asOgLpv8HgIz5LGksUStCv0KMAQwslZwkC2ZZ9msEOXtf0jlPENyb7s
	yuIb2bvxzUgaopmc8rkOrN16Tx0I9my0nkUNuNtA5k274xwaK35MH9QDzPZn7q60aswqF
X-Gm-Gg: AY/fxX70ZEBP+OYqWXCm4Rt6ALBciTJS7AV6xGAVJw2VOrQlIH95Xc8j4bukrlLf4tV
	QDevCS6dkjXMGpwJENgBIan5LaWbtjdgFP2s7NPfVbRj9EuRWJEEC90p17Uuj9Y8UVgzEqqyKNX
	hTVhG5Z/dzocM2eY8VZFISbC5qOw5E3QSto1xWv2Y+7rZUBOuVwI1GIQWFgQDkKw68VjWJvI+zh
	erIkIjS3THJfNB8X5Fmt1XfsFkuzLWXGJeXRb+umJP3TxFrjrCalWGsTGrmTqUxDZhGvpMz7x43
	zxil4bc7vC8BkgKkZSQLs249HLTSxpcUGjD0GmhXXvLsa3QcIYGiin7Tw9MTpSdfYFrbrIFXJrC
	BbKdBnR8OOz7I4R8dGmmcDELBaU/n+Nwfj7XmbWCL251Ke3WHWArnfvEzm2QAACY5jpK7WyD0J0
	w=
X-Received: by 2002:a05:6a00:1f0c:b0:7e8:450c:619e with SMTP id d2e1a72fcca58-7ff66a6ecc7mr9498826b3a.53.1766395075415;
        Mon, 22 Dec 2025 01:17:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd//VFkRIKO2NQ60cGR2Kj8FVATZRob9N42xXZZ8fStzRji1TPzSanp6ObU6Qgk0zmCu+JNg==
X-Received: by 2002:a05:6a00:1f0c:b0:7e8:450c:619e with SMTP id d2e1a72fcca58-7ff66a6ecc7mr9498800b3a.53.1766395074881;
        Mon, 22 Dec 2025 01:17:54 -0800 (PST)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e588a30sm9833430b3a.55.2025.12.22.01.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:17:54 -0800 (PST)
Message-ID: <01072c94-3a13-459c-baba-0cc2f3611ff9@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 17:17:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Mike Leach <mike.leach@linaro.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
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
 <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <097dbefb-f679-40da-bce4-d6e09dc4cf08@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69490cc4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=BUuRoenLQBXCPULKYeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dETdtaj3SUMdoiFvEHkExAUzFJ-bB_9Q
X-Proofpoint-GUID: dETdtaj3SUMdoiFvEHkExAUzFJ-bB_9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MyBTYWx0ZWRfXy32bGRXejiB8
 D2iP9GZvARXxDgkUPEHVNfLLLia3Wljt/6smOUcvZh3tDNqahW2MAi1GM52H4Ofvc1PkcBYbu1j
 nUxvyONnC9dPKV/SfDzcBxktGhZnEYbORGLqNFgMuJoQkjLqH7/yXSvJ3OsbcLhpcGHCD87mX6k
 38CIfyMGhoyXtRl9aHghHyWHUS85l/w06+MOEa3SB3fzfMDraFeo2AXKiLW4IRQhkXf2HUP+6Ek
 VcRaUGYfCIGZCLfUwd9JNy9rvtEmkhycWaig90Qi0exUEWOUUNWkLM65tKDGPfVon8VLGDFGOZW
 razyMW+LkO6F5Verx86Zmq6/OkxamOzBxLlNNn4b+l/ckIFupy3mQP0mHP53fsDP2Fr/JSf9E15
 fnfTghRtZn4p+eVgB1YaQajpjynmb7BbYyGdintlIu8/izkdJoolR06n7QVvFbVcCNspdszJd/1
 m/N5Lh5kLcXnjXk71TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220083



On 12/22/2025 2:58 PM, Jie Gan wrote:
> 
> 
> On 12/19/2025 5:54 PM, Suzuki K Poulose wrote:
>> On 19/12/2025 02:05, Jie Gan wrote:
>>>
>>>
>>> On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
>>>> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>>>>> On 12/12/2025 02:12, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>>>>> triggered
>>>>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>>>>> register
>>>>>>>> of CTCU device will enable the interrupt.
>>>>>>>>
>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 
>>>>>>>> + + + ++++++++++++++
>>>>>>>>    1 file changed, 17 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/ 
>>>>>>>> qcom,coresight- ctcu.yaml b/Documentation/devicetree/bindings/ 
>>>>>>>> arm/qcom,coresight- ctcu.yaml
>>>>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>>>> ctcu.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>>>> ctcu.yaml
>>>>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>>>>        items:
>>>>>>>>          - const: apb
>>>>>>>> +  interrupts:
>>>>>>>> +    items:
>>>>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>>>>> +      - description: Byte cntr interrupt for the second etr device
>>>>
>>>> This is really vague. How do you define first vs second ? Probe order ?
>>>> No way. This must be the "port" number to which the ETR is connected
>>>> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
>>>> filter) connected to the CTCU. I was under the assumption that they
>>>> are identified as "ports" (input ports). I don't really understand how
>>>> this interrupt mapping works now. Please explain it clearly.
>>>>
>>>
>>> Sorry for the misunderstanding.
>>>
>>> Each ETR device should have its own interrupt line and an IRQ 
>>> register within the CTCU device, as defined by the specification. In 
>>> existing projects, the maximum supported number of ETR devices is 2.
>>>
>>> Each interrupt is directly mapped to a specific ETR device, for example:
>>> tmc@1000 → interrupt line 0
>>> tmc@1001 → interrupt line 1
>>>
>>> The suggestion to identify devices by ‘ports’ is much clearer than my 
>>> previous explanation, as it explicitly shows which device is 
>>> connected to which port.
>>
>> Thanks for confirming.
>>
>>>
>>>>>>>> +
>>>>>>>> +  interrupt-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: etrirq0
>>>>>>>> +      - const: etrirq1
>>>>>>>
>>>>>>> Names are kind of pointless when it is just foo<index>.
>>>>>>
>>>>>> Hi Rob,
>>>>>>
>>>>>> I was naming them as etr0/etr1. Are these names acceptable?
>>>>>
>>>>> Obviously irq is redundant, but how does etr0 solves the problem of
>>>>> calling it foo0?
>>>>>
>>>>> I don't think you really read Rob's comment.
>>>>>
>>>>>> The interrupts are assigned exclusively to a specific ETR device.
>>>>>>
>>>>>> But Suzuki is concerned that this might cause confusion because 
>>>>>> the ETR
>>>>>> device is named randomly in the driver. Suzuki suggested using 
>>>>>> ‘port-0’
>>>>>> and ‘port-1’ and would also like to hear your feedback on these 
>>>>>> names.
>>>>>
>>>>> There is no confusion here. Writing bindings luckily clarifies this 
>>>>> what
>>>>> the indices in the array mean.
>>>>
>>>> The point is there are "n" interrupts. Question is, could there be more
>>>> devices(ETRs) connected to the CTCU than "n".
>>>>
>>>> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
>>>>
>>>> TMC-ETR0 -> CTCU-Port0
>>>>
>>>> TMC-ETR1 -> CTCU-Port2
>>>> TMC-ETR2 -> CTCU-Port3
>>>>
>>>> Now, how many interrupts are described in the DT ? How do we map which
>>>> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
>>>> from the port is possible, with the topology).
>>>>
>>>
>>> Got your point and it's much clearer.
>>>
>>>> This is what I raised in the previous version. Again, happy to hear
>>>> if there is a standard way to describe the interrupts.
>>>>
>>>> Suzuki
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> Usually, the probe sequence follows the order of the addresses. In 
>>>>>> our
>>>>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its 
>>>>>> address
>>>>>> is lower.
>>>>>
>>>>> How is this even relevant? You are answering to something completely
>>>>> different, so I don't think you really tried to understand review.
>>>>>
>>>
>>> My previous explanation was definitely unclear. As Suzuki suggested, 
>>> mapping the interrupt to the port number (to identify the relevant 
>>> device based on topology) makes sense and provides a much easier way 
>>> to understand the relationship between the interrupt and the ETR device.
>>>
>>> So with the suggestion, here is the new description about the 
>>> interrupts:
>>>
>>>    interrupts:
>>>      items:
>>>        - description: Interrupt for the ETR device connected to in- 
>>> port0.
>>>        - description: Interrupt for the ETR device connected to in- 
>>> port1.
>>>
>>>   interrupt-names:
>>>      items:
>>>       - const: port0
>>>       - const: port1
>>
>> Which brings us back to the question I posted in the previous version. 
>> Do we really need a "name" or are there other ways to define, a sparse
>> list of interrupts ?
>>
> 
> Each interrupt is dedicated to a specific ETR device. While we can 
> retrieve the list of interrupts using of_irq_get, we cannot guarantee 
> that the obtained interrupt corresponds to the correct ETR device?
> I believe it would be better to have an interrupt-name property, so we 
> can assign the name in the data structure and retrieve the interrupt by 
> its name, ensuring it maps to the correct ETR device.

I have tried to get the interrupt with of_irq_get(nd, port_number).

If we define the interrupts in the correct sequence aligned with the 
port numbers, we can then retrieve each interrupt by its corresponding 
port number.

Is that ok to drop the interrupt-name with the solution?

Thanks,
Jie

> 
> Thanks,
> Jie
> 
> 
> 


