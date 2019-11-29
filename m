Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE8110D1A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 07:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfK2G4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 01:56:21 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:4029 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfK2G4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 01:56:21 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Nov 2019 12:26:15 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.147])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 Nov 2019 12:25:54 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id F2D472346; Fri, 29 Nov 2019 12:25:53 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org,
        chandanu@codeaurora.org, nganji@codeaurora.org
Subject: [PATCH v1 1/2] dt-bindings: display: add sc7180 panel variant
Date:   Fri, 29 Nov 2019 12:25:44 +0530
Message-Id: <1575010545-25971-2-git-send-email-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
References: <1575010545-25971-1-git-send-email-harigovi@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible string to support sc7180 panel version.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---
 .../bindings/display/visionox,rm69299.txt          | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/display/visionox,rm69299.txt

diff --git a/Documentation/devicetree/bindings/display/visionox,rm69299.txt b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
new file mode 100755
index 0000000..4622191
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/visionox,rm69299.txt
@@ -0,0 +1,68 @@
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
+- mode-gpios: phandle of the gpio for choosing the mode of the display
+  for single DSI
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
+			display-timings {
+				timing0: timing-0 {
+					/* originally
+					 * 268316160 Mhz,
+					 * but value below fits
+					 * better w/ downstream
+					 */
+					clock-frequency = <158695680>;
+					hactive = <1080>;
+					vactive = <2248>;
+					hfront-porch = <26>;
+					hback-porch = <36>;
+					hsync-len = <2>;
+					vfront-porch = <56>;
+					vback-porch = <4>;
+					vsync-len = <4>;
+				};
+			};
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

