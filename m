Return-Path: <linux-arm-msm+bounces-49155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA3A41B9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9693A4B31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3872566F2;
	Mon, 24 Feb 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XORNgn+I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BB33993;
	Mon, 24 Feb 2025 10:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394132; cv=none; b=n4q/iRmgj98A9sVs+3QHbiNaKNjYgGJZ6zWGuGsTnwKVEXXYWuQoM6Jp0N/fKizIDzUEUpe0lJWKWk/kOvrPguRjVIYlVuBevY1rvLiyzdYEaE4vb90KdnaTZI6LkyWYMfZ9CPSQMo7v91+7+Fm6ynDPvliGh2Ch2u+rP2e23go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394132; c=relaxed/simple;
	bh=s6OsMqvoKL7x+5KoMhDVeKNmQJE3PLkhy3vAbympfbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6d0tjv6HQmibja3C/pnQaKMf/Mlq6HdlCyp99aZ2/h128bIZPbNsSjhKjh6ak7Vmyp8zSV0KnAeVxRoTvzHJTpgrKPS6b1OfQPtRNLRIt6OxYuyS7y9jkCs5Ez0mYxno6cWI5cFxqhMQqW+KgwEbVAPd7tT4mKj3/bhyQri7RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XORNgn+I; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4399d14334aso36851865e9.0;
        Mon, 24 Feb 2025 02:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740394129; x=1740998929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSmks02sU0pz6NtlK+7aTkPg3Il2n2N4xYhuuXfu8rM=;
        b=XORNgn+I4WUe8CznlLm3orcQIebxyrwpOK2SsuMdyrU/BnPkeU17ZlhW5ik61iYYY8
         uYWrPb4qk3iqZ6p2vOHl0sA312mM0vpxXTz9owBTXVOEd6zwBmRhM/Bo6STzFdwXkwNz
         PXzsCGdTONIt4KrOE73bgPB8iRS5Z9BE1Bpk+3gy1Zc3Ie8ugLyWmzo4QxwK207gsRsu
         FMHtOzwDhNQcdfZaCQr9OoM2SlbbpOnhZRCHZSPPtltchoMikm0q4xm4NPFBz/MsCO5w
         lV9ByGen/IsT0gcG4uaqR9THIe8gk5/1l+rkR3IP3khxEOLPlCfr+SJaSu+4TYhJp6KD
         ntSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394129; x=1740998929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sSmks02sU0pz6NtlK+7aTkPg3Il2n2N4xYhuuXfu8rM=;
        b=BdAWmp1Sp2px7bWfzJmvY2ZK+9eTOPiKC5CcnsMk3UucYEc9GpzYJ4a1tcNTomdQz/
         9xFS7Q5W9N9OepSD7ulb/DiD+cAsa4lujBuLnZH4E6bL9YsvW0FmVOlfT8E8/l9ufhkO
         A1nwiwg6y/FFMD1zoKJkfTnBjPcYEFFHYI8wlMEHVX3CGpZPWR657FdcUiMwtSjFEuy3
         ov1ci0B/r5GwDbX2yZ07nspnrv54v6jw4vxTNUKLgivXExLbLQJIjDBhsTbd3Cv0MXHi
         vILDjhINbnszkZQhxbnNIG9Osy79vxmKPlHNWxK17RGxLmf3bXFQ/pFXPz4uCTgCdjx3
         Kosw==
X-Forwarded-Encrypted: i=1; AJvYcCU7bDypMsSram8WMgdyZRcTla4av49Up73+nUSiCUOP3PKZloBrWHD+XQ7ebDuSfEe18eJ9dQK0txUqa+HPSw==@vger.kernel.org, AJvYcCVAatnpi1yz3lwKUgEm467CxL94Gu6Bjyj0LpkOt3OZBCUkwmhPkL5ZHUoNjaiBPmv4eMvkqVw7zou+@vger.kernel.org, AJvYcCVTi3fUGtkJmVv1slaG08/6+2aOhlvrPM7FiG1jmG7WKGFgwdEKs7h/zbuPDeiTSWSO9Ts61jEVSayD4gJRdp6pmgM=@vger.kernel.org, AJvYcCXBEm3smhru4uYwBDW6tGfDMNGed0cttECaiUMnb5tb/Dx7FmK7np19aQDkpnpkK6fB8oZD5Kh8SVCoqR+c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7XYyy97LdoUX+uzQm1fBDyQqZEUFjjTKURQr8L0s3V/3J3miv
	wFb/KC2mE3LPEjVpIEdKCF0FmG63VA7f2Q5w8ZTHDxrBChroO2YX
