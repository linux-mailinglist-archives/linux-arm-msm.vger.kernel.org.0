Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D06E129076
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 01:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfLWA13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Dec 2019 19:27:29 -0500
Received: from titan.ufpe.br ([150.161.6.80]:38922 "EHLO canit.ufpe.br"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfLWA13 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Dec 2019 19:27:29 -0500
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by canit.ufpe.br (8.14.4/8.14.4/Debian-4) with ESMTP id xBN0RIAh001851
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 22 Dec 2019 21:27:19 -0300
Received: from localhost (localhost [127.0.0.1])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 0639DD82FD5F;
        Sun, 22 Dec 2019 21:27:17 -0300 (-03)
X-Virus-Scanned: amavisd-new at ufpe.br
Received: from zimbraufpe.ufpe.br ([127.0.0.1])
        by localhost (zimbraufpe.ufpe.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id u4YLNDBI6u0w; Sun, 22 Dec 2019 21:27:16 -0300 (-03)
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id C933A9BB72C;
        Sun, 22 Dec 2019 21:27:16 -0300 (-03)
Date:   Sun, 22 Dec 2019 21:27:16 -0300 (BRT)
From:   Victhor Foster <victhor.foster@ufpe.br>
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc:     agross <agross@kernel.org>, robh+dt <robh+dt@kernel.org>,
        mark rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>
Message-ID: <1238987932.9511963.1577060836760.JavaMail.zimbra@ufpe.br>
In-Reply-To: <1723137502.9510958.1577059595123.JavaMail.zimbra@ufpe.br>
References: <1723137502.9510958.1577059595123.JavaMail.zimbra@ufpe.br>
Subject: [PATCH] arm: dts: apq8084: Remove all instances of IRQ_TYPE_NONE
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [179.235.209.15]
X-Mailer: Zimbra 8.8.7_GA_1964 (ZimbraWebClient - GC78 (Linux)/8.8.7_GA_1964)
Thread-Topic: apq8084: Remove all instances of IRQ_TYPE_NONE
Thread-Index: KV3Q/nKlDWLtr+JlNMIXgjLoSCYEOgb5kfYl
X-Bayes-Prob: 0.5 (Score 0: No Bayes scoring rules defined, tokens from: SAIDA)
X-Spam-Score: 0.00 () [Hold at 10.00] 
X-CanIt-Incident-Id: 011FcrjTe
X-CanIt-Geo: ip=150.161.6.73; country=BR; region=Pernambuco; city=Recife; latitude=-8.05; longitude=-34.9000; http://maps.google.com/maps?q=-8.05,-34.9000&z=6
X-CanItPRO-Stream: SAIDA
X-Canit-Stats-ID: 011FcrjTe - c82d75c3f711 - 20191222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ufpe.br; h=date:from:to
        :cc:message-id:in-reply-to:references:subject:mime-version
        :content-type:content-transfer-encoding; s=ufpe201801; bh=7PrNdj
        68qFHSDDY2MisCpfltan1ivX5Ga3MI56Yuxls=; b=E0s1JNiEqMUaezN2YzLIgp
        5Mwlg16XDrkTWNbN8xQ1A13/HprYakeJVatH7oDyb++lF6sG/jr7DcWiqxfGcov5
        6xC9cT1XbjB2eguGN69dkhCyyqdQWUZOX4lNQujyoYTcnwl9P8LprdNWEkm55HCj
        V25la1dmV7wb7nYXkc4gA5weFPWpM1S02lx9dlxUBSBizLYNW5uF1CIQ1c4yUgED
        WxGkN48Yd6ul5GRTt5kTWerBWFQmwN6akEQnbg6QgRU3YZg1SDPT+i6OOZJy8bT4
        RZHEqOvzDLmSHq3Awox2dRCOsRRDGFBfJpXYO3VL8I2ICpi+t/BSqEikdi9E2vbw
        ==
X-Scanned-By: CanIt (www . roaringpenguin . com) on 150.161.6.80
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch removes all instances of IRQ_TYPE_NONE, which fixes warning messages during boot. It also changes interrupt types to their corresponding macros, as defined in arm-gic.h.

Signed-off by: Victhor Foster <victhor.foster@ufpe.br>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 40 ++++++++++++++---------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 0a0fb147ebb9..1724a87afc4f 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-apq8084.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -184,7 +185,7 @@ cpu_crit3: trip1 {
 
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
-		interrupts = <1 7 0xf04>;
+		interrupts = <GIC_PPI 7 0xf04>;
 	};
 
 	clocks {
@@ -203,10 +204,10 @@ sleep_clk: sleep_clk {
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupts = <1 2 0xf08>,
-			     <1 3 0xf08>,
-			     <1 4 0xf08>,
-			     <1 1 0xf08>;
+		interrupts = <GIC_PPI 2 0xf08>,
+			     <GIC_PPI 3 0xf08>,
+			     <GIC_PPI 4 0xf08>,
+			     <GIC_PPI 1 0xf08>;
 		clock-frequency = <19200000>;
 	};
 
@@ -258,7 +259,6 @@ tsens: thermal-sensor@fc4a8000 {
 			nvmem-cell-names = "calib", "calib_backup";
 			#thermal-sensor-cells = <1>;
 		};
-
 		timer@f9020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -269,50 +269,50 @@ timer@f9020000 {
 
 			frame@f9021000 {
 				frame-number = <0>;
-				interrupts = <0 8 0x4>,
-					     <0 7 0x4>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9021000 0x1000>,
 				      <0xf9022000 0x1000>;
 			};
 
 			frame@f9023000 {
 				frame-number = <1>;
-				interrupts = <0 9 0x4>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9023000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f9024000 {
 				frame-number = <2>;
-				interrupts = <0 10 0x4>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9024000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f9025000 {
 				frame-number = <3>;
-				interrupts = <0 11 0x4>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9025000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f9026000 {
 				frame-number = <4>;
-				interrupts = <0 12 0x4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9026000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f9027000 {
 				frame-number = <5>;
-				interrupts = <0 13 0x4>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9027000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@f9028000 {
 				frame-number = <6>;
-				interrupts = <0 14 0x4>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xf9028000 0x1000>;
 				status = "disabled";
 			};
@@ -404,13 +404,13 @@ tlmm: pinctrl@fd510000 {
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			interrupts = <0 208 0>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		blsp2_uart2: serial@f995e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf995e000 0x1000>;
-			interrupts = <0 114 0x0>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
 			clock-names = "core", "iface";
 			status = "disabled";
@@ -420,7 +420,7 @@ sdhci@f9824900 {
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
-			interrupts = <0 123 0>, <0 138 0>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&gcc GCC_SDCC1_AHB_CLK>,
@@ -433,7 +433,7 @@ sdhci@f98a4900 {
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
-			interrupts = <0 125 0>, <0 221 0>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&gcc GCC_SDCC2_AHB_CLK>,
@@ -449,7 +449,7 @@ spmi_bus: spmi@fc4cf000 {
 			      <0xfc4cb000 0x1000>,
 			      <0xfc4ca000 0x1000>;
 			interrupt-names = "periph_irq";
-			interrupts = <0 190 0>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
 			#address-cells = <2>;
@@ -463,7 +463,7 @@ smd {
 		compatible = "qcom,smd";
 
 		rpm {
-			interrupts = <0 168 1>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
 
-- 
2.24.0
