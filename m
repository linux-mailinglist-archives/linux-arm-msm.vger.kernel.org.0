Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9684457ECED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 11:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbiGWJJv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 05:09:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbiGWJJt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 05:09:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73151055C
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a23so8668643lfm.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQoKf4x6bk2NUd2xMmDqdgF51D97Kbt8QIuYFs9WwBA=;
        b=xptds28g36Es4Y8TKcAcHXqRELOMo4kH8p9rWkCKpbbxIYR1OGbQ63UJc0lQyNvIsk
         rvXVRzJ7O21JULl5bxqYfra+RudW5YW4il4TJxfhm5WdMjgqqvYgCsqWG4G5o5ZDbca4
         AYhfekoYv9wLGcrQL2NqYAN5OhYuSv8dWkB6ZPxCuJp5xWzXbghVrA2TlL4aKQUm6QSQ
         QTIUKNhxK6BZc1V1eC4umZJP1OWGxfb0bnQzURlz3Cx3NiiEO0CCfY/kCiW/ZAFFk4N4
         Ay3pbugZ3TknPH69oGvJB3t5pbsL75brdE0r8mXQTNAGPCRxm+2PYiU611Kc83l9bp5r
         GJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQoKf4x6bk2NUd2xMmDqdgF51D97Kbt8QIuYFs9WwBA=;
        b=3/vF1YfmDMF5/Uwa5tLbkcNpOw23/LCXxwN92VB8W0a54FImlLbmpxWIXMkDGXYRGQ
         79GYu5AA+wyHOMqfR0jcAe9XKhHTetCUuWY6o1YOkE4j9F6N/0rgZINjS0uWmcWYE+8E
         biwTtniyzYlp8NtPW5HalhhIBGUOxwurqSX2HruYAOZvBdPUoWQOQW7Ni4SWUfJ/+WYS
         miSDmEWyBle+8FDIVuJrVwA5ak/FcSDnKcDSqw4fNiL81EDvQFKih/JB0lpSv9svIR6H
         D/0nLFkdAIViosLVb9gBRtt7hm0wFlOvus1CfiJvjYYXO0l6kbKD/cDzmQKM/ewodoAK
         BIMw==
X-Gm-Message-State: AJIora88tiqPv0zUZ7K51ed30p+I6eP0WXYfigjVATbAl3wMxUwUh6xL
        bRNZlxuqpttpZZSbxJS6zo5nHw==
X-Google-Smtp-Source: AGRyM1ttd9tUFUnhU+bd4hT5AqUXCVRmMtrwWuiErqRg3cXzgoaaCDgC0xYpSanbNTaw6qMSNEiU9g==
X-Received: by 2002:a05:6512:33c5:b0:48a:1c38:e43 with SMTP id d5-20020a05651233c500b0048a1c380e43mr1540939lfg.671.1658567386233;
        Sat, 23 Jul 2022 02:09:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s29-20020a05651c049d00b0025d6a975c47sm1537636ljc.94.2022.07.23.02.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 02:09:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH 3/3] dt-bindings: arm: qcom: drop individual descriptions of Google devices
Date:   Sat, 23 Jul 2022 12:09:42 +0300
Message-Id: <20220723090942.1637676-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the pattern and drop simple sc7180/sc7280 device declarations.
The goal to leave in place only non-standard cases, rather than
documenting every possible device.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 198 +-----------------
 1 file changed, 2 insertions(+), 196 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 809d3de18194..f2d3209a25fa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -130,6 +130,8 @@ properties:
               - qcom,msm8998
               - qcom,sa8155p
               - qcom,sa8540p
+              - qcom,sc7180
+              - qcom,sc7280
               - qcom,sc8180x
               - qcom,sc8280xp
               - qcom,sda660
@@ -165,65 +167,24 @@ properties:
           - const: qcom,apq8096-sbc
           - const: qcom,apq8096
 
-      - description: Qualcomm Technologies, Inc. SC7180 IDP
-        items:
-          - enum:
-              - qcom,sc7180-idp
-          - const: qcom,sc7180
-
       - description: HP Chromebook x2 11c (rev1 - 2)
         items:
           - const: google,coachz-rev1
           - const: google,coachz-rev2
           - const: qcom,sc7180
 
