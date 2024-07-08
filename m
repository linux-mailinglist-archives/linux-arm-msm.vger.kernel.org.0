Return-Path: <linux-arm-msm+bounces-25525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971792AAEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13F47283215
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 21:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD66D4503B;
	Mon,  8 Jul 2024 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nbIApz44"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED212E75;
	Mon,  8 Jul 2024 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720473318; cv=none; b=eQ1C5pnYfE/ONdCnw/vI+seH8g67rmt0W+q2vsN5WqsAg3BTwIZRPZbX0a2evtq5Q7NEH2rXoOhu9l273XCb4I/KhugxXMtI4WZ3hR5/wF+twhqbjchZPCfETkJJW5CBmvApXs5Wd4hgvk6Y6tZZw3FIWAshwPH+b8eWZdpKZjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720473318; c=relaxed/simple;
	bh=kAc6w7ha10sYNCEe/V6aYJmYQvnIrUSX27i4gmDVeaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=tb/wi7aUNdBvleFLUXCEEO9vix/3W9QDc568McfGeoeV6bbCMqFNVTjNvRRdUD0isj0i93cmFvFwblt/RMxAKU5SYOy5gkUK+YTMTq8/jn45F1i+obPqG3E8rzXL6W7Z9Gwv78DnjJR4h7Z5Ncu4IDU7K+4xyTUlw9ZfSMowcRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nbIApz44; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 468BwTvk025637;
	Mon, 8 Jul 2024 21:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HIraQW69nRCntJylblT984
	/L8ukZ5pc+efMd0GeGwhk=; b=nbIApz44TDoEtAqJlDyc7uwdWdfby7UYYXUqCn
	vQTbPL8awqp7TxGcNAinhnPY2mDILZoFi2exaBiyZJUnpBsfFd8HrXYwJCYcIQ/s
	7SQvCqMGhXP6KMu0+bfIB0H+Bqn5bDzh/GBfCYrti1RWA9tjYgtup8b/5lJOlcu+
	pnopY0uC77fNKnGup4GNA241JY/yyNxu2hPXLcYlF8yMrPo9HjsMeehSv/r5sXur
	5G2EKAJJlkzhZgaFqlqhyERsHk7N+RRSSlg3LOk4bfER56gKeLEnTv27SIz+ChtO
	ORjCmEOgSbQFL/FwFlgwCGxOpeWQjL9gjCdiUvqwZcBLxuHw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8vt0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jul 2024 21:15:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 468LF6gk030793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jul 2024 21:15:06 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 8 Jul 2024 14:15:03 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Mon, 8 Jul 2024 14:14:47 -0700
Subject: [PATCH] arm64: dts: qcom: sa8775p: Add interconnects for ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMZWjGYC/x3MQQqAIBBA0avIrBPUgrKrRIjZVLNIQ6WC6O5Jy
 7f4/4GEkTBBzx6IeFKi4AtkxcBt1q/IaS4GJVQjWlFzcs5MlzlDJr8a3K0zc07ElRV60VZ2sm2
 g1EfEhe7/PIzv+wFnY8UVaQAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Andrew Halaney
	<ahalaney@redhat.com>, <kernel@quicinc.com>,
        Sagar Cheluvegowda
	<quic_scheluve@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bqWY1VxPVVcV1HvT7K3kLRKBqr30oM4O
X-Proofpoint-ORIG-GUID: bqWY1VxPVVcV1HvT7K3kLRKBqr30oM4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_11,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407080157

Define interconnect properties for ethernet hardware.

Suggested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Adding interconnect dtsi properties within ethernet node of SA8775P,
this patch is adding support for the interconnect properties defined
in the series ->  
https://lore.kernel.org/all/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..7ebf03953b7b 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3464,6 +3464,12 @@ ethernet1: ethernet@23000000 {
 				      "ptp_ref",
 				      "phyaux";
 
+			interconnect-names = "mac-mem", "cpu-mac";
+			interconnects = <&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>;
+
 			power-domains = <&gcc EMAC1_GDSC>;
 
 			phys = <&serdes1>;
@@ -3499,6 +3505,12 @@ ethernet0: ethernet@23040000 {
 				      "ptp_ref",
 				      "phyaux";
 
+			interconnect-names = "mac-mem", "cpu-mac";
+			interconnects = <&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>;
+
 			power-domains = <&gcc EMAC0_GDSC>;
 
 			phys = <&serdes0>;

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-icc_bw_voting_emac_dtsi-2a09f9a18174

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


