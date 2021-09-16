Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1635040E4B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 19:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344847AbhIPRFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 13:05:17 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28078 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241507AbhIPQ5l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 12:57:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631811380; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mkXzPiW6xy0m7w4MvuPd7OR4qOimoEn9S2EVaLiBpQ8=; b=QSiduSYUCJhznA1c5EE/v+PkJY2CdCZK/r9lNx6SIyap9dH5q8NtpC4RTvozMXfKY4Id3D8J
 FKJrKYvl5IPYdPJr8HFE4Czi+zblSziMAzg0zkspPDnPYtFo8kSFnyv+W5caoSPsIYmEbfQn
 eslTMT4Kx/BKYNLFy12oE08jwYg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61437734ec62f57c9ac8cd87 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 16:56:20
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 81600C4163F; Thu, 16 Sep 2021 16:56:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pillair-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F0C9FC3599A;
        Thu, 16 Sep 2021 16:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F0C9FC3599A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, robh+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org,
        Rakesh Pillai <pillair@codeaurora.org>,
        Rakesh Pillai <pillair@qti.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
Date:   Thu, 16 Sep 2021 22:25:51 +0530
Message-Id: <1631811353-503-2-git-send-email-pillair@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert Qualcomm ADSP/CDSP Remoteproc devicetree
binding to YAML.

Signed-off-by: Rakesh Pillai <pillair@qti.qualcomm.com>
---
 .../bindings/remoteproc/qcom,hexagon-v56.txt       | 140 -----------
 .../bindings/remoteproc/qcom,hexagon-v56.yaml      | 267 +++++++++++++++++++++
 2 files changed, 267 insertions(+), 140 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
