Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478A4405232
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 14:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352841AbhIIMlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 08:41:53 -0400
Received: from relay01.th.seeweb.it ([5.144.164.162]:37179 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354794AbhIIMjj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 08:39:39 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id F28AD1F999;
        Thu,  9 Sep 2021 14:38:23 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: Add support for MSM8998 F(x)tec Pro1 QX1000
Date:   Thu,  9 Sep 2021 14:38:20 +0200
Message-Id: <20210909123823.368199-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree support for the F(x)tec Pro 1 (QX1000) smartphone;
this is a minimal configuration to boot to serial console.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      | 185 ++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8a0b558c3065..df66eca10478 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -34,6 +34,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-dora.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-kagura.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-sony-xperia-tone-keyaki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-fxtec-pro1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
new file mode 100644
index 000000000000..dc566567f42f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dts
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, AngeloGioacchino Del Regno
+ *                     <angelogioacchino.delregno@somainline.org>
+ */
+
+/dts-v1/;
+
+#include "msm8998-mtp.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	model = "F(x)tec Pro1 (QX1000)";
+	compatible = "fxtec,pro1", "qcom,msm8998";
+	qcom,board-id = <0x02000b 0x10>;
+
+	/*
+	 * Until we hook up type-c detection, we
+	 * have to stick with this. But it works.
+	 */
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&tlmm 38 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-hall-sensors {
+		compatible = "gpio-keys";
+		input-name = "hall-sensors";
+		label = "Hall sensors";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_sensor1_default>;
+
+		hall-sensor1 {
+			label = "Keyboard Hall Sensor";
+			gpios = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+			debounce-interval = <15>;
+			gpio-key,wakeup;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_KEYPAD_SLIDE>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		input-name = "side-buttons";
+		label = "Side buttons";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_pin_a>, <&cam_focus_pin_a>,
+			    <&cam_snapshot_pin_a>;
+		vol-up {
+			label = "Volume Up";
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_VOLUMEUP>;
+			gpio-key,wakeup;
+			debounce-interval = <15>;
+		};
+
+		camera-snapshot {
+			label = "Camera Snapshot";
+			gpios = <&pm8998_gpio 7 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		camera-focus {
+			label = "Camera Focus";
+			gpios = <&pm8998_gpio 8 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		cont_splash_mem: memory@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2000000>;
+			no-map;
+		};
+
+		zap_shader_region: memory@f6400000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf6400000 0x0 0x2000>;
+			no-map;
+		};
+
+		ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xffc00000 0x0 0x100000>;
+			console-size = <0x60000>;
+			ecc-size = <16>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x20000>;
+			record-size = <0x10000>;
+		};
+	};
+};
+
+&mmcc {
+	status = "ok";
+};
+
+&mmss_smmu {
+	status = "ok";
+};
+
+&pm8998_gpio {
+	vol_up_pin_a: vol-up-active {
+		pins = "gpio6";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+
+	cam_focus_pin_a: cam-focus-btn-active {
+		pins = "gpio7";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+
+	cam_snapshot_pin_a: cam-snapshot-btn-active {
+		pins = "gpio8";
+		function = "normal";
+		bias-pull-up;
+		input-enable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_pon {
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		bias-pull-up;
+		debounce = <15625>;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>;
+
+	mdp_vsync_n: mdp-vsync-n {
+		pins = "gpio10";
+		function = "mdp_vsync_a";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
+	hall_sensor1_default: hall-sensor1-def {
+		pins = "gpio124";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+		input-enable;
+	};
+};
+
+&ufshc {
+	status = "ok";
+};
+
+&ufsphy {
+	status = "ok";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+	extcon = <&extcon_usb>;
+};
+
+/* GT9286 analog supply */
+&vreg_l28_3p0 {
+	regulator-min-microvolt = <2800000>;
+	regulator-max-microvolt = <2800000>;
+};
-- 
2.32.0

