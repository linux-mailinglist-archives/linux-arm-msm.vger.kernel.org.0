Return-Path: <linux-arm-msm+bounces-19880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF98C6622
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 14:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 248FC1F23318
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2024 12:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6213776057;
	Wed, 15 May 2024 12:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b7j/bn6Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3E7602B;
	Wed, 15 May 2024 12:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715775042; cv=none; b=sXxDgjOSBhIsUEdRcHiSXLDUM1jEn/snz95La+Vx15e/wZYy9jblZWC0bJAH/yEsARhfZLZtN8s+OsKHqCX6sx0/kfYpNq5hN5sLtaz0atOvhFDQXRmncyk40r71D1t1Yex8dL+BWvJbaPY3b2UrhDeYjikJDKo78aQ0qPkeFWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715775042; c=relaxed/simple;
	bh=U45sYz07c9/bh6hjiQ6b076yXpod53g0Oz1PD5e5z0I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijYgi+10336bcf3btMRd6TNlu6LZkDAQwar1n15jDtorSNtSzath25DkylsCb1n9Eruf0KT58k/Epoyv7vlJsCYy+nlEb1dfVQZS4aGdJTvWWsLy8s7EbpDPEZkBS8x59DaMqA/DkvH+DF/4illnkxMDvqcEAqJCe0pTEJodeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b7j/bn6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90fIl009791;
	Wed, 15 May 2024 12:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Cn7Uutm95jKjzlbLmmvM
	ddbDJUyHiP9YYs0w6BuoGtU=; b=b7j/bn6YpsYDsSAD8myBN5aBpt5uuyQcVJAi
	Z5ZtWBtQRc7ZTcLEcVMxVn3fhwp9p1ZSsNIRCdF/xAYr/ct5jg39CY3Ekt8RAA6g
	oSXc38vqnh4esumLVzIZkx+S1AyodgGSLBqZTlivbKxxNmlXF5xE74HhsuZZMn1Q
	72VaZUszazapw0cS88+sLN4o/qB4t02+RmTuJkzpJdX1zZ3DZHxSb441jqg07s2w
	CmKzdF7M5XBZZJcO0DNLRvMwgflIGdzBLsWc7hyiTNNQVwS1aGWiZAEJS99cwSRj
	KpNnG+Yzls6y7sHg+55XyVJ2efnRX+c5QM0n829U7u6+xG/IsA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51kw9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FCAa73023664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 12:10:36 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 05:10:33 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Naina Mehta
	<quic_nainmeht@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
Date: Wed, 15 May 2024 17:39:58 +0530
Message-ID: <20240515120958.32032-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
References: <20240515120958.32032-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kp_3wrGex8hghk7VJA0Hd6J1bUmm5EZd
X-Proofpoint-ORIG-GUID: Kp_3wrGex8hghk7VJA0Hd6J1bUmm5EZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_06,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150084

Enable SDHCI on sdx75-idp to support SD card.
Also add the required regulators.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index f76e72fb2072..6f94278cf837 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -41,6 +41,29 @@

 		vin-supply = <&vph_ext>;
 	};
+
+	vreg_sd_vccb: sd-vccb {
+		compatible = "regulator-gpio";
+		regulator-name = "vreg_sd_vccb";
+		regulator-min-microvolt = <1650000>;
+		regulator-max-microvolt = <3600000>;
+		enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+		states = <1650000 0>, <3600000 1>;
+		startup-delay-us = <5000>;
+		enable-active-high;
+		regulator-boot-on;
+
+		vin-supply = <&vph_ext>;
+	};
+
+	vreg_sd_vdd: sd-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_sd_vdd";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+		vin-supply = <&vreg_sd_vccb>;
+	};
 };

 &apps_rsc {
@@ -259,8 +282,30 @@
 	status = "okay";
 };

+&sdhc {
+	cd-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_sd_vdd>;
+	vqmmc-supply = <&vreg_sd_vccb>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc1_default &sd_cd>;
+	pinctrl-1 = <&sdc1_sleep &sd_cd>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <110 6>;
+
+	sd_cd: sd-cd-state {
+		pins = "gpio103";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };

 &uart1 {
--
2.17.1


