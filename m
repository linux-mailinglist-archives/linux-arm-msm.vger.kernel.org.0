Return-Path: <linux-arm-msm+bounces-44826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DA1A0ACD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 01:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47EAF18865EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 00:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ADF6FB0;
	Mon, 13 Jan 2025 00:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N/czuBXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1A8322E;
	Mon, 13 Jan 2025 00:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736728460; cv=none; b=Rmxzyb26JmTEX1gGeJydpyVwb6O5n4J6M8XI8LHCoQ15U2bvxhC9e57YuDEliuzBzc3iNRBgBOgLEeATFHlsdH7JTl8y6HzUi8X96ArNYGPXI4UlRw0hcusE3IyySUrGFWUTEOuwo1+O81MqHUdwSYDamzu67PlWf6zlyRCrkJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736728460; c=relaxed/simple;
	bh=3eZtJieOoNsVTDXLeuLY4v+ogZ/sWZGx7njjb+VNNbc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m5UDvfo9ZlLUra/+kQE/YEBZGPcxweG7LZpQfazhzCpYJS1N7RTw6HAlVh827sDfBwmtQWnrr3ulTGRHLV4kvOECaWC3m5GYJYAiFYribxiZtukd4PnFv9oAxkpqUnUdf+pIvUzoUWeaLQz84QYOj8nh+y+8hgqIoaxsytGSrDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N/czuBXH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50CNRZdY020190;
	Mon, 13 Jan 2025 00:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YtPLZc1KnfoMo4+mfY5Kv+
	hi5HDfEFOQSazUvQ80W5o=; b=N/czuBXHNwyZuS3znzOWel9GhSLgel2c1Moojc
	BGRxXwqAyuj/H+nJhd+Q+hpK7C3yfYErxbBQqV7e5TEK98I4CTXMnnPlJeIH0vzb
	76x5wYnq0+3uUaAbf+g21BoWwlTE3cIKbhiLtY7d0DMrnVi39vHoSnL/Gs/PmJPm
	r9Bvxkzenkh6C/xHN5VvG0aqs8M4ma8HcLJSP8rCufXMbIfjeGy5gK7SrnysCezM
	8rGUsvX4gxvIdp7lTtvvI++OPv5K9T/paWcQHZSd1CMZsqG8XYw00J1aL/g8rXa0
	omo3ITO+cebys9ZWg+8y6p/pH9A/FjPc/NZrQ3HKHv0dAbYQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 443hhvts0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 00:34:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50D0Y3QL008928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 00:34:03 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 Jan 2025 16:33:59 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: ipq5332: Configure I2C APPS clock frequency
Date: Mon, 13 Jan 2025 06:03:48 +0530
Message-ID: <20250113003348.1459042-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: pqnlOoj4ppKvgx10Bzgj4xf58vsau_q4
X-Proofpoint-GUID: pqnlOoj4ppKvgx10Bzgj4xf58vsau_q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=771 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130003

Set the I2C APPS clock frequency to 50MHz in accordance with the
frequency plan.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index d3c3e215a15c..e33f99f50224 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -298,6 +298,8 @@ blsp1_i2c1: i2c@78b6000 {
 			clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>,
 				 <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
+			assigned-clocks = <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+			assigned-clock-rates = <50000000>;
 			dmas = <&blsp_dma 6>, <&blsp_dma 7>;
 			dma-names = "tx", "rx";
 			status = "disabled";
-- 
2.34.1


