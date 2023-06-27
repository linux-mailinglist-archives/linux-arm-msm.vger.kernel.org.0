Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E30F73F06B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjF0BYi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230152AbjF0BYf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F1A199A
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f957a45b10so5180605e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829071; x=1690421071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNw7A1SOPXrtNiGQe+HMqv0natw7zhKCQbrRGngL/x8=;
        b=x/lirniQbuXnjXtW5oC+gb7chwOJcvivBeBjDT2IxRSS5qZLWX/AppN0OXccwEY8dQ
         DiA5LmDD0J34jWL8ALP1Vs8Q8sW3/Shjg6WW6GBlARkmRDAlP6o/T9yJi94tWi6RU1mX
         XZPuzx2awtbPcgd7j1lNV0FlmoSPNdbiwQh+qtZRG9KJpB7cdeOF0s4yWRVfKuKaP3PR
         IkjBbIsGprrhfNckNlLLA+fM9IIKqxGZuyj5uER3Y3SR8lidXAmbKBAk0YmOehLt8UK/
         AfF6hK9XO/bkAa7Ywxn6WQlLJiSSsHQ6ABCZPBz6DZRgnm2SGSCWx29cAUcr5Jbza9hE
         JcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829071; x=1690421071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNw7A1SOPXrtNiGQe+HMqv0natw7zhKCQbrRGngL/x8=;
        b=Sbfl0Vi2Hy6cipZD637fCxTuSPQb4nYL3Kh67VOJt/COSzuMyyqHcr7fOVc5qC98t6
         sikaCOHz8O4TvA/Q50j0YQnkTEjXgGttOuzV+HFBqVO31X1sOQ0cOG4a+H8fjJL2ZLU7
         Ma5MKm3nowfty/13JwC6flhHTfg+3HB+v0PQcsSyhfxYGsm2066D8RlEUJIGPIVSxq6t
         U/RRky20gT9HvwBq8RYcWf5b0xeVdB95ydTyD3tAS4aGL7INZPEbTLbkoJwF2Vc8LNha
         QfjoDZwtvBEoA2mJzMFgnTdhLgv8MvPeFsEl75Ljg/z0VNq7AJbm4UUHPBKyNktlGiXo
         XCvg==
X-Gm-Message-State: AC+VfDxH4ZPnBnzCu0v0vFXl8MIJDhpHvs+h2gDJOXPGkhDQ4SHT+Dzo
        TddRVg4vaSPLhNVv2UfkYxN7bg==
X-Google-Smtp-Source: ACHHUZ7+a+Vsm9h4Re6LLAUQLQvisbVKaOpqkoqNuNwtm8HWBSe7h1jR/rgh4EIOkDrV2/OZcai0wA==
X-Received: by 2002:a19:4314:0:b0:4f8:70f8:d424 with SMTP id q20-20020a194314000000b004f870f8d424mr12696422lfa.65.1687829070847;
        Mon, 26 Jun 2023 18:24:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 09/15] ARM: dts: qcom: msm8660: split PMIC to separate dtsi files
Date:   Tue, 27 Jun 2023 04:24:16 +0300
Message-Id: <20230627012422.206077-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi            | 162 ++++++++++++++++++
 .../dts/qcom/qcom-apq8060-dragonboard.dts     |   5 +-
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |   1 +
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      | 148 +---------------
 4 files changed, 168 insertions(+), 148 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8058.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
