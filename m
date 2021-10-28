Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9E43E68A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 18:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbhJ1QuQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 12:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhJ1QuP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 12:50:15 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52473C061745
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m22so11408015wrb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 09:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=BeYbIMck+3lnUds9p1ZqEeBUc2UYqrTMpUgZoLOxyUO6a8df0jjmJysbQ4BCS5yPTw
         UPzgXv0wGrlS+NWOq0zDFl/O/iJuIW7sN2AcPm7i9n7iRFxRy4YVu0aHcL7N0wsZr5wY
         sbfVmWi1hkhi7Eti2EFke3ZDiTH/JOY2wGdjetwPvRZWy3wP5gtA2U25lPfY5B3dFg42
         6SwYv5bOAzsFmR2n24b/dnH9Gf+A2feWwTrwch3zGRcrUguN7zwhePnx+LnD5UuTcd8G
         K/bbUqHcZnF5rn8fD8gEtg4AVmuVQobEPXJ98sgIyAoYM4ghUC0PLAdQXQ9hJoTesDgA
         aaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6folD6S9BqLGM99G5RWE+A4n/cypELvZBV4a40T5Hg=;
        b=19T1GcwDBqRu092WfmOqnwnLvGX11T4awXth9evGxYmDd/u/7VCeVVHSMZOBRB8RPs
         Xmg9E/0RI2rxHiBiLKdFuFRa7P5QWprk+R/RtexpGCOswXB7xM82rFe8CDrKHfk9xclW
         ZWZ/jRq6j4VUYxNjHO+Pup1PoS/4B42l0mhJ6a1KdhQcsEma6r1zQmCKAfXCfuyrRthc
         f8AoAsHMEFRf7f+4nSh2SwCk7PAV9pPja6JVmb5ONvj21i6vd+Su160VdwkOJnMFwM6f
         BJgyEtvQ7iLsxjP5LEVuCgiMHsfBqZn4swpd5g4uddtTOFz4JXCmEdU+4pcY0iyjRyaO
         lVcQ==
X-Gm-Message-State: AOAM531n4I+JDT/oAzE91tws7snbBmLJ0jhxm8qcyYNZiQPRnV1vj3IW
        TJ1Wj07BFZBiqNKIgpY90sA46w==
X-Google-Smtp-Source: ABdhPJzrBPTOHwPGKTed7p0gjwIxznNcIltdVW33kHWHvAkC4KXF2eDg9hHVZxkxIRky4/nx2cG4Dw==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr7129659wri.158.1635439666918;
        Thu, 28 Oct 2021 09:47:46 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y8sm3601724wrq.77.2021.10.28.09.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:47:46 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        rdunlap@infradead.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH v2 4/7] dt-bindings: usb: Add Qualcomm PMIC PDPHY controller YAML schema
Date:   Thu, 28 Oct 2021 17:49:38 +0100
Message-Id: <20211028164941.831918-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org>
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

