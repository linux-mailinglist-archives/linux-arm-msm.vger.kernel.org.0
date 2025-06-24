Return-Path: <linux-arm-msm+bounces-62223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44494AE6679
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EF45406D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191C52C325A;
	Tue, 24 Jun 2025 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byoPBbY3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAB2C1583
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771774; cv=none; b=lhssOESkupmYl7eOSlPKMTfz7hDYMOQklIA4zYrdC7284370oBOUSydLrFkIcacHV7IoLhRQYciB/aZ2R6Lrh9D7Pm0d4K/fCeeCS++I469letTu3beOlaKcEwobH1JhNKMl6qAur8Q7mOdgsuFvLrlqvPw4pkWvU7dbSfB3K14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771774; c=relaxed/simple;
	bh=KkGuUQ1jO44VkHngKbwwZg2hXuZAc53zXvsEALMTdVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IipilCreXuVUij7QR0l+0fm0927koQuP+m31z87ZuuEUT7J4rZOYci3X1a1GvgGuMZs1vbzjQ/2l0kUe/XiVrOQa5wj4aZ/irRy71wzSOfJvN/w7J+TH0EI2yH0RZ9zIOVKGvUy74c3plICHqs9pkimN79HpExA+3XIlBH4SV3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byoPBbY3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553bcf41429so367590e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771770; x=1751376570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MLKEW0O/I/yGtGiPGESO1OSUMKreNoFwAhjoXeg8po=;
        b=byoPBbY3udkIICsafgYPb2WA1zYbd/DnfFFOxTZ2dK++/oEcxh/b8Ff/njdLq/DeWl
         zXlIxX51LlFu6UjZn5H3xy4phhuqPkN0WV4qQn718NUeGuAl7fyoDTJBhCcG7EGHgLbd
         JxSjelOhTLwdpjHaBc7XPwvrZja9ksrVIAlaE3mbvLFDbDoZrHVRjbweQprkKGNORRCC
         7TyZRldVeLzEX7WVohCPWV3LLLGbrcMi/Lo98gH2OEZXT17HWByBkXXBd9Xc88XOSxQf
         A1bNFHN6cFtj1ZYEdcuZvQgsyMTR5ZEk8slZvPXAK4xw4PecGsBUWmYyRq6OxKadDD6d
         0xCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771770; x=1751376570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MLKEW0O/I/yGtGiPGESO1OSUMKreNoFwAhjoXeg8po=;
        b=Nagaq9ElmGEerCoEiH4XnODGUu+DMIV6lo1ywvUK05uHr2sElCSMrNpy0ousIDxpzC
         RmTT9Z3zBV7aT76RaG/Z5ke2JIq/HuBH2vItro+uFlPCx/Dp5CjN6WcGgbQr33cBTKhJ
         rXTC+26eym203/Qijqd1l6eR8ejNlsK0oU+Mrw0P5p3BDTk6Z6MboqgaQKZ9yQT91XAi
         qQ9jxWnwkhJzOg3dGsLy6P0AB0+UrWqRJaDM4Vb6NbfoYBdwKfRZ/wwB25Mh71sfN2hD
         thkW0b6++iP0BBR4Ihs/FePb8PRgMd5AohoUAtqOxx3tkYn5lGIk5ad3k5viJcwklmr4
         t1Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXgCBnp/a7RG3ZmAaMl7Q3ywwY96zvFNaq9LJt7a7aUtBMix7kOoJCsrqTvHokQ4UEnMHsvR2hEv58NuEb7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6g9aoVoIApEk4xtpJavZJ6CUg6cPfA/4LkH2LO2kYxv+xluB
	p2D/4/tNlIEGnb3Fvg0nQBnQAHFGtcWUhwXQ0AABlV0FbkjAduvzn2wW2ZoS8S3tn+o=
X-Gm-Gg: ASbGncvEiXtnMQS9nzb4NhLteVtCO8OBngI48Zw/c2vkXYL583zqhvbz220r+saoIEs
	+4KDnhcFNcJFf7JIvhLL/7gLrjBbNwUjwVy3aOIjPmunvhyTDArcXSRvImyfagmhxCsdbrTFMFz
	bAgqq2vJt0DIXEo1ZunbnsIZ2iNL6YXADLxEDnSrgUMN2wIM9P6aGlApbHVE7z5o+6SR77jjUob
	AnxJiGwZty0FTRrr03/KJo4idVrx2Ngmn4FIA5hkDBYmGSNBkwvGIslxVjp8LTF0BK5m2frYUFv
	MSmtPu2yxNblXAJXntu6uMK3d5CYEItTkOQ9jp/IAluCmOjPMqTQfFxSPGjRxI9gvBkp999uzYx
	Y5QCZG+J1xcaidrcBlcmYMM+V1iopBsWaWUb6gDlC/A8jyCuXaZg=
X-Google-Smtp-Source: AGHT+IGvDSwwMCcOPXsenn7I5P7Tg6A5E1lHNYZ5jImzp3hQ4To7P36CxWECrV/a1zEmeSJjd7sc0Q==
X-Received: by 2002:a05:6512:3b8d:b0:553:35ab:30ae with SMTP id 2adb3069b0e04-553e3bfa0e3mr1661558e87.13.1750771770237;
        Tue, 24 Jun 2025 06:29:30 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbba4sm1836925e87.109.2025.06.24.06.29.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:29:29 -0700 (PDT)
Message-ID: <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
Date: Tue, 24 Jun 2025 16:29:28 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
 <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
 <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5a5b78f7-e156-4c5e-8407-b249040e227d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 15:04, Krzysztof Kozlowski wrote:
> On 24/06/2025 13:38, Vladimir Zapolskiy wrote:
>> On 6/24/25 13:10, Krzysztof Kozlowski wrote:
>>> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>>>> Sort the entries of interconnect and interconnect-names lists in the
>>>> alphabetical order of values in the latter property.
>>>
>>> We do not sort these entries alphabetically and you did not explain why
>>> you are doing this.
>>
>> I did it, because I assume that the preference is to sort all named
>> values alphanumerically.
> 
> Where is such preference documented?

There is no such preference documented, as I stated it was my assumption
and it was based on your firm insistance to apply a particular sorting
order for regs, clocks and interrupts properties. Apparently you are
fine with out of the same sort order for 'interconnects' values, the
criteria of picked properties remains unclear for me.

>>
>> Since my assumption is incorrect, I kindly ask to let me know, which
>> properties should have values sorted by alphanumerical order of
>> ${property}-names values and which are not, there should be a method
>> to distinguish such different properties.
> 
> None of them "should" as in "break ABI" or "change something later". I
> don't understand why again we keep discussing such trivialities which

A triviality for you is not a universal triviality, that's why people
ask questions to remove uncertainty, the question asked above has never
been discussed with me, and the answer is not given also.

Regarding "breaking the ABI", it's been discussed earlier that no dt
binding user in the upstream implies no ABI break practically.

I believe this change shall be dropped from the series, it's not
important at all.

-- 
Best wishes,
Vladimir

