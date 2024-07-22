Return-Path: <linux-arm-msm+bounces-26806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1E938F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7D72810EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0873916D9A2;
	Mon, 22 Jul 2024 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="wXHfdlN9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE6016C86C;
	Mon, 22 Jul 2024 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721652451; cv=none; b=Y/WpB+/f4Q1yLcTeQGxlzYGDo7TOFF5yR7p47nw9oxFUyPvBllarP1KhbiGrDzCCG6j7v7N/a3jUV+sZat+W2Ya50zbmcHtIKdZvmcEF+Fb5qjj6VYFYz9Tg6juMJ6EmblXrr/rr5wi1jMFqXcc+u0De9vFFtmZtJZ7/IRAPj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721652451; c=relaxed/simple;
	bh=o//hvXm2wBlxfCat551w+yqxTp8fDjjPtBSU35xPixg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=alunZkp6y5GtSabizcqbwZe21ta7ww6Gxnqz4Gojb3SvR15ZcNg7lJH4Oe8jru3AbTVtkEPGKuQ9M9AJAMf/5vI2LDYkyi9jpcwfayoq1mK1oXDnmoWcAUVJ0BIsGk0wcc7ldF8Pw3Ul/IuUlo0TSsvVm//bjZoIlMkEdIzW1zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=wXHfdlN9; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id E9BC6424CE;
	Mon, 22 Jul 2024 17:47:20 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721652441; bh=o//hvXm2wBlxfCat551w+yqxTp8fDjjPtBSU35xPixg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wXHfdlN9csv/iIDCEuY2dG0/6W5kBNA3Xk845K1dTLixJ2mSLFR5nNhmFFrk1SLC0
	 41WsR3xlVtxoQuVsz8d4urWqZbk/3AWvOr6S52Zb6vzcN/fb/L/IKz4vKCVAb+2HCX
	 vH34jE3XABwZfASM8dnvCw6Ix56YftxMK4QGqzP8zlypEX7Yc07mjlPsNbDqxlbqtQ
	 WSSECP0f07ROZNRo3TTHns+eO5MK5Fr3fBFfV8hvAVWxU106QZ5nzqc6pLuYlahdb4
	 d0TeE+tBiDbiKICssu+VQPKqz9feXQxwmYn/K08l9Lv/ZNx6UDNg2lHy6vggyumecI
	 tfceeBub9U3Fg==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 22 Jul 2024 17:47:13 +0500
Subject: [PATCH v2 2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add
 Lenovo A6000/A6010
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-msm89xx-wingtech-init-v2-2-0c981bbc5238@trvn.ru>
References: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
In-Reply-To: <20240722-msm89xx-wingtech-init-v2-0-0c981bbc5238@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, Anton Bambura <jenneron@postmarketos.org>, 
 Stephan Gerhold <stephan@gerhold.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12527; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=LrUm+BCnvpEZ7hxuZ8Cjjn5bwbxN2qC0EcbiGQTAAEA=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmnlTWgFF6EeULI3DlUA0jcG3yP4mfwVkVvpyOd
 TIxVyIj2y+JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZp5U1gAKCRBDHOzuKBm/
 dQddD/98wh1MgnuB/o75F/8kLjKEdLm1jzGqpjBUvQhZuFy1pquiuExx8Qp7/lso24JryBdBR8k
 N/U1E+1nAyOPISjYTKSDmf5RnylBC8J8KoEyC6iAt5j/p2xLITrj9qErzCQgj3ypp5E9iOxBp9Z
 Yo8IRviv4HjScTXlppK8sKMx9BAD1qiwbAvLY1v5lMmjElcKkj4kPJoGRvm5vktdc7tzz70rgev
 S1k7+PuziYfmb6aWVIOrm5xyn9EkOj8ShOpnVNNP4mGVZYxgcSXHhrPbe79aBEkhcRFGRs1F/BS
 c1oOYjxGQEMKv9t51GApiOnfeaYKjLhsc8Mph5dr8m42vLNxY7ebW6MwVpGZaftCTMXEH5hHFhY
 7/PWV88N+SMgEzSCZgApts6bS3lXkhwg6L6L1tRg8IcKoVgOnfaFsiIfwcMwPpHwe8j7yhzBXVa
 5SWqhN3SyhNOshFDzL0QQQR1uJi5XlsnZvj3vBGuAo6JPU9gAJC34nB3+Dq7sDiKhwdfCFvBCg/
 aPYUIiZ9MF7LrKTw2AcIkk4xrc34GriU+oEbQ6Yk72EV7hEQUDIOntqMGQThposDu44Gr1wU3XQ
 Ps/0WuyYBJyrNjbW46KNkoP+lBZZJJIXXxH5/nR+ILUEG1r7ReHpYdEm04jfHc0//vC8g/TVwm5
 yJtrvZI+cJkcK+A==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

From: Anton Bambura <jenneron@postmarketos.org>

Add initial device-tree for Lenovo A6000 (wt86518) and Lenovo A6010
(wt86528), which are MSM8916-based devices. These devices are quite
similar, so some configuration is shared in msm8916-wingtech-wt865x8.dtsi.

Lenovo A6000 (wt86518):
 - storage (eMMC and uSD card);
 - usb in peripheral mode;
 - touchscreen;
 - sensors;
 - WiFi/BT;
 - keys;
 - battery and charger.

Lenovo A6010 (wt86528):
 - storage (eMMC and uSD card);
 - usb with extcon;
 - touchscreen;
 - sensors;
 - WiFi/BT;
 - keys;
 - leds;
 - battery;

Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Nikita: minor cleanup]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  89 +++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 160 +++++++++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 215 +++++++++++++++++++++
 4 files changed, 466 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0e5c810304fb..fd4c7c41ddc4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -54,6 +54,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-rossa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-uf896.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-thwc-ufi001c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
