Return-Path: <linux-arm-msm+bounces-89089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E2D21EF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 02:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D543052F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 01:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31FA221FAC;
	Thu, 15 Jan 2026 01:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjnV/2GG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AD25776
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 01:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768439194; cv=none; b=l/ntimi6dSqTvfHIehR6MOyckvcIRtz/mh+2m1+IfZ1H3CAh6U5cuYviA1y74GIImGGK4afpki7wjnTtCw1PfgylNMDeKaMOgf+N1fkHRIKF3sa7kSpFOnS9mPN83ttOkgJz+NCHgaw8+zjOdLwkCLK3zvvk40pi5HCnDLG6gIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768439194; c=relaxed/simple;
	bh=ak4wXOlKry2SCJ882Ud0dTeYa6r7JZXVzc7NkoQyaKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AgUhSLHLhtbjNVssK0c7UgEKzEbw4L5F/RA/IzPpwA1xInlKe5brf79c1bO7V0xvvRErfxu661zpiVP0ofoSbxO4tzpxSeNcQyXL/wdyYCQeFGRu0YagtdWpyJJIbpXFvpYAWDnMNf6jvX/hoRJukaunHNTbFYWpL2T7YReqcxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjnV/2GG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso3310705e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 17:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768439191; x=1769043991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAyxiMZsZyARXFw5fNgXWiXzVahE3Fss7xj/J8Ttyak=;
        b=gjnV/2GGKZFyMedXDt+n1e9eVX8I15OIOsuqUOklI19tZu4RwKe0nbRHwcnRGulitT
         Rnvt+u9IHwagKCvFGaJ0f7bJYekHYULyOCPr61OXL37B792DacIk3NWDWcskoJgCUQ5v
         JqW2drZjTQhqAKq1N0XB8txqk7u4fbLdQHnBnyjQV1kVdYyKIiE8sQ2M11tz9reVZ7AV
         UjgVsaQIU/btbqsMuSh4SybvS9PNStIxLZWc+OZqCob4euZSMRaLWd9jVu7z+NtAiq3f
         cpnTyJjqmvfWIjyDXJ4Trl7qZHFoy4nHqI8DT79L0zdUkhTQlyEqqNwAUZyfpcwKMX+C
         PC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768439191; x=1769043991;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAyxiMZsZyARXFw5fNgXWiXzVahE3Fss7xj/J8Ttyak=;
        b=SPOSlCT+8tHv7/s+AY9hIL8tmhWTH5k+AuwkVcE4wXjYKgLz+ohDc4r56yHd1BMfHE
         zxvmqL9S4GFF9aBlC4YtCysHpf1Uz8Vn7PBayEGJwwX7GsWpWAS4aJpSb3M/cGWNZN+F
         kzfSRUJzXZlo52cQDLhP+tsP27MpfNHCJ0xGG1EHcWBqeg8VD6MZkNv4Wp1XYnx1Ymtv
         fyLIgsCNy83VEkncsunRpwBVMgpoGw4bQt4ecIIDST4ROgwrFylW2aXEnS0kILzvQ0MU
         JytJsOx7HR7ICrM1oXB1LbHZjCP2S5OJsJt6oJNBzKm+8Rdt+8JEhX9G8POOmlWQiYWY
         B//A==
X-Forwarded-Encrypted: i=1; AJvYcCX1xUKeJw5AH8LLiO8/qS9Spf2TB41RaS1vr2xBNeRSz66bANsqZzzF2EFowEtFL31Y0igiJxyZPVCnbthD@vger.kernel.org
X-Gm-Message-State: AOJu0YzdtX7mmDnl+ZdZxZ81rFyxCCOVWdWzFW0bs2tfDyHz7C8mY0vG
	hEoAHpk7A0xXgMPbf3v4yyOmMsmw5tcI+f/Tlm2mJXcg39PaSsAIAyloUg7no6WnMWU=
X-Gm-Gg: AY/fxX7uH4cPTtS7kXi9kMh9MRxNyXWBudjYKz4uD66M6kcXizgCnJSlrQeieKmdSls
	a5AVu9xhUHMMyjo6ouEV1fM1FQ8arCyouAyD6M4qkdeLrobZ/z0SXrhU6cBy+q/ogTAI0jbN9+E
	8YSJrbiB5uvtrzOvmeSJCv4AWT/JpRYcwwUyELdVoX9vDTq/XzNIyjvLDSiKfRE3zlafFW5tmDM
	M3bzepveaX3nzKQLbj49KPZwq+qGM4W4kbsmNpnkKGNdv8AOSLqUAYJxqJUa/kPaZ5BdRAYpzgT
	zZ7RJGtbml347H5+hQVwHy3zkrggotxioyPVcy4TfS0Gwag99WXnKqJtbbmuTVvdzYzF70MCv2i
	NM40sd06wd2iqgqCecBMLCKc5v9QC15bPP1ckz4J2NSToEndRzPCuWvrker6RtLPXIzwSxfGotb
	QFJ4mVamoQBp4CxAFwowIm2Rfuv3f3yy0zGheJy3FIue1lz63UfBy/
X-Received: by 2002:a05:600c:34d1:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47ee47b9e52mr41920405e9.4.1768439190811;
        Wed, 14 Jan 2026 17:06:30 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee0b488d4sm36692395e9.0.2026.01.14.17.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 17:06:29 -0800 (PST)
