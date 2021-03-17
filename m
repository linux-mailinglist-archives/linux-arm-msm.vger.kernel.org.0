Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB0733E91D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 06:31:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhCQFb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 01:31:26 -0400
Received: from a0.mail.mailgun.net ([198.61.254.59]:28247 "EHLO
        a0.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhCQFbK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 01:31:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615959070; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Qn1EGVzoTdINw2+hqTjiHPEI9NrorXmW2zMWADONTNo=; b=R7w1pWq4o1M91cmhz2tAlDyEJj+xF8bSFqaEdfZ7mAUJriIJBVNduqzfXE49o5vP6Ewwqk1u
 8vkm+m/DXtD4q7XNDwQVLpYzLbCnJMhbiVufAmkLTQafU8oDmSsTgSiePNNf+QdU7dTeQ7xC
 5/8Gry9XO0qvD2fA8xp0uNGR+6Q=
X-Mailgun-Sending-Ip: 198.61.254.59
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6051941d5d70193f88e71e12 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 05:31:09
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7CAFCC433ED; Wed, 17 Mar 2021 05:31:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BF2F5C43461;
        Wed, 17 Mar 2021 05:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BF2F5C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, bjorn.andersson@linaro.org, maz@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: interrupt-controller: Convert bindings to yaml for qcom,pdc
Date:   Wed, 17 Mar 2021 10:59:56 +0530
Message-Id: <1615958996-31807-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615958996-31807-1-git-send-email-mkshah@codeaurora.org>
References: <1615958996-31807-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change converts PDC interrupt controller bindings to yaml.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
This change depends on [1] which adds sc7280 compatible for PDC

[1] https://patchwork.kernel.org/project/linux-arm-msm/list/?series=440315
---
 .../bindings/interrupt-controller/qcom,pdc.txt     | 76 ------------------
 .../bindings/interrupt-controller/qcom,pdc.yaml    | 93 ++++++++++++++++++++++
 2 files changed, 93 insertions(+), 76 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
deleted file mode 100644
index 98d89e5..0000000
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.txt
+++ /dev/null
@@ -1,76 +0,0 @@
-PDC interrupt controller
-
-Qualcomm Technologies Inc. SoCs based on the RPM Hardened architecture have a
-Power Domain Controller (PDC) that is on always-on domain. In addition to
-providing power control for the power domains, the hardware also has an
-interrupt controller that can be used to help detect edge low interrupts as
-well detect interrupts when the GIC is non-operational.
-
-GIC is parent interrupt controller at the highest level. Platform interrupt
-controller PDC is next in hierarchy, followed by others. Drivers requiring
-wakeup capabilities of their device interrupts routed through the PDC, must
-specify PDC as their interrupt controller and request the PDC port associated
-with the GIC interrupt. See example below.
-
-Properties:
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: Should contain "qcom,<soc>-pdc" and "qcom,pdc"
-		    - "qcom,sc7180-pdc": For SC7180
-		    - "qcom,sc7280-pdc": For SC7280
-		    - "qcom,sdm845-pdc": For SDM845
-		    - "qcom,sdm8250-pdc": For SM8250
-		    - "qcom,sdm8350-pdc": For SM8350
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: Specifies the base physical address for PDC hardware.
-
-- interrupt-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: Specifies the number of cells needed to encode an interrupt
-		    source.
-		    Must be 2.
-		    The first element of the tuple is the PDC pin for the
-		    interrupt.
-		    The second element is the trigger type.
-
-- interrupt-controller:
-	Usage: required
-	Value type: <bool>
-	Definition: Identifies the node as an interrupt controller.
-
-- qcom,pdc-ranges:
-	Usage: required
-	Value type: <u32 array>
-	Definition: Specifies the PDC pin offset and the number of PDC ports.
-		    The tuples indicates the valid mapping of valid PDC ports
-		    and their hwirq mapping.
-		    The first element of the tuple is the starting PDC port.
-		    The second element is the GIC hwirq number for the PDC port.
-		    The third element is the number of interrupts in sequence.
-
-Example:
-
-	pdc: interrupt-controller@b220000 {
-		compatible = "qcom,sdm845-pdc";
-		reg = <0xb220000 0x30000>;
-		qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
-		#interrupt-cells = <2>;
-		interrupt-parent = <&intc>;
-		interrupt-controller;
-	};
-
-DT binding of a device that wants to use the GIC SPI 514 as a wakeup
-interrupt, must do -
-
-	wake-device {
-		interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-In this case interrupt 514 would be mapped to port 2 on the PDC as defined by
-the qcom,pdc-ranges property.
diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
new file mode 100644
index 0000000..26ae77c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. PDC interrupt controller
+
+maintainers:
+  - Maulik Shah <mkshah@codeaurora.org>
+
+description: |
+  Qualcomm Technologies, Inc. SoCs based on the RPM Hardened architecture have a
+  Power Domain Controller (PDC) that is on always-on domain. In addition to
+  providing power control for the power domains, the hardware also has an
+  interrupt controller that can be used to help detect edge low interrupts as
+  well detect interrupts when the GIC is non-operational.
+
+  GIC is parent interrupt controller at the highest level. Platform interrupt
+  controller PDC is next in hierarchy, followed by others. Drivers requiring
+  wakeup capabilities of their device interrupts routed through the PDC, must
+  specify PDC as their interrupt controller and request the PDC port associated
+  with the GIC interrupt. See example below.
+
+properties:
+ compatible:
+   items:
+     - enum:
+        # Should contain "qcom,<soc>-pdc" and "qcom,pdc"
+         - qcom,sc7180-pdc #For SC7180
+         - qcom,sc7280-pdc #For SC7280
+         - qcom,sdm845-pdc #For SDM845
+         - qcom,sm8250-pdc #For SM8250
+         - qcom,sm8350-pdc #For SM8350
+     - const: qcom,pdc
+
+ reg:
+    minItems: 1
+    items:
+      - description: PDC register base address
+
+ '#interrupt-cells':
+    # Specifies the number of cells needed to encode an interrupt.
+    # The first element of the tuple is the PDC pin for the interrupt.
+    # The second element is the trigger type.
+    const: 2
+
+ interrupt-controller: true
+
+ qcom,pdc-ranges:
+   description: |
+      Specifies the PDC pin offset and the number of PDC ports.
+      The tuples indicates the valid mapping of valid PDC ports
+      and their hwirq mapping.
+   $ref: /schemas/types.yaml#/definitions/uint32-matrix
+   items:
+      items:
+        - description: |
+           "a" The first element of the tuple is the starting PDC port.
+        - description: |
+           "b" The second element is the GIC SPI number for the PDC port.
+        - description: |
+           "c" The third element is the number of interrupts in sequence.
+
+required:
+    - compatible
+    - reg
+    - '#interrupt-cells'
+    - interrupt-controller
+    - qcom,pdc-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    pdc: interrupt-controller@b220000 {
+            compatible = "qcom,sdm845-pdc", "qcom,pdc";
+            reg = <0xb220000 0x30000>;
+            qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
+            #interrupt-cells = <2>;
+            interrupt-parent = <&intc>;
+            interrupt-controller;
+    };
+
+   # DT binding of a device that wants to use the GIC SPI 514 as a wakeup
+   # interrupt, must do -
+   # wake-device {
+   #     interrupts-extended = <&pdc 2 IRQ_TYPE_LEVEL_HIGH>;
+   # };
+
+   # In this case interrupt 514 would be mapped to port 2 on the PDC as defined
+   # by the qcom,pdc-ranges property.
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

