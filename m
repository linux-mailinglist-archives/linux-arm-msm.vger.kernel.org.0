Return-Path: <linux-arm-msm+bounces-50156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02DA4DB03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C04AA3A6FBA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92ED31FF7D7;
	Tue,  4 Mar 2025 10:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCcJMVT7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7486C1FCCEA;
	Tue,  4 Mar 2025 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084653; cv=none; b=BlNYLBv2M15jWBseuMGMrrPYKHYBC2UPanQBy2Tradfdo8xPPFDxUJjf+2dg2sXs+2ULrtLxZYvr+3aMEzhwvk/xDFO5QtzAVDCdcNgIKhLaoZAMiob9h9usUwieogsXlGkX1A1M8+Ct6HxRXHxNCpQ22nbBa3RnYk5fiak8wq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084653; c=relaxed/simple;
	bh=85nhDBhTFiWJYgl6DykBnE3QBUXn9UbjndlP97pBjIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJXYJnjflM9bdzN00A8rE9nKKJPoMNsVQmtn5g6rOr7CpTw58l36/exuOit2TmuiJWxkeNk3r8sUrhRnKLVT/GTtjAQSZsh/GwRBhJwyJbFtj9M752G0oOaz9W2LEUrY3p7SgSHkUt7QudDakPbYj+ux9itfJyG4k+ecvEhIEjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCcJMVT7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abf5358984bso468329066b.3;
        Tue, 04 Mar 2025 02:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741084650; x=1741689450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y05GgcUzyRvbTep5413nOELZn3QacVghe1JgbSP50KQ=;
        b=gCcJMVT7yPWZ7sHJ6TFuLdLlysZX7LV8WhM7taG4wAOWg2+EEYXOYjPRP6cS8BV59j
         Q450IM0/9ADf0HP96KA8EAzxqNpuFFloAlpbbT7+T2Fpbn7rJ/cygDtn8GG7IAlAbIPB
         uGq6O7MoZWHDNWBHKIbzYpJlgOUwKSEKbGqs5QOkxAN5TLCOvPqiWVThCwdNPc1I/CjJ
         cDbJO1C4n+MqUYMHBLNPjI4SMZj6p6ldCHzBNAFxVTML/1WQt495CwJkHofQRp+GzH7G
         Dhy2CDU3QrNuPCC5sobm1j8YPjb5NUDqn7ir4sXCvnM3pp+3C/8CQx/lB8OQEbJFEiGP
         EwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084650; x=1741689450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y05GgcUzyRvbTep5413nOELZn3QacVghe1JgbSP50KQ=;
        b=vE+IhvDEFXZBN9Vo1Jx+aRkiCW6B2iBNHR28OVjyttpRPdKqXtAO2DOJ6IzqRYZXTV
         nppqEx98OKa89ppmwepLz6/jopHbquEc6oMzGa8uakFoFAumkDY+704FepsXYunBTczk
         XH6ZqxgdFFqxwiY91EmrEbVBn8LP/IiwZNsOS/+0t7QlN9ciIiAKKZbQo3PQ1N5uCW1v
         fqr/5LC5cpp265rNz+50gSJfphpS9AAcprzdg3DgUkLVSRzhuzNpWqXJe+8iY8DpGgZ6
         bgTLG0Hl70enCp3I+vchCeaPqLci1BdgkWCAH6ilDQd5hDBW6lObJtYl3kI0uwHlnWWC
         dBfA==
X-Forwarded-Encrypted: i=1; AJvYcCUSQboeectvY7XoTzMse957oFtyh5lK7jEjksT410IJYUIVkSjEcEYgelRiPIABPQvlxjkmuywuejyzM3DE@vger.kernel.org, AJvYcCVFtB7QUIxg4zZmtobl/jpD3vvPMzi5OUmUTBkqTFWOT356gOFH1VsVfRVYjhC8l5Eu+xMf3W16WZvDU6JvKw==@vger.kernel.org, AJvYcCX2mmEFYEAVxOzulmLrKDV/YcVTuxBDxgo8EWwp0tdKSpDTwVs2Tjc3JkdCvyg3YMoT7PAxV0C+j/XgNZIIPR9Y4Vk=@vger.kernel.org, AJvYcCXx3iC9i55be+F0DC8Sx564eZQeYurKLt+x6PBvjE5K8CcF7qlUkfMMEoFspMJqNHHJLOPugYmIKEkf@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEy3uZd/OR6QHANuTRzOeH/qOd91ISi5DKYr23l6nsUjbrLsD
	lVAoVCA2/L++mS3lzc7x+SwqtebBdyyF2g9Aw3BWjOAixIAjJNFF
