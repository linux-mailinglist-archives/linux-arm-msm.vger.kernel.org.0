Return-Path: <linux-arm-msm+bounces-77190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD51BD933A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:03:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562A7422672
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A66F3112B8;
	Tue, 14 Oct 2025 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4SHU9Xz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830833112B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 12:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443366; cv=none; b=Ay0JiW9bA+Vsd0pgGXbQpvHbs6aThLk8VwI6ztLPPeO9+XRp5s/9wLWnOgLkB7JFALeh10qJr6xAytsakp4vQzROwRhIKiKVLPJmIaS8VQaRvLJWrKGRMAWviPVMx87vZt6wZ2wnzvA7Hd0/SwcqKEtl/Df40MdvnU7ftK7AB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443366; c=relaxed/simple;
	bh=nwxFGhjne8niioCTlQUAmlqkYjbvQLqtVeG7lLZ5g7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fu6xd87Vef4+am7/z9b2TmRDYqbq9i2o0OEtvffPfNrAt41+MDnpYzdiquNB7UVOlgGqYOZaR19kra6HfouyO3HApi2lQR//KTGHAAlgxuNzBAnqafxObTj/o6CFSXbFwdeql4ZmDaChfMdIfKW42iY7cSXp8cXeQbSRv2tZv98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4SHU9Xz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5579235200so3349267a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443363; x=1761048163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikuugM7jNJHTOmMK4OgZ9YweQdNTosUeT9K/gZecsk0=;
        b=Y4SHU9XzmKedLqGXLmafqAPWLLzzy9AbqTJ7ihgWFswTeG/wtu/8sirOlZXcg079GJ
         rl6blDk2UWJW1yp/y4cYFR+yeo8009ma5YZBqs5P+lIqETNn6gocK8R1Tth4yZRLfqWV
         NYhFmAcGQrl6fNNKcVBj2lRBZeeh0aGCIMPXaDu/twcFgIAU1vDDLscMzZNZMsINeFml
         Q873kRS390RROB/QbIUK7nnQNSStCYtddQQB6ylhnNxaD+37KOC6fA08ZiCk9Yc6PdUL
         H0pYdL57SCTPMISQr7owThsxfMQCOzjTJSOEYNB3ulv+uViVwixWLCD/EjB1U3FGPVo+
         xGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443363; x=1761048163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikuugM7jNJHTOmMK4OgZ9YweQdNTosUeT9K/gZecsk0=;
        b=Ip+c8Rx7qq42lWi8mu6xIT5upEC9xdH5WCH6rlBNXPD7VVBSbv/qVy2+fdb0Jqy1n6
         cjKPKVqzOC26pifjoj89ar8wAVa/65HMRetPoy8ATok0WDy+L4E4imrm0sFSpr97LR8m
         HFlsyf19lfJI9chTqYYXuK+VSUhZ5in1h4lfgeBxa3C2vY0IfGSEbRnynai9quFqW4wd
         PCfd0z7mrj0ww4r391gMPCaptu/ZnHbTPJ4LFuCN1ZCvohRjdLdGi7FbS7ScDxjbLFXv
         4TF1xrMhDrYUVnYxfBPuqvyW8e7an8dT0PkehkQKARV9AZ3N3SeoQWaPqJpCp34C1ulN
         gjcA==
X-Forwarded-Encrypted: i=1; AJvYcCUquhv2P3KobSi78PbChipoOmUMY2rlUKaYBXbRk/0VrXgOPUMKDS7Wy124RLNcMRL4xIiKXutUUBTooX4/@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIwaaNfgtKH+IRXCIzZqcW1To1/mEl8pPxHUg4+1dC64RQAvJ
	TCkFx+pEKH4KSlW47d4M73QfH79j9m+VNlLYQ/Gikm/rQsi1nDVHYcVR
X-Gm-Gg: ASbGncvKi0tTR1oLaRRXPUCMXrHKH+nOeyMLeCQzT+4vzUEl9GQ5AkfYdIuVHP9MhqH
	QVUie+VJB/ry/emP1a+pIhzA0VdkMmY/Gsu4M8e+rl0V3Pu2SpFHzPiOViJmoElQGtCQUQMbjNQ
	yQBJSt77+v8Upc85DHu8DWyNEErtqYVTy0g5prIkZ0bmbrrBDbKo6erMo1en4Jp7mG6GNeP3n4G
	8quMg67JFbOF3FgsmHSx+QgOpLr2K6oGxbrYyhwGQaJlLMZYVMcSi2e+0G8QsGKMa8jjYkTCLEp
	m4U9J1XTV07FUuEkD+VumI01qfevxJyk1CgzfABrnyUxo1KvkvlLe+kZ1mkOKuVVOoR/0e0wAm5
	vbNBsWMjL7/xrVbeYQTX7IoJFakFskJSXyS8LSxZC/CrlLWrg5TB6SqMWp/KL/Ab/k+rKXpVtYd
	VE3Q==
X-Google-Smtp-Source: AGHT+IElUHOYsYatpFKKmjOympKJ2XjbGqIFV2uTN7nKDDiQpTa/+xJi3CbhMjO4Jn/Zzda5LhF9pw==
X-Received: by 2002:a17:902:da85:b0:249:f16:f086 with SMTP id d9443c01a7336-290272dededmr297889215ad.42.1760443362625;
        Tue, 14 Oct 2025 05:02:42 -0700 (PDT)
