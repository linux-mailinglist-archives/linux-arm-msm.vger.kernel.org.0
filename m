Return-Path: <linux-arm-msm+bounces-50811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84BA591C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 11:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0091886233
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B464022B8D5;
	Mon, 10 Mar 2025 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j9W1OZnb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05337228C9C;
	Mon, 10 Mar 2025 10:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603679; cv=none; b=NPgAVDtswl/6LCm3ErC5rdf66+dTuagu7PYvQNQKu5MB7qR3ev+HUCNaLDoZm9EguX5oKMNzKcnowunY+l1IYGba2vrQSBvHsLNemdjYORj55kYiM7Vce4JKJGwVPj+QRDzbkTtY1WwpcI6Sk7nyNLDU4sUydW+6Okg7VJIwMpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603679; c=relaxed/simple;
	bh=ksn8IQPKpJzP0SAfN/0TA4qOZ0TZecOeK/E6ed415e0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZcvI6GgPPbSbvtHrFOTg0khciQ2ZPYHPRuC74/GPWkBdbqzu+b/kjgTgiyuXvGPMErTMzxq8eGDhkvY3DgMVo1zJyckGBj7gwQopQySlktg3ySOZUUVW7idImX6hGyVf9VUWAbvhtXJ/1lXxDVjhbrkooTRFapXD7O+EtKwffCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j9W1OZnb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9LfuR006483;
	Mon, 10 Mar 2025 10:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gb/rZDUC2eGqGowkMWPm+s
	ZwIMzFCl2wQLIKc8hQF6k=; b=j9W1OZnb0LQTeUk9QiTFmKRk0Y5D7ieE/IiPi8
	A27HwiefqpsbRAwdVMfeYhY7w51L1VFsOwFqfoXTLR1ZD/cGktKnfJfmIzQGPjS5
	DvGlFLK0pcCT4Nfhtrisg1ktWvKUzopAMcftDlcPcgXhBD42P8JFTxbBTVLJdBM3
	StJSsDo1owhw3kddytGcsy+Y/AJ2Kc+TGltIPoXtier3T8TLtFWekpGP9C76rkmH
	zrjnqGefrOgHSPhx4iCDscfWoyhk8pB8YHoO03El7UZCU8lqs2hT30W7VTtEb0yp
	baEnDeK6AQOxYAlnoGtgYd4hRDD+zc0V/kdJL8Baqg4lG3cQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpmhte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:47:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AAlspp010108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 10:47:54 GMT
Received: from hu-mnagar-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 03:47:51 -0700
From: Manish Nagar <quic_mnagar@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QCS8300 Ride
Date: Mon, 10 Mar 2025 16:17:43 +0530
Message-ID: <20250310104743.976265-1-quic_mnagar@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-GUID: asiVt0grXUnT1VyPq3sZm_1EZq5iVg3D
X-Proofpoint-ORIG-GUID: asiVt0grXUnT1VyPq3sZm_1EZq5iVg3D
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cec35b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=0nCIlMqfeCQfA5XZMt8A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_04,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=939 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100086

Enable secondary USB controller on QCS8300 Ride platform. Since it is a
Type-A port, the dr_mode has been set to "host". The VBUS to connected
peripherals is provided by TPS2559QWDRCTQ1 regulator connected to the
port. The regulator has an enable pin controlled by PMM8650. Model it as
fixed regulator and keep it Always-On at boot, since the regulator is
GPIO controlled regulator.

Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Manish Nagar <quic_mnagar@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 916d4e6da922..7947e48f6a95 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -22,6 +22,16 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -286,6 +296,15 @@ queue3 {
 	};
 };
 
+&pmm8650au_1_gpios {
+	usb2_en: usb2-en-state {
+		pins = "gpio7";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -355,6 +374,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
 &usb_qmpphy {
 	vdda-phy-supply = <&vreg_l7a>;
 	vdda-pll-supply = <&vreg_l5a>;
@@ -369,3 +396,11 @@ &usb_1 {
 &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
-- 
2.25.1


