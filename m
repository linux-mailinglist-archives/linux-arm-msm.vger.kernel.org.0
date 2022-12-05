Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7FA6438F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Dec 2022 00:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232543AbiLEXEM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 18:04:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbiLEXEJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 18:04:09 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A92140FA
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 15:04:08 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id m18so531246eji.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 15:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=oA3iY90QZ6LlLfQc1qJioPy6fNvY+BYcEgMHHh83eJoY9FG2ISgSEohu5xMbvdKtIr
         y6A4Q/ORdlTQ8COn5s1sLh8Q63w7JrCO0ssWyvo6dcGkjxImgCs3q+BYY2iXOpGln3Ga
         OoRgvDo8lFrHnM3Y2fScD12l7RhHJovF+ohwgz5tyy06VELFCshS6LfFl3JL5iF03aB/
         LXAYCTZdPzhAjuES+u+inoNEKYghFJ1UFxp4cF314VF35BEYiRvaRuxBAoX6dHbFs26Q
         +6B4mM5RFLInCNXXhmA6fGV9m6a4BPpSg6Ny/r/2aIWoLfbu1P/5SDq5zcwDhMRSWUs1
         vY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiSyzj5bxhBZ228Fs3MQ7cHv3+MhOBcyO/fL/boI7rc=;
        b=WvtfSSFAWTreBP1jpWloM0vi+vGp2tpZ6Oe6gSvci/1rrCokjvaG3PHNz/JjQNnJ7l
         LzaLeARYjtI9o5sX4cHDQY9SamqSdDPAT8uzhiN7XTCUEuojmG5XVsMhUmZb49LOPkWz
         enw4VTE9HUDLvD/b8qb905iAdQmKPA00KH5/XP/KBMQKTf/XD+ruIolylZBI/ycXCcOq
         jMTIhtdgMmxBF5NqKQALoKmxnnO/BWTA2NhPsagUlSX4Dehwfui2zupIdJUrnA5IR2D9
         5tXSBqRUItQApR1bqmwcrtf8CAbxgDux2kGOIhuMTLraSMYXacm7kdIh6k1w1NbrrXe2
         xRag==
X-Gm-Message-State: ANoB5plGB0Dg8SDDVEw4hB2aCyGI4YrzlM/i/5T40bI8IiPt0pop3eVl
        81SaezdhotaXzQdWJLo1x0MBbQ==
X-Google-Smtp-Source: AA0mqf5PuHuaziLetFdgGGWBHxDri+mLjngEpPm+4V4hjJdEahT1onNfql+UK6ImsLrErY8bC3F/Xw==
X-Received: by 2002:a17:907:2bf3:b0:7c0:ebbb:8e8b with SMTP id gv51-20020a1709072bf300b007c0ebbb8e8bmr6781731ejc.683.1670281447630;
        Mon, 05 Dec 2022 15:04:07 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00783f32d7eaesm6655642ejc.164.2022.12.05.15.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 15:04:07 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 04/10] arm64: dts: qcom: Add PM8550 pmic dtsi
Date:   Tue,  6 Dec 2022 01:03:36 +0200
Message-Id: <20221205230342.494923-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205230342.494923-1-abel.vesa@linaro.org>
References: <20221205230342.494923-1-abel.vesa@linaro.org>
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

Add nodes for PM8550 in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pm8550.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
new file mode 100644
index 000000000000..46396ec1a330
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -0,0 +1,59 @@
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
+		pm8550-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8550_temp_alarm>;
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
+	pm8550: pmic@1 {
+		compatible = "qcom,pm8550", "qcom,spmi-pmic";
+		reg = <0x1 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pm8550_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pm8550_gpios: gpio@8800 {
+			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pm8550_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

