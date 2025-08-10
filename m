Return-Path: <linux-arm-msm+bounces-68238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B46A3B1FB6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 19:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1BD1897B03
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 17:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9BE274B5A;
	Sun, 10 Aug 2025 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snhU5ATe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4F22727F0;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847492; cv=none; b=RLu9cbzFj4kBdcSw0JXI+4elr7lse/piYcVLxOJt0sKIPoBTCptb0SFwAaBCqqJiWq8hlAHxmVRJDN+EUVbr0N5AEWTxyvBEsNExaybtVeU6jhtiAe1wjPPsT0eqiRw63vflgfC0NdfjYIKCwNT2ey4iJgRImQZgah7/P9+FKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847492; c=relaxed/simple;
	bh=Xy0j+CwLfLYkjhsXyLKHUIuRNEYsPp5UcMSX+3Y1XHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o2isOB8Kz+wplFjlwOenXE6Zp+xyRQu/Hz0pFoiyE3AcTHjpQrny3xBHkEY0mHvHqAdgQd/Uk057nn3nmio98TsK/gwZ1a7pfVXID/RY/OS2zbXXtkWyVHsRzI+cGFbc2O53K1Ov8UbhBZB55/RMPYCnBo0+3q3/c8j21fDyQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snhU5ATe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9B1CC4CEFD;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754847491;
	bh=Xy0j+CwLfLYkjhsXyLKHUIuRNEYsPp5UcMSX+3Y1XHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=snhU5ATenvU2tszMgPieH7DLwC5d3/fNUwWrDJI0vj9vqAzkJ3ouPsf1oldLxqRRf
	 PnOd6Q6gtbhmfVtloHYo+sVg1gn5N1zwUiZ9SZ3hXjvm/zPGCU0eKLxTrOjp5sCvSh
	 s/GZAi9KVy22HT9giOecwANEt1CTfkQ8OLA4RUKEy7+yf4jgaWUIbUdlJtKCe76OZ+
	 dgSoWBpzvWt3IWurMpdh7dCOfxd3qdw9jjcBsPExEC8w/UzJfyuA4RczgFsslNI6Qi
	 GbaxixpRTy9zV8OGakingAtPfJlTgDdtWGyw1YBiJYijCFEZ/1VrjWyaQn9ffr6esF
	 R3hNt2+p4mpow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A032ECA0EC4;
	Sun, 10 Aug 2025 17:38:11 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 10 Aug 2025 19:37:44 +0200
Subject: [PATCH v10 3/3] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-tb16-dt-v10-3-0bfed6d75c69@oldschoolsolutions.biz>
References: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
In-Reply-To: <20250810-tb16-dt-v10-0-0bfed6d75c69@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754847490; l=36366;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=jw8LDF7qlrBk57GT80lA7sgj7VrG7AhPruzOq3hrImg=;
 b=RSElYLEgkzWubMLtNhbcf/3XffEz0U8urHJAtyVUAC6QHHyp3K/iYQ60YnwAc589c23z+gF6S
 HRWlMvss9H0CH4aYrW1J6qVgmfuV/3uBsAwJaGJtcdwB8fSQhOkOoNs
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Device tree for the Lenovo Thinkbook 16 G7 QOY

The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].

Supported features:

- USB type-c and type-a ports
- Keyboard
- Touchpad (all that are described in the dsdt)
- Touchscreen (described in the dsdt, no known SKUss)
- Display including PWM backlight control
- PCIe devices
- nvme
- SDHC card reader
- ath12k WCN7850 Wifi and Bluetooth
- ADSP and CDSP
- GPIO keys (Lid switch)
- Sound via internal speakers / DMIC / USB / headphone jack
- DP Altmode with 2 lanes (as all of these still do)
- Integrated fingerprint reader (FPC)
- Integrated UVC camera
- X1-45 GPU

Not supported yet:

- HDMI port.
- EC and some fn hotkeys.

Limited support yet:

- SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
but not UHS-I (SD104) and UHS-II.

