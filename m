Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71CAAB1CFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2019 14:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbfIMMDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Sep 2019 08:03:22 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:48562 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387731AbfIMMC6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Sep 2019 08:02:58 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Sep 2019 17:26:38 +0530
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Sep 2019 17:26:14 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 68D5B3734; Fri, 13 Sep 2019 17:26:12 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     gokulsri@codeaurora.org, sboyd@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        devicetree@vger.kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, ohad@wizery.com,
        robh+dt@kernel.org, sricharan@codeaurora.org,
        nprakash@codeaurora.org
Subject: [PATCH V2 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Date:   Fri, 13 Sep 2019 17:26:11 +0530
Message-Id: <1568375771-22933-13-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
References: <1568375771-22933-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable remoteproc WCSS PIL driver with glink
and ssr subdevices. Also configures shared memory
and enables smp2p and mailboxes required for IPC.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Signed-off-by: Sricharan R <sricharan@codeaurora.org>
Signed-off-by: Nikhil Prakash V <nprakash@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 126 ++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 6a61a63..0ea026e 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -10,12 +10,66 @@
 	model = "Qualcomm Technologies, Inc. IPQ8074";
 	compatible = "qcom,ipq8074";
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_region: memory@4ab00000 {
+			no-map;
+			reg = <0x0 0x4ab00000 0x0 0x00100000>;
+		};
+
+		q6_region: memory@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x05f00000>;
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-ipq8074", "qcom,scm";
 		};
 	};
 
+	tcsr_mutex: hwlock@193d000 {
+		compatible = "qcom,tcsr-mutex";
+		syscon = <&tcsr_mutex_regs 0 0x80>;
+		#hwlock-cells = <1>;
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_region>;
+		hwlocks = <&tcsr_mutex 0>;
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <0 322 1>;
+
+		qcom,ipc = <&apcs 8 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			qcom,smp2p-feature-ssr-ack;
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <0x1>;
 		#size-cells = <0x1>;
@@ -431,6 +485,78 @@
 				      "axi_m_sticky";
 			status = "disabled";
 		};
+
+		apcs: syscon@b111000 {
+			compatible = "syscon";
+			reg = <0x0b111000 0x1000>;
+		};
+
+		tcsr_q6: syscon@1945000 {
+			compatible = "syscon";
+			reg = <0x01945000 0xe000>;
+		};
+
+		tcsr_mutex_regs: syscon@193d000 {
+			compatible = "syscon";
+			reg = <0x01905000 0x8000>;
+		};
+
+		apcs_glb: mailbox@b111000 {
+			compatible = "qcom,ipq8074-apcs-apps-global";
+			reg = <0x0b111000 0x1000>;
+
+			#mbox-cells = <1>;
+		};
+
+		q6v5_wcss: q6v5_wcss@cd00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0x0cd00000 0x4040>,
+			      <0x004ab000 0x20>;
+			reg-names = "qdsp6",
+				    "rmb";
+			qca,auto-restart;
+			qca,extended-intc;
+			interrupts-extended = <&intc 0 325 1>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			resets = <&gcc GCC_WCSSAON_RESET>,
+				 <&gcc GCC_WCSS_BCR>,
+				 <&gcc GCC_WCSS_Q6_BCR>;
+
+			reset-names = "wcss_aon_reset",
+				      "wcss_reset",
+				      "wcss_q6_reset";
+
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "prng";
+
+			qcom,halt-regs = <&tcsr_q6 0xa000 0xd000 0x0>;
+
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+
+				rpm_requests {
+					qcom,glink-channels = "IPCRTR";
+				};
+			};
+		};
 	};
 
 	cpus {
-- 
1.9.1

