Return-Path: <linux-arm-msm+bounces-98384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALW5LNF4ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:05:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 347DB2B99FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27628305D6FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3902E3BA24C;
	Wed, 18 Mar 2026 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b="WlZkZAw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9993B3893;
	Wed, 18 Mar 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828175; cv=none; b=qbIZdiVDHtuUG7s5YMRDx6wbFKjhDv3oSiuz6TXYmhCxK1RQ0APA/y9fxwJ0Wa2hj7NqLxFNa+xbKSe+RlZj0hmfA8H8WHVxlggjzsiPSjifNV6QxsXAxQ+4/o46x3gpO7Yz3OAzjw5EYl7t3rt+PW6u46RT2QJWSniZsmHZV9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828175; c=relaxed/simple;
	bh=h1maZnca79zKEeBY2WSnihjzhk+DG97FDZ+EIpzcPto=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pPqtiAKlQCbYvHVckqy/qzO0MdzeZm9pP55I9AgVQ9uIGoIyTLqPM6w4MWWEqBvLM+Ns2HnaCuAMe344VBWQBeT0WfDWrNKff9K8WiapY6JU8otrxh2Jc55sDWx50kF4cPTlNhz8biaAj8W8L3Pfkg0kJYamraAdmSlzBTFjuKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de; spf=pass smtp.mailfrom=mecomediagroup.de; dkim=pass (2048-bit key) header.d=mecomediagroup.de header.i=@mecomediagroup.de header.b=WlZkZAw9; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mecomediagroup.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mecomediagroup.de
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fbPWg4f1jz41nt;
	Wed, 18 Mar 2026 11:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mecomediagroup.de;
	s=key2; t=1773828143;
	bh=h1maZnca79zKEeBY2WSnihjzhk+DG97FDZ+EIpzcPto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WlZkZAw91fF10jBPcD5sB7Tzvw9b+B0e5kz6mGgxvpNxvZ+s72U+DL23Q63T7JoXP
	 KAZvoy7u5Zxrme9J5TftYAoOIlzCnHzJxJ2Ifq1S7G/TvpdS0ynRMjPQBEeeCxiFsm
	 OqcsOrAatDeAsoEyeUbIlOxYOxcdSyztimRl+lccqavsUqgzVXsLtyaYn1dQlUio3K
	 61NCX6Vx9JE1ntOx3gIclqvtRjZT3wgxt5Ive9rPpRPZMwKOkO2RZDhy77/eE6thkh
	 OHsKhb4AJllV7ew1cFMEeqOXhEqnNAjcU2snnS8os0sLOCsEca4rquJYiR6BdRHd5R
	 Za7JYrSeJFMkA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4fbPWQ06Phz3ynd;
	Wed, 18 Mar 2026 11:02:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe95c.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fbPWP0T1Cz8t42;
	Wed, 18 Mar 2026 11:02:09 +0100 (CET)
Received: from webmail01.netcup.net (unknown [46.38.249.153])
	by mxe95c.netcup.net (Postfix) with ESMTPA id 8F9E080CA4;
	Wed, 18 Mar 2026 11:02:07 +0100 (CET)
Authentication-Results: mxe95c;
        spf=pass (sender IP is 46.38.249.153) smtp.mailfrom=mecid@mecomediagroup.de smtp.helo=webmail01.netcup.net
