Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CA3744DE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjGBNnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjGBNnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BBBEE55
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:35 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b69f958ef3so56475291fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305413; x=1690897413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XekRfkcT6z5xG4nHPEwX9QKj0KBdkUaREwMz45PY2ck=;
        b=OrayinCtlIzm5qjGqMRQ8j1pvGy5xqfTL+0yKLWhKr6wXBZz1HesI5y/Xo7/XXI6hy
         EbF4JWjzBGCvzD5CUIc6djfkrnVr8imKxiVFgBo+hwFeug5H6YWq+I5yTzgMD2Gm2doY
         JilmJjAQg9lltIN3zZiNQ1y83clqg+NbQ+VNFeEdfxdQUGJELtTwtACZfKNa+dqCKLyT
         4A0X/1Y09GD2xFV0FCr475UT6JMUsT+bvggdg8kqB92xO0PXHJmMaMpaphGVNtOR5V5H
         7j0LYslMc1EpNzgTVQLBVtB2LVSfvEVkWtPYU9I8fppZ79htQWcfHrlDZOa89Z7mzybx
         FqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305413; x=1690897413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XekRfkcT6z5xG4nHPEwX9QKj0KBdkUaREwMz45PY2ck=;
        b=cXjXxkwx64CH80M8BewqYstUDnWxRMAWeIAdcotrqzLNnhWcR8wKrDQWrbW5ihNPnZ
         RJkHPvRpztCLeqgq/a66BmgIf3Qm/hSgTu8vTnf7nlZGaOHXx4+M+thUWcgHw3suYKzs
         vPUjeKIjYb/PeHyqQuf1+V31jANLPzCGsKwr/u9Q9Tj4rnpKMmoVVRXFZ5BOhdMYr5+W
         GDZoFiKeGxJSBUPm9+5RLcCYlQ9Rh4RQP8FVatqelUlgsln6lWOMLzrcH36HOPq6IsOS
         Eznn3d9pmOR5C4ARCvS5ljVhw2SkrkDQsOeo0C4TFJL1nmwxkf85AbioFVappA+OYG6j
         zciQ==
X-Gm-Message-State: ABy/qLbfZWZdDhi58beqPSPvixMsPDm8KvLYuiiPxeL8+kjPM62rdeYr
        mOgEGMSGKaqJrmohMTwmYPLCsA==
X-Google-Smtp-Source: APBJJlEr6aNBFLDR9O5yWfF2MvurwTlTa0KQaPsiQRDvpn1jAXMg+ICa+c5zZB7RXBHRpQAKwHmaFA==
X-Received: by 2002:a2e:a172:0:b0:2b4:6f70:c390 with SMTP id u18-20020a2ea172000000b002b46f70c390mr4484309ljl.15.1688305413725;
        Sun, 02 Jul 2023 06:43:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 16/27] ARM: dts: qcom: pm8921: reorder nodes
Date:   Sun,  2 Jul 2023 16:43:09 +0300
Message-Id: <20230702134320.98831-17-dmitry.baryshkov@linaro.org>
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

Move pm8921 device nodes to follow the alphanumberic sorting order.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index ad41d99ab265..4697ca33666f 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -8,17 +8,14 @@ pm8921: pmic {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8921_gpio: gpio@150 {
-
-			compatible = "qcom,pm8921-gpio",
-				     "qcom,ssbi-gpio";
-			reg = <0x150>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-controller;
-			gpio-ranges = <&pm8921_gpio 0 0 44>;
-			#gpio-cells = <2>;
-
+		pwrkey@1c {
+			compatible = "qcom,pm8921-pwrkey";
+			reg = <0x1c>;
+			interrupt-parent = <&pm8921>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
+			debounce = <15625>;
+			pull-up;
 		};
 
 		pm8921_mpps: mpps@50 {
@@ -32,14 +29,12 @@ pm8921_mpps: mpps@50 {
 			#interrupt-cells = <2>;
 		};
 
-		pwrkey@1c {
-			compatible = "qcom,pm8921-pwrkey";
-			reg = <0x1c>;
+		rtc@11d {
+			compatible = "qcom,pm8921-rtc";
 			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
-			debounce = <15625>;
-			pull-up;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			reg = <0x11d>;
+			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
@@ -53,12 +48,17 @@ pm8921_keypad: keypad@148 {
 			row-hold = <91500>;
 		};
 
-		rtc@11d {
-			compatible = "qcom,pm8921-rtc";
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
-			allow-set-time;
+		pm8921_gpio: gpio@150 {
+
+			compatible = "qcom,pm8921-gpio",
+				     "qcom,ssbi-gpio";
+			reg = <0x150>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pm8921_gpio 0 0 44>;
+			#gpio-cells = <2>;
+
 		};
 
 		pm8921_xoadc: xoadc@197 {
-- 
2.39.2

