Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9859A420571
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 06:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhJDEpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 00:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbhJDEpY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 00:45:24 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69124C061786
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Oct 2021 21:43:36 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id t4so2295430plo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Oct 2021 21:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HWAMUj4dzgURJ5vWqiq2PCQyUrgEU4zywjKpxJ3KIW4=;
        b=fRJehPvZC/iQE5Dwn11fQfHHskmrJ2mY++dheYxe0ZWsV77I6v3+kKNCaxV1lTFG/x
         B7ovXSruSmskJ+nmOzJkBbBcI2t8XmQFXLUQ2VJ0qXDKUXYzgPN3VsBAtCRI2ECYZXaD
         ssoQRJPJQlFLjQMsaLQXFZk5Hd3rNomo6zmIR4tVjUsB3J0YWlOLtg6KXqGR7wAOhdMU
         KR0qpE/T1pW2++KUNTOQuZML5Ep8QhPtYTelns37zL2Zouuu7bT449dAfw82DN2NYnnL
         ylJqafBoJsJ60/MIOGugQGRyNU47m2UU7yHt5di+k9vnQgtOv0wBYT6KrnMmE2BeWMjn
         4arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HWAMUj4dzgURJ5vWqiq2PCQyUrgEU4zywjKpxJ3KIW4=;
        b=Ojc1VzmgbDX6yo0T7/f41xzGR6aw5WkFOd4BX5w9O7chuimsBnn+MAdDYslqKWTG0q
         ze+/0x4G1oQqDOw3xRXMHGNS69evP0i1E1IQFk0i2QOA82MpWO14mHOE+8myXXycXkEV
         Yzgx8kFSBaRx6sd/yO0c2GeyJZlfvobIobFvG72ktEw4qDClps58z9miZqZA4Gn5cdSA
         FMT6x1cANiR6XdwV/oB52HeMD0GCjbRBnLMmQuoppPqpX7v7KNp2nz823P1auNQ+s19Y
         x+bhuOHB4IgCjE3OivQiHQL0xy2vETR5MZgqMCQ28DteUZDSQmeH8kehNjXzfYnFOtHF
         Td6w==
X-Gm-Message-State: AOAM533NlT2YDtRx/yQdBaZQc/0aW17AflLJdtb/i1Fd4oFgHsJIGX1H
        WDspJYWmNA0KD0AgQKIEKfXd
X-Google-Smtp-Source: ABdhPJzb8mSw6qm9ga/lbPhac7OUpluPNkMe2S8mb4QmaYcRH1LnbwyJjI5wUsVme0NBzaDlhcxd3w==
X-Received: by 2002:a17:90b:4016:: with SMTP id ie22mr14659484pjb.29.1633322615137;
        Sun, 03 Oct 2021 21:43:35 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.170])
        by smtp.gmail.com with ESMTPSA id m73sm393325pfd.152.2021.10.03.21.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 21:43:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to YAML bindings
Date:   Mon,  4 Oct 2021 10:13:17 +0530
Message-Id: <20211004044317.34809-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm cpufreq devicetree binding to YAML.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

I've taken this patch (again) from the cpufreq series by AngeloGioacchino.
Addressed the comment by Rob and Bjorn on making the "reg-names" property
optional as in the txt version.

 .../bindings/cpufreq/cpufreq-qcom-hw.txt      | 172 ---------------
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     | 203 ++++++++++++++++++
 2 files changed, 203 insertions(+), 172 deletions(-)
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
index 000000000000..a281914a8bf5
--- /dev/null
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -0,0 +1,203 @@
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
2.25.1

