Return-Path: <linux-arm-msm+bounces-89093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D70BD22366
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 03:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DACA330274D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 02:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B08E28314C;
	Thu, 15 Jan 2026 02:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QA4C+0WL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA3275AF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768445936; cv=none; b=mnGRE8NjDoMDocvFprAk+t99fyAaDe6mmU0gR3uvZK/48LeIRFVyDZTWxUiyoPUIsjBdYitI4WzlW6zQoxIuwBZoXD4ymc90LZAy8e3OvV2sKMNXe0Hq+FcFawCiLGoAneRQ5olI3JqaYs6vtLCrY57ivFVsQvlhVboCuvhkMoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768445936; c=relaxed/simple;
	bh=G0j5HAiR0C3JJjOni2dZdfpXBmHvJZ29uZYV9H6XczU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nyNA1JGE9/fKsgHEmDWwuwxuI89cw2yfspBVPdvhgyCwfFzcSab3dQtf+3Y6M3ux63c07XS3ftrIZj2IcwP01CwNzwhfbmsLDidnAdZ/vi9nYOHCjU5T6Rxnd/GvA+IIG4UwItLD0YlT88F2WlD+YvkOev+rFwlkPdmahM0C+sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QA4C+0WL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-382fb1e257bso582201fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 18:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768445933; x=1769050733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04QHhzYz2v+yNJO8IS9lKBiZ6dL208fyd5PVe/BXAQg=;
        b=QA4C+0WLTqkasx+paTIXJtFZ3sRTPu9GXmpZWevkRG09GO3+zhSp/n0Mtspa5P1OTq
         tVhoZmctfGe4f/l2sZFeRvRWzCpz0+BL/Zbwe42B2ZxQ+22CE4yU92u9tWOUhDhzgoAn
         /eXL0FdOBNL18omzGV4RRbWPrWWk2ktImVRC91blG/J8exlKR2bnuEpJrn7SDdVHpVuY
         uMoPLgIeIsb9klN40N4hCmSszZx6oaZfwTW8du8GRDLnTc/5Qxb20sMGOl53emmx8QQk
         2JjQhyorVWhHy3dniZIQ7KG9T/IYMZY9wz5U/ex9SYBMSbAJZrJnnRxf2Ep0BRLecmKI
         BEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768445933; x=1769050733;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04QHhzYz2v+yNJO8IS9lKBiZ6dL208fyd5PVe/BXAQg=;
        b=nAWyvgpyw3aRpdTxDnlME76GQ+Se2lrjxx2TsKo1fxDNTVbBF2O1C7REKn5KtijinY
         L8uw22lfWn7/RgUaawAXervBuulmzcM4JGh0dSuQUWcHZBnPUaR+czxqF7lZdkEGZEIc
         THyVILBAr5eFtXeoz30c2H3Uipz3KpiyIOLSOOo9uW5Mh9yNSUGhIAbWwG0y6o0P6i6M
         uaE0SlLuMiZC8qYyQJ/tbFL3BqhoPkguu30z4vAdb96PnYQmYkzb6jSw2DsRV22eabVu
         IZAE4A2lDamOQMqIEGlAloUy0Kzjw3eVg2D1I2Y7dsddJCXSqn33uID0MqMHl4/PXmo0
         Q9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCURk6aHS5F1GYPVWpjPSsZPGOSC2J8fnPX6964YW4PGfBJwNTkweVebW53LPRH/RJks5Pyi7Xz7OJFfCafn@vger.kernel.org
X-Gm-Message-State: AOJu0YxEAZyI26IGWKPy1mv6OO+2avvg4xSc7XaYguKdL/gbY2+PmvEy
	9wcQKb0x8oJP3BikjOPvaZEO/vamuxRy3HgQ97ySq9NVvgx4M4reaN8PVrjwiZfTOdQ=
