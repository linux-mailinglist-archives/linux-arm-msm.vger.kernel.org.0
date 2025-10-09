Return-Path: <linux-arm-msm+bounces-76676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 056ECBC96D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 16:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B361C3A4B6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 14:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DAC42E9759;
	Thu,  9 Oct 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FbC0h8MK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1F1E47A3;
	Thu,  9 Oct 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760018805; cv=none; b=BsOKW2uSUj57Td+gaYT7C+VnR8TSrbk7TYdSBEX4b0R56ziL0AQMUic0um2OaDTeF0jaVlIgzAbmor6j+OUIAh7/WHSmHIRR3LOpEGgFFZRRIu/0fDJUZ+idqaEh3F0YSyNbPhMymRIX9SDUCxwopyDUGCUjj9fMXXSbbTxN/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760018805; c=relaxed/simple;
	bh=9lGa0HwxRZ9Hy5gQI123eetQttvhSlWwIzzBFIMUFkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jf1eFRuDmfeA1M2F6HcTMSgnfCYub7/apXzxPMu2BA5dR6Wl/8meKmmWi0IIYAeIi027cVS/zAhfB7lFGZEr7nl6frPL+10VwrRGSTSq1rbl2ENfoKJ2YEQTCK2H6LNUaPqxIQtxJFDWK/YZ9paMBy5U0JQObhDORRticcsL55k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FbC0h8MK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D29EC4CEE7;
	Thu,  9 Oct 2025 14:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760018804;
	bh=9lGa0HwxRZ9Hy5gQI123eetQttvhSlWwIzzBFIMUFkk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbC0h8MKo7AodbU1nhaCdAj8zcH1dE+EaQjaekvgxOiY8MxWE7PR57aJ9AH+nUMM+
	 Gb8uOzmcLxCdWoukRtpyblJPVfjGU8UNu5jlnWsdE1D6eSxyG99mVRGW/s65jgQaKm
	 qEu9lpPuDAxv4YiSwhoPEihFBVX5OyG79jutS+Rw1kzARZQku7Y9UpQKIeBeWRv2Z/
	 hlhlQIEpdECp5jWzAvh8l2EeF6DDsDmKGSZFZbsNoBOvS2Sonu0nxEn9bAfNMA+wmV
	 Bt1OZceukkKqCEE4C8FPpe1r8A1QPiQ61/6RBcPRYkd6yvphf6wsILqsahrsvkNJ73
	 w1zKduIseM5fQ==
Message-ID: <c0b71974-65df-47ad-902b-45c2dbe66be0@kernel.org>
Date: Thu, 9 Oct 2025 15:06:42 +0100
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
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <3620feb6-12bf-48c1-b47a-ccb486e5b5de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/25 3:03 PM, Neil Armstrong wrote:
> On 10/9/25 15:36, Srinivas Kandagatla wrote:
>>
>>
>> On 10/8/25 7:56 PM, Neil Armstrong wrote:
>>> In order to describe the block and master clock of each I2S bus, add
>>> the first 5 I2S busses clock entries.
>>>
>>> The names (primary, secondary, tertiarty, quaternary, quinary, senary)
>>> uses the LPASS clock naming which were used for a long time on Qualcomm
>>> LPASS firmware interfaces.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   .../devicetree/bindings/sound/qcom,sm8250.yaml      | 21 ++++++++++
>>> +++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> index
>>> 8ac91625dce5ccba5c5f31748c36296b12fac1a6..d1420d138b7ed8152aa53769c4d495e1674275e6 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>> @@ -64,6 +64,27 @@ properties:
>>>       $ref: /schemas/types.yaml#/definitions/string
>>>       description: User visible long sound card name
>>>   +  clocks:
>>> +    minItems: 2
>>> +    maxItems: 12
>>> +
>>> +  clock-names:
>>> +    minItems: 2
>>> +    items:
>>> +      # mclk is the I2S Master Clock, mi2s the I2S Bit Clock
>>> +      - const: primary-mi2s
>>> +      - const: primary-mclk
>>> +      - const: secondary-mi2s
>>> +      - const: secondary-mclk
>>> +      - const: tertiary-mi2s
>>> +      - const: tertiary-mclk
>>> +      - const: quaternary-mi2s
>>> +      - const: quaternary-mclk
>>> +      - const: quinary-mi2s
>>> +      - const: quinary-mclk
>>> +      - const: senary-mi2s
>>> +      - const: senary-mclk
>>> +
>>
>> I don't this is correct way to handling bitclk and mclks for I2S, these
>> are normally handled as part of snd_soc_dai_set_sysclk() transparently
>> without need of any device tree description.
>>
>> Also doing this way is an issue as this is going to break existing Elite
>> based platforms, and the device description should not change across
>> these both audio firmwares.
> 
> This is only for AudioReach platforms, on those platforms the
> clocks are registered in DT and are not accessible by the card.
> 
Clocks will be acessable via snd_soc_dai_set_sysclk ->
q6prm_set_lpass_clock once set_sysclk support is added to q6apm-lpass
i2s dai ops.


> Device description is obviously different for the AudioReach platforms.

Why should it be different, its same device.
We have platforms that use both Elite and Audioreach.

--srini
> 
> Neil
> 
>>
>> thanks,
>> Srini
>>
>>>   patternProperties:
>>>     ".*-dai-link$":
>>>       description:
>>>
>>
> 


