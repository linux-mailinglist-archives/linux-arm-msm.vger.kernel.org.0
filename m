Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356B557815B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 13:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbiGRLzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 07:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234440AbiGRLzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 07:55:45 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD3F2316F
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 04:55:43 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id be14-20020a05600c1e8e00b003a04a458c54so7174107wmb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nt/vXnZ1ilZFW2r3X3Si21RNxg/v63nKAPyKT3PD4RA=;
        b=usuxqrg7J7ZuEEDYfcUBkfQfXqaVpp3arJNC9ftslcONp3kylBQgw5hSk6k58SaEW1
         alFBTj2vVHrNnCJUMcmGsKGQ+FXhOoSXqrnnn8Ir30BxXal+fkO1fmBcMGxH33/WBWXl
         ze5ufAt7ezYIqYx+f2youhoctmBAg3fUuC000liS870WDXsIm9DOH8fMUuYclBS1RugQ
         /kG/QFSEXpo5vnoeDElB/Oxtd9yGM34ydfw5rt7JGpvJfZQzdmXoRSY4T6MYgMFbq8cf
         lqDj0vhNH2jpEOAJtfhRPhFCYzIfIyQTSgG2UWzn49Fk15xONQlqxfDhoCbc0U8JajEM
         r68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nt/vXnZ1ilZFW2r3X3Si21RNxg/v63nKAPyKT3PD4RA=;
        b=2bWCRBzQpCT1JGqfD+ZfQveUmIEpkolS+WTfFW6IF9mXSQtnuYMamyO5961jTCO8Ln
         9902kNuEfgmL1uYrZQ0lQGRB7vCbjEYYEvv6aznl6Ay/Vwjdk7gbUDYYoOBB6zPxr8dd
         1MYpgb1Ft8bGyd0yKYCG7r5C32FkkJWVVVSyWNAkOdMjggATHlPdYAzCGSpJePesp18M
         iBNlUd6x/bYqpwCewOXDPO/xjUmYskepYQiwUquuZP7HorhnCuVX1iWXEbEkli64Onfl
         A6+ZCSyUs8Yj4xqZrOV+aHMph6xk4zRYt05MzJlWtlD/CJCjNrjrWGaGtuyXd6YwP5qw
         qoWQ==
X-Gm-Message-State: AJIora90MGLZEx5Yt85X3191i752Kb0CgjCnbRrci6nwPhqhzq6XBZCE
        7+q5U1RvAFSD+e2W2TBb7liIFAKuQdRfPg==
X-Google-Smtp-Source: AGRyM1tJaLxQlGIjx+Q+Oi4RLhGz0+qbkLNfwRjfFBtjKac2eLIiy5mcgvpmgv0nW3X6MSSFc3pHPQ==
X-Received: by 2002:a1c:4c02:0:b0:3a3:160f:f1ec with SMTP id z2-20020a1c4c02000000b003a3160ff1ecmr8152790wmf.159.1658145342079;
        Mon, 18 Jul 2022 04:55:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b003a2e655f2e6sm15474947wmr.21.2022.07.18.04.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 04:55:41 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/1] dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries
Date:   Mon, 18 Jul 2022 12:55:38 +0100
Message-Id: <20220718115538.1247615-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718115538.1247615-1-bryan.odonoghue@linaro.org>
References: <20220718115538.1247615-1-bryan.odonoghue@linaro.org>
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

