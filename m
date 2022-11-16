Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7675062B9CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238936AbiKPKpY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbiKPKo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:44:27 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD0932B93
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:33 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d9so24454961wrm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9i0aUERYAp64Dg3f9TW8aPPux8LTTvHSLBDJ/TZVE4=;
        b=S3vzocugdeUAWvM5RXMdcDH0b1jUav8so8uLUqOFV4LynypFw6SIuhEPF20sWvr8Hl
         odnZcK7BrAILEYewx/Pqrb1du7IWOwzP5q+E2r+/I3jKDUB+gUF/OJNh2P7hNV1lSOj2
         FnIeWQHuFVzBfwF6bWlg1cmNYqy4bT6nRpvZZZzHG6uYjlkd5F+X4lCM3RuNrteh7Bgr
         Bwt6ShpFcjHKQThcDNuKXADS0GSy58yASUIX/e/w4nI9VL97aqtD5ZbSF1932BYBb+kf
         JNcFKHmadN+20GFO+Cgg3nJukDMoRG2FmmjvuwvsSBVO5o/D48TN/U/2okqjIqEBIw1I
         TCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9i0aUERYAp64Dg3f9TW8aPPux8LTTvHSLBDJ/TZVE4=;
        b=sLiLH1k4vh5NAACLShv+500o5d6B6chsUo575EJ3toAJHnqOQ50FilB77IUQlzmmgL
         EfPideHd0RUhnzNtMGuWQhgjftCGIUefO06fHytg6UhsD1zfDNENV/O3zYzojQvHb5vY
         La57DefcriAYs4nGWJ+T1/vIPn3DPLND0EoAEHaBt1US9AapJnuoCa1DbpwU/D/XuifF
         16XsmD5f8KEziAqj0ByGyxBjwOPW4EN55Ts17BlQ9zvc1SPLIcbX4Z+UIdAYcg2cFelE
         DQ200vKPhJFTMbDF1kG9Dw/+jUq7nAdUrAHu5gzMyu27IrwbPErXO5tWZ1ncLNW6HLWE
         D+bQ==
X-Gm-Message-State: ANoB5pmNKIS7FB7wY7xJGXZIVoqMfkW8eWmvn8DU7ILuDrdTTOhMT7q6
        vWR6g+de8ITzHVjE/pOtYRAwpw==
X-Google-Smtp-Source: AA0mqf4vevPsmB6UBckTr/FUGxykJZiKdJmuQQuegtvA9KA8v7IFOpTtJYFzbR1m00gCVhesqHp2Zg==
X-Received: by 2002:adf:eec3:0:b0:236:737f:8e2c with SMTP id a3-20020adfeec3000000b00236737f8e2cmr13023058wrp.639.1668594752443;
        Wed, 16 Nov 2022 02:32:32 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id bh9-20020a05600005c900b0022e36c1113fsm15107032wrb.13.2022.11.16.02.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:32:32 -0800 (PST)
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
Subject: [PATCH 09/10] arm64: dts: qcom: Add PMR735d pmic dtsi
Date:   Wed, 16 Nov 2022 12:31:45 +0200
Message-Id: <20221116103146.2556846-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116103146.2556846-1-abel.vesa@linaro.org>
References: <20221116103146.2556846-1-abel.vesa@linaro.org>
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

Add nodes for PMR735d in separate dtsi file.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmr735d.dtsi | 104 ++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d.dtsi

diff --git a/arch/arm64/boot/dts/qcom/pmr735d.dtsi b/arch/arm64/boot/dts/qcom/pmr735d.dtsi
new file mode 100644
index 000000000000..41fb664a10b3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmr735d.dtsi
@@ -0,0 +1,104 @@
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
+		pmr735d-k-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmr735d_k_temp_alarm>;
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
+		pmr735d-l-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pmr735d_l_temp_alarm>;
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
+	pmr735d_k: pmic@a {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_k_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xa 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_k_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_k_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	pmr735d_l: pmic@b {
+		compatible = "qcom,pmr735d", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmr735d_l_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <0xb 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmr735d_l_gpios: gpio@8800 {
+			compatible = "qcom,pmr735d-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmr735d_l_gpios 0 0 2>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
-- 
2.34.1

