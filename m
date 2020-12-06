Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E91E2D0644
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Dec 2020 18:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgLFRVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Dec 2020 12:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgLFRVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Dec 2020 12:21:46 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D90C0613D2
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Dec 2020 09:21:06 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id t7so7425973pfh.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Dec 2020 09:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtSHs02j5G+7b1T9yi6g2SC5xrIOhKya6CrvXxmI/xI=;
        b=XZN3C4FkkXYA9IY3fQOpk8FQM8xIxA3BKfZnfrIhFq8oNC901v7IGTLHeY0noWtKQX
         bA3PZS3KE3KiyZf/HwyPaQgp3N3cVH2G/rLp99rt5lKlytsoJ2qgREPekbPocDfB9Oz6
         pKQ5qC7eUjGe8VvdPNAcHjt8Rg/+zZ+tTYm7jI8umg50inpH8fkUIA5kT0hx7PbK2/Rp
         dGXmjUvLHcbw/WjFL6vyP/D8t8s+9n9Rtfnjfu9bJS6Y19ubjeqteOY6LWbYRV6/YzeS
         P2Tl4qtkTSJMC6qvyCK3tEcFshknUNaHi0E2rGp+TNcyTZzTT8/99E0NaopO69Oezsj9
         Miew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtSHs02j5G+7b1T9yi6g2SC5xrIOhKya6CrvXxmI/xI=;
        b=ccpvFhBFDp53RM5PEwTViZWEKcxHkzIaZNpiF76gHlAezdv5ANlIClaS3Ia+UT4LL/
         I5n+S03QiCvNh91SoDyWsiaNb3yjD6yCHWD5En6ZLC76cJ7fk/l1PltyypMViRS1fd9Z
         tgTQR0DY2RZNgco1UvCJ+sqZG+fYzKCLDvEtwGRRdx8xOUrwY7IP7k2U86DBfsEufNnw
         gTeiXgWQ0NVVZX9CWU8jJnl9fbZNk0Cyo4mqLwRWw7UdKSt7Z77SrBXLJ7zaJOIKfrSw
         oGnjaAav5UJZe+dhfmpeiCeM1VXiRZGVJaQa+mfweN8xj+UuBiq+mqSZlRpUmKiD0k+d
         561A==
X-Gm-Message-State: AOAM5307fnlQmk2OOs9CHhavqUVrKPiF37GdWFFeJHSCu4JaCf6WFs9l
        TbBD0bhaSB0QPtCFmyp5zNg=
X-Google-Smtp-Source: ABdhPJwQUadDHly98h9Yz3NEsuUDtI8ntdZhNLcpEHwR2pTrOy8IeGks9HPqtUVFqvihm+yeBTI5Iw==
X-Received: by 2002:a63:f352:: with SMTP id t18mr15501583pgj.57.1607275265766;
        Sun, 06 Dec 2020 09:21:05 -0800 (PST)
Received: from localhost.localdomain ([117.242.200.211])
        by smtp.googlemail.com with ESMTPSA id b12sm4149870pft.114.2020.12.06.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 09:21:05 -0800 (PST)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J . R . Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH] arm64: dts: qcom: Add device tree ASUS Zenfone 2 Laser
Date:   Sun,  6 Dec 2020 22:50:11 +0530
Message-Id: <20201206172011.23610-1-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ASUS Zenfone 2 Laser (Z00L) is a smartphone using the MSM8916
SoC released in 2015.

Add a device tree for Z00L with initial support for:
  - SDHCI (internal storage)
  - USB Device Mode
  - UART (on USB connector via the SM5502 MUIC)
  - Regulators

Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 165 ++++++++++++++++++
 2 files changed, 166 insertions(+)
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
index 000000000000..384f671c07fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -0,0 +1,165 @@
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
+	usb_id: usb-id {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_id_default>;
+	};
+};
+
+
+&blsp1_uart2 {
+	status = "okay";
+};
+
+&blsp_i2c1 {
+	status = "okay";
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
+&sdhc_1 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on>;
+	pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off>;
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

