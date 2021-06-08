Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B160539FAB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 17:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhFHP3o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 11:29:44 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:35469 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbhFHP3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 11:29:42 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 16FD31FF04;
        Tue,  8 Jun 2021 17:27:45 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add support for SONY Xperia X Performance / XZ / XZs (msm8996, Tone platform)
Date:   Tue,  8 Jun 2021 17:27:36 +0200
Message-Id: <20210608152737.154218-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608152737.154218-1-konrad.dybcio@somainline.org>
References: <20210608152737.154218-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add support for following boards:

- Xperia X Performance (dora)
- Xperia XZ (kagura)
- Xperia XZs (keyaki)

They are all based on the SONY Tone platform and feature largely similar hardware
with the most obvious differences being lack of USB-C and ToF sensor on Dora and
different camera sensor on Keyaki.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
Changes since v2:
- Remove unneeded labels from the pinned(pun intended)-by-default pins

 arch/arm64/boot/dts/qcom/Makefile             |   6 +
 .../msm8996-pmi8996-sony-xperia-tone-dora.dts |  11 +
 ...sm8996-pmi8996-sony-xperia-tone-kagura.dts |  11 +
 ...sm8996-pmi8996-sony-xperia-tone-keyaki.dts |  11 +
 .../qcom/msm8996-sony-xperia-tone-dora.dts    |  27 +
 .../qcom/msm8996-sony-xperia-tone-kagura.dts  |  15 +
 .../qcom/msm8996-sony-xperia-tone-keyaki.dts  |  26 +
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 959 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  12 +-
 9 files changed, 1072 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f4e40589dbb5..3e2ac2365798 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,6 +27,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-satsuki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-suzuran.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-dora.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-kagura.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-pmi8996-sony-xperia-tone-keyaki.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-dora.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-kagura.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-keyaki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
