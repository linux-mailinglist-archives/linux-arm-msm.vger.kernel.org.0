Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D422F5404BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 19:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345666AbiFGRTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 13:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345663AbiFGRS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 13:18:58 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FD4104CBF
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 10:18:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id me5so36027631ejb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 10:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O50J38PsJB3mSreFXR7H6YL7U8VScHENB0mb2zpmi8g=;
        b=dfOwAx6m3NGMCpVp7fz88gnUMIhFgCPWJ13r9LOLR4on+glxzIPRJ8/erD9NNAHTcy
         N3L6AydiDUq/ZkUeVxzOhHWGO2BOvvk9RGKnzQwR3/wFg/DHym+NXZqiqgDZxYur6vh9
         uiYWO/tjposidV/VYc1EZODA6QA4fwHS7yaXQ3bccfsjMnMUaeyV0L2hm3K1/vjw/cpy
         3B+gcY8Q+XLpVAzVR/iPU+cjKDO4pIDWccrf0UevZLWbTOd6T1Dj+rGrPRmn+ThAedwq
         453vSM7EKVtlxtE2FN4l/jb3m6yqnchxDycJPUkfRZ6aFJZOQxLjwvZsHoe17mOyi4Zw
         1kVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O50J38PsJB3mSreFXR7H6YL7U8VScHENB0mb2zpmi8g=;
        b=q8Kb8syq/rwmkRKFg1B5lZIVQzaUUSJMPIXQ3T5Rlj4Y3mCea4kIbYlVBogAn3CjuU
         4w+RAn0Cky9hiS9vFHhb+OMolw+HJ7c4//AhCyXDkmJ2BKgQx9HG9dLZWgWno94rOH0s
         /Dmwx9IBA4jBq29dpNR+6bqYEKBibOeL6SNtVjC5PWEPJlIfE+vhUC6qO5v/nHLoHK/z
         bBmkowc3ttXLAGwzi1ZRCaKgLN0pF4xqvJbH1P3cpTolNqvdTjCm/uWhkU+GC+mcJ4UM
         jgq+BJTBQ6zfXnHnPAhQs7Mlb4hwwDjlblTOdWQXtdETg57XXWa1z4aR4t+RohVrCs8a
         FGAg==
X-Gm-Message-State: AOAM532l36VDXgb5UNFA4OgufS3t0pnqRscCKyznHf3N+Dl4FI+icjNR
        lUewDPip+RXGvyCYlsM6oMi1nQ==
X-Google-Smtp-Source: ABdhPJz1F3LAIEP4ue3EJN7mJgqEYDBvnfzH2jpqlMVOEYry68H4798O3PVWAvS1Hlo7BG56rQTbBQ==
X-Received: by 2002:a17:906:6806:b0:703:1f4e:9868 with SMTP id k6-20020a170906680600b007031f4e9868mr27808874ejr.699.1654622333447;
        Tue, 07 Jun 2022 10:18:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id i7-20020a170906444700b0070e238ff66fsm5876540ejp.96.2022.06.07.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 10:18:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/14] dt-bindings: sram: qcom,imem: add IMEM memory region
Date:   Tue,  7 Jun 2022 19:18:36 +0200
Message-Id: <20220607171848.535128-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
References: <20220607171848.535128-1-krzysztof.kozlowski@linaro.org>
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

Add bindings for IMEM memory region (like SRAM) used on several
Qualcomm SoCs.  In the downstream (vendor) tree, it comes with several
children used for debugging purposes.  The upstreamed parts are much
smaller - just image loader and syscon reboot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sram/qcom,imem.yaml   | 75 +++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom,imem.yaml

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
new file mode 100644
index 000000000000..e9199190198d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sram/qcom,imem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IMEM memory region
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  Qualcomm IMEM is dedicated memory region for various debug features and DMA
+  transactions.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,apq8064-imem
+          - qcom,msm8974-imem
+          - qcom,qcs404-imem
+          - qcom,sc7180-imem
+          - qcom,sc7280-imem
+          - qcom,sdm630-imem
+          - qcom,sdm845-imem
+          - qcom,sdx55-imem
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml#
+
+patternProperties:
+  "^pil-reloc@[0-9a-f]+$":
+    $ref: /schemas/remoteproc/qcom,pil-info.yaml#
+    description: Peripheral image loader relocation region
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        sram@146bf000 {
+            compatible = "qcom,sdm845-imem", "syscon", "simple-mfd";
+            reg = <0 0x146bf000 0 0x1000>;
+            ranges = <0 0 0x146bf000 0x1000>;
+
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            pil-reloc@94c {
+                compatible = "qcom,pil-reloc-info";
+                reg = <0x94c 0xc8>;
+            };
+        };
+    };
-- 
2.34.1

