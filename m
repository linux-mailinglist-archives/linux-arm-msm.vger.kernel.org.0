Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8828D191581
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 17:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgCXP67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 11:58:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40591 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbgCXP66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 11:58:58 -0400
Received: by mail-wr1-f65.google.com with SMTP id u10so1772589wro.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2020 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DxJPFjv9WpHoZyIcW0HrRQqH/F49BdDjUPzGgWMHbBw=;
        b=CyLW/cZ++8gl1GdbCXZeDnj+de974YB5KGCR52QH1at/nkKWjB7M3oCfW7tgYDmxIF
         4FLHDOKlzJ17V6qmvYx1obc1QHRPxMQxBmw1IP83U627/tNlDDmVFHlxGKqwQ4zwHlRR
         ZPqdO997puQe641efBjSMWBdu15xU+ywTfIO/xipaXMMiRq1vVUzspH+C9f2EX3UsAVs
         z/NUwf6nnQYUxO4aHC0MAmhMWEaCJSclu6hvzQQEeAlHyXqSNLs46upmynH77cpF0yDU
         LpvGz8hE1LHJJYHObQjXsMDZZDf7752adc31hjIN2L6hPz6SzycmLVMxu0fJB7UMgtU0
         rNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DxJPFjv9WpHoZyIcW0HrRQqH/F49BdDjUPzGgWMHbBw=;
        b=fnXpcTC5/lxe+YX02zbHpk6iZfpi5fdZCN+Amf4x/gx5u8xD2SIT3shq0JCrVp2+Cw
         oH0GDc+9tj0g/irzYI06WKQDU1ueb58VgCOunPnNq/8T5Z1IZ0Dd1eEdjOkWYXlzVusm
         7CUfCoOQPaqAIXu0uLlCYzryVw6wD3RzDbxZE9BcQTeK6V1qhH8sVCGeJNpmB07vZv7D
         26F1WSOnxstPR3lyGH+k9UrZ59IeHvXvY5VpDmLrtfjQnHU8Y+M5VqGQw0LjvzrKuvhy
         CdaII1oZYOhNwOzB36ChlSxq8MeXauBgd2YlMsVLiqcp7mjWZd3fPOtZMqWaB5RnHvve
         03Xg==
X-Gm-Message-State: ANhLgQ2vzwoxOkkUDIP89lLtNT9Q7EpLTa9SamWOmZWkSCA22/NA/EUG
        CcaV3y30/qCZgrQK0fmg0mMK+g==
X-Google-Smtp-Source: ADFU+vsK9j0qcU2IQYhxZBMAxoZHwO/OSrvN29BZtEjTYIt7c19G3Oxl2NIqxuVgx5bnB/U2t/+fZA==
X-Received: by 2002:a5d:6847:: with SMTP id o7mr34359873wrw.274.1585065535974;
        Tue, 24 Mar 2020 08:58:55 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:e15d:2127:89a:e5dc])
        by smtp.gmail.com with ESMTPSA id t124sm4993321wmg.13.2020.03.24.08.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 08:58:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        dinguyen@kernel.org, leonard.crestez@nxp.com,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v3 5/6] arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
Date:   Tue, 24 Mar 2020 16:58:41 +0100
Message-Id: <20200324155843.10719-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324155843.10719-1-robert.foss@linaro.org>
References: <20200324155843.10719-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the ov8856 main camera and the ov7251 b/w tracking camera
used on the Qualcomm RB3 kit.

