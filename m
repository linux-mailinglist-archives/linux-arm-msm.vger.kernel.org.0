Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15E6FC1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 11:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbfGVJYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 05:24:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:25498 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728807AbfGVJYy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 05:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563787490;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=x7zSzTtnhXbrOfyjoC8Na/K20GiIdrTrypCUJlkYR4k=;
        b=fFZpHmmAn6DpAldNReG+1DA50wl6gncRbVWNhLhOLYvjLh9Ku4Gurw3Kxrcm6jKUAw
        h3H6RLCJIiraRETQhx+pZU/hi7VQY4AZqyZXrhjXBwgfwBItCt4xPRHkFuokmwQdgzaF
        hm1JDUvXvwyMQBdnmzXNCVkyxS/O5dhV5CBcuPYSOROSh2r8toeWPQ8ZCDr91s0Im3qk
        doYosUiaxWbnF2u9JMtn3fSmzR0S5K7QiSejTd09dih+99WmFRlxkpKdkgGEVNsgoaEw
        aTMkkiqNfWV8CDxM0vxEj5fzhXtUD+oFzq63xwV3iiGwc+mcQkk5jRN3kWi9cxSy7Khq
        vp7A==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP4G6N/EiB"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv6M9OmOby
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 22 Jul 2019 11:24:48 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: [RFC PATCH v2 3/4] arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U
Date:   Mon, 22 Jul 2019 11:22:10 +0200
Message-Id: <20190722092211.100586-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722092211.100586-1-stephan@gerhold.net>
References: <20190722092211.100586-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Samsung Galaxy A3 (SM-A300FU) and Samsung Galaxy A5 (SM-A500FU)
are smartphones using the MSM8916 SoC released in 2015.

Add a device tree for A3U and A5U with initial support for:
  - SDHCI (internal and external storage)
  - USB Device Mode
  - UART (on USB connector via the SM5502 MUIC)
  - Regulators

The two devices (and all other variants of A3/A5 released in 2015)
are very similar, with some differences in display, touchscreen
and sensors. The common parts are shared in
msm8916-samsung-a2015-common.dtsi to reduce duplication.

The device tree is loosely based on apq8016-sbc.dtsi and the
downstream kernel provided by Samsung, mixed with a lot of own
research.

Co-developed-by: Michael Srba <Michael.Srba@seznam.cz>
Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Remove msm8916-samsung-a2015-common-pins.dtsi, move to main .dtsi
  - Update s4/l17 regulator-max-microvolt, remove regulator-always-on
  - Use muic extcon device for both VBUS/USB-ID in usb@78d9000
  - Move i2c-muic out of soc { ... } node

 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 236 ++++++++++++++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts |  10 +
 4 files changed, 258 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7e5dfce6f7..5d725770d9c4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -3,6 +3,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
new file mode 100644
index 000000000000..e675ff48fdd2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "msm8916.dtsi"
+#include "pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	aliases {
+		serial0 = &blsp1_uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	soc {
+		sdhci@7824000 {
+			status = "okay";
+
+			vmmc-supply = <&pm8916_l8>;
+			vqmmc-supply = <&pm8916_l5>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
+		};
+
+		sdhci@7864000 {
+			status = "okay";
+
+			vmmc-supply = <&pm8916_l11>;
+			vqmmc-supply = <&pm8916_l12>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+			cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
+		};
+
+		serial@78b0000 {
+			status = "okay";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+		};
+
+		usb@78d9000 {
+			status = "okay";
+			extcon = <&muic>, <&muic>;
+
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+
+			ulpi {
+				phy {
+					extcon = <&muic>;
+					v1p8-supply = <&pm8916_l7>;
+					v3p3-supply = <&pm8916_l13>;
+				};
+			};
+		};
+
+		/*
+		 * Attempting to enable these devices causes a "synchronous
+		 * external abort". Suspected cause is that the debug power
+		 * domain is not enabled by default on this device.
+		 * Disable these devices for now to avoid the crash.
+		 *
+		 * See: https://lore.kernel.org/linux-arm-msm/20190618202623.GA53651@gerhold.net/
+		 */
+		tpiu@820000 { status = "disabled"; };
+		funnel@821000 { status = "disabled"; };
+		replicator@824000 { status = "disabled"; };
+		etf@825000 { status = "disabled"; };
+		etr@826000 { status = "disabled"; };
+		funnel@841000 { status = "disabled"; };
+		debug@850000 { status = "disabled"; };
+		debug@852000 { status = "disabled"; };
+		debug@854000 { status = "disabled"; };
+		debug@856000 { status = "disabled"; };
+		etm@85c000 { status = "disabled"; };
+		etm@85d000 { status = "disabled"; };
+		etm@85e000 { status = "disabled"; };
+		etm@85f000 { status = "disabled"; };
+	};
+
+	i2c-muic {
+		compatible = "i2c-gpio";
+		sda-gpios = <&msmgpio 105 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&msmgpio 106 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		muic: sm5502@25 {
+			compatible = "siliconmitus,sm5502-muic";
+
+			reg = <0x25>;
+			interrupt-parent = <&msmgpio>;
+			interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&muic_int_default>;
+		};
+	};
+};
+
+&msmgpio {
+	muic_int_default: muic_int_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio12";
+		};
+		pinconf {
+			pins = "gpio12";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
+
+&smd_rpm_regulators {
+	vdd_l1_l2_l3-supply = <&pm8916_s3>;
+	vdd_l4_l5_l6-supply = <&pm8916_s4>;
+	vdd_l7-supply = <&pm8916_s4>;
+
+	s1 {
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <1300000>;
+	};
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
+	l3 {
+		regulator-min-microvolt = <500000>;
+		regulator-max-microvolt = <1287500>;
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
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
new file mode 100644
index 000000000000..d10f7ac5089f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-a2015-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A3U (EUR)";
+	compatible = "samsung,a3u-eur", "qcom,msm8916";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
new file mode 100644
index 000000000000..1aa59da98495
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-samsung-a2015-common.dtsi"
+
+/ {
+	model = "Samsung Galaxy A5U (EUR)";
+	compatible = "samsung,a5u-eur", "qcom,msm8916";
+};
-- 
2.22.0

