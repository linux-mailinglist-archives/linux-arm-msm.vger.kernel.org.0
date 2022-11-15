Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 003A5629802
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232883AbiKOMDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232976AbiKOMDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:03:03 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1DF27907
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:54 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id l8so17178297ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LyyakI8dI31KMumI0zAq/rZxHMG6g0EuWRPy/j4igio=;
        b=Iu64cV54PeAH+y/r9d6d4/HeQob4vBfJ64H84jjELeyS9b5bxUoVuI3BMmpmsaP2cv
         hK0iGmlf4Fm3993w0XqR/eZXs8Fb82A7zdbUNxam+AsKsLM6jPUxWmkSxEvGYTxfgikz
         lTe9KOJKr6UN1p1Z7Sl1T9obWYxc3sENNxGQsSGmwMh9gsE4+h+99wwDjnL1PuhLAqA/
         VEsZjdFSthpo5PgpJ2lePY6O99dsF/PfngqhiWGh7UA6V3bwgrdzc2eYAQxDpLYtVWFl
         0D0bHKzzMYQK1pkz7I7EGOu4KdIkuXEVtvGvl5h+Upd1vnmUccvodWJt31qEDdK0PLIJ
         PWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LyyakI8dI31KMumI0zAq/rZxHMG6g0EuWRPy/j4igio=;
        b=CmTXBWNOxGqAfozIYNHOLZk89BH/7kTMSz+8wbzlA89PUJN4XZ3z+Nqcd0DLfIIRVg
         KB2DNeQ/3kdGGpUjkl2E4llNF4xkeIWocME+RTMShaZNhCcoTZTiZDjDiaABfdw8QOAT
         DVpsA9Cq2kerX8i+TOv7PaVFIdJc10sm8Swo5oYczPndxw/AntvcniVmvkklI/iNq+UO
         NmGsorkj+FgszRkUbGYJmuyWroSPsaP8BpSJkNCo+5CXonrjZyON/4bGkU01aZOSypew
         BHfI7uUSdPBa/EqNF8+Vcin0VqaqIUd/oTEgdk7xLCscKUQ5iAeqdXEJENM5OQi53qkS
         Bpog==
X-Gm-Message-State: ANoB5pnVhepIqNYEavv/9HxOhwLOKaXSgfUwgz9vlmSTOwWS+T/3OnFp
        wKi3ilAt6D/GwzzVHTyCuESN8Q==
X-Google-Smtp-Source: AA0mqf4bsmoyb0QW/dQ4kJp/id0PhHduPtPhyADMrx0mfBRfduq2Y/a6a7oBLkdqlS9/Zfi0lpwYHA==
X-Received: by 2002:a2e:9ec2:0:b0:26e:768c:11ed with SMTP id h2-20020a2e9ec2000000b0026e768c11edmr6117310ljk.436.1668513772696;
        Tue, 15 Nov 2022 04:02:52 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:02:52 -0800 (PST)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        quic_srivasam@quicinc.com, quic_plai@quicinc.com
Subject: [PATCH v2 06/11] ASoC: dt-bindings: qcom,q6adm: Split to separate schema
Date:   Tue, 15 Nov 2022 13:02:30 +0100
Message-Id: <20221115120235.167812-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
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

The APR/GPR bindings with services got complicated so move out the Q6ADM
service to its own binding.  Previously the compatible was documented in
qcom,apr.yaml.  Move most of the examples from its children to this new
file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/sound/qcom,q6adm-routing.yaml    | 22 ++------
 .../devicetree/bindings/sound/qcom,q6adm.yaml | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
index d0f7a79e240a..b7ed2d3f21f9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
@@ -30,23 +30,7 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/soc/qcom,apr.h>
-    #include <dt-bindings/sound/qcom,q6asm.h>
-
-    apr {
-        compatible = "qcom,apr-v2";
-        qcom,domain = <APR_DOMAIN_ADSP>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        service@8 {
-            compatible = "qcom,q6adm";
-            reg = <APR_SVC_ADM>;
-            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-
-            routing {
-                compatible = "qcom,q6adm-routing";
-                #sound-dai-cells = <0>;
-            };
-        };
+    routing {
+        compatible = "qcom,q6adm-routing";
+        #sound-dai-cells = <0>;
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
new file mode 100644
index 000000000000..fe14a97ea616
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,q6adm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Audio Device Manager (Q6ADM)
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
+      - qcom,q6adm
+
+  routing:
+    type: object
+    $ref: /schemas/sound/qcom,q6adm-routing.yaml#
+    unevaluatedProperties: false
+    description: Qualcomm DSP LPASS audio routing
+
+required:
+  - compatible
+  - routing
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
+        service@8 {
+            compatible = "qcom,q6adm";
+            reg = <APR_SVC_ADM>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+
+            routing {
+                compatible = "qcom,q6adm-routing";
+                #sound-dai-cells = <0>;
+            };
+        };
+    };
-- 
2.34.1

