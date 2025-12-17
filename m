Return-Path: <linux-arm-msm+bounces-85445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07713CC670E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 08:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 792D030146FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 07:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4FE3358A2;
	Wed, 17 Dec 2025 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqQM4kRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ECB319875;
	Wed, 17 Dec 2025 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765958152; cv=none; b=FAO9kZ6AZrImgqpsLQuiQrK+CQf80vUsGwgjSdmp61Ot076iXtQ+RiUYpS782Yb/HLczFRNQd30uDoohtFlHnNdawZtmAlLfNM/Nvulay52AbKBPGQuV03y8OHTlwH37wUlYkKACnj3mPFdDAeAn4r66GOdAl4FJiTHhXBIBDzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765958152; c=relaxed/simple;
	bh=ew1qpWkFBmwjFCEwQhZJW8KB/TpfiurnB2GhFeqTvrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWp5X8/TaFPmVrrqpSX6uQyCZDBgOIz3QJYbyQgtLSupswdZNq+ZcnJgSml7GofXxi/zVPCu1jxN6xUzh9afYh4VEdAullsMj6KJ5tKjjwvI4y/yG1/k/zOz++PFddqWKglmuLcdOChJ6D/FrThm6XHIEesmMvCD3yKiaJpBEB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqQM4kRL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECDB2C4CEFB;
	Wed, 17 Dec 2025 07:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765958151;
	bh=ew1qpWkFBmwjFCEwQhZJW8KB/TpfiurnB2GhFeqTvrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oqQM4kRLweMj3YY5cGK5J5KkZy+9qYJoV+xO3ZtssRFspto2X8F7uKR9LGgCevV2w
	 dDOFpQFC8nYmDvvhDB+4Q9HtCJQn8Rax63CovRpmsXuDG2Qscpp1DfCvNtR9xJ5iL4
	 MYnZc/Y1R8GE4loaZM3Vj7HKRxfUw3qWW2YG1IIi1Tyveequbgs6PLM7UE17+keJY1
	 c4Yu8Ud31hLkfTi7Q/WgL05wH3IY8+5AIfMk7DFrQVao8gotPSyoOW3wR+A5FUHXWk
	 8gE1Xb7Vh0Al98N9Jf+UZ3+tt6vaUEgxCVKqyz9roB+10sxBBhyDxFrL5Adb8p311T
	 8yNnThA3xZ/oQ==
Message-ID: <a4e0bc9b-1482-49ac-8454-39edeaf3b676@kernel.org>
Date: Wed, 17 Dec 2025 08:55:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema
To: "Alex G." <mr.nuke.me@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, konradybcio@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251210003729.3909663-1-mr.nuke.me@gmail.com>
 <20251210003729.3909663-2-mr.nuke.me@gmail.com>
 <20251216-notorious-omniscient-frog-caceaf@quoll>
 <f38764d7-9d7d-47f4-a099-b6ac6b12be6e@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <f38764d7-9d7d-47f4-a099-b6ac6b12be6e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2025 06:01, Alex G. wrote:
>> Filename based on the compatible, so for example:
>> qcom,ipq8074-wcss-pil.yaml
> Okay.
>>> @@ -0,0 +1,167 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/remoteproc/qcom,ipq9574-wcss-pil.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm IPQ WCSS Peripheral Image Loader
>>> +
>>> +maintainers:
>>> +  - Placeholder Maintainer <placeholder@kernel.org>
>>
>> This must be a real person. Fallback is your SoC maintainer.
> 
> I can't find an official maintainer for IPQ8074 or IPQ9574. I could list 

I don't think you looked then. get_maintainers gives you clear answer.

> myself, but you know a lot about these bindings. Is it okay if I list 
> you as the maintainer of this binding, Krzysztof?

No. I am not the maintainer of this SoC.

> 
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: qdsp6
>>> +      - const: rmb
>>> +
>>> +  interrupts-extended:
>>
>> No, you only need interrupts. Please look at other bindings - how they
>> write this.
> 
> I thought I needed interrupts-extended if the interrupts use more than 
> one interrupt controller. Is that not the case?

