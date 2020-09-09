Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606AB2636F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 21:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgIIT5Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 15:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgIIT4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 15:56:52 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D91C061796
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 12:56:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id b12so3904905edz.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Gg66pi3MvXZIr12COgqvRgMCQp4+Tv92UGPdWGbVRw=;
        b=lRhBIwf4QridhXR0XhTYyH/cCye+U4bv0ohXULGB5bCIAKirXiK4CX8liDEwWLOPvF
         OuZpEA/NvyOoV45Des6uaKQ2Us4FRVEILvfq2eQdTKKQ2wr4nlHjYFkiagzuuuwoIpFJ
         5GwwNGq1Wc3nx+u8BuISSfUMI/sJU3NQUBbfFflUe8oK1TB24lDnY7jYyD3hsZEdjIGM
         LTZlRk7mBNLKTpO8Gh2pRnlBWzihRdKw6fNtqsKmpB/K4Q2JjKKQaHFrXwpZmhwshlOz
         4jE+7H7XqTOzDaN2HTfaT4XVc74pmBJ/dYpFne0KW/7qKM8U6XH/dDSOKfhQllZi++Ds
         6Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Gg66pi3MvXZIr12COgqvRgMCQp4+Tv92UGPdWGbVRw=;
        b=ZPGJvF59chFUHHMRnI8zNaW/XgWMTtruE7rLWfc65464qvTc/E+3PFoke5Bc7OJngT
         E+TDUN5uP2AMfqyWwwSe0XJnA1KDC4xTy1rR61+nmw/Z0wgy99mEDCu8CDVDRsIMS/o8
         jRs20maP0kTpEpPhCjI/gkb1OV914YAHyPw1c/LeWbKpJYSrzFkfkdInHRhcM9SbfwNP
         oia3jtAn0uqIR+n+8FezMGcsg1iQ7xMcWjk5+wIS3ScecOVDbyYDORnI9Ta+58e3nKWu
         1UZ5SHnbXcqMJ3xclOORAG+PNO6XhgPUcq89yV3K6yex9sSjZOZ/KlogsUhYLhmFrJ26
         wfyQ==
X-Gm-Message-State: AOAM532hr1V40fbv5gdSBaGiIPd8ryR4/XosStHCnrMn0UXx/bwflkrE
        wAya3t/7bbvjYRgqOR5eKjomaw==
X-Google-Smtp-Source: ABdhPJzoOPhaXoBgeESP+e4XyEKNLLFqtqrodHpbLQrvsWZXAr9c2tZ4UxWPk1VgXkORTROYgBz4sw==
X-Received: by 2002:aa7:cd90:: with SMTP id x16mr5681315edv.302.1599681409952;
        Wed, 09 Sep 2020 12:56:49 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-133.xnet.hr. [88.207.97.133])
        by smtp.googlemail.com with ESMTPSA id n26sm3510870ejz.89.2020.09.09.12.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 12:56:49 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 2/4] arm: dts: add 8devices Jalapeno
Date:   Wed,  9 Sep 2020 21:56:38 +0200
Message-Id: <20200909195640.3127341-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909195640.3127341-1-robert.marko@sartura.hr>
References: <20200909195640.3127341-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

8devices Jalapeno is a dual-band SoM, based on Qualcomm
IPQ4018 + QCA8072 platform.

Specification:
QCA IPQ4018, Quad core ARM v7 Cortex A7 717MHz
256 MB of DDR3 RAM
8 MB of SPI NOR flash
128 MB of Winbond SPI NAND flash
WLAN1: Qualcomm Atheros QCA4018 2.4GHz 802.11bgn 2:2x2
WLAN2: Qualcomm Atheros QCA4018 5GHz 802.11a/n/ac 2:2x2
ETH: Qualcomm Atheros QCA8072 Gigabit Switch (1 x LAN, 1 x WAN)

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes since v1:
* Drop include that does not exist

 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts | 214 ++++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..9b474208057d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -890,6 +890,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-apq8074-dragonboard.dtb \
 	qcom-apq8084-ifc6540.dtb \
 	qcom-apq8084-mtp.dtb \
