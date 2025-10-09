Return-Path: <linux-arm-msm+bounces-76736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD5BCAC7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C9D719E320D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B029426D4CD;
	Thu,  9 Oct 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6/NDhBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8098F212549;
	Thu,  9 Oct 2025 20:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041168; cv=none; b=HKLlKDdD6umF738RenJZ8tAeBUjTNiiOd99YC4SgGwfOJWDEFdCKAWE6D9ZicJFyiK8r0u50nw3q9fHZABUr7fltCRjumldaHOz3aOYVAN2LJdEQeu8anWJvWAgVJGDhBYSTFbLNCrPImqUAUex8gHB8ujPzp9M6CuZjQOMTJOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041168; c=relaxed/simple;
	bh=FtmEL4tlPFiNdEIWPJyHFeHJfy9dRLCseRsfZkLpp4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dd5/MmYKxzaEDXpRDz8JIQiwHkkS8coK+M0D2wI9mrRGrXdUx2af6jeqrXXeNXU0nn6M3yTfWj2KvPuao2vczPUBrBxH/EeBlwZwdPuMRhNrnQ0779a3hwF6uofTgD8emtreIFbiNCeg/aHJADGjlB7xdTtra1zY57cutWDeXJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6/NDhBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791C7C4CEE7;
	Thu,  9 Oct 2025 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760041168;
	bh=FtmEL4tlPFiNdEIWPJyHFeHJfy9dRLCseRsfZkLpp4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6/NDhBYBz60hDgsatXvJ7/05eKJIi1420V0+/CJBdzz+HbRKTHLkz1YP4YrOEm/m
	 gQ2UYG1RgAvmT1EjnHq1gWqkhVCJ2gO59f4K3PrMYKMaag054wx/L6V+s8AKgZkoIH
	 w3KVy2E+M7qJUWU2qcBBISefipO1cG9AQcdYUK2OmlJ7ujHpswYwwfivAp7Y42WmS4
	 3aYkDzxz1HudfqwQd/P95nmJncubN3doxSzu48IQqp+ubraynnW/bHVsp3xEyBCnKS
	 JCE/zC5+T6qLwnSE0BtaCXUOPIqIaIFnzUMprfaNY8M+mvHIqJnki6UbMXFT8zUbWP
	 Dx8QtxG49GB0A==
Message-ID: <d6f50d7d-9859-4dd6-a193-8c57aec11f1b@kernel.org>
Date: Thu, 9 Oct 2025 21:19:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
 <20251008-topic-sm8x50-next-hdk-i2s-v2-2-6b7d38d4ad5e@linaro.org>
 <44606de8-3446-472f-aa6b-25ff8b76e0ec@kernel.org>
 <3620feb6-12bf-48c1-b47a-ccb486e5b5de@linaro.org>
 <c0b71974-65df-47ad-902b-45c2dbe66be0@kernel.org>
 <f27cad88-b1fd-41a3-bdb1-b07de3dea8a2@linaro.org>
 <b614913e-7ebf-4abe-9eb5-f41b81d91ad3@kernel.org>
 <4c5dc916-ea7a-4d73-b509-49f82ff36666@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <4c5dc916-ea7a-4d73-b509-49f82ff36666@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/25 4:30 PM, Neil Armstrong wrote:
> On 10/9/25 16:29, Srinivas Kandagatla wrote:
>>
>>
>> On 10/9/25 3:25 PM, Neil Armstrong wrote:
>>> On 10/9/25 16:06, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 10/9/25 3:03 PM, Neil Armstrong wrote:
>>>>> On 10/9/25 15:36, Srinivas Kandagatla wrote:
>>>>>>
>>>>>>
>>>>>> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>>>>>>> In order to describe the block and master clock of each I2S bus, add
>>>>>>> the first 5 I2S busses clock entries.
>>>>>>>
>>>>>>> The names (primary, secondary, tertiarty, quaternary, quinary,
>>>>>>> senary)
>>>>>>> uses the LPASS clock naming which were used for a long time on
>>>>>>> Qualcomm
>>>>>>> LPASS firmware interfaces.
>>>>>>>
>>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>> ---
>>>>>>>     .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 ++++
>>>>>>> ++++++
>>>>>>> +++++++++++
>>>>>>>     1 file changed, 21 insertions(+)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/sound/
>>>>>>> qcom,sm8250.yaml
>>>>>>> b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>>> index
>>>>>>> 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>>>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>>>> @@ -64,6 +64,27 @@ properties:
>>>>>>>         $ref: /schemas/types.yaml#/definitions/string
>>>>>>>         description: User visible long sound card name
>>>>>>>     +  clocks:
>>>>>>> +    minItems: 2
>>>>>>> +    maxItems: 12
>>>>>>> +
>>>>>>> +  clock-names:
>>>>>>> +    minItems: 2
>>>>>>> +    items:
>>>>>>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>>>>>>> +      - const: primary-mi2s
>>>>>>> +      - const: primary-mclk
>>>>>>> +      - const: secondary-mi2s
>>>>>>> +      - const: secondary-mclk
>>>>>>> +      - const: tertiary-mi2s
>>>>>>> +      - const: tertiary-mclk
>>>>>>> +      - const: quaternary-mi2s
>>>>>>> +      - const: quaternary-mclk
>>>>>>> +      - const: quinary-mi2s
>>>>>>> +      - const: quinary-mclk
>>>>>>> +      - const: senary-mi2s
>>>>>>> +      - const: senary-mclk
>>>>>>> +
>>>>>>
>>>>>> I don't this is correct way to handling bitclk and mclks for I2S,
>>>>>> these
>>>>>> are normally handled as part of snd_soc_dai_set_sysclk()
>>>>>> transparently
>>>>>> without need of any device tree description.
>>>>>>
>>>>>> Also doing this way is an issue as this is going to break existing
>>>>>> Elite
>>>>>> based platforms, and the device description should not change across
>>>>>> these both audio firmwares.
>>>>>
>>>>> This is only for AudioReach platforms, on those platforms the
>>>>> clocks are registered in DT and are not accessible by the card.
>>>>>
>>>> Clocks will be acessable via snd_soc_dai_set_sysclk ->
>>>> q6prm_set_lpass_clock once set_sysclk support is added to q6apm-lpass
>>>> i2s dai ops.
>>>>
>>>>
>>>>> Device description is obviously different for the AudioReach
>>>>> platforms.
>>>>
>>>> Why should it be different, its same device.
>>>> We have platforms that use both Elite and Audioreach.
>>>
>>> I'm perfectly aware of that, it's the case for sc7280/qcm6490. And I
>>> agree
>>> the card bindings is the same, but it doesn't mean the DSP elements
>>> are the

> }
> 
> I have no time right now to implement all that for q6apm & q6prm in the
> way you propose, so I'll probably not send a new version.

Or Update the codec driver to handle the mclk, instead of putting this
in machine driver.
BIT clks are normally automatically setup by DSP based on interface
index, type and pcm params.

--srini

> 
> Neil
> 
>>
>> --srini
>>>
>>> Neil
>>>
>>>>
>>>> --srini
>>>>>
>>>>> Neil
>>>>>
>>>>>>
>>>>>> thanks,
>>>>>> Srini
>>>>>>
>>>>>>>     patternProperties:
>>>>>>>       ".*-dai-link$":
>>>>>>>         description:
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 


