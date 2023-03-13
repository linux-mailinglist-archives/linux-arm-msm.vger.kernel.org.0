Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 043786B70AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 08:58:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbjCMH6I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 03:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbjCMH4t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 03:56:49 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FAF029151
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h8so1149760ede.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=PuuKK426W4imrwcVdY2+9oec5UOV7dMbuPit+w09Q5znpU3IvnzN31Md9Jt84L3yRS
         qHPHUvh3ZoTJBYGGv6FbQlLSOjRFXfkXVO5SltxbeVBxlIV9Y2+en8X9iLuW7cYkbt/J
         CZY0anSrcerNb0evrSZ5m2L2jdiAm/CwWnJP8GYxPDHtvO5ypw5+xtUyxPx9tJzEg04+
         2p0HKI4GlxvIrgPOlXonZyBsWvcneKOEIuEdIXkzI6EUUNzmfld0SolHsLCLG7gNa/xc
         /o/4fUs4R9PplJSeh2FROUvJMN8N5Xh7jQz+IBD1hfNvK7pFFKabTx1pJzrLs70M31UH
         dY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=hhDWi9/zRWVUoaH4sm0y9QcQz7e38ak5OYVDzAHBE2nVvJ4OtQh3oR/djTvYXTCnrB
         opcvXlkJNioDw3p8wOpvvdYbJWTHTRw8Y+KafiNr1KzAVCDnipkf7ijwDO3r6GSt2Q0G
         sK1Dnoz47ryLRdxYfLZBbdH2gL6I5Pdw7nszFgO+EhjQN8U9zUP7gUNd3SiPVnZ6A0MA
         ACUYVvUSlH0yZ0M4SPjBHYluVP2laGJIRqbyo1/bF6dJS45ZcmoKTzXewHC7ssgrB7RE
         /IJqxDTlw8gCKqK6fufKsn2e/Y+zxOehiVx9r/NAcfNClwuG/TIdRsUN+Pp7A0G1vzwu
         3stQ==
X-Gm-Message-State: AO0yUKWa06u5HaR2izTuXAgj9NHVGfLFOILWJmG+2Z13Y+WnlLaTaM9J
        BjLnx595sHG5+nNGWz+re8MFZg==
X-Google-Smtp-Source: AK7set/ICSE0O0CNa7vtYNTO3uo0GeeelaS/IRUydnhV6hPEiui9VXdhuM6fAUeREn+KKFTmps6wvg==
X-Received: by 2002:a17:907:1b1b:b0:92a:abe7:a9fe with SMTP id mp27-20020a1709071b1b00b0092aabe7a9femr1671996ejc.74.1678694099110;
        Mon, 13 Mar 2023 00:54:59 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:58 -0700 (PDT)
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
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 8/9] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
Date:   Mon, 13 Mar 2023 08:54:44 +0100
Message-Id: <20230313075445.17160-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
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

Add the WSA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 66cbb1f5e31a..eea7609d1b33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
       - qcom,sm8450-lpass-wsa-macro
+      - qcom,sm8550-lpass-wsa-macro
       - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-output-names:
@@ -62,6 +63,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -89,6 +91,23 @@ allOf:
             - const: va
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-wsa-macro
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
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

