Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC16BF9DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Mar 2023 13:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjCRMSx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Mar 2023 08:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjCRMSs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Mar 2023 08:18:48 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9EB2B2B9
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:43 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso6535149wmb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Mar 2023 05:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679141922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fI4AYapt0RytFxas+YG3RwluUr+LdRhSkfTAHXWWG/w=;
        b=jBCY2hKOGsHUhOb2ErAnGk8EZiwi9PUud2ytugcFCSI0IxK+uiMAQkUQOl+8aowAed
         Z0mtJWqfEqEvfXO2x9gTo1ZclSQ6MlCwgN0eEfTQZci3V+VsK0I9AmdiIvuMGB6Zo1Pb
         NDAl6mq3gGE+k0+EELuRp0o4O9SusZO3Pn9tedbU0fMCu7tOdFV4Y2nPOGPcmuSVMKot
         QStluQLSKdmK1M2v2R3KN0JRDpqotRX9fILGo2GX71BjKLOdDQU/4Ttr5Q5JQJlJbEZt
         ndnwNn61Sh6AwCIXL66B4oVIQOCSVnZ0zsz79Pnkh7RenUUeg/pH50tezc+vzjFDPGP9
         oEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679141922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fI4AYapt0RytFxas+YG3RwluUr+LdRhSkfTAHXWWG/w=;
        b=akTLE2ewAiK4rI1S9ZO1PjdyriOPkzh6rLaFYJhqyzK8xhwjhI3L+XHBqO44ScGKYq
         EkPkvZZIQiQP7pFch8QI1LmKm8OAS23EaN6fxN+GwDdUM2MoY42uDYnXRjkGBcKRxH6f
         cE+sN/iViG7czc0ezt1K1xt9nOdR8AtKa2i0ymkCl3ALniOt7b8tkJnxEhA75Z5Wu0Bi
         ddjdIHFNSQ6jpFj1OVsCG81QhJzvEQyBD92QNxj3sTjt/Pb7XzNFJertYl6rf/SO5lBO
         jIS+sHXDZWQE9rOD/Am47KsrTf6FWyIvVkSbddO0TZyyNuzBgoRfGg9fkDlq4oekCFgo
         53/Q==
X-Gm-Message-State: AO0yUKXe1/fOuRTMp9gwP3QN11u17zFFvKesaszHrbo3oAetXIoxG8wU
        1tGejhXbL1vB1gYp5+gqoE961w==
X-Google-Smtp-Source: AK7set8G1BPZ+YZ6GW/7ALfmWyvbWgCOcwIQmmuos4VSdGGxOojMmZ27GMYk/YoyO8q8T41q6kievQ==
X-Received: by 2002:a7b:c38b:0:b0:3ed:2e02:1bfe with SMTP id s11-20020a7bc38b000000b003ed2e021bfemr4007788wmj.20.1679141922644;
        Sat, 18 Mar 2023 05:18:42 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id az40-20020a05600c602800b003e2096da239sm10814997wmb.7.2023.03.18.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 05:18:42 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, konrad.dybcio@linaro.org,
        subbaram@quicinc.com, jackp@quicinc.com, robertom@qti.qualcomm.com
Subject: [PATCH v4 08/18] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Sat, 18 Mar 2023 12:18:18 +0000
Message-Id: <20230318121828.739424-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
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

Add a YAML binding for the power-delivery PHY silicon interface inside
Qualcomm's pm8150b hardware block.

The pdphy driver operates with a type-c driver inside of a high level
single TCPM device to provide overall TCPM functionality.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-pdphy.yaml         | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
new file mode 100644
index 0000000000000..79318e3da41e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-pdphy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB PDPHY driver
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm PMIC Power Delivery PHY driver
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-pdphy
+
+  reg:
+    maxItems: 1
+    description: PDPHY base address
+
+  interrupts:
+    items:
+      - description: Sig TX - transmitted reset signal
+      - description: Sig RX - received reset signal
+      - description: TX completion
+      - description: RX completion
+      - description: TX fail
+      - description: TX discgard
+      - description: RX discgard
+      - description: Fast Role Swap event
+
+  interrupt-names:
+    items:
+      - const: sig-tx
+      - const: sig-rx
+      - const: msg-tx
+      - const: msg-rx
+      - const: msg-tx-failed
+      - const: msg-tx-discarded
+      - const: msg-rx-discarded
+      - const: fr-swap
+
+  vdd-phy-supply:
+    description: VDD regulator supply to the PHY.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - vdd-phy-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/typec/qcom,pmic-pdphy.h>
+
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_pdphy: pdphy@1700 {
+            compatible = "qcom,pm8150b-pdphy";
+            reg = <0x1700>;
+            interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "sig-tx",
+                              "sig-rx",
+                              "msg-tx",
+                              "msg-rx",
+                              "msg-tx-failed",
+                              "msg-tx-discarded",
+                              "msg-rx-discarded",
+                              "fr-swap";
+            vdd-phy-supply = <&vreg_l2a_3p1>;
+        };
+    };
+...
-- 
2.39.2

