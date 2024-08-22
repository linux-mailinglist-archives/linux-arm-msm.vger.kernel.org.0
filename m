Return-Path: <linux-arm-msm+bounces-29260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DF495B26F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 11:55:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91FCD1F21791
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B40175D5F;
	Thu, 22 Aug 2024 09:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXX4zrl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E6313A3F2;
	Thu, 22 Aug 2024 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724320552; cv=none; b=lq7jN414Uvi9wDFn8kF5LaUGWYS32B6GXEOUkPkHG9VpisWHcgHh/ZJtlq3s0uxM0f3OKEJJsqgqDpTeF08t2i9WNe3ZOyQ6ZqVpFdy5Qn7Q0ejGxug6xUpA5RCemR111GYzkSVAaQlMCXL/HbrZiuGI1Noq74UEz7ToNXCiR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724320552; c=relaxed/simple;
	bh=ViprO3gDNUk5DkzxK1abOXekExxNqv0cNOF2GS0EpfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFr3DCoecXI5blEpVE+6upXEjFvCNmATIXXL+wy2/U3mtxvrDldVL9HRhXXxxde8H76y+uPiZkXUq+bivkmEq9YxDmtekx8hjYhkFZeLZzQqayQIS4o+E2832ggbSjYWMX/JCvqmXVBy0d/vVUXCoBNF4oqzzlpprMHQg9eLZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXX4zrl5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB23C4AF0B;
	Thu, 22 Aug 2024 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724320551;
	bh=ViprO3gDNUk5DkzxK1abOXekExxNqv0cNOF2GS0EpfY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eXX4zrl5CG3va68oJotDM7mvlxscrCBWAJHr0N0p8cerBsLP2xtPJDVvCByoSCZNx
	 ddQJOdm8PTr3AaqXZ2QIN2ogY5D644w4y7kYaqN28Y19khGFFXm9ieo+zEwVZb0WNg
	 vbwYTR+XORD6OOJtMNB76oT+RO2Q71ClGrofQOks5/T06m7LtJJAuNosWhsK7r/vMJ
	 lNaJ/mrDAaz4doAqVDv9YzFpdizVdNvhKsYTeg8MsjbT9FBev4ye/tFG1NKA7GdTD6
	 LZ6oOu+gOIIRQ0RvV/jHDgf3w1MGfLBo4orMCobVmLFdmqQVwNZJsXqrg9zakmfJI4
	 5ilHwwy1yZEdA==
Message-ID: <89690fa9-fb7f-4f9f-aeac-0f8cb22572a3@kernel.org>
Date: Thu, 22 Aug 2024 11:55:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit
 hardware
