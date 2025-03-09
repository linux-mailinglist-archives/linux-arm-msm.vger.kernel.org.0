Return-Path: <linux-arm-msm+bounces-50740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C54B3A58295
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 10:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3C8D16A936
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B23185935;
	Sun,  9 Mar 2025 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="2uIc5rHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D2DC2FD;
	Sun,  9 Mar 2025 09:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741511856; cv=none; b=WrUqFBjzl9RJtxxYXP9F5umgOihoZUZlwAPnZDFZD2L6FbqSerdoPIN8R2T0Sfq1xpwQND3CI8vaNv8f1lZBUM4Zn7cUK+tA8esVs724xNtmmvM3eUatQ1uTDCXwCU6+LGGDQoO1TWdYTqXSA8me2+r2Sx9tJ1y5tq1QtR0cEIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741511856; c=relaxed/simple;
	bh=JDQ3H9F/p5iNmdnwEyMhD1EBVlM5FKft5xwk3qf7y9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfiHAB7c4pCFTmYzcEkFErZvTms9MwlA7RD9tooWLnwKf0+ga3mCbJL3oPDZGXpVhMglOkogG4+/VTGH+uSCZFpFXFtSlTYj+WBtThjj99nNTCQJtDJg53plLr1ylrH5wHu/wDq6KknJ8YUrQCqPqOH7BmkpQMsHj8OqrI0EdzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=2uIc5rHn; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 9E51A1669F4;
	Sun,  9 Mar 2025 10:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1741511849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=69Fuo4py2NXnhITT1eKwEmPko6LKD9oV+W4Tc0mnlQA=;
	b=2uIc5rHnxIe9u2gqjIG52kXvqBzwUPGZdq8vAhN9wYn3YRYnQQoACdWEtU714QeMCCaNPO
	gcQfwYkLGpkAO3NJHNRWFyCtcmaoKucubmsKqEwXvNsNgbc445+2Mi52KHdfa5lldMxn/f
	8+kai+saixmumzd/AtNjPGbbgL1GYzc=
Message-ID: <88da307c-0403-405d-8356-c8baeb18eaba@ixit.cz>
Date: Sun, 9 Mar 2025 10:17:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3] ARM: dts: nexus4: Initial dts
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Ivan Belokobylskiy <belokobylskij@gmail.com>
References: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>
 <l4lv22oi2ktubf7aveqxqtwb7zz7cfrzdayuxxgwdj46ygubfs@qpl6ut37taoe>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <l4lv22oi2ktubf7aveqxqtwb7zz7cfrzdayuxxgwdj46ygubfs@qpl6ut37taoe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Dmitry!

Thank you for looking into it. See replies.

