Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4F9765A55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 19:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjG0Rda (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 13:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjG0Rd3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 13:33:29 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2970B5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:33:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so2153077e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 10:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690479206; x=1691084006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab/j1VhwInQ6D6LVd9mtsScJ0oVMYT2f2KWdA6Xf3y4=;
        b=suyN/TPoJfOW/stA8HgNGbUiosrPlTB+HnZxnsO9Z84LrJUufLVuvyffUi9ByOt6WA
         gZN8kTnxYV7NENi9mwwoj0kKnSzcE6qLS/XvRdAYxMVhzgqqPvASYQDmsskxpWu3rwF9
         qeDRMzMTCW/Y7gFeoxV+0B4t3mQun15fVox1K6ZNiyQ9CDzR3/u54NO75qrZnxy19kNs
         8+0YgxVrfKwO/VPcfeI8IXmUoagnQbI1/CAwAZsyTmQoK7WAB7KaBcmK8HY4e1iFBOxs
         0fKyzeKW3ylGxE9axryZVEpKzH3lVmjOx70RBl7SqnAA7XeS9kS3weMEaXSUd+1SxA6S
         lkeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690479206; x=1691084006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ab/j1VhwInQ6D6LVd9mtsScJ0oVMYT2f2KWdA6Xf3y4=;
        b=IqzpaZAfvHIGC33rWoEIHA7b/Eh+dcvFpmJl9OrOJBApksNHdyak2VCYJ7WTGGOK/1
         WdIeAOEiXDl5EE3fBdOcKWmUlRetQel0Zd8d8/mZjpIn9poGCBsUPJ+l83dE1v0WVmCf
         kbb4vLlUc/YR8gHfDbiBEeniMGRj7aYh7QYb75E0JVJ50uRc0JWJVOJgad7zFxwNWYWW
         eWYCU3Fv0eX5N/O+Rk4H7UIjKqLxQ7QXk2TS6JP22T2Hwb8Sk0jnDcY/XiDkUR3msJyE
         uk25c3+LNbG/Bp68eCO/jdzzNIWdZahJWMWgZ2jBIXBrUdofDF5goP+e9puiXzQn0P2i
         1xJg==
X-Gm-Message-State: ABy/qLaVbWR5t3LJVYwE8lS5bN5vWCE1O2B59QNlTzZaaXCjACG9Io3n
        uBBJ59uEhJu7GNfyjkeIk9Kh0Q==
X-Google-Smtp-Source: APBJJlE3pGAlplcNT1wx2pa1R79My/Gn+IiIiXHN38zThuLirLj52n//dwq5/vZmqSmvUzIK0IhSiw==
X-Received: by 2002:a05:6512:33d0:b0:4f4:b13a:d683 with SMTP id d16-20020a05651233d000b004f4b13ad683mr2689726lfg.69.1690479205919;
        Thu, 27 Jul 2023 10:33:25 -0700 (PDT)
Received: from [192.168.1.101] (abxi99.neoplus.adsl.tpnet.pl. [83.9.2.99])
        by smtp.gmail.com with ESMTPSA id g4-20020a19ac04000000b004fe07f06337sm412089lfc.53.2023.07.27.10.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 10:33:25 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 27 Jul 2023 19:33:21 +0200
Subject: [PATCH v5 1/3] dt-bindings: remoteproc: qcom,sm6375-pas: Document
 remoteprocs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230725-topic-6375_rproc-v5-1-a8e9cde56a20@linaro.org>
References: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
In-Reply-To: <20230725-topic-6375_rproc-v5-0-a8e9cde56a20@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690479202; l=4551;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=K8Y5MQuKaFIasmD90JuZnhm5/0/+pZwBQrIyp6ZmLeM=;
 b=g88H73ztvndFemP65IzBLXwDfIJgR8/oW1iaK0JsBk8vO8cnsP/FLcvyclbt8HDT281a4nfPZ
 DzJ0X0BvSCqDMLom/qa5A6dnNvxg8W+MM/k4aGn1f75CaNX+/uqnEw0
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6375 hosts an ADSP, CDSP and modem as remote processors. Create
related bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/remoteproc/qcom,sm6375-pas.yaml       | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
new file mode 100644
index 000000000000..3e4a03eb4532
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,sm6375-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6375 Peripheral Authentication Service
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  Qualcomm SM6375 SoC Peripheral Authentication Service loads and boots
+  firmware on the Qualcomm DSP Hexagon cores.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm6375-adsp-pas
+      - qcom,sm6375-cdsp-pas
+      - qcom,sm6375-mpss-pas
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
+  smd-edge: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6375-adsp-pas
+            - qcom,sm6375-cdsp-pas
+    then:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+    else:
+      properties:
+        interrupts:
+          minItems: 6
+        interrupt-names:
+          minItems: 6
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6375-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: LCX power domain
+            - description: LMX power domain
+        power-domain-names:
+          items:
+            - const: lcx
+            - const: lmx
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm6375-cdsp-pas
+            - qcom,sm6375-mpss-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+        power-domain-names:
+          items:
+            - const: cx
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc_adsp: remoteproc@a400000 {
+        compatible = "qcom,sm6375-adsp-pas";
+        reg = <0x0a400000 0x100>;
+
+        interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+                              <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                          "handover", "stop-ack";
+
+        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+        clock-names = "xo";
+
+        power-domains = <&rpmpd SM6375_VDD_LPI_CX>,
+                        <&rpmpd SM6375_VDD_LPI_MX>;
+        power-domain-names = "lcx", "lmx";
+
+        memory-region = <&pil_adsp_mem>;
+
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_LPASS
+                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "lpass";
+            qcom,remote-pid = <2>;
+
+            /* ... */
+        };
+    };

-- 
2.41.0

