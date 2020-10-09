Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87273288523
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 10:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732588AbgJIIXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 04:23:19 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:51591 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732337AbgJIIXT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 04:23:19 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Oct 2020 04:23:18 EDT
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Oct 2020 01:17:14 -0700
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg04-sd.qualcomm.com with ESMTP; 09 Oct 2020 01:17:11 -0700
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 380BC21C12; Fri,  9 Oct 2020 13:47:05 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     sboyd@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        manivannan.sadhasivam@linaro.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org
Cc:     sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH v4 3/3] arm64: dts: Enabled MHI device over PCIe
Date:   Fri,  9 Oct 2020 13:47:04 +0530
Message-Id: <1602231424-22288-4-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602231424-22288-1-git-send-email-gokulsri@codeaurora.org>
References: <1602231424-22288-1-git-send-email-gokulsri@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enabled MHI device support over PCIe and added memory
reservation required for MHI enabled QCN9000 PCIe card.

Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Reported-by: kbuild test robot <lkp@intel.com>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 46 ++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 0827055..1bbce2d 100644
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
@@ -45,11 +61,41 @@
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
+		};
+	};
 };
 
 &qmp_pcie_phy0 {
-- 
2.7.4

