Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E82906B4035
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 14:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjCJNWd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 08:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjCJNWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 08:22:30 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB657FAF9C
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id o12so20317375edb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=jp1ewdyS3iKqffGyu1oG2Jm5BRpT1kO1nx77XSIFlV38VmHYOe38jBFOoVttHRTNe6
         Roumacgk5N0FLiJzU1TCG67mhTvBAtUq2SY9pgVF8aeoZlfmWmQ3bBfYSzNQtJUahwkv
         6GuIe/C+sTi5cKK2iaJgaC1NfPxcgD7jE6I0cagnZHfqfW5Yiq1DG6rjMeQ0KBSW1tTj
         jLv6XmhE5Yhr+PORyykLpu3JaCfhuVclH4fH0S5t02UkST8thCLJSoRBot0XGvnTx4rw
         2ivclRZvIL8g1fJ1UxDjcLRgvaYb5D1YveDZvT5HdTAvvcZXMtIMGE2DM9jfRCI39u3c
         nE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbnW+HQXXMov2YCkKGIA3Ip1jgaMjvv36rVivoZ/sxY=;
        b=HfkTD5MkHLRMSQxtnCo71dGETUCnZ0VD3m5CU9EOk1FEp2P39PXvIgzzi7C53Ff/4K
         I4uVFSzMY//77AsX0atme8ZJ2sxKxznGe1oxwxuZy/Cg68dnDwC4jn04nBNPHGyTPV8O
         HegW0/g9jvZmM5d4EnWoLymzp3nAGbLmDv7gskIITa+m9iXg+PTwMic1TJulePtwX47u
         MCe3xbm4NbqmXbmoy/b1zsf1pvx3tLY1vEfQQL93SqQoy4HbPt+ZR0YLoPLwYLvEbTtc
         gMo/p/BKqyR9PSC4cPk7DGy2G6qsE27T8J+3ylOoGpdT3cO95P2CmJn3IJ3vm9oGHhxu
         naGw==
X-Gm-Message-State: AO0yUKXw0be/e7o4fsqZ5B8A+UwaClePPtlW4KBT0DaGbAf276D+O7Qg
        LJyldClRImDqKGAlF5JA5IEGmA==
X-Google-Smtp-Source: AK7set89bwlmiWBuUwrH1uGGkGVacmOgb9VNWvOfJbCJIbNr2Ma9v0H90OaSF5yRm6toBSO+Hozexw==
X-Received: by 2002:a17:906:eecc:b0:90b:167e:3050 with SMTP id wu12-20020a170906eecc00b0090b167e3050mr31863715ejb.36.1678454525311;
        Fri, 10 Mar 2023 05:22:05 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/9] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
Date:   Fri, 10 Mar 2023 14:21:53 +0100
Message-Id: <20230310132201.322148-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the Qualcomm RX macro codec binding allows two different clock
setups - with (for ADSP) and without macro/dcodec entries (for ADSP
bypassed).  With more devices coming soon, this will keep growing, thus
rework the clocks/clock-names to be specific for each binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 58 ++++++++++++++-----
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index b0b95689d78b..8b3d617a9578 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) RX Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -34,17 +31,8 @@ properties:
     maxItems: 5
 
   clock-names:
-    oneOf:
-      - items:   #for ADSP based platforms
-          - const: mclk
-          - const: npl
-          - const: macro
-          - const: dcodec
-          - const: fsgen
-      - items:   #for ADSP bypass based platforms
-          - const: mclk
-          - const: npl
-          - const: fsgen
+    minItems: 3
+    maxItems: 5
 
   clock-output-names:
     maxItems: 1
@@ -62,6 +50,48 @@ required:
   - reg
   - "#sound-dai-cells"
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc7280-lpass-rx-macro
+    then:
+      properties:
+        clock-names:
+          oneOf:
+            - items:   #for ADSP based platforms
+                - const: mclk
+                - const: npl
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   #for ADSP bypass based platforms
+                - const: mclk
+                - const: npl
+                - const: fsgen
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sc8280xp-lpass-rx-macro
+            - qcom,sm8250-lpass-rx-macro
+            - qcom,sm8450-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

