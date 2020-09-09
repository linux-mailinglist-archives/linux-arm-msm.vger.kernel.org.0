Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4F12636D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 21:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIITsv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 15:48:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727055AbgIITsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 15:48:35 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC99C061757
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 12:48:30 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gr14so5344238ejb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zNBe0xvfuz0ZnSPWHDuMp9f1tGMmkEuxpGluLmPvKc8=;
        b=Cw6hH7aitR1WR/65Ex/h19BkDYJqKFdM2+fmqqiCoqjXWXfKERXXSblm3yDRa6lLcp
         Wk0RnJONYpHP5FiCFslRepajtKG4nIXqHoRGFrL4O27DvVQ70QeqSv5MF+O5sq7RjZH+
         cUD7U6STQRbAUWYVTW4X7CJSP51PDuUgwgLfrYTHZJO7HOmrIQ2prtxOLctQbpp2MtSM
         KT3adJo4/q5SfPB1B7wpejjGgembFJBYMrYdPkW4W2niy+HtFgeDYweLrMBv2T9DikIH
         qN41refVFmt3NKJowVcRErcau7OOxGb3ItSD7msUX4y0DldaPY3toCimm681vz7oqRy1
         IRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNBe0xvfuz0ZnSPWHDuMp9f1tGMmkEuxpGluLmPvKc8=;
        b=jSCozAUuZfvtHhNQl0gqQUK/E8UYCScG/eESo3TUx++s6V8OYEhNp4PgIhNHIgypUK
         58bX2npDojCdQm0nf9XTV2RqrdkwMWgLVckZEc+mpeufS/pYCT/UoJVFqXIYxeyMkNGq
         3EVqhDoDCLvpeoTYiLy3tArkVZ+wWRVtQQBLXictmHH03W7blyyWv5HSRPI0C61RIaop
         L5bnrV+1qwKgDWnOhxC0aJeLxt+2ao3RNSD7mtI8PANk1WZVlNhl9gM9qnYOJSebJxb6
         xUtaZ/hywem8mQi4oYqwnwFHwAyOpAo+nvI4wdgT7uC/w4S2QpaZ+JkAAsMIJJL1qg7x
         F7pQ==
X-Gm-Message-State: AOAM533bIpOlKpWi6A4wpYn2Ks/BzNA24MFWbm9jVNipsDgbiJohFawJ
        kNUKwMEKuN59QftcC11X1HkOIw==
X-Google-Smtp-Source: ABdhPJyHhDJe/Y1UHZLy/9vGgGOSqeF+UsMYHWEv1bQ3dUvlOIrXacXR0hRJM6QAd7xU9w+e6zRRQA==
X-Received: by 2002:a17:906:4754:: with SMTP id j20mr5487927ejs.293.1599680908972;
        Wed, 09 Sep 2020 12:48:28 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-133.xnet.hr. [88.207.97.133])
        by smtp.googlemail.com with ESMTPSA id hk14sm3461452ejb.88.2020.09.09.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 12:48:28 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 4/4] arm: dts: add 8devices Habanero DVK
Date:   Wed,  9 Sep 2020 21:48:16 +0200
Message-Id: <20200909194816.3125213-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200909194816.3125213-1-robert.marko@sartura.hr>
References: <20200909194816.3125213-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

8devices Habanero DVK is a dual-band SoM development kit based on Qualcomm
IPQ4019 + QCA8075 platform.

Specs are:
CPU: QCA IPQ4019
RAM: DDR3L 512MB
Storage: 32MB SPI-NOR and optional Parallel SLC NAND(Some boards ship with it and some without)
WLAN1: 2.4 GHz built into IPQ4019 (802.11n) 2x2
WLAN2: 5 GHz built into IPO4019 (802.11ac Wawe-2) 2x2
Ethernet: 5x Gbit LAN (QCA 8075)
USB: 1x USB 2.0 and 1x USB 3.0 (Both built into IPQ4019)
MicroSD slot (Uses SD controller built into IPQ4019)
SDIO3.0/EMMC slot (Uses the same SD controller)
Mini PCI-E Gen 2.0 slot (Built into IPQ4019)
5x LEDs (4 GPIO controllable)
2x Pushbutton (1 is connected to GPIO, other to SoC reset)
LCD ZIF socket (Uses the LCD controller built into IPQ4019 which has no driver support)
1x UART 115200 rate on J18

2x breakout development headers
12V DC Jack for power
DIP switch for bootstrap configuration

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/qcom-ipq4019-habanero-dvk.dts    | 305 ++++++++++++++++++
 2 files changed, 306 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 246d82fc5fcd..004262e0d699 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk04.1-c3.dtb \
 	qcom-ipq4019-ap.dk07.1-c1.dtb \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
+	qcom-ipq4019-habanero-dvk.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
 	qcom-msm8660-surf.dtb \
