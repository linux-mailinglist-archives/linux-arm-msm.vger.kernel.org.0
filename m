Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937DD571A4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 14:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbiGLMqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 08:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233077AbiGLMqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 08:46:07 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDF2A6F1A;
        Tue, 12 Jul 2022 05:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=SBHY2YRnc3DwPOFm0IbOP7TfNQwfYgJKf7D1yLiGzHg=; b=BWqHtQodIylsbUahLiM8bvlygl
        DRqMrokgQt46WOW+rRl7lB/pR14F7XH1euzwY/vO3+7iuY4HW9tKxLRPfz9KwhIvUv/LUINiOLWLW
        V/f5nGPfyxm5D/9VqRAeY/5IOkYieqZMVd5+VdDw0rUQqqySjFOzjhZIwM2sLklHLbvNtRR0Mw6PD
        +LMsQ8mmPmm3sIKyTDRyxeNyvAHZRaw9N4oslUVdzz4WriA4Z2jL+WQHJTUAaLxTDGJRg4gOu4apk
        C74wRqe7Ll/pnbryQs40/6Bbl7e2rG7w4zo77rhCkCAx/9yMjylLXUCjnA2p3eY7ZVp7Y5uEukO7t
        S90XXy8w==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oBFH0-0087Gb-Bo; Tue, 12 Jul 2022 14:45:54 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Subject: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
Date:   Tue, 12 Jul 2022 14:44:17 +0200
Message-Id: <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom,q6v5.txt covers multiple SoCs with quite different binding
requirements. Converting this into one DT schema would require
several if statements, making the DT schema overall harder to
read and understand.

To avoid this, follow the example of SC7180/SC7280 and split
"qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
compatible) into a separate DT schema. The schema is somewhat based
on the one for SC7180/SC7280 but adjusted for the old platforms.

Compared to the old plain text bindings, add missing documentation for
the "bam-dmux" subnode and recommend one particular approach to specify
the MBA/MPSS "memory-region" (the other one is marked as deprecated).

Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
---
Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
of if statements). However, this series focuses on MSM8916/MSM8974 (or
actually MSM8909) only.

