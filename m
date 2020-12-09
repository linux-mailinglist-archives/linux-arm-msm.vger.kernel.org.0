Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EA12D448E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 15:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733043AbgLIOlx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 09:41:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733041AbgLIOlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 09:41:51 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339C1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 06:41:11 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id s2so1026017plr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=73X2CuRUpRA37yWB8Fa6iuSxWZoiMyfWXmcQ5R+EahQ=;
        b=IUICo7vE4xF3XuP8hxebaHzfHR45vwnryrykiMCV+pb3Eb6wAuyb27WKCssLOLlWVt
         i7TXJQdJmIMkzcRgOCgfyYk61x8cgHcuORK67Od3XM5NhKvqsFynqstL6sVbesiiCeit
         1v/gghSGRVUh4TDyZEgOdU8pkONNsPUeQttbZ7+mzAphZk+cOmDQHfACyXQpg6yFdvf4
         X/66tsGxXO9TM5y5qmzWiqMy4MPaVFky4wzLaVMfwpki1Gcy5IFC3wtqmXY+Blueo/QA
         fDCI+MqxZngjEXhybTqhXRPYnvKevWvX2BcHSx44vxGmPa2IHxdTtgckxO9z7cnap3qJ
         2f8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=73X2CuRUpRA37yWB8Fa6iuSxWZoiMyfWXmcQ5R+EahQ=;
        b=KDesCiFleU5gWngBK/fiUWUMQmZZGPYWMD1rMd0MhKzComnBiyObyKdekQcdn1uPFG
         iiyFP0gMHElxdMbt0OucwAfjIdUoRmMBo3xhSACUhz1+IUohhhGAcilXdo3+Uu69GMdG
         JuSgSKZbQsiQINBGK+EkO7/LAXx8RkDM29wmEvOdMtjkliwGfwwM7pLBINQ8n3vTr8v7
         +b8muQgjz4e4DbiFekAddPOeoF48V51y4cjLVD/lO95yY3BtOLGDifVocfaVwf/amMBr
         EVMPkv1imgUXkAyM0xANnTuzch7Ay1giTeDw4rbT/osiQIppSSrIb00ba4Acsz+h95vG
         VGhw==
X-Gm-Message-State: AOAM5339/snzIDMYmqV9bES5fzcXhi4fB/sOMI/+1fAsxS81arGIHpvh
        +r35sBMW7E792g9KZg85UXY=
X-Google-Smtp-Source: ABdhPJz1bOThm7C2MLK9ge3VbAUlRvpxCxHr5QDpGJulc7Pei90bPQTXtiK91gwD39SSjbqKItEeTQ==
X-Received: by 2002:a17:90a:520e:: with SMTP id v14mr2525529pjh.9.1607524870791;
        Wed, 09 Dec 2020 06:41:10 -0800 (PST)
Received: from localhost.localdomain ([117.242.203.227])
        by smtp.googlemail.com with ESMTPSA id l70sm2871267pgd.79.2020.12.09.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 06:41:10 -0800 (PST)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH v2] arm64: dts: qcom: Add device tree for ASUS Zenfone 2 Laser
Date:   Wed,  9 Dec 2020 20:07:44 +0530
Message-Id: <20201209143743.7383-1-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <X8/7x2uSE4/6MGNM@builder.lan>
References: <X8/7x2uSE4/6MGNM@builder.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ASUS Zenfone 2 Laser Z00L is a smartphone based on MSM8916 SoC
released on 2015.

Add a device tree for Z00L with initial support for:
  - SDHCI (internal storage)
  - USB Device Mode
  - UART
  - Regulators

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 Changes in v2:
  - Arrange nodes in alphabetical order
  - Add Wifi node
  - Add GPIO Keys
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 195 ++++++++++++++++++
 2 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5113fac80b7a..6a4be237f344 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
new file mode 100644
index 000000000000..cee451e59385
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/dts-v1/;
+
+#include "msm8916-pm8916.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Asus Zenfone 2 Laser";
+	compatible = "asus,z00l", "qcom,msm8916";
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
+			debounce-interval = <15>;
+		};
+
+		volume-down {
+			label = "Volume Down";
+			gpios = <&msmgpio 117 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+	};
+
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_id_default>;
+	};
+};
+
+&blsp1_uart2 {
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
+	gpio_keys_default: gpio-keys-default {
+		pins = "gpio107", "gpio117";
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
2.29.2

