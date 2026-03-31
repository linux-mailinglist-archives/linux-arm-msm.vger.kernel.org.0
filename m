Return-Path: <linux-arm-msm+bounces-100985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIvrAmaLy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:52:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD736678B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00F13301A2F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D058A3E275E;
	Tue, 31 Mar 2026 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxiWadQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B8D3C3453
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946969; cv=none; b=uMgPIQpHzhr7ZmlMBhDNcZoYLR/4y3mIZwEtYo2Yxii9M4ccyRimRtHwhidQrrwZk6+2Q2TrNw318PefUdxw/K9kuLUmeMaGkmdcitRK2c2ER2noLSqW28SXGPIgBS3fTSvgZxJxAJnkthZWh5HdU4EpT9zHIcpV+i2QmXe7JKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946969; c=relaxed/simple;
	bh=4X4aBEfpdQbm3c1odjqr9GWQmAZFTeQXJk9rSc9v2p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+wh0u2jrdWEZ8/yMUzBBby5gwKUu1fHoSCrZ2LolCKfHggJmjnw2ImTb7r66a4G5GV7gw65iwT7i5E/n6TvEGQtUo5M6a7+HEDLDawWUqQpZqG3vMJWZzvzRghMjR1K4tVqVzAA2BoEm8qqsPP9nVeF0O1oZCySvekM4+Ne4wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxiWadQU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9516a653so23700355ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 01:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946968; x=1775551768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Z189t+doKS0SdPI8It61kpi9R3t4BM5IY1DGGtz47k=;
        b=IxiWadQUrvBkZHqXt6TQo8bF6lsj1b+rL34nnhBvWvNG9MJ94X+EXEDKyulLv91TiG
         SvDSr/dc05kHuoWim5el4XyxQ5WPDYUW1i19CDloJKwXbHFPXBAFyq2A4lri/MgCmJwS
         7L4ONQIWbPOb3kXg3qURaIy/RrbjMWUStsygFVfGgbmhyz6EgU4mJbv1fl7GZ6PUg3Hm
         Cq8mhXLJ0zaOO9Fe1o2cHhmzm7f4V5XCyZ1ADcfC8c2+6ugSUrwjCnUkWn02G4NsCDH5
         L3e7a+lAjfu6NGq38kYfy86dLmFmPtuZCyzPWmmcDk3FyNn1bDQIs8q0Z4jUQfioA1LL
         pXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946968; x=1775551768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Z189t+doKS0SdPI8It61kpi9R3t4BM5IY1DGGtz47k=;
        b=dTvrPkuS3f/NFJVNFX14YRGcWkML3DGtuFO3x9B6mWxO+Eq9LTTYwSojVYn4kJZyHQ
         8bdnjCybCHbmzzuwnImfMBntVWIZckA/zBb62vgn9TBPp1CyqYJKYPlBnBI7IYDZc/ax
         fJEoMZIhIoTeTmtfjL0Ad2HsZKCg9+1Kg+HUvkYNN3b6KOKgqAKb5dYKA5VWMr6QqqU1
         x6RkuIxxUIYWc714WmGoqkVT2pyKAO+5d8L+eRB/vT2iLEVbYed2PZBbhfbt5vVjkIS6
         OzbnPW/a7mWlmp0CZZUWiCn7Yg6nR8qlVyC4SwGL2BsGU/MiNUYtPhX1/unLrEx2M9Lp
         A9oA==
X-Forwarded-Encrypted: i=1; AJvYcCVPuzzQPYhQvGlBDj8SiuHyWcWsyTEwCS1j+L32ZIe7XXXWFEsXKNO6Dr6iNV1IrNnD1iMAOs2x7wJtbSgo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Svls6SmpSytIok4w2bbOjwFaOFcYIRqK7Az3HDQNNsk6cB5P
	dArDLNh0Gow26guQhkMGi2aLFNH37GAMcFtF/81RMTXt7apCBxOpYeFb
X-Gm-Gg: ATEYQzzKa+/7DpOgLlWTQabo9dyBfrxtsl+Y5C6hYjkWRzmeUx3ODJw2lGzlz/qUqn7
	VOKf7Lp9pbvrikDYiX6QrmfzyaesbWUUJn1K1wO/urMcrJ6DsBfsBCT2aLZuBRiu5ofKDcUm+O/
	V8WdWXiu6KemUUt9XmqS27SaiUSm6wqLKRlK2rxhztNy5IqgBZPqkRW79kkK4pSX1Tg6nj6nRG+
	JkC60CiV0hk23U7PavbXKO6/OOLQmCgFRaSGkxf07Ho1nVp24qT4Mke0yInM0V+nnftD8QTf4sd
	zr51BspDTpukMwLqPH2T73Uigd8WnUprQ3A17vCsUwFCr4DkijaAmOERqWq49ggKBLNgauTxGeP
	9Kdj5ruLgnR+b5QRNvA+us87LsK26w73+w4R56iUyK1i12+dHhLQWxLrZNkzNOGMdWyLXqIpmLn
	d18JcEmMnvmuB+ySZyOf0fjUZDaOkRCXdBgnB0++XhxOanKbY=