X-Gm-Gg: ASbGncuBc+IstDX/vyBX+ZXr9XwVa7Ihkzcd3mIm+eh232F5BNFpVfT7ASKKtD8l/d3
	3FNOKKxQIZRRFx2608aorQpT9NTxIg++fY5RuVcsIs6Miu3A6h6rYcTfbqbDT/bDjPeZ7HmnOnx
	g6MipZQn7E/slaVA/FMPzh/G2hfNEQFiIYABPXFN1msXeqXW8rDyH6zYUEdZzB+kx4GdxmKrp5e
	gVd1fG+IHeTxdfJ27ggHw6+huIvvcv+UVpPWUgcgc5byCt7GwR5gic8Boc2GJhLDfkMyK9j8z3h
	nLFvqA4NC5T35cJe5NCUs1EZgQMI51B4CrSs5GgKPTYzgxLVIWm1nijQeb4=
X-Google-Smtp-Source: AGHT+IH8pMgz4t35O8oyRIFQxpdE0tnaA9mngLuWrWyOfwIXMudSbWqIktMm891rz72griamnTx0kg==
X-Received: by 2002:a17:907:3e94:b0:abf:55c8:4cd5 with SMTP id a640c23a62f3a-abf55c85c18mr1332877066b.12.1741084649331;
        Tue, 04 Mar 2025 02:37:29 -0800 (PST)
