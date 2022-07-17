Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6298657786D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 23:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbiGQVhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 17:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbiGQVg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 17:36:56 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB10120BB
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:54 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id v67-20020a1cac46000000b003a1888b9d36so8706233wme.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nt/vXnZ1ilZFW2r3X3Si21RNxg/v63nKAPyKT3PD4RA=;
        b=m4UCFqEOUfMV1gYqaNHTq7pIZsLCr9m6kdiuaK5VeJ1CyVi1vDfZaWEmE/4LsS81Ri
         xfAN1Hr27bRHnWIzI8/ldttHyVTIWOTMBTcxyiBglU9vXeYzqaPVGmIuyMht/OmvWSo+
         TJQEd8EwM3j1POpNJSVmWb3ehz9opBxZGTfK6Vn0Df9Dg6PAhdvy+fUPVBBIEY7tVTEl
         kkgV9cKh0WwwNK0g+BQGJlROi9/wbCgmul8j1c9+C08+3qBx8WF363djhfAdk4PLWp2s
         YaExVf5l8N0Qf0pMHPRqLAFrsIl20zUIDmHxBJBNYTxfaKoM1bd1LoCpHfUhMFgxGf16
         v/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nt/vXnZ1ilZFW2r3X3Si21RNxg/v63nKAPyKT3PD4RA=;
        b=8LAM/+DTuEOX/fkOh6JqpCwg4ixO2QbTnu1eXd8c3LoMJDN3qioGzXfEbS+j6jMvB/
         IiDzFz5q1x2iMAYQITD2QwhpdpXrMQxyx3o1M5jvAXt3SfN92cMtwYs5BGGnmJPhGMS/
         xSa1W4oiRI+eJXYzcySZ07pd3bGC8M+q9imSAtbPia9t4uqY8Ouw0xGnPhGFj7y0NAfO
         MIIhwgBh6SsfNKU3yyg+ADx9KUNUET4Zx7mYxAL+g3KYFbanSfRty5aiSH/Vkbn43N2n
         p3FEdIsbfOuEBh7b0LWEe7txjd0pqQhJa01t2eetH2D//DEWgssDr4td4ZxbvQSJe8Wh
         oGsw==
X-Gm-Message-State: AJIora/QkT8UpvqyM17BfISpv+Yw+g246pGaEWwvkyisGwrpPxuVJPax
        zYevqwuQlikQ/mWIWRo4VpASMg==
X-Google-Smtp-Source: AGRyM1u/XAJwWuX1HbkYWI6lyN0sX+0QqxixFx5Yg2cJCYRIMLe9bVyD/swfZzbWfZ7N8ENIa6D5KA==
X-Received: by 2002:a05:600c:5026:b0:3a2:ea0c:ea8a with SMTP id n38-20020a05600c502600b003a2ea0cea8amr23095985wmr.53.1658093812840;
        Sun, 17 Jul 2022 14:36:52 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003a3187a2d4csm3715956wms.22.2022.07.17.14.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 14:36:52 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries
Date:   Sun, 17 Jul 2022 22:36:44 +0100
Message-Id: <20220717213645.1147342-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
References: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8916, msm8939, msm8953, msm8994 and qcs404 already declare or should
declare syscon as they have drivers that use syscon inside of the apcs-kpss
block.

grep apcs arch/arm64/boot/dts/qcom/* | grep syscon

Add in the additional syscon in the documentation for the above mentioned
parts.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 46 ++++++++++---------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 3b5ba7ecc19d9..f504652fc0ea2 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -15,26 +15,30 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,ipq6018-apcs-apps-global
-      - qcom,ipq8074-apcs-apps-global
-      - qcom,msm8916-apcs-kpss-global
-      - qcom,msm8939-apcs-kpss-global
-      - qcom,msm8953-apcs-kpss-global
-      - qcom,msm8976-apcs-kpss-global
-      - qcom,msm8994-apcs-kpss-global
-      - qcom,msm8996-apcs-hmss-global
-      - qcom,msm8998-apcs-hmss-global
-      - qcom,qcm2290-apcs-hmss-global
-      - qcom,qcs404-apcs-apps-global
-      - qcom,sc7180-apss-shared
-      - qcom,sc8180x-apss-shared
-      - qcom,sdm660-apcs-hmss-global
-      - qcom,sdm845-apss-shared
-      - qcom,sm6125-apcs-hmss-global
-      - qcom,sm6115-apcs-hmss-global
-      - qcom,sm8150-apss-shared
-
+    oneOf:
+      - items:
+          - enum:
+              - qcom,ipq6018-apcs-apps-global
+              - qcom,ipq8074-apcs-apps-global
+              - qcom,msm8976-apcs-kpss-global
+              - qcom,msm8996-apcs-hmss-global
+              - qcom,msm8998-apcs-hmss-global
+              - qcom,qcm2290-apcs-hmss-global
+              - qcom,sc7180-apss-shared
+              - qcom,sc8180x-apss-shared
+              - qcom,sdm660-apcs-hmss-global
+              - qcom,sdm845-apss-shared
+              - qcom,sm6125-apcs-hmss-global
+              - qcom,sm6115-apcs-hmss-global
+              - qcom,sm8150-apss-shared
+      - items:
+          - enum:
+              - qcom,msm8916-apcs-kpss-global
+              - qcom,msm8939-apcs-kpss-global
+              - qcom,msm8953-apcs-kpss-global
+              - qcom,msm8994-apcs-kpss-global
+              - qcom,qcs404-apcs-apps-global
+          - const: syscon
   reg:
     maxItems: 1
 
@@ -121,7 +125,7 @@ examples:
     #define GCC_APSS_AHB_CLK_SRC  1
     #define GCC_GPLL0_AO_OUT_MAIN 123
     apcs: mailbox@b011000 {
-        compatible = "qcom,qcs404-apcs-apps-global";
+        compatible = "qcom,qcs404-apcs-apps-global", "syscon";
         reg = <0x0b011000 0x1000>;
         #mbox-cells = <1>;
         clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
-- 
2.36.1

