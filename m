Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254842F02B8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 19:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAISGk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 13:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbhAISGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 13:06:39 -0500
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [IPv6:2001:4b7a:2000:18::170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B545FC0617BC
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 10:04:14 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id EE7001F60B;
        Sat,  9 Jan 2021 19:04:12 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rjw@rjwysocki.net, viresh.kumar@linaro.org, nks@flawful.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, manivannan.sadhasivam@linaro.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 13/15] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML bindings
Date:   Sat,  9 Jan 2021 19:03:57 +0100
Message-Id: <20210109180359.236098-14-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109180359.236098-1-angelogioacchino.delregno@somainline.org>
References: <20210109180359.236098-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Convert Qualcomm cpufreq devicetree binding to YAML.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../bindings/cpufreq/cpufreq-qcom-hw.txt      | 172 ---------------
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 204 ++++++++++++++++++
 2 files changed, 204 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
 create mode 100644 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
deleted file mode 100644
index 9299028ee712..000000000000
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt
+++ /dev/null
@@ -1,172 +0,0 @@
-Qualcomm Technologies, Inc. CPUFREQ Bindings
-
-CPUFREQ HW is a hardware engine used by some Qualcomm Technologies, Inc. (QTI)
-SoCs to manage frequency in hardware. It is capable of controlling frequency
-for multiple clusters.
-
-Properties:
-- compatible
-	Usage:		required
-	Value type:	<string>
-	Definition:	must be "qcom,cpufreq-hw" or "qcom,cpufreq-epss".
-
-- clocks
-	Usage:		required
-	Value type:	<phandle> From common clock binding.
-	Definition:	clock handle for XO clock and GPLL0 clock.
-
-- clock-names
-	Usage:		required
-	Value type:	<string> From common clock binding.
-	Definition:	must be "xo", "alternate".
-
-- reg
-	Usage:		required
-	Value type:	<prop-encoded-array>
-	Definition:	Addresses and sizes for the memory of the HW bases in
-			each frequency domain.
-- reg-names
-	Usage:		Optional
-	Value type:	<string>
-	Definition:	Frequency domain name i.e.
-			"freq-domain0", "freq-domain1".
-
-- #freq-domain-cells:
-	Usage:		required.
-	Definition:	Number of cells in a freqency domain specifier.
-
-* Property qcom,freq-domain
-Devices supporting freq-domain must set their "qcom,freq-domain" property with
-phandle to a cpufreq_hw followed by the Domain ID(0/1) in the CPU DT node.
-
-
-Example:
-
-Example 1: Dual-cluster, Quad-core per cluster. CPUs within a cluster switch
-DCVS state together.
-
-/ {
-	cpus {
-		#address-cells = <2>;
-		#size-cells = <0>;
-
-		CPU0: cpu@0 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x0>;
-			enable-method = "psci";
-			next-level-cache = <&L2_0>;
-			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_0: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-				L3_0: l3-cache {
-				      compatible = "cache";
-				};
-			};
-		};
-
-		CPU1: cpu@100 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x100>;
-			enable-method = "psci";
-			next-level-cache = <&L2_100>;
-			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_100: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU2: cpu@200 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x200>;
-			enable-method = "psci";
-			next-level-cache = <&L2_200>;
-			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_200: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU3: cpu@300 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x300>;
-			enable-method = "psci";
-			next-level-cache = <&L2_300>;
-			qcom,freq-domain = <&cpufreq_hw 0>;
-			L2_300: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU4: cpu@400 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x400>;
-			enable-method = "psci";
-			next-level-cache = <&L2_400>;
-			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_400: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU5: cpu@500 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x500>;
-			enable-method = "psci";
-			next-level-cache = <&L2_500>;
-			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_500: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU6: cpu@600 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x600>;
-			enable-method = "psci";
-			next-level-cache = <&L2_600>;
-			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_600: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-
-		CPU7: cpu@700 {
-			device_type = "cpu";
-			compatible = "qcom,kryo385";
-			reg = <0x0 0x700>;
-			enable-method = "psci";
-			next-level-cache = <&L2_700>;
-			qcom,freq-domain = <&cpufreq_hw 1>;
-			L2_700: l2-cache {
-				compatible = "cache";
-				next-level-cache = <&L3_0>;
-			};
-		};
-	};
-
- soc {
-	cpufreq_hw: cpufreq@17d43000 {
-		compatible = "qcom,cpufreq-hw";
-		reg = <0x17d43000 0x1400>, <0x17d45800 0x1400>;
-		reg-names = "freq-domain0", "freq-domain1";
-
-		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
-		clock-names = "xo", "alternate";
-
-		#freq-domain-cells = <1>;
-	};
-}
diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
new file mode 100644
index 000000000000..bc81b6203e27
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -0,0 +1,204 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. CPUFREQ
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+
+  CPUFREQ HW is a hardware engine used by some Qualcomm Technologies, Inc. (QTI)
+  SoCs to manage frequency in hardware. It is capable of controlling frequency
+  for multiple clusters.
+
+properties:
+  compatible:
+    oneOf:
+      - description: v1 of CPUFREQ HW
+        items:
+          - const: qcom,cpufreq-hw
+
+      - description: v2 of CPUFREQ HW (EPSS)
+        items:
+          - enum:
+              - qcom,sm8250-cpufreq-epss
+          - const: qcom,cpufreq-epss
+
+  reg:
+    minItems: 2
+    maxItems: 3
+    items:
+      - description: Frequency domain 0 register region
+      - description: Frequency domain 1 register region
+      - description: Frequency domain 2 register region
+
+  reg-names:
+    minItems: 2
+    maxItems: 3
+    items:
+      - const: freq-domain0
+      - const: freq-domain1
+      - const: freq-domain2
+
+  clocks:
+    items:
+      - description: XO Clock
+      - description: GPLL0 Clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: alternate
+
+  '#freq-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - '#freq-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    // Example 1: Dual-cluster, Quad-core per cluster. CPUs within a cluster
+    // switch DCVS state together.
+    cpus {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      CPU0: cpu@0 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x0>;
+        enable-method = "psci";
+        next-level-cache = <&L2_0>;
+        qcom,freq-domain = <&cpufreq_hw 0>;
+        L2_0: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+          L3_0: l3-cache {
+            compatible = "cache";
+          };
+        };
+      };
+
+      CPU1: cpu@100 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x100>;
+        enable-method = "psci";
+        next-level-cache = <&L2_100>;
+        qcom,freq-domain = <&cpufreq_hw 0>;
+        L2_100: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU2: cpu@200 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x200>;
+        enable-method = "psci";
+        next-level-cache = <&L2_200>;
+        qcom,freq-domain = <&cpufreq_hw 0>;
+        L2_200: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU3: cpu@300 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x300>;
+        enable-method = "psci";
+        next-level-cache = <&L2_300>;
+        qcom,freq-domain = <&cpufreq_hw 0>;
+        L2_300: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU4: cpu@400 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x400>;
+        enable-method = "psci";
+        next-level-cache = <&L2_400>;
+        qcom,freq-domain = <&cpufreq_hw 1>;
+        L2_400: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU5: cpu@500 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x500>;
+        enable-method = "psci";
+        next-level-cache = <&L2_500>;
+        qcom,freq-domain = <&cpufreq_hw 1>;
+        L2_500: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU6: cpu@600 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x600>;
+        enable-method = "psci";
+        next-level-cache = <&L2_600>;
+        qcom,freq-domain = <&cpufreq_hw 1>;
+        L2_600: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+
+      CPU7: cpu@700 {
+        device_type = "cpu";
+        compatible = "qcom,kryo385";
+        reg = <0x0 0x700>;
+        enable-method = "psci";
+        next-level-cache = <&L2_700>;
+        qcom,freq-domain = <&cpufreq_hw 1>;
+        L2_700: l2-cache {
+          compatible = "cache";
+          next-level-cache = <&L3_0>;
+        };
+      };
+    };
+
+    soc {
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      cpufreq@17d43000 {
+        compatible = "qcom,cpufreq-hw";
+        reg = <0x17d43000 0x1400>, <0x17d45800 0x1400>;
+        reg-names = "freq-domain0", "freq-domain1";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+        clock-names = "xo", "alternate";
+
+        #freq-domain-cells = <1>;
+      };
+    };
+...
-- 
2.29.2

