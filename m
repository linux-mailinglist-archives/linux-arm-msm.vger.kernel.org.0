Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00EFD7B194D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjI1LEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbjI1LDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BF11BF
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:30 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50433d8385cso20015969e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899008; x=1696503808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=S7O0cA8YobzWmb/Kh5x0A/PmvcEIz308lCyufvygLLD8j5PveDSM6uBRGpUOByg4Sp
         SYMcWq7fsHL0FAf6WyDxthhX0n3QbXnKD2PJ6agZSrzQ2KG/soOUWFoYPRhPzxP7/2ZR
         wnxWaOr8vS18VnAngO+LbdUXNzlgU4+Dq97kCY4C5ihT7EZqAE+og0kSQb4bUz2sqAxK
         dQvgj/jG4WIHd2dqpg6TwQCQwN76gCmY7+POYX11lNxXi/EHH67wQKXAC4M4aK9gAr0l
         oTvlEa/63a9eVo45MPNGJvTxCFqakpGe/TpXOqCNv8I4+YvE12adfEOBgCE8Va39feHy
         T2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899008; x=1696503808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVO+2iRIEEW1mZ3SKc/B2s6KoIhcuuodrBJKzq2EnPA=;
        b=kE2+zApXvISZ7FY3u51gdAoPXFf4BzjQBphYvJSqS6PGFQzxc6+kZYx07JqCRGmSLl
         HAWemNDWnMz5EXVQEYBZ1jpk5KFIICWA9wAMhFOQV82XI8MJgmXmL3juVUzeNjfX65Op
         R9Px6tuM+JBfNyzTTK40uO4PXV8uqDPtzHYgZCYHDM7pg90F/j1t1csT4VLs7qhckmjU
         tR7YxxxVmQkjOGxj/wLXQOEs7a2AqlsSwX+l25VGgfHdEJTOEuqmCi8a7GcVOohPmFWR
         KHC+6AY8anyfRjpv8J18MprVmyEVvh0ZRVxJGlXqc7AjZsuxhrViXd2bnpiDlxB4tjn9
         5nGQ==
X-Gm-Message-State: AOJu0YzhhyjY8dOPYn0cQYi1CHvr868Fsoaho9ATc0G55/JXg041uNmg
        5UgccvkqAHVeZ1TOZtDkjqZgWw==
X-Google-Smtp-Source: AGHT+IHf2lQnijNjOHSWAej9gzKXSuuiG6Jj757JJuz2qU9t4sz1UeZ+I4nzYoynPQdLW/RYqgi9Gg==
X-Received: by 2002:a05:6512:3e20:b0:503:28cb:c073 with SMTP id i32-20020a0565123e2000b0050328cbc073mr1172243lfv.58.1695899008687;
        Thu, 28 Sep 2023 04:03:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 21/36] ARM: dts: qcom: pm8921: reorder nodes
Date:   Thu, 28 Sep 2023 14:02:54 +0300
Message-Id: <20230928110309.1212221-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
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

