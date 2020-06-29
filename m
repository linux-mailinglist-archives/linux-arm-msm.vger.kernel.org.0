Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1AA20DD97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2020 23:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732057AbgF2TTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 15:19:37 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49941 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730507AbgF2TTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 15:19:34 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jun 2020 15:19:33 EDT
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Jun 2020 06:52:10 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jun 2020 06:52:08 -0700
Received: from harigovi-linux.qualcomm.com ([10.204.66.157])
  by ironmsg02-blr.qualcomm.com with ESMTP; 29 Jun 2020 19:21:47 +0530
Received: by harigovi-linux.qualcomm.com (Postfix, from userid 2332695)
        id 31D671FC2; Mon, 29 Jun 2020 19:21:46 +0530 (IST)
From:   Harigovindan P <harigovi@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, hoegsberg@chromium.org,
        kalyan_t@codeaurora.org, nganji@codeaurora.org
Subject: [v4] arm64: dts: sc7180: add nodes for idp display
Date:   Mon, 29 Jun 2020 19:21:44 +0530
Message-Id: <20200629135144.8265-1-harigovi@codeaurora.org>
X-Mailer: git-send-email 2.27.0
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
Changes in v4:
	- Added pinconf subnode
	- Using macros for function and drive-strength

 arch/arm64/boot/dts/qcom/sc7180-idp.dts | 65 +++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 39dbfc89689e..5e0b7e4b2545 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "sc7180.dtsi"
 #include "pm6150.dtsi"
 #include "pm6150l.dtsi"
@@ -287,6 +288,57 @@ vreg_bob: bob {
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
@@ -402,6 +454,19 @@ wifi-firmware {
 
 /* PINCTRL - additions to nodes defined in sc7180.dtsi */
 
+&pm6150l_gpio {
+	disp_pins: disp-pins {
+		pinconf {
+			pins = "gpio3";
+			function = PMIC_GPIO_FUNC_FUNC1;
+			qcom,drive-strength = <PMIC_GPIO_STRENGTH_MED>;
+			power-source = <0>;
+			bias-disable;
+			output-low;
+		};
+	};
+};
+
 &qspi_clk {
 	pinconf {
 		pins = "gpio63";
-- 
2.27.0

