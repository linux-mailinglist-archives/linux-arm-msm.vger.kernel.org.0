Return-Path: <linux-arm-msm+bounces-20304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953D8CD1B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 14:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14410283E76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 12:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA891474AE;
	Thu, 23 May 2024 12:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iq5wQfM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B8F13D25A;
	Thu, 23 May 2024 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716465876; cv=none; b=bcUD+BUdE+yVDQ40RyS3X4DygkeO8ncUcyTl1B4Vvbs4m/T6oQH5YuOdMJ3BpsRv54LrxOKMcE0+RiV9DVLbgvW3b1+3WWo6+/w/AoVV9tcRFv2/XgNcFJyLDBt/hDJFrzaTQVP9HFX9gjJ8tmOnZ6ZxoUulnBs+9JRLMtO94WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716465876; c=relaxed/simple;
	bh=1GgRATR803W5mywDQwEK7V3Ylomr9LA6aDI5L3jqTm0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kAcl9ArfOtg0bmcKT2EeJgphIW0J4+8JzLdEdoLEnkuTGfWA2v4P8P04GcesMmHyA3AFrzI1tpAAkDZU3iiwsEYUhyxA/QhZ5lOLDVg54U9TB8d/r23yEeTRpAEwq6n/pFxPe7gxNsrNeUrx6wrYWGIG+SkTpe6Jf+XR8q1+1hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iq5wQfM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4hPU3024242;
	Thu, 23 May 2024 12:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGtcolYS1jgTmSwojJTr4Hqd
	LkQV6Hds6vOOFQtgMIk=; b=Iq5wQfM5vBjjZlqtu4DuuF3mi+3ZZCHbvqcGvwWN
	Flakl/l8VB3T90eghuX8/XsUujlKsoT8Wxgp/zfFbK13SGjjqJJ32Fu0aBMu7t2p
	w0nzWvv2T3dYbZPz7PR0whS3sfwFcmWpram8QT5oqRlN3u86fBJIKCGaZF0dEZ8+
	YIC5u7RF3cweUhvFk7LC1cheF8g/ALQsTloQTArwbqLBRKaEmM+UmIMaXwAEar4L
	/XtonGY+yFfVqLK1RiYKOZCNhycX/P81mY1oUq5VwnMCJeK9cxuUtSgQKcJwaMx6
	Rif25qmKCBGO9Uet0ea780Ml/1B5ZMTqGPEsiWKiEyPyew==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y1as1ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NC4Hso014288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:04:17 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 May 2024 05:04:13 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <ulf.hansson@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
Date: Thu, 23 May 2024 17:33:37 +0530
Message-ID: <20240523120337.9530-4-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
References: <20240523120337.9530-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1HX2LfCTru10Q0mCzygAXbBBTKyHewVB
X-Proofpoint-ORIG-GUID: 1HX2LfCTru10Q0mCzygAXbBBTKyHewVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_07,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405230082

Enable SDHCI on sdx75-idp to support SD card.
Also add the required regulators.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index f76e72fb2072..fde16308c7e2 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -41,6 +41,29 @@
 
 		vin-supply = <&vph_ext>;
 	};
+
+	reg_2v952_vcc: regulator-2v952-vcc {
+		compatible = "regulator-gpio";
+		regulator-name = "2v952_vcc";
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
+	reg_2v95_vdd: regulator-2v95-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "2v95_vdd";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+		vin-supply = <&reg_2v952_vcc>;
+	};
 };
 
 &apps_rsc {
@@ -259,8 +282,30 @@
 	status = "okay";
 };
 
+&sdhc {
+	cd-gpios = <&tlmm 103 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_2v95_vdd>;
+	vqmmc-supply = <&reg_2v952_vcc>;
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


