Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07429262D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 12:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgIIKeu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 06:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730174AbgIIKcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 06:32:43 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA822C061573
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 03:32:42 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id n25so2851527ljj.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwAqgLDFoiZ8Gp5IMjmzgXFUfM8xNPZ5Nw/2R+ILIJA=;
        b=gTin0jb26AUzeAWsywkd6d0QDoWLv/cyzhX8QJu7I0DZhOwNb1Nw7GDc9AGAFIpjN5
         QNQ4J8SmVX8GcQdYOjM8ONoXccnMLm+qyBCeSTmxj6PTm9cxG2gtB7/bOh/DT285rpeF
         BR6etFI0dNEgX1BiF2sr00FhiZEKwMgeFwNP/gO0iBtdQE6rQg7VJbu71esbf4UYNjYe
         /HhxYxcK0llieBrQO3vRYdJxgBY+/KtBDnXWiAgFlKVTwWe0tVlPeHa5rNelPqMEyAOf
         bfuWNjSjb0kUaF3Wj8A0UHGTjU/UZjCGFioYQ0qPMFySYOkNUHtEyifntjjntt0dr2vh
         8OUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KwAqgLDFoiZ8Gp5IMjmzgXFUfM8xNPZ5Nw/2R+ILIJA=;
        b=Cumk+FbJP16eOTpS9/SFPEKItddkcZCNxcKYL5LPOTJWNWVvJ1Vx67C/vBSV1T4ipZ
         iwrZXt95ajX9KxuVNCb1xSFJol+5c1Dy/QPyDlaQ9a2L5E6ghD8AFfQtuw5KVMEGvbzt
         oFk6Bmi4PVyH4u5ci+ssAO9zf5WS3obbbGYaCR2wvLmZC2DhFBOWMEBiaCpuBHhHjfSA
         2iU0AOArcqqLilaukTYqPElu6EyRAm8/FF/bX9p60bo9wZMO6GP6rAL4gBmj/vGM8xcM
         lyfF1S6wtQ11pKwIjBwXewpF5XlpR1NKIO4Py0q0cT43pMn9wRie0d+kCrV70BIA8xF0
         Wo3A==
X-Gm-Message-State: AOAM531T1OtzxC7n3i3v1AYVTo2H4K+kJ45I0m913RdfOiSnU46LqMLT
        Oh+2Z9efu7IY5f8r+UmvuaVqzA==
X-Google-Smtp-Source: ABdhPJwk6u/U6YI6i2LZQ48LWeVQEqDnJzdW1ezgNdCybVQQsv/sirCteOQjoKm23cV3egOaBs++Bg==
X-Received: by 2002:a2e:89d6:: with SMTP id c22mr1648832ljk.242.1599647561213;
        Wed, 09 Sep 2020 03:32:41 -0700 (PDT)
Received: from eriador.lan ([188.162.64.180])
        by smtp.gmail.com with ESMTPSA id u22sm632253lji.65.2020.09.09.03.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:32:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] arch64: dts: qcom: sm8250: add uart nodes
Date:   Wed,  9 Sep 2020 13:32:37 +0300
Message-Id: <20200909103238.149761-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently sm8250.dtsi only defines default debug uart. Port rest uart
nodes from the downstream dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e5525df69946..552fa3df9e4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -551,6 +551,17 @@ spi17: spi@88c000 {
 				status = "disabled";
 			};
 
+			uart17: serial@88c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0088c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart17_default>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			i2c18: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00890000 0 0x4000>;
@@ -577,6 +588,17 @@ spi18: spi@890000 {
 				status = "disabled";
 			};
 
+			uart18: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00890000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart18_default>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			i2c19: i2c@894000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00894000 0 0x4000>;
@@ -693,6 +715,17 @@ spi2: spi@988000 {
 				status = "disabled";
 			};
 
+			uart2: serial@988000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart2_default>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			i2c3: i2c@98c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0098c000 0 0x4000>;
@@ -797,6 +830,17 @@ spi6: spi@998000 {
 				status = "disabled";
 			};
 
+			uart6: serial@998000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart6_default>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+
 			i2c7: i2c@99c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0099c000 0 0x4000>;
@@ -2410,6 +2454,21 @@ config {
 				};
 			};
 
+			qup_uart2_default: qup-uart2-default {
+				mux {
+					pins = "gpio117", "gpio118";
+					function = "qup2";
+				};
+			};
+
+			qup_uart6_default: qup-uart6-default {
+				mux {
+					pins = "gpio16", "gpio17",
+						"gpio18", "gpio19";
+					function = "qup6";
+				};
+			};
+
 			qup_uart12_default: qup-uart12-default {
 				mux {
 					pins = "gpio34", "gpio35";
@@ -2417,6 +2476,21 @@ mux {
 				};
 			};
 
+			qup_uart17_default: qup-uart17-default {
+				mux {
+					pins = "gpio52", "gpio53",
+						"gpio54", "gpio55";
+					function = "qup17";
+				};
+			};
+
+			qup_uart18_default: qup-uart18-default {
+				mux {
+					pins = "gpio58", "gpio59";
+					function = "qup18";
+				};
+			};
+
 			pri_mi2s_sck_active: pri-mi2s-sck-active {
 				mux {
 					pins = "gpio138";
-- 
2.28.0

