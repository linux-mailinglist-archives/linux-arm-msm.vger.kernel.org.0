Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBD7B5F11F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbiI3Swy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232356AbiI3Swt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:49 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD7CB166F18
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id q14so1464166lfo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=FQVzaeMwN6wP4Wlkxa61/6fblhe6jcZzQEWjuJXlgJM=;
        b=bx/KMZIUKU7tC4b1vPuZ47B5TOtA+Sp3YlDGEbNY5HujcVwALWnrkC4TZ1EehHJVBe
         PPKwZ0EwgxuzEzd9A3fINi8XNKg4KMpy0aiDsG+2WVTdcE/uMZoX7X86U8FACYpqy988
         jEPipE0ixDxs4mDTnRHnSAVkulilJSP9z2OuvZR5xKiNRzzm4pj7OCKhtuOXgLnq3JeR
         4ckSqDBdtj5gO6xg87zhTepcx2rMwEBTF2SHFEndPFhW7Cnj+HdyBFfCNLgs4zg4m/Mq
         pxLan+eqIj7yGTCocZLeQg44PDZXIIVbIaX50hmkqwDOd0VROJ1d9pdJ4Oot0NVpYyXg
         Kdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=FQVzaeMwN6wP4Wlkxa61/6fblhe6jcZzQEWjuJXlgJM=;
        b=Bx813HSkNybCen/JxnDuiq7EHsBwkU4jO71YGt3zbouv0iXi3offarGkW0e+KvZQQM
         JXijey6TOqgM/zYlm+kQJM3VxddQQIqjLZmk27ktF3yinjYI/8TkYNiGqCsILD6XQ+Yv
         Ab+bldsmUjx2f6hqtiU3A8+kjGkobuAJe0RNY/aGN0bZdj8BSM5RykuhPYsGdtZKBrhF
         edFb1FQaUrEbClU7TrG+4pXjAFmDm5RlT2iw+TOBT3Vz76dKapPtZGP5FJfqr38LKHto
         MqYQN1tzP4n3L2OXbD5089td9oxIQGtXfDNMbwAS2hiUA91PG1BUZg9g83MtDt/1s7dZ
         OgQA==
X-Gm-Message-State: ACrzQf1VRJIVSjlb2ZQLNynlFJ3BnhUYpJQY5OkGK+pzJy58588BDltF
        cyNPkzlecFBSRYV3O6G141Z+Jw==
X-Google-Smtp-Source: AMsMyM7/ei3mIFgWzqCfv6TooYhiIxXLFhPECoHqk25TTRruIRXV4EYDUO5AdVHDHtt+W4PRvttqPw==
X-Received: by 2002:a19:5f4b:0:b0:499:b439:30cd with SMTP id a11-20020a195f4b000000b00499b43930cdmr3487272lfj.252.1664563965666;
        Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 11/23] ARM: dts: qcom: apq8064-sony-xperia-lagan-yuga: use labels to patch device tree
Date:   Fri, 30 Sep 2022 21:52:24 +0300
Message-Id: <20220930185236.867655-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use labels to add device-specific properties to DT nodes rather than
duplicating SoC DT structure in the device DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   | 649 +++++++++---------
 1 file changed, 318 insertions(+), 331 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
index c07c5474750d..796f47e5b610 100644
--- a/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -51,351 +51,338 @@ key-volume-up {
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
+};
+
+&gsbi5 {
+	qcom,mode = <GSBI_PROT_I2C_UART>;
+	status = "okay";
+};
+
+&gsbi5_serial {
+	pinctrl-names = "default";
+	pinctrl-0 = <&gsbi5_uart_pin_a>;
+	status = "okay";
+};
+
+&pm8921_gpio {
+	gpio_keys_pin_a: gpio-keys-active-state {
+		pins = "gpio3", "gpio4", "gpio29", "gpio35";
+		function = "normal";
+
+		bias-pull-up;
+		drive-push-pull;
+		input-enable;
+		power-source = <2>;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+		qcom,pull-up-strength = <0>;
+	};
+};
+
+&riva {
+	pinctrl-names = "default";
+	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+	status = "okay";
+};
+
+&rpm {
+	regulators {
+		vin_l1_l2_l12_l18-supply = <&pm8921_s4>;
+		vin_lvs_1_3_6-supply = <&pm8921_s4>;
+		vin_lvs_4_5_7-supply = <&pm8921_s4>;
+		vin_ncp-supply = <&pm8921_l6>;
+		vin_lvs2-supply = <&pm8921_s4>;
+		vin_l24-supply = <&pm8921_s1>;
+		vin_l25-supply = <&pm8921_s1>;
+		vin_l27-supply = <&pm8921_s7>;
+		vin_l28-supply = <&pm8921_s7>;
+
+		/* Buck SMPS */
+		s1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+			qcom,switch-mode-frequency = <3200000>;
+			bias-pull-down;
+		};
+
+		s2 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+		};
+
+		s3 {
+			regulator-min-microvolt = <500000>;
+			regulator-max-microvolt = <1150000>;
+			qcom,switch-mode-frequency = <4800000>;
+			bias-pull-down;
+		};
+
+		s4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
+			bias-pull-down;
+			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
+		};
+
+		s7 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			qcom,switch-mode-frequency = <3200000>;
+		};
+
+		s8 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+			qcom,switch-mode-frequency = <1600000>;
+		};
+
+		/* PMOS LDO */
+		l1 {
+			regulator-always-on;
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+			bias-pull-down;
+		};
 
