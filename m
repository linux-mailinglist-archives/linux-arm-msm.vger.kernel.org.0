Return-Path: <linux-arm-msm+bounces-61574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9CADC737
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA9E179DF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44E2EAD02;
	Tue, 17 Jun 2025 09:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U6VDJ19C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231672EA496
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153889; cv=none; b=Q2ZpJjGxDJdI7vq9JGcBR0ITXMPIrcc8mxBlRP//KujRejwhXT+FklDycpGd1ycb0odG6CFc+21KC0JNWSx53X3Z8YghZBUTTZWoldjAWY10LaTlTyrUUJj3NW1vblQv8Q7MBsG7MlmROWhgyyTj9ZmFIv/y749n2gY1uywiY4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153889; c=relaxed/simple;
	bh=yOYeYbgJNu+4/IFiKsEVyXPmRsGkvcdwy1Eqfae9kfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LrIp0v3EPsX4NDOmn6Dl7Vh569u9vWOHCJF7hm+BU8ZjNTQG/F4O4NUqmG0Fu2LhwUfPqhB/4Kv7IPPAgfkfiH8/0YvSlkoKUs0kSRqf6Qm9Bjym5xfSzn/Xmrh2QegXnYSzyJO2EJKZqRfxVC0u48pgBXFzmvB8MgaKdLz3MXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U6VDJ19C; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b6d41e2ffso941601fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750153885; x=1750758685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RHARBEUV89TVDiEaNXWWLBeebwAXckwH+OfVBzU6AfY=;
        b=U6VDJ19CcpFt+XmxY0s2r+FT+Ss/KKOjKTmbwkUWlQLz8N5pEc7oQ0v3z9JDAoJgY0
         R0cw7wrfnR8TKNUrTRr1aIS2mo2tt8e5je+Gytpr7oNb4rdu2Pv8b4+jFLiood2c0PgX
         /7yI6Wroyt0G0HFlsldxlbdPzwGhCuyQ2y0agyrExo0cqenrKnBWcerITR5krrKkQSUS
         m2luznT2I06fLA5UFYD4Z52tAL+yjjuwqF4aqU+GCOVV4XH0VqO/AyoPu3+EeiIQf1yr
         eDJqt8cDAWDCB9T4fVxUWU5co3G0Os9+cNm3HZ+azNgsOeVT1FGxtF7Gco50bqtgH1mE
         my9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153885; x=1750758685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHARBEUV89TVDiEaNXWWLBeebwAXckwH+OfVBzU6AfY=;
        b=ahIWJVYqHYM2M0TOUjzlVMG2ldbnBJagNYYANzujWV/0JXxq0Uh2LRMFL3lNKcVXrj
         h5y2VWdOFagjsidsZIXv5vzmo2eM0Rl5AT918eCBHS7sXXyczKAMkOYzpjjRYpTytN/0
         azP9G/PSK7ViQe/WBuepG/QWrjeXT5/YLgmaXHQLzF0oyH54SYkujiCFmpGM/Of7zOOW
         2YFTAWMYpwGKOmV7dZWWc31J0ncH2EgK13yIKVu4cyZ1TMkk90lytNSeX8bS3cN/U2WQ
         V0pkovZLHtjbj5bxyeNZlWCxa0z8KhxmrZjiUkMyxu7HbqWd0eCDsK+ENR2Za1PJCpZw
         wUBA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYImGOWEVzLOcuj7EAm9SCj5AF52KDN4tvy4ZI5ieNfrTpGQRMmA8i2bMC7q/dHwIkn+6qcliCY0ybxxx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjw1jirkWFYcxhIHRFQqi/wk7BG50RfO8yx5ykqZaN+7UPkzII
	okWjNH3M42IIIUE/p/3qD+76UBXrG3fj8eP1s9fCC6KjXkbv+3ibdMqAuw26RPwUFYc=
