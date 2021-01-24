Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38CE4301C64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 14:57:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbhAXN5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbhAXN5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:02 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6232C061756;
        Sun, 24 Jan 2021 05:56:21 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id 7so9639543wrz.0;
        Sun, 24 Jan 2021 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pxvcpCO85zMxQnOkjIoCHct3c15zWE1fr4RG244k1XA=;
        b=tBXyMZ3rPHENfQKbRS1hACKMVeP15hxQTKDexMZM2SHjovje28/RTIloa9Ik7qebIi
         ibSTv/lCYzQyNvg7DIKHfLUur0SONR0q8xYsoJJ/ldSbGra2KuU/RhPnKjwAdBMPD+eB
         tZtybJOEgwvDSExqubkeZ/Am0IQtVX/GN/2tF9Tjvf2NYT4a0tYNRKYQADSS2uFcKZtk
         nfTWAkEbZfFZRqi4osoixtt+0L0uzuszm9JmL8cAuoDbz0JeUpBGMV5HetxMQ5jOg7Q5
         Atgyvvua+MCB6ypU5ibcqWsLaCf1tPdSBjk9rz8n9G5My+sbDjPdf8DsElk8V/BzBCtm
         RubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pxvcpCO85zMxQnOkjIoCHct3c15zWE1fr4RG244k1XA=;
        b=YEfralb8njZcEv92swyiDSRZ06+CJbuTQPbbOXzVcetL94FBlwOah76kg/KVYzsbXU
         Mr4UesnEAkKjir9lZPbGE95Vk2NK8ZsHrlN/TpCGYcNWNraGg+69r8cMRmRvlujqixvd
         UbNPn2vl1lu75cmlnZhIIGZAmWetmFLt+bc7AGH9XRZdlw2qrCOX93b8P6iRqhQI3KZm
         +IrElRiDiGy1UKviyA63HVpuEnxrGM8TGHeqwX3IkUjIvhqmjK8PpE7NVwWAk/r1Cyma
         lgQ9+VfWux7c0X4z48+M5pN0MRa3e65BH93KoYmEPSrn1b6ykUSMqbZt61M/or4cOY5D
         gHyA==
X-Gm-Message-State: AOAM530Ts/mJvQSWeDMvcWwLA1/Y9STWDPqJNK7eWLD6aqZjUjb7wxdS
        pJr7GjkSgR2qwiDGUwrd3+t54jy/aaYLLA==
X-Google-Smtp-Source: ABdhPJx48Rx7bDwb7oBcgKsgQJURZsV1OPPsLTrxWMLu8cukORz8GT9YpIFyPBh+R+ouv5AIzmrDTA==
X-Received: by 2002:a5d:4389:: with SMTP id i9mr2047965wrq.272.1611496580150;
        Sun, 24 Jan 2021 05:56:20 -0800 (PST)
Received: from jonathan-N53SV.station ([151.81.101.204])
        by smtp.googlemail.com with ESMTPSA id a27sm19658409wrc.94.2021.01.24.05.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:19 -0800 (PST)
From:   Jonathan Albrieux <jonathan.albrieux@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, stephan@gerhold.net,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: Add device tree for BQ Aquaris X5 (Longcheer L8910)
Date:   Sun, 24 Jan 2021 14:54:05 +0100
Message-Id: <20210124135409.5473-2-jonathan.albrieux@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
References: <20210124135409.5473-1-jonathan.albrieux@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BQ Aquaris X5 (Longcheer L8910) is a smartphone using the MSM8916 SoC.

Add device tree with initial support for:

 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART
 - Regulators
 - WiFi/BT
 - Volume buttons
 - Vibrator
 - Touchkeys backlight

This device tree is based on downstream device tree from BQ and from
Longcheer L8915 device tree.

Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts | 230 ++++++++++++++++++
 2 files changed, 231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b5d86739f781..94b76a7ac6ba 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8910.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a5u-eur.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
new file mode 100644
index 000000000000..7d5eff922f41
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "BQ Aquaris X5 (Longcheer L8910)";
+	compatible = "longcheer,l8910", "qcom,msm8916";
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
+		led-0 {
+			gpios = <&msmgpio 17 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_WHITE>;
+			default-state = "off";
+			function = LED_FUNCTION_KBD_BACKLIGHT;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&button_backlight_default>;
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
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
+
+	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
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
+	button_backlight_default: button-backlight-default {
+		pins = "gpio17";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
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
2.17.1

