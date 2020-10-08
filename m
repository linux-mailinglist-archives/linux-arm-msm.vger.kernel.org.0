Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE07F287F78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 02:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730053AbgJIASr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 20:18:47 -0400
Received: from z5.mailgun.us ([104.130.96.5]:60657 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729877AbgJIASV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 20:18:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602202700; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wDVs1PAj7F1rFnf4cJYNxOR+1RfxIRCwHdZr9KslO8o=; b=iG6qQ/8ld/rY0pmmG+I/yaW0PvjXetgQXwwBa5x27QyMkYMtMm8sahf6CSd3zK+8OSQm7IMq
 fJ9AHt+JNohhDWD+IaKMC5LQl5RdyDtvkK3binJh/eZX/ysJfdO2JBBknLBwBnUlrl6n4b57
 udTLmJvNFLqxHY8DnfZck9RRZe4=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f7fac4bd63768e57bce4425 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 00:18:19
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2705BC43442; Thu,  8 Oct 2020 23:59:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB618C433B1;
        Thu,  8 Oct 2020 23:59:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DB618C433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, sergei.shtylyov@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v10 2/4] dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
Date:   Thu,  8 Oct 2020 16:59:32 -0700
Message-Id: <20201008235934.8931-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201008235934.8931-1-wcheng@codeaurora.org>
References: <20201008235934.8931-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 .../bindings/usb/qcom,pmic-typec.yaml         | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 000000000000..40e0a296f922
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,115 @@
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
+  port:
+    description: Remote endpoint connection to the DRD switch
+    type: object
+
+    properties:
+      endpoint:
+        description: Connection to the DRD switch being used
+        type: object
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
+        description: Remote endpoint connections for type C paths
+        type: object
+
+        properties:
+          port@1:
+            description: Remote endpoints for the Super Speed path
+            type: object
+
+            properties:
+              endpoint:
+                description: Connection to USB type C mux node
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
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pm8150b {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        pm8150b_typec: usb-typec@1500 {
+            compatible = "qcom,pm8150b-usb-typec";
+            reg = <0x1500>;
+            interrupts = <0x2 0x15 0x5 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                usb3_role: endpoint {
+                    remote-endpoint = <&dwc3_drd_switch>;
+                };
+            };
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
+                        usb3_data_ss: endpoint {
+                            remote-endpoint = <&qmp_ss_mux>;
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

