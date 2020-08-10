Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27E2406AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Aug 2020 15:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgHJNie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Aug 2020 09:38:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47496 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgHJNie (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Aug 2020 09:38:34 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 10 Aug 2020 06:38:33 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Aug 2020 06:38:31 -0700
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg01-blr.qualcomm.com with ESMTP; 10 Aug 2020 19:08:08 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 5D46B458C; Mon, 10 Aug 2020 19:08:07 +0530 (IST)
From:   Krishna Manikandan <mkrishn@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org, robh@kernel.org,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH 2/2] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
Date:   Mon, 10 Aug 2020 19:08:03 +0530
Message-Id: <1597066683-6044-2-git-send-email-mkrishn@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
References: <1597066683-6044-1-git-send-email-mkrishn@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add bindings for Snapdragon DisplayPort controller driver.

Changes in V2:
Provide details about sel-gpio

Changes in V4:
Provide details about max dp lanes
Change the commit text

Changes in V5:
moved dp.txt to yaml file

Changes in v6:
- Squash all AUX LUT properties into one pattern Property
- Make aux-cfg[0-9]-settings properties optional
- Remove PLL/PHY bindings from DP controller dts
- Add DP clocks description
- Remove _clk suffix from clock names
- Rename pixel clock to stream_pixel
- Remove redundant bindings (GPIO, PHY, HDCP clock, etc..)
- Fix indentation
- Add Display Port as interface of DPU in DPU bindings
  and add port mapping accordingly.

Chages in v7:
- Add dp-controller.yaml file common between multiple SOC
- Rename dp-sc7180.yaml to dp-controller-sc7180.yaml
- change compatible string and add SOC name to it.
- Remove Root clock generator for pixel clock
- Add assigned-clocks and assigned-clock-parents bindings
- Remove redundant properties, descriptions and blank lines
- Add DP port in DPU bindings
- Update depends-on tag in commit message and rebase change accordingly

Changes in v8:
- Add MDSS AHB clock in bindings

Changes in v9:
- Remove redundant reg-name property
- Change assigned-clocks and assigned-clocks-parents counts to 2
- Use IRQ flags in example dts

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 .../bindings/display/msm/dp-controller-sc7180.yaml | 141 +++++++++++++++++++++
 .../bindings/display/msm/dp-controller.yaml        |  59 +++++++++
 .../bindings/display/msm/dpu-sc7180.yaml           |  10 ++
 3 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
new file mode 100644
index 0000000..83a9e39
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
@@ -0,0 +1,141 @@
+# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dp-controller-sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MSM SC7180 Display Port Controller.
+
+maintainers:
+  - Chandan Uddaraju <chandanu@codeaurora.org>
+  - Vara Reddy <varar@codeaurora.org>
+  - Tanmay Shah <tanmay@codeaurora.org>
+
+description: |
+  Device tree bindings for DP host controller for MSM SC7180 target
+  that are compatible with VESA Display Port interface specification.
+
+allOf:
+  - $ref: dp-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sc7180-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core_aux
+      - const: ctrl_link
+      - const: ctrl_link_iface
+      - const: stream_pixel
+
+  "#clock-cells":
+    const: 1
+
+  assigned-clocks:
+    maxItems: 2
+  assigned-clock-parents:
+    maxItems: 2
+
+  data-lanes:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 1
+    maxItems: 4
+
+  vdda-1p2-supply:
+    description: phandle to vdda 1.2V regulator node.
+
+  vdda-0p9-supply:
+    description: phandle to vdda 0.9V regulator node.
+
+  ports:
+    type: object
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+      port@1:
+        type: object
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - vdda-1p2-supply
+  - vdda-0p9-supply
+  - data-lanes
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
+    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
+    msm_dp: displayport-controller@ae90000{
+        compatible = "qcom,sc7180-dp";
+        reg = <0 0xae90000 0 0x1400>;
+
+        interrupt-parent = <&mdss>;
+        interrupts = <12 IRQ_TYPE_NONE>;
+
+        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
+        clock-names = "core_iface", "core_aux",
+                      "ctrl_link",
+                      "ctrl_link_iface", "stream_pixel";
+        #clock-cells = <1>;
+
+        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+                          <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
+
+        vdda-1p2-supply = <&vreg_l3c_1p2>;
+        vdda-0p9-supply = <&vreg_l4a_0p8>;
+
+        data-lanes = <0 1>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dp_in: endpoint {
+                    remote-endpoint = <&dpu_intf0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dp_out: endpoint {
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
new file mode 100644
index 0000000..f41fecb
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Port Controller.
+
+maintainers:
+  - Chandan Uddaraju <chandanu@codeaurora.org>
+  - Vara Reddy <varar@codeaurora.org>
+  - Tanmay Shah <tanmay@codeaurora.org>
+
+description: |
+  Device tree bindings for MSM Display Port which supports DP host controllers
+  that are compatible with VESA Display Port interface specification.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sc7180-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+    items:
+      - description: AHB clock to enable register access
+      - description: Display Port AUX clock
+      - description: Display Port Link clock
+      - description: Link interface clock between DP and PHY
+      - description: Display Port Pixel clock
+
+  clock-names:
+    items:
+      - const: core_iface
+      - const: core_aux
+      - const: ctrl_link
+      - const: ctrl_link_iface
+      - const: stream_pixel
+
+  assigned-clocks:
+    maxItems: 2
+  assigned-clock-parents:
+    maxItems: 2
+
+  data-lanes:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    minItems: 1
+    maxItems: 4
+
+  ports:
+    type: object
+...
diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
index df70393..be796d9 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -133,6 +133,9 @@ patternProperties:
           port@1:
             type: object
             description: DPU_INTF2 (DSI2)
+          port@2:
+            type: object
+            description: DPU_INTF0 (DP)
 
       assigned-clocks:
         maxItems: 4
@@ -229,6 +232,13 @@ examples:
                                                   remote-endpoint = <&dsi0_in>;
                                    };
                            };
+
+                            port@2 {
+                                    reg = <2>;
+                                    dpu_intf0_out: endpoint {
+                                                   remote-endpoint = <&dp_in>;
+                                    };
+                            };
                    };
          };
       };
-- 
1.9.1