new file mode 100644
index 000000000000..f5a41e654981
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&ssbi {
+	pm8058: pmic {
+		compatible = "qcom,pm8058";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@1c {
+			compatible = "qcom,pm8058-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8058_led48: led@48 {
+			compatible = "qcom,pm8058-keypad-led";
+			reg = <0x48>;
+			status = "disabled";
+		};
+
+		vibrator@4a {
+			compatible = "qcom,pm8058-vib";
+			reg = <0x4a>;
+		};
+
+		pm8058_mpps: mpps@50 {
+			compatible = "qcom,pm8058-mpp",
+				     "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8058_mpps 0 0 12>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm8058_led131: led@131 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x131>;
+			status = "disabled";
+		};
+
+		pm8058_led132: led@132 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x132>;
+			status = "disabled";
+		};
+
+		pm8058_led133: led@133 {
+			compatible = "qcom,pm8058-led";
+			reg = <0x133>;
+			status = "disabled";
+		};
+
+		pm8058_keypad: keypad@148 {
+			compatible = "qcom,pm8058-keypad";
+			reg = <0x148>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+				     <75 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15>;
+			scan-delay = <32>;
+			row-hold = <91500>;
+		};
+
+		pm8058_gpio: gpio@150 {
+			compatible = "qcom,pm8058-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8058_gpio 0 0 44>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm8058_xoadc: xoadc@197 {
+			compatible = "qcom,pm8058-adc";
+			reg = <0x197>;
+			interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#io-channel-cells = <2>;
+
+			vcoin: adc-channel@0 {
+				reg = <0x00 0x00>;
+			};
+
+			vbat: adc-channel@1 {
+				reg = <0x00 0x01>;
+			};
+
+			dcin: adc-channel@2 {
+				reg = <0x00 0x02>;
+			};
+
+			ichg: adc-channel@3 {
+				reg = <0x00 0x03>;
+			};
+
+			vph_pwr: adc-channel@4 {
+				reg = <0x00 0x04>;
+			};
+
+			usb_vbus: adc-channel@a {
+				reg = <0x00 0x0a>;
+			};
+
+			die_temp: adc-channel@b {
+				reg = <0x00 0x0b>;
+			};
+
+			ref_625mv: adc-channel@c {
+				reg = <0x00 0x0c>;
+			};
+
+			ref_1250mv: adc-channel@d {
+				reg = <0x00 0x0d>;
+			};
+
+			ref_325mv: adc-channel@e {
+				reg = <0x00 0x0e>;
+			};
+
+			ref_muxoff: adc-channel@f {
+				reg = <0x00 0x0f>;
+			};
+		};
+
+		rtc@1e8 {
+			compatible = "qcom,pm8058-rtc";
+			reg = <0x1e8>;
+			interrupt-parent = <&pm8058>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			allow-set-time;
+		};
+	};
+};
+
+/ {
+	/*
+	 * These channels from the ADC are simply hardware monitors.
+	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
+	 * ADC.
+	 */
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&pm8058_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8058_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8058_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8058_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8058_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8058_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8058_xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index db4c791b2e2f..20de516a8deb 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -5,6 +5,7 @@
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
 #include "qcom-msm8660.dtsi"
+#include "pm8058.dtsi"
 
 / {
 	model = "Qualcomm APQ8060 Dragonboard";
@@ -72,7 +73,7 @@ cm3605 {
 		/* Trig on both edges - getting close or far away */
 		interrupts-extended = <&pm8058_gpio 34 IRQ_TYPE_EDGE_BOTH>;
 		/* MPP05 analog input to the XOADC */
-		io-channels = <&xoadc 0x00 0x05>;
+		io-channels = <&pm8058_xoadc 0x00 0x05>;
 		io-channel-names = "aout";
 		pinctrl-names = "default";
 		pinctrl-0 = <&dragon_cm3605_gpios>, <&dragon_cm3605_mpps>;
@@ -945,7 +946,7 @@ irq-pins {
 	};
 };
 
-&xoadc {
+&pm8058_xoadc {
 	/* Reference voltage 2.2 V */
 	xoadc-ref-supply = <&pm8058_l18>;
 
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
index 86fbb6dfdc2a..04dca0c93971 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
@@ -2,6 +2,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "qcom-msm8660.dtsi"
+#include "pm8058.dtsi"
 
 / {
 	model = "Qualcomm MSM8660 SURF";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
index 78023ed2fdf7..b8094b7c09fc 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
@@ -73,22 +73,6 @@ sleep-clk {
 		};
 	};
 
-	/*
-	 * These channels from the ADC are simply hardware monitors.
-	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
-	 * ADC.
-	 */
-	iio-hwmon {
-		compatible = "iio-hwmon";
-		io-channels = <&xoadc 0x00 0x01>, /* Battery */
-			    <&xoadc 0x00 0x02>, /* DC in (charger) */
-			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
-			    <&xoadc 0x00 0x0b>, /* Die temperature */
-			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			    <&xoadc 0x00 0x0e>; /* Reference voltage 0.325V */
-	};
-
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -334,142 +318,14 @@ ebi2: external-bus@1a100000 {
 			status = "disabled";
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8058: pmic {
-				compatible = "qcom,pm8058";
+			pmic {
 				interrupt-parent = <&tlmm>;
 				interrupts = <88 8>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8058_gpio: gpio@150 {
-					compatible = "qcom,pm8058-gpio",
-						     "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pm8058_gpio 0 0 44>;
-					#gpio-cells = <2>;
-
-				};
-
-				pm8058_mpps: mpps@50 {
-					compatible = "qcom,pm8058-mpp",
-						     "qcom,ssbi-mpp";
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8058_mpps 0 0 12>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-				};
-
-				pwrkey@1c {
-					compatible = "qcom,pm8058-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <50 1>, <51 1>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8058_keypad: keypad@148 {
-					compatible = "qcom,pm8058-keypad";
-					reg = <0x148>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <74 1>, <75 1>;
-					debounce = <15>;
-					scan-delay = <32>;
-					row-hold = <91500>;
-				};
-
-				xoadc: xoadc@197 {
-					compatible = "qcom,pm8058-adc";
-					reg = <0x197>;
-					interrupts-extended = <&pm8058 76 IRQ_TYPE_EDGE_RISING>;
-					#address-cells = <2>;
-					#size-cells = <0>;
-					#io-channel-cells = <2>;
-
-					vcoin: adc-channel@0 {
-						reg = <0x00 0x00>;
-					};
-					vbat: adc-channel@1 {
-						reg = <0x00 0x01>;
-					};
-					dcin: adc-channel@2 {
-						reg = <0x00 0x02>;
-					};
-					ichg: adc-channel@3 {
-						reg = <0x00 0x03>;
-					};
-					vph_pwr: adc-channel@4 {
-						reg = <0x00 0x04>;
-					};
-					usb_vbus: adc-channel@a {
-						reg = <0x00 0x0a>;
-					};
-					die_temp: adc-channel@b {
-						reg = <0x00 0x0b>;
-					};
-					ref_625mv: adc-channel@c {
-						reg = <0x00 0x0c>;
-					};
-					ref_1250mv: adc-channel@d {
-						reg = <0x00 0x0d>;
-					};
-					ref_325mv: adc-channel@e {
-						reg = <0x00 0x0e>;
-					};
-					ref_muxoff: adc-channel@f {
-						reg = <0x00 0x0f>;
-					};
-				};
-
-				rtc@1e8 {
-					compatible = "qcom,pm8058-rtc";
-					reg = <0x1e8>;
-					interrupt-parent = <&pm8058>;
-					interrupts = <39 1>;
-					allow-set-time;
-				};
-
-				vibrator@4a {
-					compatible = "qcom,pm8058-vib";
-					reg = <0x4a>;
-				};
-
-				pm8058_led48: led@48 {
-					compatible = "qcom,pm8058-keypad-led";
-					reg = <0x48>;
-					status = "disabled";
-				};
-
-				pm8058_led131: led@131 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x131>;
-					status = "disabled";
-				};
-
-				pm8058_led132: led@132 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x132>;
-					status = "disabled";
-				};
-
-				pm8058_led133: led@133 {
-					compatible = "qcom,pm8058-led";
-					reg = <0x133>;
-					status = "disabled";
-				};
-
 			};
 		};
 
-- 
2.39.2

