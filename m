Return-Path: <linux-arm-msm+bounces-87346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48578CF106F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 14:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFA6C3000DC3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 13:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483BA2C11EE;
	Sun,  4 Jan 2026 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZrkykxA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972D225417
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jan 2026 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534359; cv=none; b=I9BVB7KR4FHjOSfYpx3fCwNm7/SWfmdkKxKGruDwCra6zWcrbvd50PYj41NT/xRPxv/odfGixj2a8FZb2j9nrijfW2kOu3BvzwHbqaVDT5NhnTQZXlPyL703qiPSxtY3yo5he0kbgCz2qoj5y8rCtv2qx0uN5m1vMH8vrC1YAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534359; c=relaxed/simple;
	bh=ZaU491GHPP0X/mXK+gkH+UwnJTZO6s2faCvGdDKp3x4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ml1tllJMBXEpPaz5Jjei103q+oIvEp3/9HrZwSIP0HGj53yOlgU8z0iNZpdhd1QromzruwidHKTl23VmuNXhYfVEiqwsrndC1OBTkibPnXgEFeUkuRwdI/dq3vjvES3C/YCg/h0Zj+05UcNhKghatVOU/ztSg7lzr5iTcbCpe14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZrkykxA4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0bb2f093aso133508185ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jan 2026 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767534357; x=1768139157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NZZFl+MT1vAjqUFcrCoiCgpusqylZRq7mNgr8aK7XI=;
        b=ZrkykxA4HZIRx74+G+sdJ1gxQ+NwBRtMoAoAyqmA5WrCxSrK6Y9s/ZDflp/G2YR4rN
         vcZfyaK0IAe17ukdcpxd1i7AGzX1ENlRs8i+0aCji2vGxtToeqIMZgSE5+a+do5NU4T0
         W4x3oOQgzMknAa8TpAWqzcqmmFQzDq5AJEii5d9or59+JD8ERFnbz67awGDgJwgC0Hyu
         VR2enscLhrcn1GQ6AVXunQO0TCWc/Qmo/i2TywjH1U7HWu5xMYJY85DuYgxYYJPWNz1+
         X3fSshPPypNmg9oE2TN6XZt6PmsaFOKA/Zdp2lEEGlosgbqtGdiVkpAnjTimaBkc8y+D
         Opxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767534357; x=1768139157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NZZFl+MT1vAjqUFcrCoiCgpusqylZRq7mNgr8aK7XI=;
        b=ZXrHCXyVQwHVXxSoIdOw3DUWQs121gF28op0xuhzq65fa0PYAK1KqbqvnQX2oZflKk
         wMod9SCduddmKNaNPaIvnZWzS67tqlGmU5E6V7N7n6Xoht+CxCYRGTTqcPPZi3LkjbYF
         OVjFe0HSmTzgXUiXLkVG4QQNvXf+5WM7td8jTHU7/oJsNSVHwR5cVqGAzUHQZP2YUZ7c
         TXC+EuxhOhHmlv5sKwagbyeVdV4pPnyYrpKnVLVBL3c4ZIDMVjJ520GaAyAxovO8vXnu
         rwIeAyvJAgQPiSVjp4kwGOOpgGA7v1O63VK4vOBndhu6v7DFUGEFDOtRYOSIyh9Ld0D6
         vQ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUS+GUmEXVeGfcxqgVE37Kq3PgS1VT53eDDD0eiztR25kLmtT3zUpR8Tuq7ci9euTXUWUF7q8QQKF6GHeh5@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzk8FrRF3AjcqZFm/TgtmdyqvD/ChWfhl59GBRK5QJoZip9zV
	PdbtBvGoSrPgDv1Y6pYj1NI0c28GfxmRwIY51Ufkv+2AQOKMFNGj6R0L
X-Gm-Gg: AY/fxX4YqUWJLWUwafoymz5q7P/XXfxrFlbT0fNIHAm2GlbMSJjj5Z8SxaObnu/wqWY
	lZfYeTR7ESgZQIrlFmosbRnYs5F0EsVNmTThVPoo/yUHaCyurYSsgZFi0RF8ybJAGzdZ61Pracc
	9vd5uPqt7t532P8+ad6Qx9+2QGBsfd4VrgvlZzU7emQAtM1x4KA2tZ8b9/LqgM0VCCs3YsZSuEw
	u/m54QX+fjc7yGpBlQ1Il8XfydF8G8a07RxTYjmKOKL5fNaBOxRDhzZNTlSd3jHX2mTzX5EYivd
	zR6vMUbuHrBqxbGMTNNdCAhiTBvK8GyV6EgQW82RXeQ/rBRHvpiwWJgfeWCLyGVSj5WB+S5gT6h
	nnMwXrD441h6LOfp2tbkvpnFtHwWB6D//nH4HTKDUjUm0sn+UbEO2GUmQdT+iGjyKu+xIGfIWus
	qkn8mtUwRUboE43+RH2Or7HXILOmjvwgITzs/9
X-Google-Smtp-Source: AGHT+IEDApM6jMUqXmOQC79GFfIC4sIy6cb+Qboy5rbJD8Tyd7ltuTIgica7oqnktpgaeoZ9nZgMgg==
X-Received: by 2002:a17:902:cecb:b0:2a0:8859:3722 with SMTP id d9443c01a7336-2a2f232baa8mr372016715ad.25.1767534356794;
        Sun, 04 Jan 2026 05:45:56 -0800 (PST)
Received: from [192.168.31.239] ([167.103.54.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bbesm431959055ad.35.2026.01.04.05.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 05:45:56 -0800 (PST)
Message-ID: <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
Date: Sun, 4 Jan 2026 19:16:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30-12-2025 20:21, Konrad Dybcio wrote:
> On 12/30/25 2:02 PM, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
> 
> [...]
> 
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> @@ -0,0 +1,126 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +&{/} {
>> +	backlight: backlight {
>> +		compatible = "gpio-backlight";
>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>> +		default-on;
>> +	};
>> +
>> +	hdmi_connector: hdmi-out {
>> +		status = "disabled";
>> +	};
> 
> This should be a &label_reference
>

Okay, will add it in the next patch.
> [...]
> 
>> +	wifi_1p8v: regulator-wifi-1p8v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wifi_1p8v";
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
> 
> property-n
> property-names
> 
> consistently, please
>

I didn’t fully understand your comment.
Could you please elaborate a bit more so I can make the
necessary changes correctly. >> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	wifi_3p85v: regulator-wifi-3p85v {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wifi_3p85v";
>> +		regulator-min-microvolt = <3850000>;
>> +		regulator-max-microvolt = <3850000>;
>> +		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
> 
> ditto
> 
> [...]
> 
>> +&tlmm {
>> +	bt_en_state: bt-en-state {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		bias-pull-down;
>> +		output-low;
> 
> output-low/high should be unnecessary as these pins are governed
> by the kernel driver
> 

Okay,got it. Will make the necessary change in the next patch.
> lg otherwise
> 
> Konrad