[1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
[2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/
---
 .../remoteproc/qcom,msm8916-mss-pil.yaml      | 246 ++++++++++++++++++
 .../bindings/remoteproc/qcom,q6v5.txt         |  19 --
 2 files changed, 246 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
new file mode 100644
index 000000000000..3968348dc982
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,msm8916-mss-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MSM8916 MSS Peripheral Image Loader (and similar)
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description:
+  This document describes the hardware for a component that loads and boots
+  firmware on the Qualcomm MSM8916 Modem Hexagon Core (and similar).
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,msm8916-mss-pil
+
+      - const: qcom,q6v5-pil
+        description: Deprecated, prefer using qcom,msm8916-mss-pil
+        deprecated: true
+
+  reg:
+    items:
+      - description: MSS QDSP6 registers
+      - description: RMB registers
+
+  reg-names:
+    items:
+      - const: qdsp6
+      - const: rmb
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    items:
+      - description: Configuration interface (AXI) clock
+      - description: Configuration bus (AHB) clock
+      - description: Boot ROM (AHB) clock
+      - description: XO proxy clock (control handed over after startup)
+
+  clock-names:
+    items:
+      - const: iface
+      - const: bus
+      - const: mem
+      - const: xo
+
+  power-domains:
+    items:
+      - description: CX proxy power domain (control handed over after startup)
+      - description: MX proxy power domain (control handed over after startup)
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mx
+
+  pll-supply:
+    description: PLL proxy supply (control handed over after startup)
+
+  resets:
+    items:
+      - description: MSS restart control
+
+  reset-names:
+    items:
+      - const: mss_restart
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop modem
+
+  qcom,smem-state-names:
+    description: Names of the states used by the AP to signal the Hexagon core
+    items:
+      - const: stop
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Halt registers are used to halt transactions of various sub-components
+      within MSS.
+    items:
+      - items:
+          - description: phandle to TCSR syscon region
+          - description: offset to the Q6 halt register
+          - description: offset to the modem halt register
+          - description: offset to the nc halt register
+
+  memory-region:
+    items:
+      - description: MBA reserved region
+      - description: MPSS reserved region
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    items:
+      - description: Name of MBA firmware
+      - description: Name of modem firmware
+
+  bam-dmux:
+    $ref: /schemas/net/qcom,bam-dmux.yaml#
+    description:
+      Qualcomm BAM Data Multiplexer (provides network interface to the modem)
+
+  smd-edge:
+    $ref: qcom,smd-edge.yaml#
+    description:
+      Qualcomm SMD subnode which represents communication edge, channels
+      and devices related to the DSP.
+
+    properties:
+      label:
+        enum:
+          - modem
+          - hexagon
+
+  # Deprecated properties
+  cx-supply:
+    description: CX power domain regulator supply (prefer using power-domains)
+    deprecated: true
+  mx-supply:
+    description: MX power domain regulator supply (prefer using power-domains)
+    deprecated: true
+  mba:
+    type: object
+    description:
+      MBA reserved region (prefer using memory-region with two items)
+    properties:
+      memory-region: true
+    required:
+      - memory-region
+    deprecated: true
+  mpss:
+    type: object
+    description:
+      MPSS reserved region (prefer using memory-region with two items)
+    properties:
+      memory-region: true
+    required:
+      - memory-region
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - pll-supply
+  - resets
+  - reset-names
+  - qcom,halt-regs
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - smd-edge
+
+# Fallbacks for deprecated properties
+allOf:
+  - oneOf:
+      - required:
+          - memory-region
+      - required:
+          - mba
+          - mpss
+        deprecated: true
+  - oneOf:
+      - required:
+          - power-domains
+          - power-domain-names
+      - required:
+          - cx-supply
+          - mx-supply
+        deprecated: true
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-msm8916.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc_mpss: remoteproc@4080000 {
+        compatible = "qcom,msm8916-mss-pil";
+        reg = <0x04080000 0x100>, <0x04020000 0x40>;
+        reg-names = "qdsp6", "rmb";
+
+        interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+                              <&hexagon_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&hexagon_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&hexagon_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&hexagon_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+        qcom,smem-states = <&hexagon_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+        qcom,halt-regs = <&tcsr 0x18000 0x19000 0x1a000>;
+
+        clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+                 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+                 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+                 <&xo_board>;
+        clock-names = "iface", "bus", "mem", "xo";
+
+        power-domains = <&rpmpd MSM8916_VDDCX>, <&rpmpd MSM8916_VDDMX>;
+        power-domain-names = "cx", "mx";
+        pll-supply = <&pm8916_l7>;
+
+        resets = <&scm 0>;
+        reset-names = "mss_restart";
+
+        memory-region = <&mba_mem>, <&mpss_mem>;
+
+        smd-edge {
+            interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
+
+            qcom,smd-edge = <0>;
+            qcom,ipc = <&apcs 8 12>;
+            qcom,remote-pid = <1>;
+
+            label = "hexagon";
+        };
+    };
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
index d0a75443e27e..3beb01da134b 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
@@ -7,10 +7,8 @@ on the Qualcomm Hexagon core.
 	Usage: required
 	Value type: <string>
 	Definition: must be one of:
-		    "qcom,q6v5-pil",
 		    "qcom,ipq8074-wcss-pil"
 		    "qcom,qcs404-wcss-pil"
-		    "qcom,msm8916-mss-pil",
 		    "qcom,msm8974-mss-pil"
 		    "qcom,msm8996-mss-pil"
 		    "qcom,msm8998-mss-pil"
@@ -37,10 +35,8 @@ on the Qualcomm Hexagon core.
 	Value type: <stringlist>
 	Definition: The interrupts needed depends on the the compatible
 		    string:
-	qcom,q6v5-pil:
 	qcom,ipq8074-wcss-pil:
 	qcom,qcs404-wcss-pil:
-	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,msm8996-mss-pil:
@@ -72,8 +68,6 @@ on the Qualcomm Hexagon core.
 		    "gcc_axim_cbcr", "lcc_ahbfabric_cbc", "tcsr_lcc_cbc",
 		    "lcc_abhs_cbc", "lcc_tcm_slave_cbc", "lcc_abhm_cbc",
 		    "lcc_axim_cbc", "lcc_bcr_sleep"
-	qcom,q6v5-pil:
-	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 		    must be "iface", "bus", "mem", "xo"
 	qcom,msm8996-mss-pil:
@@ -112,17 +106,6 @@ should be referenced as follows:
 	Definition: reference to the reserved-memory for the mba region followed
 		    by the mpss region
 
-For the compatible strings below the following supplies are required:
-  "qcom,q6v5-pil"
-  "qcom,msm8916-mss-pil",
-- cx-supply: (deprecated, use power domain instead)
-- mx-supply: (deprecated, use power domain instead)
-- pll-supply:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the regulators to be held on behalf of the
-		    booting of the Hexagon core
-
 For the compatible string below the following supplies are required:
   "qcom,msm8974-mss-pil"
 - cx-supply: (deprecated, use power domain instead)
@@ -161,8 +144,6 @@ For the compatible string below the following supplies are required:
 	Definition: The power-domains needed depend on the compatible string:
 	qcom,ipq8074-wcss-pil:
 		    no power-domain names required
-	qcom,q6v5-pil:
-	qcom,msm8916-mss-pil:
 	qcom,msm8974-mss-pil:
 	qcom,msm8996-mss-pil:
 	qcom,msm8998-mss-pil:
-- 
2.30.2

