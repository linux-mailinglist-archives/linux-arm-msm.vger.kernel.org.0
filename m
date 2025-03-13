Return-Path: <linux-arm-msm+bounces-51243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A1A5EC93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F44C3B1656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4AF1FBE8D;
	Thu, 13 Mar 2025 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Byrqtcio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0211311CBA;
	Thu, 13 Mar 2025 07:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850083; cv=none; b=CKtchcgWYGs/9d1lRQaSDBKPVw06TWCYIQzsbl+pEeGvSSGOdvF1OTw0kgoAC61j0MSpwGfsqtgy2AzebA/76P8J9eOt/mSYFof77HaY6psmB6W1Sd/8pajYz9VNUS8BuDS9LD8e2wKEyU3zA3j+eWLewjFzTDIHGeeYtAC63D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850083; c=relaxed/simple;
	bh=AA3wc9zdl0kkbDlVw+PnQnheQDJomaH659tQOEHWOiw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LXfJYcqgq00aelvGGOtSf1j0IASw6pw3YcflYkBMmbDf6ofXo8Kvmp4QEQFBRI9KE5O4AT2lzAoCP+xJ3Cs+RUTVYZAWx4aJVvQkfdubyJ50OjY6mWFJFdPkHhYiLxrY/bG6yQxozDx41AFSi0HuTbY8iPxJ+ubifNvglbf+WoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Byrqtcio; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CLqBBI030363;
	Thu, 13 Mar 2025 07:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=w6x/XEaXiIoaWPYyh3thpv
	g3FCZaH5N/R+CIcszQqCc=; b=Byrqtcio3OZKpgXsTP7+urksRgD2b5ky8bjXHe
	ZjCm7d0nsNGjmwzZeU+RS1Dx9I/wiM2KXSGCxeuLyuNKc7Y/PB07SDIj+6ZG8p5w
	FZxTUsixg4wjqCzzom27xwsLOazDuwv3qpUGRacoCcENzbXTkz0ZUbCHAlQBbtMW
	kTH7TxwbEKRYwGrHz1/tvSjTZ/hfVojkavbgW89wnSDkS59YP9WyasdphggzzLsm
	3HiV4Gzxm7ccYsnrQaIQKaoq8pAH2KRjLn9aMbIL1LF91CFuB+V93MCubbXtqw/3
	LAcwnApLL2dmzUgkOSQay6zJEWf4e2U7ElCMfR+td377jrgg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qmyqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:14:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D7EbJE020928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:14:37 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 00:14:32 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_srichara@quicinc.com>, <quic_devipriy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
Date: Thu, 13 Mar 2025 12:44:22 +0530
Message-ID: <20250313071422.510-1-quic_mmanikan@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wbem_To_Z97Xi9Hb1vYiMlVrMxKAgFwd
X-Proofpoint-GUID: wbem_To_Z97Xi9Hb1vYiMlVrMxKAgFwd
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d285de cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=LWL4QMDN_NG5SejmV0sA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=488 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130056

The MSI interrupt numbers of the PCIe3 controller are incorrect. Due
to this, the functional bring up of the QDSP6 processor on the PCIe
endpoint has failed. Correct the MSI interrupt numbers to properly
bring up the QDSP6 processor on the PCIe endpoint.

Fixes: d80c7fbfa908 ("arm64: dts: qcom: ipq9574: Add PCIe PHYs and controller nodes")
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index cac58352182e..692c52a87bd1 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -972,14 +972,14 @@ pcie3: pcie@18000000 {
 			ranges = <0x01000000 0x0 0x00000000 0x18200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x18300000 0x18300000 0x0 0x7d00000>;
 
-			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi0",
 					  "msi1",
 					  "msi2",

base-commit: eea255893718268e1ab852fb52f70c613d109b99
-- 
2.34.1


