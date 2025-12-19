Return-Path: <linux-arm-msm+bounces-85804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C7ECCF39E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D9403023E9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28AB2ED17C;
	Fri, 19 Dec 2025 09:54:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156E72ED16B;
	Fri, 19 Dec 2025 09:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138061; cv=none; b=raOuQXxgFgTHBuhp0w5r+BcBjkmidQXMJC8doCpZuSEzdV1Z+fLA2Xi4lv5Gu3hzeO6KRbS3jB6jU41WaRXYfwMEBMqVXVYTIUi0r28D3s3qFtHR6VxK3AtLpp3ZmKSSEmq7FE75CvKoX6Zs+yMpNyrfxiK/Ltl/d4w8qgHigxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138061; c=relaxed/simple;
	bh=oBDrMniGgr/u13j0I1Ae+D6FlHX8Ra/VhPHHp5KsWFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7SxvdmZNTCDrVo3jt0Y97U821PQCK6hLV9cQeRxL32EWDqggjUO2k0SCFVoQpixszJGtQF6GYhO1KmyYxcwhYSWK5TfbfITU2cmmdvD+MwXl7z/aFECv52KAvea0V8i3c12Vd26fjRzr79GL2cQZZ8WX0yeP1vQi6hqcx3PyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149E4FEC;
	Fri, 19 Dec 2025 01:54:11 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A7443F5CA;
	Fri, 19 Dec 2025 01:54:16 -0800 (PST)
Message-ID: <95ac571a-1c8f-45d9-9874-648d4123ce18@arm.com>
Date: Fri, 19 Dec 2025 09:54:14 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Jie Gan <jie.gan@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <46afd4f6-f287-4d19-bc68-f2f6eac36e6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2025 02:05, Jie Gan wrote:
> 
> 
> On 12/19/2025 7:19 AM, Suzuki K Poulose wrote:
>> On 18/12/2025 10:17, Krzysztof Kozlowski wrote:
>>> On 12/12/2025 02:12, Jie Gan wrote:
>>>>
>>>>
>>>> On 12/11/2025 9:37 PM, Rob Herring wrote:
>>>>> On Thu, Dec 11, 2025 at 02:10:44PM +0800, Jie Gan wrote:
>>>>>> Add an interrupt property to CTCU device. The interrupt will be 
>>>>>> triggered
>>>>>> when the data size in the ETR buffer exceeds the threshold of the
>>>>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>>>>> register
>>>>>> of CTCU device will enable the interrupt.
>>>>>>
>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>>>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>>>>> ---
>>>>>>    .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 ++ 
>>>>>> + ++++++++++++++
>>>>>>    1 file changed, 17 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>>>>> ctcu.yaml
>>>>>> index c969c16c21ef..90f88cc6cd3e 100644
>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>> @@ -39,6 +39,16 @@ properties:
>>>>>>        items:
>>>>>>          - const: apb
>>>>>> +  interrupts:
>>>>>> +    items:
>>>>>> +      - description: Byte cntr interrupt for the first etr device
>>>>>> +      - description: Byte cntr interrupt for the second etr device
>>
>> This is really vague. How do you define first vs second ? Probe order ?
>> No way. This must be the "port" number to which the ETR is connected
>> to the CTCU. IIUC, there is a config area for each ETR (e.g., trace id
>> filter) connected to the CTCU. I was under the assumption that they
>> are identified as "ports" (input ports). I don't really understand how
>> this interrupt mapping works now. Please explain it clearly.
>>
> 
> Sorry for the misunderstanding.
> 
> Each ETR device should have its own interrupt line and an IRQ register 
> within the CTCU device, as defined by the specification. In existing 
> projects, the maximum supported number of ETR devices is 2.
> 
> Each interrupt is directly mapped to a specific ETR device, for example:
> tmc@1000 → interrupt line 0
> tmc@1001 → interrupt line 1
> 
> The suggestion to identify devices by ‘ports’ is much clearer than my 
> previous explanation, as it explicitly shows which device is connected 
> to which port.

Thanks for confirming.

> 
>>>>>> +
>>>>>> +  interrupt-names:
>>>>>> +    items:
>>>>>> +      - const: etrirq0
>>>>>> +      - const: etrirq1
>>>>>
>>>>> Names are kind of pointless when it is just foo<index>.
>>>>
>>>> Hi Rob,
>>>>
>>>> I was naming them as etr0/etr1. Are these names acceptable?
>>>
>>> Obviously irq is redundant, but how does etr0 solves the problem of
>>> calling it foo0?
>>>
>>> I don't think you really read Rob's comment.
>>>
>>>> The interrupts are assigned exclusively to a specific ETR device.
>>>>
>>>> But Suzuki is concerned that this might cause confusion because the ETR
>>>> device is named randomly in the driver. Suzuki suggested using ‘port-0’
>>>> and ‘port-1’ and would also like to hear your feedback on these names.
>>>
>>> There is no confusion here. Writing bindings luckily clarifies this what
>>> the indices in the array mean.
>>
>> The point is there are "n" interrupts. Question is, could there be more
>> devices(ETRs) connected to the CTCU than "n".
>>
>> e.g., Lets CTCU can control upto 4 ETRs and on a particular system, the
>>
>> TMC-ETR0 -> CTCU-Port0
>>
>> TMC-ETR1 -> CTCU-Port2
>> TMC-ETR2 -> CTCU-Port3
>>
>> Now, how many interrupts are described in the DT ? How do we map which
>> interrupts correspond to the CTCU-Portn. (Finding the TMC-ETRx back
>> from the port is possible, with the topology).
>>
> 
> Got your point and it's much clearer.
> 
>> This is what I raised in the previous version. Again, happy to hear
>> if there is a standard way to describe the interrupts.
>>
>> Suzuki
>>
>>
>>>
>>>>
>>>> Usually, the probe sequence follows the order of the addresses. In our
>>>> specification, ‘ETR0’ is always probed before ‘ETR1’ because its 
>>>> address
>>>> is lower.
>>>
>>> How is this even relevant? You are answering to something completely
>>> different, so I don't think you really tried to understand review.
>>>
> 
> My previous explanation was definitely unclear. As Suzuki suggested, 
> mapping the interrupt to the port number (to identify the relevant 
> device based on topology) makes sense and provides a much easier way to 
> understand the relationship between the interrupt and the ETR device.
> 
> So with the suggestion, here is the new description about the interrupts:
> 
>    interrupts:
>      items:
>        - description: Interrupt for the ETR device connected to in-port0.
>        - description: Interrupt for the ETR device connected to in-port1.
> 
>   interrupt-names:
>      items:
>       - const: port0
>       - const: port1

Which brings us back to the question I posted in the previous version. 
Do we really need a "name" or are there other ways to define, a sparse
list of interrupts ?

Suzuki


> 
> Thanks,
> Jie
> 
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
> 


