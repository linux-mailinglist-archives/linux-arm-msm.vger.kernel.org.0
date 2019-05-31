Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2071830BFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 11:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfEaJqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 05:46:44 -0400
Received: from onstation.org ([52.200.56.107]:51402 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbfEaJqd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 05:46:33 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 34FC245030;
        Fri, 31 May 2019 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559295992;
        bh=/xNgrwMdwsn2EL5BENmTORbJ1tzBkVSX2GrMxt86540=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DwfwVIzVRKxCHHcKREBvcFgit5hRi5i7OWJgqz7Ku4KxPD8I8xxvEVhR5jzFqM4J3
         vBnCQZxGyjeObydQJ8ViCVw1y6GwoxkZom1ZO4fS5iz1ZgfBmwMkNXNT0/YWzW3XE2
         B0OlXy8NJIr3jFbuq9O0r9+RY2Pz/L7MBG7Ca8bY=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jonathan@marek.ca, robh@kernel.org, jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 5/6] ARM: dts: msm8974: add display support
Date:   Fri, 31 May 2019 05:46:18 -0400
Message-Id: <20190531094619.31704-6-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the MDP5, DSI and DSI PHY blocks for the display found on the
msm8974 SoCs. This is based on work from msm8916.dtsi and Jonathan
Marek.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 132 ++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 45b5c8ef0374..3f613c5b95a1 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+#include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1085,6 +1086,137 @@
 				};
 			};
 		};
+
+		mdss: mdss@fd900000 {
+			status = "disabled";
+
+			compatible = "qcom,mdss";
+			reg = <0xfd900000 0x100>,
+			      <0xfd924000 0x1000>;
+			reg-names = "mdss_phys",
+			            "vbif_phys";
+
+			power-domains = <&mmcc MDSS_GDSC>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+			         <&mmcc MDSS_AXI_CLK>,
+			         <&mmcc MDSS_VSYNC_CLK>;
+			clock-names = "iface",
+			              "bus",
+			              "vsync";
+
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@fd900000 {
+				status = "disabled";
+
+				compatible = "qcom,mdp5";
+				reg = <0xfd900100 0x22000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+				              "bus",
+				              "core",
+				              "vsync";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+				};
+			};
+
+			dsi0: dsi@fd922800 {
+				status = "disabled";
+
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0xfd922800 0x1f8>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
+				                  <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy0 0>,
+				                         <&dsi_phy0 1>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+				         <&mmcc MDSS_AHB_CLK>,
+				         <&mmcc MDSS_AXI_CLK>,
+				         <&mmcc MDSS_BYTE0_CLK>,
+				         <&mmcc MDSS_PCLK0_CLK>,
+				         <&mmcc MDSS_ESC0_CLK>,
+				         <&mmcc MMSS_MISC_AHB_CLK>;
+				clock-names = "mdp_core",
+				              "iface",
+				              "bus",
+				              "byte",
+				              "pixel",
+				              "core",
+				              "core_mmss";
+
+				phys = <&dsi_phy0>;
+				phy-names = "dsi-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&mdp5_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi_phy0: dsi-phy@fd922a00 {
+				status = "disabled";
+
+				compatible = "qcom,dsi-phy-28nm-hpm";
+				reg = <0xfd922a00 0xd4>,
+				      <0xfd922b00 0x280>,
+				      <0xfd922d80 0x30>;
+				reg-names = "dsi_pll",
+				            "dsi_phy",
+				            "dsi_phy_regulator";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+				qcom,dsi-phy-index = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>;
+				clock-names = "iface";
+			};
+		};
 	};
 
 	smd {
-- 
2.20.1

