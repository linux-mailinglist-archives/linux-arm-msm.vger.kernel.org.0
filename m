Return-Path: <linux-arm-msm+bounces-50045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD1A4C9D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 18:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A75D817DB1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 17:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93C021D3C6;
	Mon,  3 Mar 2025 17:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7V0U+X+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E88215058;
	Mon,  3 Mar 2025 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741022295; cv=none; b=VOcfc6aSOEJr14OVHHXeqvZ0eiWYxui++loHp6y3bgr6YmJ4nBYqM7QfRW+u7o0PiUUMiGfO6z9iIunsoc9t1n9VzAdAUQIov3SLmkUeOzZmqgkOnnD7kkCOMlPfhlO5+IhoJvEUSXZPcxiuwnFi11Tu/5U37HaVCOhB1SRHfq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741022295; c=relaxed/simple;
	bh=K3f+hP5t9ewtluT0jldKg8o6hk6upDlrFdMEHUxzmUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bW16REnEIGyi2y/3QxYdoIZgqMgzEjLtY19bTHBNKKXxlpCl3iFjMYIjv1J7KNbJIxXrilj2iDbS1u2x6JRauH3+V2Gk2uIN5pS8ZTx/0Rlk3pN0RMXJc0KsFQk5I13YKIFBIa/mBk9CtXftSajxD4IxVkTNLZKIr2x/dmd8XjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7V0U+X+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo3293889a12.3;
        Mon, 03 Mar 2025 09:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741022292; x=1741627092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sE2nwe2DjINW/dM2gZS6aKt8qAr3QCojkbk7uIqO54s=;
        b=S7V0U+X+KVCpQOhbcM9IOJUUJnlDTDAWSGoiRFdgi1miUZGuVCpOvha2vAqMBZK6zx
         lELSx+a0tfvk83mJtIcWgXH52X1O4GKnWLRa8YDXIltOj+CReuDrXNcNIWa/+hthYcyZ
         B1F0H4RozUT4uEPtCmCUjbv6jA2RZ7FNyZ7vhHvxeOsUi3QEDfdEn3HatlEs7AOIwiNo
         KOeGOM1pDyD2ifq7sNwjl/r1AlOzUHUYeYlivf1ibgrNV39adKcDywnzbni5RxNImktP
         c0l9fDWryMQw/as+LwVUu+C09mj9WiVti6qgdUcMcPcNrQIgRj+0NkpxxvNE0pIempnE
         Lw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741022292; x=1741627092;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sE2nwe2DjINW/dM2gZS6aKt8qAr3QCojkbk7uIqO54s=;
        b=bctevaHKftpAW7G9G1sy6RVh1RahEwzOA3DcC6fju8jujmHJTKtgGXMBFqRLEXf5XV
         QzL3kDclQawxEmV9NnPLseaQNg0FTy6ZdmNEVo4mjjuS2QzwdETQj7KNLfoRchCGiLuk
         t6/nHHINUICOqGdntU5qhXCDn0OLi64+5Wy12CEtwc2r2XG3MExifMUAM0aNzKbUS4c1
         v/JlAWZuhC735FXLoSnWaj/gPBGHWGI7oOZHfd06hAB5lVGbxuWi0aM6bCHmKIK41yOZ
         FzHXFanoHOJvTgzRm/ltiWuEc9XHceASl/O12kwJkWSn0DkyXJpJnT4CMpQ+7RXIbF7N
         7HKg==
X-Forwarded-Encrypted: i=1; AJvYcCVL5qmdikWXRBDY91+snC7cev8YWD3atVx3NISt5OTHKf3fp42OgF5/TyhiVaBhqFoDJXr+G+NlKQZET1hhQw==@vger.kernel.org, AJvYcCVXJwBm+uu4g13yhMu726b0QTqpvtMws0ZRxDyLBxXuIzkshWHZLDhrPrZEZuqM1UjosXBYYQVkq9Cv6a48@vger.kernel.org, AJvYcCVt9u1BL1i1NwDXyWdfZVtezhMmy/zS1nMTY5TtbdlswNdmGgmvd54QRpluE8LPibPG7CowicTdrcdy@vger.kernel.org, AJvYcCXaJXsR3wOPnufvoljIKDnn0vYFYGwuwWEz8LMTpNjMeLqTV6DYPEasdgmZ8Sp8LRwA2+YUSuyttIqlZITG+m7H0s8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzshDarz2YT9L9pQwrXbJGtXxXP4UaxIYD6ab/uL3d+SoyVK85t
	ZC23Gtuqvsye3HwjFbO+RCsbAMocjY06gFCdaWmuypjk4y5hKqndhyJX7Q==
