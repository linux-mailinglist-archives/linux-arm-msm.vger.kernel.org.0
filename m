Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 197711A22AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbgDHNK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:10:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39814 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729081AbgDHNKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:10:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id y24so1316751wma.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2020 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qat0qCK/sNaiO1XJkN821ruUc56J0U4eHBjYp57aVnw=;
        b=F/eqBDnWMTYkcbEmw5D4RotdyaUnJw6T+Vd/EspDeSxIOgoVLnh21s2NwIMjFxhr7h
         LdCXgZSQ7bgGw9e5ycracYGqAkeQsl5pU704RTWtpx0TD5V6/Dtt7pqLMl7lvRl7ytHH
         AkC7hWvICTg6DppD/PlFZZYHs23nEumJeVWFh69XRf4XXfiDtimVDpp0qYfzX194suoa
         fgdYu8P8n0dfV0c0u4O/0+E6aM5FJJnx8/f3QD/Pb1xymQmt3HFLT5+7S34K3/5Ty7j4
         0R2X6ZENpKgdaSa9v35sJtywCfGjiLW1U4A3wKAogDv26DLzH1sDFnRPFPedlgdtS/jr
         R2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qat0qCK/sNaiO1XJkN821ruUc56J0U4eHBjYp57aVnw=;
        b=c0oY8iqmYfATM7OcJIgAPSzxpa/SmrnUSuBeIK6mOtgXZ30/nbouZmdmr2y8AgOdjs
         1mpLZAqZogq6rRY8B4WmUCI6sgHdA7e1WX+moXunkH3dhrcuyGpBRuIPqF/MVcXa1IGL
         2p5+cXDDA325CSut8vwO8HHdi/N6Ui8VjDds5ro5s6sRQYz9fl2AXQck+VmbMNwi8Mjy
         ZohqDT3a2P0e5sf/zhBpn9/Wqai2Ds6K9MnC09bKHDgSnM5Jot19aCqJ468/yEKxuAef
         Wx9SIEk5LF7uxA2xESWBf2z/DTv5t62PeDtErD4NcBBsd2AJo58b/wrSTnCZVzZMmyDz
         RadQ==
X-Gm-Message-State: AGi0PubLwip+mKMHbgEADnmMUKnFTmgl1QruDyCE9f6lwpw54ThME0jj
        R4y70r5T9w7wM6kUG3/lH1VqrA==
X-Google-Smtp-Source: APiQypKjFYEX56XqML9jD0XcsKjVK1yhwdPHvBwzV4QZNzPFcvqo6v98XM7r+hZNdeftaqTcEaeieg==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr3107901wmj.125.1586351453039;
        Wed, 08 Apr 2020 06:10:53 -0700 (PDT)
Received: from localhost.localdomain ([37.120.50.78])
        by smtp.gmail.com with ESMTPSA id f4sm18428044wrp.80.2020.04.08.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 06:10:52 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        leoyang.li@nxp.com, Anson.Huang@nxp.com, olof@lixom.net,
        leonard.crestez@nxp.com, geert+renesas@glider.be,
        marcin.juszkiewicz@linaro.org, valentin.schneider@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v4 5/6] arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
Date:   Wed,  8 Apr 2020 15:09:58 +0200
Message-Id: <20200408130959.2717409-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200408130959.2717409-1-robert.foss@linaro.org>
References: <20200408130959.2717409-1-robert.foss@linaro.org>
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

Changes since v3:
 - Remove GPIOS property from camera nodes
 - Invert ov8856 reset-gpio logic to match driver

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

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 172 +++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 5cd06ab97b9a..87921a8ccf5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -112,6 +112,40 @@ pcie0_1p05v: pcie-0-1p05v-regulator {
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
@@ -440,6 +474,24 @@ &pm8998_gpio {
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
@@ -601,6 +653,42 @@ &spi2 {
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
 	pcie0_default_state: pcie0-default {
 		clkreq {
 			pins = "gpio36";
@@ -898,3 +986,87 @@ pinconf-rx {
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
+		reset-gpios = <&tlmm 9 1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_default>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
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

