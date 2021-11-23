Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F08F459B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 05:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbhKWEdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 23:33:36 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:10723 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233339AbhKWEdc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 23:33:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637641824; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=4vuW9ZMeOXYLQEHq1YEB6xUgb478Kj5Lmp0bLqBmSbU=; b=mnOO8vKzN26uoau0AihDoVYd4YwcgsmZt3yBdM9c+M0Mn0an+AtCIJF/UiRziP9dpAfkiaTo
 B8Rkpe3I/kU+BnEqgLSfy04YrAO5jFcXGc/XmEPdBx9CU+h2C0eHcv21Hzvi8ubA/euz7OU4
 qEptlm3paqpz3psWgMOwEXLDXbY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 619c6e602c7dc0a7643cf0fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 04:30:24
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5B75C43619; Tue, 23 Nov 2021 04:30:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0569C43618;
        Tue, 23 Nov 2021 04:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F0569C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        bjorn.andersson@linaro.org, greg@kroah.com
Cc:     linux-kernel@vger.kernel.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        quic_schowdhu@quicinc.com,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V1 1/8] dt-bindings: Add the yaml bindings for EUD
Date:   Tue, 23 Nov 2021 09:58:19 +0530
Message-Id: <472de38309fd5d773f903f7a0cfb4440ae1dd380.1637639009.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1637639009.git.schowdhu@codeaurora.org>
References: <cover.1637639009.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Documentation for Embedded USB Debugger(EUD) device tree
bindings in yaml format.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
new file mode 100644
index 0000000..724552c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Embedded USB Debugger
+
+maintainers:
+  - Souradeep Chowdhury <schowdhu@codeaurora.org>
+
+description: |
+  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
+  mini USB-hub implemented on chip to support USB-based debug capabilities.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sc7280-eud
+      - const: qcom,eud
+
+  reg:
+    items:
+      - description: EUD Base Register Region
+      - description: EUD Mode Manager Register
+
+  interrupts:
+    description:
+      EUD interrupt
+
+
+  port:
+    description:
+      Any connector to the data bus of this controller should be modelled
+      using the OF graph bindings specified, if the "usb-role-switch"
+      property is used. See graph.txt
+    $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    eud@88e0000 {
+           compatible = "qcom,sc7280-eud","qcom,eud";
+           reg = <0 0x88e0000 0 0x2000>,
+                 <0 0x88e2000 0 0x1000>;
+    };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

