Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4C4342062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCSPAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbhCSPAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:00:30 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD25CC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:30 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v23so3072549ple.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M2CEXbNlNorHIt0/KQNWcmF9T/2OkYKo0K/LHRqivCU=;
        b=VTqvkqwLDc/DmNjMO8wqzkrDF0kqAyb/cidWIrgPBZTgDUf3uNqRQzT7y9UhIOj/3b
         g4dQ2Yo8rW9yinJq4dqvTjZZ5MCyQ+S9qDLWCVN8qfUjUtzVlNAyJy0afN5+rqqgGMH4
         PmNHXEKV9fXUfJ+al2LGBYfz/TRl8CTCeLe+wnnMcn5KIy+MY5GnK0X+iKs9w4v0XdvC
         J3JNuT8Vnt4lDU0Pw4zhsiKsvOHNVNY51eEwHN4XAtpiTs7E6Ld2Ycb7LNUoni9lTzQg
         2joTusAdJ5oK/60gSVcOGFiB1qNYciVP3bD06aMOGnfOFC7kkVFNNLm4Jn7r7zrFLidR
         Yo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M2CEXbNlNorHIt0/KQNWcmF9T/2OkYKo0K/LHRqivCU=;
        b=YwTxnXx7uAKwDKJ/Tmu3QOzH6mF/NDqcfvRf+QlO0UUOEtEWbJZi3XVMI5/RZo2mnm
         MlJXhd/psYgf7MeL/7AYt54JRWIxpZhD0TXILlEZNrqJoCfZaQbj/3if8F9pI9rc7Cji
         E7zTCVaogJSSqpehwABD4T8LT2xNILjQXgLa+Zqgy1md2XJOXeIYZYE/8dOofxGGeALp
         0FJGotzIl/QXQqJZjbNBPqXVndxN6Jp47f0itfTzbRaYOH7GhvkomYbcW5bUt6IwSUjF
         v4HAXjDk9cDapYZUzoQdUQ1bOm+Os2Qyy7HITglfG9yEeEEvibt0j4tNJEEHTZenkpc3
         zscg==
X-Gm-Message-State: AOAM533V5KZ4tLCvTrvd9q0DIUhYoftTtAfgT/GKw2gAf8Vl5X4gGRhf
        G8+aHHAXgffMyc2joqSys+tj
X-Google-Smtp-Source: ABdhPJzpvzoY/V/agQ19rz8VTCGroP9M2vlv7SjIiJOkE8jc1W2TNKA+8pB/qkYgvSCcqyGn0OndDg==
X-Received: by 2002:a17:902:9304:b029:e6:8d24:b5ce with SMTP id bc4-20020a1709029304b02900e68d24b5cemr14412625plb.27.1616166030280;
        Fri, 19 Mar 2021 08:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:387:dba9:92f4:36c7:1aec:59de])
        by smtp.gmail.com with ESMTPSA id h19sm6092345pfc.172.2021.03.19.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 08:00:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: mtd: Convert Qcom NANDc binding to YAML
