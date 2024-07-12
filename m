Return-Path: <linux-arm-msm+bounces-26051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4D092FE28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 18:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDDC1C22C3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B3417920E;
	Fri, 12 Jul 2024 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="P5gvYvvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E40178CF5;
	Fri, 12 Jul 2024 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720800286; cv=none; b=o6xDGEZnDCoPG7aZtCG6t8RYiJe9gXhlHDKojyQMN/x3oVuaIvvYdiy1qWooSU3U2tf/oqaFwbmrnOqU2D+JLRX3BRwZ7FeEnQp5uQedx+4HiS7drD+mYQsuWAhBM6t8RUJYBIePlSjVzM69/3mCPCwcCtV2ccTx/UwjDB0NeJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720800286; c=relaxed/simple;
	bh=PiptZgXUtNGlKZY4LerEQvZmOZoOBWQ8JoqI867Zf+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ui9MYNvJTQ2XEmnEW7xJ31yidANMtursXHwX8xHp8SToLBgHHOhE8fTFitXYXDGHFy2h99mQO4rhJsCQ0MdLu6zxMdAr4DkO1GC3t+d0GSElIh+1vlLSXGYn47kCwNFN/EW4fvZ6rCEXj9yyKWa9nPlp/vQ3OAuBy2K1VtosNeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=P5gvYvvC; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id A3F524282A;
	Fri, 12 Jul 2024 21:04:36 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720800277; bh=PiptZgXUtNGlKZY4LerEQvZmOZoOBWQ8JoqI867Zf+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P5gvYvvCmeTMQ65jNOxnuzXkR6UuZfwFaDMDpqj5t5h/x/XJ8AkYH+/2cpLR6G3YP
	 oWKZ2hYfjlZWQbo69uMwcu+NHxh4RLj83xy1/+C9FVnwjQbLRvjgEqgIfgQAkkU54D
	 NP2kpsWajYjEqAh0WgAuJOTo27nhjdeiPfqihYZnYYTYcDTUanuheGjIsmtkc1VzDs
	 BLKV13PBtiuWF7rzqB9jRTsPZ1gtry6yhxjkcHILi8OEBV27rr1mKBVoWK+i7BM4IE
	 dVE55BBonqbLdHY/193oACaSne5a6hj4EWpWWJVeIIU2opfX7rL1yU8R2RGVIRClbz
	 xCjSK3bmA5Y7g==
From: Nikita Travkin <nikita@trvn.ru>
Date: Fri, 12 Jul 2024 21:04:08 +0500
Subject: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo
 Vibe K5 devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Nikita Travkin <nikita@trvn.ru>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=9801; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=SFPsZwb3MeVbqZSx7MbeH3tOUhr8mT9jh+mOOE4nO8s=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBmkVQQsTZmAeo6u8m0uhm+fQJv53rvo0k16EPlS
 fjyXdQiWsWJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpFUEAAKCRBDHOzuKBm/
 dbAkEACWotoGUBQwFDfB0Q1oM0N58CQGqZgNIDsH7I7Hs7+dFaw3eqMeDvZyK5vM44v3tEGpFTl
 aye7EVo/e2EJ1tJZurwKJRztC4HX93HsoZqPKvhr9m87GFcjrT5GEgu/lIiLLTfihvozNZUC5hk
 yKtT/y32Qyzu7HTBN2vtb80D+qcX7z6ILR9r1UYrG4fDJpr7FX/0Ipr2WdbHBayX2e9fPFso/Qy
 e04ynYBeCv94XHXRBcWkiIGbqzGDeEtWJhQwAF5esuOMQHHawrfw4f82va7zHuIUwUaICP92yyl
 Aq9Yd5Ge+lj+YsOyqUIJR1sDNcNv1ODAlfDCarbkCyoG7rUcaWdqloti14a+0r3ZiqKLM/oBq07
 hnEeEvdJBL/sTcM1v8TOSbQ+HFvHpBRQJ0SgeqCMa/yJpsv8LhPRYk1uzzGwS0bScGy69VtgJfU
 wCvApdri00fpe01DmvzHfe1XkaF7QakJuK2f6OXRrUd+I8xIIWQlbG5kOt/48uKPNsAyz4Hy5UB
 QUCh4AyD3C9jhANqH/yG9f/MdjKzWfvty0BO1JjqO5uHZoeLLRNvJAr7VDsU5lOgLVUaZiNnavB
 mMud43WsDSrigLoMyxuBymQf8CwK73QC3DZ1477HLaXpQEa5G9iLX/PSIhAH61axYgMKRnDmT59
 04xPbBBxEu/h3Dg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