X-Gm-Gg: ASbGncvpwXB09akTP/x10tSFFBQlw3Hs9Sp7O7dyqyutrqIvcqXkC4pdR/FtTpvP76U
	3RG5/n2nyLt4utFdJXBOSUxtPcziOxj9HAG+DF7I0o5LRhTBp96kGr48j5ACxTRHsadmqtBiI0l
	vRuOo0vT3MIsDrFh65RdjxYslTRw3+jg0+mS0OcX7k3liVbsInsLzsacPvBPDLNSB4rC3/lk6P1
	k8U8lVRHPibSA040FfqFQrIUHCGsdo1fkQbjfPLmgvjdgkhs1iuevQKx3UbEll8cFllK1DuMMlB
	Vn1Xb5FYQ0bSN0SQiDHm0aahdLaqoSmCvy1r6Xx6KZ+LuXoYaSHFGKiPKzZP6D0A1wc=
X-Google-Smtp-Source: AGHT+IH22dUu6cq5GnZj2ahBsH99nikrHZTprN2kXwautV7u6WDRYUVZbgvuJyXenM0CCPaMHdFeZg==
X-Received: by 2002:a05:600c:154a:b0:439:44eb:2d81 with SMTP id 5b1f17b1804b1-439ae1f34f8mr103722245e9.15.1740394128909;
        Mon, 24 Feb 2025 02:48:48 -0800 (PST)
Received: from [172.16.20.186] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02d53e8sm101787135e9.12.2025.02.24.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 02:48:48 -0800 (PST)
Message-ID: <a4f63721-d094-4eda-b68a-6ef62ff54680@gmail.com>
Date: Mon, 24 Feb 2025 12:48:46 +0200
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/24/25 10:56, Krzysztof Kozlowski wrote:
> On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
>> The Exynos2200 SoC has a USB controller PHY, which acts as an
>> intermediary between a USB controller (typically DWC3) and other PHYs
>> (UTMI, PIPE3). Add a dt-binding schema for it.
>>
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> ---
>>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> You have undocumented dependencies which prevent merging this file.
> First, dependencies have to be clearly expressed.

They are, in the cover letter.

> Second, you should
> rather decouple the code from header dependencies, otherwise this cannot
> be merged for current release (just use clocks with long names, without IDs).

Sure

>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>> new file mode 100644
>> index 000000000..7d879ec8b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Exynos2200 USB controller PHY
>> +
>> +maintainers:
>> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> +
>> +description:
>> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
>> +  (typically DWC3) and other PHYs (UTMI, PIPE3).
> Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml

It's not (I think). There's a few reasons I've decided to make this separate
from the usb3-drd-phy bindings and exynos5-usbdrd driver:

1. This PHY does not provide UTMI and PIPE3 on its own. There's no tuning
for them, and all that is needed from it is to disable HWACG, assert/
deassert reset and force bvalid/vbusvalid. After that SNPS eUSB2
initialization can be done and USB2 works. If the USBCON phy is not set
up before the eUSB2 one, the device hangs, so there is definitely a
dependancy between them. For PIPE3 we'd need to control the pipe3
attaching/deattaching and then initialize the synopsys USBDP combophy.

2. With the way it's modelled, we need to parse phandles from eUSB2 and
USBDP to the controller. Adding that to the usbdrd driver would be...
weird. It makes more sense to model it as a separate driver, because
it functions in a different way.

I've described this in the cover letter as well.

Best regards,
Ivaylo

>
> I think there is no PHY between DWC3 and UTMI/PIPE. There is a PHY
> controller (so the samsung,usb3-drd-phy.yaml) which we call here the
> phy.
>
>
> Best regards,
> Krzysztof
>


