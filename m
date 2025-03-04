Return-Path: <linux-arm-msm+bounces-50137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5019EA4D782
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:10:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 522377A2A5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 09:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97631EEA34;
	Tue,  4 Mar 2025 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj7AkWGM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3B1EB5FE;
	Tue,  4 Mar 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079377; cv=none; b=ZKba2w5MggqLXtdoKGD0d0r3oQYY/JPeTYJJg/3HNfyS4I89mpmiJF7HXqbHq42kbEqThRbAeyUlJmCRRb+Dm3y9tupYJ0x1YTyNvvd3ibRoQ341SFioeuUR5XCgaJAu50t1IB7U4epr353qsVg7V2fT2Dwxb1ioiawFiUWE5io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079377; c=relaxed/simple;
	bh=5m/S8dOUa5jS8/I75V46PnC0QPJDV4p1m/QGckspTRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rmXAf2/GzLK4dpCZggJsQNjiG+9o6FfjAH4uL767koYZrqSemzLjEkRuYQwxX7G7q+Ubqnwv8s6q/xgDt9xSXz8UoJC9D398JcEygmvf6iB5NmS6ai6PhZGQxVuCoByj6nAvyjVUorsPuebIxkxtDvtSMs4hRE5jZECvpz+IX/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj7AkWGM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaecf50578eso1024827166b.2;
        Tue, 04 Mar 2025 01:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741079374; x=1741684174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUJhQaYNJ+KP9IjzaIHtUMcbg4p7nFeoB9PoVn3AGzE=;
        b=Dj7AkWGMSzb5+2JeJFqU7W+iUJOjeBvVYnTvcfj/alcGJ9Ba9rNy1fr88Ab33reetf
         nPgzKMo7fy1iGCrdnG189MZHLmBc+kGPJ14igt/WQCeUky+fRXbBPyZfDqh5Y+DYiF6p
         9T+G0gr+EzywlCnRZjoPTRQlW3FWPngjjT4mw1gdHfaEcnwbF27cgkuRP0r8ToNcdJFB
         trJk66K3wDqomf56rOtsrNyZiBVYwAdeTdJ+sh8kyjCDZuPEOSFHTMyqbLS2QILwVRUS
         E4/YLWfHOF5RmUE44L0nt5ZmmHr1+iPSpKE14BfoI8wPgnwl/N9xVnYRQ2/8rsF0CB7l
         xmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741079374; x=1741684174;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUJhQaYNJ+KP9IjzaIHtUMcbg4p7nFeoB9PoVn3AGzE=;
        b=hSFAhdof6lErwwiBq5wigTwCFs5YmCbk7hO5bN+nOtDeS5ROjvSLD6w0iums9u0O9u
         zL9MCEzbyvnWtm9krqCOgTdOCNVuQD4ouniQdptg4fJb1NMkWDf2slIDiDUs30AsnIbJ
         Kf2Dqt9gdS++e8KYZ5G5tqH/r1XKX25rAe3vOpCahTWVedxyIVhbuaxEmYbWCCLlpHVY
         RkLtk24+SNp62Mvo9PtJzLBbPyaoX3e0ZISZVRemY5cS7o+JzlcyYu3dtaGqyESmH2dn
         /+sbQAvjGQnR/OG70wGOf+EXzXQETwXLlHzvRmDT0oggnojWgMjagSXYCXkP08q/a6m8
         yiWw==
X-Forwarded-Encrypted: i=1; AJvYcCUPDA4twdO9V3eOURA3ZjoZLVdvCT3bF+UPPQFj9FWlLs5vuyCAeMNa2dr2SOds81X9TzXqj9EbuH5j@vger.kernel.org, AJvYcCUVXjVx6izyXAFfg7v3zqPkbUvO0YNYSUaGTUj3x0XSliJlzQEUjwBnjsnBl9kwa34hezVZUkl71TJY/G0KrA==@vger.kernel.org, AJvYcCXPHHPB+Lm0L9gs8Fz1KsqukhBLIbTJ6kREHN2w6ccG5i2lCI/bLvZbW5uFBw/LfWIejoB64Lkmq7b+HdFGEvuft/c=@vger.kernel.org, AJvYcCXyp/WSCj2SGMDNe+dgyZILPwHKFf1XwdTcyiAXoRyl5XWxiQ9U4uFTtzvOlDXxOqPMrSgLoClIXJDFVTTq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt3DNpNU5zE5/MLr7ypk3bAKixF40NnsE8kYoSjPz0dU2Z3FT4
	rAQSFb+Zu+CkBd4nv0GEcUzK/Qgsfz5p+ooi9/AfH56+ZiBoyAXG+t6OFw==
