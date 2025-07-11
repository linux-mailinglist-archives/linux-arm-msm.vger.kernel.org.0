Return-Path: <linux-arm-msm+bounces-64554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A032B01A5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9550358829B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 11:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94DA288C97;
	Fri, 11 Jul 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MaAVU6/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB271DED5B;
	Fri, 11 Jul 2025 11:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752232490; cv=none; b=gxnmzq5saaxwBNqqvyh3kJRmS78hGJnjdLghJ/S67dVWWMbjVgrGMhoj+BeQrLrgGNEBeijInioEnDz8AKZAk4qKNS4BxdOjJPVpkMmeyp5eos5lF2b8AsvTrQZxHngElbuyuF/Wp5FcA/P/f6cDONoxxI3U5q0rT/W4Ud00V/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752232490; c=relaxed/simple;
	bh=agy6+8GdtzC7Fj6vgysblX5H44rHd2wNP80PLXciBwU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MrQ1w3JFwO8Aypjh0J+tV+MfVpHmRcLjrmkWdWdFTpb48D4+Scy2x1HAC8411PVcBTtmRvbh7z56C85jlCqeGE/sr5O4ONY0+jnJqZ6mO8RIOPN5uhH1YPiA+cad14zSlZLZU00aOHsgk1zwuR3NqTRC4vcyks7vTYKJV2g6Vpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MaAVU6/C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAJxQm003966;
	Fri, 11 Jul 2025 11:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iUEEX5QYSW5bIoU9Z4+oK4
	yCkYAtXtkYtTd5W0cSkVQ=; b=MaAVU6/CCjjcNOQCO/6dEj80rie4An/zaKLTBs
	op/WHHq8yKwr3zQFnDru4w+pC+Q8oaI1LuOFKc1pQlI7sPy3IvS4ZLpXSO0ePmTS
	A8O8GT+LbHrVO3pK5yVu766dhnG3Y0lqzSRb6ykmudmk8StpPlpOo64vbXkFlLFV
	o//j7dob/erD/NbK5cJGPOdgd9q0psmUjVAHiNkfXJNrPmSamDcRKV9AiUk3K4XM
	8lFypjoC2Pvz8VCGbE32p8iOtLxaKw8liNjSI3SciQvO6VXSr1Q1mQykndUMcjxH
	rDzNOAZo8sOfVa8YGqeWcItPDQwuj8k0MhucEjhO4EkI6Aqg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0e62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 11:14:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56BBEieZ014808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 11:14:44 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 11 Jul 2025 04:14:41 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: add i2c nodes
Date: Fri, 11 Jul 2025 16:44:18 +0530
Message-ID: <20250711111418.3980520-1-quic_mmanikan@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3OSBTYWx0ZWRfX0Y6qRfI/XuiE
 3rCeRuQyK0v/oWSwNCxTcrRnqjVnUE6xb9urg0glQAi1PirKKZ1+L10k3xp5wGbhmPp8KdrumKv
 XfVKx+/DX3tLfjWBiU4UvSF4kyzZmqZ2ysZCTNiZAFdqqbSNbYJzz74cp/8+VgG1Iwnuz+aSKgP
 7YfCkAVVhCvkBggRxwflNbMQrKm/lphIxQz2fDQ00Vw8reMNS3rSVUUrCAJhqrwCdOzPXmw5NH0
 fPLZ9tWKBWJnmvpPnZ498cFnzLs3/aGnGOOKUUYbRndEzufWgaAoR4XTe3wPpC8pVcwGh+iic+Y
 x2kJEID4wHcJhpiauO2lnxJwbKGXIcigfEmvmqcm5TiAFDwJcVrBxyPvEFGDnpaNOojoogLm2XJ
 L/yss97wz/uQM6Oxf9M/G0pkFU4YSzAdCk2zQ5rBA/GX/2kRWoytGm7grdLK/h6YO3oVGr3C
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870f225 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=5VfnTfZ0KsacMTR8VH4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VJZ7sRsw67L_qWndIrCltPIEdWwg4A7C
X-Proofpoint-GUID: VJZ7sRsw67L_qWndIrCltPIEdWwg4A7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=873 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110079

Serial engines 2 and 3 on the IPQ5424 support I2C. The I2C instance
operates on serial engine 2, designated as i2c0, and on serial engine 3,
designated as i2c1. Add both the i2c0 and i2c1 nodes.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25..858b9c714a13 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -425,6 +425,28 @@ uart1: serial@1a84000 {
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
 			};
 
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x01a88000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_I2C0_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_I2C0_CLK>;
+				assigned-clock-rates = <64000000>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x01a8c000 0 0x4000>;
+				clocks = <&gcc GCC_QUPV3_I2C1_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+				assigned-clocks = <&gcc GCC_QUPV3_I2C1_CLK>;
+				assigned-clock-rates = <64000000>;
+				status = "disabled";
+			};
+
 			spi0: spi@1a90000 {
 				compatible = "qcom,geni-spi";
 				reg = <0 0x01a90000 0 0x4000>;

base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
-- 
2.34.1