From: Adam Słaboń <asaillen@protonmail.com>

This commit introduces multiple hardware variants of Lenovo Vibe K5.

- A6020a40 (msm8929-wingtech-wt82918hd)
- A6020a46/A6020l36 (msm8939-wingtech-wt82918)
- A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)

These devices are added with support for many features, notably:

- Basic features like USB, mmc/sd storage, wifi, buttons, leds;
- Accelerometer;
- Touchscreen;
- Sound and modem.

Note that "HD" variant of K5 is based on msm8929 which is a lower bin
of msm8939 SoC. A simple dtsi is added for this soc along with the new
devices.

Unfortunately, despite the heavy similarities, the combination of minor
differences between variants make them incompatible between each other.

Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
[Nikita: Minor cleanup, commit message]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
 6 files changed, 311 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fd4c7c41ddc4..48ec781fa1d8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
new file mode 100644
index 000000000000..f9a358e852f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-wingtech-wt82918.dtsi"
+#include "msm8929.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
+	compatible = "wingtech,wt82918hd", "qcom,msm8929";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <720>;
+	touchscreen-size-y = <1280>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
new file mode 100644
index 000000000000..c3d1d1ace2f6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+&opp_table {
+	/delete-node/ opp-550000000;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts
new file mode 100644
index 000000000000..ebc624db880e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-wingtech-wt82918.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (Wingtech WT82918)";
+	compatible = "wingtech,wt82918", "qcom,msm8939";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <1080>;
+	touchscreen-size-y = <1920>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
new file mode 100644
index 000000000000..ff45ba8e02b1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8939-pm8916.dtsi"
+#include "msm8916-modem-qdsp6.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8916_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	flash-led-controller {
+		compatible = "sgmicro,sgm3140";
+		enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
+		flash-gpios = <&tlmm 32 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&camera_front_flash_default>;
+		pinctrl-names = "default";
+
+		flash_led: led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+		};
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
+		button-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&gpio_leds_default>;
+		pinctrl-names = "default";
+
+		led-0 {
+			gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_CHARGING;
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			retain-state-suspended;
+		};
+
+		led-1 {
+			gpios = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
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
+	status = "okay";
+
+	accelerometer@68 {
+		compatible = "invensense,icm20608";
+		reg = <0x68>;
+
+		pinctrl-0 = <&accelerometer_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
+
+		vdd-supply = <&pm8916_l17>;
+		vddio-supply = <&pm8916_l6>;
+
+		mount-matrix = "-1", "0", "0",
+				"0", "1", "0",
+				"0", "0", "1";
+	};
+};
+
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen: touchscreen@38 {
+		/* actually FT5336 */
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&pm8916_l17>;
+		iovcc-supply = <&pm8916_l6>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
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
+	non-removable;
+	status = "okay";
+};
+
+&usb {
+	extcon = <&usb_id>, <&usb_id>;
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
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
+	accelerometer_default: accelerometer-default-state {
+		pins = "gpio115";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	camera_front_flash_default: camera-front-flash-default-state {
+		pins = "gpio31", "gpio32";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio107";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	gpio_leds_default: gpio-leds-default-state {
+		pins = "gpio36", "gpio69";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	touchscreen_default: touchscreen-default-state {
+		reset-pins {
+			pins = "gpio12";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		touchscreen-pins {
+			pins = "gpio13";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	usb_id_default: usb-id-default-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
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
diff --git a/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts
new file mode 100644
index 000000000000..87016b5c44fd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8939-wingtech-wt82918.dtsi"
+
+/ {
+	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
+	compatible = "wingtech,wt82918hdhw39", "qcom,msm8939";
+	chassis-type = "handset";
+};
+
+&touchscreen {
+	touchscreen-size-x = <720>;
+	touchscreen-size-y = <1280>;
+};

-- 
2.45.2


