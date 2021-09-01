Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192CB3FDF34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 17:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344099AbhIAP6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 11:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343963AbhIAP6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 11:58:36 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5F6C061764
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 08:57:39 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7D1C73E7E2;
        Wed,  1 Sep 2021 17:57:37 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        robh@kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v7 2/6] dt-bindings: avs: cpr: Convert binding to YAML schema
Date:   Wed,  1 Sep 2021 17:57:31 +0200
Message-Id: <20210901155735.629282-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
References: <20210901155735.629282-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the qcom,cpr.txt document to YAML schema and place it in the
appropriate directory, since this driver was moved from power/avs
to soc/qcom, but forgets to move the documentation.

Fixes: a7305e684fcf ("PM: AVS: qcom-cpr: Move the driver to the qcom specific drivers")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../bindings/power/avs/qcom,cpr.txt           | 131 +-------------
 .../bindings/soc/qcom/qcom,cpr.yaml           | 167 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 169 insertions(+), 131 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml

diff --git a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
index ab0d5ebbad4e..2ada8cd08949 100644
--- a/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
+++ b/Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
@@ -1,130 +1 @@
-QCOM CPR (Core Power Reduction)
-
-CPR (Core Power Reduction) is a technology to reduce core power on a CPU
-or other device. Each OPP of a device corresponds to a "corner" that has
-a range of valid voltages for a particular frequency. While the device is
-running at a particular frequency, CPR monitors dynamic factors such as
-temperature, etc. and suggests adjustments to the voltage to save power
-and meet silicon characteristic requirements.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: should be "qcom,qcs404-cpr", "qcom,cpr" for qcs404
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: base address and size of the rbcpr register region
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the CPR interrupt
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: phandle to the reference clock
-
-- clock-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "ref"
-
-- vdd-apc-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: phandle to the vdd-apc-supply regulator
-
-- #power-domain-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: should be 0
-
-- operating-points-v2:
-	Usage: required
-	Value type: <phandle>
-	Definition: A phandle to the OPP table containing the
-		    performance states supported by the CPR
-		    power domain
-
-- acc-syscon:
-	Usage: optional
-	Value type: <phandle>
-	Definition: phandle to syscon for writing ACC settings
-
-- nvmem-cells:
-	Usage: required
-	Value type: <phandle>
-	Definition: phandle to nvmem cells containing the data
-		    that makes up a fuse corner, for each fuse corner.
-		    As well as the CPR fuse revision.
-
-- nvmem-cell-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: should be "cpr_quotient_offset1", "cpr_quotient_offset2",
-		    "cpr_quotient_offset3", "cpr_init_voltage1",
-		    "cpr_init_voltage2", "cpr_init_voltage3", "cpr_quotient1",
-		    "cpr_quotient2", "cpr_quotient3", "cpr_ring_osc1",
-		    "cpr_ring_osc2", "cpr_ring_osc3", "cpr_fuse_revision"
-		    for qcs404.
-
-Example:
-
-	cpr_opp_table: cpr-opp-table {
-		compatible = "operating-points-v2-qcom-level";
-
-		cpr_opp1: opp1 {
-			opp-level = <1>;
-			qcom,opp-fuse-level = <1>;
-		};
-		cpr_opp2: opp2 {
-			opp-level = <2>;
-			qcom,opp-fuse-level = <2>;
-		};
-		cpr_opp3: opp3 {
-			opp-level = <3>;
-			qcom,opp-fuse-level = <3>;
-		};
-	};
-
-	power-controller@b018000 {
-		compatible = "qcom,qcs404-cpr", "qcom,cpr";
-		reg = <0x0b018000 0x1000>;
-		interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&xo_board>;
-		clock-names = "ref";
-		vdd-apc-supply = <&pms405_s3>;
-		#power-domain-cells = <0>;
-		operating-points-v2 = <&cpr_opp_table>;
-		acc-syscon = <&tcsr>;
-
-		nvmem-cells = <&cpr_efuse_quot_offset1>,
-			<&cpr_efuse_quot_offset2>,
-			<&cpr_efuse_quot_offset3>,
-			<&cpr_efuse_init_voltage1>,
-			<&cpr_efuse_init_voltage2>,
-			<&cpr_efuse_init_voltage3>,
-			<&cpr_efuse_quot1>,
-			<&cpr_efuse_quot2>,
-			<&cpr_efuse_quot3>,
-			<&cpr_efuse_ring1>,
-			<&cpr_efuse_ring2>,
-			<&cpr_efuse_ring3>,
-			<&cpr_efuse_revision>;
-		nvmem-cell-names = "cpr_quotient_offset1",
-			"cpr_quotient_offset2",
-			"cpr_quotient_offset3",
-			"cpr_init_voltage1",
-			"cpr_init_voltage2",
-			"cpr_init_voltage3",
-			"cpr_quotient1",
-			"cpr_quotient2",
-			"cpr_quotient3",
-			"cpr_ring_osc1",
-			"cpr_ring_osc2",
-			"cpr_ring_osc3",
-			"cpr_fuse_revision";
-	};
+This file has been moved to ../../soc/qcom/qcom,cpr.yaml
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
new file mode 100644
index 000000000000..20f65427c762
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,cpr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Core Power Reduction (CPR)
+
+description: |
+  CPR (Core Power Reduction) is a technology to reduce core power on a CPU
+  or other device. Each OPP of a device corresponds to a "corner" that has
+  a range of valid voltages for a particular frequency. While the device is
+  running at a particular frequency, CPR monitors dynamic factors such as
+  temperature, etc. and suggests adjustments to the voltage to save power
+  and meet silicon characteristic requirements.
+
+maintainers:
+  - Niklas Cassel <nks@flawful.org>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,qcs404-cpr
+      - const: qcom,cpr
+
+  reg:
+    description: Base address and size of the RBCPR register region
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref
+
+  clocks:
+    items:
+      - description: CPR reference clock
+
+  vdd-apc-supply:
+    description: Autonomous Phase Control (APC) power supply
+
+  '#power-domain-cells':
+    const: 0
+
+  acc-syscon:
+    description: phandle to syscon for writing ACC settings
+
+  nvmem-cells:
+    minItems: 9
+    maxItems: 32
+    description: Cells containing the fuse corners and revision data
+
+  nvmem-cell-names:
+    minItems: 9
+    maxItems: 32
+
+  operating-points-v2: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+  - vdd-apc-supply
+  - "#power-domain-cells"
+  - nvmem-cells
+  - nvmem-cell-names
+  - operating-points-v2
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cpus {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        cpu@100 {
+            compatible = "arm,cortex-a53";
+            device_type = "cpu";
+            reg = <0x100>;
+            operating-points-v2 = <&cpu_opp_table>;
+            power-domains = <&cpr>;
+            power-domain-names = "cpr";
+        };
+    };
+
+    cpu_opp_table: opp-table-cpu {
+        compatible = "operating-points-v2-kryo-cpu";
+        opp-shared;
+
+        opp-1094400000 {
+            opp-hz = /bits/ 64 <1094400000>;
+            required-opps = <&cpr_opp1>;
+        };
+        opp-1248000000 {
+            opp-hz = /bits/ 64 <1248000000>;
+            required-opps = <&cpr_opp2>;
+        };
+        opp-1401600000 {
+            opp-hz = /bits/ 64 <1401600000>;
+            required-opps = <&cpr_opp3>;
+        };
+    };
+
+    cpr_opp_table: opp-table-cpr {
+        compatible = "operating-points-v2-qcom-level";
+
+        cpr_opp1: opp1 {
+            opp-level = <1>;
+            qcom,opp-fuse-level = <1>;
+        };
+        cpr_opp2: opp2 {
+            opp-level = <2>;
+            qcom,opp-fuse-level = <2>;
+        };
+        cpr_opp3: opp3 {
+            opp-level = <3>;
+            qcom,opp-fuse-level = <3>;
+        };
+    };
+
+    power-controller@b018000 {
+        compatible = "qcom,qcs404-cpr", "qcom,cpr";
+        reg = <0x0b018000 0x1000>;
+        interrupts = <0 15 IRQ_TYPE_EDGE_RISING>;
+        clocks = <&xo_board>;
+        clock-names = "ref";
+        vdd-apc-supply = <&pms405_s3>;
+        #power-domain-cells = <0>;
+        operating-points-v2 = <&cpr_opp_table>;
+        acc-syscon = <&tcsr>;
+
+        nvmem-cells = <&cpr_efuse_quot_offset1>,
+                      <&cpr_efuse_quot_offset2>,
+                      <&cpr_efuse_quot_offset3>,
+                      <&cpr_efuse_init_voltage1>,
+                      <&cpr_efuse_init_voltage2>,
+                      <&cpr_efuse_init_voltage3>,
+                      <&cpr_efuse_quot1>,
+                      <&cpr_efuse_quot2>,
+                      <&cpr_efuse_quot3>,
+                      <&cpr_efuse_ring1>,
+                      <&cpr_efuse_ring2>,
+                      <&cpr_efuse_ring3>,
+                      <&cpr_efuse_revision>;
+        nvmem-cell-names = "cpr0_quotient_offset1",
+                           "cpr0_quotient_offset2",
+                           "cpr0_quotient_offset3",
+                           "cpr0_init_voltage1",
+                           "cpr0_init_voltage2",
+                           "cpr0_init_voltage3",
+                           "cpr0_quotient1",
+                           "cpr0_quotient2",
+                           "cpr0_quotient3",
+                           "cpr0_ring_osc1",
+                           "cpr0_ring_osc2",
+                           "cpr0_ring_osc3",
+                           "cpr_fuse_revision";
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f58dad1a1922..90f1db301fae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15490,7 +15490,7 @@ M:	Niklas Cassel <nks@flawful.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/power/avs/qcom,cpr.txt
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,cpr.yaml
 F:	drivers/soc/qcom/cpr.c
 
 QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096
-- 
2.32.0