Date:   Fri, 19 Mar 2021 20:30:08 +0530
Message-Id: <20210319150010.32122-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qcom NANDc devicetree binding to YAML.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 2 files changed, 196 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
new file mode 100644
index 000000000000..84ad7ff30121
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
@@ -0,0 +1,196 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/qcom,nandc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm NAND controller
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq806x-nand
+      - qcom,ipq4019-nand
+      - qcom,ipq6018-nand
+      - qcom,ipq8074-nand
+      - qcom,sdx55-nand
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core Clock
+      - description: Always ON Clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: aon
+
+  "#address-cells": true
+  "#size-cells": true
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    properties:
+      nand-bus-width:
+        const: 8
+
+      nand-ecc-strength:
+        enum: [1, 4, 8]
+
+      nand-ecc-step-size:
+        enum:
+          - 512
+
+allOf:
+  - $ref: "nand-controller.yaml#"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq806x-nand
+    then:
+      properties:
+        dmas:
+          items:
+            - description: rxtx DMA channel
+
+        dma-names:
+          items:
+            - const: rxtx
+
+        qcom,cmd-crci:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Must contain the ADM command type CRCI block instance number
+            specified for the NAND controller on the given platform
+
+        qcom,data-crci:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Must contain the ADM data type CRCI block instance number
+            specified for the NAND controller on the given platform
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq4019-nand
+              - qcom,ipq6018-nand
+              - qcom,ipq8074-nand
+              - qcom,sdx55-nand
+
+    then:
+      properties:
+        dmas:
+          items:
+            - description: tx DMA channel
+            - description: rx DMA channel
+            - description: cmd DMA channel
+
+        dma-names:
+          items:
+            - const: tx
+            - const: rx
+            - const: cmd
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
+    nand-controller@1ac00000 {
+      compatible = "qcom,ipq806x-nand";
+      reg = <0x1ac00000 0x800>;
+
+      clocks = <&gcc EBI2_CLK>,
+               <&gcc EBI2_AON_CLK>;
+      clock-names = "core", "aon";
+
+      dmas = <&adm_dma 3>;
+      dma-names = "rxtx";
+      qcom,cmd-crci = <15>;
+      qcom,data-crci = <3>;
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+
+        nand-ecc-strength = <4>;
+        nand-bus-width = <8>;
+
+        partitions {
+          compatible = "fixed-partitions";
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          partition@0 {
+            label = "boot-nand";
+            reg = <0 0x58a0000>;
+          };
+
+          partition@58a0000 {
+            label = "fs-nand";
+            reg = <0x58a0000 0x4000000>;
+          };
+        };
+      };
+    };
+
+    #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
+    nand-controller@79b0000 {
+      compatible = "qcom,ipq4019-nand";
+      reg = <0x79b0000 0x1000>;
+
+      clocks = <&gcc GCC_QPIC_CLK>,
+               <&gcc GCC_QPIC_AHB_CLK>;
+      clock-names = "core", "aon";
+
+      dmas = <&qpicbam 0>,
+             <&qpicbam 1>,
+             <&qpicbam 2>;
+      dma-names = "tx", "rx", "cmd";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-ecc-strength = <4>;
+        nand-bus-width = <8>;
+
+        partitions {
+          compatible = "fixed-partitions";
+          #address-cells = <1>;
+          #size-cells = <1>;
+
+          partition@0 {
+            label = "boot-nand";
+            reg = <0 0x58a0000>;
+          };
+
+          partition@58a0000 {
+            label = "fs-nand";
+            reg = <0x58a0000 0x4000000>;
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
deleted file mode 100644
index 5647913d8837..000000000000
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ /dev/null
@@ -1,142 +0,0 @@
-* Qualcomm NAND controller
-
-Required properties:
-- compatible:		must be one of the following:
-    * "qcom,ipq806x-nand" - for EBI2 NAND controller being used in IPQ806x
-			    SoC and it uses ADM DMA
-    * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
-                            IPQ4019 SoC and it uses BAM DMA
-    * "qcom,ipq6018-nand" - for QPIC NAND controller v1.5.0 being used in
-                            IPQ6018 SoC and it uses BAM DMA
-    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
-                            IPQ8074 SoC and it uses BAM DMA
-    * "qcom,sdx55-nand"   - for QPIC NAND controller v2.0.0 being used in
-                            SDX55 SoC and it uses BAM DMA
-
-- reg:			MMIO address range
-- clocks:		must contain core clock and always on clock
-- clock-names:		must contain "core" for the core clock and "aon" for the
-			always on clock
-
-EBI2 specific properties:
-- dmas:			DMA specifier, consisting of a phandle to the ADM DMA
-			controller node and the channel number to be used for
-			NAND. Refer to dma.txt and qcom_adm.txt for more details
-- dma-names:		must be "rxtx"
-- qcom,cmd-crci:	must contain the ADM command type CRCI block instance
-			number specified for the NAND controller on the given
-			platform
-- qcom,data-crci:	must contain the ADM data type CRCI block instance
-			number specified for the NAND controller on the given
-			platform
-
-QPIC specific properties:
-- dmas:			DMA specifier, consisting of a phandle to the BAM DMA
-			and the channel number to be used for NAND. Refer to
-			dma.txt, qcom_bam_dma.txt for more details
-- dma-names:		must contain all 3 channel names : "tx", "rx", "cmd"
-- #address-cells:	<1> - subnodes give the chip-select number
-- #size-cells:		<0>
-
-* NAND chip-select
-
-Each controller may contain one or more subnodes to represent enabled
-chip-selects which (may) contain NAND flash chips. Their properties are as
-follows.
-
-Required properties:
-- reg:			a single integer representing the chip-select
-			number (e.g., 0, 1, 2, etc.)
-- #address-cells:	see partition.txt
-- #size-cells:		see partition.txt
-
-Optional properties:
-- nand-bus-width:	see nand-controller.yaml
-- nand-ecc-strength:	see nand-controller.yaml. If not specified, then ECC strength will
-			be used according to chip requirement and available
-			OOB size.
-
-Each nandcs device node may optionally contain a 'partitions' sub-node, which
-further contains sub-nodes describing the flash partition mapping. See
-partition.txt for more detail.
-
-Example:
-
-nand-controller@1ac00000 {
-	compatible = "qcom,ipq806x-nand";
-	reg = <0x1ac00000 0x800>;
-
-	clocks = <&gcc EBI2_CLK>,
-		 <&gcc EBI2_AON_CLK>;
-	clock-names = "core", "aon";
-
-	dmas = <&adm_dma 3>;
-	dma-names = "rxtx";
-	qcom,cmd-crci = <15>;
-	qcom,data-crci = <3>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-
-		nand-ecc-strength = <4>;
-		nand-bus-width = <8>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "boot-nand";
-				reg = <0 0x58a0000>;
-			};
-
-			partition@58a0000 {
-				label = "fs-nand";
-				reg = <0x58a0000 0x4000000>;
-			};
-		};
-	};
-};
-
-nand-controller@79b0000 {
-	compatible = "qcom,ipq4019-nand";
-	reg = <0x79b0000 0x1000>;
-
-	clocks = <&gcc GCC_QPIC_CLK>,
-		<&gcc GCC_QPIC_AHB_CLK>;
-	clock-names = "core", "aon";
-
-	dmas = <&qpicbam 0>,
-		<&qpicbam 1>,
-		<&qpicbam 2>;
-	dma-names = "tx", "rx", "cmd";
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		nand-ecc-strength = <4>;
-		nand-bus-width = <8>;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "boot-nand";
-				reg = <0 0x58a0000>;
-			};
-
-			partition@58a0000 {
-				label = "fs-nand";
-				reg = <0x58a0000 0x4000000>;
-			};
-		};
-	};
-};
-- 
2.25.1

