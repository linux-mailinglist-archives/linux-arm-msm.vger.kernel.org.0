Return-Path: <linux-arm-msm+bounces-101259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH/bHNbZzGnnWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:39:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD6376F47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 10:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 338493179CC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 08:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B423AF667;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfWnvE86"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1743AD538;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775032129; cv=none; b=Egh2FkWdnAPp7J6NXqEFd3/tMIzkC8CYozjOzU5zlhSjKYeGLZirBexUgvvFI8pR9vIXAoC8XARx+6ineL15XubsPlWc5sydDa4m/hgs0wYG23ELbDyrrbhqCL6zDP1D9uAJjupUwbYtDd3VeTZlBJGShFUiPD2vX2zhjJn1yS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775032129; c=relaxed/simple;
	bh=SiZxbBEOsyuCGsPP7EiYPMWvFe+geOEjDxFcviM+I78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NW4wPPsVpFhyVnSL8WZAdoXlJHeAB1L/vF3i6Jo6dQpdogtqDwbVbwhGr8jdmf3+3E3E8SH3mqd48ylDZd34wwHynFoZVkIHeKcFJ12r1P8kUAgfBmGeH0yns+CgEEVBDtVKTuHAAlN5mIVIpJvaBhtmMUUsEuBGspXD7jmoefQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfWnvE86; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A75AC2BCB4;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775032129;
	bh=SiZxbBEOsyuCGsPP7EiYPMWvFe+geOEjDxFcviM+I78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jfWnvE869T0Pr5tsrshi62jYO8oXW1sJ9nFE53g1v+n9GfwjKcEIEihUHpQNT+BT/
	 kToMdh/u8Ip5ztvsfGIIhJ2so8EmiXY5x5HYS+95VYHvEx+uq6D4VR5RC3VNPU+0GA
	 3ScSIXGDSwbM5Xh6yJB+Hk0EmLzigXsyUrFm19uM/7vuU9QdtDxgOGNk8oX4pBoQoX
	 dCB+CT4GA2WfB9QoXSWk42GE4rhLmVHtcNJoWuX5G5Gnz3Aws4EpJ7te7fr3GuD2Zh
	 hWu16iaW3RtDVoj/KpFoXtycy9x87ugc6H18SY/BhuCh68BveWkCQzhEfzcCUTdFjU
	 a/iiz13twhnTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D84DD35157;
	Wed,  1 Apr 2026 08:28:49 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 01:28:48 -0700
Subject: [PATCH v2 1/3] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v2-1-947922834df1@gmail.com>
References: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v2-0-947922834df1@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775032128; l=11794;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=Nw/R7tbD2R3cgIAnGsQB6z+2ikH8l/TaJNuRjCzGFB4=;
 b=zcgR3PVX0RMDhNPb0xo8rbaCliy1IzTzcrDmFDrQfIEaczlmBUEKx9TqGQmdwkwUFNYBCDGJ0
 a8RGQ1ssmTRBvyqie+Glt+tqJbSLin03YH7G+BVnlD+AdezX2dW6Gpo
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101259-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4a:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.20:email,2e:email,0.0.0.39:email,0.0.0.18:email]
X-Rspamd-Queue-Id: D4FD6376F47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Reorganize the DTS file for consistency with other msm8960 board files.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 400 ++++++++++-----------
 1 file changed, 200 insertions(+), 200 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 35514fd53e3d..ed913ca5b825 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,13 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
 #include "pm8921.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
