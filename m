Return-Path: <linux-arm-msm+bounces-101388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD9vFDGBzWlveQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5338035F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 22:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8FB5330716EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 20:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6CD364EA2;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIjzKQYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60A36309B;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775075534; cv=none; b=QRvmVOiOafdomp4HDzKZBJg/PrfO2a9/1nenJaQHF4vxqDeZ9yPr9h1lONehN2g8CwBq9Sq6pFFFGCo8+jvmaFQO7zf68518su74vnh7TOzuDhpVSdiOFjvG3NNXfyf8KKdfJzxOSlZK/x6k2MEdCKTdhAyROPe8mM2esQ8c7G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775075534; c=relaxed/simple;
	bh=v0uZOaJ54lAg5lMftorfBK/jklJNEhA7r9GlBZCAK/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwMiJc6/oM8oMzZg9wwpuMZiHtkMys42ocii92wjgHZkKQenf7/HhzsxBGzJfVkUYyz0VdOS9aEkS0Q8eHPYKEDWe+a/bpU1ozN0Tws+82MgSJ4DAbdF9b7dM6bSViNoirNuaMjITNtdyw3ozjWbh5aPsVgFXGi7ZkAjInmqPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIjzKQYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 635A9C2BCAF;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775075534;
	bh=v0uZOaJ54lAg5lMftorfBK/jklJNEhA7r9GlBZCAK/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YIjzKQYAjui92npHHduZZMQlEbVrsoFuTN0zJIhKHKQe1QRxxPVGywwB/g4Qop/vP
	 Zwsf/4EWJ9bVjTgFWsdkACRtvOIrxLtemTtdBvoBAUCoalxFLMRW6MgMWoH1rKT7C3
	 XB0+hGAqFRAbk5y9BwJm61f7+07y1oX+qC/nV59MI4DyR9fGSm/edH4s5uukAItZc2
	 NYVy5+ZvhLrD5m4zHcNc5XQ+ng3l00phYFWzrw5GrluRzyYQeSnHzqzGcliVARFTWK
	 yBbpoRh04ZGaZrgEuchN2iWyZqJz9MCqG7GfgfezGAlqpXxo6CUpG2gwYe6Jun08q0
	 3luoFyTMbBlIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5599FD35154;
	Wed,  1 Apr 2026 20:32:14 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Wed, 01 Apr 2026 13:32:13 -0700
Subject: [PATCH v3 1/4] ARM: dts: qcom: msm8960: expressatt: Sort node
 references and includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-expressatt_fuel_guage-v3-1-9674cfc0b5a2@gmail.com>
References: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
In-Reply-To: <20260401-expressatt_fuel_guage-v3-0-9674cfc0b5a2@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775075533; l=12047;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=5nbF8uv4w0udRlmJ01uecytHbgghHrqiWUob940/otI=;
 b=YhGPyy4bFANR9YiWCi7ajd6ylcGqhquHLt8h5MIpQT2uYEMBd9sQSPmEqCsde4b6jy8VGH9mw
 Oq+n13F9En1ASe7soO1zsvnnNRA5pooxbY5li9bZQJR2bkICmQ4S97r
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101388-lists,linux-arm-msm=lfdr.de,guptarud.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.20:email,0.0.0.39:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[guptarud@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,2b:email,2e:email,4a:email,0.0.0.18:email]
X-Rspamd-Queue-Id: EBE5338035F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rudraksha Gupta <guptarud@gmail.com>

Reorganize the DTS file for consistency with other msm8960 board files.

Assisted-by: Claude:claude-opus-4.6
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 408 +++++++++++----------
 1 file changed, 207 insertions(+), 201 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 35514fd53e3d..0e6959f7af6f 100644
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
@@ -54,58 +54,25 @@ key-volume-down {
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
-		status = "okay";
+		pinctrl-names = "default";
 		i2c-gpio,delay-us = <2>;
 
+		status = "okay";
+
 		touchkey@20 {
 			compatible = "coreriver,tc360-touchkey";
 			reg = <0x20>;
 
 			interrupts-extended = <&tlmm 52 IRQ_TYPE_EDGE_FALLING>;
-			pinctrl-names = "default";
 			pinctrl-0 = <&touchkey_irq_pin>;
+			pinctrl-names = "default";
 
 			vddio-supply = <&touchkey_enable>;
 			vdd-supply = <&pm8921_l29>;
@@ -114,6 +81,52 @@ touchkey@20 {
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
+
+	status = "okay";
+};
+
+&gsbi1_spi {
+	status = "okay";
 };
 
 &gsbi2 {
@@ -141,51 +154,16 @@ light-sensor@39 {
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
+
 	status = "okay";
 };
 
 &gsbi3_i2c {
 	status = "okay";
 
-	// Atmel mXT224S touchscreen
+	/* Atmel mXT224S touchscreen */
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
@@ -193,93 +171,69 @@ touchscreen@4a {
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
 
-	spi1_default: spi1-default-state {
-		mosi-pins {
-			pins = "gpio6";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
+	status = "okay";
+};
 
-		miso-pins {
-			pins = "gpio7";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
+&gsbi5_serial {
+	status = "okay";
+};
 
-		cs-pins {
-			pins = "gpio8";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-			output-low;
-		};
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C>;
 
-		clk-pins {
-			pins = "gpio9";
-			function = "gsbi1";
-			drive-strength = <12>;
-			bias-disable;
-		};
-	};
+	status = "okay";
+};
 
-	gpio_keys_pin_a: gpio-keys-active-state {
-		pins = "gpio40", "gpio50", "gpio81";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
+&gsbi7_i2c {
+	status = "okay";
 
-	touchscreen: touchscreen-int-state {
-		pins = "gpio11";
-		function = "gpio";
-		output-enable;
-		bias-disable;
-		drive-strength = <2>;
+	nfc@2b {
+		compatible = "nxp,pn544-i2c";
+		reg = <0x2b>;
+		interrupts-extended = <&tlmm 106 IRQ_TYPE_EDGE_RISING>;
+		enable-gpios = <&pm8921_gpio 21 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+
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
 
@@ -288,18 +242,27 @@ &pm8921 {
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
@@ -546,72 +509,115 @@ pm8921_ncp: ncp {
 	};
 };
 
-&usb_hs1_phy {
-	v3p3-supply = <&pm8921_l3>;
-	v1p8-supply = <&pm8921_l4>;
-};
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
 
-&usb1 {
-	dr_mode = "otg";
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
+
+	status = "okay";
 };

-- 
2.53.0