-	soc {
-		pinctrl@800000 {
-			gsbi5_uart_pin_a: gsbi5-uart-pin-active {
-				rx {
-					pins = "gpio52";
-					function = "gsbi5";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
-
-				tx {
-					pins = "gpio51";
-					function = "gsbi5";
-					drive-strength = <4>;
-					bias-disable;
-				};
-			};
-
-
-			sdcc3_cd_pin_a: sdcc3-cd-pin-active {
-				pins = "gpio26";
-				function = "gpio";
-
-				drive-strength = <2>;
-				bias-disable;
-			};
-		};
-
-
-		rpm@108000 {
-			regulators {
-				vin_l1_l2_l12_l18-supply = <&pm8921_s4>;
-				vin_lvs_1_3_6-supply = <&pm8921_s4>;
-				vin_lvs_4_5_7-supply = <&pm8921_s4>;
-				vin_ncp-supply = <&pm8921_l6>;
-				vin_lvs2-supply = <&pm8921_s4>;
-				vin_l24-supply = <&pm8921_s1>;
-				vin_l25-supply = <&pm8921_s1>;
-				vin_l27-supply = <&pm8921_s7>;
-				vin_l28-supply = <&pm8921_s7>;
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
-				s2 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-				};
-
-				s3 {
-					regulator-min-microvolt = <500000>;
-					regulator-max-microvolt = <1150000>;
-					qcom,switch-mode-frequency = <4800000>;
-					bias-pull-down;
-				};
-
-				s4 {
-					regulator-always-on;
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <1600000>;
-					bias-pull-down;
-					qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
-				};
-
-				s7 {
-					regulator-min-microvolt = <1300000>;
-					regulator-max-microvolt = <1300000>;
-					qcom,switch-mode-frequency = <3200000>;
-				};
-
-				s8 {
-					regulator-min-microvolt = <2200000>;
-					regulator-max-microvolt = <2200000>;
-					qcom,switch-mode-frequency = <1600000>;
-				};
-
-				/* PMOS LDO */
-				l1 {
-					regulator-always-on;
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-					bias-pull-down;
-				};
-
-				l2 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-
-				l3 {
-					regulator-min-microvolt = <3075000>;
-					regulator-max-microvolt = <3075000>;
-					bias-pull-down;
-				};
-
-				l4 {
-					regulator-always-on;
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				l5 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				l6 {
-					regulator-min-microvolt = <2950000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				l7 {
-					regulator-min-microvolt = <1850000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				l8 {
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					bias-pull-down;
-				};
-
-				l9 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					bias-pull-down;
-				};
-
-				l10 {
-					regulator-min-microvolt = <2900000>;
-					regulator-max-microvolt = <2900000>;
-					bias-pull-down;
-				};
-
-				l11 {
-					regulator-min-microvolt = <3000000>;
-					regulator-max-microvolt = <3000000>;
-					bias-pull-down;
-				};
-
-				l12 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-
-				l14 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				l15 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <2950000>;
-					bias-pull-down;
-				};
-
-				l16 {
-					regulator-min-microvolt = <2800000>;
-					regulator-max-microvolt = <2800000>;
-					bias-pull-down;
-				};
-
-				l17 {
-					regulator-min-microvolt = <2000000>;
-					regulator-max-microvolt = <2000000>;
-					bias-pull-down;
-				};
-
-				l18 {
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1200000>;
-					bias-pull-down;
-				};
-
-				l21 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					bias-pull-down;
-				};
-
-				l22 {
-					regulator-min-microvolt = <2600000>;
-					regulator-max-microvolt = <2600000>;
-					bias-pull-down;
-				};
-
-				l23 {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					bias-pull-down;
-				};
-
-				l24 {
-					regulator-min-microvolt = <750000>;
-					regulator-max-microvolt = <1150000>;
-					bias-pull-down;
-				};
-
-				l25 {
-					regulator-always-on;
-					regulator-min-microvolt = <1250000>;
-					regulator-max-microvolt = <1250000>;
-					bias-pull-down;
-				};
-
-				l27 {
-					regulator-min-microvolt = <1100000>;
-					regulator-max-microvolt = <1100000>;
-				};
-
-				l28 {
-					regulator-min-microvolt = <1050000>;
-					regulator-max-microvolt = <1050000>;
-					bias-pull-down;
-				};
-
-				l29 {
-					regulator-min-microvolt = <2000000>;
-					regulator-max-microvolt = <2000000>;
-					bias-pull-down;
-				};
-
-				/* Low Voltage Switch */
-				lvs1 {
-					bias-pull-down;
-				};
-
-				lvs2 {
-					bias-pull-down;
-				};
-
-				lvs3 {
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
-
-				lvs7 {
-					bias-pull-down;
-				};
-
-				usb-switch {};
-
-				hdmi-switch {};
-
-				ncp {
-					regulator-min-microvolt = <1800000>;
-					regulator-max-microvolt = <1800000>;
-					qcom,switch-mode-frequency = <1600000>;
-				};
-			};
-		};
-
-		qcom,ssbi@500000 {
-			pmic@0 {
-				gpio@150 {
-					gpio_keys_pin_a: gpio-keys-active-state {
-						pins = "gpio3", "gpio4", "gpio29", "gpio35";
-						function = "normal";
-
-						bias-pull-up;
-						drive-push-pull;
-						input-enable;
-						power-source = <2>;
-						qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
-						qcom,pull-up-strength = <0>;
-					};
-				};
-			};
-		};
-
-		usb@12500000 {
-			status = "okay";
-			dr_mode = "otg";
-			ulpi {
-				phy {
-					v3p3-supply = <&pm8921_l3>;
-					v1p8-supply = <&pm8921_l4>;
-				};
-			};
+		l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
 		};
 
-		gsbi@1a200000 {
-			status = "okay";
-			qcom,mode = <GSBI_PROT_I2C_UART>;
+		l3 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+			bias-pull-down;
+		};
+
+		l4 {
+			regulator-always-on;
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		l5 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		l6 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
+
+		l8 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			bias-pull-down;
+		};
+
+		l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		l10 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+			bias-pull-down;
+		};
 
-			serial@1a240000 {
-				status = "okay";
+		l11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			bias-pull-down;
+		};
+
+		l12 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
 
-				pinctrl-names = "default";
-				pinctrl-0 = <&gsbi5_uart_pin_a>;
-			};
+		l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
 		};
 