-      - description: HP Chromebook x2 11c (newest rev)
-        items:
-          - const: google,coachz
-          - const: qcom,sc7180
-
       - description: HP Chromebook x2 11c with LTE (rev1 - 2)
         items:
           - const: google,coachz-rev1-sku0
           - const: google,coachz-rev2-sku0
           - const: qcom,sc7180
 
-      - description: HP Chromebook x2 11c with LTE (newest rev)
-        items:
-          - const: google,coachz-sku0
-          - const: qcom,sc7180
-
       - description: Lenovo Chromebook Duet 5 13 (rev2)
         items:
           - const: google,homestar-rev2
           - const: google,homestar-rev23
           - const: qcom,sc7180
 
-      - description: Lenovo Chromebook Duet 5 13 (rev3)
-        items:
-          - const: google,homestar-rev3
-          - const: qcom,sc7180
-
-      - description: Lenovo Chromebook Duet 5 13 (newest rev)
-        items:
-          - const: google,homestar
-          - const: qcom,sc7180
-
-      - description: Google Kingoftown (rev0)
-        items:
-          - const: google,kingoftown-rev0
-          - const: qcom,sc7180
-
-      - description: Google Kingoftown (newest rev)
-        items:
-          - const: google,kingoftown
-          - const: qcom,sc7180
-
-      - description: Acer Chromebook Spin 513 (rev0)
-        items:
-          - const: google,lazor-rev0
-          - const: qcom,sc7180
-
       - description: Acer Chromebook Spin 513 (rev1 - 2)
         items:
           - const: google,lazor-rev1
@@ -240,11 +201,6 @@ properties:
           - const: google,lazor-rev8
           - const: qcom,sc7180
 
-      - description: Acer Chromebook Spin 513 (newest rev)
-        items:
-          - const: google,lazor
-          - const: qcom,sc7180
-
       - description: Acer Chromebook Spin 513 with KB Backlight (rev1 - 2)
         items:
           - const: google,lazor-rev1-sku2
@@ -261,11 +217,6 @@ properties:
           - const: google,lazor-rev8-sku2
           - const: qcom,sc7180
 
-      - description: Acer Chromebook Spin 513 with KB Backlight (newest rev)
-        items:
-          - const: google,lazor-sku2
-          - const: qcom,sc7180
-
       - description: Acer Chromebook Spin 513 with LTE (rev1 - 2)
         items:
           - const: google,lazor-rev1-sku0
@@ -282,11 +233,6 @@ properties:
           - const: google,lazor-rev8-sku0
           - const: qcom,sc7180
 
-      - description: Acer Chromebook Spin 513 with LTE (newest rev)
-        items:
-          - const: google,lazor-sku0
-          - const: qcom,sc7180
-
       - description: Acer Chromebook 511 (rev4 - rev8)
         items:
           - const: google,lazor-rev4-sku4
@@ -296,16 +242,6 @@ properties:
           - const: google,lazor-rev8-sku4
           - const: qcom,sc7180
 
-      - description: Acer Chromebook 511 (newest rev)
-        items:
-          - const: google,lazor-sku4
-          - const: qcom,sc7180
-
-      - description: Acer Chromebook 511 without Touchscreen (rev4)
-        items:
-          - const: google,lazor-rev4-sku5
-          - const: qcom,sc7180
-
       - description: Acer Chromebook 511 without Touchscreen (rev5 - rev8)
         items:
           - const: google,lazor-rev5-sku5
@@ -315,133 +251,18 @@ properties:
           - const: google,lazor-rev8-sku6
           - const: qcom,sc7180
 
-      - description: Acer Chromebook 511 without Touchscreen (newest rev)
-        items:
-          - const: google,lazor-sku6
-          - const: qcom,sc7180
-
-      - description: Google Mrbland with AUO panel (rev0)
-        items:
-          - const: google,mrbland-rev0-sku0
-          - const: qcom,sc7180
-
-      - description: Google Mrbland with AUO panel (newest rev)
-        items:
-          - const: google,mrbland-sku1536
-          - const: qcom,sc7180
-
-      - description: Google Mrbland with BOE panel (rev0)
-        items:
-          - const: google,mrbland-rev0-sku16
-          - const: qcom,sc7180
-
       - description: Google Mrbland with BOE panel (newest rev)
         items:
           - const: google,mrbland-sku1024
           - const: google,mrbland-sku768
           - const: qcom,sc7180
 
