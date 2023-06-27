Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFA4573F068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 03:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbjF0BYg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 21:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbjF0BYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 21:24:34 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD3110CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:30 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fb5bcb9a28so2787406e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 18:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687829069; x=1690421069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hP7ETYQxd6yGELXztV+RjFJf4jFf8npD/Pmh/27HiPI=;
        b=OxY060NytsVa+HrCpY+Jsy50ncVsb7pmsR8v5bBRwpM/YNdT+cVIQiVu0BSSnRZTwA
         sqiRgMuv+EggBOIB8xntrBsGPdlOwQb9C76aYgTRG0pqoiqkLZErXzZMm+DXfv50jAS0
         RDPfsfeWtJe5/LROHwMvc+mxR24hvqqQzSWcHXjmWKjleAhB7gQ5/7wZkKxsf6Vw7YUN
         l9YPbFQu80x7e+UhX6y3ZTa7vtBUux2IkQtxxzymbpQ/YidNpz2LkrjkVkqMmMBd+zcA
         3KQ186tJTfM2VWzYh8wZoUxstmdBMoIPf+MYi+VXOCCZJw1UkQ7uGB4C1STKNxvvlF/m
         rvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687829069; x=1690421069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hP7ETYQxd6yGELXztV+RjFJf4jFf8npD/Pmh/27HiPI=;
        b=ksj+kA3/UcwU9epAqqzlQwgdnz4Pkp41ZsVPl2/oUVMzo2d0f1o6pUvfVxzSSf5EuR
         dy2LxXcbkkqTMQCsqDLNEPcq41YEzqGnBoDVIemGESq4i0vDpFjDByc10D7V8FRS6tqg
         2jrXVEqwPCb7XuyFXXuzGpc622Bec/6g8Ont1H/YWXwV1zHipUTmQE44u62x2Hqpit+A
         PujjFv4w3rQr4nTFW4VDT9ypOrFz8BMpqGrz8HAWyK7yki//VNMS75QWqT+tSz6IMvKd
         c+doOxW3jB4xuJNhIn2Y5fyNchDkhGg8aR3CHxR1dGo/zg1WjyI7JNeW3EWdvs40AWX5
         T/qQ==
X-Gm-Message-State: AC+VfDzpkFNFka48PYmDTDX6SqMf91ED2PVP+luFH0ynQO+7DJgi7eYu
        g5WUfmUVVeJnyr1j0zogJsuwmg==
X-Google-Smtp-Source: ACHHUZ7ydyTK4XwX5SRr/33KAVJq/ebefew07r6zzrwFcc8WfoDXeiebVlZVMagRjH69wHqTZUdlgA==
X-Received: by 2002:ac2:5e64:0:b0:4fb:8680:138a with SMTP id a4-20020ac25e64000000b004fb8680138amr31638lfr.22.1687829068927;
        Mon, 26 Jun 2023 18:24:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z7-20020ac24187000000b004cc9042c9cfsm1331301lfh.158.2023.06.26.18.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 18:24:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 07/15] ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
Date:   Tue, 27 Jun 2023 04:24:14 +0300
Message-Id: <20230627012422.206077-8-dmitry.baryshkov@linaro.org>
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

The PMICs are not a part of the SoC, so move PMICs to separate files and
include them from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8821.dtsi            |  22 +++
 arch/arm/boot/dts/qcom/pm8921.dtsi            | 126 +++++++++++++++++
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   6 +-
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |   5 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   5 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   5 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 132 +-----------------
 7 files changed, 169 insertions(+), 132 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8821.dtsi b/arch/arm/boot/dts/qcom/pm8821.dtsi
