Return-Path: <linux-arm-msm+bounces-50722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89318A5800D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 01:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619DE3AFE0A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 00:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA57933E7;
	Sun,  9 Mar 2025 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnpeMxNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC34849C;
	Sun,  9 Mar 2025 00:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741481190; cv=none; b=Z+UOxWsgZrakGycutpf0dF+5L1uq7ygHvr8n5uD20eG/g6FOFRUQdHYGDuuyh9WueIJc8rwZtqKwYF3P99QFC9BZvte5N+8O1qETOf2qnKzJ9jyZ/J+GSl/onsDFVACct59AIIyf2cPtSstywsHjt6hYg1ehSTxwp9fj8sCfkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741481190; c=relaxed/simple;
	bh=+K/qSQikLSMzGbByUNc5tfjAV6eBo6IZaxaudIoRBVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pMuIPVPo6XogtG2ds59MOVrhwpFYy/ZSunc1IkdpjzryJRLv5+HvcitWZ+1pR3aU6arvGd+CctOVj/Crf0WWLvcfdCfsdK8jRXLSrCpOEYuK2H4Tv8l7Alo8hwgjboAGyO5t1OUdmkU1KPvBw4cJtDBYHDey9uxZTOWDE+EogaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnpeMxNZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CE3EC4CEE0;
	Sun,  9 Mar 2025 00:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741481190;
	bh=+K/qSQikLSMzGbByUNc5tfjAV6eBo6IZaxaudIoRBVA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NnpeMxNZtlLnLcmpJsnGfh6O4ktaiVySbbP5qK2gMhU/SNuVIGEfs39ItM1fOCbDW
	 2p1hN36sy+7ZwickFl8pPD7uKbuKd92nVcdRtn2kN/0Kbyp1gMc8THFucc5QFSoxbL
	 Xe7S+pXZBTS9SOgrWNbP4QPMSazs6Q2EY1Wm2uXH2Wo4nE/oPveUGWNMlEuh4uPyY3
	 qQRaOahYWoLwVDufc8kk2qg6a3oj9B51sq2tkO/MqnF5V6WBjFOUmez/QOvu2xgv0B
	 AOYGtIjEN0g1GfL9IXRdxqKW8OHc8nmjMqbOSLXciAHADFLD01+/73o/Z7n8px2xg9
	 eVGUuWPE/d5eA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDE4C282EC;
	Sun,  9 Mar 2025 00:46:29 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 09 Mar 2025 01:45:51 +0100
Subject: [PATCH v3] ARM: dts: nexus4: Initial dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAL7kzGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNL3Zx03bzUitJiE93cxOx83ZREAwtjYwsL0yQjMyWgpoKi1LTMCrC
 B0bG1tQBZJpPaYAAAAA==
X-Change-ID: 20250309-lg-nexus4-mako-da0833885b26
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ivan Belokobylskiy <belokobylskij@gmail.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9332; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=9lc+Nh7NerfyDiSvyeKzTUvba0fLnRsfpQ800uDYWYk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzOTkF/2WfSE74KadOYDw/DH6i+wOCpVPvKM+q
 iX/6x4qPu6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8zk5AAKCRBgAj/E00kg
 cu+jEAC8UFxNROOHGz3fyWMPTfko908pWET3p05yvENRIVS7OHjVZQVMDNVaLRp24S7CQ/Sf9cx
 YUE2BGM8HhqED/D44msppu4ZwhQW0Q8EC7a6NTOvbQXhH/YjzIS4bUeovAn20GpMpzv+7BGcYtl
 qHB3Nut0I1r+oOuWvQIwbEsLw3XZ26QUk3lgNvf+vrGj+FDuzGxXjtu8R/oDG5H+mtIEU+Mukt/
 Q3HbJP0+18+fchDkpTTvG+XAgY4CWpQz1mViThWt8TjEsZLQ1UGi46fYVZwhY8rPf0N4kdIVj8h
 0S8QBrX/pKpOslRieggwP/8gRN8s7KMhX/p0CQAANEg47ON90LDYCEzwUt1o/2nzf1nVGH0bfvR
 Nb1SHFZad1dhvXPSIOEYaAcqmEWoMqrmHwlb5JoFHW/g7c7RbG/GZM/dyIQuCpZBGLkxdXKCqjl
 UDSp7eX2NxYYtngxgHoDvdVhQvK5fx44OvKVABohKTOK6hx9kFThXTybEcLiMpvOZQQWD+lSayj
 rHru2m3oamz+5bF3rU2U/TCXtmt48jn84O5k65PJDPEWD7JTETcyA+bv4tqVh6ZVtkDV4swLkwj
 l4B/tJgItXIM/kCbKNBqynjcWHca8rjM4xJC3Y0+PeQenhY9zJ7HVPqpnvoCv7pamemGLfn/0sW
 qemrCaPS4X9HvMA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Ivan Belokobylskiy <belokobylskij@gmail.com>

