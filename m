Return-Path: <linux-arm-msm+bounces-51674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1851AA66AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D85F47A8382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1CF1E520D;
	Tue, 18 Mar 2025 06:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aJAbdy20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397A1E51FE;
	Tue, 18 Mar 2025 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742280626; cv=none; b=pmhnec0hLCz7ZZf3QRBHd9NmHFY1U6R2kwcB/edgHBi0isAmGTEigkFUZhv95ErlQSlSTumH4XO5ZK3WcGrbKqpXHwSZRHApf+26wfHUhGuKq3hy5vS6fM7BuOLS7jNp77YSun9ljilAmwJ7nws4AoR0B1GExMeRumo6+pHYLn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742280626; c=relaxed/simple;
	bh=YBWTCJsyjRVvr+Y7JsfSHvxVmVgi5aTJlg5IF6SL9oc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBUicn+PshyxGCgUjzkjneQUuOb9ovh33LICODkat3PamQbYtRNVtDxgPbx38dLG+45lA6uM8IKrjkqBTmpR+WugXpexcp7FiUptj/+iGnoFATYhHqXlDCwoz5Yw+SOgmdjXhbdj3O0H7Oby04+XPINrT7S8JhQgqz13G5R3D8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aJAbdy20; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HLkxW2026060;
	Tue, 18 Mar 2025 06:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TJCCnvRUJBx/FcWEdpLFuA
	1pGnh3q199UpcalaSQzt0=; b=aJAbdy20mgXVTWIEWlwrVAWNFu8RicKmRDm8UD
	S3DOwOX6bXkfEj/YvxBaJzvpBRAPYH9798R9kQBWKGtJCHAtCOlP6/D+5S0XwAQG
	mmcqJhug52NtpvwqofrY8ZC4ej8ha27+9Jl6e4vkRqp2yhnSgtLes1wjI4bUwtKv
	Mg1BHFDm2W6oCZu24NM2Dc9SYQZ0Wbbv19OEIFdvjjVlHtAg7HbiFED8Ssgj+CXw
	YGNVDjfYiPTcNTnZsYaodKWKq6EjjDKtiiak3OyHFdVPo/lo5BBf+Kq2AdOAV3Z9
	WSHwC8RwyyZRWgZeMFEXM2AeNk2KsLKobfVmUr78BGObaHTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sxy5ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 06:50:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52I6oKVp012176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 06:50:20 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Mar 2025 23:50:16 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <quic_srichara@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: ipq5424: fix and relocate uart1 gpio configurations
Date: Tue, 18 Mar 2025 12:19:39 +0530
Message-ID: <20250318064939.3638381-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-GUID: gW1C8LM_Hk8RNw4ekJeumjz8fZWFv5FJ
X-Proofpoint-ORIG-GUID: gW1C8LM_Hk8RNw4ekJeumjz8fZWFv5FJ
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67d917ad cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EwbgSTejZl1M597PQjwA:9 a=HVqvvCGUhjtjaAmPp66E:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=561 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180046

Update the bias configuration for UART1 TX and RX pins to ensure correct
settings for RDP466.

Additionally, move the UART1 GPIO configurations from the common .dtsi
file to the RDP-specific .dts files to account for differing bias
configurations across RDPs of IPQ5424.

Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V2:
	- Consolidated uart1_tx_state and uart1_rx_state nodes into a
	  single qup_uart1_default_state node, which includes the
	  configuration for both UART1 TX and RX pins.
	- Inserted a blank line before the status property in the UART1
	  node.
	- Fixed review comments from Kathiravan Thirumoorthy.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  7 -------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b9752e8d579e..f0cba6b2be70 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -102,6 +102,22 @@ &ssphy_0 {
 };
 
 &tlmm {
+	qup_uart1_default_state: qup-uart1-default-state {
+		uart1-tx-pins {
+			pins = "gpio44";
+			function = "uart1";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		uart1-rx-pins {
+			pins = "gpio43";
+			function = "uart1";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
 	spi0_default_state: spi0-default-state {
 		clk-pins {
 			pins = "gpio6";
@@ -157,8 +173,9 @@ data-pins {
 };
 
 &uart1 {
-	pinctrl-0 = <&uart1_pins>;
+	pinctrl-0 = <&qup_uart1_default_state>;
 	pinctrl-names = "default";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 402d0a2c7bcc..0117f6422347 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -262,13 +262,6 @@ tlmm: pinctrl@1000000 {
 			gpio-ranges = <&tlmm 0 0 50>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-
-			uart1_pins: uart1-state {
-				pins = "gpio43", "gpio44";
-				function = "uart1";
-				drive-strength = <8>;
-				bias-pull-up;
-			};
 		};
 
 		gcc: clock-controller@1800000 {

base-commit: da920b7df701770e006928053672147075587fb2
-- 
2.34.1


