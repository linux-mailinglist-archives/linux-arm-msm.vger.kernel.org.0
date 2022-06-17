Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE5FA54F763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381267AbiFQMVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381098AbiFQMVH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:21:07 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707294EF49;
        Fri, 17 Jun 2022 05:21:05 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id o7so8466664eja.1;
        Fri, 17 Jun 2022 05:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZfHe/WIIbJlv6QwbGFZX71x1pgGIES+6X/9rPmCgmA=;
        b=BoO7X/1RaMOe/OcWmUbI+Z2K6lrPZX2Qd1HOro/tRLNZqvQARjlQCRFZhYP0qL+q74
         Dmq3fsjNgv66T0uItzp6ilhIrYE4zvv+RlvWWa/gGdUPPSpa9oB1yiAj4mFAbZTUdd4o
         +b5DXywfetmswggQYmrRpd38LALzXeTvDqtmhCDof/SPVp2UrP/2TVvHKuDHvjk/brqo
         5bKkjk9cqfpy14jPlZU9oDOm7UssCEHBc9fxvB/MbJOM2zzCzAUsUKuVLQPQJgBPOst7
         GDjtlvrUaCyBD2Zi5o/KFhqi2TSSvBmjxSYKOc+4qpURWOLwlQ0faVngQzIy8MnFN/Nv
         0jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZfHe/WIIbJlv6QwbGFZX71x1pgGIES+6X/9rPmCgmA=;
        b=6OJBDKhOl+3yB6mDUQtKROfB7CQD8G55xAKIlF6PxhUT59q0hlXvqaZUZPatXo7eK7
         60YN93QyHuG1V3Z0PVwJhQTtTaWFOxj7UPKdr/nNp0gH/H10sntSghtbWX+Q9BRIRxd3
         +ABgLQKSG7Xn9qWOBaF2EP2SJaF3RCnRghManwAKxHsBA3nUaBijeFxlq+4f5GHrKdeb
         5iArbWYYDJOt88D5s5ttrEUQ5BLiPDFtjYR+/26JxzsIlinHZZNFgH8c3qBW6WDFsOfj
         C8BvPrTHVALtqfUFvR9i4AQFshM2F3ULJy2DYozFi8wjg8zjyhDxjrb2c2QT+QCXL6+q
         k8Ew==
X-Gm-Message-State: AJIora/dfvzuMyJfyZqywKntV2zdwERsA3Moj9L9+Ph6+sozSa3cwT6w
        o52skpDTVbmQCKDD3XDydXQ=
X-Google-Smtp-Source: AGRyM1uYf2rGI+ajVlv64OFovxau4Vw4NNeZ57N8RFcs66N+39+VDLZbYSUB1L5wz3yyFZQhLqZn8Q==
X-Received: by 2002:a17:906:6d98:b0:715:76eb:9e33 with SMTP id h24-20020a1709066d9800b0071576eb9e33mr8769884ejt.729.1655468463764;
        Fri, 17 Jun 2022 05:21:03 -0700 (PDT)
Received: from localhost.localdomain ([46.216.6.174])
        by smtp.googlemail.com with ESMTPSA id c10-20020a170906924a00b006ff045d7c9bsm2113786ejx.173.2022.06.17.05.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:21:03 -0700 (PDT)
From:   Dzmitry Sankouski <dsankouski@gmail.com>
Cc:     dsankouski@gmail.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sagit: add initial device tree for sagit
Date:   Fri, 17 Jun 2022 15:20:05 +0300
Message-Id: <20220617122007.2307726-1-dsankouski@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

New device support - Xiaomi Mi6 phone

What works:
- storage
- wlan
- touchscreen

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8998-xiaomi-sagit.dts    |  12 +
 .../boot/dts/qcom/msm8998-xiaomi-sagit.dtsi   | 628 ++++++++++++++++++
 3 files changed, 641 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2f8aec2cc6db..aa50843dbe12 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-oneplus-dumpling.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
