Return-Path: <linux-arm-msm+bounces-83326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C3AC8737D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E76094EAA7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 21:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8FD2FBE1F;
	Tue, 25 Nov 2025 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxomuv+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF285231858
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 21:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764105799; cv=none; b=AdzYsPxcvDEcdfc4C9tAMQMX+hXfU05+q3RZgSwOOzSDqEEk+eXFnYWmVAEXYF6E4Bw+ozwtVfKBBzkWtLvl+mArbjBdFvjVHWslvOgXZwAkY0WmVHb0913/nBpUFXkyMkqAQ1x3KKtL01xRSgRFqVOZuR1OVQpoeeHbgzwuueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764105799; c=relaxed/simple;
	bh=XW8A4SzGkXNACEumt8HO2D04lyJS8Mfw08PkaKSIHl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Urn1mimpLBJfsUa6RLCjxNBrOBq8EaxEVZU1H8noSPdSkqqcTYSQPPBsAgKy23Uqwofsh8MEcXG83mZnv01pdlyHKfPYOZ5hC8XLpUQ0q4bxtLVkTelFhe173yv7kLGpBdJIF9G16qBTFA6QrRoiGCA3s9hdXFnNOf5cIPnjykY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxomuv+L; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so4080587a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764105796; x=1764710596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4IPiaiC8wPPJ43L5jRER+JtLVLAZIm9IvLWnVk5O64=;
        b=jxomuv+LDLuWrt8BHvoPK9PCJoKFokds+p7JXcTxp33BbfVa5yluoYVGSy1rqC9dvh
         MN/6dLjD3TAUVFYjmoK0pxBVvD4e6mxdxKDTBWbFR9IMVAKjXy405uZnaulSSm6tdcaP
         vSwI6B7yqF0wMnjQGaI8NCi95wYpAiZvUG/66X0kmuoqsdf3YfB5yPk5Q+neT/5/1lCC
         Yzf+D3FTpt+VGN0kVxbpAIFOsQ9r+nOx6inPnNvdOb/fcw8hJMGw9KvmMFr+/p8CNFib
         GHut+daAkxA3VtnHPHvLekZoOE3EOsvjR759RUCEzAw9tZjQJ73CIg/SJ8DsIhEA1cWI
         hTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764105796; x=1764710596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4IPiaiC8wPPJ43L5jRER+JtLVLAZIm9IvLWnVk5O64=;
        b=vFJq8tYmKqIWPuNo+SnGpOxPQjxSjKa7sTcFBP6NhWGWY2eOHdLzHZ7Dvbz7ag5Eni
         NE9jjCqX9tagdZ6XBzx7u4DI2e4NZi+2Hv72+A12oBLqglcOXUiNYV5uLj41U7H/nloh
         IEmMZnS75up5bE4TX89tyC16d5UBUHKSZ2NKbmiKJc3S0G2iU8ODNS9pC9AZbyYRoabk
         8ecx4PwkmeXWlMi3TEIwbq3YLGz05AojdXDapcEIBgihIsnnsuy+p7YzWhgCfoYKUMJu
         9Tzp/Q8jVgFHf/NsbYUA7MorlWBfbxJbwLn8C8pUtyYKd2JDAh+XftxXRyRHfEB7XGQ6
         Ya2w==
X-Forwarded-Encrypted: i=1; AJvYcCXznfHNMxohTcZ+ZnkZe5jRyAVyNTwJnCGpi0CUC966f5dDbc0UimbrhTyvwXFPGjvzFqE74aHxaDCZGFvK@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbzZVPING3N8XszMQak8Ok5i4m5Pm87jNzDzjQgXrvBmho/7b
	YDbuCZI35zCIG6CYeFh6H7Lo18Bs9g82HfqGXxKZa1MddWPuInn6mNjx
