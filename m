Return-Path: <linux-arm-msm+bounces-30040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE097964701
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 15:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0BF01C20BA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B111AED49;
	Thu, 29 Aug 2024 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N095giUz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EDE1AE860;
	Thu, 29 Aug 2024 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724938862; cv=none; b=slOIzN75wduJdaNsY2DLeEMEXlrMrsnbh0GtAgb8INVH7Z7hEnPFBLLYN6eZd4oLLwVyTylkD3BndbrVAqDtqarSMLrgmsA/SfUQIeIkEU/XrFWAOqUZxcYWcExE/vil2oNTsJE1unOsQA/zLwNzqStw3tOGez0tsSRJ4oYivL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724938862; c=relaxed/simple;
	bh=7OF/1Q+Bgf6uvmsLyNLfEaKaJz4+VhCfNN5LRsUusQg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MXBrAWiH2vC4SBGgPSDyCzmnbSPnkeRt+yqJ/Lj8xtn2T9a5BRbqegctPpa8ixaDw3N0CSKjYb2Y53bq3MMfKVTujycOICFEmj6VC7vhSzWP5h6pmGwSNWO3Z1fybM4ILrD2Vbval+kdB6ehwnEoh8OaTq/Dxy9nG0kbu3e0FxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N095giUz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8WkXR030353;
	Thu, 29 Aug 2024 13:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lOn9U/uwJF+sEn9lfBTyTqUFLrypSYD0f8j/KzWz7Uo=; b=N095giUzra50D9rL
	6p0R69wld4jroYX36GUuD9Skb8FA22Y/XgDL8h3dgH8jZMySV8SlY0Bdvzc5G/LD
	HD1zto30bRUzDDYNBk9XC8gn6Kb8APe7GnG1Zt873kk298UYCoS7tbj1sBbsjyVt
	Pe3WmEODYvgGE8gNExgen8Vajk+0p3W5X6+SJ1B5adf3OlpQ9EO2bKwOQ5fqqwH0
	KvkF15B7BEM5BBl1p/pqOaXTBHR0+EnhyDW3HZltPayW55NJsc5hGG7o8vmfgl62
	TOz5aMECNaVoh3kHyQ/jix+Rfp4JNxtiBt9mK/nMbiP4cXQcV8S0aQ5Z+ismEojp
	R3Nt2w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puudbu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:40:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TDevHS025789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 13:40:57 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 06:40:53 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH V2 4/4] arm64: dts: qcom: ipq9574: add nodes to bring up q6
Date: Thu, 29 Aug 2024 19:10:21 +0530
Message-ID: <20240829134021.1452711-5-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
References: <20240829134021.1452711-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EIil7okAnoHqQnKZD2verxxYU8xkG7-a
X-Proofpoint-ORIG-GUID: EIil7okAnoHqQnKZD2verxxYU8xkG7-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=837 mlxscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290094

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
changes since v1: Addressed comments by Krzysztof
	- updated the order of items to 'qcom,smem-states' keeping
	  'stop' first based on changes to binding documentation.

 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 58 +++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 08a82a5cf667..2d55f0697225 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -213,6 +213,11 @@ smem@4aa00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		q6_region: wcnss@4ab00000 {
+			reg = <0x0 0x4ab00000 0x0 0x2b00000>;
+			no-map;
+		};
 	};
 
 	soc: soc@0 {
@@ -756,6 +761,35 @@ frame@b128000 {
 				status = "disabled";
 			};
 		};
+
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq9574-wcss-sec-pil";
+			reg = <0x0cd00000 0x4040>;
+			firmware-name = "ath11k/IPQ9574/hw1.0/q6_fw.mdt";
+			interrupts-extended = <&intc GIC_SPI 325 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 321 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
 	};
 
 	thermal-zones {
@@ -987,4 +1021,28 @@ timer {
 			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
+
+	wcss: wcss-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.34.1


