Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 625EC160DE8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2020 10:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgBQJBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Feb 2020 04:01:14 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:38503 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728563AbgBQJBN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Feb 2020 04:01:13 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Feb 2020 14:29:05 +0530
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 17 Feb 2020 14:28:45 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id E92BA24EF; Mon, 17 Feb 2020 14:28:43 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v3] arm64: dts: sc7180: add nodes for idp display
Date:   Mon, 17 Feb 2020 14:28:42 +0530
Message-Id: <20200217085842.28333-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes for IDP display. The display is Visionox RM69299.

Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
---

Changes in v2:
	- Adding dependency patchwork series
	- Removing suspend configuration
	- Adding blank before space curly brace
Changes in v3:
	- Updating status for mdp and mdss node to get the
	display working
	- Change in commit text

This patch depends on following patchwork series:

https://patchwork.kernel.org/patch/11364687/
https://patchwork.kernel.org/patch/11366303/

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 63 +++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 388f50ad4fde..349db8fe78a5 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
@@ -232,6 +233,57 @@ vreg_bob: bob {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	vdda-supply = <&vreg_l3c_1p2>;
+
+	panel@0 {
+		compatible = "visionox,rm69299-1080p-display";
+		reg = <0>;
+
+		vdda-supply = <&vreg_l8c_1p8>;
+		vdd3p3-supply = <&vreg_l18a_2p8>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&disp_pins>;
+
+		reset-gpios = <&pm6150l_gpio 3 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				panel0_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+		};
+	};
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&panel0_in>;
+				data-lanes = <0 1 2 3>;
+			};
+		};
+	};
+};
+
+&dsi_phy {
+	status = "okay";
+};
+
+&mdp {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
@@ -289,6 +341,17 @@ &usb_1_qmpphy {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&pm6150l_gpio {
+	disp_pins: disp-pins {
+		pins = "gpio3";
+		function = "func1";
+		qcom,drive-strength = <2>;
+		power-source = <0>;
+		bias-disable;
+		output-low;
+	};
+};
+
 &qspi_clk {
 	pinconf {
 		pins = "gpio63";
-- 
2.25.0