X-Gm-Gg: ASbGncvIyEN05KNGSqcpZUU6m5toxnGVTgfqUsPKCcXvkWK0N36ua/O6VLwv7fnMjxe
	v+QTiyK1ecRCXqY1RUCXO6noCzgrynEvJ4xTaP9vWJma0MRgeQX1C6/AtTEIGC4qDyUGsp1PD5T
	hib2Vwfq881IpqemtY2ctnMwC7nlsqAJfC1e7mwjebTaybYjFBaHoE15Yu0s0JRq1fpvoeLaqEl
	nDklmJYXfki25imG8glFDVO/oVujFEiI5dauEnaAcRVbdSlT+MhmipcCWHe19/nw3wvoNAruu43
	WUGg6jnOoKBXihcROPJ5VYrX2zeSl+DZxJG30hshbon8/ENP4vuHSNhuq7d4hfKgjxR+BBKzS+J
	+wnyyMIPIrJdf3KFSQUbyxy7VQc6sdBFtqu6t5h1+
X-Google-Smtp-Source: AGHT+IHgEccVTzfXChU9HAoUwVJhv+KezddgfFlYxiozymITYUlnF8ezGTk1uMe9nKOYYPA8AsLZsg==
X-Received: by 2002:a05:6512:4022:b0:550:ecdf:a7f9 with SMTP id 2adb3069b0e04-553b6ef293amr1037480e87.10.1750153885126;
        Tue, 17 Jun 2025 02:51:25 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac11ff0esm1830650e87.44.2025.06.17.02.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:51:24 -0700 (PDT)
Message-ID: <83769dc1-9000-4074-bba2-d1bd465b77a2@linaro.org>
Date: Tue, 17 Jun 2025 12:51:23 +0300
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
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4f7225ee-fbb4-472e-8e14-a98f4cef9fc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/17/25 09:32, Krzysztof Kozlowski wrote:
> On 14/06/2025 21:31, Konrad Dybcio wrote:
>> On 6/13/25 8:28 AM, Krzysztof Kozlowski wrote:
>>> On 12/06/2025 19:13, Vladimir Zapolskiy wrote:
>>>> On 6/12/25 10:38, Krzysztof Kozlowski wrote:
>>>>> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>>>>>> Add dt-binding schema for Qualcomm CAMSS CSIPHY IP, which provides
>>>>>> MIPI C-PHY/D-PHY interfaces on Qualcomm SoCs.
>>>>>>
>>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>> ---
>>>>
>>>> <snip>
>>>>
>>>>>> +
>>>>>> +  clocks:
>>>>>> +    maxItems: 2
>>>>>> +
>>>>>> +  clock-names:
>>>>>> +    items:
>>>>>> +      - const: csiphy
>>>>>> +      - const: csiphy_timer
>>>>>
>>>>> Drop csiphy from both, redundant. And this points to the first clock
>>>>> name not having any useful name. Name equal to device name is not useful.
>>>>>
>>>>
>>>> I got the rationale, but I have no idea how to correct it, since it's
>>>> literally the case, the first clock name on the list in 'csiphy'.
>>>
>>> What do you mean by "list"? You can point me also to internal
>>> documentation if that helps.
>>
>> So if you do:
>>
>> "csiphy_timer" - "csiphy_" you're left with "timer" which makes sense
>>
>> however, if you do:
>>
>> "csiphy" - "csiphy_", you get "" and Vlad is wondering what to name it
> 
> How is the signal named in HPG or diagram? It is possible it has a name
> other than "csiphy"...
> 
>>
>>>
>>>>
>>>> What could be an alternative name then?..
>>>
>>> The real clock input name, signal name. You can also drop the names.

That's the initial version of the change, there is a list of two clocks
as a value of 'clocks' property, but there is no 'clock-names' property.

But I suppose I can not keep it this way in v2 of the change.

>>
>> I don't have the docs before my eyes right now, but I would not be
>> surprised if it's also called "csiphy" in there..
> 
> Let's check that first.

Here only someone with the access to the specs can help, when I rely
on downstream code, and it says the right clock name here is 'csiphy'.

--
Best wishes,
Vladimir

