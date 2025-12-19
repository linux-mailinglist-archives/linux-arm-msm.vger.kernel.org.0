Return-Path: <linux-arm-msm+bounces-85757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B7CCE3C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 03:09:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D59FA3008F8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 02:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FED271457;
	Fri, 19 Dec 2025 02:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L2sWY4AK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iBSZ/fN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98621E098
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109915; cv=none; b=s0UKQSQ0n7LUWCaZmdenpBSa66cMjFdIPRs0TU+q3Mgw/D0QkSDHdXljGh8h7jvMZ+FxX4bY7W8Cuupf2taN5X4N+DYArF445or1fWOnbw4EXs3rXfLfmlL0rMTaiNLF7V2gD6f8a9bgUZ547UQjBaz4ZtIo0Jsaacau81F471Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109915; c=relaxed/simple;
	bh=fI+95ZOjKY3yfRQ+VZLRoxX/kKmxmxLpPVnrsV75VaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhHMvZMYGI+a2Gt1bKpYB7OtLw2qWB7J6KvcUPQ+aJvgKCRT4reV7YfDkuRBP9cukjQo+wHcKV10dfioUKoo7YU6P1VTW9gUtikeyMI3V+385rClexRg/Tqhl0hFow6ULl832XTqQNad0RnaUWQva8BUmWvARwG0SDPSKksvwDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L2sWY4AK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iBSZ/fN6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BILkwBk2699987
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=; b=L2sWY4AKIxkhFoEQ
	BXtNdaJ2lVg0sWy6UgMl9pi/9zGZhKa2rARZq66DjSyGKcwXXuy/3HUJRkMCQyxO
	rfnJIzCm13yDZyQJWZ7jnR9R2pm2K0cDdx+rhxJIoO5DMv1lQ/WL4MbKfg1pNSvV
	rW3HhcRkOMUB6p2I8XIwCKKFFcEFSH7SzSXKTKHcw8bdf0d7jYoRi0AEhm5n3UDd
	5wZVq6xEosWKHkZg944LRNQZ549il2KxlVDtdJt/DqXYavwSIwaad6hVEwKqO265
	l1BC+VOKZBDtoV62nwAxoDou4I2art9MQjSwaci2UW3/gGwqMjB/kUwkw0eycq8S
	LFL/Eg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c8uev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 02:05:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0f47c0e60so30210935ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 18:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766109912; x=1766714712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=;
        b=iBSZ/fN6FGfDdHJZDgquKAZ1Eg2Bi1rYb+NqMnwCr3/0YnnpSu9v1yvGtkNWTmHD7Y
         YQe4V5zfd7MAE2E+9kfxww0hTUMKn0ppwC9ej4iv95E1K7SCGkP9CXqTs7dG5RFHpI01
         NgGGVk9SbAox5hFZMWBr8oLHhE4sDAgr0dJSqZiy4BvzFn5Sg8o+aT24S3fZ12zsA90j
         9B1I8x8Ucflf0UaWPzTgQGA3mk2mnx30JZPTtLrJ3711zFpvpVBcEEX3qBp+lwb33j+o
         Lc5uf5eY7v3V0dX1trOAdRVpSfNvGRYopYSFhmIRGw0UJ+rGBF9BmA5PFrIXqx/DmIHr
         TK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766109912; x=1766714712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+KDl2G72vBzBLF/+z3TjDQ4EH3DJQNpwuc62txgdek=;
        b=MTC/rE4lFFacgxm3JqgJ584h+eMeL94xwbjyjYEDV2c99e+uXCo464Xk4+S3FrlVyB
         dgIDtCoQTogjRRwR3uBtAyaGLvBuAbxkF/uLqu51SzmFDb68EviJK7tNYQQ4ltKvU/lu
         lsp6F7OhU4is8fQCJImWd8di/pi9gNpVpUaKWdrzNqtDs+H6rbLRKFq8vVgdEHUtQv0v
         ZVRqGdB+fz35w3RbttzWXmfDbzFc50dAkcoeGIjn5zAg4VcLeXDIpodS1oRjeDVONf/M
         FA85RC70IB4zNH0HPpKEZrMEDgvvYAiwmmTWdL8N0EGsrmI1fj9xNd1R/RtY6A9PRx99
         QOJw==
