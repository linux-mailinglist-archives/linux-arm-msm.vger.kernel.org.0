Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 055046CA4CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbjC0Mx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232509AbjC0Mxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:32 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7DB2118
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:30 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso7336145wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXI6ueezQMjbt8yHZkCuSNA3fjya7kV77Z0XtfmoN4Y=;
        b=f25hlpW9QN/snZVztVI/GN14nrUhdiFH0ofCY/er+aw7UPmL6nCNC5EjVReu0Ipn3j
         SpeCTdx8t/xrA8oq0WHSZRnZnPQLUBrA1o2trARs6mbqAc171Myrr1n2p97JWIJQPGdS
         y4MQPoN3GjII4qUnDD4ufgh4cZpUUD65fp83c0TKQr3VS6jSYqe3ERDDg9H6HDQTcgkb
         ObYqkOsd9hVTV2+IM9chcAEBIC/2jn5rk0mlzTwKN6eEgl6RPON4cSfAPl2V4wCHoT48
         5qEtsFrlgCzW/oQ2FPYY3fzQjaI3rRNh/dMil5/TUas0XsJjJe5nFPVl8ZCyaOejLnKi
         Bvww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXI6ueezQMjbt8yHZkCuSNA3fjya7kV77Z0XtfmoN4Y=;
        b=3LKW0CZf4ZTaEfM8ClJ2dbBA76nMhrnpzmRpHpPhIn+3hzcRN2nBZunVVWB2X33Sme
         O0dyYYzZp9fnK+PT5cKeNTMXjpZsoJWIdiNGWrDWlaUBtJnzjRuMpy7yDejwIjivGTZM
         WJEFJ0D92aVzveRTHbPqy6HRvM8sdE3OdFIq0nO9BosuSmLP92mpFGUw1dbYcByEB9fQ
         KE4hOpl/ZA1ZhjzkGxa9kzoKX3PIWRUc7SbjxYqMFQ/CZwjwDCO4OZVZqE3heu5oiR9U
         sw9xsQe50ULn3Zja7wPidc8m5EEaopGIkchsQh1H0PVKFMZMZhacE4nAxpuxZhoIm/wA
         XTqA==
X-Gm-Message-State: AAQBX9c2Y9eJLeShyv/gLMx7bC5IGW4oS29puECzdZBZtYvlaP8v50iC
        3/9rySP61Jnt6TbzW4NOJ93ZWg==
X-Google-Smtp-Source: AKy350YuH3QcIe3lv8XkoMUT6jWczr4hxMm2rs4MVH+WASq4OrJGnTlsRt/K8UNZDsEvLfHifnyz3A==
X-Received: by 2002:a05:600c:2243:b0:3ef:6e1c:3ffa with SMTP id a3-20020a05600c224300b003ef6e1c3ffamr2887048wmm.28.1679921609742;
        Mon, 27 Mar 2023 05:53:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:29 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 11/18] arm64: dts: qcom: sa8775p: pmic: add thermal zones
Date:   Mon, 27 Mar 2023 14:53:09 +0200
Message-Id: <20230327125316.210812-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the thermal zones and associated alarm nodes for the PMICs that have
them hooked up on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 112 ++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 8616ead3daf5..be12997a080c 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -6,6 +6,90 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pmm8654au_0_thermal: pm8775-0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmm8654au_0_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8775-1-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmm8654au_1_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8775-2-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmm8654au_2_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8775-3-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pmm8654au_3_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 	pmm8654au_0: pmic@0 {
 		compatible = "qcom,pmm8654au", "qcom,spmi-pmic";
@@ -13,6 +97,13 @@ pmm8654au_0: pmic@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		pmm8654au_0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		pmm8654au_0_pon: pon@1200 {
 			compatible = "qcom,pmk8350-pon";
 			reg = <0x1200>, <0x800>;
@@ -41,6 +132,13 @@ pmm8654au_1: pmic@2 {
 		reg = <0x2 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmm8654au_1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
 	};
 
 	pmm8654au_2: pmic@4 {
@@ -48,6 +146,13 @@ pmm8654au_2: pmic@4 {
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmm8654au_2_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
 	};
 
 	pmm8654au_3: pmic@6 {
@@ -55,5 +160,12 @@ pmm8654au_3: pmic@6 {
 		reg = <0x6 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pmm8654au_3_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
 	};
 };
-- 
2.37.2

