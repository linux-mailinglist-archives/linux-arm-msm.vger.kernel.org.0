Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 987C46206AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 03:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbiKHCTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 21:19:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbiKHCTF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 21:19:05 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2B12D1E1
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 18:18:36 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id h133-20020a1c218b000000b003cf4d389c41so564754wmh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 18:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbaG4r7oZfEBV+jOHjJyrUnGIvwbT4S0Uq1QYQe9Frk=;
        b=ZxdwnkbPXdCjMmjuCMrfpg8wjbg6vn5iCMtj6vBGga90MPxoOu3Rbd8TFHGLxlImvy
         jG+hexUKpCwVbG3kNowbKV6VIG/cXgp6/h5mB0v+iM8S05K21PGdih2u3wizpS9GAQwT
         6tSQR7qEX93WSwOMG7INyN8CKGpqkCm6ZvZeKEA1i2jmbL5qd/vrPyVCEv5UmoYTBo8g
         tGc84jKD7YH1GkXJ1bQsqsibQj/vQ1CM9QT9iCMeHKKTqpaEgNR7EDRhFE6O+R/qZn60
         uecqXf9WflAJ6t0Ns7tIaGw0EcxjjJExmYhQLLQAU4cAdA93lnRrJWYPwEhHJ3qaAneV
         seOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NbaG4r7oZfEBV+jOHjJyrUnGIvwbT4S0Uq1QYQe9Frk=;
        b=wQmGH7Z63McabE0LYDEdRl7jrsNtSMthxNHSX5tFaOMPnpSwsvo9f4zmkjiN+m58Wf
         TuZrj6csA4filk8A9Q9diIksg/i2Ym5wUPr+zCpVnWJqaUhoUHhiZ9mQsYBsImyuqMPi
         PULifUrlf3+HO3IVxLGozcre76hQm/HyPFpFsLk5uSw60iVX0iZsUZfzA62e8XAo9Tqz
         r6sn2FBZXT1QY1BEIYXcTOzVz9q21iKMQYn/3R/4A49CW5AR/9CuXZrXNHi6H9QiCOVt
         eiq4qA/BAsbO16Wfe8bzyClvB6SC3EMQJWIpFV9/pPgFgV2BbEym/rX6WHN8NIVNHypB
         60mg==
X-Gm-Message-State: ACrzQf1jcnOCSGsLjqceTNWFpZ4KZpHC3V6R4XEUle7N2Xat1j/rHd/T
        eUDk+bzvTJcM/adRDzUE+tbATg==
X-Google-Smtp-Source: AMsMyM4QSEF1KeZXrLHhuOpwnoSGOWZr7ZVSuAwEnEZNlnWCmQkCnWoV6iHP+shm1a/9z09e2D4Y1Q==
X-Received: by 2002:a05:600c:33a5:b0:3cf:6fd1:d94b with SMTP id o37-20020a05600c33a500b003cf6fd1d94bmr31697578wmp.52.1667873915302;
        Mon, 07 Nov 2022 18:18:35 -0800 (PST)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d6-20020adfe2c6000000b0022cc6b8df5esm8890354wrj.7.2022.11.07.18.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:18:34 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Date:   Tue,  8 Nov 2022 02:18:16 +0000
Message-Id: <20221108021816.213084-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the dts data for the rb3 navigation mezzanine into its own dts file.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../sdm845-db845c-navigation-mezzanine.dts    | 107 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  99 ----------------
 3 files changed, 108 insertions(+), 99 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78f6e78d8ed4..0b714e9d5de3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -129,6 +129,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
new file mode 100644
index 000000000000..5308f40257c2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "sdm845-db845c.dts"
+
+&cci {
+	status = "okay";
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "ok";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+
+		// CAM0_RST_N
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_default>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+
+		/* The &vreg_s4a_1p8 trace is powered on as a,
+		 * so it is represented by a fixed regulator.
+		 *
+		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
+		 * both have to be enabled through the power management
+		 * gpios.
+		 */
+		dovdd-supply = <&vreg_lvs1a_1p8>;
+		avdd-supply = <&cam0_avdd_2v8>;
+		dvdd-supply = <&cam0_dvdd_1v2>;
+
+		status = "ok";
+
+		port {
+			ov8856_ep: endpoint {
+				link-frequencies = /bits/ 64
+					<360000000 180000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@60 {
+		compatible = "ovti,ov7251";
+
+		// I2C address as per ov7251.txt linux documentation
+		reg = <0x60>;
+
+		// CAM3_RST_N
+		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam3_default>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <24000000>;
+
+		/* The &vreg_s4a_1p8 trace always powered on.
+		 *
+		 * The 2.8V vdda-supply regulator is enabled when the
+		 * vreg_s4a_1p8 trace is pulled high.
+		 * It too is represented by a fixed regulator.
+		 *
+		 * No 1.2V vddd-supply regulator is used.
+		 */
+		vdddo-supply = <&vreg_lvs1a_1p8>;
+		vdda-supply = <&cam3_avdd_2v8>;
+
+		status = "disable";
+
+		port {
+			ov7251_ep: endpoint {
+				data-lanes = <0 1>;
+//				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 8ba3188ac4c3..b22ee5df2eb9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1164,105 +1164,6 @@ &pm8998_gpio {
 
 };
 
-&cci {
-	status = "okay";
-};
-
-&camss {
-	vdda-phy-supply = <&vreg_l1a_0p875>;
-	vdda-pll-supply = <&vreg_l26a_1p2>;
-
-	status = "ok";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			csiphy0_ep: endpoint {
-				data-lanes = <0 1 2 3>;
-				remote-endpoint = <&ov8856_ep>;
-			};
-		};
-	};
-};
-
-&cci_i2c0 {
-	camera@10 {
-		compatible = "ovti,ov8856";
-		reg = <0x10>;
-
-		// CAM0_RST_N
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam0_default>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
-		clock-names = "xvclk";
-		clock-frequency = <19200000>;
-
-		/* The &vreg_s4a_1p8 trace is powered on as a,
-		 * so it is represented by a fixed regulator.
-		 *
-		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
-		 * both have to be enabled through the power management
-		 * gpios.
-		 */
-		dovdd-supply = <&vreg_lvs1a_1p8>;
-		avdd-supply = <&cam0_avdd_2v8>;
-		dvdd-supply = <&cam0_dvdd_1v2>;
-
-		status = "ok";
-
-		port {
-			ov8856_ep: endpoint {
-				link-frequencies = /bits/ 64
-					<360000000 180000000>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&csiphy0_ep>;
-			};
-		};
-	};
-};
-
-&cci_i2c1 {
-	camera@60 {
-		compatible = "ovti,ov7251";
-
-		// I2C address as per ov7251.txt linux documentation
-		reg = <0x60>;
-
-		// CAM3_RST_N
-		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam3_default>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
-		clock-names = "xclk";
-		clock-frequency = <24000000>;
-
-		/* The &vreg_s4a_1p8 trace always powered on.
-		 *
-		 * The 2.8V vdda-supply regulator is enabled when the
-		 * vreg_s4a_1p8 trace is pulled high.
-		 * It too is represented by a fixed regulator.
-		 *
-		 * No 1.2V vddd-supply regulator is used.
-		 */
-		vdddo-supply = <&vreg_lvs1a_1p8>;
-		vdda-supply = <&cam3_avdd_2v8>;
-
-		status = "disable";
-
-		port {
-			ov7251_ep: endpoint {
-				data-lanes = <0 1>;
-//				remote-endpoint = <&csiphy3_ep>;
-			};
-		};
-	};
-};
-
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi0_default {
 	config {
-- 
2.34.1

