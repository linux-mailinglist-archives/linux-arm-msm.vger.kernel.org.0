Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50C1231A19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 09:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgG2HOG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 03:14:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32143 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726918AbgG2HOF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 03:14:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596006845; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UYZserCrt3oC+LdhKkF2dH8yCInFYBQtBRSzh9FIIi0=; b=suiPBtrqQZ24cUymcnnsDjPAMgwRDmhNbNv8HL7lAbcco+EcWzD/TWsfvjPE58zLdG71z6vW
 MNuY7PjMcjzFzwHf1PQAjmwBnMvZJ0uCwVc7O6UEIOlPIimTxLwxjao6vCX4WVJPGdCis1jI
 RQbMiI76PY7LTL+Rr4KJG/vTNIs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f2121ae7186ea1ee15d7b42 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 07:13:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42F4AC433AF; Wed, 29 Jul 2020 07:13:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1CD4C4339C;
        Wed, 29 Jul 2020 07:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F1CD4C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v6 2/4] dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
Date:   Wed, 29 Jul 2020 00:13:38 -0700
Message-Id: <20200729071340.7673-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200729071340.7673-1-wcheng@codeaurora.org>
References: <20200729071340.7673-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 .../bindings/usb/qcom,pmic-typec.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 000000000000..877e979f413f
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,131 @@
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
+    description: Connector type for remote endpoints
+    type: object
+
+    properties:
+      compatible:
+        $ref: /schemas/connector/usb-connector.yaml#/properties/compatible
+        enum:
+          - usb-c-connector
+
+      power-role:
+        $ref: /schemas/connector/usb-connector.yaml#/properties/power-role
+        enum:
+         - dual
+         - source
+         - sink
+
+      data-role:
+        $ref: /schemas/connector/usb-connector.yaml#/properties/data-role
+        enum:
+          - dual
+          - host
+          - device
+
+      ports:
+        description: Remote endpoint connections
+        type: object
+        $ref: /schemas/connector/usb-connector.yaml#/properties/ports
+
+        properties:
+          port@0:
+            description: Remote endpoints for the High Speed path
+            type: object
+
+          port@1:
+            description: Remote endpoints for the Super Speed path
+            type: object
+
+            properties:
+              endpoint@0:
+                description: Connection to USB type C mux node
+                type: object
+
+                properties:
+                  remote-endpoint:
+                    description: Node reference to the type C mux
+
+              endpoint@1:
+                description: Connection to role switch node
+                type: object
+
+                properties:
+                  remote-endpoint:
+                    description: Node reference to the role switch node
+
+    required:
+      - compatible
+
+required:
+  - compatible
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

