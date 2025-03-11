Return-Path: <linux-arm-msm+bounces-51016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF9A5CA63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F136D1886DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7981225EFA9;
	Tue, 11 Mar 2025 16:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K4rgSdt1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4705025B68E;
	Tue, 11 Mar 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741709443; cv=none; b=ctbgVkbONC8JW1w/qfzpXh5Kdzu3wCUFkBdgkSEBiOhErZBkip5iJDNR8z0lFZ3/Ux4dnhDL6r5NCcPohblG4OOIqnwoRGropxh/g3aTP7uqo8wQN4z7aH3Ty2e9pUi0sFenf9pHk9/YKedCa8gdB/7ywTa9aj4Ag2UdukavC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741709443; c=relaxed/simple;
	bh=zgNmjhMoZPBMDiyBETdCfcW6FwZyRy/nV0ICAQVAZm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HbYUI8yt0I/kyu8fwHwVuvpOW9viaNZhEVrfgyk03cfseWZSmIq2b6Twb5OuYN8SiR6vbxsvUQoW6O7lRBlZuENAjJqV6Cwas/quM8p7ffBZh8i6LhUz4AX85smN74bQXkR8E4nGJfknFBFImThMjF7ewTW4ZMx7yiJkXG7DIaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K4rgSdt1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BD24C4CEF3;
	Tue, 11 Mar 2025 16:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741709442;
	bh=zgNmjhMoZPBMDiyBETdCfcW6FwZyRy/nV0ICAQVAZm8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=K4rgSdt1jALdxy4ZEx1QYVZwgD0PFlR1On6f8pAslLWTTSp6cx7wm7LqSp14Zd8Oi
	 K77vbhWLsmu7xQLtdGBi5slR/fk84QpQQusPCvmVCXVzCB5oDLMSb8mmCPplApmnj5
	 9YjJpf/gPB8YBotJSfAg046RHWh1XhF4kmMEFQ2uCOpApmtsSjHhl+1TVTie/e2Q5i
	 QbM1KDi9y0dc0/DkHNvaShRW+bV9oApHRzcSewk4dz/aOwmcXDpoC+bPYWOGXFZNxO
	 AuJ3+dJ318QR/vdet3OpqHF9HoK7yOOibHcn4OCyqu4baMvDzMWV/Ohp1+l9XoGGow
	 b91C3DNUexWhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404C2C282EC;
	Tue, 11 Mar 2025 16:10:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 11 Mar 2025 17:10:02 +0100
Subject: [PATCH v4] ARM: dts: nexus4: Initial dts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAFlg0GcC/3XMQQ6CMBCF4auQWTumtICFlfcwLCodYKJS0yKpE
 u5uZe/yf8n7VgjkmQI02QqeFg7sphTFIYNuNNNAyDY1SCFLoUSN9wEniq9Q4MPcHFojtFJal1d
 ZQTo9PfUcd/DSph45zM6/d39Rv/UvtSjMMbed1OJke1lXZ448H7sPtNu2fQFkqxLEqgAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9574; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ej/fcyNobEhGu/DGU98SkH5ibaeHLK+oGaImrCZQGVA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn0GB8zy0C8e3ZvENnVBihwn53dFwRSkkTq3jft
 2A4dKa7tYmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ9BgfAAKCRBgAj/E00kg
 cqfQD/44hUKUo9cVwDBhie+HzrDf3AHjG0oITt5/Z7RJyLN24fKH//LeNRQ+4TXvtkOatEE/FAc
 3zZ0wJxirG7qC7SgFE4+MlC8/GYwCBxpIptg+JaruMkIjQxBoirSDJ2MHj/ScdjXYznh6818OTL
 DlTSDPv71gHicU9n3z+rMpBXkDuNtcEMkIo0j1zlIUs8EO3/SenOojkRD2uRv5ser+my64v7JRF
 Q99cZkPNh0+zFQvKEefTYWE7j6gI52gOrUu4ETcrTw3sukuNgXSNmgWf6Tr35uUHgaKIT0EAPOB
 nkt80X0Te8x+xqp2DemmIGkmBCOdJm3cbrKFqe+Ty2EzSFPYe/ZxiqqoIL1XfaY9zjqlCBnhPhQ
 +aj1byPigyXFGQSQkzUsJe9twZw47y0ul6KlH1PO9+JeK6tM5Q0S9H65s5jgpmxxzkl2fAtkEYa
 ZrHrZ3eDQn50wAtI9B+C6wy8iuIbk1cV4jcGnHf9j8YDLV/rKxuw9tzx9sn7PgyaIe+Vucltp+t
 Dz1faaV/BsPi85MqSbvblEmMCXep2SE4U921r3x+57zOVwAjVXEmuoobPmSVZDlS1Zh769WDCZt
 uIHxrR43mXuVUAJZgevfMV6M7lEfog5rcFG1sexgXpRV50roYLkGe1wgfJWFe1dXj6gmhVydYvl
 8AdL8Na11FM2RBw==
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
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 344 +++++++++++++++++++++
 2 files changed, 345 insertions(+)

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
index 0000000000000000000000000000000000000000..51edd661e4bd903a32445d15955585a194574f30
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
@@ -0,0 +1,344 @@
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
+
+	battery_cell: battery-cell {
+		compatible = "simple-battery";
+		constant-charge-current-max-microamp = <900000>;
+		operating-range-celsius = <0 45>;
+	};
+};
+
+&rpm {
+	regulators {
+		compatible = "qcom,rpm-pm8921-regulators";
+
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
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



