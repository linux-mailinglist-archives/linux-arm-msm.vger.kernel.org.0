Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727E1287440
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Oct 2020 14:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbgJHMcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 08:32:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56625 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbgJHMcr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 08:32:47 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Oct 2020 05:32:47 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Oct 2020 05:32:45 -0700
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 08 Oct 2020 18:02:25 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id AB1F821C0B; Thu,  8 Oct 2020 18:02:24 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v3 3/3] arm64: dts: Enabled MHI device over PCIe
Date:   Thu,  8 Oct 2020 18:02:24 +0530
Message-Id: <1602160344-19586-4-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602160344-19586-1-git-send-email-gokulsri@codeaurora.org>
References: <1602160344-19586-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled MHI device support over PCIe and added memory
reservation required for MHI enabled QCN9000 PCIe card.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 0827055..e5c1ec0 100644
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
@@ -45,11 +61,42 @@
 &pcie0 {
 	status = "ok";
 	perst-gpio = <&tlmm 58 0x1>;
+
+	pcie0_rp: pcie0_rp {
+		reg = <0 0 0 0 0>;
+
+		status = "ok";
+		mhi_0: qcom,mhi@0 {
+			reg = <0 0 0 0 0 >;
+
+			qrtr_instance_id = <0x20>;
+			base-addr = <0x50f00000>;
+			m3-dump-addr = <0x53c00000>;
+			etr-addr = <0x53d00000>;
+			qcom,caldb-addr = <0x53e00000>;
+		};
+	};
 };
 
 &pcie1 {
 	status = "ok";
 	perst-gpio = <&tlmm 61 0x1>;
+
+	pcie1_rp: pcie1_rp {
+		reg = <0 0 0 0 0>;
+
+		status = "ok";
+		mhi_1: qcom,mhi@1 {
+			reg = <0 0 0 0 0 >;
+
+			qrtr_instance_id = <0x21>;
+			base-addr = <0x54600000>;
+			m3-dump-addr = <0x57300000>;
+			etr-addr = <0x57400000>;
+			qcom,caldb-addr = <0x57500000>;
+			};
+		};
+	};
 };
 
 &qmp_pcie_phy0 {
-- 
2.7.4

