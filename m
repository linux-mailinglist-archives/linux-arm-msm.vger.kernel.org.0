Return-Path: <linux-arm-msm+bounces-76679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19FBC981E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CBAA74E59D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C672EA75E;
	Thu,  9 Oct 2025 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgMuZsUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F71F2EA176;
	Thu,  9 Oct 2025 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020190; cv=none; b=aUeHMY1EonHmWwpgUteXH7SV9XMRkqaoHaDbuPzHncEirDK80xtcMKHIt87Rzk6WcW4DskONDi7TweFVtCn8b1GZedmd0nk6y1AlNAuNvS1jhlbo7/yzdgHVKSjDKQZzdkYdz5HQzPzy88hM42XqQvHQ+2tDkjqywwKX3l2yA4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020190; c=relaxed/simple;
	bh=JeNJ+MOb6MbW2Adwn40uh6TWEREB7v7gXN/c9Y0+u0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSbPP904Nm1v9DiZB1bYRKVfY7eILaAlLiKsOo1th7uYWoN9GAQhSu+uGRoLfJii0dV0XvqZFcCy1E6BEzeZWVFPXCdK+0KMZAitj+QGAFQE4EQqZ9a6Q1aczCSYRlpeWnILRs8/4m4SxJ0/YNJrLRaSCAAY0TSa73e3anib9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgMuZsUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD03BC4CEE7;
	Thu,  9 Oct 2025 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760020188;
	bh=JeNJ+MOb6MbW2Adwn40uh6TWEREB7v7gXN/c9Y0+u0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MgMuZsUVxQHOeFFf6KNTzfqwMKZZMATdNU3Xr+gE26+27vAMjih/M2l02JtGbl93u
	 MQR1sIR0iE+HX2RdohSj8VAq0Aad66+Bd9PAwMCLyr5x8wu6hKovMIKfVWXTKIFTRb
	 pU8QXUj3QySjCK1YLk7vrG64AOBFF9DhCG4Vp41MFREgUUN+1hQzCRy/Aa6mA5k/ZA
	 V9o+PWCf1npShSdn4KXCtpUFvI9N3/lHmbT8uvoO4DHMnNnGVNWtxj5ISoV2RzTY8R
	 1yLCxG8jjb6C22Y3r3gDOPE2NgKyV5lLZjUlSScMR6wODpv+F8I/kvmAUiB2rDYODy
	 TXcWiZ3XIZUvg==
Message-ID: <b614913e-7ebf-4abe-9eb5-f41b81d91ad3@kernel.org>
Date: Thu, 9 Oct 2025 15:29:47 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <f27cad88-b1fd-41a3-bdb1-b07de3dea8a2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/25 3:25 PM, Neil Armstrong wrote:
> On 10/9/25 16:06, Srinivas Kandagatla wrote:
>>
>>
>> On 10/9/25 3:03 PM, Neil Armstrong wrote:
>>> On 10/9/25 15:36, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>>>>> In order to describe the block and master clock of each I2S bus, add
>>>>> the first 5 I2S busses clock entries.
>>>>>
>>>>> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
>>>>> uses the LPASS clock naming which were used for a long time on
>>>>> Qualcomm
>>>>> LPASS firmware interfaces.
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 ++++++++++
>>>>> +++++++++++
>>>>>    1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> index
>>>>> 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>>>> @@ -64,6 +64,27 @@ properties:
>>>>>        $ref: /schemas/types.yaml#/definitions/string
>>>>>        description: User visible long sound card name
>>>>>    +  clocks:
>>>>> +    minItems: 2
>>>>> +    maxItems: 12
>>>>> +
>>>>> +  clock-names:
>>>>> +    minItems: 2
>>>>> +    items:
>>>>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>>>>> +      - const: primary-mi2s
>>>>> +      - const: primary-mclk
>>>>> +      - const: secondary-mi2s
>>>>> +      - const: secondary-mclk
>>>>> +      - const: tertiary-mi2s
>>>>> +      - const: tertiary-mclk
>>>>> +      - const: quaternary-mi2s
>>>>> +      - const: quaternary-mclk
>>>>> +      - const: quinary-mi2s
>>>>> +      - const: quinary-mclk
>>>>> +      - const: senary-mi2s
>>>>> +      - const: senary-mclk
>>>>> +
>>>>
>>>> I don't this is correct way to handling bitclk and mclks for I2S, these
>>>> are normally handled as part of snd_soc_dai_set_sysclk() transparently
>>>> without need of any device tree description.
>>>>
>>>> Also doing this way is an issue as this is going to break existing
>>>> Elite
>>>> based platforms, and the device description should not change across
>>>> these both audio firmwares.
>>>
>>> This is only for AudioReach platforms, on those platforms the
>>> clocks are registered in DT and are not accessible by the card.
>>>
>> Clocks will be acessable via snd_soc_dai_set_sysclk ->
>> q6prm_set_lpass_clock once set_sysclk support is added to q6apm-lpass
>> i2s dai ops.
>>
>>
>>> Device description is obviously different for the AudioReach platforms.
>>
>> Why should it be different, its same device.
>> We have platforms that use both Elite and Audioreach.
> 
> I'm perfectly aware of that, it's the case for sc7280/qcm6490. And I agree
> the card bindings is the same, but it doesn't mean the DSP elements are the
> same and uses in the same manner.
> 
> So let's forget the bindings and forget those clocks entries, and imagine
> I'll implement those _sys_sysclk calls like for the Elite platforms.
> This means I'll bypass the clock framework by directly setting the PRM
> clocks, this is clearly a layer violation.

You can claim clocks in the dsp layer (q6apm-lpass-dais) instead of
claiming it in machine layer, it does not necessarily have to bypass the
clk framework.

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
>>>> thanks,
>>>> Srini
>>>>
>>>>>    patternProperties:
>>>>>      ".*-dai-link$":
>>>>>        description:
>>>>>
>>>>
>>>
>>
> 


