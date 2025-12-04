Return-Path: <linux-arm-msm+bounces-84330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF4CA2FBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 10:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB29B3063858
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 09:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2046B336EE2;
	Thu,  4 Dec 2025 09:22:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EEB330D42;
	Thu,  4 Dec 2025 09:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840166; cv=none; b=qcJqTkrNjX30tpuIg8xPZaapF/9FxUMJ3mNlPeqR4HBIKUZHgkNWuA83dl2ljBRXJBBq8Ld6R9qEXGOEBdIggvhFL6wNS/y0PxOz4YurxTPuxD7NnBuK9v9nVExZsDybpXwE8l4Imvfn+8xxMRDEC/2tL/eF9M8WkxKDNtlWpqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840166; c=relaxed/simple;
	bh=q7LgwxAVgtoqClERXHZrs1Rf8bxRHrkWcIZ2YuhiTlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDb527Nh5+lL9leO6zMGluX+uXLFbp29mfyBcY0rbcJvB0hh5tokmzQatqz0z2zEGXqSRtZBusMkdt7JrcWFxsHn74/2q32pKAX7J1vB6XS2/gBiiqkWSs37xKTF1gb999lX8LGOa2y+r9kIXyUC2Coq+gJSCG1tzIoH4vCBI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7296339;
	Thu,  4 Dec 2025 01:22:34 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 234933F59E;
	Thu,  4 Dec 2025 01:22:40 -0800 (PST)
Message-ID: <9c00516c-6e07-4c57-a1f1-6dfc32ab3a53@arm.com>
Date: Thu, 4 Dec 2025 09:22:38 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
 <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
 <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <5a0e4abf-9e7f-4ef9-af02-dd6e34f5cfa8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/12/2025 02:53, Jie Gan wrote:
> 
> 
> On 12/4/2025 2:14 AM, Suzuki K Poulose wrote:
>> On 08/09/2025 03:01, Jie Gan wrote:
>>> Add an interrupt property to CTCU device. The interrupt will be 
>>> triggered
>>> when the data size in the ETR buffer exceeds the threshold of the
>>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL 
>>> register
>>> of CTCU device will enable the interrupt.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 ++++++ 
>>> + ++++++++++
>>>   1 file changed, 17 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>>> ctcu.yaml
>>> index 843b52eaf872..ea05ad8f3dd3 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>> @@ -39,6 +39,16 @@ properties:
>>>       items:
>>>         - const: apb
>>> +  interrupts:
>>> +    items:
>>> +      - description: Byte cntr interrupt for etr0
>>> +      - description: Byte cntr interrupt for etr1
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: etr0
>>> +      - const: etr1
>>
> 
> Hi Suzuki,
> 
>> Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
>> especially with the Linux driver naming things randomly for the TMC-ETRs.
>>
> 
> Yes, it will cause misunderstandings since the "etr0" here may not the 
> right device we are expecting.
> 
>>
>> What we want is the "port" number corresponding to the "TMC-ETR" being
>> monitored ?
>>
>> Have you explored other options, "port-0", "port-1" ?
>>
> 
> I think it's much better. Will update in next version.

I am not sure if there exists a better scheme for identifying or
numbering the interrupts. Happy to listen to the DT experts.

Rob, Krzysztof, thoughts ?

Suzuki


> 
> Thanks,
> Jie
> 
>> Suzuki
>>
>>> +
>>>     in-ports:
>>>       $ref: /schemas/graph.yaml#/properties/ports
>>> @@ -56,6 +66,8 @@ additionalProperties: false
>>>   examples:
>>>     - |
>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>>       ctcu@1001000 {
>>>           compatible = "qcom,sa8775p-ctcu";
>>>           reg = <0x1001000 0x1000>;
>>> @@ -63,6 +75,11 @@ examples:
>>>           clocks = <&aoss_qmp>;
>>>           clock-names = "apb";
>>> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
>>> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
>>> +        interrupt-names = "etr0",
>>> +                          "etr1";
>>> +
>>>           in-ports {
>>>               #address-cells = <1>;
>>>               #size-cells = <0>;
>>>
>>
>>
> 