X-Gm-Gg: ASbGncvBhtzSYn2WlmMY7B0w/QnRiFI7iDZZAhDrc1UkSPsdIPKvfvythPuAuDyhN5p
	mB8QhcHSYyKmU79+xADPEZh7dr6JJkvgQBtW36Inw/TXO4FHDHfW+lBcHbhig1i9nUskJtBeqY2
	Fj0gCo+/cOoyxIc6hsAtPdsWt2ahBqsTCM7XAp2cxNeuhXfYplAbQPDFqGK3FKK2yuCIF7scl9X
	qr+QJBrqxRGA25YjMF0JTphc8HH81ExHcfESWXrj4Ur0kFkqf1lGNal/LuBzmvthqENH5MgC33y
	um9XgS+AolFJkL0XF+jltzrPKs3YDIK2H964fIwfTbkFAC0X99G7rQYzhnuu5yjc7r6sa1CvOyX
	cd8lRQdxRbHr1V89X2lRJPNTfu9aE8wtzEaX/gsraQws36SiwvD/Rhzqt6a8XdcOmLe154jLh9p
	SsxiCaBJyKDkic8vFCJfm/sOV/jnqxh7YO2mNfyxTSUx/oXBLVDNz6R4Ghrh/X5hu3
X-Google-Smtp-Source: AGHT+IF6D8g2wIy+N6TKTf0dz5XOxIIs00ONhYLTRePucR1HQFiuvK+uZSIsc+LE+bc5dfe4y+fV4g==
X-Received: by 2002:a05:7301:100a:b0:2a4:3594:72ed with SMTP id 5a478bee46e88-2a7192a78d9mr9719248eec.28.1764105795955;
        Tue, 25 Nov 2025 13:23:15 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc53169csm63700374eec.4.2025.11.25.13.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 13:23:15 -0800 (PST)
Message-ID: <61e860e7-fc3b-49ad-bf6a-9745f205d52b@gmail.com>
Date: Tue, 25 Nov 2025 13:23:14 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] iio: accel: Prevent NULL pointer dereference in
 interrupt setup
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20251124-expressatt_nfc_accel_magn_light-v4-0-9c5686ad67e2@gmail.com>
 <20251124-expressatt_nfc_accel_magn_light-v4-5-9c5686ad67e2@gmail.com>
 <d3318386-2646-4f1c-ab4b-6ae3bc71e9bb@oss.qualcomm.com>
 <aSWPnRBRdPS8vnir@smile.fi.intel.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <aSWPnRBRdPS8vnir@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/25/25 03:14, Andy Shevchenko wrote:
> On Tue, Nov 25, 2025 at 11:45:22AM +0100, Konrad Dybcio wrote:
>> On 11/25/25 12:35 AM, Rudraksha Gupta via B4 Relay wrote:
>>> The bmc150_accel_set_interrupt() function assumes that the interrupt
>>> info is provided. However, when no IRQ is provided, the info pointer
>>> remains NULL, leading to a kernel oops:
>> Hm, are you sure your device really doesn't have a pin connected to
>> the IC's interrupt line?
> I don't know the actual case here, but in general such a design occurred
> in real life. So, shouldn't be a surprise to see another polling only mode
> connection like this.
>
I unfortunately don't have the schematics, so I can only reference the 
downstream kernel:

https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/commits/branch/downstream


The above is my kernel tree. This is based on:

https://github.com/LineageOS/android_kernel_samsung_d2/tree/cm-14.1


but with a few added commits on top to help me navigate the codebase. 
Notably, I've removed all .c files that wasn't needed by the downstream 
kernel, and verified that it works by flashing the kernel with 
Cyanogenmod running.


Based on the device's config:

https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/downstream/arch/arm/configs/cyanogen_expressatt_defconfig


There is no .irq defined for the accelerator:

https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/downstream/arch/arm/mach-msm/board-express.c#L2100


I also couldn't find a hardcoded irq in the driver code as well:

https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/downstream/drivers/sensors/accelerometer/yas_acc_driver-bma25x.c

https://codeberg.org/LogicalErzor/Android_Kernel_Samsung_D2/src/branch/downstream/drivers/sensors/accelerometer/yas_acc_kernel_driver.c


This seems to be confirmed upstream too, where one has an irq:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts#L420


and others don't:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dts#L439

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts#L506


Happy to split this patch series into two, just let me know! :)


