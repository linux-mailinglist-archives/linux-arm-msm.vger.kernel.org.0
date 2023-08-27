Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89DEA789E7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 15:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjH0N0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 09:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjH0NZ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 09:25:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CD0FF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5008faf4456so3653918e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693142750; x=1693747550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=ofLh/toEAcq/WHg+F9M3/6uUkHEXr4fyuYuFRKu8FRpPFkFyMwLD6T/IflVI8zEI+M
         2PjCbAHAD91ej666QLYwS2Cm6IbnqC4zf7+qBceo/K+eCFQBUTNhEHXDxLkAuYpcXal6
         rh6NXdR8Aevy/SL+eEe6QfO2Wp27t/hKu6pjSGyStsDu5f3tFR2gSQCXlQ9OIJ8KFnMC
         qcwaXXxVyT/36Kx9BmQtxhpKdY71B+p1mMBJhue7+7dSFR5zCKx0Twxrr8RDypIgk+n+
         3Y3N2tqSTUU212P2XtVyqqjrp5/YhPm3i32wSIpvoWwcFYKycHDnoEhi1KZ6kE3OJ816
         JAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142750; x=1693747550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrAjsdbjqNoZfzO46ca2VQOrSbv12nquDzMHZ51VtI0=;
        b=kuOtHSOrQGzkJPj7lU3O55FDuCfpKwte5ETipXWEVGqdfd4Me1xHti9o/jJity6EiT
         3sWlWmeAFAOxtu5LrpC/TNBYP5O3Jre85hMYd4anOQhEJrVxW8/SfEdiEU3ko/8dY/Us
         xqk6fvSZAGMD8rWvxdH8cYCnpllrae4HMb5QarWm+hgbCo/1cRSeSnyyuj0HeqCc292V
         kUqRwo1+NYvKR8XvdjeVp6kx+h1VndY/p1q6ysU5JlFFC7t3sz/OBbl0I+s+31o1Jtu5
         YFVzSTfrRQieU+EYY6RdI6ObTnZuJkS0Xttrb+krMeZ9x7T2zcFac7DY2+kKlYl1d6zz
         X/XQ==
X-Gm-Message-State: AOJu0YwQqkl/HjNNaj1FrEK7VeuWxJ8SHjvJG0gTUxHG8zRZtilnDo3J
        zmK0t87VtLvKiQx8uWsA+CDvvA==
X-Google-Smtp-Source: AGHT+IE76jSW/2MTaTzMC8tmOvvu/DyCvElrW2L/qNDRRacY511/Y9tOhmUcyOKoq6lx4tn7X7MHVw==
X-Received: by 2002:a05:6512:3a92:b0:500:ac76:4a61 with SMTP id q18-20020a0565123a9200b00500ac764a61mr4375163lfu.65.1693142750074;
        Sun, 27 Aug 2023 06:25:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t9-20020ac243a9000000b004faa2de9877sm1142040lfl.286.2023.08.27.06.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:25:49 -0700 (PDT)
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
Subject: [PATCH v5 28/37] ARM: dts: qcom: pm8058: switch to interrupts-extended
Date:   Sun, 27 Aug 2023 16:25:16 +0300
Message-Id: <20230827132525.951475-29-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
References: <20230827132525.951475-1-dmitry.baryshkov@linaro.org>
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

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

