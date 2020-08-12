Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7492425F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 09:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgHLHUL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 03:20:11 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49734 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726818AbgHLHUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 03:20:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597216806; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GNSQHBNJ1zB8GVqX52aRj+qIk9pzDq2s65j759dKyS8=; b=QzHFEqlQ7/nZeQmFReGe4H1X5ymySe4WUk8drkQE/y+03iumRqEStwSm5tdWoRxUsTLiDVhG
 FexBcBzruElqgmPTIiZGe6cyc9zF2mNy8sERGnYxWAwwq5UYdK9QMFTn8h/nHcj0Qtxk+wUV
 ZydNNBMQ8OreeHOaoGp2fPrerv4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f33981b4c787f237b5a477e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 12 Aug 2020 07:19:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B3C9C43391; Wed, 12 Aug 2020 07:19:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 14786C433A0;
        Wed, 12 Aug 2020 07:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 14786C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        agross@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v8 2/4] dt-bindings: usb: Add Qualcomm PMIC type C controller dt-binding
Date:   Wed, 12 Aug 2020 00:19:23 -0700
Message-Id: <20200812071925.315-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200812071925.315-1-wcheng@codeaurora.org>
References: <20200812071925.315-1-wcheng@codeaurora.org>
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
 .../bindings/usb/qcom,pmic-typec.yaml         | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
new file mode 100644
index 000000000000..d5173f88d429
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
@@ -0,0 +1,112 @@
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
+        $ref: /connector/usb-connector.yaml#/properties/compatible
+        enum:
+          - usb-c-connector
+
+      power-role: true
+      data-role: true
+
+      ports:
+        description: Remote endpoint connections
+        type: object
+        $ref: /connector/usb-connector.yaml#/properties/ports
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
+              endpoint@1:
+                description: Connection to role switch node
+                type: object
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

