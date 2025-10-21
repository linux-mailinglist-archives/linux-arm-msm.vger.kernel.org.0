Return-Path: <linux-arm-msm+bounces-78210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CEFBF838E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 21:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E550A4E2124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 19:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C6834A3C9;
	Tue, 21 Oct 2025 19:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSDc+/uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23C1F936;
	Tue, 21 Oct 2025 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074361; cv=none; b=kxZVC0/byM9Qbn5YU6Y3x9BECX9Xd1g3x9q00FWmv1BFV2sRqV5dZ28FFmtASBfO4ci2dyJ2dkc9ull8F7oFBv1mHbxPSaRnqbqPcrc05lIDANl7IyLf/KcqGHAXnXoriXcwAUC4YTr7JcmKOCDl/lgumKuhyCok1ijMgLGmPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074361; c=relaxed/simple;
	bh=pWyFoPwNpfIEUwiiETXv/ApplcO4w46GMcOHiVnAie8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAdh0yUFkTPxcmJy91OJDcdmUAk8ms5qY5QXOFcpaepQmlJIVAkY00PsHPA8YgwZyGS9RWaVqs3vqe/tasObe0iHIFoLx85dda1MhlAgcuSag7dz3z8bb4airmsPBSvVXW2t371pA3V9tAdK8d8vdFfMkA73Z8U/cUgwXBwmYRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSDc+/uq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50F4C4CEF1;
	Tue, 21 Oct 2025 19:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761074361;
	bh=pWyFoPwNpfIEUwiiETXv/ApplcO4w46GMcOHiVnAie8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tSDc+/uq6EqEWPHzBCDcO9XR/CDsTS0e2IOthPHZI77ZgMq3jsIsyJRGs0Mcpz5vE
	 gpbakkD+zz7vb/tcl4eF/a98gtUzBmDeGkInfm86gwbJFFbDnb3226+y07LIRUafX7
	 Pdvjfdme04aQ1a24/x5POXnvUdwInbKILv/6E3TwOXr1Y6khWS2xvULoqjqsYfE+1I
	 MlNWBpN/+H200wxgTu/nhXu7xuz6zyABWectLx7K8UjaPMtJUbh+XdfcPgkL6FAw76
	 QnyIPELQFj9pa5wS+XWB4naU8BBGdaynTww39FipfjekPR3QF9scAfzJ0JljCsr3Jl
	 J+z4hdEUYon8w==
Message-ID: <ff37b635-b3dc-4180-8eae-e798ef6ce55a@kernel.org>
Date: Tue, 21 Oct 2025 21:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display/msm/gmu: Document A612 RGMU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
 <20251017-qcs615-spin-2-v1-3-0baa44f80905@oss.qualcomm.com>
 <8f3f4874-2e82-473e-87bd-e3bd58089b90@kernel.org>
 <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <181af756-09a1-4694-98c4-53cea556e172@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2025 17:51, Akhil P Oommen wrote:
> On 10/19/2025 2:43 PM, Krzysztof Kozlowski wrote:
>> On 17/10/2025 19:08, Akhil P Oommen wrote:
>>> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
>>> with the sole purpose of providing IFPC (Inter Frame Power Collapse)
>>> support. Compared to GMU, it doesn't manage GPU clock, voltage
>>> scaling, bw voting or any other functionalities. All it does is detect
>>> an idle GPU and toggle the GDSC switch. As it doesn't access DDR space,
>>> it doesn't require iommu.
>>>
>>> So far, only Adreno 612 GPU has an RGMU core. Document RGMU in the GMU's
>>> schema.
>>>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  .../devicetree/bindings/display/msm/gmu.yaml       | 98 +++++++++++++++++-----
>>>  1 file changed, 79 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> index afc1879357440c137cadeb2d9a74ae8459570a25..a262d41755f09f21f607bf7a1fd567f386595f39 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
>>> @@ -26,6 +26,9 @@ properties:
>>>        - items:
>>>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>>>            - const: qcom,adreno-gmu
>>> +      - items:
>>> +          - const: qcom,adreno-rgmu-612.0
>>> +          - const: qcom,adreno-rgmu
>>>        - const: qcom,adreno-gmu-wrapper
>>>  
>>>    reg:
>>> @@ -45,24 +48,30 @@ properties:
>>>      maxItems: 7
>>>  
>>>    interrupts:
>>> -    items:
>>> -      - description: GMU HFI interrupt
>>> -      - description: GMU interrupt
>>
>>
>> Both stay, just explain what is the first interrupt. You should not drop
>> descriptions here. Look at every other binding - of course except that
>> terrible Adreno GPU which is anti-example.
> 
> Do you mean we should use a OneOf and list both combo? Or elaborate the
> description of the first interrupt to include OOB too? Something like:
> 
> - description: HFI interrupt on GMU and OOB interrupt on RGMU.

