Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07623100E24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfKRVoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:44:18 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:43032
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727415AbfKRVoS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113457;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=MB7fOw1jm3V3y45qzIChVkt6ZFC9WhQ5Nydf6N3U80A=;
        b=oYrAutzF62MfFVk/SSBLl++/Tn9QiUCCo+3SiOp4N/NdK25Us6AXSTQtsgvh94nH
        KFOLpV4mJKgvggBHMJjrYDcfPllTOUa+xZigIeOy0l6xA9GLes9H371Kao8xc9Y5H2R
        bTgARz+MLyXD/GaZOhQbnaQ6gdkZk1/ff9IUYoas=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113457;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=MB7fOw1jm3V3y45qzIChVkt6ZFC9WhQ5Nydf6N3U80A=;
        b=O+3awHCMrS48BuhFnatXCdY+nLZAUTr+l3aaqmZau9hyGpZdGT0Ms4YDbyFf/9K9
        csZKWh3XDKFNpqYHyqycCHakmhTRopBpHTML72SISfniTCssbNHzE0jlTsNf267Sqwy
        DyaddWFCBO/lvOs5VL7wmJG0yFW+Jeh6PCumx2gw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0111BC3277C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 14/16] arm64: dts: qcom: msm8998: Add ADSP, MPSS and SLPI nodes
Date:   Mon, 18 Nov 2019 21:44:17 +0000
Message-ID: <0101016e807934fa-4da223fb-1854-4a1e-a8ee-e088129c4812-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds ADSP, MPSS and SLPI nodes for MSM8998 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |   8 ++
 arch/arm64/boot/dts/qcom/msm8998.dtsi     | 122 ++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 5f101a20a20a2..29e0c2e988e4b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -23,6 +23,14 @@
 	};
 };
 
+&adsp_pas {
+	status = "okay";
+};
+
+&slpi_pas {
+	status = "okay";
+};
+
 &blsp1_uart3 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 707673e3cf28a..dd1dc35e87b63 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -337,6 +337,73 @@
 		};
 	};
 
+	adsp_pas: remoteproc-adsp {
+		compatible = "qcom,msm8998-adsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&xo>;
+		clock-names = "xo";
+
+		memory-region = <&adsp_mem>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		power-domains = <&rpmpd MSM8998_VDDCX>;
+		power-domain-names = "cx";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
+			label = "lpass";
+			qcom,remote-pid = <2>;
+			mboxes = <&apcs_glb 9>;
+		};
+	};
+
+	slpi_pas: remoteproc-slpi {
+		compatible = "qcom,msm8998-slpi-pas";
+
+		interrupts-extended = <&intc GIC_SPI 390 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		px-supply = <&vreg_lvs2a_1p8>;
+
+		clocks = <&xo>,
+			 <&rpmcc RPM_SMD_AGGR2_NOC_CLK>;
+		clock-names = "xo", "aggre2";
+
+		memory-region = <&slpi_mem>;
+
+		qcom,smem-states = <&slpi_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		power-domains = <&rpmpd MSM8998_SSCCX>;
+		power-domain-names = "ssc_cx";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+			label = "dsps";
+			qcom,remote-pid = <3>;
+			mboxes = <&apcs_glb 27>;
+		};
+	};
+
 	tcsr_mutex: hwlock {
 		compatible = "qcom,tcsr-mutex";
 		syscon = <&tcsr_mutex_regs 0 0x1000>;
@@ -1048,6 +1115,61 @@
 			#interrupt-cells = <0x2>;
 		};
 
+		mss_pil: remoteproc@4080000 {
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
+			clocks = <&xo>,
+				 <&gcc GCC_MSS_CFG_AHB_CLK>,
+				 <&gcc GCC_BIMC_MSS_Q6_AXI_CLK>,
+				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
+				 <&gcc GCC_MSS_GPLL0_DIV_CLK_SRC>,
+				 <&gcc GCC_MSS_SNOC_AXI_CLK>,
+				 <&gcc GCC_MSS_MNOC_BIMC_AXI_CLK>,
+				 <&rpmcc RPM_SMD_QDSS_CLK>;
+			clock-names = "xo", "iface", "bus", "mem", "gpll0_mss",
+				      "snoc_axi", "mnoc_axi", "qdss";
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
 		stm: stm@6002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x06002000 0x1000>,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

