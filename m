Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAC8D5F11DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbiI3Swo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiI3Swm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E8D316649D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f21so1258032lfm.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cnHk8uHFYCfw4ve/C/O7dXjCEjo/oyLeIljmuPpg5iE=;
        b=cMoM0fNkZ4jDuRpU3zYegktduolhlY+VsdWBlXRxTCApNBvfQp3DI+ulpK89OQcJ3I
         FGCubogc7hpThLu3qVpflZJeHO077P7roEOQQeykgC3imMZ5GCYMWfB3d+NrBk5eeSOd
         BH5LoKNyyTl5UA5YkddFc6kUYT2BX2gXnHIVPyqRSP4TzDwaM+pN8fT9cPOcIK8gW7ny
         AmxJWPISBTc9l6qJ6QvGK6kc8V+vFC8SoALZ+x8QpbcTsCw8pOCt4g1TVLf7rbOKGJah
         Smg5zecjFngcsGba0INwwPY5HK1SwWvwmmn0yHji0YAeOZ5xbaYe8lDk6oZhq4btwV/Q
         fl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cnHk8uHFYCfw4ve/C/O7dXjCEjo/oyLeIljmuPpg5iE=;
        b=fesxnxaQJVeqg4uez9ZgEO5LMRp+8/kX7+cVtOJqZ0+EgytaEF5xvwB7r3yI6zMDSZ
         YN9yPPqNYWNEt1gb5y9nPsRoFjw+sdWKDqx8auxyC95Idp7aIEPlE9jt8vgRuVgdRZDo
         WBPExe57rYIYx1VjQ6KMEcYvDbS7naBqIy0EzBDK/tM5TzUpfTSGhmS+diEamCMEJjNx
         iIj7+MdimSomq+qd+9lUSg5gzCSt/LOzgcHyOtSGIIGfEwUTgVRp7IuHV0iX5/oL0lvr
         O7mWpGfxPGfalkJT+7/nnaXYLGPb2vMSb+Px3FGGDDMt+SwmCPBv7Ti++QS2ty+/YY65
         TcSw==
X-Gm-Message-State: ACrzQf3WNKq8j3FcPiWhXArT82WASLZUw+9or/F7FCLYqycpnq06nHKU
        afta4CpgPtYMUutQDznw9MektQ==
X-Google-Smtp-Source: AMsMyM4r3/x2IjmgUoqk1Y5AnF9xd+nZfexESDZ1UJAQWjokQb5Yf4hj6QibvLYj3c8rIrUn+gJ+eg==
X-Received: by 2002:a05:6512:2312:b0:499:e67d:1b52 with SMTP id o18-20020a056512231200b00499e67d1b52mr3635936lfu.305.1664563959187;
        Fri, 30 Sep 2022 11:52:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 02/23] ARM: dts: qcom: apq8064-ifc6410: use labels to patch device tree
Date:   Fri, 30 Sep 2022 21:52:15 +0300
Message-Id: <20220930185236.867655-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
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

Use labels to add device-specific properties to DT nodes rather than
duplicating SoC DT structure in the device DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 525 ++++++++++-----------
 arch/arm/boot/dts/qcom-apq8064.dtsi        |   2 +-
 2 files changed, 255 insertions(+), 272 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index a7f90217661b..50792f06855e 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -58,109 +58,6 @@ hdmi_con: endpoint {
 	};
 
 	soc {
-		pinctrl@800000 {
-			card_detect: card_detect {
-				mux {
-					pins = "gpio26";
-					function = "gpio";
-					bias-disable;
-				};
-			};
-
-			pcie_pins: pcie_pinmux {
-				mux {
-					pins = "gpio27";
-					function = "gpio";
-				};
-				conf {
-					pins = "gpio27";
-					drive-strength = <12>;
-					bias-disable;
-				};
-			};
-		};
-
-		rpm@108000 {
-			regulators {
-				vin_lvs1_3_6-supply = <&pm8921_s4>;
-				vin_lvs2-supply = <&pm8921_s1>;
-				vin_lvs4_5_7-supply = <&pm8921_s4>;
-
-				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
-				vdd_l24-supply = <&pm8921_s1>;
-				vdd_l25-supply = <&pm8921_s1>;
-				vdd_l26-supply = <&pm8921_s7>;
-				vdd_l27-supply = <&pm8921_s7>;
-				vdd_l28-supply = <&pm8921_s7>;
-
-
-				/* Buck SMPS */
-				s1 {
-					regulator-always-on;
-					regulator-min-microvolt = <1225000>;
-					regulator-max-microvolt = <1225000>;
-					qcom,switch-mode-frequency = <3200000>;
-					bias-pull-down;
-				};
-
-				s3 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1400000>;
-					qcom,switch-mode-frequency = <4800000>;
-				};
-
-				s4 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <3200000>;
-				};
-
-				s7 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <3200000>;
-				};
-
-				l3 {
-					regulator-min-microvolt = <3050000>;
-					regulator-max-microvolt = <3300000>;
-					bias-pull-down;
-				};
-
-				l4 {
-					regulator-min-microvolt = <1000000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				l5 {
-					regulator-min-microvolt = <2750000>;
-					regulator-max-microvolt = <3000000>;
-					bias-pull-down;
-				};
-
-				l6 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				l23 {
-					regulator-min-microvolt = <1700000>;
-					regulator-max-microvolt = <1900000>;
-					bias-pull-down;
-				};
-
-				lvs1 {
-					bias-pull-down;
-				};
-
-				lvs6 {
-					bias-pull-down;
-				};
-			};
-		};
-
 		ext_3p3v: regulator-fixed@1 {
 			compatible = "regulator-fixed";
 			regulator-min-microvolt = <3300000>;
@@ -172,211 +69,297 @@ ext_3p3v: regulator-fixed@1 {
 			enable-active-high;
 			regulator-boot-on;
 		};
+	};
+};
 
