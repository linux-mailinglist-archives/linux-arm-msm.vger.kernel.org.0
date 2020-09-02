Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BEC625B21D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgIBQwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:52:54 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:47729 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgIBQwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:52:51 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8GhM-1ki9qG2hou-0148ao; Wed, 02 Sep 2020 18:52:44 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: qcom: add additional DT labels in qcom-ipq8064.dtsi
Date:   Wed,  2 Sep 2020 18:51:58 +0200
Message-Id: <20200902165159.7733-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vS8tUETFjn0IRx8x+XCStfB8ARWiO6kwPhmjzJ4J63GrHhBhPp6
 Fufc0fRol1yccyKcxDSh6+dCi84gyssTgFenSS9ho2clrRDFy4K3SJeFydhCA2ztVM0EHJf
 YYSOpASvgA47bqIJ0AEbThXvJMHuBoCs/Ia+DKx70AfPyFQbmZyNnfvDdDDP9FYawAKx1C9
 rU4AsGjE4gsJlDYNID7ZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tGraHwQjY2Q=:oYb316oOyU+0XC7vpU23FS
 5ZwwuQHslDTB5C1mfzDzv5XOlkYIIQJdce8GKIw5WGTCW4eLv6zl04O/nKNts8X0Ifel4fgAl
 Q5RSOwgScaLCWzHSk1VQkL3ywh0KCzBhfi3zoBIHa1jCrwj+tEj4wx2XIKXRv9v28/ECOmEs+
 5zcluq/unqu/6DLjxna9Et3N7Z9Ii24TzMMrHvs6kHqDByxtenZuZ5Dfto5GKxvXmrmh4cZ9W
 Ul1CiZN3A34njCaCKBCQWgwgbOI+KFSpPz3B1wyf5FC/wst64JVbOp5q/e4maQq3Y4UwvNGTf
 vUmnSnAAZYvct3OQQnv/mjg2dGht/RLryA/TfZK5KKkj3cFKJkMxHqdel8i6a5JmqAtLb1+7j
 qEz6qS8iZ/2r0gBW+yaoEiQqe4r+V2v7TKbYnPTEX4FsmXoLqYjMCHbZUpvFCAKlOW6+gQKiY
 ArjU3jCGhVjhwvNYfxWOPVPy1yZONMn8MszEbTqI9yceU5gyqcPNBP3KZavYQ3HfkczFKjgrP
 v7ceQOKBJ2ifEWbYG6mhz69qBboJKVixI2x27EB/6d7XKgckddv4FNYMujAaJxefsfPIJL7Hn
 JLWsrR4wgzjwQkvHWqtFgPDr/F7y42sRkIIC72Y8R/rVFhvvt/8kpJGTjWA3bKrTu2GmeY2jn
 wsTkfoKRBLQ/778L589cOXzRfO9b4fpu6zRn53TU10xnkI/hyXlWfkbw+HvPEoBGm2KC/Efci
 j7BUXNEKIZtXRUyW14YlcyDQefzuZddnDN4r24RMRbJ83cZr9lrHFpFrqWpgxWNiGxYJzGERd
 LlZNII9DhB7pzc9ZkNiHFVYHMCnNrH9iISFcc1sWpiv1XNzUYJGzqWDh6wjvKpGPWRcq8eksn
 Qvh+w6rRjqvpVvwAziOw==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds some additional DT labels which are handy when referring
to the nodes in derived DTS(I) files. It will also make the
definitions more consistent, e.g. by adding gsbi2_serial and
gsbi5_serial where we previously "only" had gsbi4_serial defined.

While at it, add missing spaces after some DT labels and remove one
useless empty line.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index c51481405e7f..c51f9fb4a0eb 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -20,7 +20,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
@@ -30,7 +30,7 @@
 			qcom,saw = <&saw0>;
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v1";
 			device_type = "cpu";
@@ -67,7 +67,7 @@
 			no-map;
 		};
 
-		smem@41000000 {
+		smem: smem@41000000 {
 			reg = <0x41000000 0x200000>;
 			no-map;
 		};
@@ -251,7 +251,7 @@
 
 			syscon-tcsr = <&tcsr>;
 
-			serial@12490000 {
+			gsbi2_serial: serial@12490000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x12490000 0x1000>,
 				      <0x12480000 0x1000>;
@@ -273,7 +273,6 @@
 				#address-cells = <1>;
 				#size-cells = <0>;
 			};
-
 		};
 
 		gsbi4: gsbi@16300000 {
@@ -326,7 +325,7 @@
 
 			syscon-tcsr = <&tcsr>;
 
-			serial@1a240000 {
+			gsbi5_serial: serial@1a240000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
 				reg = <0x1a240000 0x1000>,
 				      <0x1a200000 0x1000>;
@@ -397,7 +396,7 @@
 			status = "disabled";
 		};
 
-		sata@29000000 {
+		sata: sata@29000000 {
 			compatible = "qcom,ipq806x-ahci", "generic-ahci";
 			reg = <0x29000000 0x180>;
 
@@ -720,7 +719,7 @@
 			regulator-always-on;
 		};
 
-		sdcc1bam:dma@12402000 {
+		sdcc1bam: dma@12402000 {
 			compatible = "qcom,bam-v1.3.0";
 			reg = <0x12402000 0x8000>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
@@ -730,7 +729,7 @@
 			qcom,ee = <0>;
 		};
 
-		sdcc3bam:dma@12182000 {
+		sdcc3bam: dma@12182000 {
 			compatible = "qcom,bam-v1.3.0";
 			reg = <0x12182000 0x8000>;
 			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -740,13 +739,13 @@
 			qcom,ee = <0>;
 		};
 
-		amba {
+		amba: amba {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
-			sdcc@12400000 {
+			sdcc1: sdcc@12400000 {
 				status          = "disabled";
 				compatible      = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
@@ -766,7 +765,7 @@
 				dma-names = "tx", "rx";
 			};
 
-			sdcc@12180000 {
+			sdcc3: sdcc@12180000 {
 				compatible      = "arm,pl18x", "arm,primecell";
 				arm,primecell-periphid = <0x00051180>;
 				status          = "disabled";
-- 
2.20.1