Received: from test-HP-Desktop-Pro-G3.. ([103.218.174.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f941a5sm162808455ad.127.2025.10.14.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:02:42 -0700 (PDT)
From: Sudarshan Shetty <tessolveupstream@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tessolveupstream@gmail.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: Add support for QCS615 talos evk board
Date: Tue, 14 Oct 2025 17:32:23 +0530
Message-Id: <20251014120223.1914790-3-tessolveupstream@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014120223.1914790-1-tessolveupstream@gmail.com>
References: <20251014120223.1914790-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the device tree support for the QCS615-based talos-evk
platform, which follows the SMARC (Smart Mobility ARChitecture)
standard. The platform is composed of two main hardware
components: the talos-evk-som and the talos-evk carrier board.

The talos-evk-som is a compact System on Module that integrates the
QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
SMARC standard, which defines a modular form factor allowing the SoM
to be paired with different carrier boards for varied applications.

The talos-evk is one such carrier board, designed for evaluation
and development purposes. It provides additional peripherals
such as UART, USB, and other interfaces to enable rapid
prototyping and hardware bring-up.

This initial device tree provides the basic configuration needed
to boot the platform to a UART shell. Further patches will extend
support for additional peripherals and subsystems.

The initial device tree includes basic support for:

- CPU and memory

- UART

- GPIOs

- Regulators

- PMIC

- Early console

- AT24MAC602 EEPROM

- MCP2515 SPI to CAN

QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
WiFi and UART for Bluetooth), which is different from the RIDE
platform. Plan to enable these in a follow-up patch series.

Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 435 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-evk.dts      |  42 ++
 3 files changed, 478 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b52f9e4e5f3..282d744acd73 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -305,6 +305,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
new file mode 100644
index 000000000000..55ec8034103d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -0,0 +1,435 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm6150.dtsi"
+#include "pm8150.dtsi"
+/ {
+	aliases {
+		mmc0 = &sdhc_1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	extcon_usb_1: extcon-usb-1 {
+		compatible = "linux,extcon-usb-gpio";
+		vbus-gpio = <&pm8150_gpios 6 GPIO_ACTIVE_HIGH>;
+		id-gpio = <&pm8150_gpios 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_vbus_det_default &usb1_id_det_default>;
+		pinctrl-names = "default";
+	};
+
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	vreg_v3p3_can: regulator-v3p3-can {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v3p3-can";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vreg_v5p0_can: regulator-v5p0-can {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg-v5p0-can";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s3a: smps3 {
+			regulator-name = "vreg_s3a";
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4a: smps4 {
+			regulator-name = "vreg_s4a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1829000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a: smps5 {
+			regulator-name = "vreg_s5a";
+			regulator-min-microvolt = <1896000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a: smps6 {
+			regulator-name = "vreg_s6a";
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1404000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a: ldo1 {
+			regulator-name = "vreg_l1a";
+			regulator-min-microvolt = <488000>;
+			regulator-max-microvolt = <852000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-name = "vreg_l2a";
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-name = "vreg_l3a";
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1248000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-name = "vreg_l5a";
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <975000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-name = "vreg_l7a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-name = "vreg_l8a";
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a: ldo10 {
+			regulator-name = "vreg_l10a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-name = "vreg_l11a";
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-name = "vreg_l12a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1890000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-name = "vreg_l13a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3230000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-name = "vreg_l15a";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-name = "vreg_l16a";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a: ldo17 {
+			regulator-name = "vreg_l17a";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c5 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	eeprom@5f {
+		compatible = "atmel,24mac602";
+		reg = <0x5f>;
+		pagesize = <16>;
+	};
+};
+
+&pcie {
+	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&pm8150_gpios {
+	usb2_en: usb2-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+
+	usb1_vbus_det_default: usb1-vbus-det-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+
+	usb1_id_det_default: usb1-id-det-default-state {
+		pins = "gpio7";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs615/adsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs615/cdsp.mbn";
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l17a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	mcp2515@0 {
+		compatible = "microchip,mcp2515";
+		reg = <0>;
+		clock-frequency = <20000000>;
+		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency = <10000000>;
+		vdd-supply = <&vreg_v3p3_can>;
+		xceiver-supply = <&vreg_v5p0_can>;
+	};
+};
+
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		clkreq-pins {
+			pins = "gpio90";
+			function = "pcie_clk_req";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio101";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wake-pins {
+			pins = "gpio100";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+/*
+ * USB1 port supports both host and device modes.
+ * By default, it operates in device mode.
+ * To enable host mode, set switch SW1 to 'ON' position on the SoM.
+ */
+
+&usb_1_dwc3 {
+	dr_mode = "otg";
+	extcon = <&extcon_usb_1>;
+};
+
+&usb_hsphy_2 {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 123 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17a>;
+	vcc-max-microamp = <600000>;
+	vccq2-supply = <&vreg_s4a>;
+	vccq2-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
new file mode 100644
index 000000000000..25057f4f6a91
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm QCS615 IQ 615 EVK";
+	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	aliases {
+		mmc1 = &sdhc_2;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_state_on>;
+	pinctrl-1 = <&sdc2_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l10a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	status = "okay";
+};
-- 
2.34.1


