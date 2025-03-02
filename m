Return-Path: <linux-arm-msm+bounces-49941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E52FA4B0CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 10:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A8E716B887
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Mar 2025 09:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F151D54C0;
	Sun,  2 Mar 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqtUrY5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA631C695;
	Sun,  2 Mar 2025 09:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740907004; cv=none; b=YJvsWRb6papDzna2BRRUqk9lZf2bGjGRMRMMANWB3EAeRSaLS6B21dQlLPPNlmIS5mpFGdvwELIdzkvhG++TeSU3GbZ3B2qd8BRx3pc695o+y2hR5r3YehnlovaKTP80SJfkwpuLn9SNy9/2jZ7IoJXNz9YpCt/dUfBVWnf8pE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740907004; c=relaxed/simple;
	bh=H44sFfK1LqDLlQt24Q6gB7Vof+guX4WP72Q4KQ0UZj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugTtw3YvVCFWRBsNGYRNFEbB1uElRUqOvdNt8dWLFsV155lDt797DlUcgJf2FWQFUrF3ZqvJou4P5YZr2AneigG3k5pqCQrRVaIpa/o4tZ4ztEReRwYM5+ltYuF9vbN412+icKfmcxZbK1jCWCC15SXtX48bSrLdNYkjFUPIuIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqtUrY5n; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so6296559a12.0;
        Sun, 02 Mar 2025 01:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740907001; x=1741511801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gt4e/Q1bzVAKDz/zUzGYf19qKql6n2SPXCwUMfSa3zM=;
        b=VqtUrY5nnlS3Aa0vP/29A123vZXDlxGeVwUcqGepPVvQ0po5F6rAhby2K4gBfbfibH
         uYEMTA05VtesO8Cp2mHTLNBOL+toWjmZK6AWKDLPWRHQSkln66+35ccHnWIQBlz70+3n
         7IoECgvmrYYWkfTZMqjmTTnhVq+BCJEZeZbeNDiLNgC0EhoQnK5ddIfAG2WI6nhX0GEs
         PU+hzwhcwfB48S6GQCN4xUPYwIoeP51dmulyUvljsR3EsW34ywhsCcXCb5ICxturaI5p
         Ur3oleq2EnqA24bfMtGZlJq4PcLB+iaOPJAEmSeBFz0ySv9Hrfhgo/OvruGhAZ7VqnWj
         k5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740907001; x=1741511801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt4e/Q1bzVAKDz/zUzGYf19qKql6n2SPXCwUMfSa3zM=;
        b=TSYjuwipiE0xp4T3wNDfNmhA6PIM8O74QzWo5e3pz26VLiexyfiTzHRI7dmvlfX0Pp
         VSr52wMsnlMCwCQT66TCa1/rOivzwxavrHxS7JtQmkz7Gs9EAIZzS1tcOpk30fx7JJYR
         LXv4tPrvRxdXlBDr+HrgvtWMk7+MdxeB/krC7wxR12O5CedwXOdrc9oec7AeqXnJvEEa
         YqKwN9lQPH9+u7fIu1w4dRmzxTUdaeRanQ0xjLlpRsDQOzBOOnvDJWADuXPIadmFO77x
         CvUcyqC/kWhSX1XhV11afUJXbrXqEPl3L13+6vXgT5aWVMgYosTAnKTCCY7+pLvomlKc
         p2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC0a/o3NqZpUMeN4awjJalGTvHi/GUOEJ58eNF367PgSmkhSQeJAshV8zCXbsQEQSgwYERRUAeGVAjwmJ9tQ==@vger.kernel.org, AJvYcCUVo9ipuNnuNp7jwfEut/XC8bpymJteYr79IvWyeYgvbRwyoRWIa2PK62b/hT344QxeMaCT3jhikEia@vger.kernel.org, AJvYcCUq3oDlGDGjdjYgJPViYmEwVPYiZYhNvkChWwTOSX24ZA2eOTrVLzwuwWG2vZE7uXZ6aJxuYdq6tfXFdRql@vger.kernel.org, AJvYcCXNWumUJqiVJ3cjvXtw97Ksexd4VTCHb29UbdHMtxClamEQ7IbWyIm14/fPeEGDaM5nesEe5gVn1LGtlnLddmW0m1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNScHIaVjV0XMM2/WOtT4rvXgr0Yf5oH/l3KjoNh9Bb4FrZmA
	WwDjibAf1DM+MgdEEcEx7odYYqWQ8NO7G6OWybKAANiOPADWe2/HluWLqA==
