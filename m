Return-Path: <linux-arm-msm+bounces-50170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6FA4DCA9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 12:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89204168C4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EF01FF1B7;
	Tue,  4 Mar 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hUCUwvVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311D31FF1A2;
	Tue,  4 Mar 2025 11:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088076; cv=none; b=f5xlQRbPh3Th2ICrAGJkuuzJWZcs+y34H3FOZIQjLlgigKka1LjF+lNrnALTtDUpvZLqjfm1n+KVAiDkPJpj7y0EZ3eLT4arLzIOJAIeTMUg/gJYwLn27MuFMY74pIvSmz7uwuDHYtEKJkYhwdrqlV9w1M7MN1YOm9RYRaHXfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088076; c=relaxed/simple;
	bh=R64CIkbkrQHoFYgAir+ioRO3gvXvRZJhc66qUon5SCc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SEIj26GGelS+lnUrx/eYk6E2oWNJcqOUNN9W+1HmbFgcYPew3lypcQ4d6GZvsDs9/1giCHP4D2BE0EzM/zw38tCEz1Strdak0oAVKSyGxeinGk5BUUFXp90pAPgUqxWhLfnZ8NS5Y7sGaWpyZ3dun8Ao91U4Mxqs0ygjejDjBMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hUCUwvVz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AErHk015625;
	Tue, 4 Mar 2025 11:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+UnQnZYjyK2lQCr84l8QYn
	yvb0Yl6lj690T6CEqty98=; b=hUCUwvVzV09MdPOOmVrzOsP6cGba477jwROyJl
	vH7CLeFkh/jDou/aSATxXC0SEI708hPFvldmOq1F45chgn4ee2/+uSZrkqUAMxiG
	5ownD1dgIvB+1MGkUXBWyfJpFwQiFidEyDYrPVgNPNrhDvx3VczGFW+CQ8n+c/yz
	L5K+9/jwWSHPv4y+7jkMsunj0W9DEr+dqYvUDFoXYHTO7FfmJYB7M6n99K0RD3iW
	Ido4Gwhpsd2jcEq+9+GJjjxawVybQN8rj8RptnW+sFXAtiFiHJX6TVaKWdS32OhT
	3Z57KBDct1hgfy1P2E5RDsU2x/7bs1QTfEryjw8JDe27aFPA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v1pfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 11:34:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524BYTBY015651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 11:34:29 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 03:34:26 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: ipq5424: Enable MMC
Date: Tue, 4 Mar 2025 17:04:00 +0530
Message-ID: <20250304113400.2806670-1-quic_varada@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QEMQtOws_iOHshqrV4HWq5HY8FJIE0Ot
X-Proofpoint-ORIG-GUID: QEMQtOws_iOHshqrV4HWq5HY8FJIE0Ot
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c6e546 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=IAiaYzwUq23lniLHEFAA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_05,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=755 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040097

Enable MMC and relevant pinctrl entries.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b6e4bb3328b3..b9752e8d579e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -69,6 +69,13 @@ &qusb_phy_1 {
 	status = "okay";
 };
 
+&sdhc {
+	pinctrl-0 = <&sdc_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 7034d378b1ef..e41f619121ff 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -265,6 +265,8 @@ sdhc: mmc@7804000 {
 				 <&xo_board>;
 			clock-names = "iface", "core", "xo";
 
+			supports-cqe;
+
 			status = "disabled";
 		};
 
-- 
2.34.1


