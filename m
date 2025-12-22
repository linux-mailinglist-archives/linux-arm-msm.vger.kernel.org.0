Return-Path: <linux-arm-msm+bounces-86108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40428CD4CE0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 071AF3007615
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61553277AF;
	Mon, 22 Dec 2025 06:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0Jn6Ky/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D22FE593
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766385652; cv=none; b=pusuu38tfS76TkOKAwL1o7WD/qwYlwTItszewHqHI6q7l2VsIqEJwRz0cybIejUePu/U3lWfwKymxNHt1yGKh7AP/icWc4B4Fncy3KxUz5OHOv4joWYncSd/058kMOIN1zZFZiqZ2Hll0Cpk4PfslKGOvIiVW+sIf0BL65JFx/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766385652; c=relaxed/simple;
	bh=rP6QYpytQMGZd27phGooY7RQP9NfnWfEWJfnoQtwV5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z1WUECezmbtw8HxT3qGSkMPlsnsjvYAm6slZm/k8mTViV6SjPzNpZ7zqbPktoz9yj6CzYm+X3+E5h9jNctJqTS/lRMmCUglNfMPcTIX3pKITB1yx0XtjC7gGSjx0mczpbsTFdyURoQxffsCBX7cwikBPB6j8nlLujfbRlMz6U9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0Jn6Ky/; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2740402b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766385650; x=1766990450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPXWXbJD0J7h2WhDXKa99kJBcNS76iyn70zC5bGEQyw=;
        b=b0Jn6Ky/X4rvXqEbjfShioAN4mKGSHbcisJMGLewppkO4i7h2XI2BT2Tqk6hYP0+q9
         VLjOzlskp7ESy75jMRyxGwmZKFfLy0sDz8bwzV1YqM9cB6O+A4octWn7mtCCbs86B4x9
         H/3bWyc/5YxQn3UnVZSm5jMagkeWSBj6yVjPNLYT/Sx+aXuJdwGS/2HNvm3xcO1SDG+l
         nXAzaVPogGWeYmepWElpgPosdp3nYxw8fkG2xp9ErcQ7Za+SAJuNmeswAYRui9DokL9P
         vka79YiFhu1vYUBoZC46Eikqt4tRXxIRv/jTZx2AFcbBf2wAUFghCebl9KcpdpoILN2d
         4EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766385650; x=1766990450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPXWXbJD0J7h2WhDXKa99kJBcNS76iyn70zC5bGEQyw=;
        b=NqmJuDq8J4/mOEY8W2rU+mGtt0NwJpcOt1Csj6/L9G/xRoTg9qYeDmbTJ+7EAKnA2H
         AB+3nKWBHyUGfUv4Nb0q9zNIw3kWYibKgstKXYfwzSOFyn1eGWVyUsCdsuPciCgR4R5R
         jbem+lnuP3XVt++H1wgxeLTQzc7sscRYiop1K3JPOZCTXA005/BXZfOPEGK9LBIJjjHZ
         zP+NvPDfPz2DBGl8MyY9BOVpHOzA6z2hcbd2T/jxLT8XJ/U7GoZ6kfQxrJR6D30PveW9
         8Yp4mwkIt9ckk0nlNurj86loNuqZZd5TQ9cmMGtdu5I5886TebocHMQLEwaWA0Ms2GRa
         kEXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/pmOOsc8lRYVNeNes4hnM5XsKq9R5VT1W3/sD/2WRGEkRD8Ud2dt5bhFbDB/Dg8U418yokV1P2YF5GThF@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSHfMXrLc1MZcAjVrX3JErJP/o326qRQA8NQIy8apHA76mE3L
	P6l1cvaHh6EPNee2Qt42DhwI+erRqPe2O/2ZPGbkcLSVgHwH0fK/pGsFDIYPRw==
