Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3346862597A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Nov 2022 12:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiKKLgj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Nov 2022 06:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbiKKLgR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Nov 2022 06:36:17 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEB2C7B21D
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:15 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id r12so7952279lfp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVPXDxLMfpz8g27snic+eN+xSUqcTU7lGiltIX5KJbs=;
        b=UFFAwcOs+vDUyqFQ5OFeB+zkQYPlvSThzl452QSBVB/r7V2GtVBOn5pdWYJcl3CK48
         It2u3B4evYX1mwdc4wXIa1W1aNazcHRJ7ka7BzFiL6I1yCzQiwVrGdzm3Le6kXk6hxdQ
         9AWPl232CZhUgPEYCe8OEjNJ+NkFv7kFWV7OCCX0ZpaD1OgdzWauwwlFqL5/WWQStXbM
         3KJwrAcb/+CdE7E6dysZsM8dYzDrN6o+MuTue00mR52XNcAYYOz0CbFfoYawCT1Nqrod
         5Qoc7hYuBiE3PkRPQUxiKXv1durc29aeC4+NBeJLABEukudmF9z7pIJ5p6pqd4Tja0Wn
         53Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVPXDxLMfpz8g27snic+eN+xSUqcTU7lGiltIX5KJbs=;
        b=2MWWM1Dnn11Jq+KUyEHaVsKB/ka70VWaKDcG46SMfhTsu2bXk51zdfrBnRhfcYy2sK
         lpU6b7n3DGYL/+zoj0YGfDUtwAtFxbHEi/ySR469ptO1hKuXRP0ZMlGomuh1dCCXZFTA
         FTnUWKedYY/DvUopGB08eSl5rzo45FefqOjI2fF6pMY/l9i7XEDWCgVaP9fEzie0Un1T
         JvRUi+B3mzc4jERNV3kAxUuBhYuh7toi0WqKr1wi4brwg21zSvi9Lo7rH+rbSZ7uNRiM
         mP2lf418JUF+PQ9W/Qp2GPoRin1IhHwzbOZk+FHHnk6XZ1H4CRwuPjGEQC9eeMVxfh63
         ZFNQ==
X-Gm-Message-State: ANoB5pkvaIEYPeoJCFsxUAnYGiRkkQYV0Ag+p6emjpyKpJ9VbxMXAACW
        h0Q6qOdPkFTzk0Gt7Q6jSg0LxnfZ01en5Q==
X-Google-Smtp-Source: AA0mqf4HVcEm/1Udsx3H6f2tWIC7EjVaSIWojrY2XDxS5usQfZ7iO5evHyW0tJfWapeUrRYL7c7mYg==
X-Received: by 2002:a05:6512:b92:b0:4a7:66ba:df18 with SMTP id b18-20020a0565120b9200b004a766badf18mr581923lfv.208.1668166575518;
        Fri, 11 Nov 2022 03:36:15 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 03:36:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Patrick Lai <plai@qti.qualcomm.com>,
        Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/10] ASoC: dt-bindings: qcom,q6asm: Split to separate schema
Date:   Fri, 11 Nov 2022 12:35:43 +0100
Message-Id: <20221111113547.100442-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6ASM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,q6asm-dais.yaml       | 48 +++++--------
 .../devicetree/bindings/sound/qcom,q6asm.yaml | 68 +++++++++++++++++++
 2 files changed, 84 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
index 8deb8ffb143b..0110b38f6de9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
@@ -73,40 +73,24 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6asm.h>
-
-    apr {
-        compatible = "qcom,apr-v2";
-        qcom,domain = <APR_DOMAIN_ADSP>;
+    dais {
+        compatible = "qcom,q6asm-dais";
+        iommus = <&apps_smmu 0x1821 0x0>;
         #address-cells = <1>;
         #size-cells = <0>;
+        #sound-dai-cells = <1>;
+
+        dai@0 {
+            reg = <0>;
+        };
+
+        dai@1 {
+            reg = <1>;
+        };
 
-        service@7 {
-            compatible = "qcom,q6asm";
-            reg = <APR_SVC_ASM>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            dais {
-                compatible = "qcom,q6asm-dais";
-                iommus = <&apps_smmu 0x1821 0x0>;
-                #address-cells = <1>;
-                #size-cells = <0>;
-                #sound-dai-cells = <1>;
-
-                dai@0 {
-                    reg = <0>;
-                };
-
-                dai@1 {
-                    reg = <1>;
-                };
-
-                dai@2 {
-                    reg = <2>;
-                    is-compress-dai;
-                    direction = <1>;
-                };
-            };
+        dai@2 {
+            reg = <2>;
+            is-compress-dai;
+            direction = <1>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
new file mode 100644
index 000000000000..cb49f9667cca
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6asm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Stream Manager (Q6ASM)
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+allOf:
+  - $ref: /schemas/soc/qcom/qcom,apr-services.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6asm
+
+  dais:
+    type: object
+    $ref: /schemas/sound/qcom,q6asm-dais.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP audio ports
+
+required:
+  - compatible
+  - dais
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@7 {
+            compatible = "qcom,q6asm";
+            reg = <APR_SVC_ASM>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            dais {
+                compatible = "qcom,q6asm-dais";
+                iommus = <&apps_smmu 0x1821 0x0>;
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@0 {
+                    reg = <0>;
+                };
+
+                dai@1 {
+                    reg = <1>;
+                };
+
+                dai@2 {
+                    reg = <2>;
+                    is-compress-dai;
+                    direction = <1>;
+                };
+            };
+        };
+    };
-- 
2.34.1

