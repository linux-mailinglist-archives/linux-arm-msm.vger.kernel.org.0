Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 830E223D88C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 11:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729193AbgHFJZU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 05:25:20 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43311 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729074AbgHFJZG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 05:25:06 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 06 Aug 2020 02:24:59 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Aug 2020 02:24:57 -0700
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Aug 2020 14:54:40 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id E7BD6219E1; Thu,  6 Aug 2020 14:54:38 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH 3/3] arm64: dts: Enabled MHI device over PCIe
Date:   Thu,  6 Aug 2020 14:54:38 +0530
Message-Id: <1596705878-12385-4-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
References: <1596705878-12385-1-git-send-email-gokulsri@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled MHI device support over PCIe and added memory
reservation required for MHI enabled QCN9000 PCIe card.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 58 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi      |  8 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 0827055..d201a7b 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -24,6 +24,22 @@
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x0 0x20000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		qcn9000_pcie0: memory@50f00000 {
+			no-map;
+			reg = <0x0 0x50f00000 0x0 0x03700000>;
+		};
+
+		qcn9000_pcie1: memory@54600000 {
+			no-map;
+			reg = <0x0 0x54600000 0x0 0x03700000>;
+		};
+	};
 };
 
 &blsp1_spi1 {
@@ -74,3 +90,45 @@
 		nand-bus-width = <8>;
 	};
 };
+
+&pcie0_rp {
+	status = "ok";
+
+	mhi_0: qcom,mhi@0 {
+		reg = <0 0 0 0 0 >;
+		qrtr_instance_id = <0x20>;
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+
+		base-addr = <0x50f00000>;
+		qcom,caldb-addr = <0x53E00000>;
+		qrtr_node_id = <0x27>;
+		mhi,max-channels = <30>;
+		mhi,timeout = <10000>;
+
+		pcie0_mhi: pcie0_mhi {
+			status = "ok";
+		};
+	};
+};
+
+&pcie1_rp {
+	status = "ok";
+
+	mhi_1: qcom,mhi@1 {
+		reg = <0 0 0 0 0 >;
+		qrtr_instance_id = <0x21>;
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+
+		base-addr = <0x54600000>;
+		qcom,caldb-addr = <0x57500000>;
+		qrtr_node_id = <0x28>;
+		mhi,max-channels = <30>;
+		mhi,timeout = <10000>;
+
+		pcie1_mhi: pcie1_mhi {
+			status = "ok";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index b651345..eef47c1 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -709,6 +709,10 @@
 				      "ahb",
 				      "axi_m_sticky";
 			status = "disabled";
+
+			pcie1_rp: pcie1_rp {
+				reg = <0 0 0 0 0>;
+			};
 		};
 
 		pcie0: pci@20000000 {
@@ -779,6 +783,10 @@
 				      "axi_m_sticky",
 				      "axi_s_sticky";
 			status = "disabled";
+
+			pcie0_rp: pcie0_rp {
+				reg = <0 0 0 0 0>;
+			};
 		};
 
 		tcsr_q6: syscon@1945000 {
-- 
2.7.4

