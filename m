Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98A2262D4D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Sep 2020 12:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgIIKey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Sep 2020 06:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbgIIKcr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Sep 2020 06:32:47 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7859C061755
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2020 03:32:44 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so2871614ljk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2020 03:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KwAqgLDFoiZ8Gp5IMjmzgXFUfM8xNPZ5Nw/2R+ILIJA=;
        b=qfme2p06TfuSBtf1N7DNKoxc2NtFuAc0gLskY9VPHEmM3n6bHOhI8f3BIOiUhiQrqt
         1XAf2DtqIcal+OpjqFmqkVlSNIrqi2H2g3ekVHVNs3G0iy7k5SbupPcmimHp7oD2jjcx
         oyfPtkBAZ+tdn6HTteaDOLjnbNwM6Rn1ijz5Jwtz3cZu74LlbOOP8SMFDLJhxK080u8u
         5IgoOdkNi3y1tgxAb/LUHbM/vxDmkUNCKzv0iGtCLVCZAJ0FG6DVNvzWQTXL8j6TJuNC
         J8iO0jKRuOwjqxnJaYG9fZeRxi5IiWGXsmN05vbMVTVHA8dQwkAN4/ZSl/8W0SvBKMH4
         hzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KwAqgLDFoiZ8Gp5IMjmzgXFUfM8xNPZ5Nw/2R+ILIJA=;
        b=l5kYeCDA+rLlmJPjSZflQysyDfvTISnmLX92q6LfscIdntkGYrXdIE8e/cAuzJyzVD
         jjaYX7C/uustHgn4uh2FBVLqY0g+A1stLUaj82ryXcRSW2WRNuS6eynaFaBr2nEwvsPU
         0J947AqYSuZQNoKs/OtFW4N9diQ2HE56gbTLm96PP6X+D+nwgPw6ypeS3roUUl9VBgxn
         RCWI+l/9YAhLjV4LEAXJDgcGE1tmdiq7Pcd5aH8sLuxoJLGGR4FGmBxM+BoZLcs5gr76
         KmqLtQt7yXkoEoeODJaQytrXMUPAc8LownJQZrUWH4jqVZf1VFcpuJaUidKRjgidL6oq
         eQKA==
X-Gm-Message-State: AOAM5314waY8JMV8WzZ6V8DhgOOaSf6RgBj6DtWllFnoEp2APjv19ZdG
        fdRoERbxNlSYgOrX+PQc7q8Idw==
X-Google-Smtp-Source: ABdhPJylMKg5r2SiHubOTIUgzqEPZBZk1jp41GB03FgHWD6P7Q8OrGRvdqaiOtc40LL4TxPV7mTLow==
X-Received: by 2002:a2e:6819:: with SMTP id c25mr1634957lja.187.1599647562635;
        Wed, 09 Sep 2020 03:32:42 -0700 (PDT)
Received: from eriador.lan ([188.162.64.180])
        by smtp.gmail.com with ESMTPSA id u22sm632253lji.65.2020.09.09.03.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 03:32:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] arch64: dts: qcom: sm8250: add uart nodes
Date:   Wed,  9 Sep 2020 13:32:38 +0300
Message-Id: <20200909103238.149761-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200909103238.149761-1-dmitry.baryshkov@linaro.org>
References: <20200909103238.149761-1-dmitry.baryshkov@linaro.org>
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

