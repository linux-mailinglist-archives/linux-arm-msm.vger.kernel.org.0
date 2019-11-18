Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C700100E2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 22:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727509AbfKRVoZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 16:44:25 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:43772
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727483AbfKRVoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 16:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574113464;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=EApMqFSlr2CgiFKu9e792fHKZ6ZnZDQ4cc6QWrbMwFA=;
        b=WqhCn4Yc1sIOR289nh3bzzbTiFaQkeIPcG4x5YH9Rg5MQBcjoXFrJLeCCv7uuv+V
        AB+/gz13ip3Es1cLxWCBOgMbx+pTtlDiLAYVk4AUL5dobQdUyXza54+J+E3rsCVGlqV
        Oelb9V7YJkCXmvgEL01KZ68c4NDboRCeryGjdc0c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574113464;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=EApMqFSlr2CgiFKu9e792fHKZ6ZnZDQ4cc6QWrbMwFA=;
        b=cvi6wA795CW579DjCbSzDeCXtFUt6T/p6T5QVCNLC9HjY1wSOZYV2VVXLDQ9ocOV
        92/QntfZqDuGR29HDO0aJVMtqJbbg+4K2dnQQIEX7JsydjQZylPC0V0vOlH4hSTM+1g
        ANy7lXA6Ab0WnCtFh+E92FNNKwB+ujmHvnt1FenM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9B197C38675
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, jhugo@codeaurora.org,
        robh+dt@kernel.org, jonathan@marek.ca
Cc:     ohad@wizery.com, mark.rutland@arm.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 16/16] arm64: dts: qcom: sm8150: Add ADSP, CDSP, MPSS and SLPI remoteprocs
Date:   Mon, 18 Nov 2019 21:44:23 +0000
Message-ID: <0101016e80794e1d-7c9ce825-6ba5-479e-bc98-f5d56ce6933f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118214250.14002-1-sibis@codeaurora.org>
References: <20191118214250.14002-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ADSP, CDSP, MPSS and SLPI device tree nodes for SM8150 SoC.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts |  12 +++
 arch/arm64/boot/dts/qcom/sm8150.dtsi    | 135 ++++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index aa5de42fcae45..4d9bb8145dbba 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -348,6 +348,18 @@
 	};
 };
 
+&adsp_pas {
+	status = "okay";
+};
+
+&cdsp_pas {
+	status = "okay";
+};
+
+&slpi_pas {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 98a96fd1d6117..58f4ce95bd966 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -5,6 +5,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sm8150.h>
+#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -278,6 +280,139 @@
 		};
 	};
 
+	adsp_pas: remoteproc-adsp {
+		compatible = "qcom,sm8150-adsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 162 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&adsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_LPASS>,
+				<&rpmhpd SM8150_CX>;
+		power-domain-names = "load_state", "cx";
+
+		memory-region = <&adsp_mem>;
+
+		qcom,smem-states = <&adsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 156 IRQ_TYPE_EDGE_RISING>;
+			label = "lpass";
+			qcom,remote-pid = <2>;
+			mboxes = <&apss_shared 8>;
+		};
+	};
+
+	cdsp_pas: remoteproc-cdsp {
+		compatible = "qcom,sm8150-cdsp-pas";
+
+		interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_CDSP>,
+				<&rpmhpd SM8150_CX>;
+		power-domain-names = "load_state", "cx";
+
+		memory-region = <&cdsp_mem>;
+
+		qcom,smem-states = <&cdsp_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 574 IRQ_TYPE_EDGE_RISING>;
+			label = "cdsp";
+			qcom,remote-pid = <5>;
+			mboxes = <&apss_shared 4>;
+		};
+	};
+
+	mpss_pas: remoteproc-mpss {
+		compatible = "qcom,sm8150-mpss-pas";
+
+		interrupts-extended = <&intc GIC_SPI 266 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+				      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready", "handover",
+				  "stop-ack", "shutdown-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+				<&rpmhpd SM8150_CX>,
+				<&rpmhpd SM8150_MSS>;
+		power-domain-names = "load_state", "cx", "mss";
+
+		memory-region = <&mpss_mem>;
+
+		qcom,smem-states = <&modem_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		glink-edge {
+			interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			label = "modem";
+			qcom,remote-pid = <1>;
+			mboxes = <&apss_shared 12>;
+		};
+	};
+
+	slpi_pas: remoteproc-slpi {
+		compatible = "qcom,sm8150-slpi-pas";
+
+		interrupts-extended = <&intc GIC_SPI 494 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+				      <&slpi_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "wdog", "fatal", "ready",
+				  "handover", "stop-ack";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>;
+		clock-names = "xo";
+
+		power-domains = <&aoss_qmp AOSS_QMP_LS_SLPI>,
+				<&rpmhpd SM8150_LCX>,
+				<&rpmhpd SM8150_LMX>;
+		power-domain-names = "load_state", "lcx", "lmx";
+
+		memory-region = <&slpi_mem>;
+
+		qcom,smem-states = <&slpi_smp2p_out 0>;
+		qcom,smem-state-names = "stop";
+
+		status = "disabled";
+
+		glink-edge {
+			interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>;
+			label = "dsps";
+			qcom,remote-pid = <3>;
+			mboxes = <&apss_shared 24>;
+		};
+	};
+
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