X-Received: by 2002:a17:903:98f:b0:2b0:6cb5:c6c5 with SMTP id d9443c01a7336-2b0cdd44b5fmr160933055ad.49.1774946967705;
        Tue, 31 Mar 2026 01:49:27 -0700 (PDT)
Received: from [172.16.20.13] ([136.226.252.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aa9fsm101511695ad.20.2026.03.31.01.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 01:49:26 -0700 (PDT)
Message-ID: <cea54c3f-cd3c-4785-9868-45d3264f79ad@gmail.com>
Date: Tue, 31 Mar 2026 14:19:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 3/3] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260302121159.1938694-1-tessolveupstream@gmail.com>
 <20260302121159.1938694-4-tessolveupstream@gmail.com>
 <rco6vpc2cnn7y52hyuf3btt2mo7apv46romvi3onakc5axjuef@sbghvgoknspy>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <rco6vpc2cnn7y52hyuf3btt2mo7apv46romvi3onakc5axjuef@sbghvgoknspy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-100985-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 9ECD736678B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 02-03-2026 18:43, Dmitry Baryshkov wrote:
> On Mon, Mar 02, 2026 at 05:41:59PM +0530, Sudarshan Shetty wrote:
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
>> According to the hardware design and vendor guidance, the WiFi PA
>> supplies VDD_PA_A and VDD_PA_B only need to be enabled at the same time
>> as asserting WLAN_EN.
>>
>> On this platform, WiFi enablement is controlled via the WLAN_EN GPIO
>> (GPIO84), which also drives the VDD_PA_A and VDD_PA_B power enables.
>> Remove the VDD_PA_A and VDD_PA_B regulator nodes from the device tree
>> and rely on WLAN_EN to enable WiFi functionality.
>>
>> Add talos-evk-usb1-peripheral.dtso overlay to enable USB0 peripheral
>> (EDL) mode. The base DTS will keep USB0 host-only due to hardware
>> routing through the EDL DIP switch, and the overlay switches the
>> configuration for device-mode operation.
>>
>> The LVDS backlight hardware has been updated to use a simplified
>> design. The backlight enable signal is now permanently pulled up
>> to 3.3V and is no longer controlled via GPIO59.
>>
>> Remove the GPIO59 based backlight configuration from the device
>> tree, as it is no longer routed to the LVDS interface.
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
>> - SN65DSI84ZXHR DSI-to-LVDS bridge
>> - Wi-Fi/BT
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>>  .../qcom/talos-evk-lvds-auo,g133han01.dtso    | 127 ++++
>>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 614 ++++++++++++++++++
>>  .../dts/qcom/talos-evk-usb1-peripheral.dtso   |  10 +
>>  arch/arm64/boot/dts/qcom/talos-evk.dts        | 139 ++++
>>  5 files changed, 896 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
>> +
>> +	regulator-usb2-vbus {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "USB2_VBUS";
>> +		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-0 = <&usb2_en>;
>> +		pinctrl-names = "default";
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
> 
> Hmm. I hoped that we are past this stage. Please order the nodes.
>

Okay, will take care in the next patch series.
 
>> +
>> +	vreg_conn_1p8: regulator-conn-1p8 {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_1p8";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 1 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_conn_pa: regulator-conn-pa {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg_conn_pa";
>> +		startup-delay-us = <4000>;
>> +		enable-active-high;
>> +		gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> +	vreg_v3p3_can: regulator-v3p3-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v3p3-can";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vreg_v5p0_can: regulator-v5p0-can {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vreg-v5p0-can";
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
> 
> [...]
> 
>> +
>> +/*
>> + * USB0 routing and EDL mode:
>> + *
>> + * The USB0 controller’s HS differential pair is switched (manually)
>> + * between the Micro-USB port for EDL/ADB and the on-board USB 3.0 hub.
>> + *
>> + * During EDL (Emergency Download) mode, the HS lines are explicitly
>> + * routed to the Micro-USB port to allow the SoC to enter device mode
>> + * for flashing.
>> + *
>> + * After EDL the switch is normally toggled so the HS lines stay
>> + * connected to the hub’s Type-A downstream ports, leaving no electrical
>> + * path to the Micro-USB connector — therefore USB0 runs host-only in
>> + * normal runtime and device mode must not be advertised.
>> + *
>> + * USB0 is configured host-only in the base device tree; a separate
>> + * device-tree overlay enables the Micro-USB peripheral configuration for
>> + * ADB. For ADB to work during normal runtime the DIP switch SW1 must be
>> + * manually toggled to the off position (reconnecting the HS pair to the
>> + * Micro-USB port).
>> + */
>> +
>> +&usb_1 {
>> +	status = "okay";
>> +};
>> +
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>> new file mode 100644
>> index 000000000000..2f4630a6ba66
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-usb1-peripheral.dtso
>> @@ -0,0 +1,10 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +/plugin/;
> 
> Comment, what should be changed to make use of it.
> 

Sure, will add it in the next patch series.
>> +
>> +&usb_1_dwc3 {
>> +        dr_mode = "peripheral";
>> +};
> 