X-Gm-Gg: ASbGncvh3+YNmICHoDn1GzuQaUhZqd4ymMfQtBiWz5mFne0qdmT7toKI3OeqMs/MRjL
	f/fdwO+05soeYSHBZNUnflWVuwLY6Ko6PcXb8nKIKhCJU0GxPkWEAFqQ3SAeDvooaJfbN8Vqg0m
	inUAmwgTQKKZgkFyq0lcYa1qnZpdh6WKr9RlrF5eYjAyqj7EZw4eNXZd4nTKbpjITRvnCPr6WlP
	1JGnw1l5qiHBYVwpdZ9hVAVZfSGsUOtJkq6m6r+s3fMcAjVuqmUZUYss9F3EAKZI4J3qINt+bXD
	vF9H4+5WsQ+eylLDM4xaUXeK00h2UTiQJ3WMKYMXbVqVzxFAzpxyXZ98cYAs41YHE1QZubI5Ak/
	nQmavi/91sV3v5ArfHVYWyj0=
X-Google-Smtp-Source: AGHT+IHI1CoDf0zET93TFTFwi+XLCs8pimREfQejaLODOte+CXbwQ8+LefkOYFI2CcaZ0a8rBCUzIw==
X-Received: by 2002:a05:6402:2748:b0:5e5:71e:8c63 with SMTP id 4fb4d7f45d1cf-5e5071e8edemr14033147a12.15.1741022291813;
        Mon, 03 Mar 2025 09:18:11 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a55besm7022334a12.72.2025.03.03.09.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 09:18:11 -0800 (PST)
Message-ID: <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
Date: Mon, 3 Mar 2025 19:18:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
 <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
 <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
 <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
 <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
 <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <354d6100-311f-44d7-b8a5-1fd671b651e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/3/25 09:24, Krzysztof Kozlowski wrote:
> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>
>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>> ---
>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>  1 file changed, 76 insertions(+)
>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>> You have undocumented dependencies which prevent merging this file.
>>>>> First, dependencies have to be clearly expressed.
>>>> They are, in the cover letter.
>>> Where? I read it twice. Dependencies is the most important thing and
>>> should scream at beginning of the cover letter, so if you bury them
>>> somewhere deep it also would not matter - just like they were missing.
>>>
>>>>> Second, you should
>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>> Sure
>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000..7d879ec8b
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>> @@ -0,0 +1,76 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Exynos2200 USB controller PHY
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>> +
>>>>>> +description:
>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>
>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>> at diagram - they call it phy controller.
>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>
>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>> Does it mean there is no USB DRD phy controller as before?
>>>
>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>> So...
>>
>> DWC3 -> USBDRD (USBCON) -> PHYs?
> No, drop last phy. You just wrote the same as me - two phys, because
> usbdrd is the phy. In all existing designs there is no such controllable
> object from the point of view of operating system.

What? Per my understanding, the phy property should refer to whatever is
is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
that has to be connected to something, doesn't that mean we have clearly
separated hardware blocks? Now, I guess one could argue that this USBCON
hardware block could be classified as a syscon. But I don't see the problem
with the current binding description, nor the modelling, as it represents
how the hardware is (unless I've gotten it completely wrong).

Best regards,
Ivaylo

>
>> ...with usbdrd controller connecting and controlling the USB2 and USB3
>> phys, as well as dual role mode?
> Yes.
>
>> Well, where is the DRD part in the exynos5
>> driver?
> DRD? I believe it is part of DWC3, the same as in every other standard
> implementation of Synopsys DWC3.
>
>> I guess it does perfectly fit the job of a usbdrd controller then (if it
>> even deals with DRD). But then again,  this brings up two questions:
>> 1. Should this driver even be named exynos2200-usbcon and not, for
>> example, exynos2200-usbdrd?
> Are you sure we talk about the same thing? USBDRD is IP block in the
> Exynos and a device driver. Call your device as appropriate it is -
> based on datasheet or downstream sources.
>
>> 2. Are the exynos5-usbdrd phys really only USBDRD, or do they implement
>> USB speed functionality? What is the UTMI/PIPE3 setup for then?
> Dunno, I don't get what you mean by "exynos5-usbdrd phys really only
> USBDRD". USBDRD is just the name of the device.
>
> Best regards,
> Krzysztof


