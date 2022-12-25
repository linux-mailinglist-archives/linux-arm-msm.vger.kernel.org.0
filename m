Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7EE655D0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Dec 2022 13:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbiLYMAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 07:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231374AbiLYL7g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 06:59:36 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F85B6553
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 03:59:12 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 1so12891412lfz.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 03:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dA76ZhQFpBF+Sh976k45P5Ks3Bs+iIujWGcFzhlrvu0=;
        b=gsRhIZfJOZ1yhDCZokfMQ5KC6x5w1k39WElrELyw1+agocW5EW1BxZEF6Rp8Lb38lI
         IKqxzq6WUUG1ayCdNNC9JHTvwrRfgz4ILtQUz0c6VmERYHhl1t8zvryK+CS2eW9rLbAA
         W9FQNOk7kgJMYC5WgzR1VpKX2bUC9MESY9NyBiRwdPGVst93WFFefCbxFqlOt5/u8Crh
         Yti+8HF9Vlow1PXqj577bcap3gnfIiQtJvAlz+7VGGBg3nibmsJrxN0YyNPvHKXLkIUI
         o6lrScgcgGIpH5r97CUTSROabxG1lED+ypvaJbioTKmcg5Rmvvbw6YEDsdZzsAaKzae/
         bt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dA76ZhQFpBF+Sh976k45P5Ks3Bs+iIujWGcFzhlrvu0=;
        b=LMGCiKVv02HaSPCP3eSfvFwW2lcbV7gOknLtYvrG/2cqooBWKhlBM0PNsXCK26+QKp
         UG+jKDwL0k4jOiuOJcEaj1JpNi8Pza1oRaBpTjkEoA448z0yIpPG4t9JzX/HmZDh0mkp
         9cHHOE0dRJ8bbE6QieYo+bkQfeZSQksOztD5m93Chyjvv7yE5BQu75l6j63r+v3sa9Eh
         8MStbvGWB4USvUbGnzjFCDmN82AaB/6LP1hKyf2nA+MJja4H4Iz92Vb6nAhr1cTgAFhE
         LwumuQyLmPQFq+rYJhqjk15KMRkCtws0aRAUmhLJe0bKcghMb5wL34v0erUSdzZpZL2U
         lA3g==
X-Gm-Message-State: AFqh2kqiYLdSBa+S3QRZqIJCvX3OaJqesGKWLcNNqvNca2xFU6oBXIry
        LWTcLuX929voLyVljOmadDrJYQ==
X-Google-Smtp-Source: AMrXdXuiBQzgqQ1zG6X05ZOOEuFLwoNx5rZ6wkvIVz3966G9hSgfRUI203N49qnVvfSiCEvRn9sxsw==
X-Received: by 2002:ac2:43da:0:b0:4b6:ee14:3e98 with SMTP id u26-20020ac243da000000b004b6ee143e98mr4920842lfl.23.1671969550875;
        Sun, 25 Dec 2022 03:59:10 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b17-20020ac25e91000000b004cb061887b5sm128819lfq.126.2022.12.25.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 03:59:10 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250
Date:   Sun, 25 Dec 2022 12:59:06 +0100
Message-Id: <20221225115907.55250-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

SM8250 DTS uses additional "va" clock in WSA macro device node:

  sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'va', 'fsgen'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 58 +++++++++++++++----
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 2bf8d082f8f1..66cbb1f5e31a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,15 +27,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 5
+    minItems: 5
+    maxItems: 6
 
   clock-names:
-    items:
-      - const: mclk
-      - const: npl
-      - const: macro
-      - const: dcodec
-      - const: fsgen
+    minItems: 5
+    maxItems: 6
 
   clock-output-names:
     maxItems: 1
@@ -55,10 +49,51 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-lpass-wsa-macro
+            - qcom,sm8450-lpass-wsa-macro
+            - qcom,sc8280xp-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8250-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: va
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     codec@3240000 {
       compatible = "qcom,sm8250-lpass-wsa-macro";
@@ -69,7 +104,8 @@ examples:
                <&audiocc 0>,
                <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&aoncc LPASS_CDC_VA_MCLK>,
                <&vamacro>;
-      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
       clock-output-names = "mclk";
     };
-- 
2.34.1