new file mode 100644
index 000000000000..064e3ba54e18
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8821.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/* This PMIC is used on a secondary SSBI bus */
+&ssbi2 {
+	pm8821: pmic {
+		compatible = "qcom,pm8821";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8821_mpps: mpps@50 {
+			compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8821_mpps 0 0 4>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
new file mode 100644
index 000000000000..63e95b56dcf1
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&ssbi {
+	pm8921: pmic {
+		compatible = "qcom,pm8921";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pwrkey@1c {
+			compatible = "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
+		};
+
+		pm8921_mpps: mpps@50 {
+			compatible = "qcom,pm8921-mpp",
+				     "qcom,ssbi-mpp";
+			reg = <0x50>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8921_mpps 0 0 12>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		rtc@11d {
+			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			allow-set-time;
+		};
+
+		pm8921_gpio: gpio@150 {
+			compatible = "qcom,pm8921-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pm8921_gpio 0 0 44>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pm8921_xoadc: xoadc@197 {
+			compatible = "qcom,pm8921-adc";
+			reg = <0x197>;
+			interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
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
+			vph_pwr: adc-channel@4 {
+				reg = <0x00 0x04>;
+			};
+
+			batt_therm: adc-channel@8 {
+				reg = <0x00 0x08>;
+			};
+
+			batt_id: adc-channel@9 {
+				reg = <0x00 0x09>;
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
+			chg_temp: adc-channel@e {
+				reg = <0x00 0x0e>;
+			};
+
+			ref_muxoff: adc-channel@f {
+				reg = <0x00 0x0f>;
+			};
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
+		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
+			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
+			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
+			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
+			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
+			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
+			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index 0e80a5a8e3c6..d5dee70620c2 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Asus Nexus7(flo)";
 	compatible = "asus,nexus7-flo", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index d6ecfd8addb7..ffd654ab0b57 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -1,8 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "CompuLab CM-QS600";
 	compatible = "qcom,apq8064-cm-qs600", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index 96307550523a..12bf8ea3fb93 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -1,9 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Qualcomm APQ8064/IFC6410";
 	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 9244512b74d1..53dd9d79556f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "qcom-apq8064-v2.0.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
+#include "qcom-apq8064-v2.0.dtsi"
+#include "pm8821.dtsi"
+#include "pm8921.dtsi"
+
 / {
 	model = "Sony Xperia Z";
 	compatible = "sony,xperia-yuga", "qcom,apq8064";
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 4f4393e11580..2a5a3b2fb8e9 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -324,23 +324,6 @@ scm {
 		};
 	};
 
-
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
-			    <&xoadc 0x00 0x0e>; /* Charger temperature */
-	};
-
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -683,132 +666,25 @@ rng@1a500000 {
 			clock-names = "core";
 		};
 
-		ssbi@c00000 {
+		ssbi2: ssbi@c00000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00c00000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8821: pmic {
-				compatible = "qcom,pm8821";
+			pmic {
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8821_mpps: mpps@50 {
-					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
-					reg = <0x50>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8821_mpps 0 0 4>;
-				};
 			};
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pmicintc: pmic {
-				compatible = "qcom,pm8921";
+			pmic {
 				interrupt-parent = <&tlmm_pinmux>;
 				interrupts = <74 8>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pm8921_gpio: gpio@150 {
-
-					compatible = "qcom,pm8921-gpio",
-						     "qcom,ssbi-gpio";
-					reg = <0x150>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-					gpio-controller;
-					gpio-ranges = <&pm8921_gpio 0 0 44>;
-					#gpio-cells = <2>;
-
-				};
-
-				pm8921_mpps: mpps@50 {
-					compatible = "qcom,pm8921-mpp",
-						     "qcom,ssbi-mpp";
-					reg = <0x50>;
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-ranges = <&pm8921_mpps 0 0 12>;
-					interrupt-controller;
-					#interrupt-cells = <2>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pmicintc>;
-					interrupts = <39 1>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
-
-				pwrkey@1c {
-					compatible = "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pmicintc>;
-					interrupts = <50 1>, <51 1>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				xoadc: xoadc@197 {
-					compatible = "qcom,pm8921-adc";
-					reg = <0x197>;
-					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
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
-					vph_pwr: adc-channel@4 {
-						reg = <0x00 0x04>;
-					};
-					batt_therm: adc-channel@8 {
-						reg = <0x00 0x08>;
-					};
-					batt_id: adc-channel@9 {
-						reg = <0x00 0x09>;
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
-					chg_temp: adc-channel@e {
-						reg = <0x00 0x0e>;
-					};
-					ref_muxoff: adc-channel@f {
-						reg = <0x00 0x0f>;
-					};
-				};
 			};
 		};
 
-- 
2.39.2

