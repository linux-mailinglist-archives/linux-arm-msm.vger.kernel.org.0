Return-Path: <linux-arm-msm+bounces-32000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A032897C633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 10:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 591CE1F25D0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 08:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96BE194C61;
	Thu, 19 Sep 2024 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FVFJlCOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2652FC0E;
	Thu, 19 Sep 2024 08:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726735742; cv=none; b=QGzS8/Ejr6fAyfhXmL5/ypuFt18o4W2ZZC5JKffRu+vxe5wX2Y22jfj7Sa8SlL3WVH5q001JebxZ3dryI7JMFgLJ3ww+WjovFwCPujyixhm6lStBbnRA2s8Y+FgiznwWfeepRV5Dzq/QTLLsv4yM28JZAakeIhKZ4vv/O8ERanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726735742; c=relaxed/simple;
	bh=Xycib8bl7thCGbYvoJLXnNtbcDi/AIgIEqbrTsj8i9A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G4x+esgU5pYosta/Wd2Z4Rf1u2czw7ChCwxQbebNXb66CQ/EG4Ui2BX/R1mQGLzXTTrLOysVhUMRGe4Xnbeho6SdXT/eFwPrIl5l1V3Ux15+QdwvhircGvo6L0U8GQsKuPXoHCkghAkBCUlsNjQu5CdXZsFB5QH8x1zMvjjYMzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FVFJlCOS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J11feT006768;
	Thu, 19 Sep 2024 08:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=8P8jp37VuVHU6HERyHf8csPpU1ieS8Rj655puJrSMSs=; b=FV
	FJlCOSrAppaCHBjwT91n9yjSP26iYeBz+o6em5dwAbdu0XCmdn/MDTdFIqHzircd
	zAg8zD4sZmg2xFCESp36ToGWq2AxFMmllq7AaKnOx1pw8wfBsTcX0+rQqSGEUlmr
	L7znY2bzjuY7IzW3Bq6pSNiiBsMGDC/YVVclLHPEyL2NTihC728PRPrcUSFSbDTn
	RoUcvsGv1aLkTCVdr+mpxSEiY+xFzqfTY5idieBh13dpxpx3gxAuaFrWL+1QrHhc
	wxgP/o1gcTqhKA83t2nyg+GCWl0UHaR8cuxeil98bGWjasT60U+Zn4SqdJFXXZZl
	G8G8v+M3nZNF9lVuky7g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j6vren-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 08:48:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J8mrvW008190
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 08:48:53 GMT
Received: from hu-sachgupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 01:48:48 -0700
From: Sachin Gupta <quic_sachgupt@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_sartgarg@quicinc.com>
Subject: [PATCH V3] arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node
Date: Thu, 19 Sep 2024 14:18:26 +0530
Message-ID: <20240919084826.1117-1-quic_sachgupt@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8vBpyNYwEwu2CLIa_WaECk3L3PDpYlCo
X-Proofpoint-GUID: 8vBpyNYwEwu2CLIa_WaECk3L3PDpYlCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=768
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190056

Add SD Card node for Qualcomm qcs6490-rb3gen2 Board.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
---

Changes from v2:
 - Moved status "okay" at the last. (Thanks Dmitry)

Changes from v1:
 - Moving the pinctrl-related nodes below the PINCTRL comment and relocating
   the sd-cd node within the PINCTRL-related TLMM section. (Thanks Dmitry)
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 0d45662b8028..5d81fa2ce86a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -716,6 +716,18 @@
 	status = "okay";
 };
 
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_clk>, <&sdc2_cmd>, <&sdc2_data>, <&sd_cd>;
+	pinctrl-1 = <&sdc2_clk_sleep>, <&sdc2_cmd_sleep>, <&sdc2_data_sleep>, <&sd_cd>;
+
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_2p96>;
+
+	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
@@ -812,6 +824,21 @@
 	};
 };
 
+&sdc2_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc2_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc2_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
 &tlmm {
 	lt9611_irq_pin: lt9611-irq-state {
 		pins = "gpio24";
@@ -819,4 +846,10 @@
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	sd_cd: sd-cd-state {
+		pins = "gpio91";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
-- 
2.17.1