new file mode 100644
index 000000000000..0791615ec5da
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
+
+/dts-v1/;
+
+#include "msm8998-xiaomi-sagit.dtsi"
+
+/ {
+	model = "Xiaomi Mi 6";
+	compatible = "xiaomi,sagit", "qcom,msm8998";
+	qcom,board-id = <30 0>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtsi b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtsi
new file mode 100644
index 000000000000..f2456b833324
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtsi
@@ -0,0 +1,628 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Xiaomi Mi 6 (sagit) device tree source based on msm8998-mtp.dtsi
+ *
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Degdag Mohamed <degdagmohamed@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8998.dtsi"
+#include "pm8005.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+/ {
+	/* Required for bootloader to select correct board */
+	qcom,msm-id = <292 0x20001>; /* 8998 v2.1 */
+
+	reserved-memory {
+		/*
+		 * The following memory regions on downstream are "dynamically allocated"
+		 * but given the same addresses every time. Hard code them as these addresses
+		 * are where the Xiaomi signed firmware expects them to be.
+		 */
+		ipa_fws_region: ipa@f7800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf7800000 0x0 0x5000>;
+			no-map;
+		};
+
+		zap_shader_region: gpu@f7900000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0xf7900000 0x0 0x2000>;
+			no-map;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "Volume buttons";
+		autorepeat;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&vol_up_key_default>;
+
+		vol-up {
+			label = "Volume up";
+			gpios = <&pm8998_gpio 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			wakeup-source;
+		};
+	};
+
+	gpio-hall-sensor {
+		compatible = "gpio-keys";
+		label = "Hall effect sensor";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hall_sensor_default>;
+
+		hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	disp_vddts_vreg: disp_vddts_vreg {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_vddts_vreg";
+		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+};
+
+&mpss_mem {
+	reg = <0x0 0x8d000000 0x0 0x7000000>;
+};
+&venus_mem {
+	reg = <0x0 0x94000000 0x0 0x500000>;
+};
+&mba_mem {
+	reg = <0x0 0x94500000 0x0 0x200000>;
+};
+&slpi_mem {
+	reg = <0x0 0x94700000 0x0 0xf00000>;
+};
+&ipa_fw_mem {
+	reg = <0x0 0x95600000 0x0 0x10000>;
+};
+&ipa_gsi_mem {
+	reg = <0x0 0x95610000 0x0 0x5000>;
+};
+&gpu_mem {
+	reg = <0x0 0x95615000 0x0 0x100000>;
+};
+&wlan_msa_mem {
+	reg = <0x0 0x95715000 0x0 0x100000>;
+};
+
+&blsp1_i2c5 {
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&ts_active>;
+		pinctrl-1 = <&ts_int_suspend &ts_reset_suspend>;
+
+		vdd-supply = <&disp_vddts_vreg>;
+		vio-supply = <&vreg_l6a_1p8>;
+
+		syna,reset-delay-ms = <20>;
+		syna,startup-delay-ms = <20>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			touchscreen-x-mm = <64>;
+			touchscreen-y-mm = <114>;
+			syna,sensor-type = <1>;
+			syna,rezero-wait-ms = <20>;
+		};
+
+		rmi4-f1a@1a {
+			reg = <0x1a>;
+			syna,codes = <KEY_BACK KEY_APPSELECT>;
+		};
+	};
+};
+
+&blsp1_i2c5_sleep {
+	/delete-property/ bias-pull-up;
+	bias-disable;
+};
+
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&blsp1_uart3_on {
+	rx {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-up on 46 (RX). This is needed to
+		 * avoid garbage data when the TX pin of the Bluetooth
+		 * module is in tri-state (module powered off or not
+		 * driving the signal yet).
+		 */
+		bias-pull-up;
+	};
+
+	cts {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-down on 47 (CTS) to match the pull
+		 * of the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+};
+
+&blsp2_uart1 {
+	status = "okay";
+};
+
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
+&pm8998_gpio {
+	vol_up_key_default: vol_up_key_default {
+		pinconf {
+			pins = "gpio6";
+			function = "normal";
+			bias-pull-up;
+			input-enable;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		};
+	};
+
+	audio_mclk_pin: audio-mclk-pin-active {
+		pins = "gpio13";
+		function = "func2";
+		power-source = <0>;
+	};
+};
+
+&qusb2phy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+};
+
+&rpm_requests {
+	pm8998-regulators {
+		compatible = "qcom,rpm-pm8998-regulators";
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
+		vdd_s13-supply = <&vph_pwr>;
+		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
+		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
+		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
+		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
+		vdd_l6-supply = <&vreg_s5a_2p04>;
+		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
+		vdd_l9-supply = <&vreg_bob>;
+		vdd_l10_l23_l25-supply = <&vreg_bob>;
+		vdd_l13_l19_l21-supply = <&vreg_bob>;
+		vdd_l16_l28-supply = <&vreg_bob>;
+		vdd_l18_l22-supply = <&vreg_bob>;
+		vdd_l20_l24-supply = <&vreg_bob>;
+		vdd_l26-supply = <&vreg_s3a_1p35>;
+		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: s3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+		vreg_s4a_1p8: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+		vreg_s5a_2p04: s5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+		vreg_s7a_1p025: s7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+		vreg_l1a_0p875: l1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+		};
+		vreg_l2a_1p2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l5a_0p8: l5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+		vreg_l6a_1p8: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l7a_1p8: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l8a_1p2: l8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l11a_1p0: l11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l13a_2p95: l13 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+		vreg_l14a_1p8: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l17a_1p3: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+		vreg_l18a_2p7: l18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+		vreg_l19a_3p0: l19 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+		vreg_l20a_2p95: l20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+		};
+		vreg_l21a_2p95: l21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+		vreg_l22a_2p85: l22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+		};
+		vreg_l23a_3p3: l23 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l24a_3p075: l24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+		};
+		vreg_l25a_3p3: l25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3312000>;
+		};
+		vreg_l26a_1p2: l26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+		vreg_l28_3p0: l28 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+		vreg_lvs1a_1p8: lvs1 { };
+		vreg_lvs2a_1p8: lvs2 { };
+	};
+
+	pmi8998-regulators {
+		compatible = "qcom,rpm-pmi8998-regulators";
+
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	hall_sensor_default: hall-sensor-default {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		input-enable;
+	};
+	mdss_dsi_active: mdss_dsi_active {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_dsi_suspend: mdss_dsi_suspend {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdss_te_active: mdss_te_active {
+		pins = "gpio10";
+		function = "mdp_vsync_a";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	mdss_te_suspend: mdss_te_suspend {
+		pins = "gpio10";
+		function = "mdp_vsync_a";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_active: ts_active {
+		pins = "gpio89", "gpio125";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		input-enable;
+	};
+
+	ts_reset_suspend: ts_reset_suspend {
+		pins = "gpio89";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_int_suspend: ts_int_suspend {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	nfc_int_active: nfc_int_active {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_int_suspend: nfc_int_suspend {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_enable_active: nfc_enable_active {
+		pins = "gpio12", "gpio116";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	nfc_enable_suspend: nfc_enable_suspend {
+		pins = "gpio12", "gpio116";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-disable;
+	};
+
+	msm_mclk0_default: msm-mclk0-active {
+		pins = "gpio13";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	msm_mclk1_default: msm-mclk1-active {
+		pins = "gpio14";
+		function = "cam_mclk";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cci1_default: cci1-default {
+		pins = "gpio18", "gpio19";
+		function = "cci_i2c";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cci1_default: cci1-default {
+		pins = "gpio19", "gpio20";
+		function = "cci_i2c";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	wcd_int_n: wcd-int-n {
+		pins = "gpio54";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+		input-enable;
+	};
+
+	cdc_reset_n: cdc-reset-n {
+		pins = "gpio64";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <16>;
+		output-high;
+	};
+
+	wsa_leftspk_pwr_n: wsa-leftspk-pwr-n {
+		pins = "gpio65";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+		output-low;
+	};
+
+	wsa_rightspk_pwr_n: wsa-rightspk-pwr-n {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+		output-low;
+	};
+};
+
+&pm8998_pon {
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
+};
+
+&ufshc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vccq-supply = <&vreg_l26a_1p2>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vcc-max-microamp = <750000>;
+	vccq-max-microamp = <560000>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufsphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
+	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
+	vdda-phy-max-microamp = <51400>;
+	vdda-pll-max-microamp = <14600>;
+	vddp-ref-clk-max-microamp = <100>;
+	vddp-ref-clk-always-on;
+};
+
+&usb3 {
+	status = "okay";
+
+	/* Disable USB3 clock requirement as the device only supports USB2 */
+	qcom,select-utmi-as-pipe-clk;
+};
+
+&usb3_dwc3 {
+	/* Drop the unused USB 3 PHY */
+	phys = <&qusb2phy>;
+	phy-names = "usb2-phy";
+
+	/* Fastest mode for USB 2 */
+	maximum-speed = "high-speed";
+
+	/* Force to peripheral until we can switch modes */
+	dr_mode = "peripheral";
+};
+
+&wifi {
+	status = "okay";
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+};
-- 
2.30.2

