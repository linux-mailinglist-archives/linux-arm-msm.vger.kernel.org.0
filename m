Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48ACDFCC42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKNR4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:56:53 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:53100 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbfKNR4x (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:56:53 -0500
Received: from localhost.localdomain (unknown [10.0.11.2])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 327F2C9911;
        Thu, 14 Nov 2019 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1573754210; bh=xKF5IEKM8Xl2wXlayf1TOim4t3nqonKziZ/IAPjsGm0=;
        h=From:To:Cc:Subject:Date;
        b=LdCERzXgaDHPeTxRkGC4jw4zaAzmgdzHbziWvmoPyTY9Ya1JKDpdhrqxnuo3ww68K
         bqNviie877BsUOwILNjwHBkmgAMYEFvPCd8sitnkgWm9w91XgwwJeKQKOzqrkE9e4H
         NwlU9heD2/bhoDEKaPxIFc6AO04sOVxmo/C6rEsQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: msm8974: Add modem remoteproc node
Date:   Thu, 14 Nov 2019 18:53:48 +0100
Message-Id: <20191114175348.288976-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

Add the remoteproc node for the modem on msm8974.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
[luca@z3ntu.xyz: cleanups, add label to smd-edge node]
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Note: This patch needs "remoteproc: qcom_q6v5_mss: Validate each segment
during loading" from the mailing list to be functional.

 arch/arm/boot/dts/qcom-msm8974.dtsi | 63 ++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 6f24dc9a7924..b357cb51c0fb 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -21,12 +21,12 @@ reserved-memory {
 		#size-cells = <1>;
 		ranges;
 
-		mpss@8000000 {
+		mpss_region: mpss@8000000 {
 			reg = <0x08000000 0x5100000>;
 			no-map;
 		};
 
-		mba@d100000 {
+		mba_region: mba@d100000 {
 			reg = <0x0d100000 0x100000>;
 			no-map;
 		};
@@ -62,8 +62,11 @@ rfsa@fd60000 {
 		};
 
 		rmtfs@fd80000 {
+			compatible = "qcom,rmtfs-mem";
 			reg = <0x0fd80000 0x180000>;
 			no-map;
+
+			qcom,client-id = <1>;
 		};
 	};
 
@@ -807,6 +810,55 @@ rng@f9bff000 {
 			clock-names = "core";
 		};
 
+		remoteproc@fc880000 {
+			compatible = "qcom,msm8974-mss-pil";
+			reg = <0xfc880000 0x100>, <0xfc820000 0x020>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended = <&intc GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
+
+			clocks = <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
+				 <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&xo_board>;
+			clock-names = "iface", "bus", "mem", "xo";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			cx-supply = <&pm8841_s2>;
+			mss-supply = <&pm8841_s3>;
+			mx-supply = <&pm8841_s1>;
+			pll-supply = <&pm8941_l12>;
+
+			qcom,halt-regs = <&tcsr_mutex_block 0x1180 0x1200 0x1280>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			mba {
+				memory-region = <&mba_region>;
+			};
+
+			mpss {
+				memory-region = <&mpss_region>;
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
+
+				qcom,ipc = <&apcs 8 12>;
+				qcom,smd-edge = <0>;
+
+				label = "modem";
+			};
+		};
+
 		pronto: remoteproc@fb21b000 {
 			compatible = "qcom,pronto-v2-pil", "qcom,pronto";
 			reg = <0xfb204000 0x2000>, <0xfb202000 0x1000>, <0xfb21b000 0x3000>;
@@ -1524,13 +1576,6 @@ adsp {
 			qcom,smd-edge = <1>;
 		};
 
-		modem {
-			interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
-
-			qcom,ipc = <&apcs 8 12>;
-			qcom,smd-edge = <0>;
-		};
-
 		rpm {
 			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
 			qcom,ipc = <&apcs 8 0>;
-- 
2.24.0

