Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F26B269F5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgIOHNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:23 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:22807 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgIOHNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153981;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iDdi+0RQFOvPN4WaLYZZixvScOXt7T/qDYsBIcibmLw=;
        b=jDxlK4YL22GX5l1bn4denqm8sNIQd8wF9uO8npCM0ilTA7N0qRN70NAYSQ8V3yQ3lL
        L7s164PBOSazIRTovymrNB7tGweyMY5aP3Fi1gRM+K2ty2r5dtADvT1tra2HmZ9WEcxI
        pAs/v7vutZWY49aaarNoZ6ugDMwhvJVHZPRhzYPE4OEIUAhw/oKLXTJiYKHhx7hXoyD5
        9HcsVIb2U1IpKo2s7D192xBBY6gZFG/udPQox26el8wM+yvMGo0I+66Z5zsllqhHXXSG
        c+olpKW/Fn/07pcse/6QjI5qTGmLZrayC4n4z8an3qwzZPKWaEcS5C5cEnnfUbhRNtoF
        ZnFQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7Cxrds
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:12:59 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 05/14] arm64: dts: qcom: msm8916: Use IRQ defines, add IRQ types
Date:   Tue, 15 Sep 2020 09:12:12 +0200
Message-Id: <20200915071221.72895-6-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dt-bindings/interrupt-controller/arm-gic.h has a GIC_SPI define
that allows specifying interrupts more clearly, but right now only
some device nodes in msm8916.dtsi make use of it.
Convert all others to use it.

The same applies to the IRQ_TYPE_* defines in
dt-bindings/interrupt-controller/irq.h. Some interrupts were defined
with raw numbers, or even with IRQ_TYPE_NONE (0).
Convert all these to use appropriate IRQ types.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 38 ++++++++++++++-------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 1f9a24a2464e..003451ccf3ee 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -737,7 +737,7 @@ lpass: lpass@7708000 {
 					"mi2s-bit-clk3";
 			#sound-dai-cells = <1>;
 
-			interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "lpass-irq-lpaif";
 			reg = <0x07708000 0x10000>;
 			reg-names = "lpass-lpaif";
@@ -760,7 +760,8 @@ sdhc_1: sdhci@7824000 {
 			reg = <0x07824900 0x11c>, <0x07824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-			interrupts = <0 123 IRQ_TYPE_LEVEL_HIGH>, <0 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&gcc GCC_SDCC1_AHB_CLK>,
@@ -777,7 +778,8 @@ sdhc_2: sdhci@7864000 {
 			reg = <0x07864900 0x11c>, <0x07864000 0x800>;
 			reg-names = "hc_mem", "core_mem";
 
-			interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>, <0 221 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&gcc GCC_SDCC2_AHB_CLK>,
@@ -1053,7 +1055,7 @@ mdss: mdss@1a00000 {
 				      "bus",
 				      "vsync";
 
-			interrupts = <0 72 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 
 			interrupt-controller;
 			#interrupt-cells = <1>;
@@ -1170,11 +1172,11 @@ mpss: hexagon@4080000 {
 
 			reg-names = "qdsp6", "rmb";
 
-			interrupts-extended = <&intc 0 24 1>,
-					      <&hexagon_smp2p_in 0 0>,
-					      <&hexagon_smp2p_in 1 0>,
-					      <&hexagon_smp2p_in 2 0>,
-					      <&hexagon_smp2p_in 3 0>;
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&hexagon_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
@@ -1203,7 +1205,7 @@ mpss {
 			};
 
 			smd-edge {
-				interrupts = <0 25 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
 
 				qcom,smd-edge = <0>;
 				qcom,ipc = <&apcs 8 12>;
@@ -1234,7 +1236,7 @@ pronto: wcnss@a21b000 {
 
 			memory-region = <&wcnss_mem>;
 
-			interrupts-extended = <&intc 0 149 IRQ_TYPE_EDGE_RISING>,
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
 					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
 					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
 					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
@@ -1257,7 +1259,7 @@ iris {
 			};
 
 			smd-edge {
-				interrupts = <0 142 1>;
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
 
 				qcom,ipc = <&apcs 8 17>;
 				qcom,smd-edge = <6>;
@@ -1278,8 +1280,8 @@ bt {
 					wifi {
 						compatible = "qcom,wcnss-wlan";
 
-						interrupts = <0 145 IRQ_TYPE_LEVEL_HIGH>,
-							     <0 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
 						interrupt-names = "tx", "rx";
 
 						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
@@ -1836,7 +1838,7 @@ hexagon-smp2p {
 		compatible = "qcom,smp2p";
 		qcom,smem = <435>, <428>;
 
-		interrupts = <0 27 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
 
 		qcom,ipc = <&apcs 8 14>;
 
@@ -1861,7 +1863,7 @@ wcnss-smp2p {
 		compatible = "qcom,smp2p";
 		qcom,smem = <451>, <431>;
 
-		interrupts = <0 143 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
 
 		qcom,ipc = <&apcs 8 18>;
 
@@ -1899,7 +1901,7 @@ apps_smsm: apps@0 {
 
 		hexagon_smsm: hexagon@1 {
 			reg = <1>;
-			interrupts = <0 26 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -1907,7 +1909,7 @@ hexagon_smsm: hexagon@1 {
 
 		wcnss_smsm: wcnss@6 {
 			reg = <6>;
-			interrupts = <0 144 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
 
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.28.0

