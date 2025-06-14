Return-Path: <linux-arm-msm+bounces-61315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBCCAD9FCB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 22:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B514B1737E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 20:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEBF1FBCB5;
	Sat, 14 Jun 2025 20:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPVfI2T/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B79E1DF754;
	Sat, 14 Jun 2025 20:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749934647; cv=none; b=m90mxoep3lu3SbKb2DJ4HreLs02Ucjm7aA2U/eNec3Y62j7NlCs4IEehhQf/Dv094p+exhgHQxof9RDM8xVCTk9R/dnRSdXJ2/h0qQ9L1e2OSIHBna5fUVEIb25Ar+SYr0KGCWhFWKwMfwocD+T4StE3s262KjmCtuM1ycKmTuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749934647; c=relaxed/simple;
	bh=VbIo2CGTCepsnHGYUiHwZ/76nvxznjFPB6GeuD81zAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGMqBLI1ytkLosSG23vafkarrxfYfuOgqV++9AypEW8WjcB4Lfa1BAM1sRJihLOdU22TVChCtwM4fXqdHCpoLHEOhUc+zF4xY8tT8FiCSuBL9KEt//xg0a4MdjgCRnEG8ucxwawjcIdrsEiKz+cSv+3vEwYEiKa+0A0gkz6nz6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPVfI2T/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb47e0644dso564708866b.0;
        Sat, 14 Jun 2025 13:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749934643; x=1750539443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oivNxBW3EOWJ+c/txynbLba695L/6gLNreKYIWl07KY=;
        b=IPVfI2T/U6z2CkAlXzBbTZkbV9onAjR++E/OuPXn4hlJhBU1xF+Az9X5uyopmyLXli
         oV7UvUoUOd4hM67KBY+ndclpQq5j2zZLtIJo1ritFD5M8wHEFI6fDDKQmmMWw7liaksn
         bcWVWZt2rKmmcXScAksTL1LV3Tdt0zOijRPJ3vb04L1y6gnWtpsBUWtBrrRJqZ2ug+Y1
         /7/6sQ8ITrDJcpUdax+l8ZLpA/zAWZuLcWXhUOTPgVjl87gP6PV1i34M4wgAp3c5Ht+E
         5m7LiiztFNbmBgQXJHh8AEAMSB+0MI/9jxjhESHWskDVi8WSh07q1Xp4uIzq6nm1PX6u
         Pzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749934643; x=1750539443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oivNxBW3EOWJ+c/txynbLba695L/6gLNreKYIWl07KY=;
        b=LplPHEtXIC8OSfGzP9rKdUETKmgMCsKFc3I7oUW/6LYHvFoRPkUlIj7I1e+S33dWRs
         Dk3wLZGtUVsHZ2h3AUP8MhQ5uks5yB7nK0GOreteHaHamWBBS9kR/wtf88a+6YqsDOE3
         jvzHc3jUL1zcGPloxBL3ow0Hx+SULnzD4llcYlANUa2y3G+93X1J8FlG8Ldmbz79+Evp
         l9BXX0Q1jrL09N1ZXhXJnHL59Kjo5EIk97dd7rrm+G0IRad4BSKKMCo3u0tS3dnnlCCa
         geem5JfrJqOt2wJSCam3KUzpg79T06CA2ye8r5cOt7goieONJg/YQpAUxTUpa2l7Wmn9
         VGAg==
X-Forwarded-Encrypted: i=1; AJvYcCVwCqpWtpTOn5MkGJWVH8u4rtxSemM1A+IMltfxYiyYdhp7ASTW9hORpLj0HW/ANBwwT4M/c3+xSxrz@vger.kernel.org, AJvYcCWU7yj1FYvOSuo+UCai1SczDMHqNTAEDXUK6xxEzwlTOyX+ZjzAs5MkGLsKPvscOWq1IvELdYhSYqFW4Pfp@vger.kernel.org, AJvYcCWuTPCIbfJ3gzOmhrmUM5m7kiXE72QKfoSe3l+YP4DxbLkaTLh8Af4rd2hv8XYcdjDNkgKugEnP+7hNRfR6Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjNfIvahTzjh7zELHW5x2SXrRlvZtr4HwX+/Xk0ZC1NhOWSoD
	gY5s193NBWGR7J2KOY2jQ2ajyRAn32QAx7HKo5gTZFgS8As02P6q72U=
