Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC9F43E256
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 15:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhJ1Nem (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 09:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhJ1Nel (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 09:34:41 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5C5BC061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id o14so10175795wra.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=lK3v67buce6HPdCjkWXO3fAEyNZ/fAQxNjoJTPOl4i9yhSh4oE3ct/q3jehEc2iNYP
         rcSEomlbfVzPkD1c6Yp8iogJ/753jPy0vQT04NawvxjeYCPCWDT1lGxtYLrcAINCsOKa
         EJqj9uM+t6u+s98ZRt05inXcYynPhzYls7G20Aho0PlUd+Cj4vQUkvKKbl69pnzHRIdj
         9RqYZG6WLvJKTm699Dlw3XA5tnSxzELzT62FCQgQ3+kzS2D5o5pVLWxA5sDhrbXpZuXG
         atTblTHAPRFGFfI3P7tqujA7juhCOdgfSDxtQpBZhRwN4COOC4ps9Wd7rT1oEsOjcpQe
         ekyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=oj5wuk6nuUYsuAC+fAxVA7V9n2xBVLNR1reR8eND/wyRQLWvDoa/UlTEx4egZO2Fb9
         AAXidTKI5oyXQeIvsCvfT7Kh94PckbVM9jK6W3q0FB19rs3fCKNAm0hU9jLFB4ey/RwL
         3gVnu1pbubbFQjYM6i9yb/6BJ9mUBUiDCjJC8KD+eE7nI7doX7zo8CvsfdzibHvamtNx
         qVih1L8jPUsFlXVGpK5NroKBd5HwxRPr+p1c97m2ezlVHd//ySJIrBQNCCbYe2gUTKUn
         JfneFnR9bjaSnE5SiqT6LA9kkr02vFyZEGln5jAoamDvsZXgQU8ldMg55nNeoAQ+1VZD
         K4JQ==
X-Gm-Message-State: AOAM530FD1A8Ro5wdeZfeGkmPh4fCDb0gRnChgvAEHqMXQXGAiEgBEyx
        hcHxnPT3ZugmjgzRNyqeUPw9Cg==
X-Google-Smtp-Source: ABdhPJyKIhqxFMUAv9Nwlo/p7yzOsXrUikRn//S69K1lPQAFXLqw65X7vgXs8KmR78NZWMxy6pE/3Q==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr5805680wrr.323.1635427933288;
        Thu, 28 Oct 2021 06:32:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y23sm2774845wmi.43.2021.10.28.06.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 06:32:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 4/7] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Thu, 28 Oct 2021 14:34:01 +0100
Message-Id: <20211028133404.826012-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
References: <20211028133404.826012-1-bryan.odonoghue@linaro.org>
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