-		amba {
-			sdcc1: mmc@12400000 {
-				status = "okay";
+		l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			bias-pull-down;
+		};
 
-				vmmc-supply = <&pm8921_l5>;
-				vqmmc-supply = <&pm8921_s4>;
-			};
+		l16 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			bias-pull-down;
+		};
 
-			sdcc3: mmc@12180000 {
-				status = "okay";
+		l17 {
+			regulator-min-microvolt = <2000000>;
+			regulator-max-microvolt = <2000000>;
+			bias-pull-down;
+		};
 
-				vmmc-supply = <&pm8921_l6>;
-				cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+		l18 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			bias-pull-down;
+		};
 
-				pinctrl-names = "default";
-				pinctrl-0 = <&sdcc3_pins>, <&sdcc3_cd_pin_a>;
-			};
+		l21 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
 		};
 
-		riva-pil@3204000 {
-			status = "okay";
+		l22 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <2600000>;
+			bias-pull-down;
+		};
 
-			pinctrl-names = "default";
-			pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+		l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			bias-pull-down;
+		};
+
+		l24 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1150000>;
+			bias-pull-down;
+		};
+
+		l25 {
+			regulator-always-on;
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			bias-pull-down;
+		};
+
+		l27 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		l28 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			bias-pull-down;
+		};
+
+		l29 {
+			regulator-min-microvolt = <2000000>;
+			regulator-max-microvolt = <2000000>;
+			bias-pull-down;
+		};
+
+		/* Low Voltage Switch */
+		lvs1 {
+			bias-pull-down;
+		};
+
+		lvs2 {
+			bias-pull-down;
+		};
+
+		lvs3 {
+			bias-pull-down;
+		};
+
+		lvs4 {
+			bias-pull-down;
+		};
+
+		lvs5 {
+			bias-pull-down;
+		};
+
+		lvs6 {
+			bias-pull-down;
+		};
+
+		lvs7 {
+			bias-pull-down;
+		};
+
+		usb-switch {};
+
+		hdmi-switch {};
+
+		ncp {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			qcom,switch-mode-frequency = <1600000>;
 		};
 	};
 };
+
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
+&sdcc3 {
+	vmmc-supply = <&pm8921_l6>;
+	cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdcc3_pins>, <&sdcc3_cd_pin_a>;
+
+	status = "okay";
+};
+
+&tlmm_pinmux {
+	gsbi5_uart_pin_a: gsbi5-uart-pin-active {
+		rx {
+			pins = "gpio52";
+			function = "gsbi5";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		tx {
+			pins = "gpio51";
+			function = "gsbi5";
+			drive-strength = <4>;
+			bias-disable;
+		};
+	};
+
+
+	sdcc3_cd_pin_a: sdcc3-cd-pin-active {
+		pins = "gpio26";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&usb_hs1_phy {
+	v3p3-supply = <&pm8921_l3>;
+	v1p8-supply = <&pm8921_l4>;
+};
+
+&usb1 {
+	dr_mode = "otg";
+	status = "okay";
+};
-- 
2.35.1