Instead of asking the same question again, which would give you the same
answer "No, you only need interrupts" please rather think on the rest of
the answer - look at other bindings.


..


>>> +  qcom,smem-states:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> That's incomplete - missing constraints. Are you sure you wrote this
>> code the same way we already did for other devices?
> 
> I am not sure. It seems to match qcom,qcs404-cdsp-pil.yaml or 

No, it does not.

Look at these files even - they have maxItems. Where do you see maxItems
here? So how this can be done the same way ("match")?

> qcom,wcnss.yaml. What constraints are you expecting here?

So you take the latest binding, e.g. pas-common for all new platforms.
Or qcom,qcs404-cdsp-pil.yaml. You need maxItems here and list of items
for the names.



> 
>>> +    description: States used by the AP to signal the remote processor
>>> +
>>> +  qcom,smem-state-names:
>>> +    description:
>>> +      Names of the states used by the AP to signal the remote processor
>>> +
>>> +  glink-edge:
>>> +    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
>>> +    description:
>>> +      Qualcomm G-Link subnode which represents communication edge, channels
>>> +      and devices related to the Modem.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - interrupts-extended
>>> +  - interrupt-names
>>> +  - memory-region
>>> +  - qcom,halt-regs
>>> +  - qcom,smem-states
>>> +  - qcom,smem-state-names
>>> +
>>> +allOf:
>>
>> Seems you do not reference other schemas. I am going to repeat myself
>> for 10th time: are you sure you followed other devices?
> 
> It's the sixth time, but I see your point. Comparing to 
> qcom,qcs404-cdsp-pil.yaml or qcom,wcnss.yaml, I can't see what's 
> missing. What do I need here?

In previous cases you did not look at other binding, so I am questioning
now everything.

> 
>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,ipq8074-wcss-pil
>>> +    then:
>>> +      properties:
>>> +        qcom,smem-states:
>>> +          items:
>>> +            - description: Shutdown Q6
>>> +            - description: Stop Q6
>>> +        qcom,smem-state-names:
>>> +          items:
>>> +            - const: shutdown
>>> +            - const: stop
>>
>> Missing clocks
> 
> The text binding that this replaces implies no clocks for IPQ8074. What 
> would you like me to add instead?

Disallow the clocks. See example-schema.

> 
>> Missing blank line
>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,qcs404-wcss-pil
>>> +    then:
>>> +      properties:
>>> +        qcom,smem-states:
>>> +          maxItems: 1
>>> +        qcom,smem-state-names:
>>> +          items:
>>> +            - const: stop
>>
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,qcs404-wcss-pil
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 10
>>> +          maxItems: 10
>>> +        clock-names:
>>> +          items:
>>> +            - const: xo
>>> +            - const: gcc_abhs_cbcr
>>> +            - const: gcc_axim_cbcr
>>> +            - const: lcc_ahbfabric_cbc
>>> +            - const: tcsr_lcc_cbc
>>> +            - const: lcc_abhs_cbc
>>> +            - const: lcc_tcm_slave_cbc
>>> +            - const: lcc_abhm_cbc
>>> +            - const: lcc_axim_cbc
>>> +            - const: lcc_bcr_sleep
>>
>> All this goes to previous if.
> 
> Okay
> 
>>> +      required:
>>> +        - clocks
>>> +        - clock-names
>>> +        - cx-supply
>>> +
>>> +additionalProperties: false
>>
>> Missing example.
> 
> I plan to add the example in the next patch in the series that adds 
> IPQ9547 binding. I don't have the resources to test IPQ8074 or QCS404, 
> and I want to be sure that the example I add is tested.

I don't understand what example has anything to do with testing. We
speak here ONLY about this binding. I do not review other code. This
patch should have the example, but if you cannot come with one, because
it does not exist in any existing sources, then you should just say
that. You have entire commit msg to explain every unusual thing. And
testing something on a device is not a reason, because you do not test
the binding on a device.


Best regards,
Krzysztof

