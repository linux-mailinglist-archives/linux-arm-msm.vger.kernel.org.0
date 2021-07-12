Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25C73C5D72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbhGLNmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 09:42:24 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:14144 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231891AbhGLNmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 09:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626097166;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=HUSaL/wEM46QJuN5B0ihwBlV8QNJ6fExqFTlEQxtNFY=;
    b=oYAiGuyYYJm/H31U/o8wmyIyfj3R61TxqDl+8nm48h8fHIjsX7t9dwIskTPcNx1c6g
    wMh7Nn58aWHOsczGd9Z7RceVi7RaOTrinDAa9FpyQ+IJXFQzqpLO5XVqP7ENMmfLSIhr
    k11hW2C+TukQ3BM925hN61Wu57ue2qBXK6dacRAUPBcjGSvvonQ/5XectVz4m7wbHTRe
    2kk6f3bo8q2S4cqwDhgHHjRcKSMEbXx0AZ8kdPeDJrPQzVC5ZDqdrkzxUJ6XLJoCh5FB
    6wUW9R5PfimAqqSuBmafypVq2/rFf698gqdK3N8UiCkQpXcNWJ4gJOTBppyB7gqSv2mt
    1YnA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB426L3OY="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id Y070ccx6CDdQ9tW
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 12 Jul 2021 15:39:26 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/4] arm64: dts: qcom: Add device tree for Xiaomi Redmi 2 (wingtech-wt88047)
Date:   Mon, 12 Jul 2021 15:37:32 +0200
Message-Id: <20210712133735.318250-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Xiaomi Redmi 2 is a MSM8916 smartphone that was made by Wingtech
(codename: wt88047). It's fairly similar to the other MSM8916 devices.

The device tree contains initial support for the Xiaomi Redmi 2 with:
  - UART (untested, probably available via some test points)
  - eMMC/SD card
  - Buttons
  - Vibrator
  - WiFi/Bluetooth (WCNSS)
  - USB

Note that the Xiaomi Redmi 2 is available in variants with different
names (e.g. Redmi 2 Prime, Redmi 2 Pro, ...). As far as I know the main
difference between those is the amount of RAM and supported LTE bands.
This difference is automatically handled by bootloader/modem firmware
so there is no need for separate device trees.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
The reason this is GPL-2.0-only instead of BSD is the same as for
huawei-g7, see https://lore.kernel.org/linux-arm-msm/YMIznk4scPv1qOzP@gerhold.net/
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/msm8916-wingtech-wt88047.dts     | 208 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4f0597091976..a571bfdddd61 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
new file mode 100644
index 000000000000..5ee35a9b7dc6
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dts
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2020 Stephan Gerhold
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Xiaomi Redmi 2 (Wingtech WT88047)";
+	compatible = "wingtech,wt88047", "qcom,msm8916";
+
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
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
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_id_default>;
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
+};
+
+&usb {
+	status = "okay";
+	extcon = <&usb_id>, <&usb_id>;
+};
+
+&usb_hs_phy {
+	extcon = <&usb_id>;
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
+		regulator-min-microvolt = <2950000>;
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
+		regulator-min-microvolt = <2800000>;
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
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	usb_id_default: usb-id-default {
+		pins = "gpio110";
+		function = "gpio";
+
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
-- 
2.32.0