To: JieGan <quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, Song Chai <quic_songchai@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
 <20240812024141.2867655-4-quic_jiegan@quicinc.com>
 <20240818142834.GA27754-robh@kernel.org>
 <ZsKkm/Pz0GYtH2Gl@jiegan-gv.ap.qualcomm.com>
 <9d9704ed-6ef8-4920-9874-29e0a815e2ba@kernel.org>
 <ZsMHnKKvOey4SA1O@jiegan-gv.ap.qualcomm.com>
 <d117e157-f2e2-4e17-bbe4-b84001eae1bb@kernel.org>
 <ZsQ5aMkXnyX9mumz@jiegan-gv.ap.qualcomm.com>
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
In-Reply-To: <ZsQ5aMkXnyX9mumz@jiegan-gv.ap.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/08/2024 08:36, JieGan wrote:
> On Mon, Aug 19, 2024 at 11:51:41AM +0200, Krzysztof Kozlowski wrote:
>> On 19/08/2024 10:51, JieGan wrote:
>>> On Mon, Aug 19, 2024 at 08:25:33AM +0200, Krzysztof Kozlowski wrote:
>>>> On 19/08/2024 03:49, JieGan wrote:
>>>>> On Sun, Aug 18, 2024 at 08:28:34AM -0600, Rob Herring wrote:
>>>>>> On Mon, Aug 12, 2024 at 10:41:39AM +0800, Jie Gan wrote:
>>>>>>> Add binding file to specify how to define a Coresight TMC
>>>>>>> Control Unit device in device tree.
>>>>>>>
>>>>>>> It is responsible for controlling the data filter function
>>>>>>> based on the source device's Trace ID for TMC ETR device.
>>>>>>> The trace data with that Trace id can get into ETR's buffer
>>>>>>> while other trace data gets ignored.
>>>>>>>
>>>>>>> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
>>>>>>> ---
>>>>>>>  .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
>>>>>>>  1 file changed, 79 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..7a9580007942
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>>>>>>> @@ -0,0 +1,79 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: CoreSight TMC Control Unit
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
>>>>>>> +  - Mao Jinlong <quic_jinlmao@quicinc.com>
>>>>>>> +  - Jie Gan <quic_jiegan@quicinc.com>
>>>>>>> +
>>>>>>> +description:
>>>>>>> +  The Coresight TMC Control unit controls various Coresight behaviors.
>>>>>>> +  It works as a helper device when connected to TMC ETR device.
>>>>>>> +  It is responsible for controlling the data filter function based on
>>>>>>> +  the source device's Trace ID for TMC ETR device. The trace data with
>>>>>>> +  that Trace id can get into ETR's buffer while other trace data gets
>>>>>>> +  ignored.
>>>>>>
>>>>>> Nowhere is TMC defined.
>>>>> The Coresight TMC control unit(CTCU) connected to Coresight TMC device via replicator and
>>>>> works as a helper device to TMC device.
>>>>
>>>> Did you understand the feedback or just responding with whatever to get
>>>> rid of reviewers?
>>>
>>> Sorry for the insufficient clarity in my response, I am just misunderstood the feedback and try
>>> to explain the relationship between TMC and CTCU device.
>>>
>>> I will add the TMC description to explain what TMC is as shown below:
>>> The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB), Embedded Trace FIFO(ETF)
>>> and Embedded Trace Router(ETR) configurations. The configuration mode (ETB, ETF, ETR) is
>>> discovered at boot time when the device is probed.
>>
>> Thanks.
>>
>>>
>>>>
>>>>>
>>>>> The in-ports listed below illustrate their connection to TMC devices.
>>>>>
>>>>>>
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    enum:
>>>>>>> +      - qcom,sa8775p-ctcu
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  clocks:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    items:
>>>>>>> +      - const: apb
>>>>>>> +
>>>>>>> +  in-ports:
>>>>>>
>>>>>> Use 'ports' unless you have both in and out ports.
>>>>> The ‘in-ports’ and ‘out-ports’ properties will be parsed by ‘of_coresight_get_port_parent’
>>>>> and their relationships to other devices will be stored in the coresight_platform_data structure.
>>>>>
>>>>> for example:
>>>>> struct coresight_platform_data {
>>>>> 	int nr_inconns;
>>>>> 	int nr_outconns;
>>>>> 	struct coresight_connection **out_conns;
>>>>> 	struct coresight_connection **in_conns;
>>>>> };
>>>>>
>>>>> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147
>>>>
>>>> and? If you respond with some unrelated argument, we will respond with
>>>> the same: Use 'ports' unless you have both in and out ports.
>>>
>>> Sorry for the insufficient response.
>>>
>>> The Coresight driver prefers using ‘in-ports’ and ‘out-ports’ instead of the ‘ports’ property, as each
>>> Coresight component needs to specify its input and output directions.
>>>
>>> The Coresight system operates by integrating all Coresight components and construting its data flow path
>>> based on the defined directions. 
>>>
>>> Consequently, the data flow direction cannot be determined when utilizing the ‘ports’ property in the
>>> Coresight system.
>>
>> It can be determined. Driver knows that there are only in-ports, so you
>> cannot have here other direction. Maybe the drivers have somehow this
>> hard-coded? But that's a bit annoying limitation.
>>
> In Coresight platform driver, the of_coresight_get_port_parent function is used to retrieve the parent of the 'ports' node.
> The function is specifically hard-coded to recognize 'in-ports' and 'out-ports'. I think that's the limitation for
> 'ports' property.
> 
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hwtracing/coresight/coresight-platform.c#L147

That's a limitation of coresight platform driver, not bindings. Fix your
drivers.

Best regards,
Krzysztof


