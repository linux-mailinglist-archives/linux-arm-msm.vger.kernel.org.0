Return-Path: <linux-arm-msm+bounces-47034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 045EAA2A854
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 13:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 931FC7A2D18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 12:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC88622F3B3;
	Thu,  6 Feb 2025 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CoGpF5Ln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6499622F15B;
	Thu,  6 Feb 2025 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844340; cv=none; b=cxxJX2p3fQoB7hG4MX7vPM2m25oLDUkr/jq24LW81lYbgOG/Ga46dayT4g10SLFs+UH59w/NgRb6eOij1Gd2j2Pita9Dno72QT1BTWKox+rfaK3ZUlnLo+Z8/YieF2LjEaCh5Df98Fj/Ztkne/RN6KVYmL6AeBNPVm7jO7GsfBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844340; c=relaxed/simple;
	bh=6nRg4Yz0OOoxdYFEgTJWUGI88aenea+h6vukcOlYMKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pGHmwWvk9vQaTn8U5TIDb3H2HmkN0pcZxeLbhsxjxk8KODuMQXTpd6kooy0NlSpXM1RygXYkDY1siqDDHj2ZzhrWfHsfZSYApW0XXv9DrrOuVZqDeFDk4eNpkbhfHflbq7tR2UXhPSE5TNQX8CH56oFpOq+OPNCub6M/SPpT0zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CoGpF5Ln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169KTcf011383;
	Thu, 6 Feb 2025 12:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLTmZ1Y7civasiKtC/SZ/PFzeOH6xSzIiDq6NGKZm58=; b=CoGpF5LneXKpP7f0
	sepkPMkyJpHp2ukyntcnqg2VJr/e9vp4LeOKvjlodwN2bQKe5gIEMLtE7gC2MGui
	JIRoIFyH+/N7tUVf5m9t2fEIBDvjtvKSH/lFXYyIiMhcP1tvVxmQZrWu9VMgC80N
	kISbZAoBEU/YndMYc+5JrYQzCAbUKeWAljTfei+2ffZevgsNBreNwiugA3v4Stu8
	cTmD4z9Eus1rFNteFPFbf3Ar9if3zm5dklZJEZSMz5WlGEHPQ+Mgk4sRdm/j+UJn
	vtIVjvtYCWRbWTwydVYWBzpumpVMrGYvvO5fiLnDixAbONSK4JLAfx8c9Hv9Akko
	TbAO0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtc68f2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 12:18:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516CIgBj018976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 12:18:42 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 04:18:37 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vkoul@kernel.org>, <kishon@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <p.zabel@pengutronix.de>,
        <quic_nsekar@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <quic_varada@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
Subject: [PATCH v10 4/7] arm64: dts: qcom: ipq9574: Reorder reg and reg-names
Date: Thu, 6 Feb 2025 17:48:00 +0530
Message-ID: <20250206121803.1128216-5-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206121803.1128216-1-quic_varada@quicinc.com>
References: <20250206121803.1128216-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jjgR48nL-7WwKxn8B6R3bx0dBVPqfviZ
X-Proofpoint-GUID: jjgR48nL-7WwKxn8B6R3bx0dBVPqfviZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060102

The 'reg' & 'reg-names' constraints used in the bindings and dtsi are
different resulting in dt_bindings_check errors. Re-order the reg entries,
fix the node names and move the nodes to maintain sort order to address the
following errors/warnings.

	arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: pcie@20000000: reg-names:0: 'parf' was expected
	arch/arm64/boot/dts/qcom/ipq9574.dtsi:1045.24-1127.5: Warning (simple_bus_reg): /soc@0/pcie@20000000: simple-bus unit address format error, expected "88000"

Move the nodes to maintain sort order w.r.t address.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v10: Move the nodes to maintain sort order w.r.t address.
     Fix 'simple-bus unit address format error'
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 837 +++++++++++++-------------
 1 file changed, 426 insertions(+), 411 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 942290028972..ab7cb1b5b076 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -239,6 +239,89 @@ rpm_msg_ram: sram@60000 {
 			reg = <0x00060000 0x6000>;
 		};
 
