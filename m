Return-Path: <linux-arm-msm+bounces-30373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D232967FE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 09:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8F5D2814E4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 07:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB1415381A;
	Mon,  2 Sep 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0x3wCJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DB732C85;
	Mon,  2 Sep 2024 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725260548; cv=none; b=UlfVQv51c0BG5fl0NMMAqApvadyhrgoie8iGBmSFyODQRv84VJHi2lSbo4C9ixtb1GurxPnZkiAxiT6G7nxg8lFRU1fAW5lMpj5Bl6J6Q9kpYDKPGwP+UYK2w679TzDGGLcrlBU7Nuzd7DHkpiaQvGEuqWMFSSsvWwS/5E4IMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725260548; c=relaxed/simple;
	bh=NQyR548cxB2tzzv6MPgGYmDf3REvIzYPst0ZvmaPQ8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OS+JVdrjeKYPjCA4iCQFZx9jfR1vapUgCgXlIWxIvmFwe432IdzTF/Dwvc6ZQ0jNprgIEGFcdGSUiWmg33pGjo8jufHLqMj791gmYPi90xgabqyOzdMLoULdSj+WBLLIOLlbVXG6+K/btrHU50RDvYgMjWYQvLRybRQ63oHYZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0x3wCJh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B0C4CEC2;
	Mon,  2 Sep 2024 07:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725260548;
	bh=NQyR548cxB2tzzv6MPgGYmDf3REvIzYPst0ZvmaPQ8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o0x3wCJhMuOlHzpK1vfhjzAUprEFjALPFU3vqOocbCTw2+Z/kkDFil6/4CXD8fi3v
	 3tL1nQ5CTHXILxrSGConCKLHPRLmRfRP/qy+deky2Acn5e0eK3+ZgulM/qvWNs/iDK
	 3f+TQEk5W/SDCJANDI1PMJ6rAad3f12sEu9Qs4vNxIuhrhRNAX5bpxolaWetRvXkj7
	 hNc2dJ9Titzw7tzyW+d+dCR3UlOUcJwJ6LX8DGGOtO5L9wAwgfsYY1rbubKaf0vZOB
	 VOiidM/tOLwxkLn9IMS+4kasl807OaTcuYU7XCJqFgBVSogB+WVacDwwCEAs48cq/7
	 iW+4+6hPk3oWA==
Message-ID: <d4e424f0-5485-4ccc-83e1-d1eb3008af9f@kernel.org>
Date: Mon, 2 Sep 2024 09:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: Add support for Coresight TGU
 trace
