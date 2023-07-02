Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB6F744DF1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGBNnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbjGBNnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:45 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD276E7A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:39 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b698937f85so58139871fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305418; x=1690897418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1dgeXcAqpu2CEATEFRRE2xKFcKdVTADZyCZndc4P68=;
        b=qAL35phty+DRz5+XyfwjQ4mlPG8q9YUofnxpXHtAFNnR3vphavHeyeM0IdYgB7llFu
         YJ5McAyC8Q/yHTSGd5GZ2VnUDT3MHZRlXkOjlrFug1jNSCnUM/WC3PklZ18lYtA7U/OE
         JJxliGpK658Z0PKZB+96YBwePxgEXsT2buYCFX4CQkUXBXbCdf2zImqGR/3oWHp5FC2S
         G625DKOnhxayUurswUq/A9sNMUvJ15O9tVVsUURnLQbsR7UFSfkSI8OSoujgTmgh4Dz1
         jL9WIuhgu1jNUL2PS2D69fMkqn1Elata6EOaigpXwlT1yTAnj0ef0RzHXl3Alr/2ZgzG
         V4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305418; x=1690897418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1dgeXcAqpu2CEATEFRRE2xKFcKdVTADZyCZndc4P68=;
        b=gyA2S1pcVxOIM2bdQk6A1LzV3Y+47VMC9I00dyEOqymRNOcmplm2ejFdWSfyLNq6bf
         Fb53Wt+2BRUyIt2CWnSsPFPmxGlYIETT2w+uSUb9Bx6yhjprdzKov0knO+WKhvjJki2n
         r/zg43Reszn4JDhP1GTZb0z/nKTjCLduikF1a0L2A9GLrZ7Xlo3TTz/NNdrhfb6iL2I7
         0uBjnJhezisvM87R9YKiYS/iSw9dTYGLZXb+ZAqEIcjg5qA+rKR/u+Lvi21x3hEigA6Y
         wbhwiue3cpaVm3+ZqJXF81/J4UQsYP+U2CIdnG/S9TjrZEx/HagKw4N1S6IOLdIK4Kdw
         BgRg==
X-Gm-Message-State: ABy/qLaGKtsZtymtzjkFk7f6J5cxbbRX8qeYi9rA/1mCZeMqumxFMc2A
        mK+fkB/jjlq4cDNZ/PrTey22zQ==
X-Google-Smtp-Source: APBJJlFo1bhD4eh3qYPC7hJY/S4UU2Bdx1NYqFp/zgYpv8BqWPsp2Xpb5L7jjGm/0oeNV7V8dZov7w==
X-Received: by 2002:a2e:97d2:0:b0:2b4:79c3:ce03 with SMTP id m18-20020a2e97d2000000b002b479c3ce03mr4613174ljj.53.1688305418116;
        Sun, 02 Jul 2023 06:43:38 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 22/27] ARM: dts: qcom: pm8058: switch to interrupts-extended
Date:   Sun,  2 Jul 2023 16:43:15 +0300
Message-Id: <20230702134320.98831-23-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index 3683d7b60918..984b79777984 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -11,9 +11,8 @@ pm8058: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8058-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -61,9 +60,8 @@ pm8058_led133: led@133 {
 		pm8058_keypad: keypad@148 {
 			compatible = "qcom,pm8058-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8058 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
@@ -136,8 +134,7 @@ ref_muxoff: adc-channel@f {
 		rtc@1e8 {
 			compatible = "qcom,pm8058-rtc";
 			reg = <0x1e8>;
-			interrupt-parent = <&pm8058>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8058 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 	};
-- 
2.39.2

