Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 287751324DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 12:30:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgAGLaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 06:30:04 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:52229 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727882AbgAGLaE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 06:30:04 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Jan 2020 17:00:01 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 Jan 2020 17:00:01 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 4380D2574; Tue,  7 Jan 2020 17:00:00 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: [PATCH v2 1/2] dt-bindings: display: add sc7180 panel variant
Date:   Tue,  7 Jan 2020 16:59:56 +0530
Message-Id: <1578396597-18324-2-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible string to support sc7180 panel version.

Changes in v1:
	-Added a compatible string to support sc7180 panel version.
Changes in v2:
	-Removed unwanted properties from description.
	-Creating source files without execute permissions(Rob Herring).

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 .../bindings/display/visionox,rm69299.txt          | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.txt

diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
new file mode 100644
index 0000000..d7bbd5f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
@@ -0,0 +1,48 @@
+Visionox model RM69299 DSI display driver
+
+The Visionox RM69299 is a generic display driver, currently only configured
+for use in the 1080p display on the Qualcomm SC7180 MTP board.
+
+Required properties:
+- compatible: should be "visionox,rm69299-1080p-display"
+- vdda-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply
+- vdd3p3-supply: phandle of the regulator that provides the supply voltage
+  Power IC supply
+- reset-gpios: phandle of gpio for reset line
+  This should be 8mA, gpio can be configured using mux, pinctrl, pinctrl-names
+  (active low)
+- ports: This device has one video port driven by one DSI. Their connections
+  are modeled using the OF graph bindings specified in
+  Documentation/devicetree/bindings/graph.txt.
+  - port@0: DSI input port driven by master DSI
+
+Example:
+
+	dsi@ae94000 {
+		panel@0 {
+			compatible = "visionox,rm69299-1080p-display";
+			reg = <0>;
+
+			vdda-supply = <&src_pp1800_l8c>;
+			vdd3p3-supply = <&src_pp2800_l18a>;
+
+			pinctrl-names = "default", "suspend";
+			pinctrl-0 = <&disp_pins_default>;
+			pinctrl-1 = <&disp_pins_default>;
+
+			reset-gpios = <&pm6150l_gpios 3 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					panel0_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+	};
-- 
2.7.4