X-Gm-Gg: ASbGnctI+SjJShmirlB5rCAvXanHLRwvTTxrwFKvxWwMRE004X0RXD9ASQ9YXC3pfSX
	ENtPgdEcWzBG70DBnbImQNWAqCvBS3BYyk/vx51aMT5PslYo1XsOWg2AlxdakdKHt5KrrZwHBUJ
	9fAZVupiP/CkYP2ukcLxYds3yeB7z7BvDbSZBfFbzv5F2YNRP9XZb6IXuvwBLqmGMG/Hgc+RW0y
	QL9vuxbsWz1rLKtRkCfHzMi/powxFCog3FPdrrj3W9OVqrGDj7qaLT7A/6jQwdvIkI9ZirhK9tz
	tYCQHP2kU2WtwmEX1g2lIe7UmSCq6rNiucKqgwMMWGONtJ5F14b0gguDraez0krsPD2W
X-Google-Smtp-Source: AGHT+IFDYvemakJbDtPFSX+V/3ShsviqrlPdEGbZmd+FJ6wAOyxuQDrb2qeqBlFRsjUaShIc3B3OtQ==
X-Received: by 2002:a17:907:7e84:b0:ad5:a122:c020 with SMTP id a640c23a62f3a-adf4efe0f63mr554723166b.16.1749934642010;
        Sat, 14 Jun 2025 13:57:22 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec89299c2sm361444466b.119.2025.06.14.13.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 13:57:21 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dmitry.baryshkov@oss.qualcomm.com,
	maud_spierings@hotmail.com
Subject: [PATCH v7 4/4] arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
Date: Sat, 14 Jun 2025 22:53:49 +0200
Message-ID: <20250614205718.93166-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250614205718.93166-1-alex.vinarskis@gmail.com>
References: <20250614205718.93166-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial support for Asus Zenbook A14. Particular moddel exists
in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).

Mostly similar to other X1-based laptops. Notable differences are:
* Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
  and Qualcomm FastConnect 7800 on UX3407RA
* USB Type-C retimers are Parade PS8833, appear to behave identical
  to Parade PS8830
* gpio90 is TZ protected

Working:
* Keyboard
* Touchpad
* NVME
* Lid switch
* Camera LED
* eDP (FHD OLED, SDC420D) with brightness control
* Bluetooth, WiFi (WCN6855)
* USB Type-A port
* USB Type-C ports in USB2/USB3/DP (both orientations)
* aDSP/cDPS firmware loading, battery info
* Sleep/suspend, nothing visibly broken on resume

Out of scope of this series:
* Audio (Speakers/microphones/headphone jack)
* Camera (OmniVision OV02C10)
* HDMI (Parade PS185HDM)
* EC

Add dtsi and create two configurations for UX3407QA, UX3407RA.
Tested on UX3407QA with X1-26-100.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1302 +++++++++++++++++
 .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   37 +
 .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  141 ++
 4 files changed, 1484 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 669b888b27a1..06aca925e528 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -309,6 +309,8 @@ x1e78100-lenovo-thinkpad-t14s-oled-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s-ole
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb x1e78100-lenovo-thinkpad-t14s-oled-el2.dtb
 x1e80100-asus-vivobook-s15-el2-dtbs	:= x1e80100-asus-vivobook-s15.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb x1e80100-asus-vivobook-s15-el2.dtb
+x1e80100-asus-zenbook-a14-el2-dtbs	:= x1e80100-asus-zenbook-a14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-zenbook-a14.dtb x1e80100-asus-zenbook-a14-el2.dtb
 x1e80100-crd-el2-dtbs	:= x1e80100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb x1e80100-crd-el2.dtb
 x1e80100-dell-xps13-9345-el2-dtbs	:= x1e80100-dell-xps13-9345.dtb x1-el2.dtbo
@@ -325,5 +327,7 @@ x1e80100-microsoft-romulus15-el2-dtbs	:= x1e80100-microsoft-romulus15.dtb x1-el2
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus15.dtb x1e80100-microsoft-romulus15-el2.dtb
 x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
