Return-Path: <linux-arm-msm+bounces-39402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6309DB4E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 10:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3456A167A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 09:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3F5156887;
	Thu, 28 Nov 2024 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MmLaaPm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997D0155C83;
	Thu, 28 Nov 2024 09:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732786877; cv=none; b=Ro0GBqdOXYNX9XfsxrJuLx9jUTPvmbKFYcHCmWGweCU6qyXW2aXPVDQjLjplDEanMqoDpS2dUHHxZJTodVvkPNyvaHRv6IwFscSer6FXziYpOEMmVVvxeAg+9mgjkQNEDYAQFiOBlaa8g/mTNXHlq2cCswjzdcvxQMXcO5739NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732786877; c=relaxed/simple;
	bh=k71kvRRoBDmVzGMd5DTUXIv9WgZ16WK1Rj5Cwxj2hpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OJGvtKFUVV2KYu3MoGGrtNbb/RWucXKKoAQFDull9r0R5kVkR+FT3WJzoixn96cUv9khqLzaIC5RSCCSF2J/OlXvdubGAr2NnBXeYaeZGzMgsKUwPuqxOuW0g+GwFx0gxerxfeQp6PCBcK8Q7B+dGPVPURHm4rFpw8+GC1y9H7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MmLaaPm+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8TDTk025351;
	Thu, 28 Nov 2024 09:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mkNPgDK7NHK5jnRClmZAvQu0Tyyth2yZXXa1RkYqaco=; b=MmLaaPm+VaEuF3Ea
	Qy9u7An0ngImxxwHC0mKsmuFvf3QsMvV2dHSM4OsUWQi39QL21bEg73GqXyb1g2h
	J53PMU/GiW1umCfKrnUgszsNNjqnpABbF1I9377fwDIK5NvGmkgGW37tTe/UeEA7
	XG9uxBHdwR8WgAKcSRvYTSA9XIXFtaZcT9N6KGNGyjW8Yuu6/1nsCU5nhbgr7OIo
	xv28CnQ6KVKc6GLC1tCDd079/T5pae+EJrHLOynY+1P1YT+/1aGswnnjpVO+DMjV
	ZP2dfdtsBi8Gh2OqtpIlbeV4oS16nIhTTSiJRCenNZwuLj+j5rhTO81Rz8G4FmzX
	F7ApDQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xw2322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:41:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS9f5SL002995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 09:41:05 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 01:40:59 -0800
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Thu, 28 Nov 2024 17:40:17 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-2-001c0bed7c67@quicinc.com>
References: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
In-Reply-To: <20241128-adds-spmi-pmic-peripherals-for-qcs8300-v2-0-001c0bed7c67@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732786852; l=1329;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=k71kvRRoBDmVzGMd5DTUXIv9WgZ16WK1Rj5Cwxj2hpc=;
 b=BInAOxjgkGxlb99YAGyXO00Cm1qiOYKsBTT7csQJtdfuxAneZMKzP6cFfoqK0A0CTMflLaHnp
 nI/FXsUH0t+CB9pKIDQ5H/rLluAfZPr1rRhYgFKLUbKX6wS2McrUQWI
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Te05hiFdcF2cLLZjr7pWh4ZDb24sXeK
X-Proofpoint-ORIG-GUID: 4Te05hiFdcF2cLLZjr7pWh4ZDb24sXeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=934 mlxscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411280077

Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c39dbe791afb6a991db65acb37e597..56e7194521834a7a6f5c5597e0f28a27a18d90d3 100644
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
 
+&pmm8654au_0_pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pmm8654au_2 {
+	status = "disabled";
+};
+
+&pmm8654au_2_thermal {
+	status = "disabled";
+};
+
+&pmm8654au_3 {
+	status = "disabled";
+};
+
+&pmm8654au_3_thermal {
+	status = "disabled";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


