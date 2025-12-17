Return-Path: <linux-arm-msm+bounces-85418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3A5CC58B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 01:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32A593040A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 00:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1512171C9;
	Wed, 17 Dec 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRESunnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898E43D6F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 00:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765929729; cv=none; b=c8XioIxkGU95qbSqN8+3lOF17W9qhGJe42GzjZa7dPtHFgSIBncA3HSgNXQb1NpTGHMnu7EDcfYqrn2UNfUbUhaFU0rCqIQV5VP2F0n7OKWC/0iau++ASstELSv9N/NC8tsnje9HCjJFojuazh0cyKc0P3IkYta8rMSaKNwmycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765929729; c=relaxed/simple;
	bh=4fX+V0YnP016/orDpEqU5FVPZMbBz2SoqmDB72xWnxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fD/Wm0KavgDciPnTNlvedqKTmarWulRluzNM2vZOZIAnaSung/IQmlprMA4+/3IPXKhRtDy+a4TXn6UYlWx95CsMAFN/FSP7iEYdW1KOXhiul6SE70cEo5kvHiv+XRZvlBSafiqDsivXuYYul9fkyxF9rzx1i9o23g9imfBHJP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRESunnf; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5990ee705e6so167440e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765929725; x=1766534525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IESsZe/W5RT7xiwRsUhKBankOTgyA4GaQytGF+x9/ao=;
        b=PRESunnfy0Y4ZNiGwe53/eeaSy5yUJVJqkDakXGiRmMu25eT7vzfKnBAX5odfvmAcB
         7ZO/wPbN8DjQqX062y++qlz+SHqVdWkIXqxJgi3jRFSjfoTYmEvRgKBvtKple3toUcmm
         fj2cjRa18bF365MvODRt/VoYmDtZBDXS7HTL21Fp9C1g3pyLaQHN/glrLenhGfJB0TJp
         /8LKcepHiQSjNTqeZ49YLpTZNWUVXs5FloXRUz/HLZYWaqtXyfmzP/QjDnat6uuYZXWP
         +e0s6lkH6o0Z/Q4ZBYX/zTRoEl5yaZeyyo33iIKMjX6qJWGJ9uDVA9tByVHznqLVQVLH
         Xk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765929725; x=1766534525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IESsZe/W5RT7xiwRsUhKBankOTgyA4GaQytGF+x9/ao=;
        b=PXqbtFr4e4FIz+q9zIgYvBQHUUFIeaaJLWYRySa1beYHF9f137NLatHk9sv9D8mnxd
         aJg0GlOnKIcg0vxLIUDHRY9dyYaMQahikooXZ1L4Vctn0Kdls8J94K/ZQjJodpGD/mqm
         ewf8xeHImgIlrqB4YEFis/4DFygnzIiAcTk9+2sR0f8eRmZrDgwhaDcd/kKzpm+9b78N
         b+NooZyXMqIGlbJ+Kqks3kTFHfVfg0jJTSz0wRENJiGkhFwx0xIxx+XiXc84mgUV/Dvr
         lAHc98+yJMUQg0jK4a60kwJNXd01bkGlwDjyVflPAtrNL5MvDd32TbdmXYRTLxoh78dM
         44bA==
X-Gm-Message-State: AOJu0YwOjMaYc4vDrEWCaCPIj3wsFTSz9WeobQwkwiJGyR7yYGVrejSg
	W7ncJKkHjsoa436ryjugvLNEem8/Fe2/zkBTEy/mgwPak8Jtmipy8hsv7I0YrWzqsxE=
X-Gm-Gg: AY/fxX4vfBzohYwJ+EU1+z3+Yzo+CdkSFhAO3AYCmVZeNJI3odX32SO0nexn8ntktx1
	VqKf/2QUSK9woa9xEPCfR3M5RVejP6N98GdFtyOGKcPJ7VRCfA5jW3+0ByRYdr5KKDuwWvIo11o
	+tAyybQ3cbAmmUG73x50uYO/25gBTJYIMp41mbRFEKaoIo1Iuwh5cSmbfUq0w6KouTAFOIZNU3M
	GTWMiIYwWNhkZRidqnkJDAOh0F3/ftX7eid7a7EHmFcT2FGDBFpxvsGAg+Wkl91UNo1SBzcs/et
	K3Vq0NxEWeyQfB3vMPG162bC7XHsauln12QrdgLJj0ctvdfm8R4qWJEdCABE/E5Z3YLCLvTSQHI
	V0i19B/980bdvC9LVkho2m5yF5UDdcLpXiDRwBxz2ZpbSbSkoqjANyGktAZ0ujMHhA1GDt6Pjyj
	awItI8gbB4MXRBj+MpjcsghfPzXEF/ICWWx20qESMc1RbHJ8VSiR8g2rAYfLiPypLJXw==