diff --git a/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
new file mode 100644
index 000000000000..d4236a68fd31
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019-habanero-dvk.dts
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/* Copyright (c) 2019, Robert Marko <robimarko@gmail.com> */
+
+#include "qcom-ipq4019.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/soc/qcom,tcsr.h>
+
+/ {
+	model = "8devices Habanero DVK";
+	compatible = "8dev,habanero-dvk";
+
+	keys {
+		compatible = "gpio-keys";
+
+		reset {
+			label = "reset";
+			gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_RESTART>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led_status: status {
+			label = "habanero-dvk:green:status";
+			gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			panic-indicator;
+		};
+
+		led_upgrade: upgrade {
+			label = "habanero-dvk:green:upgrade";
+			gpios = <&tlmm 40 GPIO_ACTIVE_HIGH>;
+		};
+
+		wlan2g {
+			label = "habanero-dvk:green:wlan2g";
+			gpios = <&tlmm 46 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tpt";
+		};
+
+		wlan5g {
+			label = "habanero-dvk:green:wlan5g";
+			gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy1tpt";
+		};
+	};
+};
+
+&vqmmc {
+	status = "okay";
+};
+
+&sdhci {
+	status = "okay";
+
+	pinctrl-0 = <&sd_pins>;
+	pinctrl-names = "default";
+	cd-gpios = <&tlmm 22 GPIO_ACTIVE_LOW>;
+	vqmmc-supply = <&vqmmc>;
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&tlmm {
+	mdio_pins: mdio_pinmux {
+		mux_1 {
+			pins = "gpio6";
+			function = "mdio";
+			bias-pull-up;
+		};
+
+		mux_2 {
+			pins = "gpio7";
+			function = "mdc";
+			bias-pull-up;
+		};
+	};
+
+	serial_pins: serial_pinmux {
+		mux {
+			pins = "gpio16", "gpio17";
+			function = "blsp_uart0";
+			bias-disable;
+		};
+	};
+
+	spi_0_pins: spi_0_pinmux {
+		pinmux {
+			function = "blsp_spi0";
+			pins = "gpio13", "gpio14", "gpio15";
+			drive-strength = <12>;
+			bias-disable;
+		};
+
+		pinmux_cs {
+			function = "gpio";
+			pins = "gpio12";
+			drive-strength = <2>;
+			bias-disable;
+			output-high;
+		};
+	};
+
+	nand_pins: nand_pins {
+		pullups {
+			pins =  "gpio52", "gpio53", "gpio58", "gpio59";
+			function = "qpic";
+			bias-pull-up;
+		};
+
+		pulldowns {
+			pins = "gpio54", "gpio55", "gpio56", "gpio57",
+				"gpio60", "gpio62", "gpio63", "gpio64",
+				"gpio65", "gpio66", "gpio67", "gpio68",
+				"gpio69";
+			function = "qpic";
+			bias-pull-down;
+		};
+	};
+
+	sd_pins: sd_pins {
+		pinmux {
+			function = "sdio";
+			pins = "gpio23", "gpio24", "gpio25", "gpio26",
+				"gpio28", "gpio29", "gpio30", "gpio31";
+			drive-strength = <10>;
+		};
+
+		pinmux_sd_clk {
+			function = "sdio";
+			pins = "gpio27";
+			drive-strength = <16>;
+		};
+
+		pinmux_sd7 {
+			function = "sdio";
+			pins = "gpio32";
+			drive-strength = <10>;
+			bias-disable;
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
+	cs-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		spi-max-frequency = <24000000>;
+		reg = <0>;
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
+			partition@40000 {
+				label = "MIBIB";
+				reg = <0x00040000 0x00020000>;
+				read-only;
+			};
+			partition@60000 {
+				label = "QSEE";
+				reg = <0x00060000 0x00060000>;
+				read-only;
+			};
+			partition@c0000 {
+				label = "CDT";
+				reg = <0x000c0000 0x00010000>;
+				read-only;
+			};
+			partition@d0000 {
+				label = "DDRPARAMS";
+				reg = <0x000d0000 0x00010000>;
+				read-only;
+			};
+			partition@e0000 {
+				label = "APPSBLENV"; /* uboot env */
+				reg = <0x000e0000 0x00010000>;
+				read-only;
+			};
+			partition@f0000 {
+				label = "APPSBL"; /* uboot */
+				reg = <0x000f0000 0x00080000>;
+				read-only;
+			};
+			partition@170000 {
+				label = "ART";
+				reg = <0x00170000 0x00010000>;
+				read-only;
+			};
+			partition@180000 {
+				label = "cfg";
+				reg = <0x00180000 0x00040000>;
+			};
+			partition@1c0000 {
+				label = "firmware";
+				compatible = "denx,fit";
+				reg = <0x001c0000 0x01e40000>;
+			};
+		};
+	};
+};
+
+/* Some DVK boards ship without NAND */
+&nand {
+	status = "okay";
+
+	pinctrl-0 = <&nand_pins>;
+	pinctrl-names = "default";
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
+&pcie0 {
+	status = "okay";
+
+	perst-gpio = <&tlmm 38 GPIO_ACTIVE_LOW>;
+	wake-gpio = <&tlmm 50 GPIO_ACTIVE_LOW>;
+
+	/* Free slot for use */
+	bridge@0,0 {
+		reg = <0x00000000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+	};
+};
+
+&wifi0 {
+	status = "okay";
+
+	qcom,ath10k-calibration-variant = "8devices-Habanero";
+};
+
+&wifi1 {
+	status = "okay";
+
+	qcom,ath10k-calibration-variant = "8devices-Habanero";
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

