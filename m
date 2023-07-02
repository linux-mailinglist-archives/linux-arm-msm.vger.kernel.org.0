Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C20744DDF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbjGBNng (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjGBNnf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:35 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A872BE72
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b69e6d324aso56170771fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305411; x=1690897411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxqLUHNHLdJvvqMJgestVX6rYi36iQjneQUWKOWyQHM=;
        b=wL8iCjYUNE3NXhGGnzb/OEat8/vyEqjam+gulbH749MMnbaWl2lK10XfvvJyuHrwq/
         nvcXz5tBiqHX+DaWHwtX+yXJ91ymygd3eAsNKgNUxacEQFDA+jDxD8PcBpIQH77lKq3x
         i8u+1PzUuoDm/RyPpyirabqo6qhSiI2SLiIoRcIPAET/WgbdSGc9K6biWyczwp5VzdGf
         IHX4VhmFWZU+qn0+nP64VcKc+Dxid1+Q98q3VbjHTTk3TlFYJ304ca3WVMM7P6p+MDOc
         uEUAVUAuR9Ti5XnFmsH7bGzwYWrbeAcjIqjI4/XffVUVmomtSphMnfJj/OdlzknZk+nb
         Ce4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305411; x=1690897411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxqLUHNHLdJvvqMJgestVX6rYi36iQjneQUWKOWyQHM=;
        b=CY9AY/mBJy2OGePPhmF5AnDqK3xwNK2ImOijKQ25pvgrxtAQLZJez0qHD8TDCK1a+D
         z1xfI4M9+Gxt5P0nQrEWjEvBHSBXtPDHYa26hWLlY7dlLKnlpH/xGz5lLO+4YfZqULS5
         tkHi777ETQX6T4oZL7PXKYOcgPQigIl0idiUMTiHkEFr9Yd8Nb2Rg9wT72vqOThKn00i
         /xeIX1Ixq1pnASWM0tH2+JiALkFMWezgpoZVWfKoNdEy8LDuNzXb/MxFYL7EKiEY2ypW
         C/kP6Bw0eSFsDHncCQnNNSRMQFPXgLrbbow/Dw8nezkK3By2ik0fVF7Qy9dtj9AO/S25
         UOSg==
X-Gm-Message-State: ABy/qLb7C460ElceyNoMW499yNxQr/OQcHevgMQate7XdSGrujwbIsIc
        bLb0xHCcgWDs7Wm068D5abVrKQ==
X-Google-Smtp-Source: APBJJlH11wsMM5xlcXlDFOdOQgNqBdjXEe2fZ9CaP5delyBqJyQO14V8WoMMe7+/Ki1JjUUznKJYZQ==
X-Received: by 2002:a2e:9608:0:b0:2b6:a22b:42dc with SMTP id v8-20020a2e9608000000b002b6a22b42dcmr4328177ljh.16.1688305410901;
        Sun, 02 Jul 2023 06:43:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 12/27] ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
Date:   Sun,  2 Jul 2023 16:43:05 +0300
Message-Id: <20230702134320.98831-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 arch/arm/boot/dts/qcom/pm8921.dtsi            |  99 +++++++++++++
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   6 +-
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |   5 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   5 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   5 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 132 +-----------------
 7 files changed, 142 insertions(+), 132 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi

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
index 414941f7a42f..ad41d99ab265 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -8,6 +8,30 @@ pm8921: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pm8921_gpio: gpio@150 {
+
+			compatible = "qcom,pm8921-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8921_gpio 0 0 44>;
+			#gpio-cells = <2>;
+
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
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
@@ -36,5 +60,80 @@ rtc@11d {
 			reg = <0x11d>;
 			allow-set-time;
 		};
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
 	};
 };
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
index 5ffb960d09b4..2a5a3b2fb8e9 100644
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
-		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
-			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
-			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
-			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
-			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
-			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
-			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
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
 
-			pm8921: pmic {
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
-					interrupt-parent = <&pm8921>;
-					interrupts = <39 1>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
-
-				pwrkey@1c {
-					compatible = "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <50 1>, <51 1>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8921_xoadc: xoadc@197 {
-					compatible = "qcom,pm8921-adc";
-					reg = <0x197>;
-					interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
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

