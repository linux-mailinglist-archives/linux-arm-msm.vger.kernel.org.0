Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA67319DBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhBLL65 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:58:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:48066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230334AbhBLL5j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:57:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9464164E8E;
        Fri, 12 Feb 2021 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130953;
        bh=ewxZhv3U7pa8r7MtiCJXlh08z9muV7qnsB1Cyv07P+4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HwnTirQcV7KDoEfm0uQYDjkKH4DHKU2Yu3XEhq15IITM/FTs46cLDajlqYcynBfRQ
         lJUGHwzQ9j7viGFy1xSnqA7x2NevItGR6NREzRNuZqconJj9vmJ3VKUAZLrRdRPIxZ
         XOXeKlJjT3WSPxLqU+s/vuLPGhnRNdYNTRy1ScjypInvgKgHt3ak+s49TgyhX8sq+L
         RTx2P+TfDmCTtXomay1daCUdQcWN74eh/xrYmCz4oh9rPuwmaOl9SnqDG5A8T1GZPW
         LPOaa2xVtAZcKjsa3YCZaGQ4mwm7aMTsA2ACxKvgcMuXq99xROxv/eCpjnfg2lmqss
         pTqNcrH4xe/CA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sm8350: Add remoteprocs
Date:   Fri, 12 Feb 2021 17:25:30 +0530
Message-Id: <20210212115532.1339942-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add remoteproc nodes for the audio, compute and sensor cores, define
glink for each one.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 158 +++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 1ea72f30ea5a..6e366653eeab 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -562,6 +562,46 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		mpss: remoteproc@4080000 {
+			compatible = "qcom,sm8350-mpss-pas";
+			reg = <0x0 0x04080000 0x0 0x4040>;
+
+			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready", "handover",
+					  "stop-ack", "shutdown-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_MODEM>,
+					<&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MSS>;
+			power-domain-names = "load_state", "cx", "mss";
+
+			memory-region = <&pil_modem_mem>;
+
+			qcom,smem-states = <&smp2p_modem_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_MPSS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+				interrupts = <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+				label = "modem";
+				qcom,remote-pid = <1>;
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
@@ -824,6 +864,85 @@ ufs_mem_phy_lanes: lanes@1d87400 {
 			};
 		};
 
+		slpi: remoteproc@5c00000 {
+			compatible = "qcom,sm8350-slpi-pas";
+			reg = <0 0x05c00000 0 0x4000>;
+
+			interrupts-extended = <&pdc 9 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_slpi_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_slpi_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_SLPI>,
+					<&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "load_state", "lcx", "lmx";
+
+			memory-region = <&pil_slpi_mem>;
+
+			qcom,smem-states = <&smp2p_slpi_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_SLPI
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "slpi";
+				qcom,remote-pid = <3>;
+
+			};
+		};
+
+		cdsp: remoteproc@98900000 {
+			compatible = "qcom,sm8350-cdsp-pas";
+			reg = <0 0x098900000 0 0x1400000>;
+
+			interrupts-extended = <&intc GIC_SPI 578 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_cdsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_cdsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_CDSP>,
+					<&rpmhpd SM8350_CX>,
+					<&rpmhpd SM8350_MXC>;
+			power-domain-names = "load_state", "cx", "mxc";
+
+			memory-region = <&pil_cdsp_mem>;
+
+			qcom,smem-states = <&smp2p_cdsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_CDSP
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "cdsp";
+				qcom,remote-pid = <5>;
+			};
+		};
+
 		usb_1_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8350-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -1002,6 +1121,45 @@ usb_2_dwc3: dwc3@a800000 {
 				phy-names = "usb2-phy", "usb3-phy";
 			};
 		};
+
+		adsp: remoteproc@17300000 {
+			compatible = "qcom,sm8350-adsp-pas";
+			reg = <0 0x17300000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&aoss_qmp AOSS_QMP_LS_LPASS>,
+					<&rpmhpd SM8350_LCX>,
+					<&rpmhpd SM8350_LMX>;
+			power-domain-names = "load_state", "lcx", "lmx";
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+			};
+		};
 	};
 
 	timer {
-- 
2.26.2