new file mode 100644
index 000000000000..b018693600a5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996-sony-xperia-tone-dora.dts"
+#include "pmi8996.dtsi"
+
+/ {
+	model = "Sony Xperia X Performance (PMI8996)";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
new file mode 100644
index 000000000000..842ea3cf557e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996-sony-xperia-tone-kagura.dts"
+#include "pmi8996.dtsi"
+
+/ {
+	model = "Sony Xperia XZ (PMI8996)";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
new file mode 100644
index 000000000000..b3f9062da4b0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996-sony-xperia-tone-keyaki.dts"
+#include "pmi8996.dtsi"
+
+/ {
+	model = "Sony Xperia XZs (PMI8996)";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
new file mode 100644
index 000000000000..b4cca54dcb68
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8996-sony-xperia-tone.dtsi"
+
+/ {
+	model = "Sony Xperia X Performance";
+	compatible = "sony,dora-row", "qcom,msm8996";
+};
+
+/delete-node/ &tof_sensor;
+/delete-node/ &pm8994_l11;
+/delete-node/ &pm8994_l14;
+
+&usb_detect {
+	pins = "gpio24";
+};
+
+&usb3_id {
+	id-gpio = <&tlmm 24 GPIO_ACTIVE_LOW>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
new file mode 100644
index 000000000000..be6ea855fcce
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8996-sony-xperia-tone.dtsi"
+
+/ {
+	model = "Sony Xperia XZ";
+	compatible = "sony,kagura-row", "qcom,msm8996";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
new file mode 100644
index 000000000000..1eee7d0fc178
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8996-sony-xperia-tone.dtsi"
+
+/ {
+	model = "Sony Xperia XZs";
+	compatible = "sony,keyaki-row", "qcom,msm8996";
+};
+
+&pm8994_l19 {
+	regulator-min-microvolt = <2700000>;
+	regulator-max-microvolt = <2700000>;
+};
+
+&pm8994_l30 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+	regulator-pull-down;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
new file mode 100644
index 000000000000..1f71b3b2dc57
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -0,0 +1,959 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
+ */
+
+#include "msm8996.dtsi"
+#include "pm8994.dtsi"
+#include "pmi8994.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
+
+/delete-node/ &hdmi;
+/delete-node/ &hdmi_phy;
+/delete-node/ &mdp5_intf3_out;
+/delete-node/ &slpi_region;
+/delete-node/ &venus_region;
+/delete-node/ &zap_shader_region;
+
+/ {
+	qcom,msm-id = <246 0x30001>; /* MSM8996 V3.1 (Final) */
+	qcom,pmic-id = <0x20009 0x2000a 0 0>; /* PM8994 + PMI8994 */
+	qcom,board-id = <8 0>;
+
+	chosen {
+		/*
+		 * Due to an unknown-for-a-few-years regression,
+		 * SDHCI only works on MSM8996 in PIO (lame) mode.
+		 */
+		bootargs = "sdhci.debug_quirks=0x40 sdhci.debug_quirks2=0x4 maxcpus=2";
+	};
+
+	reserved-memory {
+		ramoops@a7f00000 {
+			compatible = "ramoops";
+			reg = <0 0xa7f00000 0 0x100000>;
+			record-size = <0x20000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x20000>;
+			pmsg-size = <0x20000>;
+			ecc-size = <16>;
+		};
+
+		cont_splash_mem: memory@83401000 {
+			reg = <0 0x83401000 0 0x23ff000>;
+			no-map;
+		};
+
+		zap_shader_region: gpu@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x90400000 0x0 0x2000>;
+			no-map;
+		};
+
+		slpi_region: memory@90500000 {
+			reg = <0 0x90500000 0 0xa00000>;
+			no-map;
+		};
+
+		venus_region: memory@90f00000 {
+			reg = <0 0x90f00000 0 0x500000>;
+			no-map;
+		};
+	};
+
+	panel_tvdd: tvdd-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_tvdd";
+		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&tp_vddio_en>;
+		pinctrl-names = "default";
+	};
+
+	usb3_id: usb3-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 25 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_detect>;
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	wlan_en: wlan-en-1-8v {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-en-regulator";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wl_reg_on>;
+
+		/* WLAN card specific delay */
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+	clock-frequency = <355000>;
+
+	tof_sensor: vl53l0x@29 {
+		compatible = "st,vl53l0x";
+		reg = <0x29>;
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp2_i2c5 {
+	status = "okay";
+	clock-frequency = <355000>;
+
+	/* FUSB301 USB-C controller */
+};
+
+&blsp2_i2c6 {
+	status = "okay";
+	clock-frequency = <355000>;
+
+	synaptics@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&panel_tvdd>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <220>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x1>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp2_uart2 {
+	status = "okay";
+};
+
+&camera0_mclk {
+	drive-strength = <2>;
+	output-low;
+};
+
+&camera0_pwdn {
+	drive-strength = <2>;
+	output-low;
+};
+
+&camera0_rst {
+	pins = "gpio30";
+	drive-strength = <2>;
+	output-low;
+};
+
+&camera2_mclk {
+	drive-strength = <2>;
+	output-low;
+};
+
+&camera2_rst {
+	drive-strength = <2>;
+	output-low;
+};
+
+&hsusb_phy1 {
+	status = "okay";
+
+	vdda-pll-supply = <&pm8994_l12>;
+	vdda-phy-dpdm-supply = <&pm8994_l24>;
+};
+
+&mmcc {
+	vdd-gfx-supply = <&vdd_gfx>;
+};
+
+&pcie0 {
+	status = "okay";
+	perst-gpio = <&tlmm 35 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+	vddpe-3v3-supply = <&wlan_en>;
+	vdda-supply = <&pm8994_l28>;
+};
+
+&pcie_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&pm8994_l28>;
+	vdda-pll-supply = <&pm8994_l12>;
+};
+
+&pm8994_gpios {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pm8994_gpios_defaults>;
+	gpio-line-names =
+		"NC",
+		"VOL_DOWN_N",
+		"VOL_UP_N",
+		"SNAPSHOT_N",
+		"FOCUS_N",
+		"NC",
+		"NFC_VEN",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"EAR_EN",
+		"NC",
+		"PM_DIVCLK1",
+		"PMI_CLK",
+		"NC",
+		"WL_SLEEP_CLK",
+		"NC",
+		"PMIC_SPON",
+		"UIM_BATT_ALARM",
+		"PMK_SLEEP_CLK";
+
+	/*
+	 * We don't yet know for sure which GPIOs are of our interest, but what
+	 * we do know is that if a vendor sets the pins to a non-default state, there's
+	 * probably a reason for it, and just to be on the safe side, we follow suit.
+	 */
+	pm8994_gpios_defaults: pm8994-gpios-default-state {
+		pm8994-gpio1-nc {
+			pins = "gpio1";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+		};
+
+		vol-down-n {
+			pins = "gpio2";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-pull-up;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		vol-up-n {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-pull-up;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		camera-snapshot-n {
+			pins = "gpio4";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-pull-up;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		camera-focus-n {
+			pins = "gpio5";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-pull-up;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pm8994-gpio6-nc {
+			pins = "gpio6";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		nfc-download {
+			pins = "gpio7";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			drive-push-pull;
+			bias-disable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pm8994-gpio8-nc {
+			pins = "gpio8";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			drive-push-pull;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pm8994-gpio9-nc {
+			pins = "gpio9";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-high;
+			drive-push-pull;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		nfc-clock {
+			pins = "gpio10";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			input-enable;
+			drive-push-pull;
+			bias-pull-down;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pm8994-gpio11-nc {
+			pins = "gpio11";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pm8994-gpio12-nc {
+			pins = "gpio12";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		ear-enable {
+			pins = "gpio13";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-high;
+			drive-push-pull;
+			bias-disable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pm8994-gpio14-nc {
+			pins = "gpio14";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pm-divclk1-gpio {
+			pins = "gpio15";
+			function = "func1";
+			output-high;
+			drive-push-pull;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pmi-clk-gpio {
+			pins = "gpio16";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+		};
+
+		pm8994-gpio17-nc {
+			pins = "gpio17";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		rome-sleep {
+			pins = "gpio18";
+			function = PMIC_GPIO_FUNC_FUNC2;
+			output-low;
+			drive-push-pull;
+			bias-disable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pm8994-gpio19-nc {
+			pins = "gpio19";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			drive-push-pull;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pm8994-gpio22-nc {
+			pins = "gpio22";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+	};
+};
+
+&pm8994_mpps {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pm8994_mpps_defaults>;
+
+	gpio-line-names =
+		"SDC_UIM_VBIAS",
+		"LCD_ID_ADC",
+		"VREF_DACX",
+		"NC",
+		"FLASH_THERM",
+		"NC",
+		"NC",
+		"RF_ID";
+
+	pm8994_mpps_defaults: pm8994-mpps-default-state {
+		lcd-id_adc-mpp {
+			pins = "mpp2";
+			function = PMIC_MPP_FUNC_ANALOG;
+			input-enable;
+			qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH6>;
+		};
+
+		pm-mpp4-nc {
+			pins = "mpp4";
+			function = PMIC_MPP_FUNC_DIGITAL;
+			bias-high-impedance;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		flash-therm-mpp {
+			pins = "mpp5";
+			function = PMIC_MPP_FUNC_ANALOG;
+			input-enable;
+			qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH5>;
+		};
+
+		mpp6-nc {
+			pins = "mpp6";
+			function = PMIC_MPP_FUNC_DIGITAL;
+			bias-high-impedance;
+		};
+
+		rf-id-mpp {
+			pins = "mpp8";
+			function = PMIC_MPP_FUNC_ANALOG;
+			input-enable;
+			qcom,amux-route = <PMIC_MPP_AMUX_ROUTE_CH8>;
+		};
+	};
+};
+
+&pm8994_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEUP>;
+};
+
+&pmi8994_gpios {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmi8994_gpios_defaults>;
+
+	gpio-line-names =
+		"VIB_LDO_EN",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"USB_SWITCH_SEL",
+		"NC";
+
+	pmi8994_gpios_defaults: pmi8994-gpios-default-state {
+		vib-ldo-en-gpio {
+			pins = "gpio1";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-low;
+			bias-disable;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pmi-gpio2-nc {
+			pins = "gpio2";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pmi-gpio3-nc {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			input-enable;
+			bias-high-impedance;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_VPH>;
+		};
+
+		pmi-gpio4-nc {
+			pins = "gpio4";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-high;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pmi-gpio5-nc {
+			pins = "gpio5";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-high;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pmi-gpio6-nc {
+			pins = "gpio6";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-high;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pmi-gpio7-nc {
+			pins = "gpio7";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-high;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		pmi-gpio8-nc {
+			pins = "gpio8";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+			output-high;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+
+		usb-switch-sel {
+			pins = "gpio9";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			drive-push-pull;
+		};
+
+		pmi-gpio10-nc {
+			pins = "gpio10";
+			function = PMIC_GPIO_FUNC_NORMAL;
+			output-low;
+			drive-push-pull;
+			bias-disable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+			power-source = <PM8994_GPIO_S4>;
+		};
+	};
+};
+
+&pmi8994_spmi_regulators {
+	qcom,saw-reg = <&saw3>;
+
+	vdd_gfx:
+	pmi8994_s2: s2 {
+		/* Pinned to a high value for now to avoid random crashes. */
+		regulator-min-microvolt = <1015000>;
+		regulator-max-microvolt = <1015000>;
+		regulator-name = "vdd_gfx";
+		regulator-always-on;
+	};
+
+	pmi8994_s9: s9 {
+		qcom,saw-slave;
+	};
+
+	pmi8994_s10: s10 {
+		qcom,saw-slave;
+	};
+
+	pmi8994_s11: s11 {
+		qcom,saw-leader;
+		regulator-always-on;
+		regulator-min-microvolt = <470000>;
+		regulator-max-microvolt = <1140000>;
+	};
+};
+
+&pmi8994_wled {
+	status = "okay";
+	default-brightness = <512>;
+};
+
+&rpm_requests {
+	pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_s8-supply = <&vph_pwr>;
+		vdd_s9-supply = <&vph_pwr>;
+		vdd_s10-supply = <&vph_pwr>;
+		vdd_s11-supply = <&vph_pwr>;
+		vdd_s12-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pm8994_s3>;
+		vdd_l2_l26_l28-supply = <&pm8994_s3>;
+		vdd_l3_l11-supply = <&pm8994_s3>;
+		vdd_l4_l27_l31-supply = <&pm8994_s3>;
+		vdd_l5_l7-supply = <&pm8994_s5>;
+		vdd_l6_l12_l32-supply = <&pm8994_s5>;
+		vdd_l8_l16_l30-supply = <&vph_pwr>;
+		vdd_l14_l15-supply = <&pm8994_s5>;
+		vdd_l20_l21-supply = <&pm8994_s5>;
+		vdd_l25-supply = <&pm8994_s3>;
+		vdd_lvs1_2-supply = <&pm8994_s4>;
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-system-load = <325000>;
+			regulator-always-on;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+		};
+
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		/* L6 and L7 seem unused. */
+
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <22000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2500000>;
+		};
+
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <570000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-system-load = <800000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+			regulator-allow-set-load;
+		};
+
+		pm8994_l29: l29 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l30: l30 { };
+
+		pm8994_l32: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+};
+
+&sdhc1 {
+	/* eMMC doesn't seem to cooperate even in PIO mode.. */
+	status = "disabled";
+
+	vmmc-supply = <&pm8994_l20>;
+	vqmmc-supply = <&pm8994_s4>;
+	mmc-hs400-1_8v;
+	mmc-hs200-1_8v;
+};
+
+&sdhc2 {
+	status = "okay";
+
+	cd-gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&pm8994_l21>;
+	vqmmc-supply = <&pm8994_l13>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+	pinctrl-0 = <&sw_service_gpio>;
+	pinctrl-names = "default";
+
+	disp_reset_n_gpio: disp-reset-n {
+		pins = "gpio8";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	mdp_vsync_p_gpio: mdp-vsync-p {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sw_service_gpio: sw-service-gpio {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	usb_detect: usb-detect {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	uim_detect_en: uim-detect-en {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	tray_det_pin: tray-det {
+		pins = "gpio40";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tp_vddio_en: tp-vddio-en {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	lcd_vddio_en: lcd-vddio-en {
+		pins = "gpio51";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	wl_host_wake: wl-host-wake {
+		pins = "gpio79";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-high;
+	};
+
+	wl_reg_on: wl-reg-on {
+		pins = "gpio84";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	ts_reset_n: ts-rst-n {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+	};
+
+	touch_int_n: touch-int-n {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	touch_int_sleep: touch-int-sleep {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+/*
+ * For reasons that are currently unknown (but probably related to fusb301), USB takes about
+ * 6 minutes to wake up (nothing interesting in kernel logs), but then it works as it should.
+ */
+&usb3 {
+	status = "okay";
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb3_dwc3 {
+	extcon = <&usb3_id>;
+	dr_mode = "peripheral";
+	phys = <&hsusb_phy1>;
+	phy-names = "usb2-phy";
+	snps,hird-threshold = /bits/ 8 <0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 859fe18aa8c7..2f04a2bc052c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -848,21 +848,21 @@ cci0_default: cci0-default {
 
 			camera0_state_on:
 			camera_rear_default: camera-rear-default {
-				mclk0 {
+				camera0_mclk: mclk0 {
 					pins = "gpio13";
 					function = "cam_mclk";
 					drive-strength = <16>;
 					bias-disable;
 				};
 
-				rst {
+				camera0_rst: rst {
 					pins = "gpio25";
 					function = "gpio";
 					drive-strength = <16>;
 					bias-disable;
 				};
 
-				pwdn {
+				camera0_pwdn: pwdn {
 					pins = "gpio26";
 					function = "gpio";
 					drive-strength = <16>;
@@ -903,14 +903,14 @@ rst {
 
 			camera2_state_on:
 			camera_front_default: camera-front-default {
-				mclk2 {
+				camera2_mclk: mclk2 {
 					pins = "gpio15";
 					function = "cam_mclk";
 					drive-strength = <16>;
 					bias-disable;
 				};
 
-				rst {
+				camera2_rst: rst {
 					pins = "gpio23";
 					function = "gpio";
 					drive-strength = <16>;
@@ -2327,7 +2327,7 @@ usb3: usb@6af8800 {
 			power-domains = <&gcc USB30_GDSC>;
 			status = "disabled";
 
-			dwc3@6a00000 {
+			usb3_dwc3: dwc3@6a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x06a00000 0xcc00>;
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.31.1

