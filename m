Return-Path: <linux-arm-msm+bounces-51549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75870A637AB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 23:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A04A716BE29
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Mar 2025 22:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D797199E9A;
	Sun, 16 Mar 2025 22:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqHsUbQn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5319642A8B;
	Sun, 16 Mar 2025 22:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742163426; cv=none; b=hMyeqgFFjExWBa0De5P/VEfkx0okydofU5h1RO51aXcgLcXwRZAQtKCFvt1vVY2Bp2KHIrO5XJ/5FzJWCL9/DaRpTX8Kk+SPFqrD7DX5TjXMY8GzZZNuh74iN/Tnf4SBi3WVDuiRqAms+mhhihY77VTeZuRu2Ni8WYR1frTI06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742163426; c=relaxed/simple;
	bh=KeNynuubeta2ne4/SAZz2ZAsxWspSzUhDae9z5ojBI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W3lGNyVs/i73h2uqTfdShG4K0SKz78/VUd555nYX6yIFKDbo3CD4YzSq7GzZpw34I3+cGHou+WviuyCMULZH4dB/OnrwnGCoMUA4/gVX3cUt8pTJ26dFn9sXV4WWRvVBPg0PgbkieaIZxQr7LtwOU/aa7s9kAmsbjM24q1s9uO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqHsUbQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADB1FC4CEDD;
	Sun, 16 Mar 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742163425;
	bh=KeNynuubeta2ne4/SAZz2ZAsxWspSzUhDae9z5ojBI0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=iqHsUbQnqjk78LPWTUcq56ibnrDpehxfCX+o9AD6r17canv6oaebNAyWqeERsQNb4
	 0rcEaRTJtd/JfF6MEQK0qJnF8gK1LsSNAuCWL99cgtHO5pf0JApdaVz5sEI0/j5x6D
	 FqR22kAq4vkUqfwNK4/TaGGRzJKdnp1CTqGxqouAJikGpCzXIUuQUNIYJKGwDfx/Qy
	 YhgeZW3SxO7YubfF/sxn5ORK1+qU7akFfa8vwRT7K6qRNuQ1q9brfYHisB7RRAiV0G
	 F4Rk6wudnigq628CQ28Jr9aBzkigClJQLKc/APay7AZxhIrQ5slN1K2ldlf+Refy8L
	 3m9nsv/JEnrKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EE0C35FF1;
	Sun, 16 Mar 2025 22:17:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 16 Mar 2025 23:16:55 +0100
Subject: [PATCH v5] ARM: dts: nexus4: Initial dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
X-B4-Tracking: v=1; b=H4sIANZN12cC/3XMSw6CMBSF4a2QO7amDx7FkfswDqC9wI0KpsUGJ
 ezdwkQT4/Cc5Ptn8OgIPRySGRwG8jT0cWS7BExX9S0ysnGD5DLjipfs2rIep4dP2a26DMxWXCu
 ldVbLHCK6O2xo2oKnc9wd+XFwz60f1Pr+TQXFBBPWSM0L28gyP9JE4968YA2F9AsL8YPTiFUpc
 qPRFGjrD16W5Q3X+TEB5wAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9706; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=eiVSVBGFky6FNlAEKXP/r3BB2aTVwWzF7cR+i71YhIc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn103gJtWmEuuA5HbbieYN2dcnVOCGm30Fj4jWx
 OKH0siN4h2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ9dN4AAKCRBgAj/E00kg
 cteND/0bsziHNxnWwSWGlEKhMoVe99SGNW0HJHuZVpm4Gsme7o9exGtH6/lLmwAHeZ4p74IiBr8
 2DvUekBeRxZVwFm5GnI9u0z4S3er1szx48Uo/uICBRAPYFnWNgFr831jvgikh+kgLUoCqlpMFoh
 GwvplIi1WQARNpaH5/5Oig32kCyqVIJ3ck7MhMSpijrB3dnpZLTVycgsbph+CTyti0Qt+wP/iQ8
 Q3fZPz1KOgXjfwlZg6kdhE3Av6zOAQpMuiuIwj7qsimzBZ95EL1tHChtzMev3XyplvXavJ4ErfR
 U8RXRNe0Ofq7dphILm4cTZokviVmYL5rRW23gUclExRM9//bp3vLd16p0lSG+h5M4fHBRndQxk7
 a9DlIdeAzbZWqMJ75wZy8x6AoHvwPZ1Xyas1Z5/55RHiIfnGi61ZeTmcCWAy8tuAO1uOOLtmmdN
 eaaizUofPP21LHYrlkZ4qi/o/9kAgwixEQmXcECCBrScVBwmmwzuMGjmaVAI+uxLW6+wB5vRn1n
 D4xa/Zp0HxWneKgxgp0nbaZHkp1am1xv/hMST52QQII+jxlNBsWjyH5fMFcmCnxqXTSkt5O1I6V
 h/dTEXw3ARfuzjrHDPe4+HKAQ9c2iE18KNBSrcoK+CxHJJrDAtDH+HGmZIAdC0mP2F8WQahdIFi
 gHe3bqA6pxPp3Lw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Ivan Belokobylskiy <belokobylskij@gmail.com>

Add initial support for LG Nexus 4 (mako).

Features currently working: regulators, eMMC, and volume keys.

Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v5:
- Sorted nodes alphabetically.
- Link to v4: https://lore.kernel.org/r/20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz

