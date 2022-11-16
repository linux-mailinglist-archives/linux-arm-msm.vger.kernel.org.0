Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB4A162B9C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238915AbiKPKpP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbiKPKoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:44:25 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7312932B89
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:30 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso1132109wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfhVZ/BVYLN1ISOzaAC+apO93yea8c8znHb9gCW91uc=;
        b=FYNQPCkjZciEFjQGp0QcfZjmqSMIbuF02k34DOI7YTG/NPautTYPX/qpPJQlNNj2Fg
         Umpr9IWyaeTXnRN1D93x2n7k+ShLI4d7JVuknfeRxsR0B+TeNQy51qzwwWFzI5UUIxpK
         LcMS9QLpAK517edVua5XTpgVeaKiu6pT8MVvO2ydrk6db6ALAIONOLUNWQpU5jyUgNIo
         KPNPDyTgHmxh1yp+tgoMgBNEGmnspegO2ChqqCFTRDrx2+64lfqFzNMnRE96jnK7FGI8
         YoGNlYFfZKP5IqjXKlqWgIzvaG3ezxvQ4gyQo7qyjwLrp0O03gnBzgpXB1pQ9DmcjlTc
         xcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfhVZ/BVYLN1ISOzaAC+apO93yea8c8znHb9gCW91uc=;
        b=PV9nLE7zeJ155R+iO5nswdPxdkQP50ctN29E0ym96JsNBK2f8eUWq1sfAnvPZAT7+I
         LVjugNXtFWZGhtc4tlkhWZXEtSRh2azhfxadbLaPj/wRnvdYNyllNkosPWOBuKIva8qI
         ABaK+mHWdbkMs/eryKiG4xWExrfg2godsxYvLXSdB2DgBi81LuQI+DE15usCveNY2FiN
         w/2sbcfnPRNrlM1qdPfWSYpx3MhGdyKdV/Gp3i2IGToQKdYnCayM6LJi+3kaw88Udqxp
         SVDSzFQc6cDAI8bbZjMsM8m1FEVz5uXkWbBipWiIr07XrMS3n76MjwZdy1FkKWNwNQzZ
         oUMA==
X-Gm-Message-State: ANoB5pkTRTHdBP7wV3iyOk+lIoSu6tqqxCBsdAXCbjooZS7i6VZ2y0do
        JY9RSaB+qo7pP9UPF+pnrEe1fw==
X-Google-Smtp-Source: AA0mqf6+uMpObZ62A+qpxHuxLOKga7lerNReM9R/T7NTSJehE2uZM/ATTw7HPYPGVahp83rJxfqdCw==
X-Received: by 2002:a05:600c:3d1b:b0:3cf:670e:63cc with SMTP id bh27-20020a05600c3d1b00b003cf670e63ccmr1709046wmb.150.1668594749982;
        Wed, 16 Nov 2022 02:32:29 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600005c900b0022e36c1113fsm15107032wrb.13.2022.11.16.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:32:29 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 07/10] arm64: dts: qcom: Add PM8550vs pmic dtsi
Date:   Wed, 16 Nov 2022 12:31:43 +0200
Message-Id: <20221116103146.2556846-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116103146.2556846-1-abel.vesa@linaro.org>
References: <20221116103146.2556846-1-abel.vesa@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for PM8550vs in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi | 194 +++++++++++++++++++++++++
 1 file changed, 194 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550vs.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
new file mode 100644
index 000000000000..97b1c18aa7d8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pm8550vs-c-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550vs_c_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550vs-d-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550vs_d_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550vs-e-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550vs_e_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+
+		pm8550vs-g-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550vs_g_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+
+&spmi_bus {
+	pm8550vs_c: pmic@2 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_c_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_c_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_c_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pm8550vs_d: pmic@3 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_d_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_d_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_d_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pm8550vs_e: pmic@4 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x4 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_e_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_e_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_e_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pm8550vs_g: pmic@6 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x6 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550vs_g_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550vs_g_gpios: gpio@8800 {
+			compatible = "qcom,pm8550vs-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550vs_g_gpios 0 0 6>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

