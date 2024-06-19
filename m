Return-Path: <linux-arm-msm+bounces-23177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CE90E339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 08:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC3701C21F94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 06:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A2A6BB58;
	Wed, 19 Jun 2024 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JhekWnd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD94A1D;
	Wed, 19 Jun 2024 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718777837; cv=none; b=FDeNb0nrUuHpg/tTjAXTbZWk2r+OjdxTkFhA/ZPeWUoMiqYQafimZJedJZHVhYneqJWzp2A+vuBYN20UUyDjZekfca93rDhlYHPjrTGHwT6uIsTVXfLFb/7JolMDYnKMXptg8WwF2HcjyCuOSD6FDco+EyvWV7A7Oe8U6NQxF28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718777837; c=relaxed/simple;
	bh=LoIqGOykk2UXL+ZK7/OphrS+2TckDBty1r/f11IDxv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PD4WoLkE5hRluZgq7dLOVkIKEf5XIcY3dukj+6IZIhLxgAq6InXvTP/cRmSAK+Lt5igpPuJrpGI1zARr5ecqu5JnFDOAwTUel+xKNjbjsgobhxyReBldjA2tWm+bJk+lucRqO3v44MRjLJq0mhF3PnKxHKQrjGs02SRwEsT6HQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JhekWnd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILZuNx014357;
	Wed, 19 Jun 2024 06:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MdltLJyWr2d/++TgrnCLgZ8QLltHMEJWcQ7hE0ydggU=; b=JhekWnd0tGPtE+y1
	bzyX+KAWRTLh1EIgXXHxwGrI4m2fT3ggwXtp0gLjgjt1V1iMtbqA2IfZRjpL7LHd
	JP4KQHzgRzhD5BUzyBMPnrTfWo8d+TBnE8ILREUVdyNiSgd7CJ7xtSiJjPRwsTic
	A6abus7AOnly6zJ8zZjGrIPBJSqTWhcn4z5X6SFOKyEW7FJFxDstuoTvKE2hZ5JQ
	K1ovQEhdpCZLohp6TNe1adDj3GmGYDKF2r7WFEFIq5oL3fDwqDMmCPD1WtG8aN3K
	qc5eJfTgt7ZmO+HF0X77YyJaio2ojQjwJKvNqiVmq45s0/St+hUhrZgOUnRCU9tp
	wTTaKQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9x0tg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J6HCxI003580
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 06:17:12 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 23:17:08 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
        "Komal
 Bajaj" <quic_kbajaj@quicinc.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: qdu1000: Fix LLCC reg property
Date: Wed, 19 Jun 2024 11:46:40 +0530
Message-ID: <20240619061641.5261-2-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
References: <20240619061641.5261-1-quic_kbajaj@quicinc.com>
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
X-Proofpoint-ORIG-GUID: RUktb0nqjnEKQVeCvNN7QeEcZDfloMfV
X-Proofpoint-GUID: RUktb0nqjnEKQVeCvNN7QeEcZDfloMfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=733
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406190044

The LLCC binding and driver was corrected to handle the stride
varying between platforms. Switch to the new format to ensure
accesses are done in the right place.

Fixes: b0e0290bc47d ("arm64: dts: qcom: qdu1000: correct LLCC reg entries")
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 7a77f7a55498..3795ebb2d3d6 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1579,9 +1579,23 @@ gem_noc: interconnect@19100000 {

 		system-cache-controller@19200000 {
 			compatible = "qcom,qdu1000-llcc";
-			reg = <0 0x19200000 0 0xd80000>,
+			reg = <0 0x19200000 0 0x80000>,
+			      <0 0x19300000 0 0x80000>,
+			      <0 0x19600000 0 0x80000>,
+			      <0 0x19700000 0 0x80000>,
+			      <0 0x19a00000 0 0x80000>,
+			      <0 0x19b00000 0 0x80000>,
+			      <0 0x19e00000 0 0x80000>,
+			      <0 0x19f00000 0 0x80000>,
 			      <0 0x1a200000 0 0x80000>;
 			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc4_base",
+				    "llcc5_base",
+				    "llcc6_base",
+				    "llcc7_base",
 				    "llcc_broadcast_base";
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 		};
--
2.42.0


