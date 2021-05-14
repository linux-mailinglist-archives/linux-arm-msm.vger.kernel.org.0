Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E59C73807B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 May 2021 12:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhENKvV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 May 2021 06:51:21 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:11029 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhENKvU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 May 2021 06:51:20 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 May 2021 06:51:19 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620989043; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YZVzSPq8R4i4vFhj2RfblJryE1o9GzqXIIZX16Bvw8ezR8Ci7O6aeHNtNOT5TlT6c7
    0dnSDGm/2V+br4ypMGH96P0Y0fjsGtbJdsCSLnElqlkPj6qgnJlvBK/LMcC43hmrcW5N
    LyCpBnC3aLbf4IdANdZLzZ6RHCGiz2P1wS3Nn0speSkqHlIQ4i0AtZ7tsfMwDW2irhxW
    hcqTArT0E8mtnA9EPr9gOsRFUlAy/+DW/Am3HSX1DgT+Nt8SZp7Yz7qNELY0oCEvMpS2
    /MOCiJwJaQ+JNCx7vDuKC4xo/TG+gzogk2mBB+NaEXBDJ66fKP0FF+t/Qh+ED/fhUDEr
    kP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989043;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dDRkH6tZiQw//M0zZQKuvlWcP5ZN2kmFHH6Pj9vqSVs=;
    b=j2F4LubwwSvVC5u4I/UPe/9afKNXJlnrwrsExJEcBz0MaJ9bh2yObPu8gpPagSTOh9
    uk24TUZA2rGz8p6bzw78p3zaorpuGX/pH9MuokMf37dH6iDnH3s/Vhod+4QwMkazCrrb
    IGhC7bjARmkSJ5UhuL+U2Mb4yjhcICO3FNH8gPWHaWw3Zs4TNpxDtzpg1JpF1y3qVCoF
    8yC4f2mxmM1hxTQCfB08gCowzwol0ZoU2zRnm+isfh1Jw4q4iA3qog5m3NVdBAtIw8k+
    u9IUv6Rhq34bdv1lzWgEupBHUwOezDrGgTDiMmn6cHZIbVVRZ7lN5j+3VeXMNKlRjybM
    OfVA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620989043;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=dDRkH6tZiQw//M0zZQKuvlWcP5ZN2kmFHH6Pj9vqSVs=;
    b=Fjcy4rNPgh+KcnhPmzEQ6cFcQFEksdovZ4/sW4mek4V18XEqvhlaunEkAa5BknQUzX
    TYbT4PUHH38Trg4QClFFEMAcaOcSx2Pt7/eDMUJ04BZ/wbUJG2cLz+HonjKLXze+qpvF
    DZDuROmcGwiQObZopKhLhus28vyNbfr7X5525kGADU48V6GlJcU4RrJonILjMFrZIYfh
    xdTKCBJCTQwYMWfDAytbkwdTuMx449B90/MgrgA58m9BF2lwHkYxmHXK+2V17ERhTdX+
    DibSeRLnwdKLo7E+O+hdXXxSglPa799fwuBSA6akraLe0yed8OVr1uHptg9EqpChncQi
    t4Mg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6OWA=="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.7 SBL|AUTH)
    with ESMTPSA id j06c13x4EAi3Fyk
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 14 May 2021 12:44:03 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/5] arm64: dts: qcom: msm8916: Add device tree for Huawei Ascend G7
Date:   Fri, 14 May 2021 12:43:24 +0200
Message-Id: <20210514104328.18756-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Huawei Ascend G7 is a smartphone from Huawei based on MSM8916.
It's fairly similar to the other MSM8916 devices, the only notable
exception are the "cd-gpios" for detecting if a SD card was inserted:
It looks like Huawei forgot to re-route this to gpio38, so the correct
GPIO seems to be gpio56 on this device.

Note: The original firmware from Huawei can only boot 32-bit kernels.
To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
with EDL, e.g. taken from the DragonBoard 410c. This works because Huawei
forgot to set up (firmware) secure boot for some reason.

Also note that Huawei no longer provides bootloader unlock codes.
This can be bypassed by patching the bootloader from a custom HYP firmware,
making it think the bootloader is unlocked. I use a modified version of
qhypstub [1], that patches a single instruction in the Huawei bootloader.

The device tree contains initial support for the Huawei Ascend G7 with:
  - UART (untested, probably available via some test points)
  - eMMC/SD card
  - Buttons
  - Notification LED (combination of 3 GPIO LEDs)
  - Vibrator
  - WiFi/Bluetooth (WCNSS)
  - USB

[1]: https://github.com/msm8916-mainline/qhypstub

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts | 279 ++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 456502aeee49..c894de19654e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-huawei-g7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
new file mode 100644
index 000000000000..d67aa7dd4a21
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2021 Stephan Gerhold
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/*
+ * Note: The original firmware from Huawei can only boot 32-bit kernels.
+ * To boot arm64 kernels it is necessary to flash 64-bit TZ/HYP firmware
+ * with EDL, e.g. taken from the DragonBoard 410c. This works because Huawei
+ * forgot to set up (firmware) secure boot for some reason.
+ *
+ * Also note that Huawei no longer provides bootloader unlock codes.
+ * This can be bypassed by patching the bootloader from a custom HYP firmware,
+ * making it think the bootloader is unlocked.
+ *
+ * See: https://wiki.postmarketos.org/wiki/Huawei_Ascend_G7_(huawei-g7)
+ */
+
+/ {
+	model = "Huawei Ascend G7";
+	compatible = "huawei,g7", "qcom,msm8916";
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
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_leds_default>;
+
+		led-0 {
+			gpios = <&msmgpio 8 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_INDICATOR;
+		};
+
+		led-1 {
+			gpios = <&msmgpio 9 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_INDICATOR;
+		};
+
+		led-2 {
+			gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_INDICATOR;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpio = <&msmgpio 117 GPIO_ACTIVE_HIGH>;
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
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdhc2_cd_default>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdhc2_cd_default>;
+
+	/*
+	 * The Huawei device tree sets cd-gpios = <&msmgpio 38 GPIO_ACTIVE_HIGH>.
+	 * However, gpio38 does not change its state when inserting/removing the
+	 * SD card, it's just low all the time. The Huawei kernel seems to use
+	 * polling for SD card detection instead.
+	 *
+	 * However, looking closer at the GPIO debug output it turns out that
+	 * gpio56 switches its state when inserting/removing the SD card.
+	 * It behaves just like gpio38 normally does. Usually GPIO56 is used as
+	 * "UIM2_PRESENT", i.e. to check if a second SIM card is inserted.
+	 * Maybe Huawei decided to replace the second SIM card slot with the
+	 * SD card slot and forgot to re-route to gpio38.
+	 */
+	cd-gpios = <&msmgpio 56 GPIO_ACTIVE_LOW>;
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
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
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
+		pins = "gpio107";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	gpio_leds_default: gpio-leds-default {
+		pins = "gpio8", "gpio9", "gpio10";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sdhc2_cd_default: sdhc2-cd-default {
+		pins = "gpio56";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb_id_default: usb-id-default {
+		pins = "gpio117";
+		function = "gpio";
+
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
-- 
2.31.1