new file mode 100644
index 000000000000..4848432d3fdd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-wingtech-wt865x8.dtsi"
+
+/ {
+	model = "Lenovo A6000 (Wingtech WT86518)";
+	compatible = "wingtech,wt86518", "qcom,msm8916";
+	chassis-type = "handset";
+
+	speaker_amp: audio-amplifier {
+		compatible = "awinic,aw8738";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&spk_ext_pa_default>;
+
+		mode-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Speaker Amp";
+		awinic,mode = <1>;
+	};
+};
+
+&blsp_i2c2 {
+	accelerometer@e {
+		compatible = "kionix,kxcj91008";
+		reg = <0xe>;
+
+		vdd-supply = <&pm8916_l6>;
+		vddio-supply = <&pm8916_l6>;
+
+		mount-matrix = "0", "-1", "0",
+			       "-1", "0", "0",
+			       "0",  "0", "1";
+	};
+};
+
+&headphones_switch {
+	VCC-supply = <&pm8916_l17>;
+};
+
+&pm8916_bms {
+	power-supplies = <&pm8916_charger>;
+};
+
+&pm8916_charger {
+	qcom,fast-charge-safe-current = <900000>;
+	qcom,fast-charge-safe-voltage = <4300000>;
+
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
+&sound {
+	model = "wt88047";
+	widgets =
+		"Speaker", "Speaker",
+		"Headphone", "Headphones";
+	pin-switches = "Speaker", "Headphones";
+	audio-routing =
+		"Speaker", "Speaker Amp OUT",
+		"Speaker Amp IN", "HPH_R",
+		"Headphones", "Headphones Switch OUTL",
+		"Headphones", "Headphones Switch OUTR",
+		"Headphones Switch INL", "HPH_L",
+		"Headphones Switch INR", "HPH_R",
+		"AMIC1", "MIC BIAS Internal1",
+		"AMIC2", "MIC BIAS Internal2";
+	aux-devs = <&speaker_amp>, <&headphones_switch>;
+};
+
+&usb {
+	dr_mode = "peripheral";
+	extcon = <&pm8916_charger>;
+};
+
+&usb_hs_phy {
+	extcon = <&pm8916_charger>;
+};
+
+&tlmm {
+	spk_ext_pa_default: spk-ext-pa-default-state {
+		pins = "gpio119";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dts
new file mode 100644
index 000000000000..3ab2eb6be107
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dts
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-wingtech-wt865x8.dtsi"
+
+/ {
+	model = "Lenovo A6010 (Wingtech WT86528)";
+	compatible = "wingtech,wt86528", "qcom,msm8916";
+	chassis-type = "handset";
+
+	/* left AW8736 */
+	speaker_amp_left: audio-amplifier-left {
+		compatible = "awinic,aw8738";
+
+		pinctrl-0 = <&spk_ext_pa_left_default>;
+		pinctrl-names = "default";
+
+		mode-gpios = <&tlmm 119 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Speaker Amp L";
+		awinic,mode = <3>;
+	};
+
+	/* right AW8736 */
+	speaker_amp_right: audio-amplifier-right {
+		compatible = "awinic,aw8738";
+
+		pinctrl-0 = <&spk_ext_pa_right_default>;
+		pinctrl-names = "default";
+
+		mode-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Speaker Amp R";
+		awinic,mode = <3>;
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&gpio_leds_default>;
+		pinctrl-names = "default";
+
+		led-0 {
+			gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+			label = "red";
+			default-state = "off";
+			retain-state-suspended;
+		};
+
+		led-1 {
+			gpios = <&tlmm 17 GPIO_ACTIVE_HIGH>;
+			label = "green";
+			default-state = "off";
+			retain-state-suspended;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb_id_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_i2c2 {
+	magnetometer@c {
+		compatible = "asahi-kasei,ak09911";
+		reg = <0x0c>;
+
+		vdd-supply = <&pm8916_l17>;
+		vid-supply = <&pm8916_l6>;
+	};
+
+	imu@68 {
+		compatible = "invensense,mpu6880";
+		reg = <0x68>;
+
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		pinctrl-0 = <&imu_default>;
+		pinctrl-names = "default";
+
+		mount-matrix = "1",  "0", "0",
+			       "0", "-1", "0",
+			       "0",  "0", "1";
+	};
+};
+
+&pm8916_codec {
+	qcom,micbias1-ext-cap;
+};
+
+&sound {
+	model = "wt86528";
+	widgets =
+		"Speaker", "Speaker",
+		"Headphone", "Headphones";
+	pin-switches = "Speaker", "Headphones";
+	audio-routing =
+		"Speaker", "Speaker Amp L OUT",
+		"Speaker", "Speaker Amp R OUT",
+		"Speaker Amp L IN", "HPH_L",
+		"Speaker Amp R IN", "HPH_R",
+		"Headphones", "Headphones Switch OUTL",
+		"Headphones", "Headphones Switch OUTR",
+		"Headphones Switch INL", "HPH_L",
+		"Headphones Switch INR", "HPH_R",
+		"AMIC1", "MIC BIAS External1",
+		"AMIC2", "MIC BIAS Internal2",
+		"AMIC3", "MIC BIAS External1";
+	aux-devs = <&speaker_amp_left>, <&speaker_amp_right>, <&headphones_switch>;
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
+};
+
+&tlmm {
+	gpio_leds_default: gpio-leds-default-state {
+		pins = "gpio16", "gpio17";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	imu_default: imu-default-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	spk_ext_pa_left_default: spk-ext-pa-left-default-state {
+		pins = "gpio119";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	spk_ext_pa_right_default: spk-ext-pa-right-default-state {
+		pins = "gpio121";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
new file mode 100644
index 000000000000..1a7c347dc3f0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8916-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+/ {
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+		mmc1 = &sdhc_2; /* SD card */
+		serial0 = &blsp_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	headphones_switch: audio-switch {
+		compatible = "simple-audio-amplifier";
+
+		pinctrl-0 = <&headphones_switch_default>;
+		pinctrl-names = "default";
+
+		enable-gpios = <&tlmm 120 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Headphones Switch";
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8916_pwm 0 100000>;
+
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <255>;
+	};
+
+	battery: battery {
+		compatible = "simple-battery";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4350000>;
+		energy-full-design-microwatt-hours = <8740000>;
+		charge-full-design-microamp-hours = <2300000>;
+
+		ocv-capacity-celsius = <25>;
+		ocv-capacity-table-0 = <4328000 100>, <4266000 95>, <4208000 90>,
+			<4154000 85>, <4102000 80>, <4062000 75>, <3992000 70>,
+			<3960000 65>, <3914000 60>, <3870000 55>, <3840000 50>,
+			<3818000 45>, <3800000 40>, <3784000 35>, <3770000 30>,
+			<3756000 25>, <3736000 20>, <3714000 16>, <3696000 13>,
+			<3690000 11>, <3689000 10>, <3688000 9>, <3686000 8>,
+			<3682000 7>, <3670000 6>, <3639000 5>, <3592000 4>,
+			<3530000 3>, <3448000 2>, <3320000 1>, <3000000 0>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		label = "GPIO Buttons";
+
+		volume-up-button {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+
+		vcc-supply = <&pm8916_l17>;
+		iovcc-supply = <&pm8916_l6>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&blsp_uart2 {
+	status = "okay";
+};
+
+&mpss_mem {
+	reg = <0x0 0x86800000 0x0 0x5500000>;
+};
+
+&pm8916_bms {
+	monitored-battery = <&battery>;
+	status = "okay";
+};
+
+&pm8916_codec {
+	qcom,micbias-lvl = <2800>;
+	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;
+	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
+	qcom,hphl-jack-type-normally-open;
+};
+
+&pm8916_pwm {
+	pinctrl-0 = <&pwm_out>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pm8916_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&pm8916_rpm_regulators {
+	pm8916_l17: l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&sdhc_1 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default>;
+	pinctrl-1 = <&sdc2_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	non-removable;
+
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+};
+
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
+&wcnss {
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	headphones_switch_default: headphones-switch-default-state {
+		pins = "gpio120";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_default: touchscreen-default-state {
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
+
+&pm8916_mpps {
+	pwm_out: mpp4-state {
+		pins = "mpp4";
+		function = "digital";
+		power-source = <PM8916_MPP_VPH>;
+		output-low;
+		qcom,dtest = <1>;
+	};
+};

-- 
2.45.2


