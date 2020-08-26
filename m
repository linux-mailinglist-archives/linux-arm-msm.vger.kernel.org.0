Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B8725265A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Aug 2020 06:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgHZEhK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 00:37:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:46464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgHZEhK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 00:37:10 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E4422071E;
        Wed, 26 Aug 2020 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598416629;
        bh=1yCPLYQsfFn9Sm8/Cw10dPtWahWPZ+11bgyvxCCEz+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S70jTlpPPlRanbVj6W7qmgM+THSKuELvDonfbKzKo1pkDUdAcGcrOWkWsZaGZnxdZ
         5yhWwdMUJpyk232DKjHeyJFlZmQeu1g/568SKUu/ER5YjpVWHZjU0k5lgkxQzu4yiQ
         4Vz+gtx06NDQ5RZpCGCV428AlTtyeRwWoIjhTyBc=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAnBL-001Nos-7e; Wed, 26 Aug 2020 06:37:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Josh Cartwright <joshc@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: convert spmi.txt to spmi.yaml
Date:   Wed, 26 Aug 2020 06:36:49 +0200
Message-Id: <ee4c4ca9f29a39f6af772b3a526a996176499da3.1598415179.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200826061150.3eb96ab3@coco.lan>
References: <20200826061150.3eb96ab3@coco.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the SPMI bus documentation to JSON/yaml.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

v2:
- addressed issues pointed by Rob;
- made clear that group ID is a future extension, that it is not
  currently supported.

 .../bindings/mfd/qcom,spmi-pmic.txt           |  2 +-
 .../bindings/spmi/qcom,spmi-pmic-arb.txt      |  4 +-
 .../devicetree/bindings/spmi/spmi.txt         | 41 ----------
 .../devicetree/bindings/spmi/spmi.yaml        | 75 +++++++++++++++++++
 4 files changed, 78 insertions(+), 44 deletions(-)
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
index 000000000000..0e54978245b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/spmi.yaml
@@ -0,0 +1,75 @@
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
+    pattern: "spmi@.*"
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  ".*@([0-9]|1[0-5])$":
+    description: up to 16 child PMIC nodes
+    type: object
+
+    properties:
+      reg:
+        minItems: 1
+        maxItems: 2
+        items:
+          - minimum: 0
+            maximum: 0xf
+          - enum: [ 0 ]
+            description: |
+              0 means user ID address. 1 is reserved for group ID address.
+
+    required:
+      - reg
+
+required:
+  - reg
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi@0 {
+      reg = <0 0>;
+
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      child@0 {
+        reg = <0 SPMI_USID>;
+      };
+
+      child@7 {
+        reg = <7 SPMI_USID>;
+      };
+    };
-- 
2.26.2