This work was done without any schematics or non-public knowledge of the device.
So, it is based on the existing x1e device trees, dsdt analysis, using HWInfo
ARM64, and pure guesswork. It has been confirmed, however, that the device really
has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
@43).

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 ...ok-x14.dts => x1p42100-lenovo-thinkbook-16.dts} | 783 +++++++++++----------
 2 files changed, 423 insertions(+), 362 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..6b1d71daff5a778237c5e3706aaea8e29dafa001 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,3 +333,5 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
+x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
similarity index 77%
copy from arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
copy to arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index f9ce2a63767c151192b0618ee2154e8d97316c1b..cca5fcc9dc13f727bf31550392d5663b4665caaa 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) 2025, Jens Glathe
  */
 
 /dts-v1/;
@@ -12,12 +13,15 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
-#include "x1e80100.dtsi"
+#include "x1p42100.dtsi"
 #include "x1e80100-pmics.dtsi"
 
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
 / {
-	model = "HP Omnibook X 14";
-	compatible = "hp,omnibook-x14", "qcom,x1e80100";
+	model = "Lenovo ThinkBook 16 Gen 7 QOY";
+	compatible = "lenovo,thinkbook-16", "qcom,x1p42100";
 	chassis-type = "laptop";
 
 	aliases {
@@ -28,8 +32,8 @@ aliases {
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&wcd_default>;
+		pinctrl-names = "default";
 
 		qcom,micbias1-microvolt = <1800000>;
 		qcom,micbias2-microvolt = <1800000>;
@@ -53,17 +57,25 @@ wcd938x: audio-codec {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-
-		brightness-levels = <0 2048 4096 8192 16384 65535>;
-		num-interpolated-steps = <20>;
-		default-brightness-level = <80>;
+		pwms = <&pm8550_pwm 3 500000>;
 
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 		power-supply = <&vreg_edp_bl>;
+	};
 
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
+	/*
+	 * This is an odd one. The camera is physically behind the eusb9 repeater (confirmed) but
+	 * if it is placed below the usb_2_dwc3 node, it will be switched off after ~30 seconds.
+	 * The reason seems to be that the dwc3 driver does not probe for child nodes when in
+	 * host-only mode. But that's the default setting for the xhci controllers due to issues
+	 * when in OTG mode. https://lore.kernel.org/all/20241210111444.26240-1-johan+linaro@kernel.org/
+	 * The whole reason it is described in the dt (as an USB device) is its requirement for
+	 * that additional regulator, and to get power management to switch it off when suspended.
+	 * Defining it stand-alone does work.
+	 */
+	camera {
+		compatible = "usb5986,1198";
+
+		vdd-supply = <&vreg_cam_5p0>;
 	};
 
 	gpio-keys {
@@ -85,17 +97,17 @@ pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
 			     "qcom,pmic-glink";
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
 
-		/* Left-side port, closer to the screen */
+		/* Display-adjacent port */
 		connector@0 {
 			compatible = "usb-c-connector";
 			reg = <0>;
 			power-role = "dual";
-			data-role = "dual";
+			data-role = "host";
 
 			ports {
 				#address-cells = <1>;
@@ -113,26 +125,26 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss0_ss_out>;
+						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss0_con_sbu_out>;
+					pmic_glink_ss0_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss0_sbu_mux>;
 					};
 				};
 			};
 		};
 
-		/* Left-side port, farther from the screen */
+		/* User-adjacent port */
 		connector@1 {
 			compatible = "usb-c-connector";
 			reg = <1>;
 			power-role = "dual";
-			data-role = "dual";
+			data-role = "host";
 
 			ports {
 				#address-cells = <1>;
@@ -165,18 +177,9 @@ pmic_glink_ss1_sbu: endpoint {
 		};
 	};
 
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-
-	sound: sound {
+	sound {
 		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-HP-OMNIBOOK-X14";
+		model = "X1E80100-LENOVO-ThinkBook-16";
 		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA WSA_SPK2 OUT",
 				"IN1_HPHL", "HPHL_OUT",
@@ -195,14 +198,14 @@ sound: sound {
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
-			cpu {
-				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
-			};
-
 			codec {
 				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
 			};
 
+			cpu {
+				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
+			};
+
 			platform {
 				sound-dai = <&q6apm>;
 			};
@@ -211,14 +214,14 @@ platform {
 		wcd-capture-dai-link {
 			link-name = "WCD Capture";
 
-			cpu {
-				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
-			};
-
 			codec {
 				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
 			};
 
+			cpu {
+				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
+			};
+
 			platform {
 				sound-dai = <&q6apm>;
 			};
@@ -227,14 +230,14 @@ platform {
 		wsa-dai-link {
 			link-name = "WSA Playback";
 
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
 			codec {
 				sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&lpass_wsamacro 0>;
 			};
 
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
 			platform {
 				sound-dai = <&q6apm>;
 			};
@@ -243,20 +246,74 @@ platform {
 		va-dai-link {
 			link-name = "VA Capture";
 
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
 			codec {
 				sound-dai = <&lpass_vamacro 0>;
 			};
 
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
 			platform {
 				sound-dai = <&q6apm>;
 			};
 		};
 	};
 
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 168 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss1-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 179 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss1_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss1_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			};
+		};
+	};
+
+	vreg_cam_5p0: regulator-cam-5p0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_CAM_5P0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&cam_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -283,8 +340,8 @@ vreg_edp_bl: regulator-edp-bl {
 		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
 
 		regulator-boot-on;
 	};
@@ -299,8 +356,8 @@ vreg_misc_3p3: regulator-misc-3p3 {
 		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
-		pinctrl-names = "default";
 		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
 
 		regulator-boot-on;
 		regulator-always-on;
@@ -322,63 +379,24 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
-	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "VREG_RTMR0_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_3p3_reg_en>;
-		pinctrl-names = "default";
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
 
-		regulator-boot-on;
+		vin-supply = <&vreg_wcn_3p3>;
 	};
 
-	vreg_vph_pwr: regulator-vph-pwr {
+	vreg_wcn_1p9: regulator-wcn-1p9 {
 		compatible = "regulator-fixed";
 
-		regulator-name = "vreg_vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
 
-		regulator-always-on;
-		regulator-boot-on;
+		vin-supply = <&vreg_wcn_3p3>;
 	};
 
 	vreg_wcn_3p3: regulator-wcn-3p3 {
@@ -397,110 +415,73 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the CRD mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
+	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
 
-		vin-supply = <&vreg_wcn_3p3>;
+		regulator-always-on;
+		regulator-boot-on;
 	};
 
-	wcn6855-pmu {
-		compatible = "qcom,wcn6855-pmu";
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
 
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_1p8>;
 		vddaon-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_wcn_1p9>;
-		vddpcie1p3-supply = <&vreg_wcn_1p9>;
-		vddpcie1p9-supply = <&vreg_wcn_1p9>;
-		vddpmu-supply = <&vreg_wcn_0p95>;
-		vddpmumx-supply = <&vreg_wcn_0p95>;
-		vddpmucx-supply = <&vreg_wcn_0p95>;
-		vddrfa0p95-supply = <&vreg_wcn_0p95>;
-		vddrfa1p3-supply = <&vreg_wcn_1p9>;
-		vddrfa1p9-supply = <&vreg_wcn_1p9>;
+		vdddig-supply = <&vreg_wcn_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_1p9>;
+		vddrfa1p8-supply = <&vreg_wcn_1p9>;
 
 		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
 		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
 
-		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-0 = <&wcn_wlan_en>;
+		pinctrl-1 = <&wcn_bt_en>;
 		pinctrl-names = "default";
 
 		regulators {
-			vreg_pmu_rfa_cmn_0p8: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
 			};
 
-			vreg_pmu_aon_0p8: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p8";
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
 			};
 
 			vreg_pmu_wlcx_0p8: ldo2 {
 				regulator-name = "vreg_pmu_wlcx_0p8";
 			};
 
-			vreg_pmu_wlmx_0p8: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p8";
-			};
-
-			vreg_pmu_btcmx_0p8: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p8";
-			};
-
-			vreg_pmu_pcie_1p8: ldo5 {
-				regulator-name = "vreg_pmu_pcie_1p8";
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
 			};
 
-			vreg_pmu_pcie_0p9: ldo6 {
-				regulator-name = "vreg_pmu_pcie_0p9";
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
 			};
 
-			vreg_pmu_rfa_0p8: ldo7 {
+			vreg_pmu_rfa_0p8: ldo5 {
 				regulator-name = "vreg_pmu_rfa_0p8";
 			};
 
-			vreg_pmu_rfa_1p2: ldo8 {
+			vreg_pmu_rfa_1p2: ldo6 {
 				regulator-name = "vreg_pmu_rfa_1p2";
 			};
 
-			vreg_pmu_rfa_1p7: ldo9 {
-				regulator-name = "vreg_pmu_rfa_1p7";
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
 			};
-		};
-	};
-
-	usb-1-ss1-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
 
-		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss1_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
 
-		port {
-			usb_1_ss1_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
 			};
 		};
 	};
@@ -511,8 +492,8 @@ regulators-0 {
 		compatible = "qcom,pm8550-rpmh-regulators";
 		qcom,pmic-id = "b";
 
-		vdd-bob1-supply = <&vreg_vph_pwr>;
-		vdd-bob2-supply = <&vreg_vph_pwr>;
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
 		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
 		vdd-l2-l13-l14-supply = <&vreg_bob1>;
 		vdd-l5-l16-supply = <&vreg_bob1>;
@@ -546,7 +527,7 @@ vreg_l1b_1p8: ldo1 {
 		vreg_l2b_3p0: ldo2 {
 			regulator-name = "vreg_l2b_3p0";
 			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -610,7 +591,7 @@ vreg_l12b_1p2: ldo12 {
 		vreg_l13b_3p0: ldo13 {
 			regulator-name = "vreg_l13b_3p0";
 			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
+			regulator-max-microvolt = <3072000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -651,7 +632,7 @@ regulators-1 {
 		vdd-l1-supply = <&vreg_s5j_1p2>;
 		vdd-l2-supply = <&vreg_s1f_0p7>;
 		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s4-supply = <&vreg_vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
 
 		vreg_s4c_1p8: smps4 {
 			regulator-name = "vreg_s4c_1p8";
@@ -670,14 +651,14 @@ vreg_l1c_1p2: ldo1 {
 		vreg_l2c_0p8: ldo2 {
 			regulator-name = "vreg_l2c_0p8";
 			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3c_0p8: ldo3 {
 			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -689,19 +670,19 @@ regulators-2 {
 		vdd-l1-supply = <&vreg_s1f_0p7>;
 		vdd-l2-supply = <&vreg_s1f_0p7>;
 		vdd-l3-supply = <&vreg_s4c_1p8>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
+		vdd-s1-supply = <&vph_pwr>;
 
 		vreg_l1d_0p8: ldo1 {
 			regulator-name = "vreg_l1d_0p8";
 			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2d_0p9: ldo2 {
 			regulator-name = "vreg_l2d_0p9";
 			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <920000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -723,7 +704,7 @@ regulators-3 {
 		vreg_l2e_0p8: ldo2 {
 			regulator-name = "vreg_l2e_0p8";
 			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -742,7 +723,7 @@ regulators-4 {
 		vdd-l1-supply = <&vreg_s5j_1p2>;
 		vdd-l2-supply = <&vreg_s5j_1p2>;
 		vdd-l3-supply = <&vreg_s5j_1p2>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
+		vdd-s1-supply = <&vph_pwr>;
 
 		vreg_s1f_0p7: smps1 {
 			regulator-name = "vreg_s1f_0p7";
@@ -780,28 +761,15 @@ regulators-6 {
 		vdd-l1-supply = <&vreg_s4c_1p8>;
 		vdd-l2-supply = <&vreg_s5j_1p2>;
 		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s1-supply = <&vreg_vph_pwr>;
-		vdd-s2-supply = <&vreg_vph_pwr>;
-
-		vreg_s1i_0p9: smps1 {
-			regulator-name = "vreg_s1i_0p9";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2i_1p0: smps2 {
-			regulator-name = "vreg_s2i_1p0";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
 
 		vreg_l1i_1p8: ldo1 {
 			regulator-name = "vreg_l1i_1p8";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l2i_1p2: ldo2 {
@@ -814,9 +782,23 @@ vreg_l2i_1p2: ldo2 {
 		vreg_l3i_0p8: ldo3 {
 			regulator-name = "vreg_l3i_0p8";
 			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <920000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
 	};
 
 	regulators-7 {
@@ -826,7 +808,7 @@ regulators-7 {
 		vdd-l1-supply = <&vreg_s1f_0p7>;
 		vdd-l2-supply = <&vreg_s5j_1p2>;
 		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s5-supply = <&vreg_vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
 
 		vreg_s5j_1p2: smps5 {
 			regulator-name = "vreg_s5j_1p2";
@@ -837,8 +819,8 @@ vreg_s5j_1p2: smps5 {
 
 		vreg_l1j_0p8: ldo1 {
 			regulator-name = "vreg_l1j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -852,7 +834,7 @@ vreg_l2j_1p2: ldo2 {
 		vreg_l3j_0p8: ldo3 {
 			regulator-name = "vreg_l3j_0p8";
 			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
+			regulator-max-microvolt = <880000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
@@ -860,111 +842,103 @@ vreg_l3j_0p8: ldo3 {
 
 &gpu {
 	status = "okay";
+};
 
-	zap-shader {
-		firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcdxkmsuc8380.mbn";
-	};
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/LENOVO/21NH/qcdxkmsucpurwa.mbn";
 };
 
-&i2c0 {
+&i2c2 {
 	clock-frequency = <400000>;
 
+	pinctrl-0 = <&qup_i2c2_data_clk>, <&tpad_default>, <&kybd_default>;
+	pinctrl-names = "default";
 	status = "okay";
 
-	keyboard@3a {
+	/* ELAN06FA */
+	touchpad@15 {
 		compatible = "hid-over-i2c";
-		reg = <0x3a>;
+		reg = <0x15>;
 
 		hid-descr-addr = <0x1>;
-		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l12b_1p2>;
 
-		pinctrl-0 = <&kybd_default>;
-		pinctrl-names = "default";
-
 		wakeup-source;
 	};
 
-	touchpad@15 {
+	/* CIRQ1080 or SYNA2BA6 */
+	touchpad@2c {
 		compatible = "hid-over-i2c";
-		reg = <0x15>;
+		reg = <0x2c>;
 
-		hid-descr-addr = <0x1>;
+		hid-descr-addr = <0x20>;
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
 		vdd-supply = <&vreg_misc_3p3>;
 		vddl-supply = <&vreg_l12b_1p2>;
 
-		pinctrl-0 = <&tpad_default>;
-		pinctrl-names = "default";
-
 		wakeup-source;
 	};
-};
-
-&i2c3 {
-	clock-frequency = <400000>;
 
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x08>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK3>;
+	/* FTCS0038 */
+	touchpad@38 {
+		compatible = "hid-over-i2c";
+		reg = <0x38>;
 
-		vdd-supply = <&vreg_rtmr0_1p15>;
-		vdd33-supply = <&vreg_rtmr0_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
-		vddar-supply = <&vreg_rtmr0_1p15>;
-		vddat-supply = <&vreg_rtmr0_1p15>;
-		vddio-supply = <&vreg_rtmr0_1p8>;
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
-		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
 
-		pinctrl-0 = <&rtmr0_default>;
-		pinctrl-names = "default";
+		wakeup-source;
+	};
 
-		orientation-switch;
-		retimer-switch;
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
 
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
 
-			port@0 {
-				reg = <0>;
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
 
-				retimer_ss0_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_ss_in>;
-				};
-			};
+		wakeup-source;
+	};
 
-			port@1 {
-				reg = <1>;
+	/* GXTP5100 */
+	touchpad@5d {
+		compatible = "hid-over-i2c";
+		reg = <0x5d>;
 
-				retimer_ss0_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-				};
-			};
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 
-			port@2 {
-				reg = <2>;
+		vdd-supply = <&vreg_misc_3p3>;
+		vddl-supply = <&vreg_l12b_1p2>;
 
-				retimer_ss0_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
-				};
-			};
-		};
+		wakeup-source;
 	};
 };
 
 &i2c5 {
 	clock-frequency = <400000>;
+
 	status = "okay";
 
+	eusb5_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+	};
+
 	eusb3_repeater: redriver@47 {
 		compatible = "nxp,ptn3222";
 		reg = <0x47>;
@@ -977,7 +951,34 @@ eusb3_repeater: redriver@47 {
 
 		pinctrl-0 = <&eusb3_reset_n>;
 		pinctrl-names = "default";
+	};
+
+	eusb9_repeater: redriver@4b {
+		compatible = "nxp,ptn3222";
+		reg = <0x4b>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
 
+		pinctrl-0 = <&eusb9_reset_n>;
+		pinctrl-names = "default";
+	};
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
 	};
 };
 
@@ -986,6 +987,7 @@ &i2c8 {
 
 	status = "okay";
 
+	/* ILIT2911 or GTCH1563 */
 	touchscreen@10 {
 		compatible = "hid-over-i2c";
 		reg = <0x10>;
@@ -1049,10 +1051,15 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
-			power-supply = <&vreg_edp_3p3>;
 
 			backlight = <&backlight>;
 
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			power-supply = <&vreg_edp_3p3>;
+
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
@@ -1098,15 +1105,15 @@ wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
 
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
 	};
 };
 
@@ -1129,24 +1136,8 @@ &pcie6a_phy {
 	status = "okay";
 };
 
-&pm8550_gpios {
-	rtmr0_default: rtmr0-reset-n-active-state {
-		pins = "gpio10";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-
-	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
-		pins = "gpio11";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
+&pm8550_pwm {
+	status = "okay";
 };
 
 &pm8550ve_8_gpios {
@@ -1154,25 +1145,14 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 		pins = "gpio6";
 		function = "normal";
 		bias-disable;
-		drive-push-pull;
 		input-disable;
 		output-enable;
+		drive-push-pull;
 		power-source = <1>; /* 1.8 V */
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
 	};
 };
 
-&pm8550ve_9_gpios {
-	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
@@ -1186,29 +1166,6 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		pins = "gpio10";
 		function = "normal";
 	};
-
-};
-
-&pmc8380_5_gpios {
-	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
 };
 
 &qupv3_0 {
@@ -1224,19 +1181,29 @@ &qupv3_2 {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qcadsp8380.mbn",
-			"qcom/x1e80100/hp/omnibook-x14/adsp_dtbs.elf";
+	firmware-name = "qcom/x1p42100/LENOVO/21NH/qcadsp8380.mbn",
+			"qcom/x1p42100/LENOVO/21NH/adsp_dtbs.elf";
 
 	status = "okay";
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/hp/omnibook-x14/qccdsp8380.mbn",
-			"qcom/x1e80100/hp/omnibook-x14/cdsp_dtbs.elf";
+	firmware-name = "qcom/x1p42100/LENOVO/21NH/qccdsp8380.mbn",
+			"qcom/x1p42100/LENOVO/21NH/cdsp_dtbs.elf";
 
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1256,11 +1223,11 @@ &smb2360_1_eusb2_repeater {
 };
 
 &swr0 {
+	status = "okay";
+
 	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
 	pinctrl-names = "default";
 
-	status = "okay";
-
 	/* WSA8845, Left Speaker */
 	left_spkr: speaker@0,0 {
 		compatible = "sdw20217020400";
@@ -1310,12 +1277,10 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>, /* SPI (TPM) */
-			       <72 2>, /* Secure EC I2C connection (?) */
-			       <238 1>; /* UFS Reset */
+			       <72 2>; /* Secure EC I2C connection (?) */
 
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
+	cam_reg_en: cam-reg-en-state {
+		pins = "gpio44";
 		function = "gpio";
 		drive-strength = <16>;
 		bias-disable;
@@ -1329,6 +1294,29 @@ eusb3_reset_n: eusb3-reset-n-state {
 		output-low;
 	};
 
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	eusb9_reset_n: eusb9-reset-n-state {
+		pins = "gpio7";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	hall_int_n_default: hall-int-n-state {
 		pins = "gpio92";
 		function = "gpio";
@@ -1338,7 +1326,7 @@ hall_int_n_default: hall-int-n-state {
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
-		bias-pull-up;
+		bias-disable;
 	};
 
 	nvme_reg_en: nvme-reg-en-state {
@@ -1394,6 +1382,13 @@ wake-n-pins {
 		};
 	};
 
+	sdc2_card_det_n: sdc2-card-det-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -1404,7 +1399,7 @@ ts0_default: ts0-default-state {
 		int-n-pins {
 			pins = "gpio51";
 			function = "gpio";
-			bias-pull-up;
+			bias-disable;
 		};
 
 		reset-n-pins {
@@ -1415,26 +1410,35 @@ reset-n-pins {
 		};
 	};
 
-	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
-		mode-pins {
-			pins = "gpio177";
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		oe-n-pins {
+			pins = "gpio167";
 			function = "gpio";
-			bias-disable;
+			bias-pull-up;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-pull-up;
 			drive-strength = <2>;
-			output-high;
 		};
 
+	};
+
+	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
 		oe-n-pins {
-			pins = "gpio179";
+			pins = "gpio178";
 			function = "gpio";
-			bias-disable;
+			bias-pull-up;
 			drive-strength = <2>;
 		};
 
 		sel-pins {
-			pins = "gpio178";
+			pins = "gpio179";
 			function = "gpio";
-			bias-disable;
+			bias-pull-up;
 			drive-strength = <2>;
 		};
 	};
@@ -1447,17 +1451,25 @@ wcd_default: wcd-reset-n-active-state {
 		output-low;
 	};
 
+	wcn_bt_en: wcn-bt-en-state {
+		pins = "gpio116";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-down;
+	};
+
 	wcn_sw_en: wcn-sw-en-state {
 		pins = "gpio214";
 		function = "gpio";
-		drive-strength = <2>;
+		drive-strength = <16>;
 		bias-disable;
 	};
 
-	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
-		pins = "gpio116", "gpio117";
+	wcn_wlan_en: wcn-wlan-en-state {
+		pins = "gpio117";
 		function = "gpio";
-		drive-strength = <2>;
+		drive-strength = <16>;
 		bias-disable;
 	};
 };
@@ -1466,17 +1478,16 @@ &uart14 {
 	status = "okay";
 
 	bluetooth {
-		compatible = "qcom,wcn6855-bt";
+		compatible = "qcom,wcn7850-bt";
 		max-speed = <3200000>;
 
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
 		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
-		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
 	};
 };
 
@@ -1509,7 +1520,7 @@ &usb_1_ss0_dwc3_hs {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&retimer_ss0_ss_in>;
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
 };
 
 &usb_1_ss1_hsphy {
@@ -1522,7 +1533,7 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-phy-supply = <&vreg_l2j_1p2>;
 	vdda-pll-supply = <&vreg_l2d_0p9>;
 
 	status = "okay";
@@ -1544,20 +1555,52 @@ &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
 
-&usb_mp {
+&usb_1_ss2 {
+	status = "okay";
+};
+
+&usb_1_ss2_dwc3 {
+	dr_mode = "host";
+	maximum-speed = "high-speed";
+	phys = <&usb_1_ss2_hsphy>;
+	phy-names = "usb2-phy";
+};
+
+&usb_1_ss2_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&eusb5_repeater>;
+
 	status = "okay";
 };
 
-&usb_mp_dwc3 {
-	phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>;
-	phy-names = "usb2-0", "usb3-0";
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb9_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp {
+	status = "okay";
 };
 
 &usb_mp_hsphy0 {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
-	phys = <&eusb3_repeater>;
+	phys = <&eusb6_repeater>;
 
 	status = "okay";
 };
@@ -1568,3 +1611,19 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb3_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};

-- 
2.48.1



