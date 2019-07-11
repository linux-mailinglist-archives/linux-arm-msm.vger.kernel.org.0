Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF3BD65ADE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 17:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbfGKPsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 11:48:20 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:25150 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726833AbfGKPrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 11:47:52 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Jul 2019 11:47:41 EDT
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jul 2019 21:11:33 +0530
X-IronPort-AV: E=McAfee;i="6000,8403,9314"; a="10317409"
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Jul 2019 21:11:11 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 7699335D4; Thu, 11 Jul 2019 21:11:09 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, david.brown@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, ohad@wizery.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 12/12] arm64: dts: qcom: Enable Q6v5 WCSS for ipq8074 SoC
Date:   Thu, 11 Jul 2019 21:11:08 +0530
Message-Id: <1562859668-14209-13-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
References: <1562859668-14209-1-git-send-email-gokulsri@codeaurora.org>
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
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 125 ++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 6a61a63..c24e3f6 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -10,6 +10,22 @@
 	model = "Qualcomm Technologies, Inc. IPQ8074";
 	compatible = "qcom,ipq8074";
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_region:smem@4ab00000 {
+			no-map;
+			reg = <0x0 0x4ab00000 0x0 0x00100000>;
+		};
+
+		q6_region: q6@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x05f00000>;
+		};
+	};
+
 	firmware {
 		scm {
 			compatible = "qcom,scm-ipq8074", "qcom,scm";
@@ -431,6 +447,115 @@
 				      "axi_m_sticky";
 			status = "disabled";
 		};
+		apcs: syscon@b111000 {
+			compatible = "syscon";
+			reg = <0x0B111000 0x1000>;
+		};
+
+		wcss: smp2p-wcss {
+			compatible = "qcom,smp2p";
+			qcom,smem = <435>, <428>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <0 322 1>;
+
+			qcom,ipc = <&apcs 8 9>;
+
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <1>;
+
+			wcss_smp2p_out: master-kernel {
+				qcom,entry-name = "master-kernel";
+				qcom,smp2p-feature-ssr-ack;
+				#qcom,smem-state-cells = <1>;
+			};
+
+			wcss_smp2p_in: slave-kernel {
+				qcom,entry-name = "slave-kernel";
+
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+		};
+
+		tcsr_q6_block: syscon@1945000 {
+			compatible = "syscon";
+			reg = <0x1945000 0xE000>;
+		};
+
+		tcsr_mutex_block: syscon@193d000 {
+			compatible = "syscon";
+			reg = <0x1905000 0x8000>;
+		};
+
+		tcsr_mutex: hwlock@193d000 {
+			compatible = "qcom,tcsr-mutex";
+			syscon = <&tcsr_mutex_block 0 0x80>;
+			#hwlock-cells = <1>;
+		};
+
+		smem: qcom,smem@4AB00000 {
+			compatible = "qcom,smem";
+			memory-region = <&smem_region>;
+			hwlocks = <&tcsr_mutex 0>;
+		};
+
+		apcs_glb: mailbox@b111000 {
+			compatible = "qcom,ipq8074-apcs-apps-global";
+			reg = <0xb111000 0x1000>;
+
+			#mbox-cells = <1>;
+		};
+
+		q6v5_wcss: q6v5_wcss@CD00000 {
+			compatible = "qcom,ipq8074-wcss-pil";
+			reg = <0xCD00000 0x4040>,
+			      <0x4AB000 0x20>;
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
+			qcom,halt-regs = <&tcsr_q6_block 0xA000 0xD000 0x0>;
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
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

