Return-Path: <linux-arm-msm+bounces-62480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79FAE85A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7ED3C7B5CA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C873B2673B9;
	Wed, 25 Jun 2025 14:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTOFuJPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5ADA26738B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750860429; cv=none; b=eCJRF2JQO7Lf07HSKa4I1XmrqxpbKYG9/KpjVVeNGdL8687HzCLfvFePRsHUF+BuZjRUU/ZziPTXXRLhfD57yU9hsbGKstHYsKu7aT1nIhRw9VAwk4hg5AUUTek+0IVvArF7g/4dbKJuWZ+wWs5lZaI7v0cMIkBOc8g1EvcB+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750860429; c=relaxed/simple;
	bh=oOhaT8mTYEY5X5et6rvG3bx8HBvDxtByzzQfyXrYKlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVYSqHgEhPQu0Cq9HmovNOUyCjklwkWFyAFAFLA9mHvtg3wyTlIsGSmoL4Lmj3l9pbae4/tgDl/MFnl4AL7r8TOCq5A5nINgsviQFdWAZSaokAS7BqcmG3VVGsKVWTRJ3c3kzKsHdOZy0H4B3IyfGl1mKOwtbCwo+JrJoQVllRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTOFuJPa; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b4c37ebf3so3831291fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750860426; x=1751465226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x9U+9h12lJAfO0glI+fb9gKVyQtO2npmEpYVEgQ5jDI=;
        b=GTOFuJPakG8ntWv8k0qmI6iA4uwiCMc8KNagnkzZSCVDmUyGu6e71f+hwe7KP1D0T0
         AA5d1k7cdnJO8l1Qb+yZQCfLUym4AOB0vxilEus/trGcHI6FY67fkvRHhZammf2hb3Ly
         SiH84VweJ1oNZEhmcO/RhVHfYoyF/wZgFgvZBLIraTtMDR+gMoko3ltIpEDxJkBRqMAG
         gg3UCuNDE8T2PBi8YihOwoG3aWtuMkNqHBTRQQlxCDWUVLkKyC20azMMyzZw4uGRdmlT
         //Bp5IIZVNCxKLeVlUr7rx/JmvXdmByuiOdK2J2ZCEJioW0d1Qzk6djphapaoIN65oE/
         o4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750860426; x=1751465226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x9U+9h12lJAfO0glI+fb9gKVyQtO2npmEpYVEgQ5jDI=;
        b=gSB/UpC3b6mf7tTk8+C15F7BwPSLM7SY3fszJmQyiNJ17BmHmiZo2Ut7piH7lKEf/+
         vfWDktjm2g/rC02ibQ41P42m7Q77NTALy0qr/VlQtL3purmm6+IuEBIpOgQKv4n59bHW
         GrYc4uqyLI+lec8DNxWV0zMcW0yudIIVY8GW8Qev1rywJmMbGmh7RRwo3IcfLPHjTcV2
         YCE14qIsElQboHIVN+iYfbfn/YC6zKS3SJpeoYG4RC8SMD2mT6lY2ssSviahEd4Knx+L
         PoNjcKn6vWMmT57E6M5BJtRcufi3MLMFviNZwgZ2PVn6TI81y9D+BwT6Z63NDc2ZrWHq
         7yHg==
X-Forwarded-Encrypted: i=1; AJvYcCWakAB859JmqG+aLQo91Jcu+edO8S5uvdOK0H43B/mJs3L+4TWeL+jjwoIr01NQmI+5BV7SsMa/rGiG6S1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0sw5WTPv3hY2Ew3XoQ9ynwtIqs37A0QavFUSZRJVb26Jq6O7/
	PSnMpTsgOxJzLY8YLEVksRQzA8YANCwipSi6V+53IqPBMOlNC0t7kihlgwHSXPAsJGg=
X-Gm-Gg: ASbGnct0OYPj6vS4QkOAGo4zH2CGcyjrOTNbtZS0lAEot4s9YMc/xu6zFJMb5OMrNbK
	r63G08eQW3Npp8QIk21YaS6pMRzhCq0F4W6lMZ2YVB+wQJ6/HSD43siFSoj+eULmULgbmgqllSC
	d+labZnROWuAE9FOFlAe7qknXJgji0BShoENo684rFRJrlkoAhKeWkf11EZAuB3+K9rwYkuOJ+K
	XboSAcCITovx/6S43h3/oJfeP4zknHSLkXLHoLgjwxHK7rPRi3vVXLWGYzDcZEp/D/HMVtOgZmT
	HLv1qKUSP/vua1ZuL73/e24hu0wdptQ8LIoN0t0eezcNqaYEwGv3D22VWsucOJ2pLmEuKaZRv2d
	Qy7/L/8aHV1ZRA6rYxnkifTsAnRqibL0kBzeEsw1p
