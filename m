Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E8B5A1127
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Aug 2022 14:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238276AbiHYMyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Aug 2022 08:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241153AbiHYMyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Aug 2022 08:54:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4F1458092
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:54:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id s6so16877676lfo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Aug 2022 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=EOx+15ISuVM78YfbcntTjxV0FVrXSMFcqt6tM497CRo=;
        b=yHP+BN/UKDYtDzYiq/rIXsIA18QX/NrZzsC/CPWwBgG5EYw9zcr1Hqre9vwCG5qBaZ
         l/WruHi0u2t/doB0slX0BRaM2q+F8Uzu5G+D9dEkoVwUQjxa7EHYXsNUkXiUIsBFQvbK
         MpWkZQZM02eStdniO3G14wGL/qxvf7RnFDfip2PHstqL7ii6tiX4wcQxz+w3NUZm39Ud
         2y4fZW3FhbHNBZROFpKRWESv+U/bKsGF7x3NK+C+6Nv3UFvZN6imHw5TujfY22f8Jirv
         YKQOCswFojEbNcErt+Ju+SSUnn9LJBC8jL45Tts0INAEq0s3ypoAa5k/qmwW8kDPFbvR
         GzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=EOx+15ISuVM78YfbcntTjxV0FVrXSMFcqt6tM497CRo=;
        b=TghtCi1xW9F1QLc1YqS4/mhra66IItZNHDrRBG+oqKl3B3VdiW2PtchlgpWVGi2dZ/
         qJrApsik0LcF3tp+uIr9o7jghMA0AOW19Z6E7vn28pi6pZNHCpBWIV8uP6p5mYtxHQB+
         zip9vvIRFlLhsrub9wPwVe1vXeGVfm0BUvu/QnHbOwz48z3elknSvY76HZRnKZvp0yqq
         +1ZX56fpJfnYmTafUlAC71JJwWZRnSWIQIvf2N8zpWmJb1n/KT6XA3QlcXd3IxDFb3LX
         KocfFYnWfAqGVHEsx6MoIet54QEwC1K57u6jpy7TBHiCDpMeED4mSqolhbQyrlbl/p2o
         g3XA==
X-Gm-Message-State: ACgBeo2bouswAwtjE9aQqWaPC7egCQyUdOoStJSgjxhUwFvK9oge70mZ
        fvbhV9ZAzhb8WjpPjVi+l0noTQ==
X-Google-Smtp-Source: AA6agR6BP1BgBSeSUEslZV2i7sVqW03Iw1CWgpxNG11S8Ggo1zhlJ2LC3F/gYAgRr4rC3hZIjeGYdA==
X-Received: by 2002:a05:6512:681:b0:489:d509:e076 with SMTP id t1-20020a056512068100b00489d509e076mr1279352lfe.618.1661432054902;
        Thu, 25 Aug 2022 05:54:14 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id z14-20020a056512370e00b00492e3a8366esm494304lfr.9.2022.08.25.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 05:54:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND - dt 2/2] dt-bindings: leds: qcom-wled: fix number of addresses
Date:   Thu, 25 Aug 2022 15:54:10 +0300
Message-Id: <20220825125410.232377-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On PM660L, PMI8994 and PMI8998, the WLED has two address spaces.  This
also fixes dtbs_check warnings like:

  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dtb: leds@d800: reg: [[55296], [55552]] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/leds/backlight/qcom-wled.yaml    | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index 5d66c3e4def5..4c15693f7a01 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -26,7 +26,8 @@ properties:
       - qcom,pm8150l-wled
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   default-brightness:
     description: |
@@ -171,6 +172,9 @@ allOf:
 
     then:
       properties:
+        reg:
+          maxItems: 1
+
         qcom,current-boost-limit:
           enum: [ 105, 385, 525, 805, 980, 1260, 1400, 1680 ]
           default: 805
@@ -189,6 +193,9 @@ allOf:
 
     else:
       properties:
+        reg:
+          minItems: 2
+
         qcom,current-boost-limit:
           enum: [ 105, 280, 450, 620, 970, 1150, 1300, 1500 ]
           default: 970
-- 
2.34.1

