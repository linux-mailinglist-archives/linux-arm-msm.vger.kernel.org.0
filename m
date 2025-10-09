Return-Path: <linux-arm-msm+bounces-76729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 404FABCA866
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 20:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 441CA4FD6E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 18:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026812472AE;
	Thu,  9 Oct 2025 18:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMy9tZdL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6845241CA2;
	Thu,  9 Oct 2025 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033140; cv=none; b=IJYRhO91mllNXw9HAWcuu4wkw4YbNvz0suDFzilBqDsyogAHxFI6eGqZhx5SkADCqR0EkSpiH14lEXnWHpgsJFeRV8ZQhwUMPT/U5xs6g98NlkaUH8KjnShvjhccBjexJ+Q/6CKI7bi9n+y7aSOYli3THkjFa5+z1ISA81FoibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033140; c=relaxed/simple;
	bh=i1yq3IxJbUFGkr/0ZAIbF4v+HCsO8IQ/7jgfv7XTuN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbb2SKHY38eoy3DD3cqYBJtAj0aRZTNXWFfrL9BZfPSNZizWublKKVXfoa2frtopyeSuRBZJ/QrFjtuOmQtDeMVXmsZlQJXrW0ualapSK5ycNHqvAYpArRswJJe/5FmiO0SA/vDjccQgRil5Ja5a3AN49kK/7j2eOYaJ7FKV8KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMy9tZdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839F4C4CEE7;
	Thu,  9 Oct 2025 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033139;
	bh=i1yq3IxJbUFGkr/0ZAIbF4v+HCsO8IQ/7jgfv7XTuN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZMy9tZdLcW87+5cc3agm6QMP7lfzM1I4R/z8Otp9URWUnD4fhZjmqgDvMmQiKG4dd
	 hLQQrnLxpn0vvSozRJ3TEcWnscM9HXDDwl8nF/60THBBsqbK8GVF3AYWbI7w3Ar542
	 /Aiti9R2474MNT6sK/5qWmuq7zIPrpXCDJdTsKy/4toSwW2RSYCB0LmgoAhiLgOug+
	 dbCUGxXC5yRk73zBP0PaZ9D6lu8Q5fLWSgBXsolSllptnFJ55yJZxtpeGMfM6IlY6m
	 ddC7kQPtI/UPIz0p4xOb1BRvGHV0JWQ0QZ87TiKKlsw9IqdF6UJT/G4B+YH7HlfHMk
	 M4CRVXmxkCd6A==
Message-ID: <e7102fb7-21fe-46d9-92eb-f320988ca0d0@kernel.org>
Date: Thu, 9 Oct 2025 19:05:32 +0100
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
>>> same and uses in the same manner.
>>>
>>> So let's forget the bindings and forget those clocks entries, and
>>> imagine
>>> I'll implement those _sys_sysclk calls like for the Elite platforms.
>>> This means I'll bypass the clock framework by directly setting the PRM
>>> clocks, this is clearly a layer violation.
>>
>> You can claim clocks in the dsp layer (q6apm-lpass-dais) instead of
>> claiming it in machine layer, it does not necessarily have to bypass the
>> clk framework.
> 
> The current q6afe implementation totally bypasses the clock framework:
> 
> static int q6afe_set_lpass_clock_v2(struct q6afe_port *port,
>                  struct afe_clk_set *cfg)
> {
>     return q6afe_port_set_param(port, cfg, AFE_PARAM_ID_CLOCK_SET,
>                     AFE_MODULE_CLOCK_SET, sizeof(*cfg));
> }
> 
> I have no time right now to implement all that for q6apm & q6prm in the
> way you propose, so I'll probably not send a new version.

This is not really scalable, you are suggesting that we add this for
every board, when you can do it more generically in the dsp code using
set_sysclk callback.



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


