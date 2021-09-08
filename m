Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC452403E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 19:16:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbhIHRRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 13:17:15 -0400
Received: from ixit.cz ([94.230.151.217]:47876 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230217AbhIHRRO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 13:17:14 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id A0A8C24A25;
        Wed,  8 Sep 2021 19:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631121364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2luen1Aw75WFk54UH4uHBWb4js/b04AcAZvA6vWMGpQ=;
        b=01ZQyret+a97Aqgn4L3B666nJNHqH0l3vZC9MTZFxBwvvUUEmAaaw9FeRPtWPQqjyKLfza
        QPcP3KODt4pEHpwitWoVQL5JckV49IlPqsrpDW8B8ndByLyTWPfVm4NlKHQAuY3cklcyzh
        9BAB5DYTDI+jG2WRw17dgO32OaINWjU=
From:   David Heidelberg <david@ixit.cz>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [RFC PATCH] [v2] dt-bindings: arm/msm/qcom,idle-state convert to YAML
Date:   Wed,  8 Sep 2021 19:14:53 +0200
Message-Id: <20210908171453.53259-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switched maintainer from Lina to Bjorn.

Doesn't fix:
```
idle-states: 'spc' does not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
```
from colliding arm/idle-states.yaml .

Signed-off-by: David Heidelberg <david@ixit.cz>
---

v2
 - maintainer is now Bjorn
 - fixed some newlines
 - specified exact state names (added $)

 .../bindings/arm/msm/qcom,idle-state.txt      |  84 ------------
 .../bindings/arm/msm/qcom,idle-state.yaml     | 126 ++++++++++++++++++
 2 files changed, 126 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
deleted file mode 100644
index 6ce0b212ec6d..000000000000
--- a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-QCOM Idle States for cpuidle driver
-
-ARM provides idle-state node to define the cpuidle states, as defined in [1].
-cpuidle-qcom is the cpuidle driver for Qualcomm SoCs and uses these idle
-states. Idle states have different enter/exit latency and residency values.
-The idle states supported by the QCOM SoC are defined as -
-
-    * Standby
-    * Retention
-    * Standalone Power Collapse (Standalone PC or SPC)
-    * Power Collapse (PC)
-
-Standby: Standby does a little more in addition to architectural clock gating.
-When the WFI instruction is executed the ARM core would gate its internal
-clocks. In addition to gating the clocks, QCOM cpus use this instruction as a
-trigger to execute the SPM state machine. The SPM state machine waits for the
-interrupt to trigger the core back in to active. This triggers the cache
-hierarchy to enter standby states, when all cpus are idle. An interrupt brings
-the SPM state machine out of its wait, the next step is to ensure that the
-cache hierarchy is also out of standby, and then the cpu is allowed to resume
-execution. This state is defined as a generic ARM WFI state by the ARM cpuidle
-driver and is not defined in the DT. The SPM state machine should be
-configured to execute this state by default and after executing every other
-state below.
-
-Retention: Retention is a low power state where the core is clock gated and
-the memory and the registers associated with the core are retained. The
-voltage may be reduced to the minimum value needed to keep the processor
-registers active. The SPM should be configured to execute the retention
-sequence and would wait for interrupt, before restoring the cpu to execution
-state. Retention may have a slightly higher latency than Standby.
-
-Standalone PC: A cpu can power down and warmboot if there is a sufficient time
-between the time it enters idle and the next known wake up. SPC mode is used
-to indicate a core entering a power down state without consulting any other
-cpu or the system resources. This helps save power only on that core.  The SPM
-sequence for this idle state is programmed to power down the supply to the
-core, wait for the interrupt, restore power to the core, and ensure the
-system state including cache hierarchy is ready before allowing core to
-resume. Applying power and resetting the core causes the core to warmboot
-back into Elevation Level (EL) which trampolines the control back to the
-kernel. Entering a power down state for the cpu, needs to be done by trapping
-into a EL. Failing to do so, would result in a crash enforced by the warm boot
-code in the EL for the SoC. On SoCs with write-back L1 cache, the cache has to
-be flushed in s/w, before powering down the core.
-
-Power Collapse: This state is similar to the SPC mode, but distinguishes
-itself in that the cpu acknowledges and permits the SoC to enter deeper sleep
-modes. In a hierarchical power domain SoC, this means L2 and other caches can
-be flushed, system bus, clocks - lowered, and SoC main XO clock gated and
-voltages reduced, provided all cpus enter this state.  Since the span of low
-power modes possible at this state is vast, the exit latency and the residency
-of this low power mode would be considered high even though at a cpu level,
-this essentially is cpu power down. The SPM in this state also may handshake
-with the Resource power manager (RPM) processor in the SoC to indicate a
-complete application processor subsystem shut down.
-
-The idle-state for QCOM SoCs are distinguished by the compatible property of
-the idle-states device node.
-
-The devicetree representation of the idle state should be -
-
-Required properties:
-
-- compatible: Must be one of -
-			"qcom,idle-state-ret",
-			"qcom,idle-state-spc",
-			"qcom,idle-state-pc",
-		and "arm,idle-state".
-
-Other required and optional properties are specified in [1].
-
-Example:
-
-	idle-states {
-		CPU_SPC: spc {
-			compatible = "qcom,idle-state-spc", "arm,idle-state";
-			entry-latency-us = <150>;
-			exit-latency-us = <200>;
-			min-residency-us = <2000>;
-		};
-	};
-
-[1]. Documentation/devicetree/bindings/arm/idle-states.yaml
diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
new file mode 100644
index 000000000000..254868e09520
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/msm/qcom,idle-state.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: QCOM Idle States binding description
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  ARM provides idle-state node to define the cpuidle states, as defined in [1].
+  cpuidle-qcom is the cpuidle driver for Qualcomm SoCs and uses these idle
+  states. Idle states have different enter/exit latency and residency values.
+  The idle states supported by the QCOM SoC are defined as -
+
+    * Standby
+    * Retention
+    * Standalone Power Collapse (Standalone PC or SPC)
+    * Power Collapse (PC)
+
+  Standby: Standby does a little more in addition to architectural clock gating.
+  When the WFI instruction is executed the ARM core would gate its internal
+  clocks. In addition to gating the clocks, QCOM cpus use this instruction as a
+  trigger to execute the SPM state machine. The SPM state machine waits for the
+  interrupt to trigger the core back in to active. This triggers the cache
+  hierarchy to enter standby states, when all cpus are idle. An interrupt brings
+  the SPM state machine out of its wait, the next step is to ensure that the
+  cache hierarchy is also out of standby, and then the cpu is allowed to resume
+  execution. This state is defined as a generic ARM WFI state by the ARM cpuidle
+  driver and is not defined in the DT. The SPM state machine should be
+  configured to execute this state by default and after executing every other
+  state below.
+
+  Retention: Retention is a low power state where the core is clock gated and
+  the memory and the registers associated with the core are retained. The
+  voltage may be reduced to the minimum value needed to keep the processor
+  registers active. The SPM should be configured to execute the retention
+  sequence and would wait for interrupt, before restoring the cpu to execution
+  state. Retention may have a slightly higher latency than Standby.
+
+  Standalone PC: A cpu can power down and warmboot if there is a sufficient time
+  between the time it enters idle and the next known wake up. SPC mode is used
+  to indicate a core entering a power down state without consulting any other
+  cpu or the system resources. This helps save power only on that core.  The SPM
+  sequence for this idle state is programmed to power down the supply to the
+  core, wait for the interrupt, restore power to the core, and ensure the
+  system state including cache hierarchy is ready before allowing core to
+  resume. Applying power and resetting the core causes the core to warmboot
+  back into Elevation Level (EL) which trampolines the control back to the
+  kernel. Entering a power down state for the cpu, needs to be done by trapping
+  into a EL. Failing to do so, would result in a crash enforced by the warm boot
+  code in the EL for the SoC. On SoCs with write-back L1 cache, the cache has to
+  be flushed in s/w, before powering down the core.
+
+  Power Collapse: This state is similar to the SPC mode, but distinguishes
+  itself in that the cpu acknowledges and permits the SoC to enter deeper sleep
+  modes. In a hierarchical power domain SoC, this means L2 and other caches can
+  be flushed, system bus, clocks - lowered, and SoC main XO clock gated and
+  voltages reduced, provided all cpus enter this state.  Since the span of low
+  power modes possible at this state is vast, the exit latency and the residency
+  of this low power mode would be considered high even though at a cpu level,
+  this essentially is cpu power down. The SPM in this state also may handshake
+  with the Resource power manager (RPM) processor in the SoC to indicate a
+  complete application processor subsystem shut down.
+
+  The idle-state for QCOM SoCs are distinguished by the compatible property of
+  the idle-states device node.
+
+  [1] Documentation/devicetree/bindings/arm/idle-states.yaml
+
+properties:
+  $nodename:
+    const: idle-states
+
+patternProperties:
+  "^(ret|spc|pc)$":
+    type: object
+    description:
+      Each state node represents a domain idle state description.
+
+    properties:
+      compatible:
+        items:
+          - enum:
+            - qcom,idle-state-ret
+            - qcom,idle-state-spc
+            - qcom,idle-state-pc
+          - const: arm,idle-state
+
+      entry-latency-us:
+        description:
+          The worst case latency in microseconds required to enter the idle
+          state. Note that, the exit-latency-us duration may be guaranteed only
+          after the entry-latency-us has passed.
+
+      exit-latency-us:
+        description:
+          The worst case latency in microseconds required to exit the idle
+          state.
+
+      min-residency-us:
+        description:
+          The minimum residency duration in microseconds after which the idle
+          state will yield power benefits, after overcoming the overhead while
+          entering the idle state.
+
+    required:
+      - compatible
+      - entry-latency-us
+      - exit-latency-us
+      - min-residency-us
+
+additionalProperties: false
+
+examples:
+  - |
+    idle-states {
+      CPU_SPC: spc {
+        compatible = "qcom,idle-state-spc", "arm,idle-state";
+        entry-latency-us = <150>;
+        exit-latency-us = <200>;
+        min-residency-us = <2000>;
+      };
+    };
-- 
2.33.0