Yes, like that.

> 
> Sorry, I am a bit confused.
> 
>>
>>> +    minItems: 2
>>> +    maxItems: 2
>>>  
>>>    interrupt-names:
>>> -    items:
>>> -      - const: hfi
>>> -      - const: gmu
>>> +    oneOf:
>>> +      - items:
>>> +          - const: hfi
>>> +            description: GMU HFI interrupt
>>
>> No, descriptions never go to xxx-names, but to xxx.
>>
>>> +          - const: gmu
>>> +            description: GMU interrupt
>>> +      - items:
>>> +          - const: oob
>>> +            description: GMU OOB interrupt
>>> +          - const: gmu
>>> +            description: GMU interrupt
>>> +
>>>  
>>>    power-domains:
>>> -    items:
>>> -      - description: CX power domain
>>> -      - description: GX power domain
>>> +    minItems: 2
>>> +    maxItems: 3
>>
>> No.
> I will keep the 'description'. Here, RGMU has 3 power domains instead of
> 2. I suppose we should add the description for the 3rd power domain here
> and keep 'minItems: 2' property to override the default 3?

Yes.

> 
>>
>>>  
>>>    power-domain-names:
>>> -    items:
>>> -      - const: cx
>>> -      - const: gx
>>> +    minItems: 2
>>> +    maxItems: 3
>>
>>
>> No. Why?
> Same as above.
> 
>>
>>>  
>>>    iommus:
>>>      maxItems: 1
>>> @@ -86,6 +95,44 @@ required:
>>>  additionalProperties: false
>>>  
>>>  allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: qcom,adreno-rgmu-612.0
>>> +    then:
>>> +      properties:
>>> +        reg:
>>> +          items:
>>> +            - description: Core RGMU registers
>>> +        reg-names:
>>> +          items:
>>> +            - const: gmu
>>> +        clocks:
>>> +          items:
>>> +            - description: GMU clock
>>> +            - description: GPU CX clock
>>> +            - description: GPU AXI clock
>>> +            - description: GPU MEMNOC clock
>>> +            - description: GPU SMMU vote clock
>>> +        clock-names:
>>> +          items:
>>> +            - const: gmu
>>> +            - const: cxo
>>> +            - const: axi
>>> +            - const: memnoc
>>> +            - const: smmu_vote
>>> +        power-domains:
>>> +          items:
>>> +            - description: CX power domain
>>> +            - description: GX power domain
>>> +            - description: VDD_CX power domain
>>> +        power-domain-names:
>>> +          items:
>>> +            - const: cx
>>> +            - const: gx
>>> +            - const: vdd_cx
>>
>> This does not make even sense. Why did you remove the the common list
>> from  power-domain-names?
>>
>>> +
>>>    - if:
>>>        properties:
>>>          compatible:
>>> @@ -313,13 +360,26 @@ allOf:
>>>            items:
>>>              - const: gmu
>>>      else:
>>> -      required:
>>> -        - clocks
>>> -        - clock-names
>>> -        - interrupts
>>> -        - interrupt-names
>>> -        - iommus
>>> -        - operating-points-v2
>>> +      if:
>>> +        properties:
>>> +          compatible:
>>> +            contains:
>>> +              const: qcom,adreno-rgmu
>>> +      then:
>>> +        required:
>>> +          - clocks
>>> +          - clock-names
>>> +          - interrupts
>>> +          - interrupt-names
>>> +          - operating-points-v2
>>> +      else:
>>
>> No. Don't nest multiple ifs.
> 
> I guess we should split this. I will add a 'required' constraint to the
> rgmu constraints above. And apply the below 'required' constraint
> specifically to 'qcom,adreno-gmu' instead of the 'else' fallback case.
> 
> Please let me know if you have any suggestion.

Maybe the binding is getting to complicated and RGMU should have its own.


Best regards,
Krzysztof

