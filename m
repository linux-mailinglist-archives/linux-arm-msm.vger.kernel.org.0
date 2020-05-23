Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093D71DF77B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2020 15:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387835AbgEWNWA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 09:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbgEWNV7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 09:21:59 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23243C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 06:21:59 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id g185so13453008qke.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 06:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NriQff9AgKxdUarGzsqxI0QN7FOFAUonXVTNoerbyfg=;
        b=Qiq6hMuYZu5ny2lYUC55qCg+heAimrNYCNz01pJCQe1FdKjvWPWK4nEwq/a+TPPP+6
         X72qKQlQaObUxNxpegOW9ILySNpBAYj17DU+px1Pn/RH3AE7yXFtAOIcXRlZlnaciqSW
         dsAgVXYSc1FVcuJWY3fqv+SjQCWx2dVimdvSv3KvZuZ7Y7zMbbu5aThyHwkPuWX1guQS
         OYlKMp8B+ZG8epm5BvwUo1jWkpxflbOxqlQzFX3uk69eT2SW4HBdoDFC6Dya8FLgGEDY
         +OKZ4BakF/D8hX44rZb/wO6M418klmuC6H3zh6OL1rQVjHque1CysuIyUTzWshRn6LwX
         zRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NriQff9AgKxdUarGzsqxI0QN7FOFAUonXVTNoerbyfg=;
        b=VCOAW5F1f39gpbWJoevtlCppz6YNJ9ARHT1o/xm/FZWHe8gHAXg+h02U/PHXI5erN7
         j4ECxWSJKoIMDldFkH2V43IWb6TQo9fcNfSwPrZPSf0onUd71GbFDNSHYDM8GO933lNx
         6bjEeSyt8PP7v9OYqn0/+7fm+B+lL2DsjjR0fgi3QGRJdxmNBYokVOMUoomf3Z7IYtO+
         jegOrx5fiPL5PZ1y5o+yNKMkbhBoVKIG4GkOufbqBHJgOQeE2ZyYO2gU+Y71BLRmJZ4n
         jqsZr8mGZ8/UI5yM0wRMQq0KnTaTsRWU9KlRRMbr7PEGyVJQBRm170/ORKw2bvHzUcpl
         pqrg==
X-Gm-Message-State: AOAM533AMpFhwdEQ6pckGkhsfVrw8U9qwYR5hCfj/xPvwJ1kZ9X+OmZ3
        XKOWP7fR5X7aFwUI6F3Id/1lCf3wmTc=
X-Google-Smtp-Source: ABdhPJx+FYEedKTAO0RlHeERzbn+7D9rR9PS5kRzrV1ranVxkUy98fYMTXwdSxjjOpT/vJslWQ1lpA==
X-Received: by 2002:a37:6490:: with SMTP id y138mr19872837qkb.32.1590240117987;
        Sat, 23 May 2020 06:21:57 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 10sm4328387qkv.136.2020.05.23.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 06:21:57 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: sm8250: sort nodes by physical address
