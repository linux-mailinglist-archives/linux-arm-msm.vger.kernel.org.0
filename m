Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2B52D309D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 18:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730463AbgLHRLZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 12:11:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgLHRLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 12:11:21 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C97C061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 09:10:41 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id t7so14463286pfh.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 09:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyci57bhvDwyPP32DT32L1WLm9HFAuvCDl8AiHwbLtk=;
        b=h8IQIj2tOyknLvVYWE1JKckcGjTqJDClZ5KpqKXHibSIQozJBxGCYpoOVwDI1S4UK/
         eUAWJ2vN3J3acE/6XCPRlU80hSBYvpM7fIhUmCWNDqj/XCYeZTxmDvwaMTtUKXPeKMs3
         qNVW6JXQgONJTZw4QDzg+HhyOu/jVUdb3ZTnInIaY9vmhv31UMom9F7ZtwqCSakZYFOQ
         MmpLENXa0tzd51yPleplZKFf3e6oRIq7mHuk7UY481V1bHTUD+ImYbm5ijTB6LAJWHhr
         bfomkjP+wVE7zmr7IxjVtH5aPBhyni2HwmXvey//hVCdo03gaVxOzAYCfT1p+M6k2eGE
         vwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hyci57bhvDwyPP32DT32L1WLm9HFAuvCDl8AiHwbLtk=;
        b=rg1q8XEU1J1IdASllz1C8f4BxzoaTEzHQeeODoeTLTvQyOGumrtElqSyPa869JdexB
         TYrqDIXJ0qv28qYBsbC/Jgm7mK+nJ4qd7+47t+1MrpuW6ArWbHVZf9Scn4/9c4yh9YTi
         D9aBVy8/UaVhAYFZLJH+RYTt0RYynkRQAGlXwqepsfpCvvxyy+rEh1O2fLtyjHsU2kaE
         PNHApbp8WfygoouGxRbBNVEjXSxyXMqOC7rWOK3kYQuOzY/oGAFboN7MSfc4VGQeqyiE
         GlCeE4eMeNvOsLNl6gxvIiOEWAwhnbb1v5gwSBZWsQ9N8ipcfeiGr+LS9m486AvFYvAt
         3kmA==
X-Gm-Message-State: AOAM531t7dtBme5bOY53mqaJJIKc+C63SSfykrA+tFeKxaVzsAZ53MMS
        JR48uecWiss2O6mBKJ2f4ds=
X-Google-Smtp-Source: ABdhPJwo1wtE5xrPseaCrMUPlPzRpA4MENVDj8XxsQVl5vo4VruvwXcIT5nEql7KhjIM4ma0cyJIKg==
X-Received: by 2002:a63:4207:: with SMTP id p7mr23818880pga.287.1607447441238;
        Tue, 08 Dec 2020 09:10:41 -0800 (PST)
Received: from localhost.localdomain ([117.242.200.168])
        by smtp.googlemail.com with ESMTPSA id f9sm7933206pfa.41.2020.12.08.09.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 09:10:40 -0800 (PST)
From:   "J.R. Divya Antony" <d.antony.jr@gmail.com>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org,
        "J.R. Divya Antony" <d.antony.jr@gmail.com>
Subject: [PATCH] arm64: dts: qcom: Add device tree for ASUS Zenfone 2 Laser
Date:   Tue,  8 Dec 2020 22:38:55 +0530
Message-Id: <20201208170855.9189-1-d.antony.jr@gmail.com>
X-Mailer: git-send-email 2.29.2
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
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 160 ++++++++++++++++++
 2 files changed, 161 insertions(+)
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
index 000000000000..c7307a310781
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
@@ -0,0 +1,160 @@
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
+&blsp1_uart2 {
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