To: songchai <quic_songchai@quicinc.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240830092311.14400-1-quic_songchai@quicinc.com>
 <20240830092311.14400-2-quic_songchai@quicinc.com>
 <0a79b9df-4ca4-4dc8-9930-3fa1dc7d3174@kernel.org>
 <65732921-988f-41f7-886e-94415b07608e@quicinc.com>
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
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
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
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <65732921-988f-41f7-886e-94415b07608e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/09/2024 05:14, songchai wrote:
> 
> On 8/30/2024 6:11 PM, Krzysztof Kozlowski wrote:
>> On 30/08/2024 11:23, songchai wrote:
>>> The Trigger Generation Unit (TGU) is designed to detect patterns or
>>> sequences within a specific region of the System on Chip (SoC). Once
>>> configured and activated, it monitors sense inputs and can detect a
>>> pre-programmed state or sequence across clock cycles, subsequently
>>> producing a trigger.
>>>
>>>     TGU configuration space
>>>          offset table
>>>   x-------------------------x
>>>   |                         |
>>>   |                         |
>>>   |                         |                           Step configuration
>>>   |                         |                             space layout
>>>   |   coresight management  |                           x-------------x
>>>   |        registers        |                     |---> |             |
>>>   |                         |                     |     |  reserve    |
>>>   |                         |                     |     |             |
>>>   |-------------------------|                     |     |-------------|
>>>   |                         |                     |     | prioroty[3] |
>>>   |         step[7]         |<--                  |     |-------------|
>>>   |-------------------------|   |                 |     | prioroty[2] |
>>>   |                         |   |                 |     |-------------|
>>>   |           ...           |   |Steps region     |     | prioroty[1] |
>>>   |                         |   |                 |     |-------------|
>>>   |-------------------------|   |                 |     | prioroty[0] |
>>>   |                         |<--                  |     |-------------|
>>>   |         step[0]         |-------------------->      |             |
>>>   |-------------------------|                           |  condition  |
>>>   |                         |                           |             |
>>>   |     control and status  |                           x-------------x
>>>   |           space         |                           |             |
>>>   x-------------------------x                           |Timer/Counter|
>>>                                                         |             |
>>> 						       x-------------x
>>> TGU Configuration in Hardware
>>>
>>> The TGU provides a step region for user configuration, similar
>>> to a flow chart. Each step region consists of three register clusters:
>>>
>>> 1.Priority Region: Sets the required signals with priority.
>>> 2.Condition Region: Defines specific requirements (e.g., signal A
>>> reaches three times) and the subsequent action once the requirement is
>>> met.
>>> 3.Timer/Counter (Optional): Provides timing or counting functionality.
>>>
>>> Add a new coresight-tgu.yaml file to describe the bindings required to
>>> define the TGU in the device trees.
>>>
>>> Signed-off-by: songchai<quic_songchai@quicinc.com>
>> It feels like you are using login name as real name. Please investigate
>> this and confirm whether latin transcription/transliteration of your
>> name is like above.
> yes.. it's my login name. Will use my real name in next version.
>>
>>> ---
>>>   .../bindings/arm/qcom,coresight-tgu.yaml      | 136 ++++++++++++++++++
>>>   1 file changed, 136 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>> new file mode 100644
>>> index 000000000000..c261252e33e0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tgu.yaml
>>> @@ -0,0 +1,136 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +# Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>> +%YAML 1.2
>>> +---
>>> +$id:http://devicetree.org/schemas/arm/qcom,coresight-tgu.yaml#
>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Trigger Generation Unit - TGU
>>> +
>>> +description: |
>>> +  The Trigger Generation Unit (TGU) is a Data Engine which can be utilized
>>> +  to sense a plurality of signals and create a trigger into the CTI or
>>> +  generate interrupts to processors. The TGU is like the trigger circuit
>>> +  of a Logic Analyzer.The corresponding trigger logic can be realized by
>>> +  configuring the conditions for each step after sensing the signal.
>>> +  Once setup and enabled, it will observe sense inputs and based upon
>>> +  the activity of those inputs, even over clock cycles, may detect a
>>> +  preprogrammed state/sequence and then produce a trigger or interrupt.
>>> +
>>> +  The primary use case of the TGU is to detect patterns or sequences on a
>>> +  given set of signals within some region of the SoC.
>>> +
>>> +maintainers:
>>> +  - Mao Jinlong<quic_jinlmao@quicinc.com>
>>> +  - Sam Chai<quic_songchai@quicinc.com>
>>> +
>>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>>> +select:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        enum:
>>> +          - qcom,coresight-tgu
>>> +  required:
>>> +    - compatible
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^tgu(@[0-9a-f]+)$"
>> Drop the pattern (and anyway @ is not optional).
> 
> There will be several TGUs in the SoC, and we want to use the address of 
> each to distinguish them.

How is this related?

> 
> This is why we added the nodename pattern here.

How is this related?

> 
> Additionally, I noticed that both TPDM and CTI also use this format to 
> define the nodename.
> 
> Could you please share any concerns you have about using this pattern?

I don't get why you insist, but sure:
The name does not follow DT spec recommendation, plus child schema is
not really supposed to define the names.

> 
>>
>>> +  compatible:
>>> +    items:
>>> +      - const: qcom,coresight-tgu
>>> +      - const: arm,primecell
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: apb_pclk
>>> +
>>> +  qcom,tgu-steps:
>>> +    description:
>>> +      The trigger logic is realized by configuring each step after sensing
>>> +      the signal. The parameter here is used to describe the maximum of steps
>>> +      that could be configured in the current TGU.
>> Why this is board or SoC level property? All below also feel like
>> unnecessary stuff from downstream.
> 
> There are actually four properties used to describe the number of 
> registers with different functionality for TGUs at the SoC level.
> 
> Each TGU may have a different number of registers, so we need to add 
> these four properties to describe each TGU’s hardware design.

Each TGU on the same SoC?



Best regards,
Krzysztof


