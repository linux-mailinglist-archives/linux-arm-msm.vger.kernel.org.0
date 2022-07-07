Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8156A6A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 17:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbiGGPJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 11:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235842AbiGGPJq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 11:09:46 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748572A427
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 08:09:45 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r14so20976846wrg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+7jgZKsUmL6PZS0hzve7kaZUUh8Qq+82xTP285L8ZBM=;
        b=xwMpXxQ+MdmJ+mzaU3Vz+rnYpfRoFbQ3/atvNaR2dR42cAVY59pPOnJTdz9rgpgyVf
         BZ2M7oTcJVNHF5koVrsokyCVSjLNla03Zy5x3sUtO+wvFPYaS/oli87NlJrpJfiC5E8O
         upfzflOLSmhZtbdVGQXOk3Tvsn+eslS4kTPP6qo/Y/tq3fJw+ZrowQRbJixDtUxZDZjP
         sJRV5LtATD+H+Mdt507LQIUDpd6w2xbZuSRFc9CrVAT//HJ1GLr42OsuzHLJvi1MOMEC
         30uGkqDQCjwrK1E81Gl8TBymQWnuKRJc3HvZBq5+g4vHwH4YES2Lf2JnJCrIb/xv/+dg
         WbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+7jgZKsUmL6PZS0hzve7kaZUUh8Qq+82xTP285L8ZBM=;
        b=5YCh4ivOkSuQIRJvs4aeNZkHCeqOqPgBwX8Bo084IVdiO0Qhu5CF6xpckZKTnVOJrB
         02vq57Zy7y8zqRCCoBS1ZFV7izZtqbQucgEsah1OSJuT/7ekluRQNf78ZumRG0/xZsER
         QbLzGbJoTgsw8unLa4iKAiiFxBMHDzvIjvylEFjduN8RKdpI3AaD0VoawbH0FTbBD97S
         Iy36FAsVoXakr03KdAQJUVr+yD23a5oLELpqY7CDL2XrdQwOuyEiaq2A5gn2nc2+CiKR
         Jf0evsVXGmbiXOuVW4jXyLwiaW99A0Bvstu0ur5LWeetXH7Ve33/PtpRcjUzXDbCiwU0
         5OMg==
X-Gm-Message-State: AJIora9kVGWmnxNBGP5o1N2tbpcDTIsNdFwGYhsmaWLWYXRSfS7G2lDV
        tEL7Jid8G/qTupIDQtQSt3EuEg==
X-Google-Smtp-Source: AGRyM1udT9K9+y7TwxiJT93MwyH7sv/B2DaPkU5k3lIFnDbKrQ2tyybiLMJsU3AndpTpaPKFleJqyw==
X-Received: by 2002:a5d:47a4:0:b0:21d:859c:4bd9 with SMTP id 4-20020a5d47a4000000b0021d859c4bd9mr3945460wrb.681.1657206584067;
        Thu, 07 Jul 2022 08:09:44 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm29122235wmi.29.2022.07.07.08.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 08:09:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries
Date:   Thu,  7 Jul 2022 16:09:32 +0100
Message-Id: <20220707150933.1889371-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
References: <20220707150933.1889371-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

