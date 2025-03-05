Return-Path: <linux-arm-msm+bounces-50324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85674A4F958
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 09:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD6591886611
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562C01FECA7;
	Wed,  5 Mar 2025 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvgGLMrv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E21FECBC
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741165115; cv=none; b=Uol8wYoI0Bap6mxSAADMQ69F2GdMrRRacjRHOxqbctgv4PmXFF7mc4uexeqW8Ayfjut0WhMUbVzk0BdJUf5mKIQjcR1YvHW7iAs3UHl7F+VaHVIM5yCXqXRCnMdOTIRoY2o8E3WAM61XJCca+ujKRpzlq8EmD68Ou37TcQFIDME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741165115; c=relaxed/simple;
	bh=PNhskAE8Hw6NT1lxJLEmtkJRKWfn63/vyOBjmtkEi6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REVcmfgwXfnbN/Vs/Ws3CgUwm9+4jNqYq2/fRDz8hvmVyciTAokVLp5iBcTwRD36DB1sZkEycaisaOFxf5a13QqCi7bE3LX4AcoThmi+UTWQPmzBbZDxNapOJylvBmjVFpJK8bjDOyEx1WmaUV1cTvO4RKSc+kQcoHmZuRVfJuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvgGLMrv; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54958d611afso447946e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 00:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741165111; x=1741769911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WY5vuVhs6pBFMntJgEjYvG2DSltfmIip5HvFcUhCgso=;
        b=gvgGLMrvm4TezDWk4WPh00LMkMgv/qGmfku7r0kO6LqQiZqWPlyIG1HL5zzfOpH8Qb
         UQe0Zo5b+MQxTqNi2iwhhDhlwxKuzFxb7pbgLCljcBxWUN1pTUjGJeqqpRSDgsFx53bC
         r7tdyVQX81dkU63de67cAeOd0xYv/6byQfxrUWul98bU4eHCCHIV/usl9IRUpH1COY6m
         UiRvQlmoBc9T7Hsp8UTOiCUPqY2XJnv781QrF0wD2Fs5eE7mkKnd61VZTa1iqYL1ytZZ
         wm5/PMgqi4mKgANWsLzQSrhWmX478c3tqxfXYLWUzKNiCv7IiOAvtlD5z92sX8cHY+ij
         +dEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165111; x=1741769911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY5vuVhs6pBFMntJgEjYvG2DSltfmIip5HvFcUhCgso=;
        b=msQIrmLpzxLkoD22vSX31TBq6RXUHAOymxT4izulcAhCwb6FKtoImU4yOVkpEbiY7h
         1LbLZBMUtKkSMupC7y2Yg9UUeKxdR4bAYcxd53KUGO4cgOk6mq4De2zR5FpfFB1Cp/IN
         lu5zCaby/RPskwxeaDplioQ/0niJbAeS8mGMtKzMSkl4TfCgHj6j2NPOsPaTyae6KHS3
         CLG/yiwoaeZCDrAbI5WK1vHQpfKGhwk4GSc3SRMfa+tHgKE9yi+F6Bmr/kXc3wMDzONH
         92uwhuMyns27xqXIvENoDgRRZO40gXNeNW5uf9oqudk4LDbOML4c6w95hhuztXUIxwzf
         p2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyxGZdOKoCEzR7tSZlzcMbvieWYbk4lOaGThZRNETKVr6h3oQHHzCUoQlXjhWZ2kqsp/u84H5xLEN++lRe@vger.kernel.org
X-Gm-Message-State: AOJu0YzS9lZ5jrYI9notdT2iEt5qCpCEv3ngjZasAFfrOT2YwnYMjykC
	M9hJZfG87vs+eyEhZRbCoj4Pyodu/EWtJyJ10onarikw04xirN0ShQonuvJEBGA=
X-Gm-Gg: ASbGncuU5IY0cMCjfavk4WhcgnaHsAK4yQKveIz94F2EdVVAdaQTGlRrviYTK/Tlck1
	UlneXI8n/l6ZRo8o7PHCp8zKKpQeq+jXrb99C7TVvZ3LeKhuqsly/x1Lpg2I/mxyoUkythzJtbR
	MekGOLUjwQ+zanwuLtJKLjPqcZB2btl4UD6br/ZS0sDxG2NbwQ3rBfxc2IvcTIVbZYnYRKDqdWt
	URB/WlRA6Z84c4Lyb7ZTRz/DXoMqQmgIPXwcw2P/rqR0SBY4b5rGQAQqnanHLuG8Wj0V1LOTS5P
	gBf+L60jRK/QpfIif6BfljUK3SVm1918KZeQJ83Gr24iUx57x3hy3tri/87zjkbj0LRaYI4a25c
	h6bcaVn/g0Njfd8hyRURn5GM=
X-Google-Smtp-Source: AGHT+IFru+CnoO/K8BouBY87L2tjCxv0I44B8TgnGQhueATpKA6i0oswVIJN7d54HfLg412IUkDTmA==
X-Received: by 2002:a05:6512:6cd:b0:546:2ea9:665e with SMTP id 2adb3069b0e04-5497d336cffmr332895e87.5.1741165110566;
        Wed, 05 Mar 2025 00:58:30 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495ba676a7sm1137946e87.39.2025.03.05.00.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:58:28 -0800 (PST)
Message-ID: <19393198-75ad-48bf-b21a-3d9cc1848499@linaro.org>
Date: Wed, 5 Mar 2025 10:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of
 required-opps
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
 <20250305-little-frigatebird-of-calibration-244f79@krzk-bin>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250305-little-frigatebird-of-calibration-244f79@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 09:56, Krzysztof Kozlowski wrote:
> On Tue, Mar 04, 2025 at 04:31:52PM +0200, Vladimir Zapolskiy wrote:
>> The switch to multiple power domains implies that the required-opps
>> property shall be updated accordingly, a record in one property
>> corresponds to a record in another one.
>>
>> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
>> index 5bbbaa15a260..938a2f1ff3fc 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
>> @@ -40,9 +40,9 @@ properties:
>>         - description: A phandle to the MMCX power-domain
>>   
>>     required-opps:
>> -    maxItems: 1
>> -    description:
>> -      A phandle to an OPP node describing MMCX performance points.
>> +    items:
>> +      - description: A phandle to an OPP node describing MXC performance points
>> +      - description: A phandle to an OPP node describing MMCX performance points
> 
> If rewriting this, then:
> s/A phandle to an OPP node describing//
> because it is redundant (this cannot be anything else).
> 
> But more important is that you introduced ABI break, without actual
> reason. Switch to multiple power domains does not look like fix so
> neither should this be. Reverse the items to keep the ABI intact...

To the best of my knowledge there is no users of this compatible in the
Linux kernel, so likely there is no ABI break.

> unless ABI was broken earlier and this just keeps doing it to make code
> consistent. But then please explain it in commit msg why we need to
> break it second time.
> 

https://lore.kernel.org/all/CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com/

--
Best wishes,
Vladimir

