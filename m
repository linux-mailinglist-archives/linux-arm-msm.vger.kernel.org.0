Return-Path: <linux-arm-msm+bounces-56198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F748AA4308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CE771BC5CDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20AD71E104E;
	Wed, 30 Apr 2025 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y5ReXdpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197F9B672
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 06:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993951; cv=none; b=Wdq8N36ldX44GlnuQKP/XSYvDTqPuaGMUmX28DhLOHYGbJZenkLDkYIOUWpDgDtzxXhH4ppVr0eBGvANNqKxIASuyAYwqAjQ9y0YlY6TGUbGUsPbGHx6fo7AN+pwWfzHT0kqHLM/kVNvKfTB/Tc4JWpkSC7n0C/tYVWtxws3Pfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993951; c=relaxed/simple;
	bh=jL8xvh7MmkitMTTRNILqXKDjV0N1bxWKo2Q8EiScK1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czT5KovyMrOPFZ2mADf0ogiWXVxHTralYLuwkS21HdZH8tx5FSnaTo01Ky509RkalKg+0aTe0yBJ0qx8gr6xtynUTO+iNByu2GHeyxGHp4Y1Q1y2y/ESoLTGHSqKCta4PFmi6YRL/LTWWjqGXeW4vM78prRN29Gk0zJnqlGP7Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y5ReXdpY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso4843115e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 23:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745993947; x=1746598747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F/IL0XFmHPKxoC9j8t7metTTcJtVydc7qbX+iUPXrhg=;
        b=y5ReXdpYq/EtyCImuzDwATPZXNHJDr6ntVi7ljKUuzEa73l7Ds7nyLyGTw7R2rLRBD
         hc/ssxdR4GXtgk5xXMLmZxkS4dEV+gSG+q7CP/i4G72TRcqgMMT+Xt7VrWDlr13FLw09
         q/WalHJ2Cbm5KQnW8XJkeJB9p3BNchlRO9okEAuzCW5xPyfqOfBv+c7Rw3ns/BaVTyp9
         YkMoySomRrWhTXtheZjP5aCMdXMcLT+hcOD3zZ1gIGtDSX82ji5BzNiGvPuC8CcvUWQx
         0z1j88F/bHjmlBYrsVEYmSXbkwo/rAtFG0pn2nb/OTyKYezHWfxpj8CLyZmf1iFyp0Np
         5llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993947; x=1746598747;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/IL0XFmHPKxoC9j8t7metTTcJtVydc7qbX+iUPXrhg=;
        b=NT3txw5JUlBLT+/P8h6bJPHQfeJ6JQSpAPLfxLdAJRqQpdr51URIjmZuqMmNXLEeyc
         NHonyDVdD8fHcbrdiMRSicv4te5UyUw3/Y7rQ8HdsvR8tO+WJAudo9FxAiUC4C04CehW
         kFUFDq0tOdi/zcd+FjCKf/4THzPS7sR/aqtQ4aaR9OIJuBNIehfVkc82WjIXthuQ4RmX
         AWFXnveNmEwDWqut1Fy4ggpJtw2AQ0ncvqrkw8gYmKx06YnTBT3CTSUNXsDuYE9nQ6p1
         8pteuUq7+r8mMcM3AeIOO2LuMcXfCfUrg77HnYYje8X2IqSpu/kRLUIP7EjcFWycOtK5
         v9Kg==
X-Gm-Message-State: AOJu0YxoG9sJA0DNv3naZRYOiHTWleiQcIEsR/EjCn7L7A6wbqgxF4RX
	Aj/KxbpRu2O3uUA8VETNW/+h2whnDlWHNFLNhsnpyjiwC9VOJtLekpuoMkJxHbF1v/QIuwQ09Fx
	i
X-Gm-Gg: ASbGncvtfLKDLbJvNcP3og9NxYLatDQFu3CPSv+pJqSyS6bkICWVP8Q5ob7HVDbq1Id
	Ynxs+2yJkryyrhsblxel/6QUIBuFAH9HRDex9NJiW+MsYmQUWbKLhmnKS62RgiRlHY6RmKAd98+
	iEzMcZp8n74ygEh5vfm8kyESuto7AtboKUVjIVYM9CQ6wKdAOsGS4gTQXKQhYNixnqk6rRV/UIU
	/iwqVJRK9SmkrFCyielEUDY34wVBHQA5TmxJe4QNUShU/glkH9M/zjLn4yncqpuwk7kFnUIfSV5
	oHsZvqtKF+xsMIZzLNTbDEXNL+Os6exEp4r1citGDT+Oqn9vIVDAVlzKo/o=
