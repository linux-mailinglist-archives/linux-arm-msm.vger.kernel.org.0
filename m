Return-Path: <linux-arm-msm+bounces-32751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD253989D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 10:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9982D284C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2024 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4C217E8F7;
	Mon, 30 Sep 2024 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jJp9eA5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E813DB92;
	Mon, 30 Sep 2024 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727686546; cv=none; b=SPgQJy37dqPlPrk8gkJtGb5nKlYFTk3pXK4uew0SU2xMqgpSpxZa2rFSYMojGMCYKVTPewuem3D3Y7XJXkjJM4Dc3DfV2O9cyZcAHjBU1MUVa6XUNlHorbq0I+GL00T9xEUpkRA/fdfiGq9niO1B23pgtGpLcLyc0l3o133aa0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727686546; c=relaxed/simple;
	bh=EHM5Ws82vY6Pm804jdMEbE5GqmmXlVlZp76dlahF5U8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Rs4x5XD9VtG6mBc4uR5ZIc400yWhQQElYVGfBfCz+nu7Ju/Sh+p0VQVwX/Sp+Ay6NyzJsOUjkDhe6c4whlnydh/FGgVM59HSImU4WBvG3DQRHVz08AnxRaC8HErVg0oIaPK9hzx2lFao80OwFXdcQWed6p8QOPFMXUsAaPx3CMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jJp9eA5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48TKlAQF015533;
	Mon, 30 Sep 2024 08:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=k28U/H/r64Pi
	AM4h5OwZDEkE5e4KErQ3UThfmdWNcCo=; b=jJp9eA5M6WMSqH0EYbIXvuqCVEdp
	LFkGPB+ePnHJMts9bpxufBdiTFQSI/m6jjh0gKekIbEuHEpCddM/6IEdA0U6PnsR
	Rqb3n3gfcI24OZIUAHz1UbnC5jqc4XjURnlZzM7stsB8FlWptmcQUKkmXvLwlP2X
	qTwVZGgZapr/Au4iyC9Uu8/wz0cYv9KW6+gOkxpAEfXTopy272S4cIf0D8TLkLnR
	h7zgW81i3VYOZ0Oy/nmBOWQI+C94anFpi2RN+c0gv44bmfB8xCUp9At/eOVndO+P
	phhg/8hvjLbSDpiuONCK4NdO5g7Sfl2ibwmPfgXRU9Xlzlx+JOOqpdQ1CA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xaymc440-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 08:55:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48U8taXK008739;
	Mon, 30 Sep 2024 08:55:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41xavks293-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 30 Sep 2024 08:55:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48U8ta9p008590;
	Mon, 30 Sep 2024 08:55:36 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48U8talf008589;
	Mon, 30 Sep 2024 08:55:36 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 8A8B15001D1; Mon, 30 Sep 2024 14:25:35 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [RESEND PATCH v2] arm64: dts: qcom: sa8775p: Populate additional UART DT nodes
Date: Mon, 30 Sep 2024 14:25:33 +0530
Message-Id: <20240930085533.17119-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ng9rXIMkW-_8f-Jdp1YH6ygsl0aFX1Q9
X-Proofpoint-GUID: Ng9rXIMkW-_8f-Jdp1YH6ygsl0aFX1Q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300063
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Currently, UART configuration is populated for few
SEs(Serial engine) only in sa8775p DTSI file.

Populate UART configurations of remaining SEs for sa8775p soc.

Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
v1 -> v2:

- Modifed commit log as requested by Krzysztof.
- Added co-developed-by tag.

v1 Link: https://lore.kernel.org/linux-arm-msm/98e7dc28-4413-4247-bad1-98b529f6d62d@kernel.org/T/
---
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 231 ++++++++++++++++++++++++++
 1 file changed, 231 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..0c95a23aecec 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -905,6 +906,21 @@
 				status = "disabled";
 			};
 
+			uart14: serial@880000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00880000 0x0 0x4000>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c15: i2c@884000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x884000 0x0 0x4000>;
@@ -947,6 +963,21 @@
 				status = "disabled";
 			};
 
+			uart15: serial@884000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00884000 0x0 0x4000>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c16: i2c@888000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x888000 0x0 0x4000>;
@@ -989,6 +1020,21 @@
 				status = "disabled";
 			};
 
+			uart16: serial@888000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00888000 0x0 0x4000>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c17: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x88c000 0x0 0x4000>;
@@ -1088,6 +1134,21 @@
 				status = "disabled";
 			};
 
+			uart18: serial@890000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c19: i2c@894000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x894000 0x0 0x4000>;
@@ -1130,6 +1191,21 @@
 				status = "disabled";
 			};
 
+			uart19: serial@894000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00894000 0x0 0x4000>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c20: i2c@898000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x898000 0x0 0x4000>;
@@ -1171,6 +1247,22 @@
 				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
+
+			uart20: serial@898000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00898000 0x0 0x4000>;
+				interrupts = <GIC_SPI 834 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 		};
 
 		qupv3_id_0: geniqup@9c0000 {
@@ -1227,6 +1319,21 @@
 				status = "disabled";
 			};
 
+			uart0: serial@980000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x980000 0x0 0x4000>;
+				interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c1: i2c@984000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x984000 0x0 0x4000>;
@@ -1269,6 +1376,21 @@
 				status = "disabled";
 			};
 
+			uart1: serial@984000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x984000 0x0 0x4000>;
+				interrupts = <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@988000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x988000 0x0 0x4000>;
@@ -1311,6 +1433,21 @@
 				status = "disabled";
 			};
 
+			uart2: serial@988000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x988000 0x0 0x4000>;
+				interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c3: i2c@98c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x98c000 0x0 0x4000>;
@@ -1353,6 +1490,21 @@
 				status = "disabled";
 			};
 
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x98c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c4: i2c@990000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x990000 0x0 0x4000>;
@@ -1395,6 +1547,21 @@
 				status = "disabled";
 			};
 
+			uart4: serial@990000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x990000 0x0 0x4000>;
+				interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core", "qup-config";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
+
 			i2c5: i2c@994000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x994000 0x0 0x4000>;
@@ -1507,6 +1674,22 @@
 				status = "disabled";
 			};
 
+			uart7: serial@a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
+
 			i2c8: i2c@a84000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0xa84000 0x0 0x4000>;
@@ -1549,6 +1732,22 @@
 				status = "disabled";
 			};
 
+			uart8: serial@a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a84000 0x0 0x4000>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
+
 			i2c9: i2c@a88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0xa88000 0x0 0x4000>;
@@ -1706,6 +1905,22 @@
 				status = "disabled";
 			};
 
+			uart11: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00a90000 0x0 0x4000>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
+
 			i2c12: i2c@a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0xa94000 0x0 0x4000>;
@@ -1838,6 +2053,22 @@
 				power-domains = <&rpmhpd SA8775P_CX>;
 				status = "disabled";
 			};
+
+			uart21: serial@b80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x00b80000 0x0 0x4000>;
+				interrupts = <GIC_SPI 831 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP3_S0_CLK>;
+				interconnect-names = "qup-core", "qup-config";
+				interconnects = <&clk_virt MASTER_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_3 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_3 QCOM_ICC_TAG_ALWAYS>;
+				power-domains = <&rpmhpd SA8775P_CX>;
+				operating-points-v2 = <&qup_opp_table_100mhz>;
+				status = "disabled";
+			};
 		};
 
 		rng: rng@10d2000 {
-- 
2.17.1


