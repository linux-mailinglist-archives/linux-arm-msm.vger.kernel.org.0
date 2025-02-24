Return-Path: <linux-arm-msm+bounces-49120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2E1A4157D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 07:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACDB73B5B15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 06:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F2C1F419C;
	Mon, 24 Feb 2025 06:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m4vTjQtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96A1EEA29;
	Mon, 24 Feb 2025 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740378961; cv=none; b=B4bcnNB8Y09SYMB78/QJiE/ny3t/gckSt8L84S6180P9B5UxCE/z+Vx7TIrXrpXzKMd/v3DKFBhkhv2tvCD3UlmWlA/riYltCipvB5wvUVHTHSNIoFpOGwVJHmBF6oh9IKOhWzr4L/ULhjkPo2qX4h8C6Yirq5T4iKUzwW/K4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740378961; c=relaxed/simple;
	bh=WtYDDOvmcww8rYLRC+ea7V8WKRUkA2F681PSB7VoP/A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KKfw8Dsl3HUZ9iff2W+UZ3FC9SvWp86SjA5/cQV39TE33/57NU9xsri3BYpe/9+AkfJaRcZl9mf0WoSfEcJVnqKplkknmVaLg+//pBdh97wyd7kiyrq8iDyvvXqDwtYJFjvR1hI1GKGwBHfUcfuVeVQ9fSmACs+WyiZhrErwyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m4vTjQtR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNGELF023048;
	Mon, 24 Feb 2025 06:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+ErwxKuqiwOBlG/Dxt8J0edEq2f8Mll/ahAicczppOs=; b=m4vTjQtRX0vXg0jZ
	OGrYIhELjXyeexbbgQ25LZeWqBkrNZ1rf6+skORwKQS1bIXZaP+1FewnZ54ZO52M
	r48BtFs2RY6I8UTSImLgKHBIhtZpZKHERNDbIYZq2I1JFQH3arBMwVull/k/gRRb
	5ygWqVM4jaY39H1ikTHzDlM9OdMXqgV2GsEk+ZKxjexWf6EVkeeKA83D3haDHp2O
	y1L/L6g9g73en45tu8PstsG+bAEBSlewuxMlRdFFZM7XL5HaE0VjqMcj6YRCVgsF
	4e/aOYFL0mp+9PJVH/tEeXeFbIcEeBaNiK6DW11PYx0EMfa9f7xM5GVOOJkynHp5
	hv1PIQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y65xuu04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O6Zsuh013068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 06:35:54 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Feb 2025 22:35:51 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v12 3/4] arm64: dts: qcom: ipq5424: Add tsens node
Date: Mon, 24 Feb 2025 12:05:30 +0530
Message-ID: <20250224063531.2691961-4-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
References: <20250224063531.2691961-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: htQfLF7QXlYDx1A0TyLUyT3k_JiFnHk7
X-Proofpoint-ORIG-GUID: htQfLF7QXlYDx1A0TyLUyT3k_JiFnHk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 mlxlogscore=655 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240046

IPQ5424 has tsens v2.3.3 peripheral. This patch adds the tsens
node with nvmem cells for calibration data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V12:
	- No changes.

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 7034d378b1ef..774386d785d5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -152,6 +152,93 @@ soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		efuse@a4000 {
+			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
+			reg = <0 0x000a4000 0 0x741>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_sens9_off: s9@3dc {
+				reg = <0x3dc 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens10_off: s10@3dd {
+				reg = <0x3dd 0x1>;
+				bits = <0 4>;
+			};
+
+			tsens_sens11_off: s11@3dd {
+				reg = <0x3dd 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens12_off: s12@3de {
+				reg = <0x3de 0x1>;
+				bits = <0 4>;
+			};
+
+			tsens_sens13_off: s13@3de {
+				reg = <0x3de 0x1>;
+				bits = <4 4>;
+			};
+
+			tsens_sens14_off: s14@3e5 {
+				reg = <0x3e5 0x2>;
+				bits = <7 4>;
+			};
+
+			tsens_sens15_off: s15@3e6 {
+				reg = <0x3e6 0x1>;
+				bits = <3 4>;
+			};
+
+			tsens_mode: mode@419 {
+				reg = <0x419 0x1>;
+				bits = <0 3>;
+			};
+
+			tsens_base0: base0@419 {
+				reg = <0x419 0x2>;
+				bits = <3 10>;
+			};
+
+			tsens_base1: base1@41a {
+				reg = <0x41a 0x2>;
+				bits = <5 10>;
+			};
+		};
+
+		tsens: thermal-sensor@4a9000 {
+			compatible = "qcom,ipq5424-tsens";
+			reg = <0 0x004a9000 0 0x1000>,
+			      <0 0x004a8000 0 0x1000>;
+			interrupts = <GIC_SPI 105 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "combined";
+			nvmem-cells = <&tsens_mode>,
+				      <&tsens_base0>,
+				      <&tsens_base1>,
+				      <&tsens_sens9_off>,
+				      <&tsens_sens10_off>,
+				      <&tsens_sens11_off>,
+				      <&tsens_sens12_off>,
+				      <&tsens_sens13_off>,
+				      <&tsens_sens14_off>,
+				      <&tsens_sens15_off>;
+			nvmem-cell-names = "mode",
+					   "base0",
+					   "base1",
+					   "tsens_sens9_off",
+					   "tsens_sens10_off",
+					   "tsens_sens11_off",
+					   "tsens_sens12_off",
+					   "tsens_sens13_off",
+					   "tsens_sens14_off",
+					   "tsens_sens15_off";
+			#qcom,sensors = <7>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		rng: rng@4c3000 {
 			compatible = "qcom,ipq5424-trng", "qcom,trng";
 			reg = <0 0x004c3000 0 0x1000>;
-- 
2.34.1