Add initial support for LG Nexus 4 (mako).

Features currently working: regulators, eMMC, WiFi, and volume keys.

Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v3:
- rebased against next-20250307
- dropped backlight until driver gets converted to DT

Changes in v2:
- lge vendor doesn't exist anymore, rename to lg
- sdcc@ to mmc@ to comply with dt-schema
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 342 +++++++++++++++++++++
 2 files changed, 343 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index f06c6d425e91dd73c2b453d15543d95bd32383b9..0c1d116f6e84f76994aa8c8286350bdcd1657a42 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8064-ifc6410.dtb \
 	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
 	qcom-apq8064-asus-nexus7-flo.dtb \
+	qcom-apq8064-lg-nexus4-mako.dtb \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-apq8084-ifc6540.dtb \
 	qcom-apq8084-mtp.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
new file mode 100644
index 0000000000000000000000000000000000000000..bcb57675aa24892b290d543601f7a6b36b6a65f6
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "qcom-apq8064-v2.0.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/qcom-rpm.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+/ {
+	model = "LG Nexus 4 (mako)";
+	compatible = "lg,nexus4-mako", "qcom,apq8064";
+
+	aliases {
+		serial0 = &gsbi7_serial;
+		serial1 = &gsbi6_serial;
+		serial2 = &gsbi4_serial;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		ramoops@88d00000{
+			compatible = "ramoops";
+			reg = <0x88d00000 0x100000>;
+			record-size = <0x00020000>;
+			console-size = <0x00020000>;
+			ftrace-size = <0x00020000>;
+		};
+	};
+
+	battery_cell: battery-cell {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <900000>;
+		operating-range-celsius = <0 45>;
+	};
+
+	soc {
+		rpm@108000 {
+			regulators {
+				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+				vin_lvs1_3_6-supply = <&pm8921_s4>;
+				vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+				vdd_l24-supply = <&pm8921_s1>;
+				vdd_l25-supply = <&pm8921_s1>;
+				vin_lvs2-supply = <&pm8921_s1>;
+
+				vdd_l26-supply = <&pm8921_s7>;
+				vdd_l27-supply = <&pm8921_s7>;
+				vdd_l28-supply = <&pm8921_s7>;
+
+				/* Buck SMPS */
+				s1 {
+					regulator-always-on;
+					regulator-min-microvolt = <1225000>;
+					regulator-max-microvolt = <1225000>;
+					qcom,switch-mode-frequency = <3200000>;
+					bias-pull-down;
+				};
+				s2 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+					qcom,switch-mode-frequency = <1600000>;
+					bias-pull-down;
+				};
+
+				/* msm otg HSUSB_VDDCX */
+				s3 {
+					regulator-min-microvolt = <500000>;
+					regulator-max-microvolt = <1150000>;
+					qcom,switch-mode-frequency = <4800000>;
+					bias-pull-down;
+				};
+
+				/*
+				 * msm_sdcc.1-sdc-vdd_io
+				 * tabla2x-slim-CDC_VDDA_RX
+				 * tabla2x-slim-CDC_VDDA_TX
+				 * tabla2x-slim-CDC_VDD_CP
+				 * tabla2x-slim-VDDIO_CDC
+				 */
+				s4 {
+					regulator-always-on;
+					regulator-min-microvolt	= <1800000>;
+					regulator-max-microvolt	= <1800000>;
+					qcom,switch-mode-frequency = <1600000>;
+					bias-pull-down;
+					qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+				};
+
+				/*
+				 * supply vdd_l26, vdd_l27, vdd_l28
+				 */
+				s7 {
+					regulator-min-microvolt = <1300000>;
+					regulator-max-microvolt = <1300000>;
+					qcom,switch-mode-frequency = <3200000>;
+				};
+
+				s8 {
+					regulator-min-microvolt = <2200000>;
+					regulator-max-microvolt = <2200000>;
+					qcom,switch-mode-frequency = <1600000>;
+				};
+
+				l1 {
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					regulator-always-on;
+					bias-pull-down;
+				};
+
+				/* mipi_dsi.1-dsi1_pll_vdda */
+				l2 {
+					regulator-min-microvolt = <1200000>;
+					regulator-max-microvolt = <1200000>;
+					bias-pull-down;
+				};
+
+				/* msm_otg-HSUSB_3p3 */
+				l3 {
+					regulator-min-microvolt = <3075000>;
+					regulator-max-microvolt = <3500000>;
+					bias-pull-down;
+				};
+
+				/* msm_otg-HSUSB_1p8 */
+				l4 {
+					regulator-always-on;
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+				};
+
+				/* msm_sdcc.1-sdc_vdd */
+				l5 {
+					regulator-min-microvolt = <2950000>;
+					regulator-max-microvolt = <2950000>;
+					bias-pull-down;
+				};
+
+				/* earjack_debug */
+				l6 {
+					regulator-min-microvolt = <3000000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
+				/* mipi_dsi.1-dsi_vci */
+				l8 {
+					regulator-min-microvolt = <2800000>;
+					regulator-max-microvolt = <3000000>;
+					bias-pull-down;
+				};
+
+				/* wcnss_wlan.0-iris_vddpa */
+				l10 {
+					regulator-min-microvolt = <2900000>;
+					regulator-max-microvolt = <2900000>;
+					bias-pull-down;
+				};
+
+				/* mipi_dsi.1-dsi1_avdd */
+				l11 {
+					regulator-min-microvolt = <2850000>;
+					regulator-max-microvolt = <2850000>;
+					bias-pull-down;
+				};
+
+				/* touch_vdd */
+				l15 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <2950000>;
+					bias-pull-down;
+				};
+
+				/* slimport_dvdd */
+				l18 {
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+					bias-pull-down;
+				};
+
+				/* touch_io */
+				l22 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/*
+				 * mipi_dsi.1-dsi_vddio
+				 * pil_qdsp6v4.1-pll_vdd
+				 * pil_qdsp6v4.2-pll_vdd
+				 * msm_ehci_host.0-HSUSB_1p8
+				 * msm_ehci_host.1-HSUSB_1p8
+				 */
+				l23 {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					bias-pull-down;
+				};
+
+				/*
+				 * tabla2x-slim-CDC_VDDA_A_1P2V
+				 * tabla2x-slim-VDDD_CDC_D
+				 */
+				l24 {
+					regulator-min-microvolt = <750000>;
+					regulator-max-microvolt = <1150000>;
+					bias-pull-down;
+				};
+
+				l25 {
+					regulator-min-microvolt = <1250000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-always-on;
+					bias-pull-down;
+				};
+
+				l26 {
+					regulator-min-microvolt = <375000>;
+					regulator-max-microvolt = <1050000>;
+					regulator-always-on;
+					bias-pull-down;
+				};
+
+				l27 {
+					regulator-min-microvolt = <1100000>;
+					regulator-max-microvolt = <1100000>;
+				};
+
+				l28 {
+					regulator-min-microvolt = <1050000>;
+					regulator-max-microvolt = <1050000>;
+					bias-pull-down;
+				};
+
+				/* wcnss_wlan.0-iris_vddio */
+				lvs1 {
+					bias-pull-down;
+				};
+
+				/* wcnss_wlan.0-iris_vdddig */
+				lvs2 {
+					bias-pull-down;
+				};
+
+				lvs3 {
+					bias-pull-down;
+				};
+
+				lvs4 {
+					bias-pull-down;
+				};
+
+				lvs5 {
+					bias-pull-down;
+				};
+
+				/* mipi_dsi.1-dsi_iovcc */
+				lvs6 {
+					bias-pull-down;
+				};
+
+				/*
+				 * pil_riva-pll_vdd
+				 * lvds.0-lvds_vdda
+				 * mipi_dsi.1-dsi1_vddio
+				 * hdmi_msm.0-hdmi_vdda
+				 */
+				lvs7 {
+					bias-pull-down;
+				};
+
+				ncp {
+					regulator-min-microvolt = <1800000>;
+					regulator-max-microvolt = <1800000>;
+					qcom,switch-mode-frequency = <1600000>;
+				};
+			};
+		};
+	};
+};
+
+&pmicintc {
+	keypad@148 {
+		compatible = "qcom,pm8921-keypad";
+		reg = <0x148>;
+		interrupt-parent = <&pmicintc>;
+		interrupts = <74 1>, <75 1>;
+		linux,keymap = <
+			MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)
+			MATRIX_KEY(0, 1, KEY_VOLUMEUP)
+		>;
+
+		keypad,num-rows = <1>;
+		keypad,num-columns = <5>;
+		debounce = <15>;
+		scan-delay = <32>;
+		row-hold = <91500>;
+	};
+};
+
+&gsbi1 {
+	status = "okay";
+	qcom,mode = <GSBI_PROT_I2C>;
+};
+
+&gsbi1_i2c {
+	status = "okay";
+	clock-frequency = <200000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+};
+
+&gsbi4 {
+	status = "okay";
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+};
+
+&gsbi4_serial {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi4_uart_pin_a>;
+};
+
+/* eMMC */
+&sdcc1 {
+	status = "okay";
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+};
+
+&riva {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&riva_wlan_pin_a>;
+};

---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250309-lg-nexus4-mako-da0833885b26

Best regards,
-- 
David Heidelberg <david@ixit.cz>



