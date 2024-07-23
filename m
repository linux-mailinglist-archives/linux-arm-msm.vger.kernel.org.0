Return-Path: <linux-arm-msm+bounces-26876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39069939E81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B435D2825FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1297614F129;
	Tue, 23 Jul 2024 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JgC/bTLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B114F11E;
	Tue, 23 Jul 2024 10:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728991; cv=none; b=ZUzBGZGMzyTeGpJI9JPHOybnkLNsmQiggC5sDP+Q6viE89c13u1fkI1zFR0BSmleh/DVDy2NVCu40aN8bdpz/5Nyyl7dUX96VgrUTwTkfXtw4AURkFQXNXXhnz5TMMRDkqWdI/5Kbv87RnhkCuRstMD4xPiWNPBipgtUxXG5lsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728991; c=relaxed/simple;
	bh=SosdU2G/Xh9kvu0xcZe4aQ0S93fmxEoXTYUTQVT3cXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fFKNi+YCI21Gt7uE0C53onuce4IbFo8Jt8S6bPLOiHVdQroq+OvK9a0W+R/j/C9BLMDMQ5TX8chDqUZW3FP6NvgmHZUFbdbWOGVTfaqiA8YRVGI3V+ipWAYXjcMBAuRtIxkCwuwaSTieVbFtrJSJUFkios/8Rf68O2debVmCj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JgC/bTLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N9hKsX027150;
	Tue, 23 Jul 2024 10:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpPEujo2KUlK1ERv9sX3ckusqZqTLQZPcqitdssjvVM=; b=JgC/bTLa8riIZaxz
	5ABOvmgciziglNg0o5iARqxn+T4iAwZ5bj/Po7gkgW/ePK/8BI9FX/yObT9HXbTl
	don8Zio1W7ou6T+OyhhFUtO0hjRHenUfuDDeW3lk+OKFppeD40+IZKeVwkmdYjfi
	M14rGNbKWCkFXVlKP0VAb0xnb+FrXR9xjQBMm8JIIfL7A+p7LbGaWSei+zbtOwsa
	Gk8C/w8uyPAXPQDUNGj4rlodRjmAIVAfEup+qxVjbcgRBKXeyXdlv4nlP7Iik41+
	Fu31lHsrV+0VsffCnUmeamkdwWHKc2Zk9+56Gr4McKoVqLSuA/o87TT3msrPGDd5
	86/SxA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgxc68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:03:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NA34Xt027176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:03:04 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 03:03:00 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
Date: Tue, 23 Jul 2024 15:31:51 +0530
Message-ID: <20240723100151.402300-3-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723100151.402300-1-quic_varada@quicinc.com>
References: <20240723100151.402300-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: L2A_beTn15Dc4ciz0Io_MU5A2f0BVP4o
X-Proofpoint-GUID: L2A_beTn15Dc4ciz0Io_MU5A2f0BVP4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=551
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230074

Trigger type is incorrectly specified as IRQ_TYPE_EDGE_BOTH
instead of IRQ_TYPE_LEVEL_HIGH. This trigger type is not
supported for SPIs and results in probe failure with -EINVAL.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Fixes: 927173bf8a0e ("arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 7e8f9d578382..71328b223531 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -322,8 +322,8 @@ usb: usb@8af8800 {
 			reg = <0x08af8800 0x400>;
 
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 53 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 52 IRQ_TYPE_EDGE_BOTH>;
+				     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq";
-- 
2.34.1


