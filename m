Return-Path: <linux-arm-msm+bounces-39181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEC19D94DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 10:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFD00B2F065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 09:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350591C878E;
	Tue, 26 Nov 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DGZ29QcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2891C4A1E;
	Tue, 26 Nov 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732613760; cv=none; b=quAaeqCnZrWALtVOqSe+dKj5rrjEIZM9RqJYyLiFfqsMZCqgwxUZu9oICPe+dy0MHBOzIwKLoqasDa6fraquYWv+IJWuaMPGqCFruY+5YwncHtGQjc/WrIp+fy2L2xY5sD2dHRuScKDTtQY7Bs+7zsZj5KTTfwoDMUu5EMJZ4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732613760; c=relaxed/simple;
	bh=Dy9jfyJL9DqPIvg0ykvyBMGcJukk+5g1Qe+eNUyCaTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PYfd3oJVnbTZDOWCgHJrsYR/YDj605jIwhPpQs7d/ErE+URuvbBvNUpiuj0T5n+lvl009xdhRyd07GWqC/v7KdCK2ibwKrVIQg9NEZbFx6wUKQMOikCS1S39hxBQEDpJtqHH+oDe11IgFh1030ccjQE+Bg5X0k3UJ6yAJevvjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DGZ29QcU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APLHhM3032368;
	Tue, 26 Nov 2024 09:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kG8EvSzPlUsbfIKd08/QW2AMJXbceZXcM+y0DGe08LM=; b=DGZ29QcUvgTJCqTW
	mnzcb5mp0yPZexxzIF6hCrTNDWwrxuYRCC7xzF6n/OnrnFB/66NpmeW2AXgyk42m
	c4XL/lah62Mt5L6FqHpfd8GpIMW9LNtBhol4VcvsnpMrzuCB5WltpjtApn5v5ZGR
	dB6wYOs0KZUzsbTeLKjc4VKsmtfB8QES/vmCEQZtKqoG2CNVZcL+IA0LTttnklpd
	bRsOT5Xfxv5wCluQqWl6UpLYrOpOg8m0D/n34dQDHS4yaHBuQk5eJ2PNoGMmeauO
	wWOIKWToE7REnbo4v7KnL/468KCYhvFhVxoo6iechSGq0UwzzBOOTVLYKUwwAmn3
	uWjFvg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43374symaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:35:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ9Zs0T029196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 09:35:54 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 26 Nov 2024 01:35:47 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Tue, 26 Nov 2024 17:35:06 +0800
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
In-Reply-To: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732613740; l=1324;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=Dy9jfyJL9DqPIvg0ykvyBMGcJukk+5g1Qe+eNUyCaTk=;
 b=m0gUF3DJqK9IHh4Ao2xDxYq7P5IgYuMOswFBONmgHV0fYUzKOLx94p7WNTKGk1GHzab1xYwMi
 IZqvLo5plupA4VSrrPYI0YQA5iwaDhZ2s1rOjC2eDCWgCT4kqSLK12d
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CrLOjxwpe6wns0vamFlKMyJopY7WYyWo
X-Proofpoint-ORIG-GUID: CrLOjxwpe6wns0vamFlKMyJopY7WYyWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=936 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260075

Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c39dbe791afb6a991db65acb37e597..9447efb9cd01654b74ec4c18dec58b1956ffe710 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "qcs8300.dtsi"
+#include "sa8775p-pmics.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
 	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
@@ -223,6 +224,28 @@ &gcc {
 		 <0>;
 };
 
+&pmm8654au_0_pon_resin{
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmm8654au_2{
+	status = "disabled";
+};
+
+&pmm8654au_2_thermal{
+	status = "disabled";
+};
+
+&pmm8654au_3{
+	status = "disabled";
+};
+
+&pmm8654au_3_thermal{
+	status = "disabled";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