Received-SPF: pass (mxe95c: connection is authenticated)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 11:02:07 +0100
From: mecid@mecomediagroup.de
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add qcs9075-radxa-airbox-q900
In-Reply-To: <edf0eab1-845b-494c-89c0-8822f7c3156c@kernel.org>
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
 <20260318083621.470826-3-mecid@mecomediagroup.de>
 <edf0eab1-845b-494c-89c0-8822f7c3156c@kernel.org>
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <6a143ac02440b2d87cb86265e814d916@mecomediagroup.de>
X-Sender: mecid@mecomediagroup.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177382812792.1797080.6434826329839345598@mxe95c.netcup.net>
X-NC-CID: jMriU/DPGFwjJRiJgd+xykErDJknHmBq0g/VcpeAqQ2nHbFIuLpJ
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mecomediagroup.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[mecomediagroup.de:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[mecomediagroup.de:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98384-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mecomediagroup.de:dkim,mecomediagroup.de:email,mecomediagroup.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:url];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mecid@mecomediagroup.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 347DB2B99FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-18 09:56, Krzysztof Kozlowski wrote:
> On 18/03/2026 09:36, Mecid Urganci wrote:
>> Add device tree support for the Radxa AirBox Q900 board based on the
>> Qualcomm QCS9075 SoC (Lemans Family).
>> 
>> This board features HDMI 2.0 via dp0, 2x USB 3.1 Gen 2 ports,
>> 2x 2.5GbE Ethernet ports and onboard UFS storage.
>> 
>> Further information: https://radxa.com/products/fogwise/airbox-q900/
>> 
>> Functionality has been tested and confirmed working via an Armbian
>> Debian Trixie build.
>> 
>> Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
>> Made-with: Cursor
> 
> Not a correct tag. Please read full docs about usage of LLM, because if
> you came with wrong tag, I assume you did not read the rest of it.
> 
> What's more, did you review this code before posting it?

Sorry for the confusion as this is my first time sending a patch 
upstream and I tried to address what could come up with an LLM as 
sparing partner before.

I did review the code and tested for functionality.

> 
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>>  .../dts/qcom/qcs9075-radxa-airbox-q900.dts    | 1012 
>> +++++++++++++++++
>>  2 files changed, 1013 insertions(+)
>>  create mode 100644 
>> arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile 
>> b/arch/arm64/boot/dts/qcom/Makefile
>> index a4dc9e8b2d25..c8b7dd67806d 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -180,6 +180,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb 
>> monaco-el2.dtbo
>> 
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-radxa-airbox-q900.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts 
>> b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
>> new file mode 100644
>> index 000000000000..8b5202b527cb
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
>> @@ -0,0 +1,1012 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2026 Mecid Urganci
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "lemans.dtsi"
>> +#include "lemans-pmics.dtsi"
>> +
>> +/ {
>> +	model = "Radxa AIRbox Q900";
>> +	compatible = "radxa,airbox-q900", "qcom,qcs9075", "qcom,sa8775p";
>> +
>> +	aliases {
>> +		ethernet0 = &ethernet0;
>> +		ethernet1 = &ethernet1;
>> +		i2c15 = &i2c15;
>> +		i2c18 = &i2c18;
>> +		serial0 = &uart10;
>> +		ufshc1 = &ufs_mem_hc;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>> +
>> +	vcc_5v0_regulator: vcc-5v0-regulator {
> 
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
> 

Will address in V2, thank you!

>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc_5v0";
>> +		gpio = <&pmm8654au_3_gpios 6 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc_5v0_en_state>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc5v0_usb30_otg_regulator: vcc5v0-usb30-otg-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc5v0_usb30_otg";
>> +		gpio = <&pmm8654au_2_gpios 3 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc3v3_usb30_otg_en_state>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc5v0_usb30_regulator: vcc5v0-usb30-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc5v0_usb30";
>> +		gpio = <&pmm8654au_2_gpios 4 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc3v3_usb30_en_state>;
>> +		regulator-min-microvolt = <5000000>;
>> +		regulator-max-microvolt = <5000000>;
>> +		regulator-boot-on;
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc_3v3_ssd_regulator: vcc-3p3-ssd-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc_3v3_ssd";
>> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc_3v3_ssd_en_state>;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	vcc3v3_minipcie_regulator: vcc3v3-minipcie-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vcc3v3_minipcie";
>> +		gpio = <&pmm8654au_2_gpios 10 GPIO_ACTIVE_HIGH>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&vcc3v3_minipcie_en_state>;
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-boot-on;
>> +		enable-active-high;
>> +		regulator-always-on;
>> +	};
>> +
>> +	gpio_leds: gpio-leds {
>> +		compatible = "gpio-leds";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&status_led_state>, <&power_led_state>;
>> +
>> +		status-led {
>> +			gpios = <&pmm8654au_1_gpios 11 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "heartbeat";
>> +			function = LED_FUNCTION_STATUS;
>> +			color = <LED_COLOR_ID_BLUE>;
>> +		};
>> +
>> +		power-led {
>> +			gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger = "default-on";
>> +			function = LED_FUNCTION_POWER;
>> +			color = <LED_COLOR_ID_GREEN>;
>> +		};
>> +	};
>> +
>> +	gpio_keys: gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&gpio_keys_default>;
>> +		pinctrl-names = "default";
>> +
>> +		power-key {
>> +			label = "Power Off";
>> +			gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_POWER>;
>> +			wakeup-source;
>> +			debounce-interval = <30>;
>> +		};
>> +	};
>> +
>> +	fan0: gpio-fan {
>> +		compatible = "gpio-fan";
>> +		gpios = <&pmm8654au_1_gpios 12 GPIO_ACTIVE_HIGH>;
>> +		gpio-fan,speed-map = <0 0>, <5000 1>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&fan_en_state>;
>> +		#cooling-cells = <2>;
>> +	};
>> +
>> +	dp0-connector {
> 
> dp-connector
> 
>> +		compatible = "dp-connector";
>> +		label = "eDP0";
>> +		type = "full-size";
>> +
>> +		port {
>> +			dp0_connector_in: endpoint {
>> +				remote-endpoint = <&mdss0_dp0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
> 
> ...
> 
>> +
>> +	gpio_keys_default: gpio-keys-default-state {
>> +		pins = "gpio97";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	power_led_state: power-led-state {
>> +		pins = "gpio98";
>> +		function = "gpio";
>> +		output-high;
>> +		bias-pull-up;
>> +	};
>> +};
>> +
>> +/ {
>> +	thermal-zones {
>> +		cpu-0-0-0-thermal {
> 
> You should override given thermal zone by phandle/label style, not by
> full path.

Will address in V2 here too.

> 
> 
> 
> Best regards,
> Krzysztof

Thank you for feedback,
Mecid Urganci

