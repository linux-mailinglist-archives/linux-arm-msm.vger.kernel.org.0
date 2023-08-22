Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9799C7836CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 02:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjHVAOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Aug 2023 20:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjHVAO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Aug 2023 20:14:28 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E73CCD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:12 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50079d148aeso2974903e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Aug 2023 17:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692663250; x=1693268050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=ejzGhatdO24wkhI43naTp2G2hs0+rNOinfhFFk3x5nvJS9Cj0GqzXnv+I7QMndufrS
         xk6nup5hNDsH6qQvmKt791F6Xm8p5K1oB23X34SjEg3XEWbsuRZ4nCmP46MoGzhwX/jt
         T4Fit+wolNLGw4PC4qruUXvAjCthtCH31+gRvsLmyni3Miq2ZNpfMOVQvzRZRTfkP0hs
         UlY5b79Ia90SQiYsvZ2M++YCX/4pdfXYDNDQd7V0L+oPJLcTtN0wE16xlIUld3YRGBi7
         ekCRAtD147+uaqG/Z3TIWcLvpQOB/a0BXkNJdChrWvi92Kqw0MMRyegj6YciZkwdZHqi
         N/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692663250; x=1693268050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm6eWdkXRtbkiE6yiEQEBoDe5iM/WM4eQNZl22nI37Q=;
        b=GccCUa9ltUsWB0ydfR7gQ+pDh7Xhzw0NPkFqwLEePIBmOw3x4EcjVQKEUO5Jq7oA+x
         hV4eXtoeaprVtUJxh5UMME3yvOJKHRHAxfjA2gz3RXJk6vRzAPcsi5Ew66rXLmRpyi8A
         amWeFlogw1+PEotLvAs7sQuNeBELLfkQDzdMx0ZjthqMVsYrO+w0ohqLCj8no9QPB+re
         NCxk0E1HuxA6GVVZspzAza3JhPqEKmPyVNhlIb2wpuyv+Px0tg05zkBIE3ingi7Wz+f1
         9CWv1+AKmq6Ni/2vBTIFqI0mQpXvzK/RiVksFAe59vVWaoCAu2cXVfIK8UiktbOmkHqf
         2BWQ==
X-Gm-Message-State: AOJu0YxbNsYaJuP13oZshneKHoWXc1gqxvwM6Ofta+x1wfWn5RjyJmai
        7G5lWxPE0YFZJQb7AQEsKmcU8Q==
X-Google-Smtp-Source: AGHT+IFFNHgn/IfAUuY6CFfoBCbITjV7ukrhCJT4hXQVbJdWRpXK6xUt+SV4hWADjjz22VqIkiKm3Q==
X-Received: by 2002:a05:6512:477:b0:4fe:2c6:1d76 with SMTP id x23-20020a056512047700b004fe02c61d76mr5114842lfd.21.1692663250344;
        Mon, 21 Aug 2023 17:14:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id er23-20020a05651248d700b004fe36e673b8sm912024lfb.178.2023.08.21.17.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 17:14:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v3 24/32] ARM: dts: qcom: pm8018: switch to interrupts-extended
Date:   Tue, 22 Aug 2023 03:13:41 +0300
Message-Id: <20230822001349.899298-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
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
 arch/arm/boot/dts/qcom/pm8018.dtsi | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8018.dtsi b/arch/arm/boot/dts/qcom/pm8018.dtsi
index 85ab36b6d006..22f3c7bac522 100644
--- a/arch/arm/boot/dts/qcom/pm8018.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8018.dtsi
@@ -18,9 +18,8 @@ pwrkey@1c {
 			compatible = "qcom,pm8018-pwrkey",
 				     "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8018 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -38,8 +37,7 @@ pm8018_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8018-rtc", "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8018>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8018 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
-- 
2.39.2

