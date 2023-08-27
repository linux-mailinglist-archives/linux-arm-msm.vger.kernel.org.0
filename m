Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1497E789A88
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 03:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230158AbjH0BAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 21:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbjH0A74 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 20:59:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCE7F7
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff882397ecso3190804e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 17:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693097991; x=1693702791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDlULPpCaiOZl9KqGYW1vmjYvdhVYMx48DSYOBdmQVg=;
        b=f3f9pTfM8wrxDFvrzgFSj6BKGxEbZVn/Nok71cv0mNzmMcl/roa4BhYvnsqcgTy6ng
         ocaS3KR5AOaYzZATg5IK+5WCBXwa3KLh+CQdxmFg45ny1WKurYkEboejX/OssNvDq3gC
         6dekKCGylNYqRkwcs6CcOaQQwfiCWQop1ng2/6gRC/mww0wOrNqIe+Andjl0dVzTwDuO
         /7xnpUKResOjvM+Vk0w00Ta1H9XtN+y7hZijkDoolWf3Zj7UTgdagADyV9s/veMxT/qS
         3TW0frtDSLvfXK5PwRboyLrWQxff9g6relSU1ufi291YERNBgqgoCPs9SqhOsaRJEdy6
         ZQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693097991; x=1693702791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDlULPpCaiOZl9KqGYW1vmjYvdhVYMx48DSYOBdmQVg=;
        b=IM23Dc/v1SlaATQaxyLBRTUoAnaDOpseWIa7Il/7v+AB1y9Qc/2seCGdvXyze6SxtG
         /MOfQGZ/fjN/S2pF6Dsw6GDC8ZHGBAEe11ujmEPh5huN0+YCtLSabyb0TIhpJknmBwsp
         6/h1yiXCw0gd40KAIHhSVJTeYcmrfxPIikLih1nUpVgj/AgCI5CkMbaeOgzExwpWq5o6
         5HP/HVdiJvcS9/3w87ocryet5uW2Up5ykfZrcZxwV/+MxUbzpVNZOjRO/D/9o0UEFYR2
         /7ntXvGgaTN7Jvz6sWg78umAHb/oWa6NHck+9G0zfIITylERURazC+0C7/SBkTPUu7iN
         ZVcQ==
X-Gm-Message-State: AOJu0Ywcg7wcANMzuwhG4YF5gt0I0nvx7gAPVHu0fGqGTIj3/n1YHc3f
        BeoEhKKdAqS4uPJN460CmwIux9pT42NHiKB+q34=
X-Google-Smtp-Source: AGHT+IE4eJ1wGIoPX4LNFyUadI2j2PYWymBce+hv1uTDaLOvcWMm0Rs5rapv1yFAh41R0Vyaz0tDSA==
X-Received: by 2002:a05:6512:2347:b0:4fb:89f2:594d with SMTP id p7-20020a056512234700b004fb89f2594dmr20608440lfu.63.1693097991059;
        Sat, 26 Aug 2023 17:59:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020ac246d2000000b00500a08e42e7sm917729lfo.124.2023.08.26.17.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 17:59:50 -0700 (PDT)
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
Subject: [PATCH v4 26/38] ARM: dts: qcom: pm8058: use defined IRQ flags
Date:   Sun, 27 Aug 2023 03:59:08 +0300
Message-Id: <20230827005920.898719-27-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
References: <20230827005920.898719-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use symbolic names for IRQ flags instead of using the numeric values.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8058.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8058.dtsi b/arch/arm/boot/dts/qcom/pm8058.dtsi
index 913a511719fa..3683d7b60918 100644
--- a/arch/arm/boot/dts/qcom/pm8058.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8058.dtsi
@@ -12,7 +12,8 @@ pwrkey@1c {
 			compatible = "qcom,pm8058-pwrkey";
 			reg = <0x1c>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <50 1>, <51 1>;
+			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
+				     <51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -61,7 +62,8 @@ pm8058_keypad: keypad@148 {
 			compatible = "qcom,pm8058-keypad";
 			reg = <0x148>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <74 1>, <75 1>;
+			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
+				     <75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
@@ -135,7 +137,7 @@ rtc@1e8 {
 			compatible = "qcom,pm8058-rtc";
 			reg = <0x1e8>;
 			interrupt-parent = <&pm8058>;
-			interrupts = <39 1>;
+			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 	};
-- 
2.39.2