-		gsbi3: gsbi@16200000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
-			i2c@16280000 {
-				status = "okay";
-			};
-		};
+&gsbi1 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-		gsbi@16300000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
-			/* CAM I2C MIPI-CSI connector */
-			i2c@16380000 {
-				status = "okay";
-			};
-		};
+&gsbi1_i2c {
+	clock-frequency = <200000>;
+	status = "okay";
 
-		gsbi@12440000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
+	eeprom@52 {
+		compatible = "atmel,24c128";
+		reg = <0x52>;
+		pagesize = <32>;
+	};
+};
 
-			i2c@12460000 {
-				status = "okay";
-				clock-frequency = <200000>;
+&gsbi3 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-				eeprom@52 {
-					compatible = "atmel,24c128";
-					reg = <0x52>;
-					pagesize = <32>;
-				};
-			};
-		};
+&gsbi3_i2c {
+	status = "okay";
+};
 
-		gsbi@1a200000 {
-			qcom,mode = <GSBI_PROT_SPI>;
-			status = "okay";
-			spi4: spi@1a280000 {
-				status = "okay";
-				num-cs = <1>;
-				cs-gpios = <&tlmm_pinmux 53 0>;
-			};
-		};
+&gsbi4 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-		gsbi@16500000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_UART_W_FC>;
+/* CAM I2C MIPI-CSI connector */
+&gsbi4_i2c {
+	status = "okay";
+};
 
-			serial@16540000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&gsbi6_uart_4pins>;
-			};
+&gsbi5 {
+	qcom,mode = <GSBI_PROT_SPI>;
+	status = "okay";
+};
+
+&gsbi5_spi {
+	num-cs = <1>;
+	cs-gpios = <&tlmm_pinmux 53 0>;
+	status = "okay";
+};
+
+&gsbi6 {
+	qcom,mode = <GSBI_PROT_UART_W_FC>;
+	status = "okay";
+};
+
+&gsbi6_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi6_uart_4pins>;
+	status = "okay";
+};
+
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
+
+&gsbi7_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi7_uart_2pins>;
+	status = "okay";
+};
+
+&hdmi {
+	core-vdda-supply = <&pm8921_hdmi_switch>;
+	hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&hdmi_in {
+	remote-endpoint = <&mdp_dtv_out>;
+};
+
+&hdmi_out {
+	remote-endpoint = <&hdmi_con>;
+};
+
+&hdmi_phy {
+	status = "okay";
+	core-vdda-supply = <&pm8921_hdmi_switch>;
+};
+
+&mdp {
+	status = "okay";
+};
+
+&mdp_dtv_out {
+	remote-endpoint = <&hdmi_in>;
+};
+
+&pcie {
+	status = "okay";
+	vdda-supply = <&pm8921_s3>;
+	vdda_phy-supply = <&pm8921_lvs6>;
+	vdda_refclk-supply = <&ext_3p3v>;
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+};
+
+&pm8921_gpio {
+	wlan_default_gpios: wlan-gpios-state {
+		pinconf {
+			pins = "gpio43";
+			function = "normal";
+			bias-disable;
+			power-source = <PM8921_GPIO_S4>;
 		};
+	};
 
-		gsbi@16600000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
-			serial@16640000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&gsbi7_uart_2pins>;
-			};
+	notify_led: nled-state {
+		pinconf {
+			pins = "gpio18";
+			function = "normal";
+			bias-disable;
+			power-source = <PM8921_GPIO_S4>;
 		};
+	};
+};
 
