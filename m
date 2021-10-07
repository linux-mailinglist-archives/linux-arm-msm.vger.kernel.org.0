Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0336C425ED3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241640AbhJGV1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:27:34 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:59038 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241554AbhJGV11 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:27:27 -0400
Received: from localhost.localdomain (ip-213-127-63-121.ip.prioritytelecom.net [213.127.63.121])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 8CBA0C91C2;
        Thu,  7 Oct 2021 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1633641932; bh=sWk+xj23wI0PKxnlXeVVu9dDXXYY2pME7W1fAJbQNTc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=e7tTMU/6Ts9caGz6ogvtU/W+WpbsSHHXUcyoLOndpJA1yDu6lK53BgBj0D2eepx+X
         CW/oxXgunIkQissN09w9gYxx9lcSH8xftdShgXNLzGSZeHkAsB9fOr/zTItKYR2bGy
         lyL+WBO7OXkFIEOjGmJe9eOMHOYhw6fKh3pIdgwU=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] arm64: dts: qcom: sm7225: Add device tree for Fairphone 4
Date:   Thu,  7 Oct 2021 23:24:38 +0200
Message-Id: <20211007212444.328034-12-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007212444.328034-1-luca@z3ntu.xyz>
References: <20211007212444.328034-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree for the Fairphone 4 smartphone which is based on
Snapdragon 750G (sm7225) which is basically sm6350.

Currently supported are UART, physical buttons (power & volume), screen
(based on simple-framebuffer set up by the bootloader), regulators and
USB.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
v2: improve pinctrl node for volume buttons and add R-b

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 320 ++++++++++++++++++
 2 files changed, 321 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 59ece83abad0..9ed189e9c197 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
new file mode 100644
index 000000000000..8d6fd22873e0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm7225.dtsi"
+#include "pm6350.dtsi"
+
+/ {
+	model = "Fairphone 4";
+	compatible = "fairphone,fp4", "qcom,sm7225";
+
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <434 0x10000>, <459 0x10000>;
+	qcom,board-id = <8 32>;
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "serial0:115200n8";
+
+		framebuffer0: framebuffer@a000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0xa0000000 0 (2340 * 1080 * 4)>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_pin>;
+
+		volume-up {
+			label = "volume_up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pm6350_gpios 2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&apps_rsc {
+	pm6350-rpmh-regulators {
+		compatible = "qcom,pm6350-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vreg_s1a: smps1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_s2a: smps2 {
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <2048000>;
+		};
+
+		vreg_l2a: ldo2 {
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a: ldo3 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4a: ldo4 {
+			regulator-min-microvolt = <352000>;
+			regulator-max-microvolt = <801000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a: ldo5 {
+			regulator-min-microvolt = <1503000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a: ldo6 {
+			regulator-min-microvolt = <1710000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a: ldo7 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a: ldo8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a: ldo9 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a: ldo11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a: ldo12 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a: ldo13 {
+			regulator-min-microvolt = <570000>;
+			regulator-max-microvolt = <650000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a: ldo14 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a: ldo15 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a: ldo16 {
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <921000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a: ldo18 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1049000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l19a: ldo19 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a: ldo20 {
+			regulator-min-microvolt = <530000>;
+			regulator-max-microvolt = <801000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a: ldo21 {
+			regulator-min-microvolt = <751000>;
+			regulator-max-microvolt = <825000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22a: ldo22 {
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm6150l-rpmh-regulators {
+		compatible = "qcom,pm6150l-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vreg_s8e: smps8 {
+			regulator-min-microvolt = <313000>;
+			regulator-max-microvolt = <1395000>;
+		};
+
+		vreg_l1e: ldo1 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <1980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2e: ldo2 {
+			regulator-min-microvolt = <1170000>;
+			regulator-max-microvolt = <1305000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3e: ldo3 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1299000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4e: ldo4 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5e: ldo5 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6e: ldo6 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7e: ldo7 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8e: ldo8 {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9e: ldo9 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10e: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11e: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3401000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <1620000>;
+			regulator-max-microvolt = <5492000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+	};
+};
+
+&pm6350_gpios {
+	gpio_keys_pin: gpio-keys-pin {
+		pins = "gpio2";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-pull-up;
+		input-enable;
+		power-source = <0>;
+	};
+};
+
+&pm6350_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <13 4>, <56 2>;
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	maximum-speed = "super-speed";
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdd-supply = <&vreg_l18a>;
+	vdda-pll-supply = <&vreg_l2a>;
+	vdda-phy-dpdm-supply = <&vreg_l3a>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l22a>;
+	vdda-pll-supply = <&vreg_l16a>;
+};
-- 
2.33.0