+		pcie0: pci@80000 {
+			compatible = "qcom,pcie-ipq9574";
+			reg =  <0x00080000 0x4000>,
+			       <0x28000000 0xf1d>,
+			       <0x28000f20 0xa8>,
+			       <0x28001000 0x1000>,
+			       <0x28100000 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x28200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x28300000 0x28300000 0x0 0x7d00000>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 75 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 78 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 79 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_CLK>,
+				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE0_RCHNG_CLK>,
+				 <&gcc GCC_PCIE0_AHB_CLK>,
+				 <&gcc GCC_PCIE0_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
+				 <&gcc GCC_PCIE0_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE0_AXI_S_STICKY_ARES>,
+				 <&gcc GCC_PCIE0_AXI_S_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_STICKY_ARES>,
+				 <&gcc GCC_PCIE0_AXI_M_ARES>,
+				 <&gcc GCC_PCIE0_AUX_ARES>,
+				 <&gcc GCC_PCIE0_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			phys = <&pcie0_phy>;
+			phy-names = "pciephy";
+			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
+					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+			status = "disabled";
+		};
+
 		pcie0_phy: phy@84000 {
 			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
 			reg = <0x00084000 0x1000>;
@@ -262,6 +345,90 @@ pcie0_phy: phy@84000 {
 			status = "disabled";
 		};
 
+		pcie2: pcie@88000 {
+			compatible = "qcom,pcie-ipq9574";
+			reg =  <0x00088000 0x4000>,
+			       <0x20000000 0xf1d>,
+			       <0x20000f20 0xa8>,
+			       <0x20001000 0x1000>,
+			       <0x20100000 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config";
+			device_type = "pci";
+			linux,pci-domain = <2>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x20200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x20300000 0x20300000 0x0 0x7d00000>;
+
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 186 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 187 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
+				 <&gcc GCC_PCIE2_AXI_S_CLK>,
+				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE2_RCHNG_CLK>,
+				 <&gcc GCC_PCIE2_AHB_CLK>,
+				 <&gcc GCC_PCIE2_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE2_PIPE_ARES>,
+				 <&gcc GCC_PCIE2_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE2_AXI_S_STICKY_ARES>,
+				 <&gcc GCC_PCIE2_AXI_S_ARES>,
+				 <&gcc GCC_PCIE2_AXI_M_STICKY_ARES>,
+				 <&gcc GCC_PCIE2_AXI_M_ARES>,
+				 <&gcc GCC_PCIE2_AUX_ARES>,
+				 <&gcc GCC_PCIE2_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			phys = <&pcie2_phy>;
+			phy-names = "pciephy";
+			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
+					<&gcc MASTER_SNOC_PCIE2 &gcc SLAVE_SNOC_PCIE2>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+			status = "disabled";
+		};
+
 		pcie2_phy: phy@8c000 {
 			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
 			reg = <0x0008c000 0x2000>;
@@ -285,13 +452,6 @@ pcie2_phy: phy@8c000 {
 			status = "disabled";
 		};
 
-		rng: rng@e3000 {
-			compatible = "qcom,ipq9574-trng", "qcom,trng";
-			reg = <0x000e3000 0x1000>;
-			clocks = <&gcc GCC_PRNG_AHB_CLK>;
-			clock-names = "core";
-		};
-
 		mdio: mdio@90000 {
 			compatible = "qcom,ipq9574-mdio", "qcom,ipq4019-mdio";
 			reg = <0x00090000 0x64>;
@@ -302,52 +462,6 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
-		pcie3_phy: phy@f4000 {
-			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
-			reg = <0x000f4000 0x2000>;
-
-			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
-				 <&gcc GCC_PCIE3_AHB_CLK>,
-				 <&gcc GCC_PCIE3_PIPE_CLK>;
-			clock-names = "aux", "cfg_ahb", "pipe";
-
-			assigned-clocks = <&gcc GCC_PCIE3_AUX_CLK>;
-			assigned-clock-rates = <20000000>;
-
-			resets = <&gcc GCC_PCIE3_PHY_BCR>,
-				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
-			reset-names = "phy", "common";
-
-			#clock-cells = <0>;
-			clock-output-names = "gcc_pcie3_pipe_clk_src";
-
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
-		pcie1_phy: phy@fc000 {
-			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
-			reg = <0x000fc000 0x1000>;
-
-			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
-				 <&gcc GCC_PCIE1_AHB_CLK>,
-				 <&gcc GCC_PCIE1_PIPE_CLK>;
-			clock-names = "aux", "cfg_ahb", "pipe";
-
-			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
-			assigned-clock-rates = <20000000>;
-
-			resets = <&gcc GCC_PCIE1_PHY_BCR>,
-				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
-			reset-names = "phy", "common";
-
-			#clock-cells = <0>;
-			clock-output-names = "gcc_pcie1_pipe_clk_src";
-
-			#phy-cells = <0>;
-			status = "disabled";
-		};
-
 		cmn_pll: clock-controller@9b000 {
 			compatible = "qcom,ipq9574-cmn-pll";
 			reg = <0x0009b000 0x800>;
@@ -372,48 +486,269 @@ cpu_speed_bin: cpu-speed-bin@15 {
 			};
 		};
 
-		cryptobam: dma-controller@704000 {
-			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
-			reg = <0x00704000 0x20000>;
-			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
-			#dma-cells = <1>;
-			qcom,ee = <1>;
-			qcom,controlled-remotely;
-		};
-
-		crypto: crypto@73a000 {
-			compatible = "qcom,ipq9574-qce", "qcom,ipq4019-qce", "qcom,qce";
-			reg = <0x0073a000 0x6000>;
-			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
-				 <&gcc GCC_CRYPTO_AXI_CLK>,
-				 <&gcc GCC_CRYPTO_CLK>;
-			clock-names = "iface", "bus", "core";
-			dmas = <&cryptobam 2>, <&cryptobam 3>;
-			dma-names = "rx", "tx";
+		rng: rng@e3000 {
+			compatible = "qcom,ipq9574-trng", "qcom,trng";
+			reg = <0x000e3000 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
 		};
 
-		tsens: thermal-sensor@4a9000 {
-			compatible = "qcom,ipq9574-tsens", "qcom,ipq8074-tsens";
-			reg = <0x004a9000 0x1000>,
-			      <0x004a8000 0x1000>;
-			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "combined";
-			#qcom,sensors = <16>;
-			#thermal-sensor-cells = <1>;
-		};
+		pcie3: pcie@f0000 {
+			compatible = "qcom,pcie-ipq9574";
+			reg = <0x000f0000 0x4000>,
+			      <0x18000000 0xf1d>,
+			      <0x18000f20 0xa8>,
+			      <0x18001000 0x1000>,
+			      <0x18100000 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config";
+			device_type = "pci";
+			linux,pci-domain = <3>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
 
-		tlmm: pinctrl@1000000 {
-			compatible = "qcom,ipq9574-tlmm";
-			reg = <0x01000000 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 65>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x18200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x18300000 0x18300000 0x0 0x7d00000>;
 
-			uart2_pins: uart2-state {
-				pins = "gpio34", "gpio35";
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 191 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
+				 <&gcc GCC_PCIE3_AXI_S_CLK>,
+				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE3_RCHNG_CLK>,
+				 <&gcc GCC_PCIE3_AHB_CLK>,
+				 <&gcc GCC_PCIE3_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
+				 <&gcc GCC_PCIE3_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE3_AXI_S_STICKY_ARES>,
+				 <&gcc GCC_PCIE3_AXI_S_ARES>,
+				 <&gcc GCC_PCIE3_AXI_M_STICKY_ARES>,
+				 <&gcc GCC_PCIE3_AXI_M_ARES>,
+				 <&gcc GCC_PCIE3_AUX_ARES>,
+				 <&gcc GCC_PCIE3_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			phys = <&pcie3_phy>;
+			phy-names = "pciephy";
+			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
+					<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+			status = "disabled";
+		};
+
+		pcie3_phy: phy@f4000 {
+			compatible = "qcom,ipq9574-qmp-gen3x2-pcie-phy";
+			reg = <0x000f4000 0x2000>;
+
+			clocks = <&gcc GCC_PCIE3_AUX_CLK>,
+				 <&gcc GCC_PCIE3_AHB_CLK>,
+				 <&gcc GCC_PCIE3_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE3_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE3_PHY_BCR>,
+				 <&gcc GCC_PCIE3PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "gcc_pcie3_pipe_clk_src";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		pcie1: pcie@f8000 {
+			compatible = "qcom,pcie-ipq9574";
+			reg = <0x000f8000 0x4000>,
+			      <0x10000000 0xf1d>,
+			      <0x10000f20 0xa8>,
+			      <0x10001000 0x1000>,
+			      <0x10100000 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config";
+			device_type = "pci";
+			linux,pci-domain = <1>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x10200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x10300000 0x10300000 0x0 0x7d00000>;
+
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_CLK>,
+				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
+				 <&gcc GCC_PCIE1_RCHNG_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_AUX_CLK>;
+			clock-names = "axi_m",
+				      "axi_s",
+				      "axi_bridge",
+				      "rchng",
+				      "ahb",
+				      "aux";
+
+			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
+				 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE1_AXI_S_STICKY_ARES>,
+				 <&gcc GCC_PCIE1_AXI_S_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_STICKY_ARES>,
+				 <&gcc GCC_PCIE1_AXI_M_ARES>,
+				 <&gcc GCC_PCIE1_AUX_ARES>,
+				 <&gcc GCC_PCIE1_AHB_ARES>;
+			reset-names = "pipe",
+				      "sticky",
+				      "axi_s_sticky",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "axi_m",
+				      "aux",
+				      "ahb";
+
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
+					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
+			interconnect-names = "pcie-mem", "cpu-pcie";
+			status = "disabled";
+		};
+
+		pcie1_phy: phy@fc000 {
+			compatible = "qcom,ipq9574-qmp-gen3x1-pcie-phy";
+			reg = <0x000fc000 0x1000>;
+
+			clocks = <&gcc GCC_PCIE1_AUX_CLK>,
+				 <&gcc GCC_PCIE1_AHB_CLK>,
+				 <&gcc GCC_PCIE1_PIPE_CLK>;
+			clock-names = "aux", "cfg_ahb", "pipe";
+
+			assigned-clocks = <&gcc GCC_PCIE1_AUX_CLK>;
+			assigned-clock-rates = <20000000>;
+
+			resets = <&gcc GCC_PCIE1_PHY_BCR>,
+				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
+			reset-names = "phy", "common";
+
+			#clock-cells = <0>;
+			clock-output-names = "gcc_pcie1_pipe_clk_src";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		cryptobam: dma-controller@704000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x00704000 0x20000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <1>;
+			qcom,controlled-remotely;
+		};
+
+		crypto: crypto@73a000 {
+			compatible = "qcom,ipq9574-qce", "qcom,ipq4019-qce", "qcom,qce";
+			reg = <0x0073a000 0x6000>;
+			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
+				 <&gcc GCC_CRYPTO_AXI_CLK>,
+				 <&gcc GCC_CRYPTO_CLK>;
+			clock-names = "iface", "bus", "core";
+			dmas = <&cryptobam 2>, <&cryptobam 3>;
+			dma-names = "rx", "tx";
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq9574-tsens", "qcom,ipq8074-tsens";
+			reg = <0x004a9000 0x1000>,
+			      <0x004a8000 0x1000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "combined";
+			#qcom,sensors = <16>;
+			#thermal-sensor-cells = <1>;
+		};
+
+		tlmm: pinctrl@1000000 {
+			compatible = "qcom,ipq9574-tlmm";
+			reg = <0x01000000 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 65>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			uart2_pins: uart2-state {
+				pins = "gpio34", "gpio35";
 				function = "blsp2_uart";
 				drive-strength = <8>;
 				bias-disable;
@@ -873,326 +1208,6 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
-
-		pcie1: pcie@10000000 {
-			compatible = "qcom,pcie-ipq9574";
-			reg =  <0x10000000 0xf1d>,
-			       <0x10000f20 0xa8>,
-			       <0x10001000 0x1000>,
-			       <0x000f8000 0x4000>,
-			       <0x10100000 0x1000>;
-			reg-names = "dbi", "elbi", "atu", "parf", "config";
-			device_type = "pci";
-			linux,pci-domain = <1>;
-			bus-range = <0x00 0xff>;
-			num-lanes = <1>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges = <0x01000000 0x0 0x00000000 0x10200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x10300000 0x10300000 0x0 0x7d00000>;
-
-			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi0",
-					  "msi1",
-					  "msi2",
-					  "msi3",
-					  "msi4",
-					  "msi5",
-					  "msi6",
-					  "msi7";
-
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 35 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 49 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 84 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 85 IRQ_TYPE_LEVEL_HIGH>;
-
-			clocks = <&gcc GCC_PCIE1_AXI_M_CLK>,
-				 <&gcc GCC_PCIE1_AXI_S_CLK>,
-				 <&gcc GCC_PCIE1_AXI_S_BRIDGE_CLK>,
-				 <&gcc GCC_PCIE1_RCHNG_CLK>,
-				 <&gcc GCC_PCIE1_AHB_CLK>,
-				 <&gcc GCC_PCIE1_AUX_CLK>;
-			clock-names = "axi_m",
-				      "axi_s",
-				      "axi_bridge",
-				      "rchng",
-				      "ahb",
-				      "aux";
-
-			resets = <&gcc GCC_PCIE1_PIPE_ARES>,
-				 <&gcc GCC_PCIE1_CORE_STICKY_ARES>,
-				 <&gcc GCC_PCIE1_AXI_S_STICKY_ARES>,
-				 <&gcc GCC_PCIE1_AXI_S_ARES>,
-				 <&gcc GCC_PCIE1_AXI_M_STICKY_ARES>,
-				 <&gcc GCC_PCIE1_AXI_M_ARES>,
-				 <&gcc GCC_PCIE1_AUX_ARES>,
-				 <&gcc GCC_PCIE1_AHB_ARES>;
-			reset-names = "pipe",
-				      "sticky",
-				      "axi_s_sticky",
-				      "axi_s",
-				      "axi_m_sticky",
-				      "axi_m",
-				      "aux",
-				      "ahb";
-
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
-					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-			status = "disabled";
-		};
-
-		pcie3: pcie@18000000 {
-			compatible = "qcom,pcie-ipq9574";
-			reg =  <0x18000000 0xf1d>,
-			       <0x18000f20 0xa8>,
-			       <0x18001000 0x1000>,
-			       <0x000f0000 0x4000>,
-			       <0x18100000 0x1000>;
-			reg-names = "dbi", "elbi", "atu", "parf", "config";
-			device_type = "pci";
-			linux,pci-domain = <3>;
-			bus-range = <0x00 0xff>;
-			num-lanes = <2>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges = <0x01000000 0x0 0x00000000 0x18200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x18300000 0x18300000 0x0 0x7d00000>;
-
-			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi0",
-					  "msi1",
-					  "msi2",
-					  "msi3",
-					  "msi4",
-					  "msi5",
-					  "msi6",
-					  "msi7";
-
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 189 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 190 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 191 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 192 IRQ_TYPE_LEVEL_HIGH>;
-
-			clocks = <&gcc GCC_PCIE3_AXI_M_CLK>,
-				 <&gcc GCC_PCIE3_AXI_S_CLK>,
-				 <&gcc GCC_PCIE3_AXI_S_BRIDGE_CLK>,
-				 <&gcc GCC_PCIE3_RCHNG_CLK>,
-				 <&gcc GCC_PCIE3_AHB_CLK>,
-				 <&gcc GCC_PCIE3_AUX_CLK>;
-			clock-names = "axi_m",
-				      "axi_s",
-				      "axi_bridge",
-				      "rchng",
-				      "ahb",
-				      "aux";
-
-			resets = <&gcc GCC_PCIE3_PIPE_ARES>,
-				 <&gcc GCC_PCIE3_CORE_STICKY_ARES>,
-				 <&gcc GCC_PCIE3_AXI_S_STICKY_ARES>,
-				 <&gcc GCC_PCIE3_AXI_S_ARES>,
-				 <&gcc GCC_PCIE3_AXI_M_STICKY_ARES>,
-				 <&gcc GCC_PCIE3_AXI_M_ARES>,
-				 <&gcc GCC_PCIE3_AUX_ARES>,
-				 <&gcc GCC_PCIE3_AHB_ARES>;
-			reset-names = "pipe",
-				      "sticky",
-				      "axi_s_sticky",
-				      "axi_s",
-				      "axi_m_sticky",
-				      "axi_m",
-				      "aux",
-				      "ahb";
-
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
-			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
-					<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-			status = "disabled";
-		};
-
-		pcie2: pcie@20000000 {
-			compatible = "qcom,pcie-ipq9574";
-			reg =  <0x20000000 0xf1d>,
-			       <0x20000f20 0xa8>,
-			       <0x20001000 0x1000>,
-			       <0x00088000 0x4000>,
-			       <0x20100000 0x1000>;
-			reg-names = "dbi", "elbi", "atu", "parf", "config";
-			device_type = "pci";
-			linux,pci-domain = <2>;
-			bus-range = <0x00 0xff>;
-			num-lanes = <2>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges = <0x01000000 0x0 0x00000000 0x20200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x20300000 0x20300000 0x0 0x7d00000>;
-
-			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi0",
-					  "msi1",
-					  "msi2",
-					  "msi3",
-					  "msi4",
-					  "msi5",
-					  "msi6",
-					  "msi7";
-
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 164 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 165 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 186 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 187 IRQ_TYPE_LEVEL_HIGH>;
-
-			clocks = <&gcc GCC_PCIE2_AXI_M_CLK>,
-				 <&gcc GCC_PCIE2_AXI_S_CLK>,
-				 <&gcc GCC_PCIE2_AXI_S_BRIDGE_CLK>,
-				 <&gcc GCC_PCIE2_RCHNG_CLK>,
-				 <&gcc GCC_PCIE2_AHB_CLK>,
-				 <&gcc GCC_PCIE2_AUX_CLK>;
-			clock-names = "axi_m",
-				      "axi_s",
-				      "axi_bridge",
-				      "rchng",
-				      "ahb",
-				      "aux";
-
-			resets = <&gcc GCC_PCIE2_PIPE_ARES>,
-				 <&gcc GCC_PCIE2_CORE_STICKY_ARES>,
-				 <&gcc GCC_PCIE2_AXI_S_STICKY_ARES>,
-				 <&gcc GCC_PCIE2_AXI_S_ARES>,
-				 <&gcc GCC_PCIE2_AXI_M_STICKY_ARES>,
-				 <&gcc GCC_PCIE2_AXI_M_ARES>,
-				 <&gcc GCC_PCIE2_AUX_ARES>,
-				 <&gcc GCC_PCIE2_AHB_ARES>;
-			reset-names = "pipe",
-				      "sticky",
-				      "axi_s_sticky",
-				      "axi_s",
-				      "axi_m_sticky",
-				      "axi_m",
-				      "aux",
-				      "ahb";
-
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
-			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
-					<&gcc MASTER_SNOC_PCIE2 &gcc SLAVE_SNOC_PCIE2>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-			status = "disabled";
-		};
-
-		pcie0: pci@28000000 {
-			compatible = "qcom,pcie-ipq9574";
-			reg =  <0x28000000 0xf1d>,
-			       <0x28000f20 0xa8>,
-			       <0x28001000 0x1000>,
-			       <0x00080000 0x4000>,
-			       <0x28100000 0x1000>;
-			reg-names = "dbi", "elbi", "atu", "parf", "config";
-			device_type = "pci";
-			linux,pci-domain = <0>;
-			bus-range = <0x00 0xff>;
-			num-lanes = <1>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-
-			ranges = <0x01000000 0x0 0x00000000 0x28200000 0x0 0x100000>,
-				 <0x02000000 0x0 0x28300000 0x28300000 0x0 0x7d00000>;
-			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi0",
-					  "msi1",
-					  "msi2",
-					  "msi3",
-					  "msi4",
-					  "msi5",
-					  "msi6",
-					  "msi7";
-
-			#interrupt-cells = <1>;
-			interrupt-map-mask = <0 0 0 0x7>;
-			interrupt-map = <0 0 0 1 &intc 0 0 75 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 2 &intc 0 0 78 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 3 &intc 0 0 79 IRQ_TYPE_LEVEL_HIGH>,
-					<0 0 0 4 &intc 0 0 83 IRQ_TYPE_LEVEL_HIGH>;
-
-			clocks = <&gcc GCC_PCIE0_AXI_M_CLK>,
-				 <&gcc GCC_PCIE0_AXI_S_CLK>,
-				 <&gcc GCC_PCIE0_AXI_S_BRIDGE_CLK>,
-				 <&gcc GCC_PCIE0_RCHNG_CLK>,
-				 <&gcc GCC_PCIE0_AHB_CLK>,
-				 <&gcc GCC_PCIE0_AUX_CLK>;
-			clock-names = "axi_m",
-				      "axi_s",
-				      "axi_bridge",
-				      "rchng",
-				      "ahb",
-				      "aux";
-
-			resets = <&gcc GCC_PCIE0_PIPE_ARES>,
-				 <&gcc GCC_PCIE0_CORE_STICKY_ARES>,
-				 <&gcc GCC_PCIE0_AXI_S_STICKY_ARES>,
-				 <&gcc GCC_PCIE0_AXI_S_ARES>,
-				 <&gcc GCC_PCIE0_AXI_M_STICKY_ARES>,
-				 <&gcc GCC_PCIE0_AXI_M_ARES>,
-				 <&gcc GCC_PCIE0_AUX_ARES>,
-				 <&gcc GCC_PCIE0_AHB_ARES>;
-			reset-names = "pipe",
-				      "sticky",
-				      "axi_s_sticky",
-				      "axi_s",
-				      "axi_m_sticky",
-				      "axi_m",
-				      "aux",
-				      "ahb";
-
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
-					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
-			interconnect-names = "pcie-mem", "cpu-pcie";
-			status = "disabled";
-		};
-
 	};
 
 	thermal-zones {
-- 
2.34.1


