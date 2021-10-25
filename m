Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6824399AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 17:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233831AbhJYPJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 11:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233828AbhJYPJe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 11:09:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBFCC061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:11 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u18so10036290wrg.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=n2QLK5/A6VWBtZJRNSilVFh0PBKql1ijikzR98JjphMtVCftvBstVloM96R6/py50m
         9RzhQavw1fOTITRoStaDzaW2wlGebuCTQ39Em0AJxFRZ3mO3wcKEliVSRsawDlL2/lpr
         44BNRdh3BlWZHWWy8NS9Zk/xoKtpPYugFXRTtBuWfLJTwpExUMTQdhwDfK2oCIDB1tDM
         RZXNH1X428cVLLdLP5oLIGsw6sduCh9aGGqusmgcpKA4MNwocwo5fo8TpcmhGLP27AWs
         /UO1IxfnbWdPvHy/a7bXtwg/vMTUkYEofo/hPjAqrfxo6/QXA20Ts9JrUUOm6t12FP/7
         l40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=iVSFfQKbqqmSHdQEJIJewcbjdTIkbSheAZ+KOIPp6IL8QJI9ERVZtf9FzTQhZp2UWu
         VxpGe/nlnTGRE8Vt5I7SOAqJCznfYPctrmMbfHIyj5NGLuzjNkSHU9yDvnW1Fz5C8m29
         TIe8NI7u7Ki5lkhNAmieuSIXJroFPuofjSCCpZivn+uJG1+gBC97auBAjiLm9Nr9nruB
         jRibNby5+RKfQKZGL2GBNvcGRiahQwcjaIMYvkQorGvpLXQtoFBTMdlgjex/0EDVeJtn
         YVTBD6/3nEOHP4L0DdYEUcfvvNMjpzWzf9tU4UFVhBvr3FziEF6OJMywqC2N+xA9Q7tb
         awZA==
X-Gm-Message-State: AOAM533YbLCt5VtQ/Mt0eeV2T6V96wrvW7AayJVk7hBDuIuoMSu3ivTi
        BFS4FxALUnGPnZtz/3x+jDtgnA==
X-Google-Smtp-Source: ABdhPJyDbOlnCGi41bunK/lTO1AxVS8RGw0gEMTb5OjOlX/g3xLz/AlR7pudSa0ETrM56Hx/cuanng==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr23681638wre.315.1635174430168;
        Mon, 25 Oct 2021 08:07:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f20sm19173554wmq.38.2021.10.25.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 08:07:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 4/6] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Mon, 25 Oct 2021 16:09:04 +0100
Message-Id: <20211025150906.176686-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a YAML binding for the power-delivery PHY silicon interface inside
Qualcomm's pm8150b hardware block.

The pdphy driver operates with a type-c driver inside of a high level
single TCPM device to provide overall TCPM functionality.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/usb/qcom,pmic-pdphy.yaml         | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
new file mode 100644
index 0000000000000..9110f6203b87f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
@@ -0,0 +1,115 @@
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
+       - const: pmic-pdphy-sig-tx
+       - const: pmic-pdphy-sig-rx
+       - const: pmic-pdphy-msg-tx
+       - const: pmic-pdphy-msg-rx
+       - const: pmic-pdphy-msg-tx-failed
+       - const: pmic-pdphy-msg-tx-discarded
+       - const: pmic-pdphy-msg-rx-discarded
+       - const: pmic-pdphy-fr-swap
+
+  ports:
+    description: Remote endpoint connections
+    $ref: /connector/usb-connector.yaml#/properties/ports
+
+    properties:
+      port@0:
+        description: Remote endpoints for the TCPM driver
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/usb/typec/tcpm/qcom,pmic-usb-pdphy.h>
+
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pm8150b_pdphy: pdphy@1700 {
+            compatible = "qcom,pm8150b-pdphy";
+            reg = <0x1700>;
+            interrupts = <0x2 0x17 PMIC_PDPHY_SIG_TX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_SIG_RX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_FAIL_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_TX_DISCARD_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_MSG_RX_DISCARD_IRQ
+                          IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x17 PMIC_PDPHY_FR_SWAP_IRQ
+                          IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "pmic-pdphy-sig-tx",
+                              "pmic-pdphy-sig-rx",
+                              "pmic-pdphy-msg-tx",
+                              "pmic-pdphy-msg-rx",
+                              "pmic-pdphy-msg-tx-failed",
+                              "pmic-pdphy-msg-tx-discarded",
+                              "pmic-pdphy-msg-rx-discarded",
+                              "pmic-pdphy-fr-swap";
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    pmic_pdphy: endpoint {
+                        remote-endpoint = <&pmic_tcpm_pdphy>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.33.0