X-Google-Smtp-Source: AGHT+IG8sE28xELVkAXdzTaChY6Ag5Ds42n+2E0Ni8kbtssG1by8s3qZhrB18Z2t3kMbNyJ5nXk4AA==
X-Received: by 2002:a2e:a54f:0:b0:30c:40d6:f564 with SMTP id 38308e7fff4ca-32cc655e9a1mr4393141fa.9.1750860424131;
        Wed, 25 Jun 2025 07:07:04 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f594ebsm20117791fa.10.2025.06.25.07.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:07:03 -0700 (PDT)
Message-ID: <e0eb8d55-b4fd-4f3b-94b0-5c56d48b4671@linaro.org>
Date: Wed, 25 Jun 2025 17:07:02 +0300
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
 <c29385d4-30ea-4774-9cf9-699b08e29800@linaro.org>
 <329b89a4-85a9-496f-8b1b-6239dfc9057b@kernel.org>
 <930edec1-7403-4ecf-bb17-2e68b8d351f8@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <930edec1-7403-4ecf-bb17-2e68b8d351f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/25/25 10:01, Krzysztof Kozlowski wrote:
> On 25/06/2025 08:58, Krzysztof Kozlowski wrote:
>> On 24/06/2025 15:29, Vladimir Zapolskiy wrote:
>>> On 6/24/25 15:04, Krzysztof Kozlowski wrote:
>>>> On 24/06/2025 13:38, Vladimir Zapolskiy wrote:
>>>>> On 6/24/25 13:10, Krzysztof Kozlowski wrote:
>>>>>> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>>>>>>> Sort the entries of interconnect and interconnect-names lists in the
>>>>>>> alphabetical order of values in the latter property.
>>>>>>
>>>>>> We do not sort these entries alphabetically and you did not explain why
>>>>>> you are doing this.
>>>>>
>>>>> I did it, because I assume that the preference is to sort all named
>>>>> values alphanumerically.
>>>>
>>>> Where is such preference documented?
>>>
>>> There is no such preference documented, as I stated it was my assumption
>>> and it was based on your firm insistance to apply a particular sorting
>>> order for regs, clocks and interrupts properties. Apparently you are
>>
>> Hm? And the rule is by name? I don't think I ever expressed that or
>> insisted on some sorting by name. During previous talks on camss
>> numerous times you ignored the ONLY rule of sorting I was insisting:
>> keep the same as all other devices. That was the one and only rule.
>>
>>> fine with out of the same sort order for 'interconnects' values, the
>>> criteria of picked properties remains unclear for me.
>>
>> I don't understand why it is unclear. That time with Bryan you both
>> received VERY CLEAR feedback from me: there is no such rule of sorting
>> any values. Yet you were pushing the discussion and patchset like there
>> was something.
>>
> Look, the first reply:
> 
> https://lore.kernel.org/all/65e5796a-8b8d-44f0-aef4-e420083b9d52@kernel.org/
> 
> "You are supposed to keep the same order, as much as
> possible."
> 
> What rule is unclear here?

At the moment of the given comment "the same order" was not "sorting by
values", it was "sorting to address".

Check the next message right in the same thread:

https://lore.kernel.org/all/c1539cce-92eb-43fc-9267-f6e002611bbb@linaro.org/

"We always sort by address". And that was the correct statement at
the time of the discussion.

Did it help to "keep the same order" in any sense? No, the message was
plainly ignored, and after the long discussion with you the sorting order
has been brutally enforced to become the new "sorting by values" order,
and to my sincere today's surprise there is no such rule. Apparently now
I have to believe it was Bryan's and my voluntary and deliberate decision
to change the sorting order, all right.

> Even more precise reply from me:
> 
> https://lore.kernel.org/all/8f11c99b-f3ca-4501-aec4-0795643fc3a9@kernel.org/
> 
> "I don't imply sorting by name is any better."
> 
> And:
> 
> "The only rule is that all
> devices from same family type must have the same order."
> 
> 
> And now you claim there was from me "firm insistance to apply a
> particular sorting" in context of name?
> 
> So again, my entire feedback repeated multiple times during that
> discussion is totally ignored and twisted to some fake new rule of name
> sorting.
> 

Thank you for the explanation, and not just your messages are ignored
sometimes, it happens with anybody regularly.

--
Best wishes,
Vladimir

