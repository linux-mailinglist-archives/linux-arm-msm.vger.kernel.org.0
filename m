Return-Path: <linux-arm-msm+bounces-38186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFF9D0ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 09:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9723EB20FBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98DD18C33B;
	Mon, 18 Nov 2024 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ET7y+BcA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E16176242;
	Mon, 18 Nov 2024 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731918402; cv=none; b=Aqr974tXhz0jBqZZB54WbqpbdWCzUCTVD/upAkdd5bvqMA1EOYOkGogib5rUI/PmKgliqS0K9xBDKy/3fOjzuhro7ER+cXyppJzu8Tez4vapCSELpYtyikzhVjXbMF0Zqhw54vpUfxxxQBjQqvDHToSlIFrCmnW3QnNm2eVPAqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731918402; c=relaxed/simple;
	bh=y65IyhdCBZLfnfXl2Jp8zDFdNpZxqQ4w2NKTuNouIHM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VszI+tXNdrrY+ma4/rAYbVqs7Hm4V+krmO9gePxvoePU2xFKIV79u7qYtqp4xrc7vS131YHJF4U7m4wjNrYKiiu8jwHz//g7qiPQWu8QBdMSBoZf5it+mGqIaBiK+vuu/ipy1fXiXxvm2oRAl4QrJegYHfp1ao4M1l8q1Tlnd8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ET7y+BcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rm6V001478;
	Mon, 18 Nov 2024 08:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s38fixq29jL
	xJgUv0I15Lb57uUi3FsgupQ81UBKkdvg=; b=ET7y+BcApaiNoRz3wBRIds9UJF4
	c1Xq+ZruCNoyQk421SYCEJzx0G5JqbD+GAAUuYoAXW8LvpsgNpRRRFGw8qdmOtqx
	UDufyX+jbl6sZa3GR/YqUOq569W9Ad7VcV4SOUkisjcknZ669yA74A9VJDv0PREl
	oN3JBAXzmwQgpzSLA9zTPnzYv8i31qqox9yd8z+VrXkneEBzAZyphm0Qem7RI/qK
	xp10Naki/kPAFubCz2T+pb6neVPnKQzfUwtJfaAlkRUyXx+YlJ8pdfKzZs3ZbF3a
	8fsmwLxNmLo3d9tuiaDzO3xxuKWAxhvbekgkpRNu4VzSNs47r6XobYNCu+Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ycuf9uuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:28 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI8OBDe009657;
	Mon, 18 Nov 2024 08:26:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 42xmfkhw00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:26 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AI8QQHu011266;
	Mon, 18 Nov 2024 08:26:26 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4AI8QPxp011259
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 08:26:26 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4438065)
	id AF35D176D; Mon, 18 Nov 2024 16:26:24 +0800 (CST)
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com,
        lpieralisi@kernel.org, quic_qianyu@quicinc.com, conor+dt@kernel.org,
        neil.armstrong@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: quic_shashim@quicinc.com, quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH 5/5] arm64: dts: qcom: qcs615: enable pcie for qcs615
Date: Mon, 18 Nov 2024 16:26:19 +0800
Message-Id: <20241118082619.177201-6-quic_ziyuzhan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
References: <20241118082619.177201-1-quic_ziyuzhan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MfFAJBXZTNAlns5fN7iGFPXJNIVC7N3N
X-Proofpoint-GUID: MfFAJBXZTNAlns5fN7iGFPXJNIVC7N3N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180070

From: Krishna chaitanya chundru <quic_krichai@quicinc.com>