X-Gm-Gg: AY/fxX4wn4mzjc7cBJeRu1t4Lt8n9e8ZTRxefg5LEc4KfzNiSnJFMSfNo5SDna2cxhg
	VSiZ1dfTL0OUniyfLxxR9+Tzy/MgWU1L+oY/7oSKttHN6l8LHTz6bx13fPoHwo1577JoxotRXvO
	8WURsoLVq4o4AIWfOV0NL3GuiE/SkzgitUfe0oaWVafjhLb18p+Cxdh0CcanQXvmCpS1domHrBo
	4SLwx4dGVhVaTuLLaAEz2ljMh9Wpg2GJJuLZcyb2Gdgwgv+jnoz0Pyvfkd3lREBZLE5ssgxvo0V
	x2MrWop7eWB010PDOxR8i/7qrY0pwhq7Ke/3Dm3oC451GtqixV51uEFvy0PEeFN/om1GjOiM0ZR
	L7OrSyQTzg72P5rxBfyMS+kl8oG7fZ/VLcuWG0RhjGrBzdPZo7GQeBqb4JAEt+/++75xgcM0+up
	O0ScoqmXEOU/trhV3GtoMQEFX0E1TDcBUlVe92BGhvaWfxEc7+/IwtJbWwNWJi1mgdTQ==
X-Received: by 2002:a05:6512:4017:b0:592:f383:3aad with SMTP id 2adb3069b0e04-59ba0f9f61emr890004e87.8.1768445932776;
        Wed, 14 Jan 2026 18:58:52 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba1045c55sm1219619e87.80.2026.01.14.18.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:58:51 -0800 (PST)
