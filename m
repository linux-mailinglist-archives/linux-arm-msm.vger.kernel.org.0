Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9475A32E1B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 06:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCEFjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 00:39:37 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:4078 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhCEFjg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 00:39:36 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 21:39:35 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 21:39:34 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 11:09:11 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 2C6013CDE; Fri,  5 Mar 2021 11:09:10 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH 2/3] dt-bindings: input: pm8941-pwrkey: Convert power key bindings to yaml
Date:   Fri,  5 Mar 2021 11:08:40 +0530
Message-Id: <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert power key bindings from .txt to .yaml format.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 .../bindings/input/qcom,pm8941-pwrkey.txt          | 53 ---------------
 .../bindings/input/qcom,pm8941-pwrkey.yaml         | 76 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
deleted file mode 100644
index 34ab576..0000000
--- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-Qualcomm PM8941 PMIC Power Key
-
-PROPERTIES
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,pm8941-pwrkey"
-		    "qcom,pm8941-resin"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: base address of registers for block
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: key change interrupt; The format of the specifier is
-		    defined by the binding document describing the node's
-		    interrupt parent.
-
-- debounce:
-	Usage: optional
-	Value type: <u32>
-	Definition: time in microseconds that key must be pressed or released
-		    for state change interrupt to trigger.
-
-- bias-pull-up:
-	Usage: optional
-	Value type: <empty>
-	Definition: presence of this property indicates that the KPDPWR_N pin
-		    should be configured for pull up.
-
-- linux,code:
-	Usage: optional
-	Value type: <u32>
-	Definition: The input key-code associated with the power key.
-		    Use the linux event codes defined in
-		    include/dt-bindings/input/linux-event-codes.h
-		    When property is omitted KEY_POWER is assumed.
-
-EXAMPLE
-
-	pwrkey@800 {
-		compatible = "qcom,pm8941-pwrkey";
-		reg = <0x800>;
-		interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-		debounce = <15625>;
-		bias-pull-up;
-		linux,code = <KEY_POWER>;
-	};
diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
new file mode 100644
index 0000000..302866d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,pm8941-pwrkey.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PM8941 PMIC Power Key
+
+maintainers:
+ - Courtney Cavin <courtney.cavin@sonymobile.com>
+ - Vinod Koul <vkoul@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8941-pwrkey
+      - qcom,pm8941-resin
+
+  interrupts:
+    description: |
+          Key change interrupt; The format of the specifier is
+          defined by the binding document describing the node's
+          interrupt parent.
+
+  debounce:
+    description: |
+          Time in microseconds that key must be pressed or
+          released for state change interrupt to trigger.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bias-pull-up:
+    description: |
+           Presence of this property indicates that the KPDPWR_N
+           pin should be configured for pull up.
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  linux,code:
+    description: |
+           The input key-code associated with the power key.
+           Use the linux event codes defined in
+           include/dt-bindings/input/linux-event-codes.h
+           When property is omitted KEY_POWER is assumed.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+required:
+ - compatible
+ - interrupts
+
+additionalProperties: false
+
+examples:
+ - |
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/input/linux-event-codes.h>
+   #include <dt-bindings/spmi/spmi.h>
+   spmi_bus: spmi@c440000 {
+     reg = <0x0c440000 0x1100>;
+     #address-cells = <2>;
+     #size-cells = <0>;
+     pmk8350: pmic@0 {
+       reg = <0x0 SPMI_USID>;
+       #address-cells = <1>;
+       #size-cells = <0>;
+       pmk8350_pon: pon_hlos@1300 {
+         reg = <0x1300>;
+         pwrkey {
+            compatible = "qcom,pm8941-pwrkey";
+            interrupts = < 0x0 0x8 0 IRQ_TYPE_EDGE_BOTH >;
+            debounce = <15625>;
+            bias-pull-up;
+            linux,code = <KEY_POWER>;
+         };
+       };
+     };
+   };
+...
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