X-Gm-Gg: ASbGncvyFX0H7V6XMMeMEcquyTHwF5o8rfp2zmoY46AhxR2rEYDHOElvdzvf0qOmrku
	Vfk23hjHS9hsObcZe6se9gn73xhL2CmX76nRz1IglVkieVHSvng3KZsCUQElgvQRPa3vIyt8cu8
	fZ4vtN7MY3WF77qcy3mKX+SM9MRhBoKgxL0cJX1jJfMIOgs2hNCeoIr0AVt8uiSGq1M7VEDmtjl
	xARkbXdWXVngJ8vWv9Uymf41XK4WBemy6VDltXpj3YnaPU6fb01dORLol4FthvFjAMZxP35NFDq
	04R0p7gjb556Lhvy3vzu974JxxSiKDImnhT8zrOFLREbxXk6u+zEuF92NeQ=
X-Google-Smtp-Source: AGHT+IH6P2PZuxm+2sKzdyVK3yViDvKypolcGeIQSD9E5vIhDHGm27LOpDLzkoiZ0cOSnYMoTvPPYw==
X-Received: by 2002:a17:907:9812:b0:ac1:f162:fb0d with SMTP id a640c23a62f3a-ac1f1631229mr242134566b.37.1741079373793;
        Tue, 04 Mar 2025 01:09:33 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75481eb4sm343379066b.83.2025.03.04.01.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:09:33 -0800 (PST)
Message-ID: <21460de5-76a0-4576-a7e6-f4873e40de48@gmail.com>
Date: Tue, 4 Mar 2025 11:09:31 +0200
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
 <9fb63a04-5b3d-40cc-b96f-eb4f297f307e@gmail.com>
 <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <027decb4-3fa9-40a5-9cf4-65f9a69b4566@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/25 09:21, Krzysztof Kozlowski wrote:
> On 03/03/2025 18:18, Ivaylo Ivanov wrote:
>> On 3/3/25 09:24, Krzysztof Kozlowski wrote:
>>> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>>>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>>>
>>>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>> ---
>>>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>>>  1 file changed, 76 insertions(+)
>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>> You have undocumented dependencies which prevent merging this file.
>>>>>>> First, dependencies have to be clearly expressed.
>>>>>> They are, in the cover letter.
>>>>> Where? I read it twice. Dependencies is the most important thing and
>>>>> should scream at beginning of the cover letter, so if you bury them
>>>>> somewhere deep it also would not matter - just like they were missing.
>>>>>
>>>>>>> Second, you should
>>>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>>>> Sure
>>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000..7d879ec8b
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>> @@ -0,0 +1,76 @@
>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: Exynos2200 USB controller PHY
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>> +
>>>>>>>> +description:
>>>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>>>
>>>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>>>> at diagram - they call it phy controller.
>>>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>>>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>>>> Does it mean there is no USB DRD phy controller as before?
>>>>>
>>>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>>>> So...
>>>>
>>>> DWC3 -> USBDRD (USBCON) -> PHYs?
>>> No, drop last phy. You just wrote the same as me - two phys, because
>>> usbdrd is the phy. In all existing designs there is no such controllable
>>> object from the point of view of operating system.
>> What? Per my understanding, the phy property should refer to whatever is
>> is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
>> usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
>> that has to be connected to something, doesn't that mean we have clearly
> The entire point is that eUSB2 is connected to DWC3, no? That's exactly
> how it is done for example on Qualcomm SoC. Otherwise you claim that
> DWC3 controls one phy, which controls another phy which controls UTMI...

But where does the USBCON fit? Is it just a side controller? Why's it needed
in the first place? This is what I don't understand.

>
>> separated hardware blocks? Now, I guess one could argue that this USBCON
>> hardware block could be classified as a syscon. But I don't see the problem
>> with the current binding description, nor the modelling, as it represents
>> how the hardware is (unless I've gotten it completely wrong).
> It is the first time you use argument that it represents how the
> hardware is and this is what we actually disagree. It is not like that.
> You do not have chain of phys. Just look at any USB 3.0 DRD DWC diagram
> from any Samsung SoC: where would you squeeze these two phys in relation
> to what is called there "USB 3.0 PHY" which would be the third phy (!!!).

Yeah, my point was that it was different from any previous design. Now,
I don't know if it's actually theoretically possible to design it like so. It's
hard to just guess how the hardware is designed without having access
to die shots, documentations or even just schematics.

Let's make it clear now, the changes your request are to document USBCON
in the existing exynos binding, as well as to correct all explanations of how
this block functions, right?

Best regards,
Ivaylo

>
> Best regards,
> Krzysztof