Currently the camera nodes have not yet been attached to an to a
CSI2 endpoint, since no driver currently supports the ISP that the the
SDM845/db845c ships with.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
 - Move cam0_ pinctrls subnodes into the first pm8998_gpio reference
 - Remove accidentally committed &tlmn node subnodes
 - Remove redundant tlmm pinctrl subnodes
 - Fix pinctrl subnode identation
 - Remove accidentally committed &tlmn node subnodes
 - Replace underscores in node names
 - Reference cci i2c buses by labe
 - Change camera node names from camX@YY to camera@YY
 - Remove camera@10 comment about I2C addresses
 - Replace GPIO_ACTIVE_HIGH with 0 in camera nodes
 - Removed extra newline
 - Remove comment about not being available always
 - Disable cameras as CSI driver is missing
 - Fix factual error in comment about vreg_s4a_1p8
 - Remove dummy regulator cam3_vddd_1v2

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index efb0086e2aa1..ed71278196f2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -110,6 +110,40 @@ pcie0_1p05v: pcie-0-1p05v-regulator {
 		// enable-active-high;
 	};
 
+	cam0_dvdd_1v2: reg_cam0_dvdd_1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM0_DVDD_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		enable-active-high;
+		gpio = <&pm8998_gpio 12 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_dvdd_1v2_en_default>;
+		vin-supply = <&vbat>;
+	};
+
+	cam0_avdd_2v8: reg_cam0_avdd_2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM0_AVDD_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		enable-active-high;
+		gpio = <&pm8998_gpio 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_avdd_2v8_en_default>;
+		vin-supply = <&vbat>;
+	};
+
+	/* This regulator is enabled when the VREG_LVS1A_1P8 trace is enabled */
+	cam3_avdd_2v8: reg_cam3_avdd_2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM3_AVDD_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+		vin-supply = <&vbat>;
+	};
+
 	pcie0_3p3v_dual: vldo-3v3-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VLDO_3V3";
@@ -393,6 +427,24 @@ &pm8998_gpio {
 		"OPTION2",
 		"PM845_SLB";
 
+	cam0_dvdd_1v2_en_default: cam0-dvdd-1v2-en {
+		pins = "gpio12";
+		function = "normal";
+
+		bias-pull-up;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+	};
+
+	cam0_avdd_2v8_en_default: cam0-avdd-2v8-en {
+		pins = "gpio10";
+		function = "normal";
+
+		bias-pull-up;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+	};
+
 	vol_up_pin_a: vol-up-active {
 		pins = "gpio6";
 		function = "normal";
@@ -434,6 +486,42 @@ &sdhc_2 {
 };
 
 &tlmm {
+	cam0_default: cam0_default {
+		rst {
+			pins = "gpio9";
+			function = "gpio";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mclk0 {
+			pins = "gpio13";
+			function = "cam_mclk";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	cam3_default: cam3_default {
+		rst {
+			function = "gpio";
+			pins = "gpio21";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mclk3 {
+			function = "cam_mclk";
+			pins = "gpio16";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
 	pcie0_pwren_state: pcie0-pwren {
 		pins = "gpio90";
 		function = "gpio";
@@ -612,6 +700,96 @@ pinconf-rx {
 	};
 };
 
+&pm8998_gpio {
+
+};
+
 &cci {
 	status = "ok";
 };
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+
+		// CAM0_RST_N
+		reset-gpios = <&tlmm 9 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_default>;
+		gpios = <&tlmm 13 0>,
+			<&tlmm 9 0>;
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
+		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+		dovdd-supply = <&vreg_lvs1a_1p8>;
+		avdd-supply = <&cam0_avdd_2v8>;
+		dvdd-supply = <&cam0_dvdd_1v2>;
+
+		status = "disable";
+
+		port {
+			ov8856_ep: endpoint {
+				clock-lanes = <1>;
+				link-frequencies = /bits/ 64
+					<360000000 180000000>;
+				data-lanes = <1 2 3 4>;
+//				remote-endpoint = <&csiphy0_ep>;
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
+		enable-gpios = <&tlmm 21 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam3_default>;
+		gpios = <&tlmm 16 0>,
+			<&tlmm 21 0>;
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
+		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+		vdddo-supply = <&vreg_lvs1a_1p8>;
+		vdda-supply = <&cam3_avdd_2v8>;
+
+		status = "disable";
+
+		port {
+			ov7251_ep: endpoint {
+				clock-lanes = <1>;
+				data-lanes = <0 1>;
+//				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
-- 
2.25.1