X-Google-Smtp-Source: AGHT+IGwlSSk/V975d/cid6eJ9/Q9UkNNxcjOHYawcjiK6gUy1kVrfYZq/K4ZlmgsJ8PDkUnk3LTDQ==
X-Received: by 2002:a5d:5f81:0:b0:3a0:6868:8b13 with SMTP id ffacd0b85a97d-3a08ff57663mr348272f8f.1.1745993947391;
        Tue, 29 Apr 2025 23:19:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46976sm16110911f8f.63.2025.04.29.23.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 23:19:06 -0700 (PDT)
Message-ID: <0e007f7f-d9ff-4b2d-914d-ad62b9983bba@linaro.org>
Date: Wed, 30 Apr 2025 08:19:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
 <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
 <9b6c5f67-0bbc-490f-9982-4e28218aa6eb@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <9b6c5f67-0bbc-490f-9982-4e28218aa6eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 21:11, Konrad Dybcio wrote:
> On 4/28/25 4:41 PM, Krzysztof Kozlowski wrote:
>> On 25/04/2025 11:30, Konrad Dybcio wrote:
>>> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>>>> Add device nodes for most of the sound support - WSA883x smart speakers,
>>>> WCD9395 audio codec (headset) and sound card - which allows sound
>>>> playback via speakers and recording via DMIC microphones.  Changes bring
>>>> necessary foundation for headset playback/recording via USB, but that
>>>> part is not yet ready.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>
>>> [...]
>>>
>>>> +	sound {
>>>> +		compatible = "qcom,sm8750-sndcard", "qcom,sm8450-sndcard";
>>>> +		model = "SM8750-MTP";
>>>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>>>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>>>> +				"IN1_HPHL", "HPHL_OUT",
>>>> +				"IN2_HPHR", "HPHR_OUT",
>>>> +				"AMIC2", "MIC BIAS2",
>>>> +				"VA DMIC0", "MIC BIAS3", /* MIC4 on schematics */
>>>> +				"VA DMIC1", "MIC BIAS3", /* MIC1 on schematics */
>>>
>>> Is this a mistake in what the codec driver exposes, or just a fumble
>>> in numbering $somewhere?
>>
>> Which mistake? MIC4? Schematics call name things differently. They
>> always were, so to make it clear for people without schematics I wrote
>> which MIC it actually is.
> 
> I'm not sure how to parse your response
> 
> are you saying that there are MIC[0..4] that are/may be connected
> to different codec ports, and that the MIC4/1 lines are plumbed to
> VA DMIC0/1 respectively?

Yes, as always. Nothing weird here.

> 
> I think I got confused about the MIC BIAS3 going to both and none

What is both and none?

> matching the index, but perhaps that's just because it comes from
> the WCD (which is the third piece of hw involved beyond VA and the
> mic itself)

Again, what is the mistake you are pointing here?

> 
>>
>>>
>>>> +				"VA DMIC2", "MIC BIAS1",
>>>> +				"VA DMIC3", "MIC BIAS1",
>>>> +				"VA DMIC0", "VA MIC BIAS3",
>>>> +				"VA DMIC1", "VA MIC BIAS3",
>>>> +				"VA DMIC2", "VA MIC BIAS1",
>>>> +				"VA DMIC3", "VA MIC BIAS1",
>>>> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
>>>> +
>>>> +		wcd-playback-dai-link {
>>>> +			link-name = "WCD Playback";
>>>> +
>>>> +			cpu {
>>>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>>>> +			};
>>>> +
>>>> +			codec {
>>>
>>> 'co'dec < 'cp'u
>>>
>>> [...]
>>
>> That was the convention so far, but we can start a new one, sure. Just
>> ask the same all other patch contributors, because each of them will be
>> copying old code, which means cpu->codec->platform
> 
> I've been doing just that for the past couple weeks indeed
> 
>>>> +		/*
>>>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>>>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>>>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>>>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>>>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>>>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>>>> +		 */
>>>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
>>>
>>> Does this deserve some dt-bindings constants?
>>
>> No, because these are hardware details/constants. Drivers do not use them.
> 
> I'd argue it makes sense here - it makes more sense to pass meaningfully
> named constants to the driver, rather than blobs with a comment

Sense of what? You want to make it a binding then answer what does it
bind, what part of ABI for driver is here a binding (answer none:
because driver does not use it)?



Best regards,
Krzysztof

