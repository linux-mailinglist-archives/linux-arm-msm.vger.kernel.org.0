Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51D7D430BA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 21:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbhJQTHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 15:07:00 -0400
Received: from ixit.cz ([94.230.151.217]:45760 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231517AbhJQTG7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 15:06:59 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 919B624E6A;
        Sun, 17 Oct 2021 16:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634481920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=lDR3tL8zinqjwKC77wErQTWWwi4c/sNOcyUoRUMKOlo=;
        b=eLLhtJd1RxKZ24oYsejJ0IbQIOQEBU6fyeW+ojTrQqBOQ0THKZ/+UwtOMu5oEU6pjGoJ1m
        xkaOw+fqZIkhSGC2BDyNU+rrJxS5qmvKJJWRUrU3N+w4DFw3jjfEZi0W+hezzAi0ffdPoz
        wcaVKihXgHl6ltZ5VAbUeTYStNVv9Yc=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht,
        ~postmarketos/upstreaming@lists.sr.ht,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH v6] dt-bindings: drm/msm/gpu: convert to YAML
Date:   Sun, 17 Oct 2021 16:43:50 +0200
Message-Id: <20211017144350.70295-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Conversion of text binding for Adreno GPU to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2:
  - added compatbile description from Rob Clark
  - dropped reg description
  - reg numbers increased to 3 (since we also have uncommon cx_dbgc)
  - specified interconnect-names items range
  - defined zap-shader as an object and added it's properties
  - enforce 0 clocks for Andreno >= 6xx since it's defined in GMU node

v3:
 - fix patterns (add backslash before dot)
 - add additional clocks
 - adreno@ -> gpu@
 - add few const and change enum to anyOf
 - added clock & clock-names placeholder in non-conditional part
 (description)

v4:
 - clock & clock-names - true,false instead maxItems
 - impl. #stream-id-cells, nvmem-cell-names, nvmem-cells
 - dropped requirement on firmware-name in zap_shader

v5:
 - maxOtems -> maxItems typo fix

v6:
 - enum -> const to fix ordering
 - opp-table is object
 - spacing
 - drop undocumented and unused #stream-id-cells

 .../devicetree/bindings/display/msm/gpu.txt   | 157 ----------
 .../devicetree/bindings/display/msm/gpu.yaml  | 288 ++++++++++++++++++
 2 files changed, 288 insertions(+), 157 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
