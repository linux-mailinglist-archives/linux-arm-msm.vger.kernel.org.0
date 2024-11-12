Return-Path: <linux-arm-msm+bounces-37672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFE99C5EDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF0C21F236C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C842139DB;
	Tue, 12 Nov 2024 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YBy6I26Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA417212EEF;
	Tue, 12 Nov 2024 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432234; cv=none; b=Mg2tR55ncrDqQ9FNUg2M0OsyE1p5BJmHeT7E4IlbYLVErYD6HnmswkwUmPu3k7VCStjKyOCPB7TjFm8ihIiI2+AnIzSjmpxl5VBqEvORr9rerZwaeMbgSHCZucdyZJ13pABUdZyoK7HUvFECXYKKAqbrzZIKwyonhak8ff96FSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432234; c=relaxed/simple;
	bh=Wzt9H6HgIF/uFyGXGvbRmJIClfsMoRpYmuUIs3oNhUM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s5m4djro2595E/cnc2R/cApdTcZXxsGW3OWeREFdP/8BHTNhJlKZMa50avhZ65k1cyXZP9mg35RkwUY4Qa6Gc52bYO3aMjU79DDGc6X9H+YcysbB5qAfH8ENCj1VirmJRJ8yrncoxkb3WCk31TjY5dfg5PC3RkLRppX97jZwltw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YBy6I26Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACFm1YE004274;
	Tue, 12 Nov 2024 17:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=edgfX9EpOauVNgN7KN/x6kZyQtScLSQe33S
	3lNORSdg=; b=YBy6I26ZYjOsUDRoaZDJ7c0FQjuXy6bJ1IFKXliHU9/BMob2Mja
	27NBjZlWU4R9mXDECBMvSLijnB8yJL2IAqs7rDaUTcQbnSuDJIxnaL9EGMpCpC6Z
	NKemxpP57m/dpVD3dEyicTsBa8PsTtLg2vDll/KxQ3+n3F+Ca9j0nk8Rzc/sf43Y
	oGjiAEEydlaLnNu2y2Wk8zEEECtkI7iZhWu4I/nLJDTv1ysn2e99zNfYOH5gp9VF
	azJCXnaGH1S45sq6wqU0bAPM25zF7tG+YfMrMJKr6EO/gbCNh8roNikSd5gs8bSL
	Qh63MeAEg4meiLPFu7so3hUUu92evTZ07DA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1h6hu7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 17:23:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACHNerd019695;
	Tue, 12 Nov 2024 17:23:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42t0tm989x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 17:23:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4ACHNeFv019690;
	Tue, 12 Nov 2024 17:23:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ACHNeoi019689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 17:23:40 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id AABE8540; Tue, 12 Nov 2024 22:53:39 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: qcs8300: Add QUPv3 configuration
Date: Tue, 12 Nov 2024 22:53:37 +0530
Message-Id: <20241112172337.3120801-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: itq8Uu5Hq_bA0yWFF8u2PS8w9G5KrnYE
X-Proofpoint-GUID: itq8Uu5Hq_bA0yWFF8u2PS8w9G5KrnYE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120139

Add DT support for QUPV3 Serial Engines.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
Build Dependencies:

Base Link:
https://lore.kernel.org/linux-arm-msm/20240904-qcs8300_initial_dtsi-v1-18-d0ea9afdc007@quicinc.com/
https://lore.kernel.org/all/202409080715.rGuyyNu2-lkp@intel.com/T/

ICC Link: https://lore.kernel.org/linux-arm-msm/20240906151534.6418-2-quic_rlaggysh@quicinc.com/
GPI documentation: https://lore.kernel.org/all/20241112041252.351266-1-quic_vdadhani@quicinc.com/

v1 -> v2:

- Correct gpi dma node name and compatible strings
- Use QCOM_ICC_TAG_ALWAYS flag in interconnect property.
- Update build dependency list.

v1 Link: https://lore.kernel.org/linux-devicetree/20241009091150.32354-1-quic_vdadhani@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 2190 +++++++++++++++++++++++--
 1 file changed, 2045 insertions(+), 145 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..8b2811ac527b 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -18,6 +19,39 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &i2c5;