Add configurations in devicetree for PCIe0, including registers, clocks,
interrupts and phy setting sequence.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  42 ++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 158 +++++++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 4ef969a6af15..dd245a8a50f5 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -205,6 +205,23 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pcie {
+	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&pcie_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -213,6 +230,31 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&tlmm {
+	pcie_default_state: pcie-default-state {
+		perst-pins {
+			pins = "gpio101";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		clkreq-pins {
+			pins = "gpio90";
+			function = "pcie_clk_req";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio100";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1..1e30951a0d2a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -678,6 +678,164 @@ rpmhpd_opp_turbo_l1: opp-9 {
 		};
 	};
 
+	pcie: pcie@1c08000 {
+		compatible = "qcom,pcie-qcs615";
+		reg = <0x0 0x1c08000  0x0 0x3000>,
+		      <0x0 0x40000000 0x0 0xf1d>,
+		      <0x0 0x40000f20 0x0 0xa8>,
+		      <0x0 0x40001000 0x0 0x1000>,
+		      <0x0 0x40100000 0x0 0x100000>,
+		      <0x0 0x1c0b000  0x0 0x1000>;
+
+		reg-names = "parf",
+			    "dbi",
+			    "elbi",
+			    "atu",
+			    "config",
+			    "mhi";
+
+		device_type = "pci";
+		linux,pci-domain = <0>;
+		bus-range = <0x00 0xff>;
+		num-lanes = <1>;
+
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
+			 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
+
+		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "msi0",
+				  "msi1",
+				  "msi2",
+				  "msi3",
+				  "msi4",
+				  "msi5",
+				  "msi6",
+				  "msi7",
+				  "global";
+
+		interrupt-map = <0 0 0 0 &intc 0 0 0 140 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0x7>;
+
+		interconnects = <&aggre1_noc MASTER_PCIE QCOM_ICC_TAG_ALWAYS
+				 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+				<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+				 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+		interconnect-names = "pcie-mem", "cpu-pcie";
+
+		clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
+			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+			 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
+			 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
+			 <&rpmhcc RPMH_CXO_CLK>;
+
+		clock-names = "aux",
+			      "cfg",
+			      "bus_master",
+			      "bus_slave",
+			      "slave_q2a",
+			      "ref";
+
+		assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		operating-points-v2 = <&pcie_opp_table>;
+
+		resets = <&gcc GCC_PCIE_0_BCR>;
+		reset-names = "pci";
+
+		phys = <&pcie_phy>;
+		phy-names = "pciephy";
+
+		power-domains = <&gcc PCIE_0_GDSC>;
+
+		dma-coherent;
+
+		iommu-map = <0x0 &apps_smmu 0x400 0x1>,
+			    <0x100 &apps_smmu 0x401 0x1>;
+
+		status = "disabled";
+		pcie_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			/* GEN 1 x1 */
+			opp-2500000 {
+				opp-hz = /bits/ 64 <2500000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				opp-peak-kBps = <250000 1>;
+			};
+
+			/* GEN 2 x1 */
+			opp-5000000 {
+				opp-hz = /bits/ 64 <5000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				opp-peak-kBps = <500000 1>;
+			};
+
+			/* GEN 3 x1 */
+			opp-8000000 {
+				opp-hz = /bits/ 64 <8000000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+				opp-peak-kBps = <984500 1>;
+			};
+		};
+
+		pcie@0 {
+			device_type = "pci";
+			reg = <0x0 0x0 0x0 0x0 0x0>;
+			bus-range = <0x01 0xff>;
+
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges;
+		};
+	};
+
+	pcie_phy: phy@1c0e000 {
+		compatible = "qcom,qcs615-qmp-gen3x1-pcie-phy";
+		reg = <0 0x01c0e000 0 0x1000>;
+
+		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+			 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+			 <&gcc GCC_PCIE_0_CLKREF_CLK>,
+			 <&gcc GCC_PCIE0_PHY_REFGEN_CLK>,
+			 <&gcc GCC_PCIE_0_PIPE_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "refgen",
+			      "pipe";
+
+		clock-output-names = "pcie_0_pipe_clk";
+		#clock-cells = <0>;
+
+		#phy-cells = <0>;
+
+		resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+		reset-names = "phy";
+
+		assigned-clocks = <&gcc GCC_PCIE0_PHY_REFGEN_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		status = "disabled";
+	};
+
 	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.34.1


