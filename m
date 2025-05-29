Return-Path: <linux-arm-msm+bounces-59793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B1EAC7A81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3A01BA0315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 08:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D95621A459;
	Thu, 29 May 2025 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TRi+P/zG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1FA218EBE;
	Thu, 29 May 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748509067; cv=none; b=GMNcZk2qB8ASFtZoSiL/d1eaJ+bisIZ9m+t0dOfqStYSfncU0bxESvpEL5azz40hHEGZChD1Y8ZmcZ4s7Fto4M1n416z8GnKJfRJwr2fpC8oLVo+PwnubcyFeqUH9WHgmQbopUvBkMQphVlYhLheIuP8ZUKdU36X1p3lrWZ4vPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748509067; c=relaxed/simple;
	bh=gwhVLbZF099eROMkEC8XE0b2klcexfLcuN96AHPbblo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c2qOLDoQMCsX9se35HYtbX7Llno0nUQDssrxHra9jMSU81/G9tC/ArRVpigg3N3EdXhm5C+iHH56C36AEkKu1H9hkUTGXbQHQieaJjTjGKFPx8AEJi4bnTC+tulCCwqhiK1JVqJbbR8I0jB64JpBfTy2RQiI1x29K9go5B6zgd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TRi+P/zG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7RWnX005124;
	Thu, 29 May 2025 08:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yVVUvl6WX+u50QYLWwyjaK
	t8OPieUs6wFPOv8ArJM+8=; b=TRi+P/zGvZMr7W3aoBW/iprJsBXgo+qb1RBgaI
	pruu4aQ7goG1KXGTj0Wqj9FMew6F8hEy4x4gLiZu8skDTllzPODvH9aFXMtekBYb
	spxL+11V6dtNZb82PU44WBWK1HC836+GAryxKlc6X8Rxnf5RYUkLe8aVqih1Iwag
	KLA145WQFFXvR7kAhGX4J8SxnV3i2wKlLXqbXsmcQaxGW/RLb1nqfvA+4PFV2plb
	uPoYdzUxZzts34Q+X6JEFzSL1+AoaCaO4AJp16V57ZBVBXD8XldqIWS5j7w/J5Jy
	ilxICOPK/Aw4YeT9NUVjBcIJQ2E8vIVgEOkOJ96/nsmClmWw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d79sff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:57:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54T8veag014358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 May 2025 08:57:40 GMT
Received: from yingdeng-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 May 2025 01:57:37 -0700
From: Yingchao Deng <quic_yingdeng@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Yingchao Deng <quic_yingdeng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: Add coresight node for SM8650
Date: Thu, 29 May 2025 16:56:41 +0800
Message-ID: <20250529085650.3594253-1-quic_yingdeng@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: igMDbegCjo3uoejD20p-5fltLfXokkrU
X-Proofpoint-ORIG-GUID: igMDbegCjo3uoejD20p-5fltLfXokkrU
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=68382185 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=Ha4kKTd9ViBVhOXr9W0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA4NiBTYWx0ZWRfXyMBQ/vNRTDe7
 FkZRv/WRMqG5s2tGmkNcp5rmRQILKYFRaZOmdotNaIxK9zAF66h9CvG9q4GdNVa1y3V1asO2m18
 LoXKiJsBLirC+TGT8tD78AD5mTki9qH7cgayJSZQlXBI8UAFd0quIglWp5S3ilcR0ap6pgzWsln
 Wzw0KzGuSOX2TD3xzY5egGKmRQbkPD5wHLKUqUdw4HI0MmBln7CN8auwBoNPil3aNn+dP3gIkMp
 qerl1xjCVotvGmcxWFYA2lbaf2d73cChZy6EsRvy5PriihBp0dWNb2LreTGT/2mWGuNmQRyitWD
 bVXfH9YO+sm+v58J6T4mVtdA9k1JImxR5O1ld6BKyrbliJgzEpxfScGW82DOWAwvuSyyAnk8EkZ
 PgkxUTmHzWYd9it93CLFoxOc2Zh2bNxV23zUBdo862FPTUXpMRkx/5bs50FFM3oW8CIEcDlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=676 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290086

