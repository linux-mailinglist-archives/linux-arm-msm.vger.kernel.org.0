Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1DD56D800
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 10:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiGKIaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 04:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiGKIaN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 04:30:13 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44C111F2E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:30:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id c15so5374261ljr.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c3iEWvXk42qlaQ1qEYi2t2qktg9E0Gqje32kNcC/AaE=;
        b=pSCTwj3BO8/QQi3rTpFWMZX4j/6gmQu+IR9lgQU3FP8SLiVVOuFdKpHIIkBgIvfNu9
         XbH218ZQiapHGrOrhkpRp1BBlccrpyNIuyl4NM7pZ+Ut2aSnZg7nHERtm+xrZ+Bu1YlA
         mywWuJ1KcSKTcG8l68C99iH+1nzOQ3ID5PgAzvxNAfSs/tBPMZ8Fi8wXgDogySvF3Z1y
         caEwWc2gb3aWJHO8n+WaDC4DRG4Xp7gFTC7bVwHX3+OxgeD4BLjzZvRWSbwyOB0vmG2d
         hzrmuqkv4+qXZv/koFxtVf7+SSkPtQG8ZecuhzdriQpSESrXrY6NBa+H/jOBcmKkrJnQ
         Dbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3iEWvXk42qlaQ1qEYi2t2qktg9E0Gqje32kNcC/AaE=;
        b=G6L4yEslgX5Ybpf7B4UL3QKrEQbmMvL8hsLlqR2CZVsR+Ra9x3agY4gTnmQk/pd+LF
         HUwC2JyFbbXlZBVnIKNf1ctO/pyUbgfBft/IIf+p+5HbdG/YlHecGft4egJ5QTsMkqta
         F/FoCNEpO8Uy2p2aDCDcptOQKD7HRfHjzsRh40r8D9ABIiLTQKilPv5Kv6Fdan7xy6P8
         +FnrI6xgx8fcTZXMP5r2NRL2mqqbPvSokI7Y4u5vTzktCNKs+se1TsDHx5tW1jPTm8sA
         7yKpIyIUbfjPUMsSuqmqcFvPPT3uFDKC0DktS/gZEUzC9s3fXmBwyQo2wss3hF5DyEC2
         qCng==
X-Gm-Message-State: AJIora9XlPGLSGgsoWbt+Lwlgo3QfTxpfF/XsAN6jv8Ro0YiEukJIkEx
        +PStuFr203IrHOrjdEFuMCGlcg==
X-Google-Smtp-Source: AGRyM1udjxHDIpCgvVnZJqTIKtWPOgZDEO+WOSsQI0b7Af+dV3w8qhzoHvlXStC2q8l2PaJx4+OuYA==
X-Received: by 2002:a2e:8710:0:b0:25d:4d99:4f0e with SMTP id m16-20020a2e8710000000b0025d4d994f0emr2892655lji.448.1657528198445;
        Mon, 11 Jul 2022 01:29:58 -0700 (PDT)
Received: from krzk-bin.. (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id u2-20020a05651206c200b00488ab8914b5sm1401504lff.213.2022.07.11.01.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:29:57 -0700 (PDT)
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
Cc:     Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/5] ARM: dts: qcom: align SDHCI clocks with DT schema
Date:   Mon, 11 Jul 2022 10:29:40 +0200
Message-Id: <20220711082940.39539-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org>
References: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DT schema expects clocks iface-core order.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
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