X-Gm-Gg: AY/fxX7H8spWcOvxjxp+6cU+93guZ/fZN02H7vVwUcOG1CzTXEa20pIYyG3BGVTpZhx
	vxuB66Gmf/d4U4VnVFmWCoHW7PaIBJb1tbZB6CWTr6V5Z1XrBQHg1rZf/iQ24dizZaQVmQDiAeo
	Qk5/k0U0AG+XVpfL3qmAJj4RMuASziYxTFSgLgacQD2mL/AZWQJYhlFjet2HxIrQmgztgAVYKmh
	3EsjzvVNDC1EDp1bqeKtDWsfEC/c2UBP6svRRDZFCK0FEGOKgoAbreROAZ0jftKmao+JJ6jByvC
	JENUez6SwpUryh5/X7++2FahM8K9aCC3d9Wn1WFYABFR2rSo6QRQVxuoC1QbjC7NTpGbwWiKKQq
	xNP4YvYvNf1rLouR6xFZKEefs006ga5AiQgOur6BYA6U80CPzmenoe7dtYB+DYdknHCiEsHhIoY
	O6A5RAKVgRxKCm2aXBZgCqHzMsWDYjGYdSH0J4i5TsDZX4
X-Google-Smtp-Source: AGHT+IE62I9JyCTUp3ETxHws6VOOJR04P/KWDZqZ4yG8YBlKUZEaGLiVAdwx8Q1PoK8HXIjIa0sCkQ==
X-Received: by 2002:aa7:9312:0:b0:7e8:43f5:bd56 with SMTP id d2e1a72fcca58-7ff6784e709mr7675977b3a.66.1766385650330;
        Sun, 21 Dec 2025 22:40:50 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm9215799b3a.39.2025.12.21.22.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 22:40:49 -0800 (PST)
Message-ID: <90700087-7367-403c-97c5-81108a573aae@gmail.com>
Date: Mon, 22 Dec 2025 12:11:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251201172222.3764933-1-tessolveupstream@gmail.com>
 <20251201172222.3764933-3-tessolveupstream@gmail.com>
 <q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <q63bdon55app4gb2il5e7skyc6z2amcnaiqbqlhen7arkxphtb@3jejbelji2ti>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06-12-2025 04:51, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 10:52:22PM +0530, Sudarshan Shetty wrote:
>> Add the device tree for the QCS615-based Talos EVK platform. The
>> platform is composed of a System-on-Module following the SMARC
>> standard, and a Carrier Board.
>>
>> The Carrier Board supports several display configurations, HDMI and
>> LVDS. Both configurations use the same base hardware, with the display
>> selection controlled by a DIP switch.
>>
>> Use a DTBO file, talos-evk-lvds-auo,g133han01.dtso, which defines an
>> overlay that disables HDMI and adds LVDS. The DTs file talos-evk
>> can describe the HDMI display configurations.
>>
>> The initial device tree includes support for:
>> - CPU and memory
>> - UART
>> - GPIOs
>> - Regulators
>> - PMIC
>> - Early console
>> - AT24MAC602 EEPROM
>> - MCP2515 SPI to CAN
>> - ADV7535 DSI-to-HDMI bridge
>> - DisplayPort interface
>>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   3 +
>>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 131 +++++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 447 ++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 137 ++++++
>>  4 files changed, 718 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 5b52f9e4e5f3..94c20074397c 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -305,6 +305,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>> +talos-evk-lvds-auo,g133han01-dtbs	:= talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
>>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> new file mode 100644
>> index 000000000000..2a90d61892e7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>> @@ -0,0 +1,131 @@
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
>> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
>> +		default-on;
>> +	};
>> +
>> +	hdmi-out {
>> +		status = "disabled";
>> +	};
>> +
>> +	lcd-pwm-en {
>> +		compatible = "gpio-backlight";
>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
>> +		default-on;
>> +	};
> 
> I really don't like the idea of describing two separate backlight
> devices here. We have a single backlight on the panel, controlled by two
> GPIOs. I think, using GPIO instead of a PWM is a sensible enough usecase
> to let DT use two GPIOs in gpio-backlight (with corresponding changes to
> the bindings and the driver).
> 

Okay, will take care in the next patch.
>> +
>> +	panel-lvds {
>> +		compatible = "auo,g133han01";
> 
> backlight = <&backlight>;
> 
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			/* LVDS A (Odd pixels) */
>> +			port@0 {
>> +				reg = <0>;
>> +				dual-lvds-odd-pixels;
>> +
>> +				lvds_panel_out_a: endpoint {
>> +					remote-endpoint = <&sn65dsi84_out_a>;
>> +				};
>> +			};
>> +
>> +			/* LVDS B (Even pixels) */
>> +			port@1 {
>> +				reg = <1>;
>> +				dual-lvds-even-pixels;
>> +
>> +				lvds_panel_out_b: endpoint {
>> +					remote-endpoint = <&sn65dsi84_out_b>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
> 


