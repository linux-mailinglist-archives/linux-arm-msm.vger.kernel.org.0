Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B742A17D8D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 06:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgCIFX0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 01:23:26 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:64457 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbgCIFXZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 01:23:25 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 09 Mar 2020 10:53:20 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg01-blr.qualcomm.com with ESMTP; 09 Mar 2020 10:53:08 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id D7D5625B6; Mon,  9 Mar 2020 10:53:06 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v5 1/2] dt-bindings: display: add visionox rm69299 panel variant
Date:   Mon,  9 Mar 2020 10:53:03 +0530
Message-Id: <20200309052304.23427-2-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200309052304.23427-1-harigovi@codeaurora.org>
References: <20200309052304.23427-1-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for visionox rm69299 panel.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v2:
	- Removed unwanted properties from description.
	- Creating source files without execute permissions(Rob Herring).
Changes in v3:
	- Changing txt file into yaml
Changes in v4:
	- Updating license identifier.
	- Moving yaml file inside panel directory.
	- Removing pinctrl entries.
	- Adding documentation for reset-gpios.
Changes in v5:
	- No changes. Updated 2/2 Patch.

 .../display/panel/visionox,rm69299.yaml       | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
new file mode 100755
index 000000000000..052d87f8fadd
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,rm69299.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox model RM69299 Panels Device Tree Bindings.
+
+maintainers:
+ - Harigovindan P <harigovi@codeaurora.org>
+
+description: |
+ This binding is for display panels using a Visionox RM692999 panel.
+
+allOf:
+ - $ref: panel-common.yaml#
+
+patternProperties:
+  "^(panel|panel-dsi)@[0-9]$":
+    type: object
+    properties:
+      compatible:
+        const: visionox,rm69299-1080p-display
+
+      reg:
+        maxItems: 1
+
+      vdda-supply:
+        description:
+          Phandle of the regulator that provides the vdda supply voltage.
+
+      vdd3p3-supply:
+        description:
+          Phandle of the regulator that provides the vdd3p3 supply voltage.
+
+      ports:
+        type: object
+        description:
+          A node containing DSI input & output port nodes with endpoint
+          definitions as documented in
+          Documentation/devicetree/bindings/media/video-interfaces.txt
+          Documentation/devicetree/bindings/graph.txt
+        properties:
+          port@0:
+            type: object
+            description:
+              DSI input port node.
+
+      reset-gpios:
+        description:
+          a GPIO spec for the reset pin.
+
+required:
+  - compatible
+  - reg
+  - vdda-supply
+  - vdd3p3-supply
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+- |
+    dsi@ae94000 {
+        panel@0 {
+            compatible = "visionox,rm69299-1080p-display";
+
+            vdda-supply = <&src_pp1800_l8c>;
+            vdd3p3-supply = <&src_pp2800_l18a>;
+
+            reset-gpios = <&pm6150l_gpio 3 0>;
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    port@0 {
+                            reg = <0>;
+                            panel0_in: endpoint {
+                                remote-endpoint = <&dsi0_out>;
+                            };
+                    };
+            };
+        };
+    };
+...
+
-- 
2.25.1

