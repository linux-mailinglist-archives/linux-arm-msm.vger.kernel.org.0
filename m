Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1675F11E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbiI3Swu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbiI3Swr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0871664A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu25so8204716lfb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MaxFZfwUbuQE/xITzNi8kYb1lFzUkpxVofkl+4xB0Uo=;
        b=LJfsecda9CHNiVaJTAyIijK78rZq5v/n9cOzjVGQO7hcAatYl3nysB2R/HYF8bjdcn
         2Qp22k3rXzEOZHUPjwO6z803349yCrrYT4DC4j0RGvZokgl/14RUAoaTS/tJMWLIR6e0
         nPKSOGikRSOlkxF2vllIWELTiAUR6oZftd3sff+yZDC9N/GCJCS3tVtt0TpSTgXd3laY
         rOCixNknqTEKfPxvcoFykqM8JAf+nSOo5y5NfJLgRqRRe4xAQ9BMXgTE+/uao68gZFnU
         a4gURyfvOHlQzE9VsuwRp+Y0NmvSRmcWM37f4D/ok+65PjxoB31wDuf0Xt2yTt5kPV+0
         gP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MaxFZfwUbuQE/xITzNi8kYb1lFzUkpxVofkl+4xB0Uo=;
        b=ywK0ljyDsA57Zg1taP4VZMI8UFiQkHPq2V3SevKy9EesFJHqIooB+PL1JxCmUTfG8C
         0cfI7N1PlWi6BzLcFO15o24t+eYzbQNtFDxoxvwrgaNavY/sI7Ev9H7AleQwavCbO9S9
         rVTwweaotnb6QOhtFmcPqvV0tup+2BnN0QkBgC84vbNjk44fkVpfWgftQ15CTq1ww353
         ZypFXm047XkFQfJkbqducboohtkffQ7cWAaghPuHoXRi59pcllDNk2IU4TYeZAt6MjD/
         Rb+8zF32JpG2QVV3RclmtQORrWeO4NijHk/KTWkJzkXk9Y7DrcJxMA8E2NZAehfWSUD4
         pR6g==
X-Gm-Message-State: ACrzQf0dk67rNd2qqgRx8OHv9FDzssPH7GhB6kkEJKunEmyV7qdCSl+e
        0zXDX6/PtbckHaIbmbcx++mmhA==
X-Google-Smtp-Source: AMsMyM6QBPIWzRNfN37j9ghVT4GekxPzx7PR2kekRhfoUFxZga/6UVILWHnODbpctFDJhSnaExZmNA==
X-Received: by 2002:a05:6512:1699:b0:4a2:1924:af2a with SMTP id bu25-20020a056512169900b004a21924af2amr709684lfb.491.1664563963485;
        Fri, 30 Sep 2022 11:52:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 08/23] ARM: dts: qcom: apq8064-cm-qs600: use labels to patch device tree
Date:   Fri, 30 Sep 2022 21:52:21 +0300
Message-Id: <20220930185236.867655-9-dmitry.baryshkov@linaro.org>
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
 arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 372 ++++++++++----------
 1 file changed, 183 insertions(+), 189 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
index 529629a0a9dc..65684da52e2e 100644
--- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
@@ -30,217 +30,211 @@ sdcc4_pwrseq: sdcc4_pwrseq {
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
+		/* on board fixed 3.3v supply */
+		v3p3_fixed: v3p3 {
+			compatible = "regulator-fixed";
+			regulator-name = "PCIE V3P3";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
 		};
 
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
-				l23 {
-					regulator-min-microvolt = <1700000>;
-					regulator-max-microvolt = <1900000>;
-					bias-pull-down;
-				};
-
-				pm8921_lvs6: lvs6 {
-					bias-pull-down;
-				};
-
-			};
-		};
+	};
+};
+
+&gsbi1 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
 
-		gsbi@12440000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
+&gsbi1_i2c {
+	clock-frequency = <200000>;
+	status = "okay";
 
-			i2c@12460000 {
-				status = "okay";
-				clock-frequency = <200000>;
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
 
-				eeprom@50 {
-					compatible = "atmel,24c02";
-					reg = <0x50>;
-					pagesize = <32>;
-				};
-			};
+&gsbi7_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi7_uart_2pins>;
+	status = "okay";
+};
+
+&pcie {
+	vdda-supply = <&pm8921_s3>;
+	vdda_phy-supply = <&pm8921_lvs6>;
+	vdda_refclk-supply = <&v3p3_fixed>;
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+	status = "okay";
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
+};
+
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
 
-		gsbi@16600000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
-			serial@16640000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <&gsbi7_uart_2pins>;
-			};
+
+		/* Buck SMPS */
+		s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
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
+		s3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1400000>;
+			qcom,switch-mode-frequency = <4800000>;
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
+		s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
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
+		s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
 		};
 
-		/* on board fixed 3.3v supply */
-		v3p3_fixed: v3p3 {
-			compatible = "regulator-fixed";
-			regulator-name = "PCIE V3P3";
-			regulator-min-microvolt = <3300000>;
+		l3 {
+			regulator-min-microvolt = <3050000>;
 			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
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
-				};
-			};
+		l4 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
 		};
 
-		pci@1b500000 {
-			status = "okay";
-			vdda-supply = <&pm8921_s3>;
-			vdda_phy-supply = <&pm8921_lvs6>;
-			vdda_refclk-supply = <&v3p3_fixed>;
-			pinctrl-0 = <&pcie_pins>;
-			pinctrl-names = "default";
-			perst-gpios = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
+		l5 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		l23 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <1900000>;
+			bias-pull-down;
 		};
 
-		amba {
-			/* eMMC */
-			sdcc1: mmc@12400000 {
-				status = "okay";
-				vmmc-supply = <&pm8921_l5>;
-				vqmmc-supply = <&pm8921_s4>;
-			};
-
-			/* External micro SD card */
-			sdcc3: mmc@12180000 {
-				status = "okay";
-				vmmc-supply = <&v3p3_fixed>;
-				pinctrl-names = "default";
-				pinctrl-0 = <&card_detect>;
-				cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
-			};
-			/* WLAN */
-			sdcc4: mmc@121c0000 {
-				status = "okay";
-				vmmc-supply = <&v3p3_fixed>;
-				vqmmc-supply = <&v3p3_fixed>;
-				mmc-pwrseq = <&sdcc4_pwrseq>;
-			};
+		lvs6 {
+			bias-pull-down;
+		};
+
+	};
+};
+
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
+/* External micro SD card */
+&sdcc3 {
+	vmmc-supply = <&v3p3_fixed>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&card_detect>;
+	cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+/* WLAN */
+&sdcc4 {
+	status = "okay";
+	vmmc-supply = <&v3p3_fixed>;
+	vqmmc-supply = <&v3p3_fixed>;
+	mmc-pwrseq = <&sdcc4_pwrseq>;
+};
+
+&tlmm_pinmux {
+	card_detect: card_detect {
+		mux {
+			pins = "gpio26";
+			function = "gpio";
+			bias-disable;
 		};
 	};
+
+	pcie_pins: pcie_pinmux {
+		mux {
+			pins = "gpio27";
+			function = "gpio";
+		};
+		conf {
+			pins = "gpio27";
+			drive-strength = <12>;
+			bias-disable;
+		};
+	};
+};
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
 };
-- 
2.35.1

