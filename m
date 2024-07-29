Return-Path: <linux-arm-msm+bounces-27281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4666F93FB69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 18:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0AA5B223FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 16:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD78315ECF7;
	Mon, 29 Jul 2024 16:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="qvVy2gsH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9853138B;
	Mon, 29 Jul 2024 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722271165; cv=none; b=AMvxFZ545Noy5q2GTbkxqkRAhziKRdKSh+XyX65LrvmXSksaV8K3scQ9qIYpWAwckcr1RiUVApNMt5c+CNIBwrwU3sHAZcOtxeddEttkdLfW947Uy2uNb7ZJtn2a9aRqprDBg0xxQyIdVPbl8lrF6kPRh6/tIn9s2lYm6Gg98a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722271165; c=relaxed/simple;
	bh=JuE2mQc392l9/EMweDPe+CQQRyq28hwwpqW1RKR1jpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5pvGe7iR8/0XOF55e2TvjW8l9RwvO/W3JlUit5zrxy6I2gW4wwZrMUw2HStLxuW9MIm5m+1w9/Ikxif89q+uc26bMUH6FY8wCF2oMhptSut/57NZvVxAp3hQygCwOkcCvzXndWRYTeRGZ5Dp8LvMkbvipxujHVpQTCrhFgLuNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=qvVy2gsH; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 091B44053F;
	Mon, 29 Jul 2024 21:39:12 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1722271153; bh=JuE2mQc392l9/EMweDPe+CQQRyq28hwwpqW1RKR1jpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qvVy2gsHFTSuyqQzR+KdmprhTlHbjWKYJr15CZI0zzvOmLKmI0WlaKv3qvpEbrVmC
	 ibK1IZYRtWvicwtgpPuRaGsmyDdJaUg5mCdTxTxodnZe4UDNYQslZsGkWaO7Mw8uuQ
	 RiODAvPqwk5AyiQEqA54dHYgBTA/r9oOQLoK+JpEtHUDsjCAswA8/gOq9gTBVvzUAB
	 6EwCggRjy6OAWOdFUHS2IhkIdh+2xNwRDwp/Qx1hFMeGsYNa/hEkNf99sGb9NSLiY5
	 iQt/UL1VfGDH0B/GcNr6LaiOzL1flu1rP0EDfsSM5TQHx5HZqlIEQAw0I2r1Itw44z
	 xq4kgmvoz7Ang==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 29 Jul 2024 21:38:48 +0500
Subject: [PATCH v3 2/3] arm64: dts: qcom: msm8916-wingtech-wt865x8: Add
 Lenovo A6000/A6010
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-msm89xx-wingtech-init-v3-2-32c35476f098@trvn.ru>
References: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
In-Reply-To: <20240729-msm89xx-wingtech-init-v3-0-32c35476f098@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, Anton Bambura <jenneron@postmarketos.org>, 
 Stephan Gerhold <stephan@gerhold.net>
X-Developer-Signature: v=1; a=openpgp-sha256; l=12532; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=9u0XHCFk4Dz6Q6BqBDyv8E3opq9wxK/QnPUYnD/PS90=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmp8WuXRvJHSv9uIPv3feJKFdD1GYA2QgP/HEjv
 5kxaEnDKfyJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZqfFrgAKCRBDHOzuKBm/
 dUoYD/0QxLdF/e5ErT9igH69uAX5qovs6BvnMyTMtH3Pjne0ifmdvDS0FDKu311dpfB6U0RKsKI
 7HwI0sOXj+j3cLu6MbbjIP9BMYiSteeUdN/a7h3ahYlIwmef3bAdOW4O02o1PQssCn0G3n2vc0p
 2ln2iX0U4K7jnpPYC8rZKmtjdLRMz/lBv5oJXLUsq93wpGijkwdShjBNmthy/WUaemjJKDOr1ug
 ITdcX+u3xiOFLeSUcaXFMRojwatAahehFz3Wj51ELLXOBGGTXgeDoZU8oeBcr1YV6KeXSG/FBYW
 xqFXCzRoAwChxajw3rjnLLVszaJFJSqWdVf1MQhi/LCTuZipUpB0v6vSEKTXQfR+4Ex9O7Yy/lC
 UYecD6XQjwVEyAs1VIu01f7gygZjg8gvY8iCpJjX20Knvz0psT9fNdxQVN8NidphhhV645z8NHN
 1RzsYZ6Trq3zI3J6uZhs9S88hbq7j4s2dPw8XbwpE1TJPojJ3ky1DNV5sESHI9iHzjAxyINKUCq
 YcUBdZoloOvWxi7/J5IiUv3SjhqNN9LNDOzpeb6pq0je1bb7AUjCp31igyXPQSKcjSztn/IWdO6
 3hEamIrHxIk6Y+0yIQRjSlDJnvqkV7c5mXzSXBzlody0jAjysuP1swnAp/G2occq6XLqzrHnK+M
 QtNlxCPq5ih2ncA==
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
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  87 +++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 158 +++++++++++++++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 215 +++++++++++++++++++++
 4 files changed, 462 insertions(+)

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
index 000000000000..3cfa80e38a9e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
@@ -0,0 +1,87 @@
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
+		pinctrl-0 = <&spk_ext_pa_default>;
+		pinctrl-names = "default";
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
+	widgets = "Speaker", "Speaker",
+		  "Headphone", "Headphones";
+	pin-switches = "Speaker", "Headphones";
+	audio-routing =	"Speaker", "Speaker Amp OUT",
+			"Speaker Amp IN", "HPH_R",
+			"Headphones", "Headphones Switch OUTL",
+			"Headphones", "Headphones Switch OUTR",
+			"Headphones Switch INL", "HPH_L",
+			"Headphones Switch INR", "HPH_R",
+			"AMIC1", "MIC BIAS Internal1",
+			"AMIC2", "MIC BIAS Internal2";
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
index 000000000000..ec2c4dcd3ead
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dts
@@ -0,0 +1,158 @@
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
+	widgets = "Speaker", "Speaker",
+		  "Headphone", "Headphones";
+	pin-switches = "Speaker", "Headphones";
+	audio-routing = "Speaker", "Speaker Amp L OUT",
+			"Speaker", "Speaker Amp R OUT",
+			"Speaker Amp L IN", "HPH_L",
+			"Speaker Amp R IN", "HPH_R",
+			"Headphones", "Headphones Switch OUTL",
+			"Headphones", "Headphones Switch OUTR",
+			"Headphones Switch INL", "HPH_L",
+			"Headphones Switch INR", "HPH_R",
+			"AMIC1", "MIC BIAS External1",
+			"AMIC2", "MIC BIAS Internal2",
+			"AMIC3", "MIC BIAS External1";
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


