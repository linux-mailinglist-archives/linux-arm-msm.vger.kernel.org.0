Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35066CA59F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbjC0NYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbjC0NXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:23:33 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA765583
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:19 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id x3so36069922edb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zotVF1vk8cf0n9qfIQsldz0TvwmtvVtz6i/QGqtiNB4=;
        b=RZXlVVY98CsmmymWEux1eeEzaPJtEOhvQlMjtFdXkZtQ4onrGSqLLbfamI0HRVVgLo
         v979bUvbkaqVz/L/BQGQZSJYVdziptnr/49Qz6COvrMrnpMJNYmO7oMIjYHaWdlO86Z9
         0f301yUxSS2uft4YvFAS48KOqRqhyZHDmivfTgBUFqjwD76pQhFFvTPynSnVv7a+VjHf
         24O1KlUGmOaeQJBwrQGZhuG7vhRib6LyQmpIas9P2DwAGy4FNSuiP6mM1L8O75OBEYEI
         FpRTDPgEwVbWa9pyH2+02TZa/naht7LdL0AHIgQG3qTqGOzqafzNQzW24lubkL1U9UZm
         VIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zotVF1vk8cf0n9qfIQsldz0TvwmtvVtz6i/QGqtiNB4=;
        b=fSnrjGD7GjpqR8p5QbX1v8H3ybX9SxYlg51usrOxMfbdweUKeq59Zy+fSFsGejjQ6h
         kBEUBb4RtO0ZquoCKTOKzaidRvDxcGQg9rq76FaTl9SmfAvRX6tSE3TsAmMiYe0CMt2a
         +FzZYPBZjS4tSFEL4KrnKPoTOJL/wX3UdaFz4L8VBbASNP8nvFhubD5jdAG2Rz+iETzm
         ZfMa1oVCTInPjIsnlrqjDJd95qjMGqUBguf6o4GgFocfh68KvYxY827pNvd5S2c58SY6
         CAu/LMat3py7j75Yt+GylUEQL/YuFEEkXwoqx56YxvmlSMif2BZLQnqroXMRZJmCY61+
         FTEQ==
X-Gm-Message-State: AAQBX9cLENkjKmSK5Yb1sjh2oImNmpOhITOG6PNw01BdksRi3oOAd2H4
        qa3WbLh2oA9Jzy4B5/vjP8Duog==
X-Google-Smtp-Source: AKy350YjtYsJ0rNq+/jhDt2fT6bOmhA22R1GkeWePQSUOJCOZ2R0MJFzEUSA2EvY61UoGqlwzq/UtQ==
X-Received: by 2002:a17:906:1c19:b0:92b:f118:ef32 with SMTP id k25-20020a1709061c1900b0092bf118ef32mr12168020ejg.48.1679923397571;
        Mon, 27 Mar 2023 06:23:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:17 -0700 (PDT)
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
Cc:     Patrick Lai <quic_plai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 07/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL clock
Date:   Mon, 27 Mar 2023 15:22:51 +0200
Message-Id: <20230327132254.147975-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
clock.  Add the clock and customize allowed clocks per each variant.
The clocks are also required by ADSP in all variants.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch.
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 ++++++++++++++++---
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 61cdfc265b0f..528b677a439c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -30,16 +27,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 3
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    oneOf:
-      - items:   # for ADSP based platforms
-          - const: mclk
-          - const: macro
-          - const: dcodec
-      - items:   # for ADSP bypass based platforms
-          - const: mclk
+    minItems: 1
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -63,6 +56,59 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
+  - clock-names
+  - clocks
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-va-macro
+              - qcom,sm8450-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: npl
 
 unevaluatedProperties: false
 
-- 
2.34.1

