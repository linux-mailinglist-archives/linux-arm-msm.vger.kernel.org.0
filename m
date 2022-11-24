Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C99637ABF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 14:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbiKXN6U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 08:58:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiKXN5z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 08:57:55 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0BF11659B
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:56:58 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id q7so1704633wrr.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oC5GY5vSjtH1DZZ6gY+F4sPk3L9SBT+hndjFSVGCeWc=;
        b=C1oEAEjRJi4wg6m57PJLh63+7tWfjDq5ha7dcl0ZrSD3e4aGAfJVXggZviJgrgdZKU
         mzSuQcKB96EbEYLdGhav88wDi+bzR2mlzi7//4TaJ1dTnLjNFuHLxLcQmCXszwBO7A7u
         RaIJh056w7xkujdc+zdJGhbo5qRKqGeN1US7uIyWmRrHH9lOcvaEr0DRNB9HDHpyn4Ll
         NKkGNyggnL718QBY+9HVOw1A6JzmGBmClDFXkRGSwJpPoVj7udQDo89311PjbJY2L+6U
         6mhdEjz4Zd5xg3SX5Nx1+9XwTVJBYrDbOfxiJgvZ7JVaXT6z0HSFLFcrjH16Moj3TceA
         CYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oC5GY5vSjtH1DZZ6gY+F4sPk3L9SBT+hndjFSVGCeWc=;
        b=lGbBwK58OMLIT3QisxBvwzJOCzGTIplhbP9xHKnkhkUS1QIK1lqR0BUhe/DNXl1+gC
         nttPKF8k2fa/3CTyT0FTyTykMGZssIWBfGy505CXQufFGJvYO00imyQEcQSWF0JT6uu4
         scN9gS0XofCyKXluEnDhQnGzgeMHWYbRijf808nd2yhHOVWUWPrYHNjpQtgWVVM7zLmH
         uM7NpQErInodGDYZyv7byjf+W8F0i1MeMQ2coqNmYWSdjm3VpqsGO0CEwq3jsmyR1fuY
         QkgIIKFnbACchQKDTiWKBBxpIT9ECoseR5qxLFVAL8dEpQfQteb5CTUvW/eBoT2JUCT5
         G5IQ==
X-Gm-Message-State: ANoB5pl+TEF84HMXgR7KsKGOly497IOvSsqn2G7hFAM0+hr1cxkcLWXJ
        qBZHmjrmNhzQIcmnoscX9C8Gkw==
X-Google-Smtp-Source: AA0mqf4PSaN2yAKxv0qHS1J2X4audNxojHGhudjJX9jBfsGITkDh9rQc/zgtIoi5OdebL5U4RMcE9g==
X-Received: by 2002:a05:6000:18f:b0:241:a046:91ff with SMTP id p15-20020a056000018f00b00241a04691ffmr20006530wrx.23.1669298215427;
        Thu, 24 Nov 2022 05:56:55 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v14-20020adfebce000000b00241d21d4652sm1414322wrn.21.2022.11.24.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:56:54 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 03/10] arm64: dts: qcom: Add pm8010 pmic dtsi
Date:   Thu, 24 Nov 2022 15:56:39 +0200
Message-Id: <20221124135646.1952727-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124135646.1952727-1-abel.vesa@linaro.org>
References: <20221124135646.1952727-1-abel.vesa@linaro.org>
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

From: Neil Armstrong <neil.armstrong@linaro.org>

Add nodes for pm8010 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---

Changes since v1:
 * added Konrad's R-b tag

 arch/arm64/boot/dts/qcom/pm8010.dtsi | 84 ++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8010.dtsi b/arch/arm64/boot/dts/qcom/pm8010.dtsi
new file mode 100644
index 000000000000..0ea641e12209
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8010.dtsi
@@ -0,0 +1,84 @@
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
+		pm8010-m-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8010_m_temp_alarm>;
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
+		pm8010-n-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8010_n_temp_alarm>;
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
+	pm8010_m: pmic@c {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xc SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_m_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+
+	pm8010_n: pmic@d {
+		compatible = "qcom,pm8010", "qcom,spmi-pmic";
+		reg = <0xd SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8010_n_temp_alarm: temp-alarm@2400 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0x2400>;
+			interrupts = <0xd 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+	};
+};
-- 
2.34.1

