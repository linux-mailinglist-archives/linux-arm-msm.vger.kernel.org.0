Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 432795F11DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbiI3Swr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232193AbiI3Swo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:44 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED61166497
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k10so8200572lfm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7j7Nh2RniEJWsujpKQwRCj9MNLAZwO+7AChIkJZqdW8=;
        b=D5KlSkVk7bhvKYwkf9RjTa2uhbn8+KXn4cTWW5GJjUO1190sZisyIctP85A+hp7Ebu
         Tmfyl3e6IqJGpxzdSKfMwhgKPFho7mPAtk404xYKkvtHhV3zlhBWV93f6yjt3E34LXbK
         6qOyRlqsm4bk7wqdRlvUh3agpYT9/KKDKe1RP0vp3sPLuJzZHc9keap1eacrPvHUG8h/
         ViY+/31Igi6vcJ4vCvO4Mb4B5Rcqumm6aTY4cKJDNhZ8AoiLO7LqgJtXF5PBzBz69evq
         Hqm9mfY42/NWfC5kRvK5sAk5Hokzvzj4NLzuMQDFzG37FrWbyT2lxBO2870nBE/aSaTC
         SFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7j7Nh2RniEJWsujpKQwRCj9MNLAZwO+7AChIkJZqdW8=;
        b=n2YWg16bLFWSS3/8K1XZMWd0EQqGqmJONKD2PEwWmNZUNGbORIehIrkvNx9WOe1/O6
         EwURqdzmLaDcGu/Kvo5N10VlaQPhQiuCGeTbE/X7X+2Wb1LFaaAD1wh55N/Iuqnt8xNB
         WieWmHWkaUeuBqcYfMqx7IaFnINxLhMa+4OQqVBdhi74Kb99iJ7Hpk+CWYWfS5OTq0SO
         69FvNPLwFiGH7hAznPHxRUofiQX5aJyrKVA6V6PldwcJeXHrjIAk03oC6djOwrZKp1LR
         OODWnLlWz//cJHR6xF0C4tF12iOGV3QOAPYQCwxwH946qInwVbsAGqSbRT9lNxxObEay
         KjLA==
X-Gm-Message-State: ACrzQf0zGDvKnQUAccur4S/iKxFZfqB6NBnR5idLxGnZY5GDLZNqMsb4
        sAVt6WBf0HkPlvcnWwpBx3j6yQ==
X-Google-Smtp-Source: AMsMyM7aJJpRNoMFubjHqafwQLD32vYkPwR6d3v0KlkiFOD34RqI/7P0JBGe5KBcqVJslYPdwBo0xg==
X-Received: by 2002:a05:6512:1088:b0:49f:c019:a3ae with SMTP id j8-20020a056512108800b0049fc019a3aemr3645616lfg.332.1664563962015;
        Fri, 30 Sep 2022 11:52:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 06/23] ARM: dts: qcom: apq8064-flo: use labels to patch device tree
Date:   Fri, 30 Sep 2022 21:52:19 +0300
Message-Id: <20220930185236.867655-7-dmitry.baryshkov@linaro.org>
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
 .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 521 +++++++++---------
 1 file changed, 255 insertions(+), 266 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index fee278e32cb6..2c661bc51488 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -57,302 +57,291 @@ key-volume-down {
 	};
 
 	soc {
-		rpm@108000 {
-			regulators {
-				vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
-				vin_lvs1_3_6-supply = <&pm8921_s4>;
-				vin_lvs4_5_7-supply = <&pm8921_s4>;
-
-
-				vdd_l24-supply = <&pm8921_s1>;
-				vdd_l25-supply = <&pm8921_s1>;
-				vin_lvs2-supply = <&pm8921_s1>;
-
-				vdd_l26-supply = <&pm8921_s7>;
-				vdd_l27-supply = <&pm8921_s7>;
-				vdd_l28-supply = <&pm8921_s7>;
-
-				vdd_ncp-supply = <&pm8921_l6>;
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
-				/* msm otg HSUSB_VDDCX */
-				s3 {
-					regulator-min-microvolt = <500000>;
-					regulator-max-microvolt = <1150000>;
-					qcom,switch-mode-frequency = <4800000>;
-				};
-
-				/*
-				 * msm_sdcc.1-sdc-vdd_io
-				 * tabla2x-slim-CDC_VDDA_RX
-				 * tabla2x-slim-CDC_VDDA_TX
-				 * tabla2x-slim-CDC_VDD_CP
-				 * tabla2x-slim-VDDIO_CDC
-				 */
-				s4 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <3200000>;
-					regulator-always-on;
-				};
-
-				s7 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <3200000>;
-				};
-
-				/* mipi_dsi.1-dsi1_pll_vdda */
-				l2 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					regulator-always-on;
-				};
-
-				/* msm_otg-HSUSB_3p3 */
-				l3 {
-					regulator-min-microvolt = <3075000>;
-					regulator-max-microvolt = <3075000>;
-					bias-pull-down;
-				};
-
-				/* msm_otg-HSUSB_1p8 */
-				l4 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				/* msm_sdcc.1-sdc_vdd */
-				l5 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					regulator-always-on;
-					bias-pull-down;
-				};
-
-				l6 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-				};
-
-				/* mipi_dsi.1-dsi1_avdd */
-				l11 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					bias-pull-down;
-					regulator-always-on;
-				};
-
-				/* pwm_power for backlight */
-				l17 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					regulator-always-on;
-				};
-
-				/* camera, qdsp6 */
-				l23 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				/*
-				 * tabla2x-slim-CDC_VDDA_A_1P2V
-				 * tabla2x-slim-VDDD_CDC_D
-				 */
-				l25 {
-					regulator-min-microvolt = <1250000>;
-					regulator-max-microvolt = <1250000>;
-					bias-pull-down;
-				};
-
-				lvs1 {
-					bias-pull-down;
-				};
-
-				lvs4 {
-					bias-pull-down;
-				};
-
-				lvs5 {
-					bias-pull-down;
-				};
-
-				lvs6 {
-					bias-pull-down;
-				};
-				/*
-				 * mipi_dsi.1-dsi1_vddio
-				 * pil_riva-pll_vdd
-				 */
-				lvs7 {
-					bias-pull-down;
-				};
-			};
-		};
+		sram@2a03f000 {
+			compatible = "qcom,apq8064-imem", "syscon", "simple-mfd";
+			reg = <0x2a03f000 0x1000>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
 
-		mdp@5100000 {
-			status = "okay";
-			ports {
-				port@1 {
-					mdp_dsi1_out: endpoint {
-						remote-endpoint = <&dsi0_in>;
-					};
-				};
+				mode-normal = <0x77665501>;
+				mode-bootloader = <0x77665500>;
+				mode-recovery = <0x77665502>;
 			};
 		};
+	};
+};
 