deleted file mode 100644
index 090dcb3fc34d..000000000000
--- a/Documentation/devicetree/bindings/display/msm/gpu.txt
+++ /dev/null
@@ -1,157 +0,0 @@
-Qualcomm adreno/snapdragon GPU
-
-Required properties:
-- compatible: "qcom,adreno-XYZ.W", "qcom,adreno" or
-	      "amd,imageon-XYZ.W", "amd,imageon"
-    for example: "qcom,adreno-306.0", "qcom,adreno"
-  Note that you need to list the less specific "qcom,adreno" (since this
-  is what the device is matched on), in addition to the more specific
-  with the chip-id.
-  If "amd,imageon" is used, there should be no top level msm device.
-- reg: Physical base address and length of the controller's registers.
-- interrupts: The interrupt signal from the gpu.
-- clocks: device clocks (if applicable)
-  See ../clocks/clock-bindings.txt for details.
-- clock-names: the following clocks are required by a3xx, a4xx and a5xx
-  cores:
-  * "core"
-  * "iface"
-  * "mem_iface"
-  For GMU attached devices the GPU clocks are not used and are not required. The
-  following devices should not list clocks:
-   - qcom,adreno-630.2
-- iommus: optional phandle to an adreno iommu instance
-- operating-points-v2: optional phandle to the OPP operating points
-- interconnects: optional phandle to an interconnect provider.  See
-  ../interconnect/interconnect.txt for details. Some A3xx and all A4xx platforms
-  will have two paths; all others will have one path.
-- interconnect-names: The names of the interconnect paths that correspond to the
-  interconnects property. Values must be gfx-mem and ocmem.
-- qcom,gmu: For GMU attached devices a phandle to the GMU device that will
-  control the power for the GPU. Applicable targets:
-    - qcom,adreno-630.2
-- zap-shader: For a5xx and a6xx devices this node contains a memory-region that
-  points to reserved memory to store the zap shader that can be used to help
-  bring the GPU out of secure mode.
-- firmware-name: optional property of the 'zap-shader' node, listing the
-  relative path of the device specific zap firmware.
-- sram: phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
-        a4xx Snapdragon SoCs. See
-        Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
-
-Optional properties:
-- #cooling-cells: The value must be 2. For details, please refer
-	Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml.
-
-Example 3xx/4xx:
-
-/ {
-	...
-
-	gpu: adreno@fdb00000 {
-		compatible = "qcom,adreno-330.2",
-		             "qcom,adreno";
-		reg = <0xfdb00000 0x10000>;
-		reg-names = "kgsl_3d0_reg_memory";
-		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "kgsl_3d0_irq";
-		clock-names = "core",
-		              "iface",
-		              "mem_iface";
-		clocks = <&mmcc OXILI_GFX3D_CLK>,
-		         <&mmcc OXILICX_AHB_CLK>,
-		         <&mmcc OXILICX_AXI_CLK>;
-		sram = <&gpu_sram>;
-		power-domains = <&mmcc OXILICX_GDSC>;
-		operating-points-v2 = <&gpu_opp_table>;
-		iommus = <&gpu_iommu 0>;
-		#cooling-cells = <2>;
-	};
-
-	gpu_sram: ocmem@fdd00000 {
-		compatible = "qcom,msm8974-ocmem";
-
-		reg = <0xfdd00000 0x2000>,
-		      <0xfec00000 0x180000>;
-		reg-names = "ctrl",
-		            "mem";
-
-		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
-		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
-		clock-names = "core",
-		              "iface";
-
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		gpu_sram: gpu-sram@0 {
-			reg = <0x0 0x100000>;
-			ranges = <0 0 0xfec00000 0x100000>;
-		};
-	};
-};
-
-Example a6xx (with GMU):
-
-/ {
-	...
-
-	gpu@5000000 {
-		compatible = "qcom,adreno-630.2", "qcom,adreno";
-		#stream-id-cells = <16>;
-
-		reg = <0x5000000 0x40000>, <0x509e000 0x10>;
-		reg-names = "kgsl_3d0_reg_memory", "cx_mem";
-
-		#cooling-cells = <2>;
-
-		/*
-		 * Look ma, no clocks! The GPU clocks and power are
-		 * controlled entirely by the GMU
-		 */
-
-		interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-
-		iommus = <&adreno_smmu 0>;
-
-		operating-points-v2 = <&gpu_opp_table>;
-
-		interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
-		interconnect-names = "gfx-mem";
-
-		gpu_opp_table: opp-table {
-			compatible = "operating-points-v2";
-
-			opp-430000000 {
-				opp-hz = /bits/ 64 <430000000>;
-				opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-				opp-peak-kBps = <5412000>;
-			};
-
-			opp-355000000 {
-				opp-hz = /bits/ 64 <355000000>;
-				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-				opp-peak-kBps = <3072000>;
-			};
-
-			opp-267000000 {
-				opp-hz = /bits/ 64 <267000000>;
-				opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-				opp-peak-kBps = <3072000>;
-			};
-
-			opp-180000000 {
-				opp-hz = /bits/ 64 <180000000>;
-				opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-				opp-peak-kBps = <1804000>;
-			};
-		};
-
-		qcom,gmu = <&gmu>;
-
-		zap-shader {
-			memory-region = <&zap_shader_region>;
-			firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn"
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
new file mode 100644
index 000000000000..99a1ba3ada56
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -0,0 +1,288 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/display/msm/gpu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Devicetree bindings for the Adreno or Snapdragon GPUs
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - description: |
+          The driver is parsing the compat string for Adreno to
+          figure out the gpu-id and patch level.
+        items:
+          - pattern: '^qcom,adreno-[3-6][0-9][0-9]\.[0-9]$'
+          - const: qcom,adreno
+      - description: |
+          The driver is parsing the compat string for Imageon to
+          figure out the gpu-id and patch level.
+        items:
+          - pattern: '^amd,imageon-200\.[0-1]$'
+          - const: amd,imageon
+
+  clocks: true
+
+  clock-names: true
+
+  reg:
+    minItems: 1
+    maxItems: 3
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    maxItems: 1
+
+  interconnects:
+    minItems: 1
+    maxItems: 2
+
+  interconnect-names:
+    minItems: 1
+    items:
+      - const: gfx-mem
+      - const: ocmem
+
+  iommus:
+    maxItems: 1
+
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
+    description: |
+      phandles to one or more reserved on-chip SRAM regions.
+      phandle to the On Chip Memory (OCMEM) that's present on some a3xx and
+      a4xx Snapdragon SoCs. See
+      Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 1
+
+  zap-shader:
+    type: object
+    description: |
+      For a5xx and a6xx devices this node contains a memory-region that
+      points to reserved memory to store the zap shader that can be used to
+      help bring the GPU out of secure mode.
+    properties:
+      memory-region:
+        $ref: /schemas/types.yaml#/definitions/phandle
+
+      firmware-name:
+        description: |
+          Default name of the firmware to load to the remote processor.
+
+  "#cooling-cells":
+    const: 2
+
+  nvmem-cell-names:
+    maxItems: 1
+
+  nvmem-cells:
+    description: efuse registers
+    maxItems: 1
+
+  qcom,gmu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      For GMU attached devices a phandle to the GMU device that will
+      control the power for the GPU.
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-[3-5][0-9][0-9]\.[0-9]$'
+
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 7
+
+        clock-names:
+          items:
+            anyOf:
+              - const: core
+                description: GPU Core clock
+              - const: iface
+                description: GPU Interface clock
+              - const: mem
+                description: GPU Memory clock
+              - const: mem_iface
+                description: GPU Memory Interface clock
+              - const: alt_mem_iface
+                description: GPU Alternative Memory Interface clock
+              - const: gfx3d
+                description: GPU 3D engine clock
+              - const: rbbmtimer
+                description: GPU RBBM Timer for Adreno 5xx series
+          minItems: 2
+          maxItems: 7
+
+      required:
+        - clocks
+        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            pattern: '^qcom,adreno-6[0-9][0-9]\.[0-9]$'
+
+    then: # Since Adreno 6xx series clocks should be defined in GMU
+      properties:
+        clocks: false
+        clock-names: false
+
+examples:
+  - |
+
+    // Example a3xx/4xx:
+
+    #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu: gpu@fdb00000 {
+        compatible = "qcom,adreno-330.2", "qcom,adreno";
+
+        reg = <0xfdb00000 0x10000>;
+        reg-names = "kgsl_3d0_reg_memory";
+
+        clock-names = "core", "iface", "mem_iface";
+        clocks = <&mmcc OXILI_GFX3D_CLK>,
+                 <&mmcc OXILICX_AHB_CLK>,
+                 <&mmcc OXILICX_AXI_CLK>;
+
+        interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "kgsl_3d0_irq";
+
+        sram = <&gpu_sram>;
+        power-domains = <&mmcc OXILICX_GDSC>;
+        operating-points-v2 = <&gpu_opp_table>;
+        iommus = <&gpu_iommu 0>;
+        #cooling-cells = <2>;
+    };
+
+    ocmem@fdd00000 {
+        compatible = "qcom,msm8974-ocmem";
+
+        reg = <0xfdd00000 0x2000>,
+              <0xfec00000 0x180000>;
+        reg-names = "ctrl", "mem";
+
+        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
+                 <&mmcc OCMEMCX_OCMEMNOC_CLK>;
+        clock-names = "core", "iface";
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0xfec00000 0x100000>;
+
+        gpu_sram: gpu-sram@0 {
+            reg = <0x0 0x100000>;
+        };
+    };
+  - |
+
+    // Example a6xx (with GMU):
+
+    #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,sdm845.h>
+
+    reserved-memory {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        zap_shader_region: gpu@8f200000 {
+            compatible = "shared-dma-pool";
+            reg = <0x0 0x90b00000 0x0 0xa00000>;
+            no-map;
+        };
+    };
+
+    gpu@5000000 {
+        compatible = "qcom,adreno-630.2", "qcom,adreno";
+
+        reg = <0x5000000 0x40000>, <0x509e000 0x10>;
+        reg-names = "kgsl_3d0_reg_memory", "cx_mem";
+
+        #cooling-cells = <2>;
+
+        interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&adreno_smmu 0>;
+
+        operating-points-v2 = <&gpu_opp_table>;
+
+        interconnects = <&rsc_hlos MASTER_GFX3D &rsc_hlos SLAVE_EBI1>;
+        interconnect-names = "gfx-mem";
+
+        qcom,gmu = <&gmu>;
+
+        gpu_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-430000000 {
+                opp-hz = /bits/ 64 <430000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+                opp-peak-kBps = <5412000>;
+            };
+
+            opp-355000000 {
+                opp-hz = /bits/ 64 <355000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+                opp-peak-kBps = <3072000>;
+            };
+
+            opp-267000000 {
+                opp-hz = /bits/ 64 <267000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+                opp-peak-kBps = <3072000>;
+            };
+
+            opp-180000000 {
+                opp-hz = /bits/ 64 <180000000>;
+                opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+                opp-peak-kBps = <1804000>;
+            };
+        };
+
+        zap-shader {
+            memory-region = <&zap_shader_region>;
+            firmware-name = "qcom/LENOVO/81JL/qcdxkmsuc850.mbn";
+        };
+    };
-- 
2.33.0

