Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57A17421857
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 22:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhJDUXz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 16:23:55 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:26903 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235949AbhJDUXw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 16:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633378910;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=888nFMWcvrfj90T6Q6xm9ej51dNHQS2mIKNKGw+gxLM=;
    b=nu5KzGk1Zc7OCdX8RuY5rsxuOW80be4c6Z8Fx5MAlge1c+cvNjLqfIqFOwU2VyaCEq
    iWG9qcVCG468YnEmnPN1Z43m79BkDpAZkMV7hnTPTC7OaBmoEIB+dKGI+Xfj3hAUByPw
    Z6nepeXg5N2TO66hU3bTI9ZxMmsx0ezlLJBRJvTZf0LsFR+yG6PgRUOfCtikNmEu65vA
    gMVT0XHpbplO2x9Pq+8dm+MBdmwBlccesz5d9RXL7nc2nA0b2wvpn3CjvVJSv12nIIBp
    3+9DPXgMtRhtA/d0ZVSmYCLij8GuKvboa+sHDjzUifjgce9k7cRX+eBdjC4jZQhgqFc5
    4gNA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KLoKQl
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:21:50 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 01/15] arm64: dts: qcom: Add device tree for Samsung Galaxy S4 Mini Value Edition
Date:   Mon,  4 Oct 2021 22:19:07 +0200
Message-Id: <20211004201921.18526-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy S4 Mini Value Edition is an updated version of the
original S4 Mini based on MSM8916. It is similar to the other Samsung
devices based on MSM8916 with only a few minor differences.

The device tree contains initial support for the S4 Mini Value Edition with:
  - UART
  - eMMC/SD card (needs quirk for some reason)
  - Buttons
  - Vibrator
  - WiFi/Bluetooth (WCNSS)
  - USB

Unfortunately, the S4 Mini VE was released with outdated 32-bit only
firmware and never received any update from Samsung. Since the 32-bit
TrustZone firmware is signed there seems to be no way currently to
actually boot this device tree on arm64 Linux at the moment. :(

However, it is possible to use this device tree by compiling an ARM32 kernel
instead. The device tree can be easily built on ARM32 with an #include
and it works really well there. To avoid confusion for others it is still
better to add this device tree on arm64. Otherwise it's easy to forget
to update this one when making some changes that affect all MSM8916 devices.

Maybe someone finds a way to boot ARM64 Linux on this device at some point.
In this case I expect that this device tree can be simply used as-is.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Add missing word in "FIXME: Disable UHS-I modes" comment
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8916-samsung-serranove.dts    | 301 ++++++++++++++++++
 2 files changed, 302 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8398c0a2150f..6c6efa192a6e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
new file mode 100644
index 000000000000..013f843aff9c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts
@@ -0,0 +1,301 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2019 Stephan Gerhold
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/*
+ * NOTE: The original firmware from Samsung can only boot ARM32 kernels.
+ * Unfortunately, the firmware is signed and cannot be replaced easily.
+ * There seems to be no way to boot ARM64 kernels on this device at the moment,
+ * even though the hardware would support it.
+ *
+ * However, it is possible to use this device tree by compiling an ARM32 kernel
+ * instead. For clarity and build testing this device tree is maintained next
+ * to the other MSM8916 device trees. However, it is actually used through
+ *   arch/arm/boot/dts/qcom-msm8916-samsung-serranove.dts
+ */
+
+/ {
+	model = "Samsung Galaxy S4 Mini Value Edition";
+	compatible = "samsung,serranove", "qcom,msm8916";
+
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	reserved-memory {
+		/* Additional memory used by Samsung firmware modifications */
+		tz-apps@85500000 {
+			reg = <0x0 0x85500000 0x0 0xb00000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys_default>;
+
+		label = "GPIO Buttons";
+
+		volume-up {
+			label = "Volume Up";
+			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+
+		home {
+			label = "Home";
+			gpios = <&msmgpio 109 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOMEPAGE>;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_hall_sensor_default>;
+
+		label = "GPIO Hall Effect Sensor";
+
+		hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&msmgpio 52 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+	};
+
+	i2c-muic {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&muic_i2c_default>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		muic: extcon@14 {
+			compatible = "siliconmitus,sm5504-muic";
+			reg = <0x14>;
+
+			interrupt-parent = <&msmgpio>;
+			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&muic_irq_default>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&pm8916_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
+&pm8916_vib {
+	status = "okay";
+};
+
+&pronto {
+	status = "okay";
+
+	iris {
+		compatible = "qcom,wcn3660b";
+	};
+};
+
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+	non-removable;
+
+	/*
+	 * FIXME: Disable UHS-I modes since tuning fails with:
+	 *
+	 * sdhci_msm 7864900.sdhci: mmc1: No tuning point found
+	 * mmc1: tuning execution failed: -5
+	 * mmc1: error -5 whilst initialising SD card
+	 *
+	 * This is the quirk used on downstream, which suggests this is
+	 * a hardware limitation. However, probing a card using DDR50 works
+	 * (without tuning), so maybe only tuning is broken?
+	 */
+	no-1-8-v;
+};
+
+&usb {
+	status = "okay";
+	extcon = <&muic>, <&muic>;
+};
+
+&usb_hs_phy {
+	extcon = <&muic>;
+};
+
+&smd_rpm_regulators {
+	vdd_l1_l2_l3-supply = <&pm8916_s3>;
+	vdd_l4_l5_l6-supply = <&pm8916_s4>;
+	vdd_l7-supply = <&pm8916_s4>;
+
+	s3 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1300000>;
+	};
+
+	s4 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2100000>;
+	};
+
+	l1 {
+		regulator-min-microvolt = <1225000>;
+		regulator-max-microvolt = <1225000>;
+	};
+
+	l2 {
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	l4 {
+		regulator-min-microvolt = <2050000>;
+		regulator-max-microvolt = <2050000>;
+	};
+
+	l5 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l6 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l7 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	l8 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2900000>;
+	};
+
+	l9 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l10 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
+	l11 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+		regulator-allow-set-load;
+		regulator-system-load = <200000>;
+	};
+
+	l12 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2950000>;
+	};
+
+	l13 {
+		regulator-min-microvolt = <3075000>;
+		regulator-max-microvolt = <3075000>;
+	};
+
+	l14 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l15 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l16 {
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	l17 {
+		regulator-min-microvolt = <2850000>;
+		regulator-max-microvolt = <2850000>;
+	};
+
+	l18 {
+		regulator-min-microvolt = <2700000>;
+		regulator-max-microvolt = <2700000>;
+	};
+};
+
+&msmgpio {
+	gpio_keys_default: gpio-keys-default {
+		pins = "gpio107", "gpio109";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	gpio_hall_sensor_default: gpio-hall-sensor-default {
+		pins = "gpio52";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	muic_i2c_default: muic-i2c-default {
+		pins = "gpio105", "gpio106";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	muic_irq_default: muic-irq-default {
+		pins = "gpio12";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.33.0