deleted file mode 100644
index 1337a3d..0000000
--- a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.txt
+++ /dev/null
@@ -1,140 +0,0 @@
-Qualcomm Technology Inc. Hexagon v56 Peripheral Image Loader
-
-This document defines the binding for a component that loads and boots firmware
-on the Qualcomm Technology Inc. Hexagon v56 core.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,qcs404-cdsp-pil",
-		    "qcom,sdm845-adsp-pil"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must specify the base address and size of the qdsp6ss register
-
-- interrupts-extended:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: must list the watchdog, fatal IRQs ready, handover and
-		    stop-ack IRQs
-
-- interrupt-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "wdog", "fatal", "ready", "handover", "stop-ack"
-
-- clocks:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition:  List of phandles and clock specifier pairs for the Hexagon,
-		     per clock-names below.
-
-- clock-names:
-	Usage: required for SDM845 ADSP
-	Value type: <stringlist>
-	Definition: List of clock input name strings sorted in the same
-		    order as the clocks property. Definition must have
-		    "xo", "sway_cbcr", "lpass_ahbs_aon_cbcr",
-		    "lpass_ahbm_aon_cbcr", "qdsp6ss_xo", "qdsp6ss_sleep"
-		    and "qdsp6ss_core".
-
-- clock-names:
-	Usage: required for QCS404 CDSP
-	Value type: <stringlist>
-	Definition: List of clock input name strings sorted in the same
-		    order as the clocks property. Definition must have
-		    "xo", "sway", "tbu", "bimc", "ahb_aon", "q6ss_slave",
-		    "q6ss_master", "q6_axim".
-
-- power-domains:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to cx power domain node.
-
-- resets:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the list of resets for the Hexagon.
-
-- reset-names:
-        Usage: required for SDM845 ADSP
-        Value type: <stringlist>
-        Definition: must be "pdc_sync" and "cc_lpass"
-
-- reset-names:
-        Usage: required for QCS404 CDSP
-        Value type: <stringlist>
-        Definition: must be "restart"
-
-- qcom,halt-regs:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: a phandle reference to a syscon representing TCSR followed
-		    by the offset within syscon for Hexagon halt register.
-
-- memory-region:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the reserved-memory for the firmware
-
-- qcom,smem-states:
-	Usage: required
-	Value type: <phandle>
-	Definition: reference to the smem state for requesting the Hexagon to
-		    shut down
-
-- qcom,smem-state-names:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "stop"
-
-
-= SUBNODES
-The adsp node may have an subnode named "glink-edge" that describes the
-communication edge, channels and devices related to the Hexagon.
-See ../soc/qcom/qcom,glink.txt for details on how to describe these.
-
-= EXAMPLE
-The following example describes the resources needed to boot control the
-ADSP, as it is found on SDM845 boards.
-
-	remoteproc@17300000 {
-		compatible = "qcom,sdm845-adsp-pil";
-		reg = <0x17300000 0x40c>;
-
-		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
-			<&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
-			<&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
-			<&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
-			<&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
-		interrupt-names = "wdog", "fatal", "ready",
-			"handover", "stop-ack";
-
-		clocks = <&rpmhcc RPMH_CXO_CLK>,
-			<&gcc GCC_LPASS_SWAY_CLK>,
-			<&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
-			<&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
-			<&lpasscc LPASS_QDSP6SS_XO_CLK>,
-			<&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
-			<&lpasscc LPASS_QDSP6SS_CORE_CLK>;
-		clock-names = "xo", "sway_cbcr",
-			"lpass_ahbs_aon_cbcr",
-			"lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
-			"qdsp6ss_sleep", "qdsp6ss_core";
-
-		power-domains = <&rpmhpd SDM845_CX>;
-
-		resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
-			 <&aoss_reset AOSS_CC_LPASS_RESTART>;
-		reset-names = "pdc_sync", "cc_lpass";
-
-		qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
-
-		memory-region = <&pil_adsp_mem>;
-
-		qcom,smem-states = <&adsp_smp2p_out 0>;
-		qcom,smem-state-names = "stop";
-	};
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
new file mode 100644
index 0000000..051da43
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-v56.yaml
@@ -0,0 +1,267 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,hexagon-v56.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hexagon v56 Peripheral Image Loader
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This document defines the binding for a component that loads and boots firmware
+  on the Qualcomm Technology Inc. Hexagon v56 core.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcs404-cdsp-pil
+      - qcom,sdm845-adsp-pil
+
+  reg:
+    maxItems: 1
+    description:
+      The base address and size of the qdsp6ss register
+
+  interrupts-extended:
+    minItems: 5
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    minItems: 5
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    minItems: 7
+    maxItems: 8
+    description:
+      List of phandles and clock specifier pairs for the Hexagon,
+      per clock-names below.
+
+  clock-names:
+    minItems: 7
+    maxItems: 8
+
+  power-domains:
+    minItems: 1
+    items:
+      - description: CX power domain
+
+  resets:
+    minItems: 1
+    maxItems: 2
+    description:
+      reference to the list of resets for the Hexagon.
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
+
+  memory-region:
+    maxItems: 1
+    description: Reference to the reserved-memory for the Hexagon core
+
+  qcom,halt-regs:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      Phandle reference to a syscon representing TCSR followed by the
+      three offsets within syscon for q6, modem and nc halt registers.
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the Hexagon core
+    items:
+      - description: Stop the modem
+
+  qcom,smem-state-names:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: The names of the state bits used for SMP2P output
+    items:
+      - const: stop
+
+  glink-edge:
+    type: object
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the ADSP.
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - qcom,halt-regs
+  - memory-region
+  - qcom,smem-states
+  - qcom,smem-state-names
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-adsp-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: SWAY clock
+            - description: LPASS AHBS AON clock
+            - description: LPASS AHBM AON clock
+            - description: QDSP6SS XO clock
+            - description: QDSP6SS SLEEP clock
+            - description: QDSP6SS CORE clock
+        clock-names:
+          items:
+            - const: xo
+            - const: sway_cbcr
+            - const: lpass_ahbs_aon_cbcr
+            - const: lpass_ahbm_aon_cbcr
+            - const: qdsp6ss_xo
+            - const: qdsp6ss_sleep
+            - const: qdsp6ss_core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-cdsp-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: XO clock
+            - description: SWAY clock
+            - description: TBU clock
+            - description: BIMC clock
+            - description: AHB AON clock
+            - description: Q6SS SLAVE clock
+            - description: Q6SS MASTER clock
+            - description: Q6 AXIM clock
+        clock-names:
+          items:
+            - const: xo
+            - const: sway
+            - const: tbu
+            - const: bimc
+            - const: ahb_aon
+            - const: q6ss_slave
+            - const: q6ss_master
+            - const: q6_axim
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-wpss-pil
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GCC WPSS AHB BDG Master clock
+            - description: GCC WPSS AHB clock
+            - description: GCC WPSS RSCP clock
+        clock-names:
+          items:
+            - const: gcc_wpss_ahb_bdg_mst_clk
+            - const: gcc_wpss_ahb_clk
+            - const: gcc_wpss_rscp_clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sdm845-adsp-pil
+    then:
+      properties:
+        resets:
+          items:
+            - description: PDC SYNC
+            - description: CC LPASS
+        reset-names:
+          items:
+            - const: pdc_sync
+            - const: cc_lpass
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs404-cdsp-pil
+    then:
+      properties:
+        resets:
+          items:
+            - description: CDSP restart
+        reset-names:
+          items:
+            - const: restart
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,lpass-sdm845.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/reset/qcom,sdm845-pdc.h>
+    #include <dt-bindings/reset/qcom,sdm845-aoss.h>
+    remoteproc@17300000 {
+        compatible = "qcom,sdm845-adsp-pil";
+        reg = <0x17300000 0x40c>;
+
+        interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+                <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+                <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+                <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+                <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready",
+                "handover", "stop-ack";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&gcc GCC_LPASS_SWAY_CLK>,
+                 <&lpasscc LPASS_Q6SS_AHBS_AON_CLK>,
+                 <&lpasscc LPASS_Q6SS_AHBM_AON_CLK>,
+                 <&lpasscc LPASS_QDSP6SS_XO_CLK>,
+                 <&lpasscc LPASS_QDSP6SS_SLEEP_CLK>,
+                 <&lpasscc LPASS_QDSP6SS_CORE_CLK>;
+        clock-names = "xo", "sway_cbcr",
+                "lpass_ahbs_aon_cbcr",
+                "lpass_ahbm_aon_cbcr", "qdsp6ss_xo",
+                "qdsp6ss_sleep", "qdsp6ss_core";
+
+        power-domains = <&rpmhpd SDM845_CX>;
+
+        resets = <&pdc_reset PDC_AUDIO_SYNC_RESET>,
+                 <&aoss_reset AOSS_CC_LPASS_RESTART>;
+        reset-names = "pdc_sync", "cc_lpass";
+
+        qcom,halt-regs = <&tcsr_mutex_regs 0x22000>;
+
+        memory-region = <&pil_adsp_mem>;
+
+        qcom,smem-states = <&adsp_smp2p_out 0>;
+        qcom,smem-state-names = "stop";
+    };
-- 
2.7.4

