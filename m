Return-Path: <linux-arm-msm+bounces-24708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4990D91CBCD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 11:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CA331C20DAA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 09:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD5A364CD;
	Sat, 29 Jun 2024 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="5cUUna29"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277FB14A85;
	Sat, 29 Jun 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719651699; cv=none; b=uzQ3+9feCApCjnwObL62H4+HuJbaPScemdDEXuyATG0TMDKs0fLa07H0M62sCa4JgUfoUK7MEu2gwMz1DzsC8nEALvseLyY/D6Ie6wOJgIAddEjUihTgU7bvN3B06GPVE1z22e9d97wd1iRfpVZkZrByxwYMccduMLifIJpQThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719651699; c=relaxed/simple;
	bh=W7NIudphB47cxV64suN18o18T+N2b7fBSp/JSfsbbkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mOzRYnVP3PkxnmHJLNUe33UwwYuoCZibwoSVgVjFPKOfH40Szdc4qHQPgYdoysscHzioEjw97C568f6MDtH544itVYJy1ayl1vEJsmbnICnAP94owhd/CYmXp66O23ltSXxAr8YeqBcaPA9ym/j5qHyAwHpTEEJ1O+HiFhHGbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=5cUUna29; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1719651695; bh=W7NIudphB47cxV64suN18o18T+N2b7fBSp/JSfsbbkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5cUUna29N0H9y1eZHHLIms3UTC6ssxLU9u5hK4Ytv+NvJTNnIr6OMKEF7rmXEnGjs
	 vHWTfYT1fqnkFdRS3XBpGkhuvRxSz4pDt0aHMXjPAGRBO0Yc2WOpiUSe8AM3O//9/P
	 wwkSxlr0UPoX3jBufRHUsCCa+10ktMVuvSFxtjPs=
From: Luca Weiss <luca@lucaweiss.eu>
To: linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Raymond Hackley <raymondhackley@protonmail.com>
Subject:
 Re: [PATCH v2 2/2] ARM: dts: qcom-msm8226-samsung-ms013g: Add initial device
 tree
Date: Sat, 29 Jun 2024 11:01:34 +0200
Message-ID: <6223513.lOV4Wx5bFT@g550jk>
In-Reply-To: <20240627193013.1800-3-raymondhackley@protonmail.com>
References:
 <20240627193013.1800-1-raymondhackley@protonmail.com>
 <20240627193013.1800-3-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Donnerstag, 27. Juni 2024 21:30:52 MESZ Raymond Hackley wrote:
