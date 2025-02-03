Return-Path: <linux-arm-msm+bounces-46704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3631AA25375
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 09:01:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89AC162A33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BFC1F5428;
	Mon,  3 Feb 2025 08:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MK8sqxI8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247063594E;
	Mon,  3 Feb 2025 08:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738569677; cv=none; b=V3FYuuYn9FoDtToRIEk762/o+I62YuayX13G1dBTY+6kKHdb/egCFkfQgbTteJfL/JjvoWWTMOgnCahX1c99zZMKdgm+avZdmNDc8aFYbtWcAMn5CULYxFvZ+F6C8xAG0nZlYLy5qnsqFYbPtkVm/jRSuqbL5zgGo7pmvkjZCMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738569677; c=relaxed/simple;
	bh=XpWCKtg67/hJeluoR1hBURydjATUTN+jcQUT571xdtg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HY3UpcYGoBw9MkpncHHnrVQvs88dXv40fOc1Csl2ml9FGrkeHlW8HEgGmHJX420todsEDj9TqllNO+Nll6FiC8ucVnMNDXN6HjOG7lCMPwQaDIqIXLT5O6yrQ1kuBBGoe07yGAqktnUfDfnsD6i1Hdx1ztvpNhIxTrA23smARhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MK8sqxI8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5135kZhF006247;
	Mon, 3 Feb 2025 08:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKwfrzvUpQdflcvqUg2Vh7TcaEWI+YoEQoCPT5pIGbo=; b=MK8sqxI8yxZ4nWL0
	LSZo3+sXlMrNl3hjCE6gT1+J4jSRXhNXoRDZMpsTafjSHApG4sr27X4cDCTKk+2a
	jMf4o2k3ae7PYvJqtWd/DPqJga5cXL9mT8KxxIKPPl4aMtOBz5LdG8ToPrYirFC8
	vil/TGlGVKfK0Q5uuVQhIaHw3qqYNiBwR9VEJ9pKYQatVeMwvY71LFEUa2gRThC5
	xNQzYzdbaqKezNKkd5wCwSURN5QrmH3vCGOciiWifI3t4jbAjM1fK+CCoDypSLCD
	owQceB8hFuUOIv/X1wluxBeaXJ++XjPEkWBpxRtTn8fAVQUBsc4kGbaK9UBTbo1b
	tQ8p9g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jqxw094p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:01:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51381Ba8004107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 08:01:11 GMT
Received: from hu-ckantibh-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Feb 2025 00:01:08 -0800
From: Sanjay Chitroda <quic_ckantibh@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Sanjay Chitroda <quic_ckantibh@quicinc.com>
Subject: [PATCH V2] arm: dts: qcom: Fix indentation error
Date: Mon, 3 Feb 2025 13:30:59 +0530
Message-ID: <40fc9c914f5972decbd6d639396d65bf080d3ceb.1738568609.git.quic_ckantibh@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <372bdb4d-95a3-429f-be16-64eb909ec5fb@kernel.org>
References: <372bdb4d-95a3-429f-be16-64eb909ec5fb@kernel.org>
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
X-Proofpoint-ORIG-GUID: ZCswm9MoEhCfO7HKCVT-pTh4d2CvjvvL
X-Proofpoint-GUID: ZCswm9MoEhCfO7HKCVT-pTh4d2CvjvvL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=752 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030064

Corrected indentation issues in the qcom devicetree files as
identified by ./scripts/checkpatch.pl.

Signed-off-by: Sanjay Chitroda <quic_ckantibh@quicinc.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts | 4 ++--
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi  | 2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index 6fce0112361f..34b0cf35fdac 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -149,7 +149,7 @@ &mdss {
 };
 
 &pm8941_gpios {
-        msm_keys_default: pm8941-gpio-keys-state {
+	msm_keys_default: pm8941-gpio-keys-state {
 		pins = "gpio5", "gpio23";
 		function = "normal";
 		input-enable;
@@ -157,7 +157,7 @@ msm_keys_default: pm8941-gpio-keys-state {
 		bias-pull-up;
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
 		power-source = <PM8941_GPIO_S3>; /* 1.8V */
-        };
+	};
 };
 
 &pm8941_lpg {
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
index cc88cf5f0d9b..5a95a2d03c42 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
@@ -43,7 +43,7 @@ nand_pins: nand-state {
 				       "gpio64", "gpio65", "gpio66",
 				       "gpio67", "gpio68", "gpio69";
 				function = "qpic";
-                        };
+			};
 		};
 
 		serial@78af000 {
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 06b20c196faf..ecfb6e41bf05 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -126,7 +126,7 @@ opp-500000000 {
 		opp-716000000 {
 			opp-hz = /bits/ 64 <716000000>;
 			clock-latency-ns = <256000>;
- 		};
+		};
 	};
 
 	memory {
-- 
2.34.1


