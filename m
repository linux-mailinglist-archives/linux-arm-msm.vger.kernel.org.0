Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B80020FC0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 20:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgF3Sqc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 14:46:32 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:13287 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726592AbgF3Sqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 14:46:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593542789; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=3qlZsq7rsH/PWQ5NUvTh3D09Qo0tpKCX46mIgW8L0QU=; b=AgJwW+8Lmc3hcSC2BRRVzeemsPrVnLnhcfUzYrDomp9AdFDAvetBvVI0LtBc8jxMbESX6XG2
 zi3VcnizIvLu5T4bZJ2DQcdxHdJSlUsO2GVAT6X8WLaszrm+rKqZvsu9z4h9qYwLs/HSw4t1
 IB32R/JCD2fdN1jsfTaPb/piSlQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5efb887b3a8a8b20b8264ab6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 18:46:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A7D42C433C8; Tue, 30 Jun 2020 18:46:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4EF5AC433C6;
        Tue, 30 Jun 2020 18:46:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4EF5AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tanmay@codeaurora.org
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     robh+dt@kernel.org, swboyd@chromium.org, sam@ravnborg.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, seanpaul@chromium.org,
        robdclark@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
        aravindh@codeaurora.org, abhinavk@codeaurora.org,
        chandanu@codeaurora.org, varar@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>
Subject: [PATCH v8 1/6] dt-bindings: msm/dp: add bindings of DP/DP-PLL driver for Snapdragon
Date:   Tue, 30 Jun 2020 11:45:02 -0700
Message-Id: <20200630184507.15589-2-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630184507.15589-1-tanmay@codeaurora.org>
References: <20200630184507.15589-1-tanmay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This change depends-on:
	- https://patchwork.freedesktop.org/patch/366159/

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
---
 .../display/msm/dp-controller-sc7180.yaml     | 144 ++++++++++++++++++
 .../bindings/display/msm/dp-controller.yaml   |  61 ++++++++
 .../bindings/display/msm/dpu-sc7180.yaml      |  11 ++
 3 files changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/dp-controller.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
new file mode 100644
index 000000000000..ce89ea73e778
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller-sc7180.yaml
@@ -0,0 +1,144 @@
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
+  reg-names:
+    const: dp_controller
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
+    maxItems: 1
+  assigned-clock-parents:
+    maxItems: 1
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
+  - reg-names
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
+        reg-names = "dp_controller";
+
+        interrupt-parent = <&mdss>;
+        interrupts = <12 0>;
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
+        assigned-clocks = <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
+        assigned-clock-parents = <&dp_phy 1>;
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
index 000000000000..f69b8505516c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -0,0 +1,61 @@
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
+  reg-names:
+    const: dp_controller
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
+    maxItems: 1
+  assigned-clock-parents:
+    maxItems: 1
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
index b5607f9429d5..9be71558c517 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
@@ -141,6 +141,9 @@ patternProperties:
              port@1:
                type: object
                description: DPU_INTF2 (DSI2)
+             port@2:
+               type: object
+               description: DPU_INTF0 (DP)
 
       assigned-clocks:
         description: |
@@ -237,6 +240,14 @@ examples:
                                                   remote-endpoint = <&dsi0_in>;
                                    };
                            };
+
+                           port@2 {
+                                   reg = <2>;
+                                   dpu_intf0_out: endpoint {
+                                                  remote-endpoint = <&dp_in>;
+                                   };
+                           };
+
                    };
          };
     };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

