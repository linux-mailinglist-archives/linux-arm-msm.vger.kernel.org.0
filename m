Return-Path: <linux-arm-msm+bounces-61636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E0ADDDEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 23:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7CD53B4B76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 21:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C322EFD83;
	Tue, 17 Jun 2025 21:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k7X8++08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7D1898E8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 21:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195840; cv=none; b=H40yoXCzB5sTDoXXqwKdRi2xiM9uvksdE8rBGF6GEZOhy6kXohkb2tAr+qu6UYp68m/V9TB6agduxsMgRWxVuxT7Ldm5VaSV48svxWU/mQ7qgDPehi5ehoved/ZuZpV3BgVRYwnwt/s4bcW7WeABgwQVqBs1bO3EN4fPFbB+wvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195840; c=relaxed/simple;
	bh=57GG017WnvsgeO3G2EDT/hrJC07voSkXSXCi0ddkyI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PRDqJcT3XVoTBox8FpawC3yRWy1PdDbDTHm8kud7E6ytN+0Gx17puygZc+CvMV2tR4M1Y5JoN89QZWA6I9/PsNCGbYf7WhwGlfrs1Adp56wUrUMbdo8rcR/e1sKHmn/qjfEgkC+EPiuA+KTFshf8Jr0c/GMcSEb1WTLMmIvs1J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k7X8++08; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b4a0915b1so3691021fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 14:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750195836; x=1750800636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ru3Y1J+U8NViKVmQGNuGxbL/kEmW5KcH1aIJSH/7IU=;
        b=k7X8++08VHn4Ewts5PxpWPWzZjdmzkUF9GbFmwN58+qAtUMgV74dLcNDs8M1d0MysO
         51efcOTM0nMf0Sh5lE39QxYVrsWjb8Mi67YLXgDSNI4l7s8lR370RJFB/A2PNfugCQxx
         0OVMrdYsZnOp3ijYzxscEqjZkxmy0BUMtPN8L/HXERk9L/8tuOyrXkLCln8pEjoaMX5Z
         YB2s1Z74w9unHXXEN0HlSXEvb6i7HsY4InMR9XuZ8VC3Q5Q2DVXVBhSKOPanYshY9xJS
         Dwn3kmSreQAbPFBcqgL8zyqper2LaCS448sFT44JVXc5Yxf7YwaOH/8PyZoGuSGpkIG3
         g0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195836; x=1750800636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ru3Y1J+U8NViKVmQGNuGxbL/kEmW5KcH1aIJSH/7IU=;
        b=XvvupiU8i4zOrVFtopfp6Dvwkbr3gprb+WPDqbXoCHVb2ZkB9vcNqa3ocCPN9Z6HSM
         CtKkC/7yGNQRuhzny2KZL896nS6gDHD7voT/wpz4scfuwpCKjSH8vLan/eGhKATdN9Qn
         itglrCCiL8UO/D+ftNe9yqvJUhLl2sBKeymwaazSDDz0iJmC2Ts7H1IJF0Glsh/5RU0g
         QnaIOU7CePCa+fqaWmjUDsRqfysELD94tCkca3wnfX5PUMBhSJjMCr8V9tMlI09bJ9sL
         IN5jqTwp3xXgZ40oUz5qgMm1VOacMYduHpjbRkeSOqaGA3H8BRk8WVVT7PGQtAgOOYM9
         W7wg==
X-Forwarded-Encrypted: i=1; AJvYcCW5sjgiPmVTXsYYx1BqRHaOnRxw6AKuL8pw4EXLwnZUfbwguZWcRGZXvglKpAzmjGwi0yrLdLnRVawVZkO+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu4tbPy7X3NQCSguWiRlG1zTQI6Q4hggFSaowCqFVyLo1bAyK2
	mDfXR6029DuDTPDwzWTXrgvzoR55MitwtF2RRvh9Pd270GcK75gMyL8EJwDm+l7KQGs=
X-Gm-Gg: ASbGnctT1nkFMVxomtI4tNGKPWD+4ILOWOFBJsMQWpSZFyNNdDdzYJn4nImcqhe6b8B
	vmpEO6pPMI3FqaJsWhxeKrEKgYh0dwopuaS///fq9bJkFjP1dENM7xBcmHPVLH+3oiB1xnvx2bj
	wXMIE5qix5QlFD3HzrZN7BekW2JzN+A1Y9sTqsODlkUbrloXJgNHwGJHk5whGg8DIFive0H90LX
	TO67h9zIiAcFWJIthm1BmWGRs3S4oxcEvZs75fQvuDuRfFwA3aAZunGwaEC27CdA/RAOM/jlQjd
	EQ7ZC0M9Jh/a7QGv1ERsMAkSP5SUPy5ANIW7++bxp+z8/cjsswhs2oxtjWbryizsVPSX3kvV67p
	rpDQsI3dSI2D/sl0Ylaa1Yubgtyr+TaMKq58T79Ow
X-Google-Smtp-Source: AGHT+IGahrp4OijeVMN6/wrtyWB6f0c2IuaTQ9tTQDqYMs+wKjPRh5mEIg4iR4LsiSPfe/WRq8fYMA==
X-Received: by 2002:a05:6512:3055:b0:553:38b1:810e with SMTP id 2adb3069b0e04-553b6e7577dmr1393954e87.2.1750195836360;
        Tue, 17 Jun 2025 14:30:36 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f75a0sm2047133e87.219.2025.06.17.14.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:30:35 -0700 (PDT)
Message-ID: <05b4878a-f6c1-4a69-bbb8-900064267cd5@linaro.org>
Date: Wed, 18 Jun 2025 00:30:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] dt-bindings: media: qcom: Add Qualcomm MIPI
 C-/D-PHY schema for CSIPHY IPs
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-9-vladimir.zapolskiy@linaro.org>
 <6e411e89-ce1e-4d6a-8d48-b800554f830e@kernel.org>
 <e9afdd0f-7842-4780-9044-d5afa6a09d7f@linaro.org>
 <b96f9cca-cdd4-4456-8ced-f4a8fd810ff1@kernel.org>
 <9e383935-a10c-40ec-a63a-243cd028374e@oss.qualcomm.com>
 <4f7225ee-fbb4-472e-8e14-a98f4cef9fc3@kernel.org>
 <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
 <1fba505c-bd01-4d36-9efe-17172e11fb1a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <1fba505c-bd01-4d36-9efe-17172e11fb1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 22:20, Konrad Dybcio wrote:
> On 6/17/25 11:51 AM, Vladimir Zapolskiy wrote:
>> On 6/17/25 09:32, Krzysztof Kozlowski wrote:
>>> On 14/06/2025 21:31, Konrad Dybcio wrote:
>>>> On 6/13/25 8:28 AM, Krzysztof Kozlowski wrote:
>>>>> On 12/06/2025 19:13, Vladimir Zapolskiy wrote:
>>>>>> On 6/12/25 10:38, Krzysztof Kozlowski wrote:
>>>>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>>>>
>>>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>>>> ---
> 
> [...]
> 
> 
>>>> I don't have the docs before my eyes right now, but I would not be
>>>> surprised if it's also called "csiphy" in there..
>>>
>>> Let's check that first.
>>
>> Here only someone with the access to the specs can help, when I rely
>> on downstream code, and it says the right clock name here is 'csiphy'.
> 
> Unfortunately, I can't find anything more descriptive than that.
> 

Thank you for checking it.

It might happen that a widely used clock name "core" serves the purpose,
so here I can introduce CSIPHY clocks "core" and "timer", if Krzysztof
also finds it acceptable.

--
Best wishes,
Vladimir