-		dsi0: dsi@4700000 {
-			status = "okay";
-			vdda-supply = <&pm8921_l2>;/*VDD_MIPI1 to 4*/
-			vdd-supply = <&pm8921_l8>;
-			vddio-supply = <&pm8921_lvs7>;
-			avdd-supply = <&pm8921_l11>;
-
-			panel@0 {
-				reg = <0>;
-				compatible = "jdi,lt070me05000";
-
-				vddp-supply = <&pm8921_l17>;
-				iovcc-supply = <&pm8921_lvs7>;
-
-				enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
-				reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
-				dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
-
-				port {
-					panel_in: endpoint {
-						remote-endpoint = <&dsi0_out>;
-					};
-				};
-			};
-			ports {
-				port@0 {
-					dsi0_in: endpoint {
-						remote-endpoint = <&mdp_dsi1_out>;
-					};
-				};
-
-				port@1 {
-					dsi0_out: endpoint {
-						remote-endpoint = <&panel_in>;
-						data-lanes = <0 1 2 3>;
-					};
-				};
+&dsi0 {
+	vdda-supply = <&pm8921_l2>;/*VDD_MIPI1 to 4*/
+	vdd-supply = <&pm8921_l8>;
+	vddio-supply = <&pm8921_lvs7>;
+	avdd-supply = <&pm8921_l11>;
+	status = "okay";
+
+	panel@0 {
+		reg = <0>;
+		compatible = "jdi,lt070me05000";
+
+		vddp-supply = <&pm8921_l17>;
+		iovcc-supply = <&pm8921_lvs7>;
+
+		enable-gpios = <&pm8921_gpio 36 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm_pinmux 54 GPIO_ACTIVE_LOW>;
+		dcdc-en-gpios = <&pm8921_gpio 23 GPIO_ACTIVE_HIGH>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
 			};
 		};
+	};
+};
+
+&dsi0_in {
+	remote-endpoint = <&mdp_dsi1_out>;
+};
+
+&dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&dsi0_phy {
+	vddio-supply = <&pm8921_lvs7>;/*VDD_PLL2_1 to 7*/
+	status = "okay";
+};
+
+&gsbi1 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
+
+&gsbi1_i2c {
+	status = "okay";
+	clock-frequency = <200000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	eeprom@52 {
+		compatible = "atmel,24c128";
+		reg = <0x52>;
+		pagesize = <32>;
+	};
+
+	bq27541@55 {
+		compatible = "ti,bq27541";
+		reg = <0x55>;
+	};
+
+};
+
+&gsbi3 {
+	qcom,mode = <GSBI_PROT_I2C>;
+	status = "okay";
+};
+
+&gsbi3_i2c {
+	clock-frequency = <200000>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	trackpad@10 {
+		compatible = "elan,ekth3500";
+		reg = <0x10>;
+		interrupt-parent = <&tlmm_pinmux>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&gsbi6 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
+
+&gsbi6_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi6_uart_4pins>;
+	status = "okay";
+};
 
-		dsi-phy@4700200 {
-			status = "okay";
-			vddio-supply = <&pm8921_lvs7>;/*VDD_PLL2_1 to 7*/
+&gsbi7 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
+
+&gsbi7_serial {
+	status = "okay";
+};
+
+&mdp {
+	status = "okay";
+};
+
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
+&mdp_dsi1_out {
+	remote-endpoint = <&dsi0_in>;
+};
+
+&rpm {
+	regulators {
+		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vin_lvs1_3_6-supply = <&pm8921_s4>;
+		vin_lvs4_5_7-supply = <&pm8921_s4>;
+
+
+		vdd_l24-supply = <&pm8921_s1>;
+		vdd_l25-supply = <&pm8921_s1>;
+		vin_lvs2-supply = <&pm8921_s1>;
+
+		vdd_l26-supply = <&pm8921_s7>;
+		vdd_l27-supply = <&pm8921_s7>;
+		vdd_l28-supply = <&pm8921_s7>;
+
+		vdd_ncp-supply = <&pm8921_l6>;
+
+		/* Buck SMPS */
+		s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
 		};
 
-		gsbi@16200000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
-			i2c@16280000 {
-				status = "okay";
-				clock-frequency = <200000>;
-				pinctrl-0 = <&i2c3_pins>;
-				pinctrl-names = "default";
-
-				trackpad@10 {
-					compatible = "elan,ekth3500";
-					reg = <0x10>;
-					interrupt-parent = <&tlmm_pinmux>;
-					interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
-				};
-			};
+		/* msm otg HSUSB_VDDCX */
+		s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
 		};
 
+		/*
+		 * msm_sdcc.1-sdc-vdd_io
+		 * tabla2x-slim-CDC_VDDA_RX
+		 * tabla2x-slim-CDC_VDDA_TX
+		 * tabla2x-slim-CDC_VDD_CP
+		 * tabla2x-slim-VDDIO_CDC
+		 */
+		s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <3200000>;
+			regulator-always-on;
+		};
 
-		gsbi@12440000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C>;
+		s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
+		};
 
