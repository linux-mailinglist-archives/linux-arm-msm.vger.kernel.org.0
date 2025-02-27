Return-Path: <linux-arm-msm+bounces-49634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A452EA4761E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 07:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19733B1355
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 06:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217C721D5B1;
	Thu, 27 Feb 2025 06:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KCfeIlLV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB31213E71;
	Thu, 27 Feb 2025 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639315; cv=none; b=lcSBcYMBLLhr9vd57VGQS2q2t7Fe7wr1tl2XCmhYkYfaRosDtyOcNKNoe+FceFQAERAKwX+862UwX3hfIppOk6JwzxEWJrdpDJ2PeOlQ4MAawP5xkPFOT/EKvR055C45jGQmhIuJ1mPlmQVOYVd7lnzn9I9a4F+yCiyU54dmWfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639315; c=relaxed/simple;
	bh=jDdaplvpsPXh59zGC3I3dvjHoc79VwYUNg/tFIxg5Gk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pHDG14RKIKvs39OqcLWJlNyEIRExp0JVvI4pCpBVTZPNLBvT+Q61ya7p7zu0/xLZU/s0SLV8k+s8I+n9SKWuMt/xl+MdIexgb/1l6eOocdA04MvHkiJ28hNPnvRrDtMjKbL8UK+WThQhQWrhgu/STHcMCprOfynVS4t5rcplPhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KCfeIlLV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R2bJwr001049;
	Thu, 27 Feb 2025 06:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtjSJQTeeJvPToF0iWo2JOztQM73hbLCGJfJeolxEn8=; b=KCfeIlLVnI4AUNnp
	x97kh1ylGyDvLxnBy44bzkGhNqJ2A+pbq3g47K2psD6d+vcBH2jPanyG2PthFyGz
	W5yEbDRp0rNFDJqVpFjOs5qmWJCiXBblLG8MTIAH/kaQXOcF+9mv+Cl/UcXg7aT7
	JMRFLwA5uphZsBb3ukBzl3gaEkGU/oz9JyXYvd85Pt2CXsNU9GMJxDGTnL/75zAe
	Pokzh+IWduES/MPPsTk7xT566cY5kEYOSLvWKizAdKfk/YrGpCNGL54vUAJv/UMb
	127EMASDgRaog5JvaKzUMtGV8PMszhnKkwO1meoQrJ3bW1B4vgpmgZR8iMNylAfm
	OnG9Mg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4523kcak45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:55:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51R6t3bM026901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:55:03 GMT
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 22:55:00 -0800
From: Stone Zhang <quic_stonez@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_miaoqing@quicinc.com>,
        <quic_zhichen@quicinc.com>, <quic_yuzha@quicinc.com>,
        Stone Zhang
	<quic_stonez@quicinc.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for WLAN
Date: Thu, 27 Feb 2025 14:54:38 +0800
Message-ID: <20250227065439.1407230-2-quic_stonez@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227065439.1407230-1-quic_stonez@quicinc.com>
References: <20250227065439.1407230-1-quic_stonez@quicinc.com>
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
X-Proofpoint-GUID: rXyECghgCqUTChhnXjzpGkUAjS4WnGU7
X-Proofpoint-ORIG-GUID: rXyECghgCqUTChhnXjzpGkUAjS4WnGU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_03,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 spamscore=0 mlxlogscore=890
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270051

Add an original PCIe port for WLAN. This port will be
referenced and supplemented by specific WLAN devices.

Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index cfdb091be32f..9f02503d61e0 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -844,6 +844,15 @@ opp-32000000 {
 					opp-peak-kBps = <3938000 1>;
 				};
 			};
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie0_phy: phy@1c04000 {
-- 
2.45.2


