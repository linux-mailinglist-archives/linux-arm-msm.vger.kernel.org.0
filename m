Return-Path: <linux-arm-msm+bounces-27672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1879445B7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECCEE1C222C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 07:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8857085956;
	Thu,  1 Aug 2024 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bajg4sSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4019478;
	Thu,  1 Aug 2024 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498313; cv=none; b=c5abO7waF3TQc5otl/Uax7o4actGicehjmMAJIgtVe4utfjchDHknCPWltvM8Ijx+bdhXN7m++rzMXj7z2U4d7Behou1GIOjxD7pqpahdN/TbqsXcEvV4Jc5ejkQwxMkhWk44Xty9khE39pRaDAkyQy0PLmSdzuzCxZBKKaUL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498313; c=relaxed/simple;
	bh=fjFNt30+/BTVslczQO0aZGNQYAxiraVzAPYh/BdndbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNgZDqeJaYA2qae60pJ7y7r3Z/ztM5zgpP0hEtSyhPYvlD4VsKYo0GVS8HVYdrohFCCvTjoa5vjc8dnrni3xf8bJnxLNVyZorKVAdQuqiOc4bLidrc3AwnSDg+CYfbD8a6DXirhL7yTnzxY4JM/a229sIQGAs6X8DYYZ802o+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bajg4sSS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8217C4AF0A;
	Thu,  1 Aug 2024 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722498312;
	bh=fjFNt30+/BTVslczQO0aZGNQYAxiraVzAPYh/BdndbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bajg4sSSkdkvHKYWr09NWUym5ZJdNpNEWX5SlCD8oobDhwItOHFPTeCyEkwsUsHzG
	 y+eBWj1Xq6OzE/LcASpNeVhYuqJkxQ6fy/fe2X8ONyhpehcZd6OHeqbkGmAhmKB/Uy
	 1nDbGUXdwoQWbndhv/1g4oQ0myxWEJPpxR2DjYMgj3q57B0AB4jG69LD7J1a2n1YWh
	 xZ3mAMc6/dNHKtvfmQ7yiSs5gSo9cqI3pP1L1SrVtaYu0gXbfrg5473msNOiQwlsnQ
	 KRvJXnGLLUnu0gI8bACC5UIdCHhl+/dy6C6ENYBBr+7PVv0hnNIkceM03v/BamLxCU
	 0rtcM33fn8ijQ==
Message-ID: <0b007a32-00be-40ae-9d96-d7a02b4534bf@kernel.org>
Date: Thu, 1 Aug 2024 09:45:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom: eud: Add phy related bindings
To: Elson Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-2-quic_eserrao@quicinc.com>
 <63cf3198-fb79-466f-b80a-024e970e400a@kernel.org>
 <5275651f-4075-4dac-bba0-da88f5836459@quicinc.com>
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
In-Reply-To: <5275651f-4075-4dac-bba0-da88f5836459@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/08/2024 00:23, Elson Serrao wrote:
> 
> 
> On 7/30/2024 10:33 PM, Krzysztof Kozlowski wrote:
>> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>>> Embedded USB Debugger(EUD) being a High-Speed USB  hub needs
>>> HS-Phy support for it's operation. Hence document phy bindings
>>> to support this.
>>>
>>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>>
>> A nit, subject: drop second/last, redundant "bindings". The
>> "dt-bindings" prefix is already stating that these are bindings.
>> See also:
>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>
> Ack
>>> ---
>>>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml       | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>> index f2c5ec7e6437..fca5b608ec63 100644
>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>> @@ -29,6 +29,14 @@ properties:
>>>      description: EUD interrupt
>>>      maxItems: 1
>>>  
>>> +  phys:
>>> +    items:
>>> +      - description: USB2/HS PHY needed for EUD functionality
>>> +
>>> +  phy-names:
>>> +    items:
>>> +      - const: usb2-phy
>>> +
>>>    ports:
>>>      $ref: /schemas/graph.yaml#/properties/ports
>>>      description:
>>> @@ -48,6 +56,8 @@ properties:
>>>  required:
>>>    - compatible
>>>    - reg
>>> +  - phys
>>> +  - phy-names
>>
>> That's an ABI break and nothing in commit msg justified it.
>>
> 
> Hi Krzysztof
> 
> Thank you for the review.
> I see that the only user for EUD as of now is QC sc7280 SoC where phy property

Did you ask all customers and all users of Linux kernel?

> is missing and EUD node is disabled. As described in my cover letter, HS phy
> support is needed for EUD functionality and this is applicable to all SoCs
> where EUD is to be enabled. Hence phy would be a required property.

Nothing in commit msg explained that, but I have a bit hard time to
believe that this never worked. If that's the case, say it explicitly in
commit msg - this was always broken.

> Given that the changes in this series are directly applicable to sc7280 as well,
> I will re-enable/rectify EUD feature on sc7280 SoC first, by adhering it to this binding
> requirement. That would address the ABI break. 

I don't understand what you are saying here.

> Once the base framework is set I shall extend it to sm8450 SoC.


Best regards,
Krzysztof


