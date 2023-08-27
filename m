Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 239B8789A70
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbjH0BAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjH0A7v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE7C1AC
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:48 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50098cc8967so3399550e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097987; x=1693702787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=CrNnzPEBR/u80hfBfGuaZ76+3zwonnLNnJFoJ/0fD1GQUG8WfM0FcINco6rpeOrp8s
         0fA/NyKXzzrG7SizUyWUpg3zVk1g7Qwq86McW4S99nZTOIbWR+Mrpx/SlGq4t776M17S
         ls/AY9mxuDhphYuy4vkdLpmhTEvLCHruvPVuVjZmdumOt7hNCafE3na402yr2lHXDxZl
         8StMEzd98GeDJtD+vxKEHHHyO0riPzp2tGrocGfVuIWbjkf9dwREquy2ZpuSGyx5Lg2N
         XP8lkRHZGhhChcMfDoLXVPcJ1mzxo57To69oh1J7M7fBR/RHQKkIMeK1thWfIB09EgSQ
         jC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097987; x=1693702787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=FPCWElKY5A39rzAuGI+/DL3+LHdIY2roKXCFx71EBFkdM6p1rbGSNZrNPnJc0phNK8
         Z1FhmAttIsz5ziMGh0BTAv5V75z7XZWl7FZkSVbU6xHN/Zaxxko5uPy2xwDDIkU53LNK
         upxdZgqytfBFryUIHoC5yJOXs1JQNqGuSORi0JMqCpNsaPmeTEyQn0razh3bvGlZPsKt
         jdssB7yNi1WJSK6CswL9eEZ6Li357vNzHfnvkAF3AoB472HhYtogy7c3d74gJKbK/khz
         Rkd/DGwHO/yO7jMHRXb/00IOkE9lqSxVM78P7JImWNDb9xeB4ftAxBBQRz3SfzIuWtE4
         yNcg==
X-Gm-Message-State: AOJu0YzRAdByRuHDQ0BAuERjM+TcSxkGjO3B8pCUkUmN5Rcy1yAH4ikY
        1z4cNssv+hKf1uww64D4H/1bMg==
X-Google-Smtp-Source: AGHT+IHlHqfeFOsgs18zar/rpDRPiEbLSMQgd3D1l9wYNzfC/6kYSnaggtHCQswJQKEaRdqQa0s53w==
X-Received: by 2002:a05:6512:ba6:b0:500:a378:db71 with SMTP id b38-20020a0565120ba600b00500a378db71mr6987582lfv.57.1693097987296;
        Sat, 26 Aug 2023 17:59:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH v4 23/38] ARM: dts: qcom: pm8921: reorder nodes
Date:   Sun, 27 Aug 2023 03:59:05 +0300
Message-Id: <20230827005920.898719-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move pm8921 device nodes to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

