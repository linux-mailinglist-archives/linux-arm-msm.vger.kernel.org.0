Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45DFD6CA58A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 15:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232626AbjC0NXi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 09:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjC0NXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 09:23:25 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32605245
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eh3so36073593edb.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e421JpAgtcj35xxGor304AnW+bBd7rGQURUOK2VJ37c=;
        b=akAiH7pl4TdiU8GfXv8e6OE8VWx0BOmVeSEVMrMxAumMPQaq31ovkNETTy2tbypyte
         sMAoyr9XqjX6T1UPK3WknPc5cdt0+Dt81i/jnP5qpxc8BlEpFNPsgPi2tozwojytXdVQ
         n0OjusJ98ZRfe1sFUVwtms334CyF3zcLMapfX3fP5Q7P/jw4e8pV1ukg51yRETyHNAu6
         NI02e9SibLwazaIicB6GKOK0p4QEG3JekcDk1wwUd/X5AF4lYbyiB0+3GBbD+GHlCH5b
         UILB/LpeuJ7CPHL0VbGhRLJ7r1jdH9Wu2vRvyxxTEssqEsRUL6YLrt0C4ajrcuxD9RYk
         zZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e421JpAgtcj35xxGor304AnW+bBd7rGQURUOK2VJ37c=;
        b=FrpM6h4CPwhQ7EqdPL1Xt8UMM16IyKYE8EK5yaHVWCRE+W4Bjlf++5TE0rH9eCKlIx
         FEiQPd5SFgL5Vqp3lfD6TztZz5x+i09kCKu+bzAe3wsdvkSE8f3XP5pAstN2PGrsaeAJ
         AVt//0Dzc2N0cTiXYLuUSDFZMC79xc135w9KkLUmudpyCAT8WxC8BkgZWyVhKXKGLrJI
         YQx0XEp6QGRyC3hIMOob0PjuoPINzhb8vTh8bd0vCz3KutUpMzSACECsIxsFuiQLiot7
         PLrR4Tfcixe3WZy6+IBqujtxUSVewuvrOV6SS8nHG/yVnCJjFR0TKK9YEBJ9Rtq+g71z
         /4Gw==
X-Gm-Message-State: AAQBX9eTLB/iXqnGzaD6lNY5RLc/S+LbMcOvZ2VC1sPnFbTQxcO0qAQ1
        I4fO+qEbdhZp4a0QU/UZXVseBA==
X-Google-Smtp-Source: AKy350a6zAoEdc3Kk4j3D/eb33jJfnMnx4zobkxrPu+I0OJc/j5b8+NbvNQDSHYROdnJLVNhzgVkTA==
X-Received: by 2002:a17:906:b74f:b0:92d:591f:6586 with SMTP id fx15-20020a170906b74f00b0092d591f6586mr12645246ejb.34.1679923390257;
        Mon, 27 Mar 2023 06:23:10 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:09 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/10] ASoC: dt-bindings: qcom,lpass-rx-macro: narrow clocks per variants
Date:   Mon, 27 Mar 2023 15:22:45 +0200
Message-Id: <20230327132254.147975-2-krzysztof.kozlowski@linaro.org>
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

Currently the Qualcomm RX macro codec binding allows two different clock
setups - with (for ADSP) and without macro/dcodec entries (for ADSP
bypassed).  With more devices coming soon, this will keep growing, thus
rework the clocks/clock-names to be specific for each binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 58 ++++++++++++++-----
 1 file changed, 44 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 009105275368..babf2ac20afb 100644
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
-      - items:   # for ADSP based platforms
-          - const: mclk
-          - const: npl
-          - const: macro
-          - const: dcodec
-          - const: fsgen
-      - items:   # for ADSP bypass based platforms
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
+            - items:   # for ADSP based platforms
+                - const: mclk
+                - const: npl
+                - const: macro
+                - const: dcodec
+                - const: fsgen
+            - items:   # for ADSP bypass based platforms
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