-      - description: Google Pazquel with Parade (newest rev)
-        items:
-          - const: google,pazquel-sku5
-          - const: qcom,sc7180
-
-      - description: Google Pazquel with TI (newest rev)
-        items:
-          - const: google,pazquel-sku1
-          - const: qcom,sc7180
-
-      - description: Google Pazquel with LTE and Parade (newest rev)
-        items:
-          - const: google,pazquel-sku4
-          - const: qcom,sc7180
-
       - description: Google Pazquel with LTE and TI (newest rev)
         items:
           - const: google,pazquel-sku0
           - const: google,pazquel-sku2
           - const: qcom,sc7180
 
-      - description: Sharp Dynabook Chromebook C1 (rev1)
-        items:
-          - const: google,pompom-rev1
-          - const: qcom,sc7180
-
-      - description: Sharp Dynabook Chromebook C1 (rev2)
-        items:
-          - const: google,pompom-rev2
-          - const: qcom,sc7180
-
-      - description: Sharp Dynabook Chromebook C1 (newest rev)
-        items:
-          - const: google,pompom
-          - const: qcom,sc7180
-
-      - description: Sharp Dynabook Chromebook C1 with LTE (rev1)
-        items:
-          - const: google,pompom-rev1-sku0
-          - const: qcom,sc7180
-
-      - description: Sharp Dynabook Chromebook C1 with LTE (rev2)
-        items:
-          - const: google,pompom-rev2-sku0
-          - const: qcom,sc7180
-
-      - description: Sharp Dynabook Chromebook C1 with LTE (newest rev)
-        items:
-          - const: google,pompom-sku0
-          - const: qcom,sc7180
-
-      - description: Google Quackingstick (newest rev)
-        items:
-          - const: google,quackingstick-sku1537
-          - const: qcom,sc7180
-
-      - description: Google Quackingstick with LTE (newest rev)
-        items:
-          - const: google,quackingstick-sku1536
-          - const: qcom,sc7180
-
-      - description: Google Trogdor (newest rev)
-        items:
-          - const: google,trogdor
-          - const: qcom,sc7180
-
-      - description: Google Trogdor with LTE (newest rev)
-        items:
-          - const: google,trogdor-sku0
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with BOE panel (rev0)
-        items:
-          - const: google,wormdingler-rev0-sku16
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with BOE panel (newest rev)
-        items:
-          - const: google,wormdingler-sku1024
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with BOE panel and rt5682s (newest rev)
-        items:
-          - const: google,wormdingler-sku1025
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with INX panel (rev0)
-        items:
-          - const: google,wormdingler-rev0-sku0
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with INX panel (newest rev)
-        items:
-          - const: google,wormdingler-sku0
-          - const: qcom,sc7180
-
-      - description: Lenovo IdeaPad Chromebook Duet 3 with INX panel and rt5682s (newest rev)
-        items:
-          - const: google,wormdingler-sku1
-          - const: qcom,sc7180
-
       - description: Qualcomm Technologies, Inc. sc7280 CRD platform (rev3 - 4)
         items:
           - const: qcom,sc7280-crd
@@ -451,11 +272,6 @@ properties:
           - const: google,piglin-rev4
           - const: qcom,sc7280
 
-      - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
-        items:
-          - const: google,hoglin
-          - const: qcom,sc7280
-
       - description: Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform
         items:
           - const: qcom,sc7280-idp
@@ -468,16 +284,6 @@ properties:
           - const: google,piglin
           - const: qcom,sc7280
 
-      - description: Google Herobrine (newest rev)
-        items:
-          - const: google,herobrine
-          - const: qcom,sc7280
-
-      - description: Google Villager (newest rev)
-        items:
-          - const: google,villager
-          - const: qcom,sc7280
-
       - items:
           - {}
           - const: qcom,qcs404-evb
-- 
2.35.1