-#include <dt-bindings/input/gpio-keys.h>
 
 / {
 	model = "Samsung Galaxy Express SGH-I437";
@@ -27,8 +27,8 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&gpio_keys_pin_a>;
+		pinctrl-names = "default";
 
 		key-home {
 			label = "Home";
@@ -54,48 +54,14 @@ key-volume-down {
 		};
 	};
 
-	touchkey_enable: touchkey-enable {
-		compatible = "regulator-fixed";
-		regulator-name = "touchkey_enable";
-		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		regulator-boot-on;
-	};
-
-	vreg_flash: regulator-flash {
-		compatible = "regulator-fixed";
-		regulator-name = "VREG_FLASH_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		pinctrl-0 = <&flash_led_unlock>;
-		pinctrl-names = "default";
-	};
-
-	led-controller {
-		compatible = "richtek,rt8515";
-		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
-		vin-supply = <&vreg_flash>;
-		richtek,rfs-ohms = <16000>;
-		pinctrl-0 = <&cam_flash_en>;
-		pinctrl-names = "default";
-
-		led {
-			function = LED_FUNCTION_FLASH;
-			color = <LED_COLOR_ID_WHITE>;
-			flash-max-timeout-us = <250000>;
-		};
-	};
-
 	i2c-gpio-touchkey {
 		compatible = "i2c-gpio";
 		#address-cells = <1>;
 		#size-cells = <0>;
 		sda-gpios = <&tlmm 71 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&tlmm 72 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&touchkey_i2c_pins>;
+		pinctrl-names = "default";
 		status = "okay";
 		i2c-gpio,delay-us = <2>;
 
@@ -104,8 +70,8 @@ touchkey@20 {
 			reg = <0x20>;
 
 			interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&touchkey_irq_pin>;
+			pinctrl-names = "default";
 
 			vddio-supply = <&touchkey_enable>;
 			vdd-supply = <&pm8921_l29>;
@@ -114,6 +80,51 @@ touchkey@20 {
 			linux,keycodes = <KEY_MENU KEY_BACK>;
 		};
 	};
+
+	led-controller {
+		compatible = "richtek,rt8515";
+		enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		vin-supply = <&vreg_flash>;
+		richtek,rfs-ohms = <16000>;
+		pinctrl-0 = <&cam_flash_en>;
+		pinctrl-names = "default";
+
+		led {
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
+			flash-max-timeout-us = <250000>;
+		};
+	};
+
+	vreg_flash: regulator-flash {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_FLASH_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&flash_led_unlock>;
+		pinctrl-names = "default";
+	};
+
+	touchkey_enable: touchkey-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "touchkey_enable";
+		gpio = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+};
+
+&gsbi1 {
+	qcom,mode = <GSBI_PROT_SPI>;
+	pinctrl-0 = <&spi1_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gsbi1_spi {
+	status = "okay";
 };
 
 &gsbi2 {
@@ -141,42 +152,6 @@ light-sensor@39 {
 	};
 };
 
-&gsbi5 {
-	qcom,mode = <GSBI_PROT_I2C_UART>;
-	status = "okay";
-};
-
-&gsbi5_serial {
-	status = "okay";
-};
-
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	status = "okay";
-};
-
-&sdcc3 {
-	vmmc-supply = <&pm8921_l6>;
-	vqmmc-supply = <&pm8921_l7>;
-
-	pinctrl-0 = <&sdcc3_default_state>;
-	pinctrl-1 = <&sdcc3_sleep_state>;
-	pinctrl-names = "default", "sleep";
-
-	status = "okay";
-};
-
-&gsbi1 {
-	qcom,mode = <GSBI_PROT_SPI>;
-	pinctrl-0 = <&spi1_default>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&gsbi1_spi {
-	status = "okay";
-};
-
 &gsbi3 {
 	qcom,mode = <GSBI_PROT_I2C>;
 	status = "okay";
@@ -193,93 +168,68 @@ touchscreen@4a {
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		vdda-supply = <&pm8921_lvs6>;
 		vdd-supply = <&pm8921_l17>;
-		pinctrl-names = "default";
 		pinctrl-0 = <&touchscreen>;
+		pinctrl-names = "default";
 	};
 };
 
-&tlmm {
-	cam_flash_en: cam-flash-en-state {
-		pins = "gpio3";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-pull-down;
-	};
+&gsbi5 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
 
-	spi1_default: spi1-default-state {
-		mosi-pins {
-			pins = "gpio6";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
+&gsbi5_serial {
+	status = "okay";
+};
 
-		miso-pins {
-			pins = "gpio7";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C>;
 
-		cs-pins {
-			pins = "gpio8";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-			output-low;
-		};
+	status = "okay";
+};
 
-		clk-pins {
-			pins = "gpio9";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
-	};
+&gsbi7_i2c {
+	status = "okay";
 
-	gpio_keys_pin_a: gpio-keys-active-state {
-		pins = "gpio40", "gpio50", "gpio81";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
+	nfc@2b {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x2b>;
+		interrupts-extended = <&tlmm 106 IRQ_TYPE_EDGE_RISING>;
+		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
 
-	touchscreen: touchscreen-int-state {
-		pins = "gpio11";
-		function = "gpio";
-		output-enable;
-		bias-disable;
-		drive-strength = <2>;
+		pinctrl-0 = <&nfc_default &nfc_enable>;
+		pinctrl-names = "default";
 	};
+};
 
-	nfc_default: nfc-default-state {
-		irq-pins {
-			pins = "gpio106";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+&gsbi12 {
+	qcom,mode = <GSBI_PROT_I2C>;
 
-		firmware-pins {
-			pins = "gpio92";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
+	status = "okay";
+};
 
-	touchkey_i2c_pins: touchkey-i2c-state {
-		pins = "gpio71", "gpio72";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
+&gsbi12_i2c {
+	status = "okay";
+
+	accelerometer@18 {
+		compatible = "bosch,bma254";
+		reg = <0x18>;
+		vdd-supply = <&pm8921_l9>;
+		vddio-supply = <&pm8921_lvs4>;
+
+		mount-matrix =  "-1", "0", "0",
+				"0",  "-1", "0",
+				"0",  "0", "1";
 	};
 
-	touchkey_irq_pin: touchkey-irq-state {
-		pins = "gpio52";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+		vdd-supply = <&pm8921_l9>;
+		iovdd-supply = <&pm8921_lvs4>;
+
+		/* TODO: Figure out Mount Matrix */
 	};
 };
 
@@ -288,18 +238,27 @@ &pm8921 {
 };
 
 &pm8921_gpio {
+	nfc_enable: nfc-enable-state {
+		pins = "gpio21";
+		function = "normal";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+		power-source = <PM8921_GPIO_S4>;
+	};
+
 	prox_sensor_int: prox-sensor-int-state {
 		pins = "gpio6";
 		function = "normal";
 		input-enable;
 		bias-disable;
 	};
+};
 
-	nfc_enable: nfc-enable-state {
-		pins = "gpio21";
-		function = "normal";
-		bias-disable;
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+&pm8921_mpps {
+	flash_led_unlock: flash-led-unlock-state {
+		pins = "mpp4";
+		function = "digital";
+		output-low;
 		power-source = <PM8921_GPIO_S4>;
 	};
 };
@@ -546,72 +505,113 @@ pm8921_ncp: ncp {
 	};
 };
 
-&usb_hs1_phy {
-	v3p3-supply = <&pm8921_l3>;
-	v1p8-supply = <&pm8921_l4>;
-};
-
-&usb1 {
-	dr_mode = "otg";
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
 	status = "okay";
 };
 
-&gsbi7 {
-	qcom,mode = <GSBI_PROT_I2C>;
+&sdcc3 {
+	vmmc-supply = <&pm8921_l6>;
+	vqmmc-supply = <&pm8921_l7>;
+
+	pinctrl-0 = <&sdcc3_default_state>;
+	pinctrl-1 = <&sdcc3_sleep_state>;
+	pinctrl-names = "default", "sleep";
 
 	status = "okay";
 };
 
-&gsbi7_i2c {
-	status = "okay";
+&tlmm {
+	cam_flash_en: cam-flash-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
 
-	nfc@2b {
-		compatible = "nxp,pn544-i2c";
-		reg = <0x2b>;
-		interrupts-extended = <&tlmm 106 IRQ_TYPE_EDGE_RISING>;
-		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
-		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+	spi1_default: spi1-default-state {
+		mosi-pins {
+			pins = "gpio6";
+			function = "gsbi1";
+			drive-strength = <12>;
+			bias-disable;
+		};
 
-		pinctrl-0 = <&nfc_default &nfc_enable>;
-		pinctrl-names = "default";
-	};
-};
+		miso-pins {
+			pins = "gpio7";
+			function = "gsbi1";
+			drive-strength = <12>;
+			bias-disable;
+		};
 
-&gsbi12 {
-	qcom,mode = <GSBI_PROT_I2C>;
+		cs-pins {
+			pins = "gpio8";
+			function = "gsbi1";
+			drive-strength = <12>;
+			bias-disable;
+			output-low;
+		};
 
-	status = "okay";
-};
+		clk-pins {
+			pins = "gpio9";
+			function = "gsbi1";
+			drive-strength = <12>;
+			bias-disable;
+		};
+	};
 
-&gsbi12_i2c {
-	status = "okay";
+	touchscreen: touchscreen-int-state {
+		pins = "gpio11";
+		function = "gpio";
+		output-enable;
+		bias-disable;
+		drive-strength = <2>;
+	};
 
-	accelerometer@18 {
-		compatible = "bosch,bma254";
-		reg = <0x18>;
-		vdd-supply = <&pm8921_l9>;
-		vddio-supply = <&pm8921_lvs4>;
+	gpio_keys_pin_a: gpio-keys-active-state {
+		pins = "gpio40", "gpio50", "gpio81";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 
-		mount-matrix =  "-1", "0", "0",
-				"0",  "-1", "0",
-				"0",  "0", "1";
+	touchkey_irq_pin: touchkey-irq-state {
+		pins = "gpio52";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	magnetometer@2e {
-		compatible = "yamaha,yas532";
-		reg = <0x2e>;
-		vdd-supply = <&pm8921_l9>;
-		iovdd-supply = <&pm8921_lvs4>;
+	touchkey_i2c_pins: touchkey-i2c-state {
+		pins = "gpio71", "gpio72";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 
-		/* TODO: Figure out Mount Matrix */
+	nfc_default: nfc-default-state {
+		firmware-pins {
+			pins = "gpio92";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		irq-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
 	};
 };
 
-&pm8921_mpps {
-	flash_led_unlock: flash-led-unlock-state {
-		pins = "mpp4";
-		function = "digital";
-		output-low;
-		power-source = <PM8921_GPIO_S4>;
-	};
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+&usb1 {
+	dr_mode = "otg";
+	status = "okay";
 };

-- 
2.53.0



