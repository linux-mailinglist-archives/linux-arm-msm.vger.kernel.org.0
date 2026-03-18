Return-Path: <linux-arm-msm+bounces-98358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH3OJ6houmnnWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:56:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5A92B88CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A412F3001B58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77D53939C9;
	Wed, 18 Mar 2026 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiScRrjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AC287269;
	Wed, 18 Mar 2026 08:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824165; cv=none; b=sTXHqbynS2hL/17cSJIGAEPxP/J5X7gJBJKDi8Xp62bCH1uAPjn/n6qWX8BA/qnNZinqRt0GL8itB1G6neLXuoCXfZD5T8HUkRha1MQjOF3YOMynTQwEdvn8F00H5cS9If41tHLEhNWYW1OkJpZ+jGGnWUqBM8j5Dk0U8jXo+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824165; c=relaxed/simple;
	bh=25xQk1OMOB0x0hT2Fo3vaZByaRVPXWOX0KUfBuNAjaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RL+7QFN5MSel2EftiLnKal3vk5KzhSEkPTHQmkE2ZGFR70RUgL/ivd5SS8KIgRZJ1+qndp32nGzRQYYJEueg2QusR1sITIh4aCWo4bhT8PnBWni5J2Z46diTIVWPP+Zuuz15cMES49cLBfEtiq/RfW7kGHR91pBrkVDuJAYfvHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiScRrjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2557C19421;
	Wed, 18 Mar 2026 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773824165;
	bh=25xQk1OMOB0x0hT2Fo3vaZByaRVPXWOX0KUfBuNAjaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KiScRrjXBAx8WpZrhMZM8BjWnXBdOrUJL57ikpRHCHnMCQubBk76fM/Xn+Qlvg5nY
	 6uXetFyLpNSeAFFyTx1VNq1iu1DAo2bVbF1skkzRc185OM7OPuqGHl9QmSRpkNUzFB
	 LO8KeJS3FCkMVe2hpfpE6Px+c9xSfLrLr2gE1ziYkp2KKIR1v4Q1T147HfJ4QW1AEh
	 Yh/FX43i6mIdHUXkIPD7Ucq55ljM9fvgf2ikfvBUqKvMSFlQ68wN86v4xmfLE5RAzX
	 iiGoLdk35RIEt3dAi3e5R5SXdx9Mkz3ZLBaAO7jSuUzhNG31aI71K/ncR9x7+IrziJ
	 kPQHBHtA0B/pA==
Message-ID: <edf0eab1-845b-494c-89c0-8822f7c3156c@kernel.org>
Date: Wed, 18 Mar 2026 09:56:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add qcs9075-radxa-airbox-q900
To: Mecid Urganci <mecid@mecomediagroup.de>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260318083621.470826-1-mecid@mecomediagroup.de>
 <20260318083621.470826-3-mecid@mecomediagroup.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260318083621.470826-3-mecid@mecomediagroup.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-98358-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mecomediagroup.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,radxa.com:url]
X-Rspamd-Queue-Id: 0D5A92B88CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 09:36, Mecid Urganci wrote:
> Add device tree support for the Radxa AirBox Q900 board based on the
> Qualcomm QCS9075 SoC (Lemans Family).
> 
> This board features HDMI 2.0 via dp0, 2x USB 3.1 Gen 2 ports,
> 2x 2.5GbE Ethernet ports and onboard UFS storage.
> 
> Further information: https://radxa.com/products/fogwise/airbox-q900/
> 
> Functionality has been tested and confirmed working via an Armbian
> Debian Trixie build.
> 
> Signed-off-by: Mecid Urganci <mecid@mecomediagroup.de>
> Made-with: Cursor

Not a correct tag. Please read full docs about usage of LLM, because if
you came with wrong tag, I assume you did not read the rest of it.

What's more, did you review this code before posting it?

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>  .../dts/qcom/qcs9075-radxa-airbox-q900.dts    | 1012 +++++++++++++++++
>  2 files changed, 1013 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a4dc9e8b2d25..c8b7dd67806d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -180,6 +180,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-radxa-airbox-q900.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> new file mode 100644
> index 000000000000..8b5202b527cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-radxa-airbox-q900.dts
> @@ -0,0 +1,1012 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026 Mecid Urganci
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "lemans.dtsi"
> +#include "lemans-pmics.dtsi"
> +
> +/ {
> +	model = "Radxa AIRbox Q900";
> +	compatible = "radxa,airbox-q900", "qcom,qcs9075", "qcom,sa8775p";
> +
> +	aliases {
> +		ethernet0 = &ethernet0;
> +		ethernet1 = &ethernet1;
> +		i2c15 = &i2c15;
> +		i2c18 = &i2c18;
> +		serial0 = &uart10;
> +		ufshc1 = &ufs_mem_hc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	vcc_5v0_regulator: vcc-5v0-regulator {

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		gpio = <&pmm8654au_3_gpios 6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc_5v0_en_state>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vcc5v0_usb30_otg_regulator: vcc5v0-usb30-otg-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb30_otg";
> +		gpio = <&pmm8654au_2_gpios 3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc3v3_usb30_otg_en_state>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vcc5v0_usb30_regulator: vcc5v0-usb30-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb30";
> +		gpio = <&pmm8654au_2_gpios 4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc3v3_usb30_en_state>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vcc_3v3_ssd_regulator: vcc-3p3-ssd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_ssd";
> +		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc_3v3_ssd_en_state>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	vcc3v3_minipcie_regulator: vcc3v3-minipcie-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_minipcie";
> +		gpio = <&pmm8654au_2_gpios 10 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcc3v3_minipcie_en_state>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	gpio_leds: gpio-leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&status_led_state>, <&power_led_state>;
> +
> +		status-led {
> +			gpios = <&pmm8654au_1_gpios 11 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_BLUE>;
> +		};
> +
> +		power-led {
> +			gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "default-on";
> +			function = LED_FUNCTION_POWER;
> +			color = <LED_COLOR_ID_GREEN>;
> +		};
> +	};
> +
> +	gpio_keys: gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +
> +		power-key {
> +			label = "Power Off";
> +			gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_POWER>;
> +			wakeup-source;
> +			debounce-interval = <30>;
> +		};
> +	};
> +
> +	fan0: gpio-fan {
> +		compatible = "gpio-fan";
> +		gpios = <&pmm8654au_1_gpios 12 GPIO_ACTIVE_HIGH>;
> +		gpio-fan,speed-map = <0 0>, <5000 1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fan_en_state>;
> +		#cooling-cells = <2>;
> +	};
> +
> +	dp0-connector {

dp-connector

> +		compatible = "dp-connector";
> +		label = "eDP0";
> +		type = "full-size";
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss0_dp0_out>;
> +			};
> +		};
> +	};
> +};
> +

...

> +
> +	gpio_keys_default: gpio-keys-default-state {
> +		pins = "gpio97";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	power_led_state: power-led-state {
> +		pins = "gpio98";
> +		function = "gpio";
> +		output-high;
> +		bias-pull-up;
> +	};
> +};
> +
> +/ {
> +	thermal-zones {
> +		cpu-0-0-0-thermal {

You should override given thermal zone by phandle/label style, not by
full path.



Best regards,
Krzysztof