X-Forwarded-Encrypted: i=1; AJvYcCWnEc33rgqZ9Ut9enbLx0ohUgJnxzPIK/VKqVekyd9N2Kbif6Wrz87DGBFoR+M8cD0ph/8SG9tUwznO7PAl@vger.kernel.org
X-Gm-Message-State: AOJu0YwG4OpkiTO/NwlCppdS4oX1kSXe4B1ljPpmLJ1lArFhIRyLkPa8
	XN35PGVSyaVQX+66t+oLcA/EQUyabhTjp2g/tHxYvTU2w5E6LMxKOSVUWksqmV8DLPBcQDlDlTy
	si2dXLQuvCZzHMpLLLNjOw9I9rvC0/dgRy/ylyotfLuJpPil7S1F8Sp6JDU1P2eWl5Oh/
X-Gm-Gg: AY/fxX5zeh8JksETjTP2ci1YbNCwRI+sNp48ZD5PzJEm37nzZhfPC9vgrcy4zcHK+7Y
	EIaQ912FZzN7fv69KXsxTjhQyIYLkAHwahKi6yaMSvu4O769ZPppeoA/3As+5eWfdxzE5owg1f2
	16dEi9g709RDGc2eRP0ryQsH/8S05UFMeqdr5SEmUjjgyN+uzgc08avUU1GJWxSCJgTg3On9CYU
	/VsWK2ZK1s1l1nIVeUtEOFNBNgEegn1iDQQq01j0cJPD/AyFL5Z/ruYln2LjoRwjgYaO1/QqvsG
	Ou2C/U52fbEagixzW23+6HWW+am22nXBlnpC4W8YOV4vxzXJqStxHuC2GugYz36dUaZ69Rd7nBo
	zqLyvhr7zTxSl6r41O6u5r2mwRD6tEZgPYwA7yES2p2vqGvTIdkCyJNi6QSh2HGZK9+NreODYP3
	U=
X-Received: by 2002:a05:6a21:6d9e:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-376a75ef388mr1339452637.4.1766109911844;
        Thu, 18 Dec 2025 18:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENweru9eTuM8/f/hzvfINoPNb14Iccv5nkKoLSJUQfoBqv5hSIXuuu8B1IOuUhk1nYq6XY7Q==
X-Received: by 2002:a05:6a21:6d9e:b0:35b:b97f:7471 with SMTP id adf61e73a8af0-376a75ef388mr1339414637.4.1766109911303;
        Thu, 18 Dec 2025 18:05:11 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961b4d0sm516718a12.5.2025.12.18.18.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 18:05:10 -0800 (PST)
Message-ID: <46afd4f6-f287-4d19-bc68-f2f6eac36e6a@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 10:05:03 +0800
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
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <2db74a3e-4aeb-4e87-9fe8-5c9693bfb67c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=6944b2d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=aQ7FMZSyy468aWolCDYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAxNSBTYWx0ZWRfX0SxomfORUZPU
 ppv7M/f3QUbqyUFwMrL83e0/7pvConaovMbT+sCNyVimxKwwbobuFJcBx3+eXn35wGIfnSB+APC
 XOjzxaRRW1AY/OO9Iw5U3L2fTsWAk9yi/d8qy0ySjGMXHGhmcvjyhwBWgoX+v42CIvzIUAYUmsh
 ok3q0wJ6NzDs/O6iYUuY5ze6ndI96GwHAnbTQKfYVQQ9Ush75M1K6cBmQzXFHccCSxUlJpKpkuw
 iAz0TljM0H2+impL09x8Vjz+Ld9nVcrANtJR6jsaumRsWY0aFEUP9BTLef3NgLJn4pxaPWo7vaw
 xyntz9KxCiQO7f6keW1Hqw+xga9CGO7OtbVxB4Wm+xvUvCvrtZQlmKM+5bEpWM/tyGbDJse0wzr
 WSmNcCPMkgKSbQq7aR7wPOHPmNPkxdFLV1sdDD4yR2QWMw7UW9TjpQZ7qJKUAoGSc3s065+Pfni
 Jn/NYrJO3JmmfZEiE5A==
