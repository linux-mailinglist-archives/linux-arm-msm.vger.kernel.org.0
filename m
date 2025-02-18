Return-Path: <linux-arm-msm+bounces-48323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680DAA39410
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5892F3B7627
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 07:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42F3D1C5D6E;
	Tue, 18 Feb 2025 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bhYJN+Iu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34AA1BC07B;
	Tue, 18 Feb 2025 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864593; cv=none; b=dsLcSC/SiJUUAFvjrHiiFuNjrdK7qkfGzvBsessmcsnbXZfRzcTkCvyWXuPG/wMPrEAB6CKFYzyjPjYaouy8VGIwCdHwrZtbo7FXIgSg3sVBBu8rtK9ViBprNM5vj8+LeWm10KXP4l3esXxx87d0mhqXaXRLZUkZfLWPGdrW1mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864593; c=relaxed/simple;
	bh=IGnYlnCmTaS8mNd7QTNJRpIo2yNqswDiNM1aivm3f+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rn2XEbrtxhkFWkwHKvEr77GqcguI0zXWAkJr0XDrH5vcWIofKHHUKkbob7IQRQQBeu2dGPh38DS/SaKvFxLIboqg61CSq0Ocfef2v94qaPJwi53lWFSPZHiWAWg625By/JhbXL3hS/9ceif1CaV5cH49YHY19FE/TJBQ3ISVuMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bhYJN+Iu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HMpjW7028586;
	Tue, 18 Feb 2025 07:43:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lWXe/D40KTJXrGXuoNXt5j
	DuAYNmR+E6160oFRqEgjc=; b=bhYJN+IuSvxuZmAsK96a353rXQRJAXiolW4Bqh
	gv8zy5QBlAWgpfHmYl7CO+3qLdLDwwCgAadsp1xo1uoDWQ7o/nM6AAI8RYszp8Rx
	g6WomQxTW5eZqnJ7lJtyvUR7pArdIs3T/x18Mheu8SoNSORSNZVzrASCIPORqAu4
	3Hs/W+W2luc5dST0vmCVoF5ENOdsMI6gOCie1T62dkgs1T6Y2RHUINaDeEIp1OHE
	BlreKRFq0KKdwtlcvDmEhDyPdqPf/4Ziwi/iE71c7SJMC4q/KOal125VlPn8TKUD
	6aDxOXW3fJi9QcQ+ShDDULmmHdb/BEDruPmIDbuMvLabHhWA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44v3mg2hh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:43:07 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51I7h6Sx004447
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 07:43:06 GMT
Received: from hu-jiaymao-sha.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 23:43:04 -0800
From: Jiayang Mao <quic_jiaymao@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_bt@quicinc.com>
Subject: [PATCH v1] linux-qcom-base-6.6: Add firmware-name in BT node for qcs615-ride
Date: Tue, 18 Feb 2025 13:12:55 +0530
Message-ID: <20250218074255.4152013-1-quic_jiaymao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xWs3BmFX7Zn9W9ye_9_8sJICxnii4gkb
X-Proofpoint-ORIG-GUID: xWs3BmFX7Zn9W9ye_9_8sJICxnii4gkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180058

The qcs615-ride platform uses the QCA6698 Bluetooth chip. While the
QCA6698 shares the same IP core as the WCN6855, it has different RF
components and RAM sizes, requiring new firmware files. Use the
firmware-name property to specify the nvm and rampatch firmware to load.

This patch depends on below patch:
- WiFi/BT DTS
https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Jiayang Mao <quic_jiaymao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 5ba9dd5eec6c..03547fbd33bc 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 /dts-v1/;
 
@@ -611,6 +611,7 @@ &uart7 {
 
 	bluetooth {
 		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
 
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
-- 
2.25.1


