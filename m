Return-Path: <linux-arm-msm+bounces-15146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90288BEF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 11:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCE11F63363
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 10:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4233571727;
	Tue, 26 Mar 2024 10:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Spkhi5zQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434ED6F08E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711447820; cv=none; b=JNIhnkpQ+z0jA0kn3EMV9sKg9M7wT8bE6rLx29KnwbpmXFj7ogNZOEMRERHLg1VxcQp056PAMl/lUab1zCWYj3wQXXcBRdxwMrwEP4m1o20yvg53b/qZLGEDBxQHcZSNYrS5w7rkVRzX9+1P619t1WR8fRq14qy6ZoJaAymA5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711447820; c=relaxed/simple;
	bh=Y305OI8+v/GYz4bHx//3LsQDwUJMII2U2I5ZCcX149E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5Y1r5CwGAq/Yzdu7fAfgFI7ikLLIzTheYn+J+JqX4Ogz/a8xC0sDqNbzUPXIKT3yUBS+8F41MhAKaTnRmbhtgElROtQzDp3RrqWAUqUSHIcpSLfHw+AyioCpoaEj7oh9G2EDeoIw3KeVQq1PfzPBi5322woyTgVLj4+YABT3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Spkhi5zQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56bf6418434so3610683a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711447816; x=1712052616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JQnaSyYwl5rD6XVmt2ooNtpLwR2x205PFtPTu6yX330=;
        b=Spkhi5zQ/5UA4GZa0538/8J0uRT+AB76DOIR4ePSrWpD9OWqIaAW0zbeaOU2MnXe/y
         hOFU14P99vAB2t3RIQj4SXwvsJ5G2LmJZHaoHNB/lA9kLUl4GE3BzYMuOAENFS6ejQ9y
         OQcQN557Gnh0eHW2lZmx44DI0fjJabuxZtosnbUjAH3zpyzUzT6R52aTN00LCM4TNhqo
         +9PgY2gIZhSZ0m6H2Sscpp1mtXFectUzsh/tKIn2zmOj1deD2w11Q7XHVXfOkjgttMyG
         mM0fTMWPe9/81ZXlk84kPSVyJfzcwzA/qaHKKuSLMbjhuQct1lPKvsCxUDLyzGNxtir7
         WNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711447816; x=1712052616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQnaSyYwl5rD6XVmt2ooNtpLwR2x205PFtPTu6yX330=;
        b=mkBMOKFOTBDVepx/CbnZU7+TY64qVMUza6sapLfY5tlZnH8/98BJpBo67e+ndyS/4O
         yeJxJHXENvs1sNytRkzr0CUbcdyhdYGkNmQXSG7akLRfodMVEMGjxWLn5+VVzPGKITLn
         HSL+ig3oOiBMDqKTu1EDcXHdM+VCrgSH9tgNuD9xL+34yZs1EKGP3N6gdsz9Rrdte0KI
         hCbCiLrf+iDwCFvNb+EiIGkAFWkdjZ19GFoC2QDE/5eo1mo4FSZFYvZNG91qfPiWak92
         +JeRIiMoY0d7FAiIaEO7hdKyJHgTd18w0exYy6r0jpnAq9eSNO6/oJ5PvnZIdp9wziSC
         7B+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzT7iN8GgqFUsfEXhPdXreum9gchQUVXRa+RsVQ/c6h4aww3nNPOCHELrMDJgkv+flVMOqN+GfcTkj/DXrZ3NlpWcdoszj0XuvYFMZ/g==
X-Gm-Message-State: AOJu0Yyocvu6j1GmLjLImT5vXNzrESWSSx6/shnv/NbXMwi/JiYTebm9
	qUPSJ6u7DF8LbjiuB/HGYMsr0X5NqmK3/m62AxNxsbN8ucP9y9ioXSyETN9np0w=
X-Google-Smtp-Source: AGHT+IE5g6nuG88tlLs73Wec3cLhmWwqjWuu+9HPNJuUBta5wdqIVeW1wvlCSpOkxC0z+zMSsyj2Sw==
X-Received: by 2002:a50:874a:0:b0:56b:defb:3b59 with SMTP id 10-20020a50874a000000b0056bdefb3b59mr6554522edv.19.1711447816609;
        Tue, 26 Mar 2024 03:10:16 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id ek27-20020a056402371b00b0056c2d0052c0sm293096edb.60.2024.03.26.03.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 03:10:16 -0700 (PDT)
Message-ID: <ece192bc-adee-4d99-9fc2-c133f1402cae@linaro.org>
Date: Tue, 26 Mar 2024 11:10:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Add support for Motorola Moto G
 (2013)
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <f5d4d71cd59f25b80889ef88fa044aa3a4268d46.1711288736.git.stano.jakubek@gmail.com>
 <b35ad5ff8a13f9df415b6e6700b3b5d3f13bfce8.1711288736.git.stano.jakubek@gmail.com>
 <ffa93b4a-608a-4cf5-b111-0d1f8520afdd@linaro.org>
 <ZgHdoK6luxRcKgRx@standask-GA-A55M-S2HP>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <ZgHdoK6luxRcKgRx@standask-GA-A55M-S2HP>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2024 9:25 PM, Stanislav Jakubek wrote:
> On Mon, Mar 25, 2024 at 08:28:27PM +0100, Konrad Dybcio wrote:
>> On 24.03.2024 3:04 PM, Stanislav Jakubek wrote:
>>> Add a device tree for the Motorola Moto G (2013) smartphone based
>>> on the Qualcomm MSM8226 SoC.
>>>
>>> Initially supported features:
>>>   - Buttons (Volume Down/Up, Power)
>>>   - eMMC
>>>   - Hall Effect Sensor
>>>   - SimpleFB display
>>>   - TMP108 temperature sensor
>>>   - Vibrator
>>>
>>> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
>>> ---
>>
>> [...]
>>
>>> +		hob-ram@f500000 {
>>> +			reg = <0x0f500000 0x40000>,
>>> +			      <0x0f540000 0x2000>;
>>> +			no-map;
>>> +		};
>>
>> Any reason it's in two parts? Should it be one contiguous region, or
>> two separate nodes?
>>
>> lgtm otherwise
> 
> Hi Konrad, I copied this from downstream as-is.
> According to the downstream docs [1]:
> 
> HOB RAM MMAP Device provides ability for userspace to access the
> hand over block memory to read out modem related parameters.
> 
> And the two regs are the "DHOB partition" and "SHOB partition".

Oh right, motorola made some inventions here..

> 
> I suppose this is something Motorola (firmware?) specific (since the
> downstream compatible is mmi,hob_ram [2]).
> Should I split this into 2 nodes - dhob@f500000 and shob@f540000?

Yes please and add the downstream txt link to the commit message in case
somebody was curious down the line.

Konrad