On 09/03/2025 09:33, Dmitry Baryshkov wrote:
> On Sun, Mar 09, 2025 at 01:45:51AM +0100, David Heidelberg via B4 Relay wrote:
>> From: Ivan Belokobylskiy <belokobylskij@gmail.com>
>>
>> Add initial support for LG Nexus 4 (mako).
>>
>> Features currently working: regulators, eMMC, WiFi, and volume keys.
>>
>> Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>> Changes in v3:
>> - rebased against next-20250307
>> - dropped backlight until driver gets converted to DT
>>
>> Changes in v2:
>> - lge vendor doesn't exist anymore, rename to lg
>> - sdcc@ to mmc@ to comply with dt-schema
>> ---
>>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>>   .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 342 +++++++++++++++++++++
>>   2 files changed, 343 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
>> index f06c6d425e91dd73c2b453d15543d95bd32383b9..0c1d116f6e84f76994aa8c8286350bdcd1657a42 100644
>> --- a/arch/arm/boot/dts/qcom/Makefile
>> +++ b/arch/arm/boot/dts/qcom/Makefile
>> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>>   	qcom-apq8064-ifc6410.dtb \
>>   	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>>   	qcom-apq8064-asus-nexus7-flo.dtb \
>> +	qcom-apq8064-lg-nexus4-mako.dtb \
>>   	qcom-apq8074-dragonboard.dtb \
>>   	qcom-apq8084-ifc6540.dtb \
>>   	qcom-apq8084-mtp.dtb \
>> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..bcb57675aa24892b290d543601f7a6b36b6a65f6
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
>> @@ -0,0 +1,342 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +#include "qcom-apq8064-v2.0.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/mfd/qcom-rpm.h>
>> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>> +/ {
>> +	model = "LG Nexus 4 (mako)";
>> +	compatible = "lg,nexus4-mako", "qcom,apq8064";
>> +
>> +	aliases {
>> +		serial0 = &gsbi7_serial;
>> +		serial1 = &gsbi6_serial;
>> +		serial2 = &gsbi4_serial;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial2:115200n8";
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges;
>> +
>> +		ramoops@88d00000{
>> +			compatible = "ramoops";
>> +			reg = <0x88d00000 0x100000>;
>> +			record-size = <0x00020000>;
>> +			console-size = <0x00020000>;
>> +			ftrace-size = <0x00020000>;
>> +		};
>> +	};
>> +
>> +	battery_cell: battery-cell {
>> +		compatible = "simple-battery";
>> +		constant-charge-current-max-microamp = <900000>;
>> +		operating-range-celsius = <0 45>;
>> +	};
>> +
>> +	soc {
>> +		rpm@108000 {
> 
> Please use &rpm { ... }; instead.
> 
>> +			regulators {
>> +				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
>> +				vin_lvs1_3_6-supply = <&pm8921_s4>;
> 
> Please move vin_lvs2-supply here.
> 
>> +				vin_lvs4_5_7-supply = <&pm8921_s4>;
>> +
> 
> Please move vdd_l1_l2_l12_l18 here.
> 
>> +				vdd_l24-supply = <&pm8921_s1>;
>> +				vdd_l25-supply = <&pm8921_s1>;
>> +				vin_lvs2-supply = <&pm8921_s1>;
>> +
>> +				vdd_l26-supply = <&pm8921_s7>;
>> +				vdd_l27-supply = <&pm8921_s7>;
>> +				vdd_l28-supply = <&pm8921_s7>;
>> +
>> +				/* Buck SMPS */
>> +				s1 {
>> +					regulator-always-on;
>> +					regulator-min-microvolt = <1225000>;
>> +					regulator-max-microvolt = <1225000>;
>> +					qcom,switch-mode-frequency = <3200000>;
>> +					bias-pull-down;
>> +				};
> 
> empty line
> 
>> +				s2 {
>> +					regulator-min-microvolt = <1300000>;
>> +					regulator-max-microvolt = <1300000>;
>> +					qcom,switch-mode-frequency = <1600000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* msm otg HSUSB_VDDCX */
>> +				s3 {
>> +					regulator-min-microvolt = <500000>;
>> +					regulator-max-microvolt = <1150000>;
>> +					qcom,switch-mode-frequency = <4800000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/*
>> +				 * msm_sdcc.1-sdc-vdd_io
>> +				 * tabla2x-slim-CDC_VDDA_RX
>> +				 * tabla2x-slim-CDC_VDDA_TX
>> +				 * tabla2x-slim-CDC_VDD_CP
>> +				 * tabla2x-slim-VDDIO_CDC
>> +				 */
>> +				s4 {
>> +					regulator-always-on;
>> +					regulator-min-microvolt	= <1800000>;
>> +					regulator-max-microvolt	= <1800000>;
>> +					qcom,switch-mode-frequency = <1600000>;
>> +					bias-pull-down;
>> +					qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
>> +				};
>> +
>> +				/*
>> +				 * supply vdd_l26, vdd_l27, vdd_l28
>> +				 */
>> +				s7 {
>> +					regulator-min-microvolt = <1300000>;
>> +					regulator-max-microvolt = <1300000>;
>> +					qcom,switch-mode-frequency = <3200000>;
>> +				};
>> +
>> +				s8 {
>> +					regulator-min-microvolt = <2200000>;
>> +					regulator-max-microvolt = <2200000>;
>> +					qcom,switch-mode-frequency = <1600000>;
>> +				};
>> +
>> +				l1 {
>> +					regulator-min-microvolt = <1100000>;
>> +					regulator-max-microvolt = <1100000>;
>> +					regulator-always-on;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* mipi_dsi.1-dsi1_pll_vdda */
>> +				l2 {
>> +					regulator-min-microvolt = <1200000>;
>> +					regulator-max-microvolt = <1200000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* msm_otg-HSUSB_3p3 */
>> +				l3 {
>> +					regulator-min-microvolt = <3075000>;
>> +					regulator-max-microvolt = <3500000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* msm_otg-HSUSB_1p8 */
>> +				l4 {
>> +					regulator-always-on;
>> +					regulator-min-microvolt = <1800000>;
>> +					regulator-max-microvolt = <1800000>;
>> +				};
>> +
>> +				/* msm_sdcc.1-sdc_vdd */
>> +				l5 {
>> +					regulator-min-microvolt = <2950000>;
>> +					regulator-max-microvolt = <2950000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* earjack_debug */
>> +				l6 {
>> +					regulator-min-microvolt = <3000000>;
>> +					regulator-max-microvolt = <3000000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* mipi_dsi.1-dsi_vci */
>> +				l8 {
>> +					regulator-min-microvolt = <2800000>;
>> +					regulator-max-microvolt = <3000000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* wcnss_wlan.0-iris_vddpa */
>> +				l10 {
>> +					regulator-min-microvolt = <2900000>;
>> +					regulator-max-microvolt = <2900000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* mipi_dsi.1-dsi1_avdd */
>> +				l11 {
>> +					regulator-min-microvolt = <2850000>;
>> +					regulator-max-microvolt = <2850000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* touch_vdd */
>> +				l15 {
>> +					regulator-min-microvolt = <1800000>;
>> +					regulator-max-microvolt = <2950000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* slimport_dvdd */
>> +				l18 {
>> +					regulator-min-microvolt = <1100000>;
>> +					regulator-max-microvolt = <1100000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* touch_io */
>> +				l22 {
>> +					regulator-min-microvolt = <1800000>;
>> +					regulator-max-microvolt = <1800000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/*
>> +				 * mipi_dsi.1-dsi_vddio
>> +				 * pil_qdsp6v4.1-pll_vdd
>> +				 * pil_qdsp6v4.2-pll_vdd
>> +				 * msm_ehci_host.0-HSUSB_1p8
>> +				 * msm_ehci_host.1-HSUSB_1p8
>> +				 */
>> +				l23 {
>> +					regulator-min-microvolt = <1800000>;
>> +					regulator-max-microvolt = <1800000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/*
>> +				 * tabla2x-slim-CDC_VDDA_A_1P2V
>> +				 * tabla2x-slim-VDDD_CDC_D
>> +				 */
>> +				l24 {
>> +					regulator-min-microvolt = <750000>;
>> +					regulator-max-microvolt = <1150000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				l25 {
>> +					regulator-min-microvolt = <1250000>;
>> +					regulator-max-microvolt = <1250000>;
>> +					regulator-always-on;
>> +					bias-pull-down;
>> +				};
>> +
>> +				l26 {
>> +					regulator-min-microvolt = <375000>;
>> +					regulator-max-microvolt = <1050000>;
>> +					regulator-always-on;
>> +					bias-pull-down;
>> +				};
>> +
>> +				l27 {
>> +					regulator-min-microvolt = <1100000>;
>> +					regulator-max-microvolt = <1100000>;
>> +				};
>> +
>> +				l28 {
>> +					regulator-min-microvolt = <1050000>;
>> +					regulator-max-microvolt = <1050000>;
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* wcnss_wlan.0-iris_vddio */
>> +				lvs1 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* wcnss_wlan.0-iris_vdddig */
>> +				lvs2 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				lvs3 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				lvs4 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				lvs5 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				/* mipi_dsi.1-dsi_iovcc */
>> +				lvs6 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				/*
>> +				 * pil_riva-pll_vdd
>> +				 * lvds.0-lvds_vdda
>> +				 * mipi_dsi.1-dsi1_vddio
>> +				 * hdmi_msm.0-hdmi_vdda
>> +				 */
>> +				lvs7 {
>> +					bias-pull-down;
>> +				};
>> +
>> +				ncp {
>> +					regulator-min-microvolt = <1800000>;
>> +					regulator-max-microvolt = <1800000>;
>> +					qcom,switch-mode-frequency = <1600000>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&pmicintc {
>> +	keypad@148 {
>> +		compatible = "qcom,pm8921-keypad";
>> +		reg = <0x148>;
>> +		interrupt-parent = <&pmicintc>;
>> +		interrupts = <74 1>, <75 1>;
> 
> IRQ_TYPE_EDGE_RISING
> 
> 
>> +		linux,keymap = <
>> +			MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)
>> +			MATRIX_KEY(0, 1, KEY_VOLUMEUP)
>> +		>;
>> +
>> +		keypad,num-rows = <1>;
>> +		keypad,num-columns = <5>;
>> +		debounce = <15>;
>> +		scan-delay = <32>;
>> +		row-hold = <91500>;
>> +	};
>> +};
>> +
>> +&gsbi1 {
>> +	status = "okay";
> 
> Status should be the last property. Add empty line before it (here and
> further)
> 
>> +	qcom,mode = <GSBI_PROT_I2C>;
>> +};
>> +
>> +&gsbi1_i2c {
>> +	status = "okay";
>> +	clock-frequency = <200000>;
>> +	pinctrl-0 = <&i2c1_pins>;
>> +	pinctrl-names = "default";
> 
> I don't see i2c1_pins being defined. Did it pass the build?
> Also there is already a pinctrl for this device. Why do you need to
> overwrite it?
> 
>> +};
>> +
>> +&gsbi4 {
>> +	status = "okay";
>> +	qcom,mode = <GSBI_PROT_I2C_UART>;
>> +};
>> +
>> +&gsbi4_serial {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gsbi4_uart_pin_a>;
> 
> Unnecessary, can be dropped. It's set in qcom-apq8064.dtsi.
> 
>> +};
>> +
>> +/* eMMC */
>> +&sdcc1 {
>> +	status = "okay";
>> +	vmmc-supply = <&pm8921_l5>;
>> +	vqmmc-supply = <&pm8921_s4>;
>> +};
>> +
>> +&riva {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&riva_wlan_pin_a>;
> 
> Where is it defined? Also pinctrl-names should come after pinctrl-N.

definition is kinda aside in qcom-apq8064-pins.dtsi .

All other suggestions incorporated, if it's OK otherwise, let me send v2

Thank you
David

> 
>> +};
>>
>> ---
>> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
>> change-id: 20250309-lg-nexus4-mako-da0833885b26
>>
>> Best regards,
>> -- 
>> David Heidelberg <david@ixit.cz>
>>
>>
> 

-- 
David Heidelberg


