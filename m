Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028C6EEB03
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 22:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728940AbfKDVXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:23:13 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:35388 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728377AbfKDVXN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:23:13 -0500
Received: from localhost.localdomain (80-110-127-196.cgn.dynamic.surfer.at [80.110.127.196])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id C497BC570F;
        Mon,  4 Nov 2019 21:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1572902591; bh=NJnSBKmA72MqyUk/PTfk9jPOk+kUpspS2ov0N6AeDl8=;
        h=From:To:Cc:Subject:Date;
        b=kNiUbnANzZ+MwV/Q9K16ALcsHLsHSuZBFX95KZ4Ln+bqm4uo3J6czW1k4vWGxlIYl
         IwtkKSX6/9CyWpZ1ULp5HrvnEQ4kKVdrlDlS9nL5WUZb48v6C3Q+s7tdOiD4/lqBbR
         Tq4BTkCSZ5QESlBOI/HmbAdhOX0itRjUtyIMS2S4=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@sonymobile.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: msm8974: Introduce the wcnss remoteproc node
Date:   Mon,  4 Nov 2019 22:23:01 +0100
Message-Id: <20191104212302.105469-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 66 ++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 9a84eb0cbbe6..f8f02342c53d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -30,7 +30,7 @@
 			no-map;
 		};
 
-		reserved@d200000 {
+		wcnss_region: wcnss@d200000 {
 			reg = <0x0d200000 0xa00000>;
 			no-map;
 		};
@@ -795,6 +795,70 @@
 			clock-names = "core";
 		};
 
+		pronto: remoteproc@fb21b000 {
+			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
+			reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
+			reg-names = "ccu", "dxe", "pmu";
+
+			memory-region = <&wcnss_region>;
+
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+			vddpx-supply = <&pm8941_s3>;
+
+			qcom,smem-states = <&wcnss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			iris {
+				compatible = "qcom,wcn3680";
+
+				clocks = <&rpmcc RPM_SMD_CXO_A2>;
+				clock-names = "xo";
+
+				vddxo-supply = <&pm8941_l6>;
+				vddrfa-supply = <&pm8941_l11>;
+				vddpa-supply = <&pm8941_l19>;
+				vdddig-supply = <&pm8941_s3>;
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,ipc = <&apcs 8 17>;
+				qcom,smd-edge = <6>;
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+					status = "disabled";
+
+					qcom,mmio = <&pronto>;
+
+					bt {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
+							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>, <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable", "tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		msmgpio: pinctrl@fd510000 {
 			compatible = "qcom,msm8974-pinctrl";
 			reg = <0xfd510000 0x4000>;
-- 
2.23.0

