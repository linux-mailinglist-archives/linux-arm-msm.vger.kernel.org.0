Return-Path: <linux-arm-msm+bounces-47854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5D6A338B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 08:19:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7E467A2159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 07:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B3220ADCF;
	Thu, 13 Feb 2025 07:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XCqDiaxB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9BF20A5E5;
	Thu, 13 Feb 2025 07:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431179; cv=none; b=bI9oYbDoqESL/j9MKXOciPaP3ILIq9HcIn72Kj/EaADeoXVmyjel0DboqTggyH6QCctMEvoLPj6My9IvfGKy/9dOWXKCi0MHtRU9T9CYOZmD7y6nSPNjzWlBii9OckZX2pNsgWfIIWF+BsO/y3dTfrIqxjqkLpxEKOJVOcoYU/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431179; c=relaxed/simple;
	bh=8Tt06UtQsEQgjyEseWRGpJM8tmicPO67FJ2ZmCsVAyc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5/fFb/q0dAeDZtFVJH3ULpb7QSCXDZWTfR54qoXlymAuZ6gvyksTuYCWqgU8rcHtVN+OPTJlGn8AYEPeRqXanw4vcGdAWXYaVIckXxYSqcOyzCRhKje92zlyVVwCr3IAiZ9fIsRLROo4ZaddYZ+P+1BVP5rOFAm1C3dcpGwFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XCqDiaxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CMVPKO026400;
	Thu, 13 Feb 2025 07:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PkZJQTjco+jvCkkufJNW/Aq/zfBLz5Cr/KVE2amtQQA=; b=XCqDiaxBDNlwGakT
	bL/uUC4j/wqc8/UIcLDERvWh8dYBevXc0CdLJxkG16zCI7gs7NP8M2iUo/F5ZLo6
	zT+RqoMGlmpfvO98zkORUPRs/g5Azqnm7aMzkBvYhX1s81mZHVQykSCX3MaFPE39
	F5gYbeeM+n0nKUMjUaOeoOpqapI2ucbUXx3iUa/tmV+kD8MM0CrnDpWbcBRZbZfs
	yINZZBCFI0Zthw9Nf02JQ7o4sqlWd6LqSvRZocDXKAvZQTFe6SrZxh4JwaIjKi1+
	QX7E70OPDWk4pgTyFNWiPlZYxCpfVRwmj/9kyXxXdasDZbw2gIdtIRwsfBZuvCZ3
	ez+qsQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5e6r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:19:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D7JW8b020514
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 07:19:32 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 23:19:29 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers
Date: Thu, 13 Feb 2025 12:49:12 +0530
Message-ID: <20250213071912.2930066-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
References: <20250213071912.2930066-1-quic_mmanikan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: lko6zocSLQBdENPd0Z3uPR0-t2isjdQN
X-Proofpoint-GUID: lko6zocSLQBdENPd0Z3uPR0-t2isjdQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=785 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130054

Enable the PCIe controller and PHY nodes corresponding to RDP466.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V4:
	- Added a new line before status in pcie2 and pcie3 nodes.
	- Dropped 'output-low' property from pcie2-default-state and
	  pcie3-default-state nodes.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b6e4bb3328b3..e73f61266012 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -53,6 +53,32 @@ &dwc_1 {
 	dr_mode = "host";
 };
 
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	perst-gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
 &qusb_phy_0 {
 	vdd-supply = <&vreg_misc_0p925>;
 	vdda-pll-supply = <&vreg_misc_1p8>;
@@ -147,6 +173,20 @@ data-pins {
 			bias-pull-up;
 		};
 	};
+
+	pcie2_default_state: pcie2-default-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		pins = "gpio34";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {
@@ -166,4 +206,3 @@ &usb3 {
 &xo_board {
 	clock-frequency = <24000000>;
 };
-
-- 
2.34.1