X-Proofpoint-GUID: UgE-ASc4XDsEMosCmzweO1VgDQIOuGrt
X-Proofpoint-ORIG-GUID: UgE-ASc4XDsEMosCmzweO1VgDQIOuGrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190015



On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>> On 12/12/2025 02:12, Jie Gan wrote:
>>>
>>>
>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>> triggered
>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>> register
>>>>> of CTCU device will enable the interrupt.
>>>>>
>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>> ---
>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++ 
>>>>> ++++++++++++++
>>>>>    1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>> ctcu.yaml
>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>        items:
>>>>>          - const: apb
>>>>> +  interrupts:
>>>>> +    items:
>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>> +      - description: Byte cntr interrupt for the second etr device
> 
> This is really vague. How do you define first vs second ? Probe order ?
> No way. This must be the "port" number to which the ETR is connected
> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
> filter) connected to the CTCU. I was under the assumption that they
> are identified as "ports" (input ports). I don't really understand how
> this interrupt mapping works now. Please explain it clearly.
> 

Sorry for the misunderstanding.

Each ETR device should have its own interrupt line and an IRQ register 
within the CTCU device, as defined by the specification. In existing 
projects, the maximum supported number of ETR devices is 2.

Each interrupt is directly mapped to a specific ETR device, for example:
tmc@1000 → interrupt line 0
tmc@1001 → interrupt line 1

The suggestion to identify devices by ‘ports’ is much clearer than my 
previous explanation, as it explicitly shows which device is connected 
to which port.

>>>>> +
>>>>> +  interrupt-names:
>>>>> +    items:
>>>>> +      - const: etrirq0
>>>>> +      - const: etrirq1
>>>>
>>>> Names are kind of pointless when it is just foo<index>.
>>>
>>> Hi Rob,
>>>
>>> I was naming them as etr0/etr1. Are these names acceptable?
>>
>> Obviously irq is redundant, but how does etr0 solves the problem of
>> calling it foo0?
>>
>> I don't think you really read Rob's comment.
>>
>>> The interrupts are assigned exclusively to a specific ETR device.
>>>
>>> But Suzuki is concerned that this might cause confusion because the ETR
>>> device is named randomly in the driver. Suzuki suggested using ‘port-0’
>>> and ‘port-1’ and would also like to hear your feedback on these names.
>>
>> There is no confusion here. Writing bindings luckily clarifies this what
>> the indices in the array mean.
> 
> The point is there are "n" interrupts. Question is, could there be more
> devices(ETRs) connected to the CTCU than "n".
> 
> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
> 
> TMC-ETR0 -> CTCU-Port0
> 
> TMC-ETR1 -> CTCU-Port2
> TMC-ETR2 -> CTCU-Port3
> 
> Now, how many interrupts are described in the DT ? How do we map which
> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
> from the port is possible, with the topology).
> 

Got your point and it's much clearer.

> This is what I raised in the previous version. Again, happy to hear
> if there is a standard way to describe the interrupts.
> 
> Suzuki
> 
> 
>>
>>>
>>> Usually, the probe sequence follows the order of the addresses. In our
>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its address
>>> is lower.
>>
>> How is this even relevant? You are answering to something completely
>> different, so I don't think you really tried to understand review.
>>

My previous explanation was definitely unclear. As Suzuki suggested, 
mapping the interrupt to the port number (to identify the relevant 
device based on topology) makes sense and provides a much easier way to 
understand the relationship between the interrupt and the ETR device.

So with the suggestion, here is the new description about the interrupts:

   interrupts:
     items:
       - description: Interrupt for the ETR device connected to in-port0.
       - description: Interrupt for the ETR device connected to in-port1.

  interrupt-names:
     items:
      - const: port0
      - const: port1

Thanks,
Jie

>>
>>
>> Best regards,
>> Krzysztof
> 


