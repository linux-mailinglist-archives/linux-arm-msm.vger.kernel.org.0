Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AD4E18181E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 13:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbgCKMfR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 08:35:17 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40465 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729423AbgCKMfO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 08:35:14 -0400
Received: by mail-wr1-f65.google.com with SMTP id p2so2390197wrw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EsLey6y6SKlRjbgkIy31jgpCjMbbEJbmH2TS7XD1nHc=;
        b=mWiG+P2pZRLmizuh34OhP27MX0SBZMGPPLs/YPdMWgllcaWklbh7guy+08eWuXJxUs
         /Ipa746mPKuK+LfdBgdCATUcP++GWjeRDVtWby9q6vrnLC3u8J3gz1p9ZzHgjR3wNjpi
         q0UScWG0vPv/cXxV04mA2UVSBScF+okNEXCzyP//2YejVgmnuaGvOS9Nu7QX1dzbziUM
         qn8Ei1PCD4Kuj+vXVgwK2QHlxknkWkfo6IyW/IkKBAfrj69PeeefnDH4g8BF253gwr0q
         4ezC/kATL6VKJuEb55xEHxFeYYbe5+1+tpRTvFU3I3CuDZ8l1SSkvDVTW44s8MUVqlFY
         uckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EsLey6y6SKlRjbgkIy31jgpCjMbbEJbmH2TS7XD1nHc=;
        b=jlrnfHLHhOXrKRnU5d3mCT6HbYKmIecsY2Fq9fX+3ImmXJpG5SkCirnxjVHWv7R0PY
         H7KD3J4vBe14OrbsdN43E10V6riCXE4ruLZTEsmsbURIUIOBxsc6YcLA1EMZ+s3LsGwu
         t1tpyY1aCY+CtePS95ATlaJDJjIOsSMa/nTnjPoxbAOfpTKP+8bjqLmBbhXDh1cc6CK5
         7vxtm67e69V5je0RPqqgyGZKsxC4ZZ+U29jyCs05qPue1t0q/NJMmUsXjAQuLRKRixF3
         QDHWiPA3KMuvIU+Jl9ZnhJwFff/x+Frhi17YQMs51nc6W5HEf86Strztd91Vg5sUT+dh
         43VQ==
X-Gm-Message-State: ANhLgQ3H8YtxSiMeQOnbUNX/JkbXZk4r0y4WuDikc7K8JdqNR+G3mv9g
        gjyxy7yI0fsqvmwOPL10zySERA==
X-Google-Smtp-Source: ADFU+vsLDiiJL2pTGClrrfzghrj2bi6GXYebxKsoYlZUpQHtyIgYMG+4GTMEmr09Abr3Us8gL5WUSw==
X-Received: by 2002:adf:b19e:: with SMTP id q30mr4265494wra.163.1583930112809;
        Wed, 11 Mar 2020 05:35:12 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:9087:3e80:4ebc:ae7b])
        by smtp.gmail.com with ESMTPSA id m25sm7822732wml.35.2020.03.11.05.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 05:35:12 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, olof@lixom.net, Anson.Huang@nxp.com,
        maxime@cerno.tech, leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v1 5/6] arm64: dts: sdm845-db845c: Add ov8856 & ov7251 camera nodes
Date:   Wed, 11 Mar 2020 13:35:00 +0100
Message-Id: <20200311123501.18202-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200311123501.18202-1-robert.foss@linaro.org>
References: <20200311123501.18202-1-robert.foss@linaro.org>
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
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 239 +++++++++++++++++++++
 1 file changed, 239 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e8c056d02ace..660550197ce9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -110,6 +110,53 @@
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
+	/* This regulator does not really exits, but a 'vddd-supply' is
+	 * required for the ov7251 driver, but no 'vddd' regulator is used
+	 * in the schematic
+	 */
+	cam3_vddd_1v2: reg_cam3_vddd_1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM3_VDDD_1V2_DUMMY";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		vin-supply = <&vbat>;
+	};
+
 	pcie0_3p3v_dual: vldo-3v3-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "VLDO_3V3";
