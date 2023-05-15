Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8B4702D61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242116AbjEONEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242088AbjEONEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:04:32 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C35B1FCF
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:04:31 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac81d2bfbcso136778351fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684155869; x=1686747869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGOJOYG70cN/KGmZclN4Kq6rfFVITAlENQe3wvldGFk=;
        b=a5nDGF7rksHDgevXg2zyWmIWc8vj2V5NROKEZVW5SsCDhfUkFbh/HagIviZR+7JvI0
         LTwBO0a2RSIYhHRNQ75PAfl7gwOmFDzd8iar6DtY91nhlhFuvOT6+ajuq19iZAzbzu3Q
         tjCm3FWOdHmDuT0XAonZWPFrGRKNfDZNZXXzWmixbYTdQF214lu9No8kgV5+C7WbS/PI
         5wSkaqOs40/HPFF3Pv426msimLO/iA6tT89HztE3jMvgJnbUkqrFeqysE4+cu2aNoGrA
         1LLctSnuZngzIDd2ohtPyN9Q/LbkzY4hsQSp7U5hkwRAGef5ReFS85WcqTbfIQrcyMCX
         S3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155869; x=1686747869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGOJOYG70cN/KGmZclN4Kq6rfFVITAlENQe3wvldGFk=;
        b=FDdV2/Y3GqSZb+37Cwk5MzzTX+H2nIhx2yitR+4sZBvVAH2Ybs9/Pt6L1KKi8tpx/K
         +/P9LFRFUQniGIcc1+MaUOHfHXeMM7aOBd1wSyG5k5EJCwPm1k+yR5pCAqOtPol3wh3S
         vHoHTWISgldQZ6rPCxqctRqWIk+pbyDqKcZKKJhQtT1MHks3iLitcI36v5as/aoa/edw
         JX7JT6AcTsnVy7/D+FBUxV4tsPbUc2zUmN0x8WxMlI12eiTJ0mk/FG+A86Fw0IH3LRCs
         5EvrehHZ/kdw4Y81jpn0w0d9Cek2KHB4pzU3BFK2Yi1AfggBsB5rpXBSvFQNGmPIJiMF
         2+cg==
X-Gm-Message-State: AC+VfDz6IIDEvSV5pf5kp8DIgsqvZv3GE5i+PUcFhWDNz7b2aevIIGuK
        Do17pjDAHjTn0h4+0CcF0DJvFA==
X-Google-Smtp-Source: ACHHUZ62QeRsBJLuZ86JMb5gIDlBTyRP1XPTcVM+7GKy4gX/gFNF1oWdNsslGDUQa6nUX/AKEi4JKA==
X-Received: by 2002:ac2:46fc:0:b0:4e8:4abf:f19d with SMTP id q28-20020ac246fc000000b004e84abff19dmr6724908lfo.15.1684155869511;
        Mon, 15 May 2023 06:04:29 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id x27-20020ac25ddb000000b004f37a64c90asm785823lfq.303.2023.05.15.06.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:04:29 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 15 May 2023 15:04:14 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: qrb4210-rb2: Add GPIO LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230515-topic-rb2-bits-v1-3-a52d154a639d@linaro.org>
References: <20230515-topic-rb2-bits-v1-0-a52d154a639d@linaro.org>
In-Reply-To: <20230515-topic-rb2-bits-v1-0-a52d154a639d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684155864; l=1837;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=gmZbSh+JOUC+q5+4Lzmg2xUn1mIKUGv1YtKkgkYpX78=;
 b=fZAz1gy9ePR31Ep8NxEzX/W0TI0WEiBFUIeyMvp9kchEpAsW12jE3xheLtb/D+6lfseIw//GW
 +NHQruS5/M2DS4c3wnx0n0kdFILoBibvbEBjQaIYHdPKjHvZRNOpNK6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the three LEDs (blue/yellow/green) connected to TLMM GPIOs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 36 ++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 9b539720f05d..eeee268ebfe2 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "sm4250.dtsi"
 
 / {
@@ -30,6 +31,38 @@ hdmi_con: endpoint {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-bt {
+			label = "blue:bt";
+			function = LED_FUNCTION_BLUETOOTH;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&tlmm 45 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "bluetooth-power";
+			default-state = "off";
+		};
+
+		led-user0 {
+			label = "green:user0";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&tlmm 52 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			panic-indicator;
+		};
+
+		led-wlan {
+			label = "yellow:wlan";
+			function = LED_FUNCTION_WLAN;
+			color = <LED_COLOR_ID_YELLOW>;
+			gpios = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -385,8 +418,7 @@ &sleep_clk {
 };
 
 &tlmm {
-	gpio-reserved-ranges = <43 2>, <47 1>,
-			       <49 1>, <52 1>, <54 1>,
+	gpio-reserved-ranges = <43 2>, <49 1>, <54 1>,
 			       <56 3>, <61 2>, <64 1>,
 			       <68 1>, <72 8>, <96 1>;
 

-- 
2.40.1

