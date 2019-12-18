Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25625124809
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 14:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfLRNWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Dec 2019 08:22:54 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:12441 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726723AbfLRNWx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Dec 2019 08:22:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576675373; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=H4LvATnPFwxC6gr/xey+iMEVwMbJ/2ar67uFaIO6rgE=; b=vxRC8N5hoYUaLQ6YZmlTTfu2Cp/diNWsMhsa33DWdPNHTaB8c+/304KeZKF9H7ebTosbeWjJ
 tVdBx625EP6PpjL2DicUJRngbM01xsMOshV+yZ//9IUSJYFUXfksBttDppqnSGUcmvWjFJdV
 iIeECWZWqyLpY9iLMcpWi/2TKy8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfa282b.7fd316ee1e30-smtp-out-n01;
 Wed, 18 Dec 2019 13:22:51 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64FF1C4479F; Wed, 18 Dec 2019 13:22:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 97347C4479F;
        Wed, 18 Dec 2019 13:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97347C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org
Cc:     ohad@wizery.com, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 5/5] arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
Date:   Wed, 18 Dec 2019 18:52:17 +0530
Message-Id: <20191218132217.28141-6-sibis@codeaurora.org>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191218132217.28141-1-sibis@codeaurora.org>
References: <20191218132217.28141-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 124 ++++++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 6db3f9e0344d1..e87094665c52c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -312,6 +312,14 @@
 	};
 };
 
+&remoteproc_adsp {
+	status = "okay";
+};
+
+&remoteproc_slpi {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 8d799e868a5d3..014127700afb0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1075,6 +1075,61 @@
 			#interrupt-cells = <0x2>;
 		};
 
+		remoteproc_mss: remoteproc@4080000 {
+			compatible = "qcom,msm8998-mss-pil";
+			reg = <0x04080000 0x100>, <0x04180000 0x20>;
+			reg-names = "qdsp6", "rmb";
+
+			interrupts-extended =
+				<&intc GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				<&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+				 <&rpmcc RPM_SMD_QDSS_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "iface", "bus", "mem", "gpll0_mss",
+				      "snoc_axi", "mnoc_axi", "qdss", "xo";
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			resets = <&gcc GCC_MSS_RESTART>;
+			reset-names = "mss_restart";
+
+			qcom,halt-regs = <&tcsr_mutex_regs 0x23000 0x25000 0x24000>;
+
+			power-domains = <&rpmpd MSM8998_VDDCX>,
+					<&rpmpd MSM8998_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			mba {
+				memory-region = <&mba_mem>;
+			};
+
+			mpss {
+				memory-region = <&mpss_mem>;
+			};
+
+			glink-edge {
+				interrupts = <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 15>;
+			};
+		};
+
 		gpucc: clock-controller@5065000 {
 			compatible = "qcom,msm8998-gpucc";
 			#clock-cells = <1>;
@@ -1088,6 +1143,42 @@
 				      "gpll0";
 		};
 
+		remoteproc_slpi: remoteproc@5800000 {
+			compatible = "qcom,msm8998-slpi-pas";
+			reg = <0x05800000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			px-supply = <&vreg_lvs2a_1p8>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+			clock-names = "xo", "aggre2";
+
+			memory-region = <&slpi_mem>;
+
+			qcom,smem-states = <&slpi_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			power-domains = <&rpmpd MSM8998_SSCCX>;
+			power-domain-names = "ssc_cx";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "dsps";
+				qcom,remote-pid = <3>;
+				mboxes = <&apcs_glb 27>;
+			};
+		};
+
 		stm: stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x06002000 0x1000>,
@@ -1880,6 +1971,39 @@
 			#size-cells = <0>;
 		};
 
+		remoteproc_adsp: remoteproc@17300000 {
+			compatible = "qcom,msm8998-adsp-pas";
+			reg = <0x17300000 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&adsp_mem>;
+
+			qcom,smem-states = <&adsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			power-domains = <&rpmpd MSM8998_VDDCX>;
+			power-domain-names = "cx";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+				label = "lpass";
+				qcom,remote-pid = <2>;
+				mboxes = <&apcs_glb 9>;
+			};
+		};
+
 		apcs_glb: mailbox@17911000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
