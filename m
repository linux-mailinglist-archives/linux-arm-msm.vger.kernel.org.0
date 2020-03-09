Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA2017E35A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 16:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbgCIPSN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 11:18:13 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:11938 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgCIPSN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 11:18:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583767092; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cjfeR7a86Xm4RFTgAuAL+CrjMFUACm4dEBBr/wrjbTM=; b=X8rJfbTtm6MNOrkZf5CPGTj8auR/Yrkb2S0xhoykKqax8wdhU9xlH8EOOPp2Sap3bHjYFEWQ
 0XDMt9xIPmGzblFi7tQ+WcqGY6cXAMmGnBEmpgZ1Ye+sC1Xa8tu1Lb7jZL2kms+HvyATAlne
 VrVZ3/9CRrwOFiAriR+dY41Skc0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e665e22.7fb578bdd8b8-smtp-out-n02;
 Mon, 09 Mar 2020 15:17:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B00E6C4478C; Mon,  9 Mar 2020 15:17:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5B2CC432C2;
        Mon,  9 Mar 2020 15:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5B2CC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     smasetty@codeaurora.org, John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 1/2] dt-bindings: display: msm: Convert GMU bindings to YAML
Date:   Mon,  9 Mar 2020 09:17:45 -0600
Message-Id: <1583767066-1555-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
References: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
text bindings. 

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 .../devicetree/bindings/display/msm/gmu.txt        |  65 -----------
 .../devicetree/bindings/display/msm/gmu.yaml       | 123 +++++++++++++++++++++
 2 files changed, 123 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
deleted file mode 100644
index 90af5b0..0000000
--- a/Documentation/devicetree/bindings/display/msm/gmu.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Qualcomm adreno/snapdragon GMU (Graphics management unit)
-
-The GMU is a programmable power controller for the GPU. the CPU controls the
-GMU which in turn handles power controls for the GPU.
-
-Required properties:
-- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
-    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
-  Note that you need to list the less specific "qcom,adreno-gmu"
-  for generic matches and the more specific identifier to identify
-  the specific device.
-- reg: Physical base address and length of the GMU registers.
-- reg-names: Matching names for the register regions
-  * "gmu"
-  * "gmu_pdc"
-  * "gmu_pdc_seg"
-- interrupts: The interrupt signals from the GMU.
-- interrupt-names: Matching names for the interrupts
-  * "hfi"
-  * "gmu"
-- clocks: phandles to the device clocks
-- clock-names: Matching names for the clocks
-   * "gmu"
-   * "cxo"
-   * "axi"
-   * "mnoc"
-- power-domains: should be:
-	<&clock_gpucc GPU_CX_GDSC>
-	<&clock_gpucc GPU_GX_GDSC>
-- power-domain-names: Matching names for the power domains
-- iommus: phandle to the adreno iommu
-- operating-points-v2: phandle to the OPP operating points
-
-Example:
-
-/ {
-	...
-
-	gmu: gmu@506a000 {
-		compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
-
-		reg = <0x506a000 0x30000>,
-			<0xb280000 0x10000>,
-			<0xb480000 0x10000>;
-		reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
-
-		interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "hfi", "gmu";
-
-		clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
-			<&gpucc GPU_CC_CXO_CLK>,
-			<&gcc GCC_DDRSS_GPU_AXI_CLK>,
-			<&gcc GCC_GPU_MEMNOC_GFX_CLK>;
-		clock-names = "gmu", "cxo", "axi", "memnoc";
-
-		power-domains = <&gpucc GPU_CX_GDSC>,
-				<&gpucc GPU_GX_GDSC>;
-		power-domain-names = "cx", "gx";
-
-		iommus = <&adreno_smmu 5>;
-
-		operating-points-v2 = <&gmu_opp_table>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
new file mode 100644
index 0000000..0b8736a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2019-2020, The Linux Foundation, All Rights Reserved
+%YAML 1.2
+---
+
+$id: "http://devicetree.org/schemas/display/msm/gmu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Devicetree bindings for the GMU attached to certain Adreno GPUs
+
+maintainers:
+  - Rob Clark <robdclark@gmail.com>
+
+description: |
+  These bindings describe the Graphics Management Unit (GMU) that is attached
+  to members of the Adreno A6xx GPU family. The GMU provides on-device power
+  management and support to improve power efficiency and reduce the load on
+  the CPU.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,adreno-gmu-630.2
+      - const: qcom,adreno-gmu
+
+  reg:
+    items:
+      - description: Core GMU registers
+      - description: GMU PDC registers
+      - description: GMU PDC sequence registers
+
+  reg-names:
+    items:
+      - const: gmu
+      - const: gmu_pdc
+      - const: gmu_pdc_seq
+
+  clocks:
+    items:
+     - description: GMU clock
+     - description: GPU CX clock
+     - description: GPU AXI clock
+     - description: GPU MEMNOC clock
+
+  clock-names:
+    items:
+      - const: gmu
+      - const: cxo
+      - const: axi
+      - const: memnoc
+
+  interrupts:
+    items:
+     - description: GMU HFI interrupt
+     - description: GMU interrupt
+
+
+  interrupt-names:
+    items:
+      - const: hfi
+      - const: gmu
+
+  power-domains:
+     items:
+       - description: CX power domain
+       - description: GX power domain
+
+  power-domain-names:
+     items:
+       - const: cx
+       - const: gx
+
+  iommus:
+    maxItems: 1
+
+  operating-points-v2: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - iommus
+  - operating-points-v2
+
+examples:
+ - |
+   #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
+   #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+   gmu: gmu@506a000 {
+        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
+
+        reg = <0x506a000 0x30000>,
+              <0xb280000 0x10000>,
+              <0xb480000 0x10000>;
+        reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
+
+        clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+                 <&gpucc GPU_CC_CXO_CLK>,
+                 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
+        clock-names = "gmu", "cxo", "axi", "memnoc";
+
+        interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "hfi", "gmu";
+
+        power-domains = <&gpucc GPU_CX_GDSC>,
+                        <&gpucc GPU_GX_GDSC>;
+        power-domain-names = "cx", "gx";
+
+        iommus = <&adreno_smmu 5>;
+        operating-points-v2 = <&gmu_opp_table>;
+   };
-- 
2.7.4
