Return-Path: <linux-arm-msm+bounces-35561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D19AC0BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 09:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF7E1C21344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 07:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349E1155A25;
	Wed, 23 Oct 2024 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fB1FBom5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01278156222;
	Wed, 23 Oct 2024 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670014; cv=none; b=qVjo7aJPSs5KlB57NrWgmX3mU/rJJNje58qFvYMbqdWre8rR6nb6Xho1jtTlm65xAz8kileFBXWC8ZBwscSoPnznpVAvRYQutR3z+4cHOSyPX0sW+pDe35vWCZf+syqgibz4IOr+VoD7NgzQwQKyvn8dRw+6keiUNOd8k33VX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670014; c=relaxed/simple;
	bh=gvFaxArGPX2eO1te5g129vk1aWhR0NTedPOo0h1Yzwg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HOXzwHYLPbfXp11CkmQm6ushq+r3QoEcG/9l6LwmDkJf0yUeQgdSWecVb0M9B7vepiR2Kfjn7uJf7Y+rDC+U3WhasDsvHxeS8SxoZiLG9v50QmuUnBBlqvWMObNPjYAUsNXR5+lETYoQIw/fOi7G4v+iA8TCYydBBAGlvtpPunA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fB1FBom5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2EBC4CEC6;
	Wed, 23 Oct 2024 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729670013;
	bh=gvFaxArGPX2eO1te5g129vk1aWhR0NTedPOo0h1Yzwg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=fB1FBom5I9KH2SRqx3/yPu0/Pruor2ub+H3UtcrxDL0ULzaLUg5VS5P0PV4aA5UiT
	 kX8Fa0s+tv8whDz+dltRBaJ13aVtwbiT9ck8WJWofUrAACZltpefqcIdsYdHoMWgSe
	 foAPabLcZwYTBx4EI2gnXXGMjkwYiK2HIigS4fOsETgutv/iq7I2ShzwSy0+vjkcJs
	 wpXPI8Gts/ypds5UN4d8Hk/jRsttbSv85lp5mFTblhqCyhjL10nx06zNNVhxBhmIbt
	 prYjceaxxYttLS2QAirEvhoQbxdypepE37For79jB1rGOKGvYpPMEbUeMgI6Ye2I1k
	 yAXiq2a1ReDqw==
Message-ID: <4c32bc67-591f-4bb5-ae4f-11e802c27ac5@kernel.org>
Date: Wed, 23 Oct 2024 09:53:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: wcd937x-sdw: Add static channel
 mapping support
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, kernel@quicinc.com
References: <20241023061326.3871877-1-quic_mohs@quicinc.com>
 <20241023061326.3871877-2-quic_mohs@quicinc.com>
 <qzjbiby7w6a7m4e324hdatgklmejlcxfwv7tszzfmdqahgrbu2@bcwsdlrpncxq>
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
In-Reply-To: <qzjbiby7w6a7m4e324hdatgklmejlcxfwv7tszzfmdqahgrbu2@bcwsdlrpncxq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/10/2024 09:52, Krzysztof Kozlowski wrote:
> On Wed, Oct 23, 2024 at 11:43:23AM +0530, Mohammad Rafi Shaik wrote:
>> Add static channel mapping between master and slave rx/tx ports for
>> Qualcomm wcd937x soundwire codec.
>>
>> Currently, the channel mask for each soundwire port is hardcoded in the
>> wcd937x-sdw driver, and the same channel mask value is configured in the
>> soundwire master.
>>
>> The Qualcomm boards like the QCM6490-IDP require different channel mask settings
>> for the soundwire master and slave ports.
> 
> Different than what? Other wcd937x? Which are these?
> 
>>
>> With the introduction of the following channel mapping properties, it is now possible
>> to configure the master channel mask directly from the device tree.
>>
>> The qcom,tx-channel-mapping property specifies the static channel mapping between the slave
>> and master tx ports in the order of slave port channels which is adc1, adc2, adc3, adc4,
>> dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
> 
> I still don't get what is the channel here.
> 
>>
>> The qcom,rx-channel-mapping property specifies static channel mapping between the slave
>> and master rx ports in the order of slave port channels which is hph_l, hph_r, clsh,
>> comp_l, comp_r, lo, dsd_r, dsd_l.
> 
> And this description copies binding :/.
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
>>
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> ---
>>  .../bindings/sound/qcom,wcd937x-sdw.yaml      | 36 +++++++++++++++++++
>>  1 file changed, 36 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> index d3cf8f59cb23..a6bc9b391db0 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x-sdw.yaml
>> @@ -58,6 +58,38 @@ properties:
>>      items:
>>        enum: [1, 2, 3, 4, 5]
>>  
>> +  qcom,tx-channel-mapping:
>> +    description: |
>> +      Specifies static channel mapping between slave and master tx port
>> +      channels.
>> +      In the order of slave port channels which is adc1, adc2, adc3, adc4,
>> +      dmic0, dmic1, mbhc, dmic2, dmic3, dmci4, dmic5, dmic6, dmic7.
>> +      ch_mask1 ==> bit mask value 1
>> +      ch_mask2 ==> bit mask value 2
>> +      ch_mask3 ==> bit mask value 4
>> +      ch_mask4 ==> bit mask value 8
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 8
>> +    maxItems: 13
> 
> Why size is variable? This device has fixed amount of slave ports, I
> think.
> 
>> +    items:
>> +      enum: [1, 2, 4, 8]
> 
> What is the point of using bits if you cannot actually create a bit mask
> out of it? Why this cannot be 7?
> 
>> +
>> +  qcom,rx-channel-mapping:
>> +    description: |
>> +      Specifies static channels mapping between slave and master rx port
>> +      channels.
>> +      In the order of slave port channels, which is
>> +      hph_l, hph_r, clsh, comp_l, comp_r, lo, dsd_r, dsd_l.
>> +      ch_mask1 ==> bit mask value 1
>> +      ch_mask2 ==> bit mask value 2
>> +      ch_mask3 ==> bit mask value 4
>> +      ch_mask4 ==> bit mask value 8
> 
> and the value is what exactly? Index is channel, but what does "ch_mask4 ==> bit
> mask value 8" mean? I don't understand this at all.

Ah, and previous feedback was to use strings, no?

Best regards,
Krzysztof


