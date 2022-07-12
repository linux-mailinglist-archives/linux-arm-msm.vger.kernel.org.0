Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F91B571D1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233706AbiGLOnb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbiGLOnR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:43:17 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB28BB7CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:43:07 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id c15so10181376ljr.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 07:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YVKB8oza+pHwVJpfJERd/ocrZdEYSbFt0JiW8e03wFo=;
        b=Py/m/Q0zqh8ksDMCwh5rx27A2VTeaqCIorRD7EIZERXunOXL6uGPvEGGnIqOocjMr6
         3oUn7zNQff+l5X1FK5i4MSzn0i0iE7ars0iIr1LJ2fP3tQDdeU8DCvTDiZHVf8KG828R
         IAqrB37zRU7fo/3RCg3NuR7HPUxT/glVgf+73rc+KkYUpo4MZwYrUCG0BEClgiHHWapN
         q03a0zLE1UySQ5JpFiQSWYIOScuOL5tz271zP24C9LBvAiUOefcN745wiNORPdcgCV5S
         P8ByBHNtbbjk8i3oo4u9le/+d6jz31oL6ED75wZ2N8oP8iV/nCtKlMaJEzOqb0dQl9Fw
         FXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YVKB8oza+pHwVJpfJERd/ocrZdEYSbFt0JiW8e03wFo=;
        b=7rZSuRGELatEMWVTA9INxexmR6W2wlrF90infjwJPwoJtMiai+4DNQOf3RQ2VBg9Pc
         9YDIYLbZYf+EQBd7kn6TwRNTlCVlL8MnAvI45RovM/oH3+drFjipYRPqTQG8QjaTY7nN
         ePyRAhkbn3KNG6Zr+FnkDEolsL48Oawssm8/BVEKzs6YolX557AATiK4Dhogik5dM3MH
         atbz/pA2/1OwEm71OMUZNXTICUWRpv4cZKzJm1x+GaMEiUOW9cOi9bOIsTAZi9FWVxWz
         JeZn2YZ/Qzmlyj5Jb8taZqnmYD6OmTVsZ8ebRPPDbaej8txb1pG2vrbgfho3veF9xqN4
         mPoA==
X-Gm-Message-State: AJIora+uRcz5EiKkbWLeCOoVXbBxofLTzxYsDYuh0xeAQhu0xPfttDUY
        D1ySEItSn/0s+NBbInPHkqShwA==
X-Google-Smtp-Source: AGRyM1v5zFPkdWzIbOsCi+3TA1y5SMk9Ql8tnv6uNj2KM5iRgqylxg7ctsf++r7t9XfyESE1OyDA4w==
X-Received: by 2002:a05:651c:b14:b0:25a:a19a:b1c4 with SMTP id b20-20020a05651c0b1400b0025aa19ab1c4mr12599352ljr.25.1657636986497;
        Tue, 12 Jul 2022 07:43:06 -0700 (PDT)
Received: from krzk-bin.. (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id w15-20020a05651234cf00b00489e88d6a72sm737577lfr.198.2022.07.12.07.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:43:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 5/5] ARM: dts: qcom: align SDHCI clocks with DT schema
Date:   Tue, 12 Jul 2022 16:42:45 +0200
Message-Id: <20220712144245.17417-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712144245.17417-1-krzysztof.kozlowski@linaro.org>
References: <20220712144245.17417-1-krzysztof.kozlowski@linaro.org>
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

The DT schema expects clocks iface-core order.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi    | 12 ++++++------
 arch/arm/boot/dts/qcom-ipq4019.dtsi    |  4 ++--
 arch/arm/boot/dts/qcom-msm8226.dtsi    | 18 +++++++++---------
 arch/arm/boot/dts/qcom-msm8974.dtsi    | 18 +++++++++---------
 arch/arm/boot/dts/qcom-msm8974pro.dtsi |  6 +++---
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 45f3cbcf6238..c887ac5cdd7d 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -425,10 +425,10 @@ mmc@f9824900 {
 			reg-names = "hc", "core";
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_SDCC1_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			status = "disabled";
 		};
 
@@ -438,10 +438,10 @@ mmc@f98a4900 {
 			reg-names = "hc", "core";
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&gcc GCC_SDCC2_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 1b98764bab7a..a8a32a5e7e5d 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -228,9 +228,9 @@ sdhci: mmc@7824900 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			bus-width = <8>;
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>, <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&gcc GCC_DCD_XO_CLK>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			status = "disabled";
 		};
 
diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index f711463d22dc..9d4223bf8fc1 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -141,10 +141,10 @@ sdhc_1: mmc@f9824900 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_SDCC1_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdhc1_default_state>;
 			status = "disabled";
@@ -157,10 +157,10 @@ sdhc_2: mmc@f98a4900 {
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&gcc GCC_SDCC2_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdhc2_default_state>;
 			status = "disabled";
@@ -173,10 +173,10 @@ sdhc_3: mmc@f9864900 {
 			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC3_APPS_CLK>,
-				 <&gcc GCC_SDCC3_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
+				 <&gcc GCC_SDCC3_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdhc3_default_state>;
 			status = "disabled";
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 971eceaef3d1..1f4baa6ac64d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -443,10 +443,10 @@ sdhc_1: mmc@f9824900 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_SDCC1_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			bus-width = <8>;
 			non-removable;
 
@@ -460,10 +460,10 @@ sdhc_3: mmc@f9864900 {
 			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC3_APPS_CLK>,
-				 <&gcc GCC_SDCC3_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
+				 <&gcc GCC_SDCC3_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			bus-width = <4>;
 
 			#address-cells = <1>;
@@ -479,10 +479,10 @@ sdhc_2: mmc@f98a4900 {
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
-			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
-				 <&gcc GCC_SDCC2_AHB_CLK>,
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&xo_board>;
-			clock-names = "core", "iface", "xo";
+			clock-names = "iface", "core", "xo";
 			bus-width = <4>;
 
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-msm8974pro.dtsi b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
index 1e882e16a221..58df6e75ab6d 100644
--- a/arch/arm/boot/dts/qcom-msm8974pro.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974pro.dtsi
@@ -10,10 +10,10 @@ &gpu {
 };
 
 &sdhc_1 {
-	clocks = <&gcc GCC_SDCC1_APPS_CLK>,
-		 <&gcc GCC_SDCC1_AHB_CLK>,
+	clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+		 <&gcc GCC_SDCC1_APPS_CLK>,
 		 <&xo_board>,
 		 <&gcc GCC_SDCC1_CDCCAL_FF_CLK>,
 		 <&gcc GCC_SDCC1_CDCCAL_SLEEP_CLK>;
-	clock-names = "core", "iface", "xo", "cal", "sleep";
+	clock-names = "iface", "core", "xo", "cal", "sleep";
 };
-- 
2.34.1