@@ -406,6 +453,81 @@
 };
 
 &tlmm {
+	pcie0_default_state: pcie0-default {
+		clkreq {
+			pins = "gpio36";
+			function = "pci_e0";
+			bias-pull-up;
+		};
+
+		reset-n {
+			pins = "gpio35";
+			function = "gpio";
+
+			drive-strength = <2>;
+			output-low;
+			bias-pull-down;
+		};
+
+		wake-n {
+			pins = "gpio37";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	cam0_default: cam0_default {
+		mux_rst {
+			function = "gpio";
+			pins = "gpio9";
+		};
+		config_rst {
+			pins = "gpio9";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		mux_mclk0 {
+			function = "cam_mclk";
+			pins = "gpio13";
+		};
+		config_mclk0 {
+			pins = "gpio13";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	cam3_default: cam3_default {
+			mux_rst {
+				function = "gpio";
+				pins = "gpio21";
+			};
+			config_rst {
+				pins = "gpio21";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			mux_mclk3 {
+				function = "cam_mclk";
+				pins = "gpio16";
+			};
+			config_mclk3 {
+				pins = "gpio16";
+				drive-strength = <16>;
+				bias-disable;
+			};
+	};
+
+	lt9611_irq_pin: lt9611-irq {
+		pins = "gpio84";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie0_pwren_state: pcie0-pwren {
 		pins = "gpio90";
 		function = "gpio";
@@ -612,8 +734,125 @@
 		"PM845_GPIO24",
 		"OPTION2",
 		"PM845_SLB";
+
+	cam0_dvdd_1v2_en_default: cam0_dvdd_1v2_en_pinctrl {
+		pins = "gpio12";
+		function = "normal";
+
+		bias-pull-up;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+	};
+
+	cam0_avdd_2v8_en_default: cam0_avdd_2v8_en_pinctrl {
+		pins = "gpio10";
+		function = "normal";
+
+		bias-pull-up;
+		drive-push-pull;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+	};
 };
 
 &cci {
 	status = "ok";
+
+	i2c-bus@0 {
+		cam0@10 {
+			compatible = "ovti,ov8856";
+
+			/* The Qualcomm RB3 camera mezzanine schematic lists
+			 * 0x20 as I2C address of this device, but the Linux
+			 * kernel documentation lists 0x10 I2C address.
+			 */
+			reg = <0x10>;
+
+			// CAM0_RST_N
+			reset-gpios = <&tlmm 9 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam0_default>;
+			gpios = <&tlmm 13 0>,
+				<&tlmm 9 0>;
+
+			clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+			clock-names = "xvclk";
+			clock-frequency = <19200000>;
+
+
+			/* The &vreg_s4a_1p8 trace is powered on as a
+			 * part of the TITAN_TOP_GDSC power domain.
+			 * So it is represented by a fixed regulator.
+			 *
+			 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
+			 * both have to be enabled through the power management
+			 * gpios.
+			 */
+			power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+			dovdd-supply = <&vreg_lvs1a_1p8>;
+			avdd-supply = <&cam0_avdd_2v8>;
+			dvdd-supply = <&cam0_dvdd_1v2>;
+
+			/* No camera mezzanine by default */
+			status = "ok";
+
+			port {
+				ov8856_ep: endpoint {
+					clock-lanes = <1>;
+					link-frequencies = /bits/ 64
+						<360000000 180000000>;
+					data-lanes = <1 2 3 4>;
+//					remote-endpoint = <&csiphy0_ep>;
+				};
+			};
+		};
+	};
+
+	i2c-bus@1 {
+		cam3@60 {
+			compatible = "ovti,ov7251";
+
+			// I2C address as per ov7251.txt linux documentation
+			reg = <0x60>;
+
+			// CAM3_RST_N
+			enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&cam3_default>;
+			gpios = <&tlmm 16 0>,
+				<&tlmm 21 0>;
+
+			clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+			clock-names = "xclk";
+			clock-frequency = <24000000>;
+
+			/* The &vreg_s4a_1p8 trace is powered on as a
+			 * part of the TITAN_TOP_GDSC power domain.
+			 * So it is represented by a fixed regulator.
+			 *
+			 * The 2.8V vdda-supply regulator is enabled when the
+			 * vreg_s4a_1p8 trace is pulled high.
+			 * It too is represented by a fixed regulator.
+			 *
+			 * No 1.2V vddd-supply regulator is used, a fixed
+			 * regulator represents it.
+			 */
+			power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+			vdddo-supply = <&vreg_lvs1a_1p8>;
+			vdda-supply = <&cam3_avdd_2v8>;
+			vddd-supply = <&cam3_vddd_1v2>;
+
+			/* No camera mezzanine by default */
+			status = "ok";
+
+			port {
+				ov7251_ep: endpoint {
+					clock-lanes = <1>;
+					data-lanes = <0 1>;
+//					remote-endpoint = <&csiphy3_ep>;
+				};
+			};
+		};
+	};
 };
-- 
2.20.1

