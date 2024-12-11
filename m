Return-Path: <linux-arm-msm+bounces-41427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE619EC71F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D956188C247
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462861DE2B6;
	Wed, 11 Dec 2024 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i4k5Icbv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05941DE8B7;
	Wed, 11 Dec 2024 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905609; cv=none; b=JsK9IdlOSGlVkGZnyqMTaIqsiQzrVmkAvgexi7zUfxyHdtBG5+9f7w0b7uHt2BQ1qr2Q8kFP4Q0AL5/7me1EUuvah6vHcLcxxTq4bsaB6Kz9GrjEAzH/XXNkxA11S+/6QL3bxf/y2qQP7BllIb0wgGyYSvcgeWj5gwmS+wsuERI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905609; c=relaxed/simple;
	bh=AKjYRcMWeksudFdm74PjE0YJmfDEHmNUYsP/z7eIXQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GDKZmOhC3ZYKfRdeaRcKoqX3hS7YjqUSaC6NP1r6bKwnJCchS4nev0PVLJbzUGmQnA+pSanOcd8+x82Xu5DTCJ+zjiX17RmRt7bxwSWsNkiHLWjulJw3g+4Ou+IY2PG4gIw9mQW1zL3dOWXgyevjDBb4FDLj/E6xADEcfvtxAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i4k5Icbv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB140du007058;
	Wed, 11 Dec 2024 08:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8el/D2aQmJAFrpkqw5bHxq8FObstuyoUH2NqOrA6j5g=; b=i4k5IcbvAUNAjWHN
	2t3IzrDEjeM8vNtiTX55mBkItnEvJIdmkEFhca/qXTpHJSNm2GNmJ8Tv5lXebjfo
	ruzCr35AiXO0rxYN512NXfCW6XS8L0X6fHKQw/oeaK/WdUCjxcBhtKYSkZUROcX+
	5wMQZrEN92muuZzBS3ZYLFpmohGMEANq1WrMfFZMAK4Yz8dl5O03nl44gmb414j2
	vsygm0+kQ0W6ZcS1HVRDizJ7JKP8++SOQXM9yyi//E0xdsyG++HzNVf3bzgP2/Gx
	Nx7eZxXxlFC2YsSG8MizHb4xejK7d3InczzJHWqGhHb8fQwIdheTDNIBNwJqhi16
	6MWAFg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f0r9s4qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB8Qhfg013233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:43 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 00:26:37 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Wed, 11 Dec 2024 16:26:09 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: Enable secondary USB controller
 on QCS615 Ride
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v2-2-2c4abdf67635@quicinc.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
In-Reply-To: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733905591; l=1398;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=kKe4s3XKwFQfTeZ9bwf41VARC1I80JIcgi/PxB6/egw=;
 b=NA/s54+iak+5Jkd7VlCCi20NPs0KAAQW/ZJVMNxpNjT1iQmwuY2qAc4qsjkBW10MyrL24NI0H
 1gk5AXF8yggAAuJlszoZUQleef88XzxBE2icVnfBsHN2YZnQ8jRE23p
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OkQ2gENM1IoK1ktDCX7RZC7BLQHBVspj
X-Proofpoint-GUID: OkQ2gENM1IoK1ktDCX7RZC7BLQHBVspj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=714
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110063

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable secondary USB controller on QCS615 Ride platform. The secondary
USB controller is made "host", as it is a Type-A port.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index f41319ff47b983d771da52775fa78b4385c4e532..26ce0496d13ccbfea392c6d50d9edcab85fbc653 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -203,6 +203,15 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pm8150_gpios {
+	usb2_en_state: usb2-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-high;
+		power-source = <0>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -248,6 +257,25 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_hsphy_2 {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	pinctrl-0 = <&usb2_en_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.25.1