-		sata_phy0: phy@1b400000 {
-			status = "okay";
+&rpm {
+	regulators {
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs2-supply = <&pm8921_s1>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+
+
+		/* Buck SMPS */
+		s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
 		};
 
-		sata0: sata@29000000 {
-			status = "okay";
-			target-supply = <&pm8921_s4>;
+		s3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1400000>;
+			qcom,switch-mode-frequency = <4800000>;
 		};
 
-		/* OTG */
-		usb@12500000 {
-			status = "okay";
-			dr_mode = "otg";
-			ulpi {
-				phy {
-					v3p3-supply = <&pm8921_l3>;
-					v1p8-supply = <&pm8921_l4>;
-				};
-			};
+		s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		usb@12520000 {
-			status = "okay";
-			dr_mode = "host";
-			ulpi {
-				phy {
-					v3p3-supply = <&pm8921_l3>;
-					v1p8-supply = <&pm8921_l23>;
-				};
-			};
+		s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		usb@12530000 {
-			status = "okay";
-			dr_mode = "host";
-			ulpi {
-				phy {
-					v3p3-supply = <&pm8921_l3>;
-					v1p8-supply = <&pm8921_l23>;
-				};
-			};
+		l3 {
+			regulator-min-microvolt = <3050000>;
+			regulator-max-microvolt = <3300000>;
+			bias-pull-down;
 		};
 
-		pci@1b500000 {
-			status = "okay";
-			vdda-supply = <&pm8921_s3>;
-			vdda_phy-supply = <&pm8921_lvs6>;
-			vdda_refclk-supply = <&ext_3p3v>;
-			pinctrl-0 = <&pcie_pins>;
-			pinctrl-names = "default";
-			perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+		l4 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
 		};
 
-		qcom,ssbi@500000 {
-			pmic@0 {
-				gpio@150 {
-					wlan_default_gpios: wlan-gpios-state {
-						pinconf {
-							pins = "gpio43";
-							function = "normal";
-							bias-disable;
-							power-source = <PM8921_GPIO_S4>;
-						};
-					};
-
-					notify_led: nled-state {
-						pinconf {
-							pins = "gpio18";
-							function = "normal";
-							bias-disable;
-							power-source = <PM8921_GPIO_S4>;
-						};
-					};
-				};
-			};
+		l5 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
 		};
 
-		amba {
-			/* eMMC */
-			sdcc1: mmc@12400000 {
-				status = "okay";
-				vmmc-supply = <&pm8921_l5>;
-				vqmmc-supply = <&pm8921_s4>;
-			};
+		l6 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
 
-			/* External micro SD card */
-			sdcc3: mmc@12180000 {
-				status = "okay";
-				vmmc-supply = <&pm8921_l6>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&card_detect>;
-				cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
-			};
-			/* WLAN */
-			sdcc4: mmc@121c0000 {
-				status = "okay";
-				vmmc-supply = <&ext_3p3v>;
-				vqmmc-supply = <&pm8921_lvs1>;
-				mmc-pwrseq = <&sdcc4_pwrseq>;
-			};
+		l23 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			bias-pull-down;
 		};
 
-		hdmi-tx@4a00000 {
-			status = "okay";
+		lvs1 {
+			bias-pull-down;
+		};
 
-			core-vdda-supply = <&pm8921_hdmi_switch>;
+		lvs6 {
+			bias-pull-down;
+		};
+	};
+};
 
-			hpd-gpios = <&tlmm_pinmux 72 GPIO_ACTIVE_HIGH>;
+&sata_phy0 {
+	status = "okay";
+};
 
-			ports {
-				port@0 {
-					endpoint {
-						remote-endpoint = <&mdp_dtv_out>;
-					};
-				};
+&sata0 {
+	target-supply = <&pm8921_s4>;
+	status = "okay";
+};
 
-				port@1 {
-					endpoint {
-						remote-endpoint = <&hdmi_con>;
-					};
-				};
-			};
-		};
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
 
-		hdmi-phy@4a00400 {
-			status = "okay";
+/* External micro SD card */
+&sdcc3 {
+	vmmc-supply = <&pm8921_l6>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&card_detect>;
+	cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
 
-			core-vdda-supply = <&pm8921_hdmi_switch>;
-		};
+/* WLAN */
+&sdcc4 {
+	vmmc-supply = <&ext_3p3v>;
+	vqmmc-supply = <&pm8921_lvs1>;
+	mmc-pwrseq = <&sdcc4_pwrseq>;
+	status = "okay";
+};
 
-		mdp@5100000 {
-			status = "okay";
+&tlmm_pinmux {
+	card_detect: card_detect {
+		mux {
+			pins = "gpio26";
+			function = "gpio";
+			bias-disable;
+		};
+	};
 
-			ports {
-				port@3 {
-					endpoint {
-						remote-endpoint = <&hdmi_in>;
-					};
-				};
-			};
+	pcie_pins: pcie_pinmux {
+		mux {
+			pins = "gpio27";
+			function = "gpio";
+		};
+		conf {
+			pins = "gpio27";
+			drive-strength = <12>;
+			bias-disable;
 		};
 	};
 };
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+&usb_hs3_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l23>;
+};
+
+&usb_hs4_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l23>;
+};
+
+/* OTG */
+&usb1 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb4 {
+	dr_mode = "host";
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 829e197579b9..b6f1ef50fb1e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -884,7 +884,7 @@ l2cc: clock-controller@2011000 {
 			reg = <0x2011000 0x1000>;
 		};
 
-		rpm@108000 {
+		rpm: rpm@108000 {
 			compatible = "qcom,rpm-apq8064";
 			reg = <0x108000 0x1000>;
 			qcom,ipc = <&l2cc 0x8 2>;
-- 
2.35.1

