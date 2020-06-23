Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A946120491A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 07:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730512AbgFWFS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 01:18:28 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46465 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730447AbgFWFS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 01:18:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592889507; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zlrx9brlOpWo7h4BkyKwjJnbNesRpdXkm8MqQbYCfEs=; b=Ncf3mFLc3KNQj/bSLZZJPH7nj5kHkrbeLRInCMhcDBJuRvY5UB0mYQ0zbnZ5NSUV0tWSzO1+
 7UqXN0kraDQEH30c4ywxcYpY4DsDT5TpDFc2oWiryrIwkyl2QzgWc7XXDcK5FB2XwosXGzRg
 HgxR/RM3SkSGPz28/9bb+tbqJDI=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ef190a1f3deea03f3bc7ff4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Jun 2020 05:18:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEC28C4339C; Tue, 23 Jun 2020 05:18:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 22FEAC433AF;
        Tue, 23 Jun 2020 05:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22FEAC433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH V2 5/6] dt-bindings: soc: qcom: convert the SMD-RPM document to YAML schema
Date:   Tue, 23 Jun 2020 10:47:51 +0530
Message-Id: <1592889472-6843-6-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
References: <1592889472-6843-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,smd-rpm.txt document to YAML schema

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  | 63 ---------------
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 92 ++++++++++++++++++++++
 2 files changed, 92 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
deleted file mode 100644
index a817c61..00000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ /dev/null
@@ -1,63 +0,0 @@
-Qualcomm Resource Power Manager (RPM) over SMD
-
-This driver is used to interface with the Resource Power Manager (RPM) found in
-various Qualcomm platforms. The RPM allows each component in the system to vote
-for state of the system resources, such as clocks, regulators and bus
-frequencies.
-
-The SMD information for the RPM edge should be filled out.  See qcom,smd.txt for
-the required edge properties.  All SMD related properties will reside within the
-RPM node itself.
-
-= SUBDEVICES
-
-The RPM exposes resources to its subnodes.  The rpm_requests node must be
-present and this subnode may contain children that designate regulator
-resources.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,rpm-apq8084"
-		    "qcom,rpm-ipq6018"
-		    "qcom,rpm-msm8916"
-		    "qcom,rpm-msm8974"
-		    "qcom,rpm-msm8976"
-		    "qcom,rpm-msm8998"
-		    "qcom,rpm-sdm660"
-		    "qcom,rpm-qcs404"
-
-- qcom,smd-channels:
-	Usage: required
-	Value type: <string>
-	Definition: must be "rpm_requests"
-
-Refer to Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
-for information on the regulator subnodes that can exist under the rpm_requests.
-
-Example:
-
-	soc {
-		apcs: syscon@f9011000 {
-			compatible = "syscon";
-			reg = <0xf9011000 0x1000>;
-		};
-	};
-
-	smd {
-		compatible = "qcom,smd";
-
-		rpm {
-			interrupts = <0 168 1>;
-			qcom,ipc = <&apcs 8 0>;
-			qcom,smd-edge = <15>;
-
-			rpm_requests {
-				compatible = "qcom,rpm-msm8974";
-				qcom,smd-channels = "rpm_requests";
-
-				...
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
new file mode 100644
index 00000000..06aa6b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Resource Power Manager (RPM) over SMD
+
+description: |
+  This driver is used to interface with the Resource Power Manager (RPM) found
+  in various Qualcomm platforms. The RPM allows each component in the system
+  to vote for state of the system resources, such as clocks, regulators and bus
+  frequencies.
+
+  The SMD information for the RPM edge should be filled out.  See qcom,smd.txt
+  for the required edge properties.  All SMD related properties will reside
+  within the RPM node itself.
+
+  The RPM exposes resources to its subnodes.  The rpm_requests node must be
+  present and this subnode may contain children that designate regulator
+  resources.
+
+  Refer to Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+  for information on the regulator subnodes that can exist under the
+  rpm_requests.
+
+maintainers:
+  - Kathiravan T <kathirav@codeaurora.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,rpm-apq8084
+      - qcom,rpm-ipq6018
+      - qcom,rpm-msm8916
+      - qcom,rpm-msm8974
+      - qcom,rpm-msm8976
+      - qcom,rpm-msm8996
+      - qcom,rpm-msm8998
+      - qcom,rpm-sdm660
+      - qcom,rpm-qcs404
+
+  qcom,smd-channels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Channel name used for the RPM communication
+    items:
+      - const: rpm_requests
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,rpm-apq8084
+          - qcom,rpm-msm8916
+          - qcom,rpm-msm8974
+then:
+  required:
+    - qcom,smd-channels
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        apcs: syscon@f9011000 {
+              compatible = "syscon";
+              reg = <0xf9011000 0x1000>;
+        };
+    };
+    smd {
+        compatible = "qcom,smd";
+
+        rpm {
+            interrupts = <0 168 1>;
+            qcom,ipc = <&apcs 8 0>;
+            qcom,smd-edge = <15>;
+
+                rpm_requests {
+                        compatible = "qcom,rpm-msm8974";
+                        qcom,smd-channels = "rpm_requests";
+
+                        /* Regulator nodes to follow */
+                };
+            };
+     };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