-			i2c@12460000 {
-				status = "okay";
-				clock-frequency = <200000>;
-				pinctrl-0 = <&i2c1_pins>;
-				pinctrl-names = "default";
+		/* mipi_dsi.1-dsi1_pll_vdda */
+		l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-always-on;
+		};
 
-				eeprom@52 {
-					compatible = "atmel,24c128";
-					reg = <0x52>;
-					pagesize = <32>;
-				};
+		/* msm_otg-HSUSB_3p3 */
+		l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+			bias-pull-down;
+		};
 
-				bq27541@55 {
-					compatible = "ti,bq27541";
-					reg = <0x55>;
-				};
+		/* msm_otg-HSUSB_1p8 */
+		l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
 
-			};
+		/* msm_sdcc.1-sdc_vdd */
+		l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			bias-pull-down;
 		};
 
-		gsbi@16500000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
+		l6 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
 
-			serial@16540000 {
-				status = "okay";
+		/* mipi_dsi.1-dsi1_avdd */
+		l11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+			regulator-always-on;
+		};
 
-				pinctrl-names = "default";
-				pinctrl-0 = <&gsbi6_uart_4pins>;
-			};
+		/* pwm_power for backlight */
+		l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
 		};
 
-		gsbi@16600000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
-			serial@16640000 {
-				status = "okay";
-			};
+		/* camera, qdsp6 */
+		l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
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
+		/*
+		 * tabla2x-slim-CDC_VDDA_A_1P2V
+		 * tabla2x-slim-VDDD_CDC_D
+		 */
+		l25 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			bias-pull-down;
 		};
 
-		amba {
-			/* eMMC */
-			mmc@12400000 {
-				status = "okay";
-				vmmc-supply = <&pm8921_l5>;
-				vqmmc-supply = <&pm8921_s4>;
-			};
+		lvs1 {
+			bias-pull-down;
 		};
 
-		sram@2a03f000 {
-			compatible = "qcom,apq8064-imem", "syscon", "simple-mfd";
-			reg = <0x2a03f000 0x1000>;
+		lvs4 {
+			bias-pull-down;
+		};
 
-			reboot-mode {
-				compatible = "syscon-reboot-mode";
-				offset = <0x65c>;
+		lvs5 {
+			bias-pull-down;
+		};
 
-				mode-normal = <0x77665501>;
-				mode-bootloader = <0x77665500>;
-				mode-recovery = <0x77665502>;
-			};
+		lvs6 {
+			bias-pull-down;
+		};
+		/*
+		 * mipi_dsi.1-dsi1_vddio
+		 * pil_riva-pll_vdd
+		 */
+		lvs7 {
+			bias-pull-down;
 		};
 	};
 };
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+/* OTG */
+&usb1 {
+	dr_mode = "otg";
+	status = "okay";
+};
-- 
2.35.1

