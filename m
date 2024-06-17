Return-Path: <linux-arm-msm+bounces-22850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0598190AD74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F1D71F23EC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA1A194C63;
	Mon, 17 Jun 2024 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SOEqnxPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D0194C64;
	Mon, 17 Jun 2024 11:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625410; cv=none; b=NUJCenVwDLzXHpx7i+24oOEl6Nm/vaRFmGkOEwWKCRxz21rPtM8qZh6s8jfl3IOVA0SG9T3+os3dR3uC4SM9qmhHqJ/mKp2vGDMBB1mZChAUBNdTuhsQLKinFu0r5nY84fzjPeZS1SK1KK7qbG/IxZNumReQX0aJK7+5MS45/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625410; c=relaxed/simple;
	bh=oX6Qc4EeGSBZutzGZIN//OzKrMJI8kSNrzFMaBq8Gws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V0u3GvRHJFSjm90TLiwHKVWTKVTRbl7m6+HDyS2zdQvYetnAZ1qA1ONI8bKBNB3LoWgPQWMlQ+5qWdg4MKwMBbsW9BxgoWI1WhdhQD9Cav3MA3Ml/qUQ7eINX1M/vH9NTgafsrFZnECa+GAc2BBjIMRK7dwJBKyTxXq1e3WdIkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SOEqnxPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H6P1qQ030652;
	Mon, 17 Jun 2024 11:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2beUJguVwOalb8DtHb4pfX
	AqWS41zanD80QU/UkjWPA=; b=SOEqnxPFyrmEXegcTmEpxOdYG+A8jup7LX5VcN
	9QObMYuI1OcEmWLw5ozzZVlhZNnXrI/hDcSdapX+XkdVf5M25Gzb2d9ZfXaBnO4l
	IxlNVS5auQ1+Y8Q8sc2orLgY0QEJe85OW4ZxL6r45AgNyRrGVad4GMIHjSa90Tae
	D+LkAU65pU5q75fQ6n/sczmSJVILsgT8XjBuphON7wifRbzw3zO7hlroEclgf016
	1d0k/3df+Kqo8P4tGjn9QbM1QMFCdB91IlStn+qeg/Fijjy3XOPStcu+mg1kxmdI
	rn9URrq+wo62ebQFkRJfQ6OTg8lsKcCLknqXJFKtx4rdSZzw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytfut0reg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 11:56:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HBuhnr022713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 11:56:43 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 04:56:39 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] arm64: dts: qcom: qdu1000: fix usb interrupts properties
Date: Mon, 17 Jun 2024 17:26:24 +0530
Message-ID: <20240617115624.29875-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1aJ1Rp-DS8Y_R44k2tB8DTPvt5-l30lG
X-Proofpoint-GUID: 1aJ1Rp-DS8Y_R44k2tB8DTPvt5-l30lG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_10,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=514
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170092

Update the usb interrupts properties to fix the following
bindings check errors:
usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
        from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
usb@a6f8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq', 'dm_hs_phy_irq', 'dp_hs_phy_irq'] is too short
        from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

Fixes: dd1bd5bf7420 ("arm64: dts: qcom: qdu1000: Add USB3 and PHY support")
Cc: Krishna Kurapati <quic_kriskura@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406171241.YKuCm3SC-lkp@intel.com/
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..5759b8fe55fb 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -976,13 +976,15 @@ usb_1: usb@a6f8800 {
 			assigned-clock-rates = <19200000>, <200000000>;

 			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 8 IRQ_TYPE_EDGE_RISING>,
-					      <&pdc 9 IRQ_TYPE_EDGE_RISING>;
-			interrupt-names = "hs_phy_irq",
-					  "ss_phy_irq",
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
-					  "dm_hs_phy_irq";
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";

 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
--
2.42.0