X-Google-Smtp-Source: AGHT+IFrCa4ZjN33CIw4ShWO7Hf+XIWaZzk0eJOF4MY7Y25K8sz5SXR5eCMOVJwo9hvvGRP1v96ung==
X-Received: by 2002:a05:6512:3f1a:b0:594:4c87:a8f9 with SMTP id 2adb3069b0e04-598faa62e77mr3237266e87.4.1765929725412;
        Tue, 16 Dec 2025 16:02:05 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1aa2dsm1454881e87.42.2025.12.16.16.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 16:02:03 -0800 (PST)
Message-ID: <eff759a7-06ee-42f5-a3a6-860956d7ae84@linaro.org>
Date: Wed, 17 Dec 2025 02:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
 <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
 <2d7ac7e8-ab69-44a6-b732-3657abf3a5a6@oss.qualcomm.com>
 <ceeee542-a319-4ad9-ada8-3dc769599dec@mleia.com>
 <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d1fb4d8a-608e-44f5-834f-fa92d487c75b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vijay.

On 12/16/25 19:55, Vijay Kumar Tumati wrote:
> 
> On 12/12/2025 4:49 AM, Vladimir Zapolskiy wrote:
>> On 11/18/25 20:44, Konrad Dybcio wrote:
>>> On 11/18/25 7:25 PM, Vijay Kumar Tumati wrote:
>>>>
>>>> On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
>>>>> On 14/11/2025 03:29, Hangxiang Ma wrote:
>>>>>> +                  <0x0 0x0900e000 0x0 0x1000>,
>>>>>
>>>>> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of
>>>>> the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>>>>>
>>>>>> +                  <0x0 0x0902e000 0x0 0x1000>,
>>>>>
>>>>> Same here.
>>>> Hi Bryan, HLOS does not have access to those registers. They are
>>>> configured by the Hyp.
>>>
>>> If that's hyp, please add them. We already have platforms without
>>> Gunyah. Remember, bindings are defined once and for good and I wouldn't
>>> call it impossible that someone would want to run that configuration on
>>> Kaanapali some day
>>>
>>
>> If the ICP register block is added now, then it will practically exclude
>> an option to run hardware demosaic on Kaanapali. There were notorious
>> and still unresolved problems with CSIPHY blocks, which shall be split
>> from CSID/VFE CAMSS on device tree level also, for similar reasons the
>> same should be done with ICP or other blocks. It makes exactly zero
>> sense to pile everything into a monolythic device tree node, and doing
>> so undermines any future advances in CAMSS support in the upstream
>> Linux, the hardware description in downstream is done thoughtfully
>> better,
>> and not for no reason.
>>
> Hi Vladimir, yes, this has been discussed in the past and the general
> consensus from everyone is for not blocking KNP series on this. But yes,
> there is an ongoing effort to modularize the bindings for future
> chipsets and when it's ready, we can review, discuss and take it

My concern is that it makes very little sense to throw any not clearly
defined hardware properties and interconnections into an unorganized and
unmanageable pile of everything, because this closes the door to ever update
the upstream CAMSS driver by adding better CAMSS IP support for any already
manufactured and sold Qualcomm SoC powered board with done CAMSS support.

If some user already holds a phone, a laptop and expects to offload CPU to
CAMSS IP one happy day, it's pretty unsatisfactory to say that it will never
happen on legacy hardware, because there was done an unrecoverable mistake
by adding never tested properties into CAMSS DT bindings, and the remained
option is to "wait for future chipsets". Each added unsupported and unused
property boards up the window of better CAMSS support on manufactured boards.

I don't understand a reason why to do worse for the upstream, when there is
a clear and feasible alternative not to do worse, thus my misunderstanding
and my grief for upstream CAMSS are my concerns.

> forward. As for your ICP concern, if you are referring to the Demosaic
> in OFE, I believe we might still be able to do it either with direct OFE
> config from CPU or using the firmware (preferred), given that we
> properly establish the shared memory and SID IOVA ranges for ICP,
> assuming that the load and authenticate will be taken care by Hyp or TZ.
> Please share your thoughts if I missed something.
> 
> Hi Bryan, please feel free to add your thoughts.
> 

-- 
Best wishes,
Vladimir

