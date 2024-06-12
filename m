Return-Path: <linux-arm-msm+bounces-22377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB49904BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 08:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EC4B1F22074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 06:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2658D169AC6;
	Wed, 12 Jun 2024 06:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oNSZ7hcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65F358A7;
	Wed, 12 Jun 2024 06:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718174090; cv=none; b=D7OolqbYdkvsvI7xQySgkR4zEXotQju7zlScEmkhanAgSLaSnBE3M+ZLF6B4Jjc72IZmfWeQHl6jqJMoiRPSr5KXAayl4ybAQ2wv9Lcb7/vnYc9aMVdXu1r/F+YsPskKe62zpiQ1pEIwGr3fdPl4SZDOduDMbzd13QPZP8e0kmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718174090; c=relaxed/simple;
	bh=o8t3hjYpDoIuV5K/Qo9Rvb8ir/5F2rSVfqYCUz3bDpY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C54kdmgdYXmqGKvH04IacPHQ4rHZEHGqiH1+hauK7eP88Y1JmTBjEPrGQK+y9WVr1hhkC22gGRPwflBqWiMt8xHkIH48d9KmLXEMGzzTVRof+KdP4Crd0Ti0lnhACdIdTW0+7WLRoKv16XwnW3DkzF0LMypYuQR2RPthKqyr1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oNSZ7hcb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C0LXou032507;
	Wed, 12 Jun 2024 06:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eV5Kdo1W5bX+Um9AM/DR8f
	zzlxpgmC7+1JoNViJ5O1M=; b=oNSZ7hcb8Bngfi13UWqDuTdgspKiWkKUk2v99I
	tMg0Mz0efwxARrJFC9obEqdOndDz6hBL9/x+2axbTVrG4bCAyZvXiJGgkCNSrnXz
	rKHovwNqa4Qgjp+GZzpm9t6mrtBEW8qxaiaNNpCmEgloov/vScJ5C/nV4t5R5C32
	Tfw0uGOLIkqDk0qeC+BX1G5DqjdG6dODVxSTjLvB2TUhpzD/i6ub7O1IhVaYA4Zq
	YhW5LhjdnGwcnm0VNQbsuygwOYBIVsm0vpFAmozCX/k5yhA7N9/HzNbjkYFZPBKe
	oVomI+csIFWZ41KU+jPxTh2/U/GXyaNmg8GNcaXqDpglO0/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypp87ta0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:34:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C6Yiw6021752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 06:34:44 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Jun 2024 23:34:41 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <inux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: qdu1000: Add secure qfprom node
Date: Wed, 12 Jun 2024 12:04:24 +0530
Message-ID: <20240612063424.2494-1-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rmS_t90oTU-wDU1Rn0MtfLZdkF8P2Q9b
X-Proofpoint-ORIG-GUID: rmS_t90oTU-wDU1Rn0MtfLZdkF8P2Q9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_03,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=704 priorityscore=1501 adultscore=0
 bulkscore=0 mlxscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406120045

Add secure qfprom node and also add properties for multi channel
DDR. This is required for LLCC driver to pick the correct LLCC
configuration.

Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
Changes in v2:
* Minor correction in commit message
* Link to v1: https://lore.kernel.org/linux-arm-msm/20240607113445.2909-1-quic_kbajaj@quicinc.com/
---

 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..d8df1bab63d5 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1584,6 +1584,21 @@ system-cache-controller@19200000 {
 			reg-names = "llcc0_base",
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+
+			nvmem-cell-names = "multi-chan-ddr";
+			nvmem-cells = <&multi_chan_ddr>;
+		};
+
+		sec_qfprom: efuse@221c8000 {
+			compatible = "qcom,qdu1000-sec-qfprom", "qcom,sec-qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			multi_chan_ddr: multi-chan-ddr@12b {
+				reg = <0x12b 0x1>;
+				bits = <0 2>;
+			};
 		};
 	};

--
2.42.0