+		i2c6 = &i2c6;
+		i2c8 = &i2c8;
+		i2c9 = &i2c9;
+		i2c10 = &i2c10;
+		i2c11 = &i2c11;
+		i2c12 = &i2c12;
+		i2c13 = &i2c13;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		spi0 = &spi0;
+		spi1 = &spi1;
+		spi2 = &spi2;
+		spi3 = &spi3;
+		spi4 = &spi4;
+		spi5 = &spi5;
+		spi6 = &spi6;
+		spi8 = &spi8;
+		spi9 = &spi9;
+		spi10 = &spi10;
+		spi12 = &spi12;
+		spi13 = &spi13;
+		spi14 = &spi14;
+		spi15 = &spi15;
+		serial0 = &uart7;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -372,6 +406,15 @@ system_pd: power-domain-system {
 		};
 	};
 
+	qup_opp_table: opp-table-qup {
+		compatible = "operating-points-v2";
+
+		opp-120000000 {
+			opp-hz = /bits/ 64 <120000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -558,6 +601,29 @@ qfprom: efuse@784000 {
 			#size-cells = <1>;
 		};
 
+		gpi_dma0: dma-controller@900000 {
+			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x900000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x416 0x0>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x9c0000 0x0 0x2000>;
@@ -568,176 +634,1391 @@ qupv3_id_0: geniqup@9c0000 {
 				      "s-ahb";
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x403 0x0>;
+			dma-coherent;
 			status = "disabled";
 
-			uart7: serial@99c000 {
-				compatible = "qcom,geni-debug-uart";
-				reg = <0x0 0x0099c000 0x0 0x4000>;
-				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+			i2c0: i2c@980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				clock-names = "se";
-				pinctrl-0 = <&qup_uart7_default>;
+				pinctrl-0 = <&qup_i2c0_data_clk>;
 				pinctrl-names = "default";
-				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
-				interconnects = <&clk_virt MASTER_QUP_CORE_0 0
-						 &clk_virt SLAVE_QUP_CORE_0 0>,
-						<&gem_noc MASTER_APPSS_PROC 0
-						 &config_noc SLAVE_QUP_0 0>;
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi0: spi@980000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
 						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
-		};
 
-		config_noc: interconnect@14c0000 {
-			compatible = "qcom,qcs8300-config-noc";
-			reg = <0x0 0x014c0000 0x0 0x13080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			uart0: serial@980000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>,
+					    <&qup_uart0_tx>, <&qup_uart0_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-		system_noc: interconnect@1680000 {
-			compatible = "qcom,qcs8300-system-noc";
-			reg = <0x0 0x01680000 0x0 0x15080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			i2c1: i2c@984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		aggre1_noc: interconnect@16c0000 {
-			compatible = "qcom,qcs8300-aggre1-noc";
-			reg = <0x0 0x016c0000 0x0 0x17080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			spi1: spi@984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		aggre2_noc: interconnect@1700000 {
-			compatible = "qcom,qcs8300-aggre2-noc";
-			reg = <0x0 0x01700000 0x0 0x1a080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			uart1: serial@984000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>,
+					    <&qup_uart1_tx>, <&qup_uart1_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-		pcie_anoc: interconnect@1760000 {
-			compatible = "qcom,qcs8300-pcie-anoc";
-			reg = <0x0 0x01760000 0x0 0xc080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			i2c2: i2c@988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		gpdsp_anoc: interconnect@1780000 {
-			compatible = "qcom,qcs8300-gpdsp-anoc";
-			reg = <0x0 0x01780000 0x0 0xd080>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			spi2: spi@988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		mmss_noc: interconnect@17a0000 {
-			compatible = "qcom,qcs8300-mmss-noc";
-			reg = <0x0 0x017a0000 0x0 0x40000>;
-			#interconnect-cells = <2>;
-			qcom,bcm-voters = <&apps_bcm_voter>;
-		};
+			uart2: serial@988000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>,
+					    <&qup_uart2_tx>, <&qup_uart2_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-		ufs_mem_hc: ufs@1d84000 {
-			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
-			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy>;
-			phy-names = "ufsphy";
-			lanes-per-direction = <2>;
-			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
+			i2c3: i2c@98c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
+			spi3: spi@98c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-			iommus = <&apps_smmu 0x100 0x0>;
-			dma-coherent;
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>,
+					    <&qup_uart3_tx>, <&qup_uart3_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-			interconnects = <&aggre1_noc MASTER_UFS_MEM 0
-					 &mc_virt SLAVE_EBI1 0>,
-					<&gem_noc MASTER_APPSS_PROC 0
-					 &config_noc SLAVE_UFS_MEM_CFG 0>;
-			interconnect-names = "ufs-ddr",
-					     "cpu-ufs";
+			i2c4: i2c@990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
-				 <&gcc GCC_UFS_PHY_AHB_CLK>,
-				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
-				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
-			clock-names = "core_clk",
-				      "bus_aggr_clk",
-				      "iface_clk",
-				      "core_clk_unipro",
-				      "ref_clk",
-				      "tx_lane0_sync_clk",
-				      "rx_lane0_sync_clk",
-				      "rx_lane1_sync_clk";
-			freq-table-hz = <75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<75000000 300000000>,
-					<0 0>,
-					<0 0>,
-					<0 0>,
-					<0 0>;
-			status = "disabled";
-		};
+			spi4: spi@990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		ufs_mem_phy: phy@1d87000 {
-			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
-			reg = <0x0 0x01d87000 0x0 0xe10>;
-			/*
-			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
-			 * enables the CXO clock to eDP *and* UFS PHY.
-			 */
-			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
-				 <&gcc GCC_EDP_REF_CLKREF_EN>;
-			clock-names = "ref",
-				      "ref_aux",
-				      "qref";
-			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			uart4: serial@990000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>,
+					    <&qup_uart4_tx>, <&qup_uart4_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
 
-			resets = <&ufs_mem_hc 0>;
-			reset-names = "ufsphy";
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-			#phy-cells = <0>;
-			status = "disabled";
-		};
+			i2c5: i2c@994000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		tcsr_mutex: hwlock@1f40000 {
-			compatible = "qcom,tcsr-mutex";
-			reg = <0x0 0x01f40000 0x0 0x20000>;
-			#hwlock-cells = <1>;
-		};
+			spi5: spi@994000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-		tcsr: syscon@1fc0000 {
-			compatible = "qcom,qcs8300-tcsr", "syscon";
-			reg = <0x0 0x1fc0000 0x0 0x30000>;
-		};
+			uart5: serial@994000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x994000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>,
+					    <&qup_uart5_tx>, <&qup_uart5_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
 
-		remoteproc_adsp: remoteproc@3000000 {
-			compatible = "qcom,qcs8300-adsp-pas", "qcom,sa8775p-adsp-pas";
-			reg = <0x0 0x3000000 0x0 0x00100>;
+			i2c6: i2c@998000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x998000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects =	<&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
-					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "wdog",
-					  "fatal",
-					  "ready",
-					  "handover",
-					  "stop-ack";
+			spi6: spi@998000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0x998000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
 
-			clocks = <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "xo";
+			uart6: serial@998000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x998000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>,
+					    <&qup_uart6_tx>, <&qup_uart6_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			uart7: serial@99c000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x0 0x0099c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart7_tx>, <&qup_uart7_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+		};
+
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0xa00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x456 0x0>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0xac0000 0x0 0x2000>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu 0x443 0x0>;
+			dma-coherent;
+			status = "disabled";
+
+			i2c8: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi8: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart8: serial@a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>,
+					    <&qup_uart8_tx>, <&qup_uart8_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c9: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi9: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart9: serial@a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa84000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>,
+					    <&qup_uart9_tx>, <&qup_uart9_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi10: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart10: serial@a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa88000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>,
+					    <&qup_uart10_tx>, <&qup_uart10_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c11: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa8c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart11: serial@a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa8c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart11_tx>, <&qup_uart11_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c12: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi12: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart12: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa90000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>,
+					    <&qup_uart12_tx>, <&qup_uart12_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c13: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa94000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c13_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi13: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa94000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart13: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa94000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>,
+					    <&qup_uart13_tx>, <&qup_uart13_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c14: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi14: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart14: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa98000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>,
+					    <&qup_uart14_tx>, <&qup_uart14_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 835 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+
+			i2c15: i2c@a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xa9c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi15: spi@a9c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xa9c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart15: serial@a9c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xa9c000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>,
+					    <&qup_uart15_tx>, <&qup_uart15_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+		};
+
+		gpi_dma3: dma-controller@b00000 {
+			compatible = "qcom,qcs8300-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0x0 0xb00000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x56 0x0>;
+			dma-channels = <4>;
+			dma-channel-mask = <0xf>;
+			dma-coherent;
+			status = "disabled";
+		};
+
+		qupv3_id_3: geniqup@bc0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0x0 0xbc0000 0x0 0x2000>;
+			ranges;
+			clocks = <&gcc GCC_QUPV3_WRAP_3_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_3_S_AHB_CLK>;
+			clock-names = "m-ahb",
+				      "s-ahb";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			iommus = <&apps_smmu 0x43 0x0>;
+			dma-coherent;
+			status = "disabled";
+
+			i2c16: i2c@b80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0xb80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_i2c16_data_clk>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_3 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			spi16: spi@b80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0x0 0xb80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
+				status = "disabled";
+			};
+
+			uart16: serial@b80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0xb80000 0x0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				clock-names = "se";
+				pinctrl-0 = <&qup_uart16_cts>, <&qup_uart16_rts>,
+					    <&qup_uart16_tx>, <&qup_uart16_rx>;
+				pinctrl-names = "default";
+				interrupts = <GIC_SPI 830 IRQ_TYPE_LEVEL_HIGH>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				status = "disabled";
+			};
+		};
+
+		config_noc: interconnect@14c0000 {
+			compatible = "qcom,qcs8300-config-noc";
+			reg = <0x0 0x014c0000 0x0 0x13080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		system_noc: interconnect@1680000 {
+			compatible = "qcom,qcs8300-system-noc";
+			reg = <0x0 0x01680000 0x0 0x15080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre1_noc: interconnect@16c0000 {
+			compatible = "qcom,qcs8300-aggre1-noc";
+			reg = <0x0 0x016c0000 0x0 0x17080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		aggre2_noc: interconnect@1700000 {
+			compatible = "qcom,qcs8300-aggre2-noc";
+			reg = <0x0 0x01700000 0x0 0x1a080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		pcie_anoc: interconnect@1760000 {
+			compatible = "qcom,qcs8300-pcie-anoc";
+			reg = <0x0 0x01760000 0x0 0xc080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		gpdsp_anoc: interconnect@1780000 {
+			compatible = "qcom,qcs8300-gpdsp-anoc";
+			reg = <0x0 0x01780000 0x0 0xd080>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		mmss_noc: interconnect@17a0000 {
+			compatible = "qcom,qcs8300-mmss-noc";
+			reg = <0x0 0x017a0000 0x0 0x40000>;
+			#interconnect-cells = <2>;
+			qcom,bcm-voters = <&apps_bcm_voter>;
+		};
+
+		ufs_mem_hc: ufs@1d84000 {
+			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+			lanes-per-direction = <2>;
+			#reset-cells = <1>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x100 0x0>;
+			dma-coherent;
+
+			interconnects = <&aggre1_noc MASTER_UFS_MEM 0
+					 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0
+					 &config_noc SLAVE_UFS_MEM_CFG 0>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+			freq-table-hz = <75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<75000000 300000000>,
+					<0 0>,
+					<0 0>,
+					<0 0>,
+					<0 0>;
+			status = "disabled";
+		};
+
+		ufs_mem_phy: phy@1d87000 {
+			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
+			reg = <0x0 0x01d87000 0x0 0xe10>;
+			/*
+			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
+			 * enables the CXO clock to eDP *and* UFS PHY.
+			 */
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 <&gcc GCC_EDP_REF_CLKREF_EN>;
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		tcsr_mutex: hwlock@1f40000 {
+			compatible = "qcom,tcsr-mutex";
+			reg = <0x0 0x01f40000 0x0 0x20000>;
+			#hwlock-cells = <1>;
+		};
+
+		tcsr: syscon@1fc0000 {
+			compatible = "qcom,qcs8300-tcsr", "syscon";
+			reg = <0x0 0x1fc0000 0x0 0x30000>;
+		};
+
+		remoteproc_adsp: remoteproc@3000000 {
+			compatible = "qcom,qcs8300-adsp-pas", "qcom,sa8775p-adsp-pas";
+			reg = <0x0 0x3000000 0x0 0x00100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 
 			power-domains = <&rpmhpd RPMHPD_LCX>,
 					<&rpmhpd RPMHPD_LMX>;
@@ -950,11 +2231,630 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
-			qup_uart7_default: qup-uart7-state {
-				/* TX, RX */
-				pins = "gpio43", "gpio44";
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio17", "gpio18";
+				function = "qup0_se0";
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio19", "gpio20";
+				function = "qup0_se1";
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio33", "gpio34";
+				function = "qup0_se2";
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio25", "gpio26";
+				function = "qup0_se3";
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio29", "gpio30";
+				function = "qup0_se4";
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				pins = "gpio21", "gpio22";
+				function = "qup0_se5";
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				pins = "gpio80", "gpio81";
+				function = "qup0_se6";
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio37", "gpio38";
+				function = "qup1_se0";
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio39", "gpio40";
+				function = "qup1_se1";
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio84", "gpio85";
+				function = "qup1_se2";
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio41", "gpio42";
+				function = "qup1_se3";
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio45", "gpio46";
+				function = "qup1_se4";
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				pins = "gpio49", "gpio50";
+				function = "qup1_se5";
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio89", "gpio90";
+				function = "qup1_se6";
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio91", "gpio92";
+				function = "qup1_se7";
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				pins = "gpio10", "gpio11";
+				function = "qup2_se0";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				pins = "gpio17", "gpio18", "gpio19";
+				function = "qup0_se0";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio20";
+				function = "qup0_se0";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio20";
+				function = "gpio";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				pins = "gpio19", "gpio20", "gpio17";
+				function = "qup0_se1";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio18";
+				function = "qup0_se1";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio18";
+				function = "gpio";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				pins = "gpio33", "gpio34", "gpio35";
+				function = "qup0_se2";
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio36";
+				function = "qup0_se2";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
+				pins = "gpio36";
+				function = "gpio";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				pins = "gpio25", "gpio26", "gpio27";
+				function = "qup0_se3";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio28";
+				function = "qup0_se3";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio28";
+				function = "gpio";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				pins = "gpio29", "gpio30", "gpio31";
+				function = "qup0_se4";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio32";
+				function = "qup0_se4";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio32";
+				function = "gpio";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				pins = "gpio21", "gpio22", "gpio23";
+				function = "qup0_se5";
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio24";
+				function = "qup0_se5";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
+				pins = "gpio24";
+				function = "gpio";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				pins = "gpio80", "gpio81", "gpio82";
+				function = "qup0_se6";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio83";
+				function = "qup0_se6";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio83";
+				function = "gpio";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio37", "gpio38", "gpio39";
+				function = "qup1_se0";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio40";
+				function = "qup1_se0";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio40";
+				function = "gpio";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio39", "gpio40", "gpio37";
+				function = "qup1_se1";
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio38";
+				function = "qup1_se1";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
+				pins = "gpio38";
+				function = "gpio";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio84", "gpio85", "gpio86";
+				function = "qup1_se2";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio87";
+				function = "qup1_se2";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio87";
+				function = "gpio";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio45", "gpio46", "gpio47";
+				function = "qup1_se4";
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio48";
+				function = "qup1_se4";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
+				pins = "gpio48";
+				function = "gpio";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				pins = "gpio49", "gpio50", "gpio51";
+				function = "qup1_se5";
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio52";
+				function = "qup1_se5";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
+				pins = "gpio52";
+				function = "gpio";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				pins = "gpio89", "gpio90", "gpio91";
+				function = "qup1_se6";
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio92";
+				function = "qup1_se6";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
+				pins = "gpio92";
+				function = "gpio";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				pins = "gpio91", "gpio92", "gpio89";
+				function = "qup1_se7";
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio90";
+				function = "qup1_se7";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
+				pins = "gpio90";
+				function = "gpio";
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				pins = "gpio10", "gpio11", "gpio12";
+				function = "qup2_se0";
+			};
+
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio13";
+				function = "qup2_se0";
+			};
+
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio-state {
+				pins = "gpio13";
+				function = "gpio";
+			};
+
+			qup_uart0_cts: qup-uart0-cts-state {
+				pins = "gpio17";
+				function = "qup0_se0";
+			};
+
+			qup_uart0_rts: qup-uart0-rts-state {
+				pins = "gpio18";
+				function = "qup0_se0";
+			};
+
+			qup_uart0_tx: qup-uart0-tx-state {
+				pins = "gpio19";
+				function = "qup0_se0";
+			};
+
+			qup_uart0_rx: qup-uart0-rx-state {
+				pins = "gpio20";
+				function = "qup0_se0";
+			};
+
+			qup_uart1_cts: qup-uart1-cts-state {
+				pins = "gpio19";
+				function = "qup0_se1";
+			};
+
+			qup_uart1_rts: qup-uart1-rts-state {
+				pins = "gpio20";
+				function = "qup0_se1";
+			};
+
+			qup_uart1_tx: qup-uart1-tx-state {
+				pins = "gpio17";
+				function = "qup0_se1";
+			};
+
+			qup_uart1_rx: qup-uart1-rx-state {
+				pins = "gpio18";
+				function = "qup0_se1";
+			};
+
+			qup_uart2_cts: qup-uart2-cts-state {
+				pins = "gpio33";
+				function = "qup0_se2";
+			};
+
+			qup_uart2_rts: qup-uart2-rts-state {
+				pins = "gpio34";
+				function = "qup0_se2";
+			};
+
+			qup_uart2_tx: qup-uart2-tx-state {
+				pins = "gpio35";
+				function = "qup0_se2";
+			};
+
+			qup_uart2_rx: qup-uart2-rx-state {
+				pins = "gpio36";
+				function = "qup0_se2";
+			};
+
+			qup_uart3_cts: qup-uart3-cts-state {
+				pins = "gpio25";
+				function = "qup0_se3";
+			};
+
+			qup_uart3_rts: qup-uart3-rts-state {
+				pins = "gpio26";
+				function = "qup0_se3";
+			};
+
+			qup_uart3_tx: qup-uart3-tx-state {
+				pins = "gpio27";
+				function = "qup0_se3";
+			};
+
+			qup_uart3_rx: qup-uart3-rx-state {
+				pins = "gpio28";
+				function = "qup0_se3";
+			};
+
+			qup_uart4_cts: qup-uart4-cts-state {
+				pins = "gpio29";
+				function = "qup0_se4";
+			};
+
+			qup_uart4_rts: qup-uart4-rts-state {
+				pins = "gpio30";
+				function = "qup0_se4";
+			};
+
+			qup_uart4_tx: qup-uart4-tx-state {
+				pins = "gpio31";
+				function = "qup0_se4";
+			};
+
+			qup_uart4_rx: qup-uart4-rx-state {
+				pins = "gpio32";
+				function = "qup0_se4";
+			};
+
+			qup_uart5_cts: qup-uart5-cts-state {
+				pins = "gpio21";
+				function = "qup0_se5";
+			};
+
+			qup_uart5_rts: qup-uart5-rts-state {
+				pins = "gpio22";
+				function = "qup0_se5";
+			};
+
+			qup_uart5_tx: qup-uart5-tx-state {
+				pins = "gpio23";
+				function = "qup0_se5";
+			};
+
+			qup_uart5_rx: qup-uart5-rx-state {
+				pins = "gpio23";
+				function = "qup0_se5";
+			};
+
+			qup_uart6_cts: qup-uart6-cts-state {
+				pins = "gpio80";
+				function = "qup0_se6";
+			};
+
+			qup_uart6_rts: qup-uart6-rts-state {
+				pins = "gpio81";
+				function = "qup0_se6";
+			};
+
+			qup_uart6_tx: qup-uart6-tx-state {
+				pins = "gpio82";
+				function = "qup0_se6";
+			};
+
+			qup_uart6_rx: qup-uart6-rx-state {
+				pins = "gpio83";
+				function = "qup0_se6";
+			};
+
+			qup_uart7_tx: qup-uart7-tx-state {
+				pins = "gpio43";
+				function = "qup0_se7";
+			};
+
+			qup_uart7_rx: qup-uart7-rx-state {
+				pins = "gpio44";
 				function = "qup0_se7";
 			};
+
+			qup_uart8_cts: qup-uart8-cts-state {
+				pins = "gpio37";
+				function = "qup1_se0";
+			};
+
+			qup_uart8_rts: qup-uart8-rts-state {
+				pins = "gpio38";
+				function = "qup1_se0";
+			};
+
+			qup_uart8_tx: qup-uart8-tx-state {
+				pins = "gpio39";
+				function = "qup1_se0";
+			};
+
+			qup_uart8_rx: qup-uart8-rx-state {
+				pins = "gpio40";
+				function = "qup1_se0";
+			};
+
+			qup_uart9_cts: qup-uart9-cts-state {
+				pins = "gpio39";
+				function = "qup1_se1";
+			};
+
+			qup_uart9_rts: qup-uart9-rts-state {
+				pins = "gpio40";
+				function = "qup1_se1";
+			};
+
+			qup_uart9_tx: qup-uart9-tx-state {
+				pins = "gpio37";
+				function = "qup1_se1";
+			};
+
+			qup_uart9_rx: qup-uart9-rx-state {
+				pins = "gpio38";
+				function = "qup1_se1";
+			};
+
+			qup_uart10_cts: qup-uart10-cts-state {
+				pins = "gpio84";
+				function = "qup1_se2";
+			};
+
+			qup_uart10_rts: qup-uart10-rts-state {
+				pins = "gpio84";
+				function = "qup1_se2";
+			};
+
+			qup_uart10_tx: qup-uart10-tx-state {
+				pins = "gpio85";
+				function = "qup1_se2";
+			};
+
+			qup_uart10_rx: qup-uart10-rx-state {
+				pins = "gpio87";
+				function = "qup1_se2";
+			};
+
+			qup_uart11_tx: qup-uart11-tx-state {
+				pins = "gpio41";
+				function = "qup1_se3";
+			};
+
+			qup_uart11_rx: qup-uart11-rx-state {
+				pins = "gpio42";
+				function = "qup1_se3";
+			};
+
+			qup_uart12_cts: qup-uart12-cts-state {
+				pins = "gpio45";
+				function = "qup1_se4";
+			};
+
+			qup_uart12_rts: qup-uart12-rts-state {
+				pins = "gpio46";
+				function = "qup1_se4";
+			};
+
+			qup_uart12_tx: qup-uart12-tx-state {
+				pins = "gpio47";
+				function = "qup1_se4";
+			};
+
+			qup_uart12_rx: qup-uart12-rx-state {
+				pins = "gpio48";
+				function = "qup1_se4";
+			};
+
+			qup_uart13_cts: qup-uart13-cts-state {
+				pins = "gpio49";
+				function = "qup1_se5";
+			};
+
+			qup_uart13_rts: qup-uart13-rts-state {
+				pins = "gpio50";
+				function = "qup1_se5";
+			};
+
+			qup_uart13_tx: qup-uart13-tx-state {
+				pins = "gpio51";
+				function = "qup1_se5";
+			};
+
+			qup_uart13_rx: qup-uart13-rx-state {
+				pins = "gpio52";
+				function = "qup1_se5";
+			};
+
+			qup_uart14_cts: qup-uart14-cts-state {
+				pins = "gpio89";
+				function = "qup1_se6";
+			};
+
+			qup_uart14_rts: qup-uart14-rts-state {
+				pins = "gpio90";
+				function = "qup1_se6";
+			};
+
+			qup_uart14_tx: qup-uart14-tx-state {
+				pins = "gpio91";
+				function = "qup1_se6";
+			};
+
+			qup_uart14_rx: qup-uart14-rx-state {
+				pins = "gpio92";
+				function = "qup1_se6";
+			};
+
+			qup_uart15_cts: qup-uart15-cts-state {
+				pins = "gpio91";
+				function = "qup1_se7";
+			};
+
+			qup_uart15_rts: qup-uart15-rts-state {
+				pins = "gpio92";
+				function = "qup1_se7";
+			};
+
+			qup_uart15_tx: qup-uart15-tx-state {
+				pins = "gpio89";
+				function = "qup1_se7";
+			};
+
+			qup_uart15_rx: qup-uart15-rx-state {
+				pins = "gpio90";
+				function = "qup1_se7";
+			};
+
+			qup_uart16_cts: qup-uart16-cts-state {
+				pins = "gpio10";
+				function = "qup2_se0";
+			};
+
+			qup_uart16_rts: qup-uart16-rts-state {
+				pins = "gpio11";
+				function = "qup2_se0";
+			};
+
+			qup_uart16_tx: qup-uart16-tx-state {
+				pins = "gpio12";
+				function = "qup2_se0";
+			};
+
+			qup_uart16_rx: qup-uart16-rx-state {
+				pins = "gpio13";
+				function = "qup2_se0";
+			};
 		};
 
 		sram: sram@146d8000 {
-- 
2.34.1


