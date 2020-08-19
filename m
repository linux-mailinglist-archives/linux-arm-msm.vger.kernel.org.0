Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8749A24A2B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 17:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgHSPUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 11:20:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728481AbgHSPUK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 11:20:10 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D544E207FF;
        Wed, 19 Aug 2020 15:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597850410;
        bh=+CZjqAP9BwS+oTcWjIBCOd8FUJx3ft6iDVH+DtcWMB4=;
        h=From:To:Cc:Subject:Date:From;
        b=djUeEd0jYaP/1UoT2NFZF8s/WQ4NPOTacoHKkkpD4kZ9FgvDB9EjDoeG7NyVfe2mZ
         /ZGkTWx/FIMDIMYavM8CTiyzJ3C23ott1fbGAo50wvQGwsBhIAwct8aM5bVYK6edEZ
         kIjkD2z8dZ3LpLvDpMdHtSDhsaFQbc6O+JP5nGt4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k8Psl-00F4N9-H5; Wed, 19 Aug 2020 17:20:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Josh Cartwright <joshc@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: convert spmi.txt to spmi.yaml
Date:   Wed, 19 Aug 2020 17:20:06 +0200
Message-Id: <94b055687143c9593cd4311f8bcda99a743a619f.1597850327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the SPMI bus documentation to JSON/yaml.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

Rob,

As promissed, this patch converts the spmi.txt generic bus bindings to
html.

 .../bindings/mfd/qcom,spmi-pmic.txt           |  2 +-
 .../bindings/spmi/qcom,spmi-pmic-arb.txt      |  4 +-
 .../devicetree/bindings/spmi/spmi.txt         | 41 ------------
 .../devicetree/bindings/spmi/spmi.yaml        | 62 +++++++++++++++++++
 4 files changed, 65 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spmi/spmi.txt
 create mode 100644 Documentation/devicetree/bindings/spmi/spmi.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
index fffc8fde3302..79367a43b27d 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
@@ -37,7 +37,7 @@ Required properties:
                    or generalized "qcom,spmi-pmic".
 - reg:             Specifies the SPMI USID slave address for this device.
                    For more information see:
-                   Documentation/devicetree/bindings/spmi/spmi.txt
+                   Documentation/devicetree/bindings/spmi/spmi.yaml
 
 Required properties for peripheral child nodes:
 - compatible:      Should contain "qcom,xxx", where "xxx" is a peripheral name.
diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
index e16b9b5afc70..ca645e21fe47 100644
--- a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -7,8 +7,8 @@ devices to control a single SPMI master.
 The PMIC Arbiter can also act as an interrupt controller, providing interrupts
 to slave devices.
 
-See spmi.txt for the generic SPMI controller binding requirements for child
-nodes.
+See Documentation/devicetree/bindings/spmi/spmi.yaml for the generic SPMI
+controller binding requirements for child nodes.
 
 See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
 generic interrupt controller binding documentation.
diff --git a/Documentation/devicetree/bindings/spmi/spmi.txt b/Documentation/devicetree/bindings/spmi/spmi.txt
deleted file mode 100644
index 4bb10d161a27..000000000000
--- a/Documentation/devicetree/bindings/spmi/spmi.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-System Power Management Interface (SPMI) Controller
-
-This document defines a generic set of bindings for use by SPMI controllers.  A
-controller is modelled in device tree as a node with zero or more child nodes,
-each representing a unique slave on the bus.
-
-Required properties:
-- #address-cells : must be set to 2
-- #size-cells : must be set to 0
-
-Child nodes:
-
-An SPMI controller node can contain zero or more child nodes representing slave
-devices on the bus.  Child 'reg' properties are specified as an address, type
-pair.  The address must be in the range 0-15 (4 bits).  The type must be one of
-SPMI_USID (0) or SPMI_GSID (1) for Unique Slave ID or Group Slave ID respectively.
-These are the identifiers "statically assigned by the system integrator", as
-per the SPMI spec.
-
-Each child node must have one and only one 'reg' entry of type SPMI_USID.
-
-#include <dt-bindings/spmi/spmi.h>
-
-	spmi@.. {
-		compatible = "...";
-		reg = <...>;
-
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		child@0 {
-			compatible = "...";
-			reg = <0 SPMI_USID>;
-		};
-
-		child@7 {
-			compatible = "...";
-			reg = <7 SPMI_USID
-			       3 SPMI_GSID>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/spmi/spmi.yaml b/Documentation/devicetree/bindings/spmi/spmi.yaml
new file mode 100644
index 000000000000..8d72796b9bec
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/spmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: System Power Management Interface (SPMI) Controller
+
+maintainers:
+  - Josh Cartwright <joshc@codeaurora.org>
+
+description: |
+  The System Power Management (SPMI) controller is a 2-wire bus defined
+  by the MIPI Alliance for power management control to be used on SoC designs.
+
+  SPMI controllers are modelled in device tree using a generic set of
+  bindings defined here, plus any bus controller specific properties, if
+  needed.
+
+  Each SPMI controller has zero or more child nodes (up to 16 ones), each
+  one representing an unique slave at the bus.
+
+properties:
+  $nodename:
+    pattern: "spmi@[0-9a-f]+"
+
+  compatible:
+    description: filled by the SPMI bus controller
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "@([0-9]|1[0-5])$":
+    description: up to 16 child PMIC nodes
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@.. {
+      compatible = "...";
+      reg = <...>;
+
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      child@0 {
+        compatible = "...";
+        reg = <0 SPMI_USID>;
+      };
+
+      child@7 {
+        compatible = "...";
+        reg = <7 SPMI_USID
+               3 SPMI_GSID>;
+      };
+    };
-- 
2.26.2