Add coresight components on the path from stm to etr.

Signed-off-by: Yingchao Deng <quic_yingdeng@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 250 +++++++++++++++++++++++++++
 1 file changed, 250 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a932..5e1854a0e15f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5052,6 +5052,82 @@ data-pins {
 			};
 		};
 
+		ctcu@10001000 {
+			compatible = "qcom,sa8775p-ctcu";
+			reg = <0x0 0x10001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					ctcu_in0: endpoint {
+					remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					ctcu_in1: endpoint {
+					remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
+		stm@10002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0x0 0x10002000 0x0 0x1000>,
+				<0x0 0x16280000 0x0 0x180000>;
+			reg-names = "stm-base", "stm-stimulus-base";
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					stm_out_funnel_in0: endpoint {
+						remote-endpoint =
+						<&funnel_in0_in_stm>;
+					};
+				};
+			};
+		};
+
+		funnel@10041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0x0 0x10041000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+					funnel_in0_in_stm: endpoint {
+						remote-endpoint =
+						<&stm_out_funnel_in0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					funnel_in0_out_funnel_qdss: endpoint {
+						remote-endpoint =
+						<&funnel_qdss_in_funnel_in0>;
+					};
+				};
+			};
+		};
+
 		funnel@10042000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 
@@ -5094,6 +5170,14 @@ in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					funnel_qdss_in_funnel_in0: endpoint {
+						remote-endpoint = <&funnel_in0_out_funnel_qdss>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
@@ -5112,6 +5196,133 @@ funnel_qdss_out_funnel_aoss: endpoint {
 			};
 		};
 
+		replicator@10046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_qdss_in_replicator_swao: endpoint {
+						remote-endpoint =
+						<&replicator_swao_out_replicator_qdss>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					replicator_qdss_out_replicator_etr: endpoint {
+						remote-endpoint =
+						<&replicator_etr_in_replicator_qdss>;
+					};
+				};
+			};
+		};
+
+		tmc@10048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x10048000 0x0 0x1000>;
+
+			iommus = <&apps_smmu 0x04e0 0>,
+				<&apps_smmu 0x04c0 0>;
+			dma-coherent;
+			arm,scatter-gather;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etr_in_replicator_etr: endpoint {
+						remote-endpoint =
+						<&replicator_etr_out_tmc_etr>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint =
+						<&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@1004e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x1004e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_etr_in_replicator_qdss: endpoint {
+						remote-endpoint =
+						<&replicator_qdss_out_replicator_etr>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					replicator_etr_out_tmc_etr: endpoint {
+						remote-endpoint =
+						<&tmc_etr_in_replicator_etr>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					replicator_etr_out_tmc_etr1: endpoint {
+						remote-endpoint =
+						<&tmc_etr1_in_replicator_etr>;
+					};
+				};
+			};
+		};
+
+		tmc@1004f000 {
+			compatible = "arm,primecell";
+			reg = <0x0 0x1004f000 0x0 0x1000>;
+
+			iommus = <&apps_smmu 0x0500 0x0>;
+			dma-coherent;
+			arm,scatter-gather;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					tmc_etr1_in_replicator_etr: endpoint {
+						remote-endpoint =
+						<&replicator_etr_out_tmc_etr1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint =
+						<&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		funnel@10b04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 
@@ -5157,6 +5368,45 @@ tmc_etf_in_funnel_aoss: endpoint {
 					};
 				};
 			};
+
+			out-ports {
+				port {
+					tmc_etf_out_replicator_swao: endpoint {
+						remote-endpoint =
+						<&replicator_swao_in_tmc_etf>;
+					};
+				};
+			};
+		};
+
+		replicator@10b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x10b06000 0x0 0x1000>;
+
+			qcom,replicator-loses-context;
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					replicator_swao_in_tmc_etf: endpoint {
+						remote-endpoint =
+						<&tmc_etf_out_replicator_swao>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					replicator_swao_out_replicator_qdss: endpoint {
+						remote-endpoint =
+						<&replicator_qdss_in_replicator_swao>;
+					};
+				};
+			};
 		};
 
 		funnel@13810000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


