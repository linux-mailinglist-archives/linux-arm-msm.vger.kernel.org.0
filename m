Return-Path: <linux-arm-msm+bounces-59376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0F6AC3961
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F8543AE4F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E158B1C54A2;
	Mon, 26 May 2025 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pfds+7Om"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F29919B5B1;
	Mon, 26 May 2025 05:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748238184; cv=none; b=j0aHS5h0P4pDrPox9VClKCB4AIJzY0gbuEzI0qoFq8HAmBAimZI0ZKxgTqIMHC0EAe67jO8IOnpeb0hHS67e9mu4BDmL9a11jrXiLkg8Rt4RALgVzT428xe2eBUHOGqMj3LzjTeaSukHGd+ZM6u8wHXk+EZ91iMbOimJFzsyhgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748238184; c=relaxed/simple;
	bh=XPVNF4i9clBR5CeNLdOBha/wncAQ8cozfftoZr4bljk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WoYqEbyoE8gBs8R6ofM+Z+A7GQyPPC5UHHWQeMH6+JLaKmCnEDL2+OcozAMTJQoq2Stsr/3NFUqAMZKYzOl9lU+N5bCaP+cnd3xaiL7GT0wPn7PrhVyN2AKtslRb2HUIiJEVU+/tVzbF0aOT/D6L3GtxVOIMxYPFL/rqqq3N+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pfds+7Om; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNgKtO027105;
	Mon, 26 May 2025 05:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BEBZg8MlIJLrV0u6uphLCbW27wGjna4VB4z
	ejoKbxk4=; b=Pfds+7OmhtY9qgqC1T6e+bLnEyJqZRq8rKRcgizWCHVegnqJib8
	BAtYfL1UIrUHBHun1/bOO2IduYZ26qaWO6gq2wNjuzcaH+h/xcJ7Q8yZFqRsaSae
	WQrp63yeWVnYc6mAXgDM60GH0qsC2d8J61klnL1paFco/L9Q83tPmc38rqNcICA8
	jdcM3i7zznNa2lvxWJLt/0THvc6vYaOFP6IIhNRINd/Q/6ilayIOrxe/O2a+mJJ6
	NAc0B4XQRkaDQzA4ecz7UCUSb7PrGKuZczBjygK2CeIF7/U1ZxTHMqVmleS/ZKAm
	vGS86RuTC+v8nRQN0csosEmOtWda37ivfFw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5k2qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:43:00 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q5gw4k027444;
	Mon, 26 May 2025 05:42:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76kqmab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:42:58 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54Q5gvmc027434;
	Mon, 26 May 2025 05:42:58 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 54Q5gvVc027433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:42:57 +0000
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 37913)
	id 9065722650; Mon, 26 May 2025 13:42:56 +0800 (CST)
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_zijuhu@quicinc.com,
        quic_mohamull@quicinc.com
Subject: [PATCH v1] arm64: dts: qcom: Add Bluetooth support for qcs9075 IQ-9075-EVK
Date: Mon, 26 May 2025 13:42:28 +0800
Message-Id: <20250526054228.221095-1-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6833ff64 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=WXduBcdBxNLdlasUCgQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0NSBTYWx0ZWRfXypCT2mScAcst
 Emc8kH5MZMN5T6yRbDSkuHRG3bJUsaMLiJFrngnZXmHxT+rEczMPQ25lVFBYm0wBb4jqPl6MKDb
 9u+4FRoqrMVcOkOMjl9c81NjyOr7SSzFCTM+LOyXnbr8zq3Dx7AMcWbN2Hmc48VIVMLYdk8xvH8
 36XicASVS92z+ZLQvKiYLjXm7P5e6RpMKZxEIBkDq1dqVzdBMZtnyEffJnPudQYSs8/xb2Phhdu
 IUoTh6L7IbXWYPFJXijOMg8rkZGOHCHuoJi1WIQbUNuG+E66yDQAMosLCuyCb1KitTO8h0UGhE3
 1dKnx5uPaT1b6rN9cv7jsBore4Y9DSZ3kqbdkl8WuMcQnsfrKcdz9lkLAdFAr3aPw50jy3nlWqf
 w4UJX7JVlRNFY+X5EXDS95neFF6m8DoyT6GkJYPq/dMyz18q+JyqLYhPQ25H2Ho4UX18ir3+
X-Proofpoint-GUID: ehaCpic6QNEYUzuwhqwH1gupFxqCvyUh
X-Proofpoint-ORIG-GUID: ehaCpic6QNEYUzuwhqwH1gupFxqCvyUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260045

Add Bluetooth support for qcs9075 IQ-9075-EVK

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
index ba8a359d8..d44f8f5eb 100644
--- a/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
+++ b/arch/arm64/boot/dts/qcom/qcs9075-iq-9075-evk.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &uart10;
+		serial1 = &uart17;
 	};
 
 	chosen {
@@ -264,6 +265,32 @@ qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
 	};
+
+	qup_uart17_default: qup-uart17-state {
+		qup_uart17_cts: qup-uart17-cts-pins {
+			pins = "gpio91";
+			function = "qup2_se3";
+			bias-disable;
+		};
+
+		qup_uart17_rts: qup0-uart17-rts-pins {
+			pins = "gpio92";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+
+		qup_uart17_tx: qup0-uart17-tx-pins {
+			pins = "gpio93";
+			function = "qup2_se3";
+			bias-pull-up;
+		};
+
+		qup_uart17_rx: qup0-uart17-rx-pins {
+			pins = "gpio94";
+			function = "qup2_se3";
+			bias-pull-down;
+		};
+	};
 };
 
 &uart10 {
@@ -273,6 +300,21 @@ &uart10 {
 	status = "okay";
 };
 
+&uart17 {
+	pinctrl-0 = <&qup_uart17_default>;
+	pinctrl-names = "default";
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+	status = "okay";
+
+	/* HS UART Instance */
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6855-bt";
+		pinctrl-names = "default";
+		max-speed = <3200000>;
+	};
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };

base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
prerequisite-patch-id: 65730290d31f18e66e2ba0dfdeb1844d7442c272
-- 
2.34.1