Date:   Sat, 23 May 2020 09:22:22 -0400
Message-Id: <20200523132223.31108-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Other dts have nodes sorted by physical address, be consistent with that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 176 +++++++++++++--------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index a273b99bf1e6..bc8a14df60e5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -379,6 +379,12 @@ ufs_mem_phy_lanes: lanes@1d87400 {
 			};
 		};
 
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x40000>;
+			#hwlock-cells = <1>;
+		};
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8250-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -559,15 +565,6 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
-		intc: interrupt-controller@17a00000 {
-			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			interrupt-controller;
-			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
-		};
-
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8250-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -596,85 +593,6 @@ spmi_bus: qcom,spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
-		apps_rsc: rsc@18200000 {
-			label = "apps_rsc";
-			compatible = "qcom,rpmh-rsc";
-			reg = <0x0 0x18200000 0x0 0x10000>,
-				<0x0 0x18210000 0x0 0x10000>,
-				<0x0 0x18220000 0x0 0x10000>;
-			reg-names = "drv-0", "drv-1", "drv-2";
-			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,tcs-offset = <0xd00>;
-			qcom,drv-id = <2>;
-			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
-					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
-
-			rpmhcc: clock-controller {
-				compatible = "qcom,sm8250-rpmh-clk";
-				#clock-cells = <1>;
-				clock-names = "xo";
-				clocks = <&xo_board>;
-			};
-
-			rpmhpd: power-controller {
-				compatible = "qcom,sm8250-rpmhpd";
-				#power-domain-cells = <1>;
-				operating-points-v2 = <&rpmhpd_opp_table>;
-
-				rpmhpd_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					rpmhpd_opp_ret: opp1 {
-						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
-					};
-
-					rpmhpd_opp_min_svs: opp2 {
-						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
-					};
-
-					rpmhpd_opp_low_svs: opp3 {
-						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
-					};
-
-					rpmhpd_opp_svs: opp4 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
-					};
-
-					rpmhpd_opp_svs_l1: opp5 {
-						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
-					};
-
-					rpmhpd_opp_nom: opp6 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
-					};
-
-					rpmhpd_opp_nom_l1: opp7 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
-					};
-
-					rpmhpd_opp_nom_l2: opp8 {
-						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
-					};
-
-					rpmhpd_opp_turbo: opp9 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
-					};
-
-					rpmhpd_opp_turbo_l1: opp10 {
-						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
-					};
-				};
-			};
-		};
-
-		tcsr_mutex: hwlock@1f40000 {
-			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01f40000 0x0 0x40000>;
-			#hwlock-cells = <1>;
-		};
-
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm8250-pinctrl";
 			reg = <0 0x0f100000 0 0x300000>,
@@ -690,6 +608,15 @@ tlmm: pinctrl@f100000 {
 			wakeup-parent = <&pdc>;
 		};
 
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
+			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		timer@17c20000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -749,6 +676,79 @@ frame@17c2d000 {
 			};
 		};
 
+		apps_rsc: rsc@18200000 {
+			label = "apps_rsc";
+			compatible = "qcom,rpmh-rsc";
+			reg = <0x0 0x18200000 0x0 0x10000>,
+				<0x0 0x18210000 0x0 0x10000>,
+				<0x0 0x18220000 0x0 0x10000>;
+			reg-names = "drv-0", "drv-1", "drv-2";
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,tcs-offset = <0xd00>;
+			qcom,drv-id = <2>;
+			qcom,tcs-config = <ACTIVE_TCS  2>, <SLEEP_TCS   3>,
+					  <WAKE_TCS    3>, <CONTROL_TCS 1>;
+
+			rpmhcc: clock-controller {
+				compatible = "qcom,sm8250-rpmh-clk";
+				#clock-cells = <1>;
+				clock-names = "xo";
+				clocks = <&xo_board>;
+			};
+
+			rpmhpd: power-controller {
+				compatible = "qcom,sm8250-rpmhpd";
+				#power-domain-cells = <1>;
+				operating-points-v2 = <&rpmhpd_opp_table>;
+
+				rpmhpd_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					rpmhpd_opp_ret: opp1 {
+						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
+					};
+
+					rpmhpd_opp_min_svs: opp2 {
+						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
+					};
+
+					rpmhpd_opp_low_svs: opp3 {
+						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					};
+
+					rpmhpd_opp_svs: opp4 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					};
+
+					rpmhpd_opp_svs_l1: opp5 {
+						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					};
+
+					rpmhpd_opp_nom: opp6 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					};
+
+					rpmhpd_opp_nom_l1: opp7 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					};
+
+					rpmhpd_opp_nom_l2: opp8 {
+						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
+					};
+
+					rpmhpd_opp_turbo: opp9 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					};
+
+					rpmhpd_opp_turbo_l1: opp10 {
+						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					};
+				};
+			};
+		};
+
 		cpufreq_hw: cpufreq@18591000 {
 			compatible = "qcom,cpufreq-hw";
 			reg = <0 0x18591000 0 0x1000>,
-- 
2.26.1

