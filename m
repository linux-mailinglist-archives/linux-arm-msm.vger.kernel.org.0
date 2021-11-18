Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9555C4564B2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 22:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhKRVF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 16:05:57 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36972 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231950AbhKRVF4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:56 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 142C5CAE00;
        Thu, 18 Nov 2021 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269374; bh=89R9eZrI3Jpd1FwYGe9ohAPLXnKdr6Sx1Vas99ytQ4A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=idwqDYPfh/0uq2HsKEuPIWCqDEojhUjtzcdGBgLUMP2XNZEDPqBFTV06hQfQvSEbd
         vTtufSMJLr2i5aE3NTjBXD/eWQd1Y+2x7MgSFc3r6lOpq4fB6jq/zKIOQDn+HgecrB
         /I+mC1VjclF88nYr08v8aw4xtUjoyz/Qpoc2l7LY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] ARM: dts: qcom: msm8226: add USB node
Date:   Thu, 18 Nov 2021 22:02:09 +0100
Message-Id: <20211118210210.160895-6-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node describing the MSM8226 USB controller and phy.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8226.dtsi | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
index 7d48599502b3..103c0ab70814 100644
--- a/arch/arm/boot/dts/qcom-msm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/qcom,gcc-msm8974.h>
 
 / {
 	#address-cells = <1>;
@@ -229,6 +230,44 @@ blsp1_i2c5: i2c@f9927000 {
 			#size-cells = <0>;
 		};
 
+		usb: usb@f9a55000 {
+			compatible = "qcom,ci-hdrc";
+			reg = <0xf9a55000 0x200>,
+			      <0xf9a55200 0x200>;
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
+				 <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			clock-names = "iface", "core";
+			assigned-clocks = <&gcc GCC_USB_HS_SYSTEM_CLK>;
+			assigned-clock-rates = <75000000>;
+			resets = <&gcc GCC_USB_HS_BCR>;
+			reset-names = "core";
+			phy_type = "ulpi";
+			dr_mode = "otg";
+			hnp-disable;
+			srp-disable;
+			adp-disable;
+			ahb-burst-config = <0>;
+			phy-names = "usb-phy";
+			phys = <&usb_hs_phy>;
+			status = "disabled";
+			#reset-cells = <1>;
+
+			ulpi {
+				usb_hs_phy: phy {
+					compatible = "qcom,usb-hs-phy-msm8226",
+						     "qcom,usb-hs-phy";
+					#phy-cells = <0>;
+					clocks = <&xo_board>, <&gcc GCC_USB2A_PHY_SLEEP_CLK>;
+					clock-names = "ref", "sleep";
+					resets = <&gcc GCC_USB2A_PHY_BCR>, <&usb 0>;
+					reset-names = "phy", "por";
+					qcom,init-seq = /bits/ 8 <0x0 0x44
+						0x1 0x68 0x2 0x24 0x3 0x13>;
+				};
+			};
+		};
+
 		gcc: clock-controller@fc400000 {
 			compatible = "qcom,gcc-msm8226";
 			reg = <0xfc400000 0x4000>;
-- 
2.34.0

