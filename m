Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D46F56FC20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 11:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbfGVJYz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 05:24:55 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:23077 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728834AbfGVJYz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 05:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1563787490;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4vCO8yvKBViJyKZ53fpypJoZxDgJFFFyPBMu+NNRShc=;
        b=GF1NsJzcs9FOtRZCrnEXHs66+vOyRFsrg4/EK3fgkBv77zE0kKQaiitS3AAYcakPkl
        Q9lN7dvQR+luU8puOtZj6CQ+W4OcLeS0n+SB16Xy8lGh5dnmSbH0exXHTTR/LNYS00kk
        HzzgCoGT7geuXP5Psp3BgTcuPcimjIBFQ4I5AaTOnLIjB2+lzbpIIJZToz+1eQLwpoO6
        MwxTdAbZGXFN3UwnobMojmulkCeFj6TNs6xmb5UV3R4LsUiZ6dsTtnI99Q+OPth+Syre
        AxelOCGlBOSwOEwlBEAAmmfjEzMcQ4EJ4B/306xstzocr1b6w5JMcBRG/NvAqSlaEyCc
        CbXg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxP4G6N/EiB"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id m0a13fv6M9OnObz
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 22 Jul 2019 11:24:49 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [RFC PATCH v2 4/4] arm64: dts: qcom: Add device tree for Longcheer L8150
Date:   Mon, 22 Jul 2019 11:22:11 +0200
Message-Id: <20190722092211.100586-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722092211.100586-1-stephan@gerhold.net>
References: <20190722092211.100586-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Longcheer L8150 is a smartphone based on MSM8916 which is
used in several rebrands like the Snapdragon 410
Android One devices or the Wileyfox Swift.

Add a device tree for L8150 with initial support for:
  - SDHCI (internal and external storage)
  - USB Device Mode
  - UART
  - Regulators

Co-developed-by: Nikita Travkin <nikitos.tr@gmail.com>
Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 228 ++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5d725770d9c4..cb2d4de62668 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
new file mode 100644
index 000000000000..2b28e383fd0b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916.dtsi"
+#include "pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Longcheer L8150";
+	compatible = "longcheer,l8150", "qcom,msm8916-v1-qrd/9-v1", "qcom,msm8916";
+
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
+			pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on>;
+			pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+
+			non-removable;
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
+			dr_mode = "peripheral";
+			extcon = <&usb_vbus>;
+
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+
+			ulpi {
+				phy {
+					extcon = <&usb_vbus>;
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
+	// FIXME: Use extcon device provided by charger driver when available
+	usb_vbus: usb-vbus {
+		compatible = "linux,extcon-usb-gpio";
+		vbus-gpio = <&msmgpio 62 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_vbus_default>;
+	};
+};
+
+&msmgpio {
+	usb_vbus_default: usb-vbus-default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio62";
+		};
+		pinconf {
+			pins = "gpio62";
+			bias-pull-up;
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
-- 
2.22.0