Received: from [192.168.43.21] ([77.85.230.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1ea18e32csm149481966b.137.2025.03.04.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 02:37:28 -0800 (PST)
Message-ID: <0b8f71cf-03ee-4b5f-94ba-92811fccb541@gmail.com>
Date: Tue, 4 Mar 2025 12:37:27 +0200
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
 <21460de5-76a0-4576-a7e6-f4873e40de48@gmail.com>
 <9ec6c2c6-cf99-4c6e-8fc2-871716987c54@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <9ec6c2c6-cf99-4c6e-8fc2-871716987c54@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/25 12:03, Krzysztof Kozlowski wrote:
> On 04/03/2025 10:09, Ivaylo Ivanov wrote:
>> On 3/4/25 09:21, Krzysztof Kozlowski wrote:
>>> On 03/03/2025 18:18, Ivaylo Ivanov wrote:
>>>> On 3/3/25 09:24, Krzysztof Kozlowski wrote:
>>>>> On 02/03/2025 10:16, Ivaylo Ivanov wrote:
>>>>>> On 2/25/25 10:11, Krzysztof Kozlowski wrote:
>>>>>>> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>>>>>>>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>>>>>>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>>>>>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>>>>>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>>>>>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>>>> ---
>>>>>>>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>>>>>>>  1 file changed, 76 insertions(+)
>>>>>>>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>> You have undocumented dependencies which prevent merging this file.
>>>>>>>>> First, dependencies have to be clearly expressed.
>>>>>>>> They are, in the cover letter.
>>>>>>> Where? I read it twice. Dependencies is the most important thing and
>>>>>>> should scream at beginning of the cover letter, so if you bury them
>>>>>>> somewhere deep it also would not matter - just like they were missing.
>>>>>>>
>>>>>>>>> Second, you should
>>>>>>>>> rather decouple the code from header dependencies, otherwise this cannot
>>>>>>>>> be merged for current release (just use clocks with long names, without IDs).
>>>>>>>> Sure
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>>> new file mode 100644
>>>>>>>>>> index 000000000..7d879ec8b
>>>>>>>>>> --- /dev/null
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>>>>>>>> @@ -0,0 +1,76 @@
>>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>>>>> +%YAML 1.2
>>>>>>>>>> +---
>>>>>>>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>>>> +
>>>>>>>>>> +title: Exynos2200 USB controller PHY
>>>>>>>>>> +
>>>>>>>>>> +maintainers:
>>>>>>>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>>>>>>> +
>>>>>>>>>> +description:
>>>>>>>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>>>>>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>>>>>>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>>>>>>>> It's not (I think). There's a few reasons I've decided to make this separate
>>>>>>>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>>>>>>>
>>>>>>>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
>>>>>>> USBDRD phy does not provide UTMI and PIPE on its own either if you look
>>>>>>> at diagram - they call it phy controller.
>>>>>> Ughm. What? So in most exynos cases, there's a combination of multiple phys?
>>>>>>>> for them, and all that is needed from it is to disable HWACG, assert/
>>>>>>>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>>>>>>>> initialization can be done and USB2 works. If the USBCON phy is not set
>>>>>>>> up before the eUSB2 one, the device hangs, so there is definitely a
>>>>>>>> dependancy between them. For PIPE3 we'd need to control the pipe3
>>>>>>>> attaching/deattaching and then initialize the synopsys USBDP combophy.
>>>>>>> Does it mean there is no USB DRD phy controller as before?
>>>>>>>
>>>>>>> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.
>>>>>> So...
>>>>>>
>>>>>> DWC3 -> USBDRD (USBCON) -> PHYs?
>>>>> No, drop last phy. You just wrote the same as me - two phys, because
>>>>> usbdrd is the phy. In all existing designs there is no such controllable
>>>>> object from the point of view of operating system.
>>>> What? Per my understanding, the phy property should refer to whatever is
>>>> is connected to dwc3 UTMI. In this case it's the so-called USBDRD phy (called
>>>> usbcon in downstream). Considering that the eUSB2 IP definitely also has UTMI
>>>> that has to be connected to something, doesn't that mean we have clearly
>>> The entire point is that eUSB2 is connected to DWC3, no? That's exactly
>>> how it is done for example on Qualcomm SoC. Otherwise you claim that
>>> DWC3 controls one phy, which controls another phy which controls UTMI...
>> But where does the USBCON fit? Is it just a side controller? Why's it needed
>> in the first place? This is what I don't understand.
> I assume usbcon, so old usbdrd, is the second DWC3's phy, just like qcom
> qmpphy.

Ugh. For qcoms, does the first phy depend on qmpphy? If we pass it as the second phy,
I don't know how the linkreset will happen. We also have a usbdp phy, which I
suspect is used for SS as well since it's a combophy by Synopsys.

https://gitlab.com/Mis012/sm-s908b-linux-source-code/-/blob/s22_restored_history/drivers/phy/samsung/phy-exynos-usbdrd-eusb.c#L1579

Best regards,
Ivaylo

>
>>>> separated hardware blocks? Now, I guess one could argue that this USBCON
>>>> hardware block could be classified as a syscon. But I don't see the problem
>>>> with the current binding description, nor the modelling, as it represents
>>>> how the hardware is (unless I've gotten it completely wrong).
>>> It is the first time you use argument that it represents how the
>>> hardware is and this is what we actually disagree. It is not like that.
>>> You do not have chain of phys. Just look at any USB 3.0 DRD DWC diagram
>>> from any Samsung SoC: where would you squeeze these two phys in relation
>>> to what is called there "USB 3.0 PHY" which would be the third phy (!!!).
>> Yeah, my point was that it was different from any previous design. Now,
>> I don't know if it's actually theoretically possible to design it like so. It's
>> hard to just guess how the hardware is designed without having access
>> to die shots, documentations or even just schematics.
>>
>> Let's make it clear now, the changes your request are to document USBCON
>> in the existing exynos binding, as well as to correct all explanations of how
>> this block functions, right?
> No, not necessarily. If USBCON is entirely different device than USBDRD
> (different register layout, different features), then go ahead with a
> new binding.
>
> I was questioning your chain of PHYs and this should be investigated.
>
>
> Best regards,
> Krzysztof