Changes in v4:
- Sorted regulators and added regulators compatible.
- Corrected pmic include and references.
- Moved &rpm outside of / node.
- Moved and simplify pm8921 keypad.
- Added chasis-type.
- Dropped incomplete WiFi node, will be provided in future
  contributions.
- Link to v3: https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz

Changes in v3:
- rebased against next-20250307
- dropped backlight until driver gets converted to DT

Changes in v2:
- lge vendor doesn't exist anymore, rename to lg
- sdcc@ to mmc@ to comply with dt-schema
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
 2 files changed, 342 insertions(+)

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
index 0000000000000000000000000000000000000000..5710450faabf34fa5991d8803a2369cfbb09e4ea
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/mfd/qcom-rpm.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
+/ {
+	model = "LG Nexus 4 (mako)";
+	compatible = "lg,nexus4-mako", "qcom,apq8064";
+	chassis-type = "handset";
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
+	battery_cell: battery-cell {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <900000>;
+		operating-range-celsius = <0 45>;
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
+			record-size = <0x20000>;
+			console-size = <0x20000>;
+			ftrace-size = <0x20000>;
+		};
+	};
+};
+
+&gsbi1 {
+	qcom,mode = <GSBI_PROT_I2C>;
+
+	status = "okay";
+};
+
+&gsbi1_i2c {
+	clock-frequency = <200000>;
+
+	status = "okay";
+};
+
+&gsbi4 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+
+	status = "okay";
+};
+
+&gsbi4_serial {
+	status = "okay";
+};
+
+&pm8821 {
+	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921 {
+	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&pm8921_keypad {
+	linux,keymap = <
+		MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0, 1, KEY_VOLUMEUP)
+	>;
+
+	keypad,num-rows = <1>;
+	keypad,num-columns = <5>;
+
+	status = "okay";
+};
+
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8921-regulators";
+
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+		pm8921_l1: l1 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi1_pll_vdda */
+		pm8921_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
+
+		/* msm_otg-HSUSB_3p3 */
+		pm8921_l3: l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3500000>;
+			bias-pull-down;
+		};
+
+		/* msm_otg-HSUSB_1p8 */
+		pm8921_l4: l4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		/* msm_sdcc.1-sdc_vdd */
+		pm8921_l5: l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		/* earjack_debug */
+		pm8921_l6: l6 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi_vci */
+		pm8921_l8: l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vddpa */
+		pm8921_l10: l10 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi1_avdd */
+		pm8921_l11: l11 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			bias-pull-down;
+		};
+
+		/* touch_vdd */
+		pm8921_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		/* slimport_dvdd */
+		pm8921_l18: l18 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			bias-pull-down;
+		};
+
+		/* touch_io */
+		pm8921_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * mipi_dsi.1-dsi_vddio
+		 * pil_qdsp6v4.1-pll_vdd
+		 * pil_qdsp6v4.2-pll_vdd
+		 * msm_ehci_host.0-HSUSB_1p8
+		 * msm_ehci_host.1-HSUSB_1p8
+		 */
+		pm8921_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * tabla2x-slim-CDC_VDDA_A_1P2V
+		 * tabla2x-slim-VDDD_CDC_D
+		 */
+		pm8921_l24: l24 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		pm8921_l25: l25 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		pm8921_l26: l26 {
+			regulator-min-microvolt = <375000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-always-on;
+			bias-pull-down;
+		};
+
+		pm8921_l27: l27 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8921_l28: l28 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vddio */
+		pm8921_lvs1: lvs1 {
+			bias-pull-down;
+		};
+
+		/* wcnss_wlan.0-iris_vdddig */
+		pm8921_lvs2: lvs2 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs3: lvs3 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs4: lvs4 {
+			bias-pull-down;
+		};
+
+		pm8921_lvs5: lvs5 {
+			bias-pull-down;
+		};
+
+		/* mipi_dsi.1-dsi_iovcc */
+		pm8921_lvs6: lvs6 {
+			bias-pull-down;
+		};
+
+		/*
+		 * pil_riva-pll_vdd
+		 * lvds.0-lvds_vdda
+		 * mipi_dsi.1-dsi1_vddio
+		 * hdmi_msm.0-hdmi_vdda
+		 */
+		pm8921_lvs7: lvs7 {
+			bias-pull-down;
+		};
+
+		pm8921_ncp: ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+
+		/* Buck SMPS */
+		pm8921_s1: s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		pm8921_s2: s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		/* msm otg HSUSB_VDDCX */
+		pm8921_s3: s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
+			bias-pull-down;
+		};
+
+		/*
+		 * msm_sdcc.1-sdc-vdd_io
+		 * tabla2x-slim-CDC_VDDA_RX
+		 * tabla2x-slim-CDC_VDDA_TX
+		 * tabla2x-slim-CDC_VDD_CP
+		 * tabla2x-slim-VDDIO_CDC
+		 */
+		pm8921_s4: s4 {
+			regulator-always-on;
+			regulator-min-microvolt	= <1800000>;
+			regulator-max-microvolt	= <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+		};
+
+		/*
+		 * supply vdd_l26, vdd_l27, vdd_l28
+		 */
+		pm8921_s7: s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
+		};
+
+		pm8921_s8: s8 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+	};
+};
+
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+
+	status = "okay";
+};

---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250309-lg-nexus4-mako-da0833885b26

Best regards,
-- 
David Heidelberg <david@ixit.cz>



