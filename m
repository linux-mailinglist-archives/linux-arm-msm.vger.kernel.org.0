Return-Path: <linux-arm-msm+bounces-38228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDB69D1162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:06:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2EC9283F7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C80C1B6544;
	Mon, 18 Nov 2024 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TfscZ4B8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15351B3938;
	Mon, 18 Nov 2024 13:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935068; cv=none; b=RZjMeYT+s57wuha+Lj5c+T2saWZ3i/fEIXtNbW5kp5mCV5cwf27ea/ffsb/BnIG7miZi+9+9Glcbkez96QouaAiCRSnKYAS7pPlfGbQ/MhO/x7YsFiAlymILH+kQRGDIH8fkzEEPQUfL53xDLTKuv261S62avX1Gr9bYb3b12Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935068; c=relaxed/simple;
	bh=bHps3WNDpf4wtu/Pqk7zjhN/mBMIOF1lKs5VFmu9u9Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I7BEJTHJdY3l8y3RYIKnZGjqhwmQqiKYQCYXgN2qiwWkABmr1oE5gMlVvs5oaojMIHruwnVqsFVV0MNLFAX8kg17wehg/rUW68/ke3TiKpHG+nWTHtxIduXWee6WKe8ECrESdTq83SnwUiqZS4fmObWNt/yqnAp64bpQTkO6hQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TfscZ4B8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5SqJZ032232;
	Mon, 18 Nov 2024 13:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T30O+9myPPkP/Wa/PgxrV4
	Tzfo1X6Ho4GxNcxwpxKwg=; b=TfscZ4B8i1e4pafSwRBZ+q5IlIYmVg2gJGFCIF
	eR2SYpIQNMXuU7bea22MMFwKXyclf2AX/ri+MQ/cRUNRuMCNeX22IKN5ShPop2gt
	CxwrgwY3ztwMTLIU8cg1AQHICOQfHpTcgrQ52IDX+k97zfHxaU0AoyQneSrMMScx
	/lJ3pYoiA7AZnzdktHu0refDv5qjakOQuLuzLCUqjtLWZci+1UX0NZPcjvsyVMwP
	dOZRQmIvEhVjN6sNY6ArUtQG8PNkd7d8p9Nrbxf2AOQumRU8Q2GzDHMiRnLs3WYd
	k0kWsvShOF+L8bdz8xgsfReH2YQJuSngzm2qbBm4MsKIlkbg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv9vr87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 13:04:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AID4Kga004615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 13:04:20 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 05:04:15 -0800
From: Ling Xu <quic_lxu5@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <quic_ekangupt@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ling Xu
	<quic_lxu5@quicinc.com>
Subject: [PATCH v2] arm64: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes
Date: Mon, 18 Nov 2024 18:33:43 +0530
Message-ID: <20241118130343.3675277-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aarM-fHQTxaFn61KrAmeOn8XPfAQfcKa
X-Proofpoint-ORIG-GUID: aarM-fHQTxaFn61KrAmeOn8XPfAQfcKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=682 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180109

Add ADSP and CDSP0 fastrpc nodes for QCS8300 platform.

Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
---
This patch depends on patch https://lore.kernel.org/all/20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com/#t
Changes since v1:
 - Remove duplicate cdsp fastrpc nodes
 - Add adsp memory-region and vmids
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 81 +++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..fdfec15f606e 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -762,6 +763,38 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "lpass";
 				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x2003 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x2004 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x2005 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 
@@ -1361,6 +1394,54 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x19c1 0x0440>,
+							 <&apps_smmu 0x1dc1 0x0440>,
+							 <&apps_smmu 0x1961 0x0400>,
+							 <&apps_smmu 0x1d61 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x19c2 0x0440>,
+							 <&apps_smmu 0x1dc2 0x0440>,
+							 <&apps_smmu 0x1962 0x0400>,
+							 <&apps_smmu 0x1d62 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x19c3 0x0440>,
+							 <&apps_smmu 0x1dc3 0x0440>,
+							 <&apps_smmu 0x1963 0x0400>,
+							 <&apps_smmu 0x1d63 0x0400>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x19c4 0x0440>,
+							 <&apps_smmu 0x1dc4 0x0440>,
+							 <&apps_smmu 0x1964 0x0400>,
+							 <&apps_smmu 0x1d64 0x0400>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 	};
-- 
2.34.1