X-Gm-Gg: ASbGnctZtldh1S7J2dc6p5Kh9AxfN6+9L3CMU7e5lvdkZAqGGS6VkjkyXBii55UgvjX
	mEpSwO3JsjEfNs543l9FIb95lnIce7Z3l7fbLPLJ83pDBoUwmbGplmEMZxMI65QxM1NsU8A85tc
	FyhEJQxF4ZS2iX6iUZs29Mhz9Q1/pU0lS+GOFZ6VEm9JuaTmc/3zxwjz9viscnffmxZiXIEkSe7
	KsQhuIXEfCOMUQs8uHOmeF6mLuF+uqdcF3dRS02scQFKsM5AQHn0EkutzUdSD50U/1MWZzrBvuw
	Ewmbygx1sxF6otwlKNNiig+q6sU268PDd/3+Xxs91wKbMsw1sUNr4yBv2Xj6TV2AESOQOcm/Cuz
	8okVaE34F643xhLSzEjlbfNI=
X-Google-Smtp-Source: AGHT+IEYSDw2sP7Dh+Z2pA1UtfA1dKfkOfTidFVCkHLXhYUdHVMwVkHLto91nPU2C2aCCuTbWanVJQ==
X-Received: by 2002:a17:907:3f22:b0:abe:c3a8:7aa2 with SMTP id a640c23a62f3a-abf268228c1mr1096068066b.46.1740907000673;
        Sun, 02 Mar 2025 01:16:40 -0800 (PST)
Received: from [192.168.1.105] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee49dsm624648366b.105.2025.03.02.01.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 01:16:39 -0800 (PST)
Message-ID: <4502b578-96e6-49e0-8f3b-54f6e5640c55@gmail.com>
Date: Sun, 2 Mar 2025 11:16:38 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <c8184542-5dab-4403-bee4-867810397ae4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/25/25 10:11, Krzysztof Kozlowski wrote:
> On 24/02/2025 11:48, Ivaylo Ivanov wrote:
>> On 2/24/25 10:56, Krzysztof Kozlowski wrote:
>>> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>>>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>>>> intermediary between a USB controller (typically DWC3) and other PHYs
>>>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>>>  1 file changed, 76 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>> You have undocumented dependencies which prevent merging this file.
>>> First, dependencies have to be clearly expressed.
>> They are, in the cover letter.
> Where? I read it twice. Dependencies is the most important thing and
> should scream at beginning of the cover letter, so if you bury them
> somewhere deep it also would not matter - just like they were missing.
>
>>> Second, you should
>>> rather decouple the code from header dependencies, otherwise this cannot
>>> be merged for current release (just use clocks with long names, without IDs).
>> Sure
>
>>>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>> new file mode 100644
>>>> index 000000000..7d879ec8b
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>>>> @@ -0,0 +1,76 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Exynos2200 USB controller PHY
>>>> +
>>>> +maintainers:
>>>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> +
>>>> +description:
>>>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>>>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
>>> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml
>> It's not (I think). There's a few reasons I've decided to make this separate
>> from the usb3-drd-phy bindings and exynos5-usbdrd driver:
>>
>> 1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
> USBDRD phy does not provide UTMI and PIPE on its own either if you look
> at diagram - they call it phy controller.

Ughm. What? So in most exynos cases, there's a combination of multiple phys?

>
>> for them, and all that is needed from it is to disable HWACG, assert/
>> deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
>> initialization can be done and USB2 works. If the USBCON phy is not set
>> up before the eUSB2 one, the device hangs, so there is definitely a
>> dependancy between them. For PIPE3 we'd need to control the pipe3
>> attaching/deattaching and then initialize the synopsys USBDP combophy.
> Does it mean there is no USB DRD phy controller as before?
>
> Anyway the problem is you have DWC3 -> PHY -> PHY. Looks one phy too many.

So...

DWC3 -> USBDRD (USBCON) -> PHYs?

...with usbdrd controller connecting and controlling the USB2 and USB3
phys, as well as dual role mode? Well, where is the DRD part in the exynos5
driver?

I guess it does perfectly fit the job of a usbdrd controller then (if it
even deals with DRD). But then again,  this brings up two questions:
1. Should this driver even be named exynos2200-usbcon and not, for
example, exynos2200-usbdrd?
2. Are the exynos5-usbdrd phys really only USBDRD, or do they implement
USB speed functionality? What is the UTMI/PIPE3 setup for then?

ps: dealing with this without any documentations sucks.

Best regards,
Ivaylo

>
>
>> 2. With the way it's modelled, we need to parse phandles from eUSB2 and
>> USBDP to the controller. Adding that to the usbdrd driver would be...
>> weird. It makes more sense to model it as a separate driver, because
>> it functions in a different way.
> Just to be clear: we don't talk about drivers here.
>
>
> Best regards,
> Krzysztof


