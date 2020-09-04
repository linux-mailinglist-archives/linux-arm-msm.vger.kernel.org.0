Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1B825D37F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 10:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgIDIXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 04:23:19 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:39396
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729731AbgIDIWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 04:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599207773;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=GQ5X4rYz/5gctr6bPJcOyx/KllBUBw64I/aL0YQXbbM=;
        b=GT1OAVygLqRabFH/8WDxp1UTeMylLr5kaxyYgD57crvriQdGx5XlvKQlM5K9iBF1
        6x1R7L54nFFcmNXC1z54e2oUiVtgZEIZyRv6pGmYP+iz0/tPe3IWRH2MFVHAIQXneQ1
        oUth8HHkSB7Pkpuz/CRNjGOBC2bMAzTwlZSCy9Cs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599207773;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=GQ5X4rYz/5gctr6bPJcOyx/KllBUBw64I/aL0YQXbbM=;
        b=BAchygiNygh22GpaFB6CToyF13iG7Qc5l6CP7MPcnx9erx2LCGb04kclxRZz5QnE
        xSFzdhbGU11uTRt81+1tACenzmv0LZeAY3m1vuCKlwVFZaMn9sMeXb3xKOzsz6fIAbc
        sKI+DPg4puEWse539ct74cft50+gAhzK5iPEXzQc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=2.0 tests=ALL_TRUSTED,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DA32BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sergei.shtylyov@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v9 2/4] dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
Date:   Fri, 4 Sep 2020 08:22:53 +0000
Message-ID: <0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904082223.25563-1-wcheng@codeaurora.org>
References: <20200904082223.25563-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.04-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the dt-binding for enabling USB type C orientation and role
detection using the PM8150B.  The driver will be responsible for receiving
the interrupt at a state change on the CC lines, reading the
orientation/role, and communicating this information to the remote
clients, which can include a role switch node and a type C switch.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 .../bindings/usb/qcom,pmic-typec.yaml         | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 000000000000..8582ab6a3cc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm PMIC based USB type C Detection Driver
+
+maintainers:
+  - Wesley Cheng <wcheng@codeaurora.org>
+
+description: |
+  Qualcomm PMIC Type C Detect
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8150b-usb-typec
+
+  reg:
+    maxItems: 1
+    description: Type C base address
+
+  interrupts:
+    maxItems: 1
+    description: CC change interrupt from PMIC
+
+  connector:
+    $ref: /connector/usb-connector.yaml#
+    description: Connector type for remote endpoints
+    type: object
+
+    properties:
+      compatible:
+        enum:
+          - usb-c-connector
+
+      power-role: true
+      data-role: true
+
+      ports:
+        description: Remote endpoint connections
+        type: object
+
+        properties:
+          port@1:
+            description: Remote endpoints for the Super Speed path
+            type: object
+
+            properties:
+              endpoint@0:
+                description: Connection to USB type C mux node
+                type: object
+
+              endpoint@1:
+                description: Connection to role switch node
+                type: object
+
+    required:
+      - compatible
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - connector
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pm8150b_typec: typec@1500 {
+            compatible = "qcom,pm8150b-usb-typec";
+            reg = <0x1500>;
+            interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
+
+            connector {
+                compatible = "usb-c-connector";
+                power-role = "dual";
+                data-role = "dual";
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                        reg = <0>;
+                    };
+                    port@1 {
+                        reg = <1>;
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+                        usb3_data_ss: endpoint@0 {
+                            reg = <0>;
+                            remote-endpoint = <&qmp_ss_mux>;
+                        };
+                        usb3_role: endpoint@1 {
+                            reg = <1>;
+                            remote-endpoint = <&dwc3_drd_switch>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

