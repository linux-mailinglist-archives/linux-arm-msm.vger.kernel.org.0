Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D4C395D0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 15:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhEaNkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 09:40:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56381 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhEaNgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 09:36:21 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 31 May 2021 06:34:40 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 31 May 2021 06:34:39 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 31 May 2021 19:04:09 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 3339121485; Mon, 31 May 2021 19:04:08 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, sean@poorly.run, robdclark@gmail.com,
        robh+dt@kernel.org, abhinavk@codeaurora.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org, jonathan@marek.ca
Subject: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
Date:   Mon, 31 May 2021 19:03:53 +0530
Message-Id: <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add YAML schema for the device tree bindings for MSM 7nm DSI PHY driver.

Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
new file mode 100644
index 00000000..f17cfde
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 7nm PHY
+
+maintainers:
+  - Rajeev Nandan <rajeevny@codeaurora.org>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-7nm
+      - const: qcom,dsi-phy-7nm-7280
+      - const: qcom,dsi-phy-7nm-8150
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vdds-supply:
+    description: Phandle to 0.9V power supply regulator device node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vdds-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-7nm-7280";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94900 0x280>;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+
+         vdds-supply = <&vreg_l10c_0p8>;
+     };
+...
-- 
2.7.4