+x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
new file mode 100644
index 000000000000..c8d6d66d05c8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -0,0 +1,1302 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "x1e80100-pmics.dtsi"
+
+/ {
+	model = "ASUS Zenbook A14";
+	chassis-type = "laptop";
+
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam_indicator_en>;
+		pinctrl-names = "default";
+
+		led-camera-indicator {
+			label = "white:camera-indicator";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			/* Reuse as a panic indicator until we get a "camera on" trigger */
+			panic-indicator;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,x1e80100-pmic-glink",
+			     "qcom,sm8550-pmic-glink",
+			     "qcom,pmic-glink";
+		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
+				    <&tlmm 123 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left-side display-adjacent port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss0_ss_in: endpoint {
+						remote-endpoint = <&retimer_ss0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
+					};
+				};
+			};
+		};
+
+		/* Left-side user-adjacent port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_ss1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss1_ss_in: endpoint {
+						remote-endpoint = <&retimer_ss1_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss1_con_sbu_out>;
+					};
+				};
+			};
+		};
+	};
+
+	reserved-memory {
+		linux,cma {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_misc_3p3: regulator-misc-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_MISC_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550ve_8_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&misc_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb0_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_1p9: regulator-wcn-1p9 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_1P9";
+		regulator-min-microvolt = <1900000>;
+		regulator-max-microvolt = <1900000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vdd-bob1-supply = <&vreg_vph_pwr>;
+		vdd-bob2-supply = <&vreg_vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
+		vdd-l2-l13-l14-supply = <&vreg_bob1>;
+		vdd-l5-l16-supply = <&vreg_bob1>;
+		vdd-l6-l7-supply = <&vreg_bob2>;
+		vdd-l8-l9-supply = <&vreg_bob1>;
+		vdd-l12-supply = <&vreg_s5j_1p2>;
+		vdd-l15-supply = <&vreg_s4c_1p8>;
+		vdd-l17-supply = <&vreg_bob2>;
+
+		vreg_bob1: bob1 {
+			regulator-name = "vreg_bob1";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob2: bob2 {
+			regulator-name = "vreg_bob2";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_3p0: ldo2 {
+			regulator-name = "vreg_l2b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4b_1p8: ldo4 {
+			regulator-name = "vreg_l4b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6b_1p8: ldo6 {
+			regulator-name = "vreg_l6b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_3p0: ldo8 {
+			regulator-name = "vreg_l8b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_2p9: ldo9 {
+			regulator-name = "vreg_l9b_2p9";
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_1p2: ldo12 {
+			regulator-name = "vreg_l12b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l13b_3p0: ldo13 {
+			regulator-name = "vreg_l13b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14b_3p0: ldo14 {
+			regulator-name = "vreg_l14b_3p0";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_1p8: ldo15 {
+			regulator-name = "vreg_l15b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l17b_2p5: ldo17 {
+			regulator-name = "vreg_l17b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s4-supply = <&vreg_vph_pwr>;
+
+		vreg_s4c_1p8: smps4 {
+			regulator-name = "vreg_s4c_1p8";
+			regulator-min-microvolt = <1856000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p2: ldo1 {
+			regulator-name = "vreg_l1c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_0p8: ldo2 {
+			regulator-name = "vreg_l2c_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_0p9: ldo3 {
+			regulator-name = "vreg_l3c_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s4c_1p8>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+
+		vreg_l1d_0p8: ldo1 {
+			regulator-name = "vreg_l1d_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2d_0p9: ldo2 {
+			regulator-name = "vreg_l2d_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3d_1p8: ldo3 {
+			regulator-name = "vreg_l3d_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-l2-supply = <&vreg_s1f_0p7>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+
+		vreg_l2e_0p8: ldo2 {
+			regulator-name = "vreg_l2e_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e_1p2: ldo3 {
+			regulator-name = "vreg_l3e_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmc8380-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-l1-supply = <&vreg_s5j_1p2>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s5j_1p2>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+
+		vreg_s1f_0p7: smps1 {
+			regulator-name = "vreg_s1f_0p7";
+			regulator-min-microvolt = <700000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-6 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "i";
+
+		vdd-l1-supply = <&vreg_s4c_1p8>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s1-supply = <&vreg_vph_pwr>;
+		vdd-s2-supply = <&vreg_vph_pwr>;
+
+		vreg_s1i_0p9: smps1 {
+			regulator-name = "vreg_s1i_0p9";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2i_1p0: smps2 {
+			regulator-name = "vreg_s2i_1p0";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1i_1p8: ldo1 {
+			regulator-name = "vreg_l1i_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2i_1p2: ldo2 {
+			regulator-name = "vreg_l2i_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3i_0p8: ldo3 {
+			regulator-name = "vreg_l3i_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-7 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "j";
+
+		vdd-l1-supply = <&vreg_s1f_0p7>;
+		vdd-l2-supply = <&vreg_s5j_1p2>;
+		vdd-l3-supply = <&vreg_s1f_0p7>;
+		vdd-s5-supply = <&vreg_vph_pwr>;
+
+		vreg_s5j_1p2: smps5 {
+			regulator-name = "vreg_s5j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1j_0p9: ldo1 {
+			regulator-name = "vreg_l1j_0p9";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2j_1p2: ldo2 {
+			regulator-name = "vreg_l2j_1p2";
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3j_0p8: ldo3 {
+			regulator-name = "vreg_l3j_0p8";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* ELAN, 04F3:3315 */
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* Left-side display-adjacent port */
+	typec-mux@8 {
+		compatible = "parade,ps8833", "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* ASUSTeK, 0B05:4543 */
+	hdtl@17 {
+		compatible = "hid-over-i2c";
+		reg = <0x17>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&hdtl_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
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
+	};
+
+	/* EC @0x5b */
+};
+
+&i2c7 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* Left-side user-adjacent port */
+	typec-mux@8 {
+		compatible = "parade,ps8833", "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+
+		vdd-supply = <&vreg_rtmr1_1p15>;
+		vdd33-supply = <&vreg_rtmr1_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
+		vddar-supply = <&vreg_rtmr1_1p15>;
+		vddat-supply = <&vreg_rtmr1_1p15>;
+		vddio-supply = <&vreg_rtmr1_1p8>;
+
+		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr1_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss1_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss1_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss1_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* ASUSTeK, 0B05:0220 */
+	keyboard@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	data-lanes = <0 1>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			mdss_dp3_out: endpoint {
+				data-lanes = <0 1 2 3>;
+				link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+				remote-endpoint = <&edp_panel_in>;
+			};
+		};
+	};
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pcie4 {
+	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie6a {
+	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie6a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6a_phy {
+	vdda-phy-supply = <&vreg_l1d_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_8_gpios {
+	misc_3p3_reg_en: misc-3p3-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+	};
+};
+
+&pm8550ve_9_gpios {
+	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pmc8380_5_gpios {
+	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>;
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&qupv3_0 {
+	status = "okay";
+};
+
+&qupv3_1 {
+	status = "okay";
+};
+
+&qupv3_2 {
+	status = "okay";
+};
+
+&smb2360_0 {
+	status = "okay";
+};
+
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1 {
+	status = "okay";
+};
+
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&spi10 {
+	status = "disabled";
+
+	/* Unknown device */
+};
+
+&tlmm {
+	gpio-reserved-ranges = <44 4>,  /* SPI11, TZ Protected */
+			       <90 1>;	/* Unknown, TZ Protected */
+
+	cam_indicator_en: cam-indicator-en-state {
+		pins = "gpio110";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	hdtl_default: hdtl-default-state {
+		pins = "gpio95";
+		function = "gpio";
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6a_default: pcie6a-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie6a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	rtmr1_default: rtmr1-reset-n-active-state {
+		pins = "gpio176";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
+		pins = "gpio188";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
+		pins = "gpio175";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
+		pins = "gpio186";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_bt_en: wcn-bt-en-state {
+		pins = "gpio116";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio214";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_en: wcn-wlan-en-state {
+		pins = "gpio117";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
+
+&usb_1_ss0_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_0_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss0_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l1j_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	status = "okay";
+};
+
+&usb_1_ss0_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss0_hs_in>;
+};
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&retimer_ss0_ss_in>;
+};
+
+&usb_1_ss1_hsphy {
+	vdd-supply = <&vreg_l3j_0p8>;
+	vdda12-supply = <&vreg_l2j_1p2>;
+
+	phys = <&smb2360_1_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_ss1_qmpphy {
+	vdda-phy-supply = <&vreg_l2j_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p9>;
+
+	status = "okay";
+};
+
+&usb_1_ss1 {
+	status = "okay";
+};
+
+&usb_1_ss1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_ss1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_ss1_hs_in>;
+};
+
+&usb_1_ss1_qmpphy_out {
+	remote-endpoint = <&retimer_ss1_ss_in>;
+};
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p9>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p9>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
new file mode 100644
index 000000000000..0d0bcc50207d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "x1e80100.dtsi"
+#include "x1-asus-zenbook-a14.dtsi"
+
+/ {
+	model = "ASUS Zenbook A14 (UX3407RA)";
+	compatible = "asus,zenbook-a14-ux3407ra", "qcom,x1e80100";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
+			"qcom/x1e80100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
+			"qcom/x1e80100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
new file mode 100644
index 000000000000..bd75ff898601
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "x1p42100.dtsi"
+#include "x1-asus-zenbook-a14.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "ASUS Zenbook A14 (UX3407QA)";
+	compatible = "asus,zenbook-a14-ux3407qa", "qcom,x1p42100";
+
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_wcn_1p9>;
+		vddpcie1p3-supply = <&vreg_wcn_1p9>;
+		vddpcie1p9-supply = <&vreg_wcn_1p9>;
+		vddpmu-supply = <&vreg_wcn_0p95>;
+		vddpmucx-supply = <&vreg_wcn_0p95>;
+		vddpmumx-supply = <&vreg_wcn_0p95>;
+		vddrfa0p95-supply = <&vreg_wcn_0p95>;
+		vddrfa1p3-supply = <&vreg_wcn_1p9>;
+		vddrfa1p9-supply = <&vreg_wcn_1p9>;
+
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsucpurwa.mbn";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+
+		qcom,calibration-variant = "UX3407Q";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+
+		max-speed = <3000000>;
+	};
+};
-- 
2.45.2