Message-ID: <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
Date: Thu, 15 Jan 2026 01:06:27 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
 <20260113-camss_tpg-v8-1-fa2cb186a018@oss.qualcomm.com>
 <87a31d4e-b604-4b9a-92e9-75fd2748489a@linaro.org>
 <98a26638-675b-4654-a940-898ba9e1af9c@oss.qualcomm.com>
 <e1907273-3d14-41ee-9a22-a963f2b83d20@linaro.org>
 <a70f69e6-6ee6-4a96-88fc-c0ec4db48697@oss.qualcomm.com>
 <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <641421a6-bf42-49f4-8f94-9cb0bce8e97c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/01/2026 22:07, Vladimir Zapolskiy wrote:
> Hi Wenmeng.
> 
> On 1/14/26 14:18, Wenmeng Liu wrote:
>>
>> Hi Vladimir,
>>
>>
>> On 1/14/2026 1:05 PM, Vladimir Zapolskiy wrote:
>>> Hi Wenmeng.
>>>
>>> On 1/14/26 05:04, Wenmeng Liu wrote:
>>>> Hi Vladimir,
>>>>
>>>> On 1/14/2026 12:27 AM, Vladimir Zapolskiy wrote:
>>>>> Hello Wenmeng.
>>>>>
>>>>> On 1/13/26 11:03, Wenmeng Liu wrote:
>>>>>> Introduce a new common Test Pattern Generator (TPG) implementation 
>>>>>> for
>>>>>> Qualcomm CAMSS. This module provides a generic interface for pattern
>>>>>> generation that can be reused by multiple platforms.
>>>>>>
>>>>>> Unlike CSID-integrated TPG, this TPG acts as a standalone block
>>>>>> that emulates both CSIPHY and sensor behavior, enabling flexible test
>>>>>> patterns without external hardware.
>>>>>>
>>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/media/platform/qcom/camss/Makefile    |   1 +
>>>>>>     drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++ 
>>>>>> ++++++
>>>>>> ++++++++++
>>>>>>     drivers/media/platform/qcom/camss/camss-tpg.h | 127 +++++
>>>>>>     drivers/media/platform/qcom/camss/camss.h     |   5 +
>>>>>>     4 files changed, 843 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/
>>>>>> media/platform/qcom/camss/Makefile
>>>>>> index
>>>>>> 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
>>>>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>>>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>>>>> @@ -27,5 +27,6 @@ qcom-camss-objs += \
>>>>>>             camss-vfe.o \
>>>>>>             camss-video.o \
>>>>>>             camss-format.o \
>>>>>> +        camss-tpg.o \
>>>>>
>>>>> While you're here, please sort and keep the lines in alphabetical 
>>>>> order.
>>>> ACK.
>>>>
>>>>>
>>>>>>     obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/
>>>>>> media/platform/qcom/camss/camss-tpg.c
>>>>>> new file mode 100644
>>>>>> index
>>>>>> 0000000000000000000000000000000000000000..f4c015aafa202e5b64fafa3c543128fda6440b11
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>>>>>> @@ -0,0 +1,710 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>> +/*
>>>>>> + *
>>>>>> + * Qualcomm MSM Camera Subsystem - TPG Module
>>>>>> + *
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its 
>>>>>> subsidiaries.
>>>>>> + */
>>>>>> +#include <linux/clk.h>
>>>>>> +#include <linux/delay.h>
>>>>>> +#include <linux/io.h>
>>>>>> +#include <linux/kernel.h>
>>>>>> +#include <linux/of.h>
>>>>>> +#include <linux/platform_device.h>
>>>>>> +#include <linux/pm_runtime.h>
>>>>>> +#include <media/media-entity.h>
>>>>>> +#include <media/v4l2-device.h>
>>>>>> +#include <media/v4l2-subdev.h>
>>>>>> +
>>>>>> +#include "camss-tpg.h"
>>>>>> +#include "camss.h"
>>>>>> +
>>>>>> +const char * const testgen_payload_modes[] = {
>>>>>> +    "Disabled",
>>>>>> +    "Incrementing",
>>>>>> +    "Alternating 0x55/0xAA",
>>>>>> +    "Reserved",
>>>>>> +    "Reserved",
>>>>>> +    "Pseudo-random Data",
>>>>>> +    "User Specified",
>>>>>> +    "Reserved",
>>>>>> +    "Reserved",
>>>>>> +    "Color bars",
>>>>>> +    "Reserved"
>>>>>
>>>>> It makes little sense to mention the unsupported values, and then
>>>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>>>
>>>> This is for ctrl menu, will do as follow:
>>>> static const char * const testgen_payload_modes[] = {
>>>>        [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>>>        [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>>>        [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating
>>>> 0x55/0xAA",
>>>>        [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>>>        [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>>>        [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>>>> };
>>>>
>>>
>>> This is also not perfect, still userspace is misinformed about a number
>>> of possible TPG modes vs. a number of actually supported TPG modes.
>>>
>> 0x0: INCREMENTING
>> 0x1: ALTERNATING_55_AA
>> 0x4: RANDOM
>> 0x5: USER_SPECIFIED
>> 0x8: COLOR_BARS
>>
>> These values come from the register configuration, these pattern values
>> are consistent with the CSID TPG.
> 
> Userspace should not be aware of such low level details as register values,
> there are many abstraction layers in-between to hide this type of 
> information.
> 
> Writing proper values to registers should be a concern on the driver level,
> it sounds improper to push this simple task and responsibility to 
> userspace.

I think we should stick to the same format as is already upstream for 
the CSID version of this - which is the same data.

---
bod

