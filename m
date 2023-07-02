Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87D25744DDB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjGBNnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbjGBNne (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:34 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C140CE7C
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6a0e36d42so43135271fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305410; x=1690897410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0qCZwLqED1KD83RQ3+5MlLPWlcDEfGkMx29AWINmec=;
        b=aA4MlwIVd/706wJAR2kI3wQX6HJlOjLf4k4nXgOVwU7BCO34nF0O5VkdKRnLB9XZ1K
         ZY6VJqPJ9I8u7l5EGICbqvFoZR0ZKfveAlTv3thIaOiDYyrhlAJ7mHt8JWr+aHf+qQ/n
         jMRotwD6qqPB455Mf8KOMqLOGrxp4sK9nBI9H5p3meOg9x1bKpWohimCDwLcM7Ac9tcx
         0LaF5aIXfDG//7cfI8b9UuthO10zaBtH6RI1NdU7iZIfKNrW9WscKwDBvZbUFb4OR91n
         cO7E6XghJd7MtxJ0EpXmeVOGwUjcWh9pmsbXL2yfmOXzTj7tSAoT5hEnv67K+GLgxfBD
         B0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305410; x=1690897410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0qCZwLqED1KD83RQ3+5MlLPWlcDEfGkMx29AWINmec=;
        b=BNvkPm5cnt2GLeoXfRvju/vu7/jt5kWYAcya0EoX3YxGcRWPmFW9pMq3ZFFLtiKvvE
         i1zJxkxS7fkbKgS4P7h/RDOGq21IMqTNhZpXB2+KqeEA5hyJVrfAO66ctZjcgkcxzCkK
         hLy49N6ywJ73LOCgDR3ohxB0bOGk2u+1fDTTJROM6DLpLhv5O7CEHNh7KW2iIiKr0HyR
         kBeB8haTPBRjGk3G1sEY83sngwCzGIWslxjteXEIv0c5LXXhh1btMhpJN1PICw6hDCVq
         1pVsAmHO+Q8bY3CmOd4ij6M8w0qVvX3sW37dkocOF1ZYEmyB/Bf8ZhMA6eQkMRD+9pKk
         DVJQ==
X-Gm-Message-State: AC+VfDx4iH+fxZciJZiD9o5M6Ze08LAjHIkotjDBY90yFcqorck7mOWQ
        RMb68qcG0RVojasOaqr93tuYSw==
X-Google-Smtp-Source: ACHHUZ5QKOq3RdjYSkqxvrVOXjhXMMbjmXxHPGfN8TATTg8if5lRO0Mz26ko234TZN64JLShAPQcGA==
X-Received: by 2002:a05:651c:10b0:b0:2b6:9e1d:cd0f with SMTP id k16-20020a05651c10b000b002b69e1dcd0fmr4205118ljn.12.1688305410165;
        Sun, 02 Jul 2023 06:43:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 11/27] ARM: dts: qcom: msm8960: split PMIC to separate dtsi files
Date:   Sun,  2 Jul 2023 16:43:04 +0300
Message-Id: <20230702134320.98831-12-dmitry.baryshkov@linaro.org>
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

The PMIC is not a part of the SoC, so move PMIC to a separate file and
include it from the board files.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi            | 40 +++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  1 +
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |  3 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 38 +-----------------
 4 files changed, 45 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
new file mode 100644
index 000000000000..414941f7a42f
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&ssbi {
+	pm8921: pmic {
+		compatible = "qcom,pm8921";
+		#interrupt-cells = <2>;
+		interrupt-controller;
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
+		pm8921_keypad: keypad@148 {
+			compatible = "qcom,pm8921-keypad";
+			reg = <0x148>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+				     <75 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15>;
+			scan-delay = <32>;
+			row-hold = <91500>;
+		};
+
+		rtc@11d {
+			compatible = "qcom,pm8921-rtc";
+			interrupt-parent = <&pm8921>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x11d>;
+			allow-set-time;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 4641b4f2195d..414881d34c60 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -2,6 +2,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "qcom-msm8960.dtsi"
+#include "pm8921.dtsi"
 
 / {
 	model = "Qualcomm MSM8960 CDP";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 13e85c287498..2e7d98e132be 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/reset/qcom,gcc-msm8960.h>
 
 #include "qcom-msm8960.dtsi"
-#include <dt-bindings/reset/qcom,gcc-msm8960.h>
+#include "pm8921.dtsi"
 
 / {
 	model = "Samsung Galaxy Express SGH-I437";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 6b8d90d02146..8157236f249d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -259,48 +259,14 @@ gsbi5_serial: serial@16440000 {
 			};
 		};
 
-		ssbi@500000 {
+		ssbi: ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
 
-			pm8921: pmic {
-				compatible = "qcom,pm8921";
+			pmic {
 				interrupt-parent = <&msmgpio>;
 				interrupts = <104 IRQ_TYPE_LEVEL_LOW>;
-				#interrupt-cells = <2>;
-				interrupt-controller;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				pwrkey@1c {
-					compatible = "qcom,pm8921-pwrkey";
-					reg = <0x1c>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-						     <51 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15625>;
-					pull-up;
-				};
-
-				pm8921_keypad: keypad@148 {
-					compatible = "qcom,pm8921-keypad";
-					reg = <0x148>;
-					interrupt-parent = <&pm8921>;
-					interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-						     <75 IRQ_TYPE_EDGE_RISING>;
-					debounce = <15>;
-					scan-delay = <32>;
-					row-hold = <91500>;
-				};
-
-				rtc@11d {
-					compatible = "qcom,pm8921-rtc";
-					interrupt-parent = <&pm8921>;
-					interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-					reg = <0x11d>;
-					allow-set-time;
-				};
 			};
 		};
 
-- 
2.39.2