+	qcom-ipq4018-jalapeno.dtb \
 	qcom-ipq4019-ap.dk01.1-c1.dtb \
 	qcom-ipq4019-ap.dk04.1-c1.dtb \
 	qcom-ipq4019-ap.dk04.1-c3.dtb \
diff --git a/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
new file mode 100644
index 000000000000..394412619894
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4018-jalapeno.dts
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+// Copyright (c) 2018, Robert Marko <robimarko@gmail.com>
+
+#include "qcom-ipq4019.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "8devices Jalapeno";
+	compatible = "8dev,jalapeno";
+};
+
+&tlmm {
+	mdio_pins: mdio_pinmux {
+		pinmux_1 {
+			pins = "gpio53";
+			function = "mdio";
+		};
+
+		pinmux_2 {
+			pins = "gpio52";
+			function = "mdc";
+		};
+
+		pinconf {
+			pins = "gpio52", "gpio53";
+			bias-pull-up;
+		};
+	};
+
+	serial_pins: serial_pinmux {
+		mux {
+			pins = "gpio60", "gpio61";
+			function = "blsp_uart0";
+			bias-disable;
+		};
+	};
+
+	spi_0_pins: spi_0_pinmux {
+		pin {
+			function = "blsp_spi0";
+			pins = "gpio55", "gpio56", "gpio57";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		pin_cs {
+			function = "gpio";
+			pins = "gpio54", "gpio59";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+};
+
+&watchdog {
+	status = "okay";
+};
+
+&prng {
+	status = "okay";
+};
+
+&blsp_dma {
+	status = "okay";
+};
+
+&blsp1_spi1 {
+	status = "okay";
+
+	pinctrl-0 = <&spi_0_pins>;
+	pinctrl-names = "default";
+	cs-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>, <&tlmm 59 GPIO_ACTIVE_HIGH>;
+
+	flash@0 {
+		status = "okay";
+
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <24000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "SBL1";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+
+			partition@40000 {
+				label = "MIBIB";
+				reg = <0x00040000 0x00020000>;
+				read-only;
+			};
+
+			partition@60000 {
+				label = "QSEE";
+				reg = <0x00060000 0x00060000>;
+				read-only;
+			};
+
+			partition@c0000 {
+				label = "CDT";
+				reg = <0x000c0000 0x00010000>;
+				read-only;
+			};
+
+			partition@d0000 {
+				label = "DDRPARAMS";
+				reg = <0x000d0000 0x00010000>;
+				read-only;
+			};
+
+			partition@e0000 {
+				label = "u-boot-env";
+				reg = <0x000e0000 0x00010000>;
+			};
+
+			partition@f0000 {
+				label = "u-boot";
+				reg = <0x000f0000 0x00080000>;
+				read-only;
+			};
+
+			partition@170000 {
+				label = "ART";
+				reg = <0x00170000 0x00010000>;
+				read-only;
+			};
+		};
+	};
+
+	spi-nand@1 {
+		status = "okay";
+
+		compatible = "spi-nand";
+		reg = <1>;
+		spi-max-frequency = <24000000>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "ubi1";
+				reg = <0x00000000 0x04000000>;
+			};
+
+			partition@4000000 {
+				label = "ubi2";
+				reg = <0x04000000 0x04000000>;
+			};
+		};
+	};
+};
+
+&blsp1_uart1 {
+	status = "okay";
+
+	pinctrl-0 = <&serial_pins>;
+	pinctrl-names = "default";
+};
+
+&cryptobam {
+	status = "okay";
+};
+
+&crypto {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+
+	pinctrl-0 = <&mdio_pins>;
+	pinctrl-names = "default";
+};
+
+&wifi0 {
+	status = "okay";
+
+	qcom,ath10k-calibration-variant = "8devices-Jalapeno";
+};
+
+&wifi1 {
+	status = "okay";
+
+	qcom,ath10k-calibration-variant = "8devices-Jalapeno";
+};
+
+&usb3_ss_phy {
+	status = "okay";
+};
+
+&usb3_hs_phy {
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb2_hs_phy {
+	status = "okay";
+};
+
+&usb2 {
+	status = "okay";
+};
-- 
2.26.2