> Samsung Galaxy Grand 2 is a phone based on MSM8226. It's similar to the
> other Samsung devices based on MSM8226 with only a few minor differences.
> 
> The device trees contain initial support with:
>  - GPIO keys
>  - Regulator haptic
>  - SDHCI (internal and external storage)
>  - UART (on USB connector via the TI TSU6721 MUIC)
>  - Regulators
>  - Touchscreen
>  - Accelerometer
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  arch/arm/boot/dts/qcom/Makefile               |   1 +
>  .../dts/qcom/qcom-msm8226-samsung-ms013g.dts  | 386 ++++++++++++++++++
>  2 files changed, 387 insertions(+)
>  create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index ccd4ce6353df..f06c6d425e91 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -28,6 +28,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-msm8226-microsoft-dempsey.dtb \
>  	qcom-msm8226-microsoft-makepeace.dtb \
>  	qcom-msm8226-microsoft-moneypenny.dtb \
> +	qcom-msm8226-samsung-ms013g.dtb \
>  	qcom-msm8226-samsung-s3ve3g.dtb \
>  	qcom-msm8660-surf.dtb \
>  	qcom-msm8916-samsung-e5.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
> new file mode 100644
> index 000000000000..190b52fda634
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
> @@ -0,0 +1,386 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include "qcom-msm8226.dtsi"
> +#include "pm8226.dtsi"
> +
> +/delete-node/ &smem_region;
> +
> +/ {
> +	model = "Samsung Galaxy Grand 2";
> +	compatible = "samsung,ms013g", "qcom,msm8226";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
> +		mmc1 = &sdhc_2; /* SDC2 SD card slot */
> +		serial0 = &blsp1_uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-hall-sensor {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&gpio_hall_sensor_default>;
> +		pinctrl-names = "default";
> +
> +		label = "GPIO Hall Effect Sensor";
> +
> +		event-hall-sensor {
> +			label = "Hall Effect Sensor";
> +			gpios = <&tlmm 50 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_LID>;
> +			linux,can-disable;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&gpio_keys_default>;
> +		pinctrl-names = "default";
> +
> +		label = "GPIO Buttons";
> +
> +		button-volume-up {
> +			label = "Volume Up";
> +			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +
> +		button-volume-down {
> +			label = "Volume Down";
> +			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +		};
> +
> +		button-home {
> +			label = "Home Key";
> +			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_HOMEPAGE>;
> +		};
> +	};
> +
> +	haptic {
> +		compatible = "regulator-haptic";
> +		haptic-supply = <&reg_motor_vdd>;
> +		min-microvolt = <3300000>;
> +		max-microvolt = <3300000>;
> +	};

This is the vibration motor? Use "vibrator" as node name then as per
https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter2-devicetree-basics.rst?plain=1#L299

Apart from this I don't see anything wrong.

Reviewed-by: Luca Weiss <luca@lucaweiss.eu>

> +
> +	reg_motor_vdd: regulator-motor-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "motor_vdd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 111 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&motor_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	reg_vdd_tsp_a: regulator-vdd-tsp-a {
> +		compatible = "regulator-fixed";
> +		regulator-name = "tsp_3p3v";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 31 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&tsp_en_default>;
> +		pinctrl-names = "default";
> +	};
> +
> +	reserved-memory {
> +		smem_region: smem@fa00000 {
> +			reg = <0x0fa00000 0x100000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&blsp1_i2c2 {
> +	status = "okay";
> +
> +	accelerometer@18 {
> +		compatible = "bosch,bma255";
> +		reg = <0x18>;
> +		interrupts-extended = <&tlmm 64 IRQ_TYPE_EDGE_RISING>;
> +
> +		vdd-supply = <&pm8226_l19>;
> +		vddio-supply = <&pm8226_lvs1>;
> +
> +		pinctrl-0 = <&accel_int_default>;
> +		pinctrl-names = "default";
> +
> +		mount-matrix = "0", "1", "0",
> +			       "-1", "0", "0",
> +			       "0", "0", "-1";
> +	};
> +};
> +
> +&blsp1_i2c5 {
> +	status = "okay";
> +
> +	touchscreen@20 {
> +		compatible = "zinitix,bt541";
> +
> +		reg = <0x20>;
> +		interrupts-extended = <&tlmm 17 IRQ_TYPE_EDGE_FALLING>;
> +
> +		touchscreen-size-x = <720>;
> +		touchscreen-size-y = <1280>;
> +
> +		vcca-supply = <&reg_vdd_tsp_a>;
> +		vdd-supply = <&pm8226_lvs1>;
> +
> +		pinctrl-0 = <&tsp_int_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&blsp1_uart3 {
> +	status = "okay";
> +};
> +
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-pm8226-regulators";
> +
> +		pm8226_s3: s3 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1300000>;
> +		};
> +
> +		pm8226_s4: s4 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2200000>;
> +		};
> +
> +		pm8226_s5: s5 {
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1150000>;
> +		};
> +
> +		pm8226_l1: l1 {
> +			regulator-min-microvolt = <1225000>;
> +			regulator-max-microvolt = <1225000>;
> +		};
> +
> +		pm8226_l2: l2 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8226_l3: l3 {
> +			regulator-min-microvolt = <750000>;
> +			regulator-max-microvolt = <1337500>;
> +		};
> +
> +		pm8226_l4: l4 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8226_l5: l5 {
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +		};
> +
> +		pm8226_l6: l6 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-allow-set-load;
> +			regulator-always-on;
> +		};
> +
> +		pm8226_l7: l7 {
> +			regulator-min-microvolt = <1850000>;
> +			regulator-max-microvolt = <1850000>;
> +		};
> +
> +		pm8226_l8: l8 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8226_l9: l9 {
> +			regulator-min-microvolt = <2050000>;
> +			regulator-max-microvolt = <2050000>;
> +		};
> +
> +		pm8226_l10: l10 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8226_l12: l12 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +		};
> +
> +		pm8226_l14: l14 {
> +			regulator-min-microvolt = <2750000>;
> +			regulator-max-microvolt = <2750000>;
> +		};
> +
> +		pm8226_l15: l15 {
> +			regulator-min-microvolt = <2800000>;
> +			regulator-max-microvolt = <2800000>;
> +		};
> +
> +		pm8226_l16: l16 {
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3350000>;
> +		};
> +
> +		pm8226_l17: l17 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2950000>;
> +
> +			regulator-system-load = <200000>;
> +			regulator-allow-set-load;
> +			regulator-always-on;
> +		};
> +
> +		pm8226_l18: l18 {
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8226_l19: l19 {
> +			regulator-min-microvolt = <2850000>;
> +			regulator-max-microvolt = <3000000>;
> +		};
> +
> +		pm8226_l20: l20 {
> +			regulator-min-microvolt = <3075000>;
> +			regulator-max-microvolt = <3075000>;
> +		};
> +
> +		pm8226_l21: l21 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-allow-set-load;
> +		};
> +
> +		pm8226_l22: l22 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8226_l23: l23 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <3300000>;
> +		};
> +
> +		pm8226_l24: l24 {
> +			regulator-min-microvolt = <1300000>;
> +			regulator-max-microvolt = <1350000>;
> +		};
> +
> +		pm8226_l25: l25 {
> +			regulator-min-microvolt = <1775000>;
> +			regulator-max-microvolt = <2125000>;
> +		};
> +
> +		pm8226_l26: l26 {
> +			regulator-min-microvolt = <1225000>;
> +			regulator-max-microvolt = <1300000>;
> +		};
> +
> +		pm8226_l27: l27 {
> +			regulator-min-microvolt = <2050000>;
> +			regulator-max-microvolt = <2050000>;
> +		};
> +
> +		pm8226_l28: l28 {
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +		};
> +
> +		pm8226_lvs1: lvs1 {};
> +	};
> +};
> +
> +&sdhc_1 {
> +	vmmc-supply = <&pm8226_l17>;
> +	vqmmc-supply = <&pm8226_l6>;
> +
> +	bus-width = <8>;
> +	non-removable;
> +
> +	status = "okay";
> +};
> +
> +&sdhc_2 {
> +	vmmc-supply = <&pm8226_l18>;
> +	vqmmc-supply = <&pm8226_l21>;
> +
> +	bus-width = <4>;
> +	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-0 = <&sdhc2_default_state &sdhc2_cd_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	accel_int_default: accel-int-default-state {
> +		pins = "gpio64";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
> +		pins = "gpio50";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	gpio_keys_default: gpio-keys-default-state {
> +		pins = "gpio106", "gpio107", "gpio108";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	motor_en_default: motor-en-default-state {
> +		pins = "gpio111";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	sdhc2_cd_default: sdhc2-cd-default-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	tsp_en_default: tsp-en-default-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	tsp_int_default: tsp-int-default-state {
> +		pins = "gpio17";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +};
> 





