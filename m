Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A71C8123B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 01:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfLRABJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 19:01:09 -0500
Received: from canit.ufpe.br ([150.161.6.80]:34939 "EHLO canit.ufpe.br"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbfLRABJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 19:01:09 -0500
X-Greylist: delayed 492 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 19:01:06 EST
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by canit.ufpe.br (8.14.4/8.14.4/Debian-4) with ESMTP id xBHNqf4u025623
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 17 Dec 2019 20:52:41 -0300
Received: from localhost (localhost [127.0.0.1])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id 07256217DF90;
        Tue, 17 Dec 2019 20:52:40 -0300 (-03)
X-Virus-Scanned: amavisd-new at ufpe.br
Received: from zimbraufpe.ufpe.br ([127.0.0.1])
        by localhost (zimbraufpe.ufpe.br [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vUMZnuuagQB9; Tue, 17 Dec 2019 20:52:39 -0300 (-03)
Received: from zimbraufpe.ufpe.br (zimbraufpe.ufpe.br [150.161.6.73])
        by zimbraufpe.ufpe.br (Postfix) with ESMTP id D7DDD1DAB14A;
        Tue, 17 Dec 2019 20:52:39 -0300 (-03)
Date:   Tue, 17 Dec 2019 20:52:39 -0300 (BRT)
From:   Victhor Foster <victhor.foster@ufpe.br>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Message-ID: <587764682.8806511.1576626759806.JavaMail.zimbra@ufpe.br>
Subject: [PATCH] arm: dts: apq8084: Fix tsens kernel panic during boot and
 kernel warnings due to IRQ_TYPE_NONE interrupt type
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [179.235.209.15]
X-Mailer: Zimbra 8.8.7_GA_1964 (ZimbraWebClient - GC77 (Linux)/8.8.7_GA_1964)
Thread-Index: /k3RSfcRw/Fi5y4Cs0WsjPOH16JSXg==
Thread-Topic: apq8084: Fix tsens kernel panic during boot and kernel warnings due to IRQ_TYPE_NONE interrupt type
X-Bayes-Prob: 0.5 (Score 0: No Bayes scoring rules defined, tokens from: SAIDA)
X-Spam-Score: 0.00 () [Hold at 10.00] 
X-CanIt-Incident-Id: 011DbQFdK
X-CanIt-Geo: ip=150.161.6.73; country=BR; region=Pernambuco; city=Recife; latitude=-8.05; longitude=-34.9000; http://maps.google.com/maps?q=-8.05,-34.9000&z=6
X-CanItPRO-Stream: SAIDA
X-Canit-Stats-ID: 011DbQFdK - 5f8f2250478e - 20191217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ufpe.br; h=date:from:to
        :cc:message-id:subject:mime-version:content-type
        :content-transfer-encoding; s=ufpe201801; bh=nmvxU7S0ta+EMzDadJH
        ov2eh7MbPo9/3m6DMgCi3LPs=; b=NqKrJHMyiI+xG7rnuXXdKkvsuA5cGIhf6/e
        DXzb+NVkH76YxckdXON62VvqcaVjWgV/CFVMuEUgCpDw0ngLpnK1mDujKYrENXCq
        MyAMLh8w2GU338kUvRn5UHISZfQcaWxn94snYA+/9AlNErW5L/oa0mrq/bsal4a7
        wma7QPN+Rt/nQPMZpeCzR+IZnDi8FEUPGyLDSJebqufMK/jEWgYImX78RYUQIiqN
        FRozJ0/Nm3bex3v9YDMjqQo1fVi7A+/TwnTTfYVWbrMccBmxE3utuWvN+npC1yZM
        wNMWtLY9N4PSWlhZXbIrLflmH9oGzcgrRZfwOTWon8qzLmiJXLA==
X-Scanned-By: CanIt (www . roaringpenguin . com) on 150.161.6.80
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch fixes a kernel panic on the tsens driver that prevented APQ8084 platforms from booting, by adding a missing register property and the number of sensors, corrects all instances of IRQ_TYPE_NONE in interrupts, to avoid causing kernel warnings during boot, and also changes most interrupt properties to their respective macros, as defined by arm-gic.h.

Signed-off by: Victhor Foster <victhor.foster@ufpe.br>
---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 43 +++++++++++++++--------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 0a0fb147ebb9..dc4ea3a8dc6d 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-apq8084.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -184,7 +185,7 @@
 
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
-		interrupts = <1 7 0xf04>;
+		interrupts = <GIC_PPI 7 0xf04>;
 	};
 
 	clocks {
@@ -203,10 +204,10 @@
 
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
 
@@ -253,9 +254,11 @@
 
 		tsens: thermal-sensor@fc4a8000 {
 			compatible = "qcom,msm8974-tsens";
-			reg = <0xfc4a8000 0x2000>;
+			reg = <0xfc4a9000 0x1000>, /* TM */
+			      <0xfc4a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
 			nvmem-cell-names = "calib", "calib_backup";
+			#qcom,sensors = <11>;
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -269,50 +272,50 @@
 
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
@@ -404,13 +407,13 @@
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
@@ -420,7 +423,7 @@
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
 			reg-names = "hc_mem", "core_mem";
-			interrupts = <0 123 0>, <0 138 0>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&gcc GCC_SDCC1_AHB_CLK>,
@@ -433,7 +436,7 @@
 			compatible = "qcom,apq8084-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
 			reg-names = "hc_mem", "core_mem";
-			interrupts = <0 125 0>, <0 221 0>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
 				 <&gcc GCC_SDCC2_AHB_CLK>,
@@ -449,7 +452,7 @@
 			      <0xfc4cb000 0x1000>,
 			      <0xfc4ca000 0x1000>;
 			interrupt-names = "periph_irq";
-			interrupts = <0 190 0>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			qcom,ee = <0>;
 			qcom,channel = <0>;
 			#address-cells = <2>;
@@ -463,7 +466,7 @@
 		compatible = "qcom,smd";
 
 		rpm {
-			interrupts = <0 168 1>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
 			qcom,smd-edge = <15>;
 
--
2.24.0
