Return-Path: <linux-arm-msm+bounces-53023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2143A78C50
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A57317042F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF7E237713;
	Wed,  2 Apr 2025 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cW4kDqeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33302236458;
	Wed,  2 Apr 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589672; cv=none; b=D4beAjQ1Z7i65U8SkxojAVWlWXFA0DP80hMObDUnbJKduky6cxEURg4mSJvwkEAkYGB50BWBRFfy1hjyqjPw5hwMj7hEZVCcm93B34ABGDLE+f++RTN9jFiPNJ9BuQ5QQJsvkhBf/omrdihy8Jhm3rg2gPCGcQwjiDcty9IL/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589672; c=relaxed/simple;
	bh=kHJ+W87nqXs951/EDF7HdZrL9eE2yYE7NRJTobkRsN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VD7SyNFfa8ew1YDsgtXgP2o5wpgLQIEnpHHndCINlcVALvCOmRZLG3W4iT21ou3CCz9B3CTAWa7uDLUAafBj6601hK7ZQ4Lr1GH6y0t76zTkD/2XdYfEcRw9cxqIuymcKTuT5Cp2ksKJehdmWRqolWLaRHAz6sV7cws7cdOZ57Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cW4kDqeE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532A5VKl027389;
	Wed, 2 Apr 2025 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYaoqZgleLZVLUfbVHgfmlkJt23CJSCdYVICzzU9JjY=; b=cW4kDqeE7+YQdhiF
	htJlWLzg3f/Iu7Olrf48kL1GlTbHEMKCiOQUmWNvVSVgty7r1ixELHFo5vgKgRzq
	sygvA1yhM+HeV+USeCEPIbmTVCQAnDBYkBhJqrOPbPp1iOV7KvYeNNpDgkqOLyWO
	sUwkErKVpgHD4Frhg7SVpKdTNYKBVWReOBM+1uX5xL/lG4rpyXkBb1Zg1nxzaaQE
	BsbzDw2nQJWWEcGhcAMHcbg1hl8UO5foaCQ4TzRuYN8nnXybpnRAvltuPxAL8MJi
	73ec1jLhDJxKUzJStdjJiH3O9uI/22d8ITsOCmrf9vyd+oG9eOyzlSbupHDdd/LI
	kkm+fg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a01w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 10:27:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532ARkll019029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 10:27:46 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 03:27:43 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and controllers
Date: Wed, 2 Apr 2025 15:57:23 +0530
Message-ID: <20250402102723.219960-3-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ed1123 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=vdRwA7TqO3sj12wk4UIA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VaHASntIp8u2Umf6E1_nRB4BPPp1tfJt
X-Proofpoint-GUID: VaHASntIp8u2Umf6E1_nRB4BPPp1tfJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=809 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020066

Enable the PCIe controller and PHY nodes corresponding to RDP466.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V6:
	- No change.

 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 0fd0ebe0251d..1f89530cb035 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -82,6 +82,32 @@ &dwc_1 {
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
@@ -197,6 +223,20 @@ data-pins {
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
@@ -216,4 +256,3 @@ &usb3 {
 &xo_board {
 	clock-frequency = <24000000>;
 };
-
-- 
2.34.1


