Return-Path: <linux-arm-msm+bounces-35198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 518319A62EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DE98281E95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 10:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2131E630C;
	Mon, 21 Oct 2024 10:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mokl9gNU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864C1E47DD;
	Mon, 21 Oct 2024 10:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729506509; cv=none; b=rgk0A2ap/pWp8nk4yCaaS8bVTbbxX1TlO7Bnxjtz7rrlIVALx/MI/k6bL99NEbWOx5mx4MUXkGJ+LFKAtFkbHZXDKN9SndAz6jST19d44huZfPjuits03h2fSBbahGYPdM2VGFzSGp/b2cn0bxwhs35zutw+4mUHL82cAtO+byQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729506509; c=relaxed/simple;
	bh=E9t0rHw4ovdpue02x1aiNVZryWoj5dt86N2ebwbgM94=;
	h=From:To:Cc:Subject:Date:Message-Id; b=JIHX/lKRaXC1ODX8qmQaT7PloraIKd/BTkSybe438iwCsvnA+CpkaQxPYrqh/WSmxe93DR0BekzvyWpM35v9ZKIUcDst+Z8DSwhRo/yrT9/OdKhDKbEB5GMalVGfRU7URgPLgbO1mFb9PaQrt73QCNwvy8eMhxXSt54PrckSvkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mokl9gNU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAArdd014572;
	Mon, 21 Oct 2024 10:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=4Z7KAcG3gPWc
	BkUNYJEZ+Eb8thYY5hXY3vWyxGYZpLY=; b=Mokl9gNUqvo8a9Av2bvH7wRpdvzg
	SAfn8JQqFVyfSlDPel7NEX02AKQ6I7kskEurhPp+yfRnUlKmY2kVeVGwkA/cCSg1
	CeczMz5m6PBMYPHCyofYfptlnOvjUriq/lj0Kj0xSAvKpq4Rm3xCmiKcdPs98f8A
	ZahTllt8RwLeIMwwTOr1iuf87mqSYKZ1jG228JGWBH9IGcGh8veIbU0+wEHqUvg5
	N/zCnuZ5Z7MPiDGf15QhuNYW7nRfkUwl7z3zjDRjGX1f1DSChuaNO9HdAnA2rN73
	GdGgxBdhiPakuA3AceNdiHEhZg32Ao+En93oR07l4poGrf/w0kweHOcNMA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vxv7wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 10:28:22 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49LASI4m005408;
	Mon, 21 Oct 2024 10:28:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42cq69sdjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 21 Oct 2024 10:28:18 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49LASI1d005402;
	Mon, 21 Oct 2024 10:28:18 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.106.28])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 49LASIg5005401;
	Mon, 21 Oct 2024 10:28:18 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4047106)
	id 525CB5001C2; Mon, 21 Oct 2024 15:58:17 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: sa8775p: Add GPI configuration
Date: Mon, 21 Oct 2024 15:58:15 +0530
Message-Id: <20241021102815.12079-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LI713WrTTTa16X5yCyxTOOYys8sK6rbK
X-Proofpoint-GUID: LI713WrTTTa16X5yCyxTOOYys8sK6rbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210075
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

I2C and SPI geni driver also supports the GSI node based
on client requirements. Currently, in the DTSI, the GSI mode
configuration is not added.

Therefore, add GPI DT nodes for QUPV_0/1/2/3 for I2C and SPI
for the SA8775.

Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 246 ++++++++++++++++++++++++++
 1 file changed, 246 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 07b3d9f65684..47b5fb4d83a9 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/firmware/qcom,scm.h>
@@ -852,6 +853,28 @@
 			#mbox-cells = <2>;
 		};
 
+		gpi_dma2: qcom,gpi-dma@800000  {
+			compatible = "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00800000 0x0 0x60000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu 0x5b6 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_id_2: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
@@ -882,6 +905,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -903,6 +930,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -939,6 +970,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -960,6 +995,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -996,6 +1035,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1015,6 +1058,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1053,6 +1100,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1074,6 +1125,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1108,6 +1163,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				#address-cells = <1>;
 				#size-cells = <0>;
 				status = "disabled";
@@ -1131,6 +1190,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1167,6 +1230,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1188,6 +1255,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1224,6 +1295,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1245,6 +1320,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
+				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1265,6 +1344,28 @@
 
 		};
 
+		gpi_dma0: qcom,gpi-dma@900000  {
+			compatible = "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00900000 0x0 0x60000>;
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
+			dma-channels = <12>;
+			dma-channel-mask = <0xfff>;
+			iommus = <&apps_smmu 0x416 0x0>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x9c0000 0x0 0x6000>;
@@ -1295,6 +1396,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1316,6 +1421,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				     <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1352,6 +1461,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1373,6 +1486,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1409,6 +1526,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1430,6 +1551,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1466,6 +1591,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1487,6 +1616,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1523,6 +1656,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1544,6 +1681,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1580,6 +1721,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1601,6 +1746,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1620,6 +1769,28 @@
 			};
 		};
 
+		gpi_dma1: qcom,gpi-dma@a00000  {
+			compatible = "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00a00000 0x0 0x60000>;
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
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x00ac0000 0x0 0x6000>;
@@ -1650,6 +1821,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1671,6 +1846,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1708,6 +1887,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1729,6 +1912,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1766,6 +1953,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1787,6 +1978,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1823,6 +2018,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1844,6 +2043,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1881,6 +2084,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1902,6 +2109,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1939,6 +2150,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1960,6 +2175,10 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -1996,10 +2215,29 @@
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
+
 			};
 		};
 
+		gpi_dma3: qcom,gpi-dma@b00000  {
+			compatible = "qcom,sm6350-gpi-dma";
+			reg = <0x0 0x00b00000 0x0 0x58000>;
+			#dma-cells = <3>;
+			interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&apps_smmu 0x056 0x0>;
+			dma-channels = <4>;
+			dma-channel-mask = <0xf>;
+			status = "disabled";
+		};
+
 		qupv3_id_3: geniqup@bc0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0xbc0000 0x0 0x6000>;
@@ -2030,6 +2268,10 @@
 							 "qup-config",
 							 "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma3 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
@@ -2051,6 +2293,10 @@
 							 "qup-config",
 							 "qup-memory";
 				power-domains = <&rpmhpd SA8775P_CX>;
+				dmas = <&gpi_dma3 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma3 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx",
+					    "rx";
 				status = "disabled";
 			};
 
-- 
2.17.1


