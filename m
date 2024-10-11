Return-Path: <linux-arm-msm+bounces-34077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17B99A1CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 12:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858FA287499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 10:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621C221265D;
	Fri, 11 Oct 2024 10:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fzhwPZ99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4717198A3F;
	Fri, 11 Oct 2024 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643353; cv=none; b=CclrgO/jREWjuDlBSVKZ20+ebgiw8R0hjbHwypdT+0oKkNCDVVZPNcr3uzvAkG6/EFV9N8ZWuh14dzHq/uXDls07oIFvDRTK+qE3XXWPcf3HZOzK7adVd03i4ZrZGAR7XXOcKYOWOFe/MHTNgaEI5zCG4gUbIFxI/j5qUomsaXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643353; c=relaxed/simple;
	bh=yALbYNl0T5Trgu0DW0CUG5TdXrwzgrycJz//ZNeR8DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=jP96RSQbjXWmcoY6Izd/DLh/GNooJemjYpDjmbnVSpsIQCR62Gla5HT7kVTABgUcP2u4IZgaUYd4ica8cQtK1zQv9d3JfMPDZuijkKLSOhSFH2kcVEdBRTSYawwjr37pfeBq3OcB3BNXQyH6DDImX8jIXY6F7j5hukIfua3evbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fzhwPZ99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAAO4B021189;
	Fri, 11 Oct 2024 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=juKH+WuNN2QXEskv3d4mxU
	0etrgfR//XbR10xZr0gvs=; b=fzhwPZ994sM1UCWoS805Ja91yVc5rZHnFXltEY
	ZxsRH40dmPxON+1vwc8IlmHqzaROXSZEhEQBYOZrHtV2UAssnX7iXITMlKdRpvDn
	fYmP6ANSZMuvoD4AM/XhhRWmZ4b7WUGVKhQ35egRF7qYqWbb8WyB4szoaOZjXNL+
	97fiKES2C3QCeKXygWtPqo7R0mxHoDmT4EP4mbbPKDpmd/9Ha4V0AVYhn07QrLNf
	pQUUp52oUvahtZD4XcfIKXa2kwxfRN+N38Bwukvh0M+/cJNyZOosWcu0Zw6oyEU9
	J+xduR/IWsrPf6XSGPhL5lrE5LRpw5rrZfv01GemPbZvLY5g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42721c82te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 10:42:28 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BAgR9H009465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 10:42:27 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 03:42:21 -0700
From: Song Xue <quic_songxue@quicinc.com>
Date: Fri, 11 Oct 2024 18:41:05 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615: Add LLCC support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-add_llcc_dts_node_for_qcs615-v1-1-e7aa45244c36@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMEACWcC/22OQW7DIBBFr2KxrqUBPCTmKlGEBhi3SI5xwLEqR
 bl7nXiRLLp8f/Hev4vKJXEVtrmLwmuqKU8byK9GhB+avrlNcWOhQHUSpGwpRjeOIbi4VDflyG7
 IxV1DNRJbrwgjIYInFJtiLjyk35f+dN658PW2VZZ9fEds80xAr7pXIk1pSTS6epvnXJbPCIH0X
 sXYGQS7avF5dbdIgP599B+FMUccMICWXttVPRWeKrchXy5psY036gBB+0D98YAamIZgSOLQR+w
 4RACtGViL8+PxB62dgqhDAQAA
X-Change-ID: 20241011-add_llcc_dts_node_for_qcs615-b2a5da550ba5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Song Xue
	<quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728643341; l=2273;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=yALbYNl0T5Trgu0DW0CUG5TdXrwzgrycJz//ZNeR8DA=;
 b=6yjfp/cV9hc75OJeo6P6+uCKhxMV+ilO1pF8DJcdN2TPz/CK+DElIBzhF2V2yPIfz9S8MHg0i
 L3zZc+sUj6/AhSyRMcjYPckSvDf/sp9kFd1xHSzUFkeVTt4jPiDmfa9
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 37-jjRs_yI82k7LRn8rykfC3mGNNr3F0
X-Proofpoint-GUID: 37-jjRs_yI82k7LRn8rykfC3mGNNr3F0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=877 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110073

The QCS615 platform has LLCC(Last Level Cache Controller) as the system
cache controller. It includes 1 LLCC instance and 1 LLCC broadcast
interface.

Add LLCC node support for the QCS615 platform.

Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
This patch series depends on below patch series:
https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
https://lore.kernel.org/linux-arm-msm/20241010-add_llcc_support_for_qcs615-v2-1-044432450a75@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1fbb28865877555ba317677bc6bd2..b718a4d2270d64ed43c2eca078bfe52b78ff680c 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -495,6 +495,14 @@ dc_noc: interconnect@9160000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		llcc: system-cache-controller@9200000 {
+			compatible = "qcom,qcs615-llcc";
+			reg = <0x0 0x9200000 0x0 0x50000>,
+			      <0x0 0x9600000 0x0 0x50000>;
+			reg-names = "llcc0_base",
+				    "llcc_broadcast_base";
+		};
+
 		gem_noc: interconnect@9680000 {
 			reg = <0x0 0x9680000 0x0 0x3e200>;
 			compatible = "qcom,qcs615-gem-noc";

---
base-commit: b6270c3bca987530eafc6a15f9d54ecd0033e0e3
change-id: 20241011-add_llcc_dts_node_for_qcs615-b2a5da550ba5
prerequisite-change-id: 20240924-add_initial_support_for_qcs615-a01bb2dd4650:v3
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 91cb230c6d129ff21c24d124fad9e37a66cb6a22
prerequisite-patch-id: 57afeee80c9aa069ee243f5a5b634702867d20f1
prerequisite-change-id: 20241009-add_llcc_support_for_qcs615-6685f5c031b3:v2
prerequisite-patch-id: 7f93f240f926884c60a86c3ca651bb2232b88bed
prerequisite-patch-id: 6758ca439e10ac057d7834bb42860eb58198287b

Best regards,
-- 
Song Xue <quic_songxue@quicinc.com>


