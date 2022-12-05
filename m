Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284A76438F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234082AbiLEXEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232685AbiLEXEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:04:09 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E21B6D
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 15:04:07 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ud5so2094967ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 15:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4rFInHPvXMY21RVSYqFleaDBM1EbzDLtUryUWQU3DY=;
        b=lV85Gk9R/QAMNXcP3KIzRH8//FZPdcNorsgeWbzNEK0iQEPV+ErG2jLkPo6l6gS3NI
         BfE8J3bPd1QaRYjqbZglg5RDmVszgHgqYDejRVQIhc/9cy9B+QLDL3hlc8dYPzX+EVj5
         ptzSfmlvKjCAy48NytIrx8acckG64EAV6DoICGbQgIpP4m5YHASA7CPzkUcPh/t1fBlu
         O+b8o/pbE7S6a6umOjK1a1rqfj8XhHFyqklJxA4RB88JpE5YgPcYmOtx+jwWXJhKe2GS
         UkjxVE6/TsLooIGdOKA+ge544NanGfypx1BtH47ACqD/eyB8PfOEGe6CcI8naLcKgMx2
         6yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4rFInHPvXMY21RVSYqFleaDBM1EbzDLtUryUWQU3DY=;
        b=eFQHO+zG2tmk3gWyBccWwNnwEXaXJ7CIQ1JIuTdeme9R1JMRF831RWKrJ/xiD1YnE8
         kXEXCbRycIKuW87DGe7Rh+SNjCZQC+ekETXsrSJrtdFTAGgHmORK0Co68mkAzeDo50x4
         G1kxWWJkXW5gcEEBZzBCqNrr39fA03gAsz4iyGTe3GIzp5wSdrIJvBQh+IBSSIr2kSpi
         qts6F5jAwnQXgokNL+9+N9381KxlvgrbOJVM56g8CDuH3RvCvdVsWt+hnA0UW3zty/M6
         OPMuADqkjnsso9QDIYRZa3fekGXh9m0XrXy5Plxe+OSt6gHRJBmpTWv1DZK1te+j6AyT
         ZICg==
X-Gm-Message-State: ANoB5pnQS3w14xSwR3dzWvi1QQ10vXwGuns35+ZiOOmIPPR825ikN86o
        gVauCkTccx7glgjKoBAgpsGTdA==
X-Google-Smtp-Source: AA0mqf7WImyXCpsodtQ4nJDYKToykv7Bx3Li6S74GFfpgsGLMmQPMhPLZNZ+owZSG/taNHV2oPuqng==
X-Received: by 2002:a17:906:950e:b0:7c0:fd1a:afce with SMTP id u14-20020a170906950e00b007c0fd1aafcemr3766082ejx.48.1670281446419;
        Mon, 05 Dec 2022 15:04:06 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00783f32d7eaesm6655642ejc.164.2022.12.05.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:04:06 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 03/10] arm64: dts: qcom: Add pm8010 pmic dtsi
Date:   Tue,  6 Dec 2022 01:03:35 +0200
Message-Id: <20221205230342.494923-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205230342.494923-1-abel.vesa@linaro.org>
References: <20221205230342.494923-1-abel.vesa@linaro.org>
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

