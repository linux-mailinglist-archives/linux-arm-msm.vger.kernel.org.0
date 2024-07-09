Return-Path: <linux-arm-msm+bounces-25732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3FD92C33B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 20:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C0C1C22AB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 18:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0303180024;
	Tue,  9 Jul 2024 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e5vpixVo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0F17B020;
	Tue,  9 Jul 2024 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720549325; cv=none; b=f+P96q1jUjITgTpEsOGF8sKxzyfh/Dwk+qHBkVFJciUgL7GYzkxg9E8ayrL14IVUuoa4iOHhR5EZPRHiF798kHYFFK8/RQLcI/lxxXArj6X6ochPWFIBI1zunMPlv5TSRcxyNa2wlnZ4sDXubbsF8W4rFCtbfEZ7xAHgfJahorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720549325; c=relaxed/simple;
	bh=AepMg0xafuVDLMArb1Kir6rVZXYbez0Hvk8SVdhKTTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=ogUHQPM3HNwU9GHAOnPKW9oj/627DG4Awd6CJ3Bcs/N4MabPTk6Yb9pVIV3iKHZkPOEulBti381PsdwAIiTdWmzhXIhVo4Lr99gUXPPGE1YeLDlflc/4emjLCEv+Vd8ComKb7A01GHUSIfYzsONpgYPeizll9a+40FxwMnaLzLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e5vpixVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AcgoQ020395;
	Tue, 9 Jul 2024 18:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DrLa1/qOSyd13mUrhEe07s
	wQvk5h3/sYzyzSSp6FFes=; b=e5vpixVoG2SO91+UZ4wOiofC3iwsLYwbbpfQN+
	yCRxbhJxolVoR58z6t4sautVRBXjmbvw3ajq7JMLv3wPxy5wMQGeFiBqXhSNneKv
	xYjfE0JyU16gUSCO5uBgKoKmV+/RVgEQnTszTSnGNqvDnvT1SqejC/AEZ5ZBzcWC
	2ZA7QWUPVpI5FUaBmgUxG8baRXoPx8vdBtE7u4FQyGcOrGgoUdcYZ8xYfOaYxC3L
	o8A00DZEZBfeHxgr9Tvf3jgiZ/9TxT/q+DQJcz1zXPbw6xOvc385QTeQ+SSj1m5H
	g327oqKalmYlrReZXdfj0nua341uUgE1n+z0gbyx9TQ6jvhg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x0t7hb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 18:21:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469ILu59002082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 18:21:56 GMT
Received: from hu-scheluve-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 11:21:52 -0700
From: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Date: Tue, 9 Jul 2024 11:21:40 -0700
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: Add interconnects for
 ethernet
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-icc_bw_voting_emac_dtsi-v2-1-a1e02c7099a5@quicinc.com>
X-B4-Tracking: v=1; b=H4sIALN/jWYC/3WNwQ6CMBAFf4Xs2Zq2YABP/ochTVkK7IFW21o1h
 H+3knj0OJO8eSsE48kEOBcreJMokLMZ5KEAnLWdDKMhM0guK17zkhGi6p8quUh2UmbRqIYYiEn
 N27HVohF1BXl982ak116+dplnCtH5936UxNf+ms3fZhJMsKrnrehLceLIL/cHIVk8olug27btA
 0wrN3jAAAAA
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
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hk_VF3wUYlqJUFHOWrucJhHhYRHJMqgI
X-Proofpoint-ORIG-GUID: hk_VF3wUYlqJUFHOWrucJhHhYRHJMqgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_07,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090124

Define interconnect properties for ethernet hardware.

Suggested-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
---
Adding interconnect dtsi properties within ethernet node of SA8775P,
this patch is adding support for the interconnect properties defined
in the series ->  
https://lore.kernel.org/all/20240703-icc_bw_voting_from_ethqos-v3-0-8f9148ac60a3@quicinc.com/
---
Changes in v2:
- Rearrange the interconnect properties for SA8775P to follow the below order.
	property
	property-names
- Link to v1: https://lore.kernel.org/r/20240708-icc_bw_voting_emac_dtsi-v1-1-4b091b3150c0@quicinc.com
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23f1b2e5e624..cc4ad901fbac 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3464,6 +3464,12 @@ ethernet1: ethernet@23000000 {
 				      "ptp_ref",
 				      "phyaux";
 
+			interconnects = <&aggre1_noc MASTER_EMAC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC1_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mac-mem", "cpu-mac";
+
 			power-domains = <&gcc EMAC1_GDSC>;
 
 			phys = <&serdes1>;
@@ -3499,6 +3505,12 @@ ethernet0: ethernet@23040000 {
 				      "ptp_ref",
 				      "phyaux";
 
+			interconnects = <&aggre1_noc MASTER_EMAC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_EMAC_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mac-mem", "cpu-mac";
+
 			power-domains = <&gcc EMAC0_GDSC>;
 
 			phys = <&serdes0>;

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-icc_bw_voting_emac_dtsi-2a09f9a18174

Best regards,
-- 
Sagar Cheluvegowda <quic_scheluve@quicinc.com>