Message-ID: <f1c4288f-983f-4a62-82fb-22d1ec56bed0@linaro.org>
Date: Thu, 15 Jan 2026 04:58:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] media: qcom: camss: Add common TPG support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <f77e0d03-ba4a-4722-b575-7aee8e93f04b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/15/26 03:06, Bryan O'Donoghue wrote:
> On 14/01/2026 22:07, Vladimir Zapolskiy wrote:
>> Hi Wenmeng.
>>
>> On 1/14/26 14:18, Wenmeng Liu wrote:
>>>
>>> Hi Vladimir,
>>>
>>>
>>> On 1/14/2026 1:05 PM, Vladimir Zapolskiy wrote:
>>>> Hi Wenmeng.
>>>>
>>>> On 1/14/26 05:04, Wenmeng Liu wrote:
>>>>> Hi Vladimir,
>>>>>
>>>>> On 1/14/2026 12:27 AM, Vladimir Zapolskiy wrote:
>>>>>> Hello Wenmeng.
>>>>>>
>>>>>> On 1/13/26 11:03, Wenmeng Liu wrote:
>>>>>>> Introduce a new common Test Pattern Generator (TPG) implementation
>>>>>>> for
>>>>>>> Qualcomm CAMSS. This module provides a generic interface for pattern
>>>>>>> generation that can be reused by multiple platforms.
>>>>>>>
>>>>>>> Unlike CSID-integrated TPG, this TPG acts as a standalone block
>>>>>>> that emulates both CSIPHY and sensor behavior, enabling flexible test
>>>>>>> patterns without external hardware.
>>>>>>>
>>>>>>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>      drivers/media/platform/qcom/camss/Makefile    |   1 +
>>>>>>>      drivers/media/platform/qcom/camss/camss-tpg.c | 710 ++++++++++
>>>>>>> ++++++
>>>>>>> ++++++++++
>>>>>>>      drivers/media/platform/qcom/camss/camss-tpg.h | 127 +++++
>>>>>>>      drivers/media/platform/qcom/camss/camss.h     |   5 +
>>>>>>>      4 files changed, 843 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/
>>>>>>> media/platform/qcom/camss/Makefile
>>>>>>> index
>>>>>>> 5e349b4915130c71dbff90e73102e46dfede1520..d355e67c25700ac061b878543c32ed8defc03ad0 100644
>>>>>>> --- a/drivers/media/platform/qcom/camss/Makefile
>>>>>>> +++ b/drivers/media/platform/qcom/camss/Makefile
>>>>>>> @@ -27,5 +27,6 @@ qcom-camss-objs += \
>>>>>>>              camss-vfe.o \
>>>>>>>              camss-video.o \
>>>>>>>              camss-format.o \
>>>>>>> +        camss-tpg.o \
>>>>>>
>>>>>> While you're here, please sort and keep the lines in alphabetical
>>>>>> order.
>>>>> ACK.
>>>>>
>>>>>>
>>>>>>>      obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
>>>>>>> diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/
>>>>>>> media/platform/qcom/camss/camss-tpg.c
>>>>>>> new file mode 100644
>>>>>>> index
>>>>>>> 0000000000000000000000000000000000000000..f4c015aafa202e5b64fafa3c543128fda6440b11
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/media/platform/qcom/camss/camss-tpg.c
>>>>>>> @@ -0,0 +1,710 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>> +/*
>>>>>>> + *
>>>>>>> + * Qualcomm MSM Camera Subsystem - TPG Module
>>>>>>> + *
>>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its
>>>>>>> subsidiaries.
>>>>>>> + */
>>>>>>> +#include <linux/clk.h>
>>>>>>> +#include <linux/delay.h>
>>>>>>> +#include <linux/io.h>
>>>>>>> +#include <linux/kernel.h>
>>>>>>> +#include <linux/of.h>
>>>>>>> +#include <linux/platform_device.h>
>>>>>>> +#include <linux/pm_runtime.h>
>>>>>>> +#include <media/media-entity.h>
>>>>>>> +#include <media/v4l2-device.h>
>>>>>>> +#include <media/v4l2-subdev.h>
>>>>>>> +
>>>>>>> +#include "camss-tpg.h"
>>>>>>> +#include "camss.h"
>>>>>>> +
>>>>>>> +const char * const testgen_payload_modes[] = {
>>>>>>> +    "Disabled",
>>>>>>> +    "Incrementing",
>>>>>>> +    "Alternating 0x55/0xAA",
>>>>>>> +    "Reserved",
>>>>>>> +    "Reserved",
>>>>>>> +    "Pseudo-random Data",
>>>>>>> +    "User Specified",
>>>>>>> +    "Reserved",
>>>>>>> +    "Reserved",
>>>>>>> +    "Color bars",
>>>>>>> +    "Reserved"
>>>>>>
>>>>>> It makes little sense to mention the unsupported values, and then
>>>>>> introduce enum tpg_testgen_mode to list the supported ones.
>>>>>>
>>>>> This is for ctrl menu, will do as follow:
>>>>> static const char * const testgen_payload_modes[] = {
>>>>>         [TPG_PAYLOAD_MODE_DISABLED]          = "Disabled",
>>>>>         [TPG_PAYLOAD_MODE_INCREMENTING]      = "Incrementing",
>>>>>         [TPG_PAYLOAD_MODE_ALTERNATING_55_AA]       = "Alternating
>>>>> 0x55/0xAA",
>>>>>         [TPG_PAYLOAD_MODE_RANDOM]      = "Pseudo-random Data",
>>>>>         [TPG_PAYLOAD_MODE_USER_SPECIFIED]    = "User Specified",
>>>>>         [TPG_PAYLOAD_MODE_COLOR_BARS]        = "Color bars",
>>>>> };
>>>>>
>>>>
>>>> This is also not perfect, still userspace is misinformed about a number
>>>> of possible TPG modes vs. a number of actually supported TPG modes.
>>>>
>>> 0x0: INCREMENTING
>>> 0x1: ALTERNATING_55_AA
>>> 0x4: RANDOM
>>> 0x5: USER_SPECIFIED
>>> 0x8: COLOR_BARS
>>>
>>> These values come from the register configuration, these pattern values
>>> are consistent with the CSID TPG.
>>
>> Userspace should not be aware of such low level details as register values,
>> there are many abstraction layers in-between to hide this type of
>> information.
>>
>> Writing proper values to registers should be a concern on the driver level,
>> it sounds improper to push this simple task and responsibility to
>> userspace.
> 
> I think we should stick to the same format as is already upstream for
> the CSID version of this - which is the same data.
> 

It is not the same and it will not be the same, if the currently presented
version is taken. If TPG modes in CSID are continuous, here they are not,
so it makes a big difference for userspace, and better it should be removed.

-- 
Best wishes,
Vladimir

