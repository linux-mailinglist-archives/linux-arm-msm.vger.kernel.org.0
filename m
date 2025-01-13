Return-Path: <linux-arm-msm+bounces-44912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8DA0C367
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 22:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9363A5B44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 21:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B4D1D514F;
	Mon, 13 Jan 2025 21:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CUKrIzzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416761B0F30;
	Mon, 13 Jan 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803000; cv=none; b=ruR15a6zIJczBWiFPJBoRFlEqrv55kvSBkN4zokOJgDy8PV5S3yxd1eA4xhIgXii84nOaq1roHld79BXzVF8djEray0YWxAgVKX/K/Lv8cONwGiLMhVk29+040wuYR/JdMv6QtP9IHJsVRyTrye4H34o+VeV/mPmkMqgyiXiaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803000; c=relaxed/simple;
	bh=cOJsRDBcgLDBp32RqWAqDTQsoREZ6J+vEdj//CoPbrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RDfcN8mA9dJRCNbcXKCx0ob3E0U74hQe+X/sMRZfDTeshVXF3SYAtc9diCOwnYQk8tJ3HPfprHjhDC1DvOkJvcyg1rzwbaBs5YrkCeIwFtO4TKczhVbSwsOQfC3qLgIebMQNZchzUqpPt1ptqJfi5PutIzFHJtJ1KXQjfbkRw+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CUKrIzzv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DHDrGK015112;
	Mon, 13 Jan 2025 21:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZpcRHclsZV+n0sv/cngvaVlAnRrHbAMrX2D3lIQUKxA=; b=CUKrIzzvizzBTaaV
	oQDcKRNNubh1hP+kO4cgwV5dcDawX1uODW4mBXgeItuorJ4+YLVeE9Wm2NRL/C7s
	tnivrRZ8H8qFuo9g4U52aJ2M092AI9e39Ob+XgrWP+yQMP4ZQL/Xq1VlmWXNMJE/
	bExynpae3ldSZkQ+BRwwllg/RUh994D3stgFUNT1g79s1dY297dXlGWl6gfiuDCe
	AWvzdWxOeX6tEsa+X1nW4+f+hVQSmF06W8NQbAHQAAnATWlm2fSzqhQLtvG2Q2Y1
	XPTlkcgkvDQTayzp6a16/cRbO7rkXip6vDGd87ej2/5dttg8iiYe25BZdBkOyMRq
	QK/xXw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44571yrgxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:33 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLGXRf000946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:16:33 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:16:32 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:16:26 -0800
Subject: [PATCH 6/6] arm64: dts: qcom: sm8750: Add ICE nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_crypto_master-v1-6-d8e265729848@quicinc.com>
References: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
In-Reply-To: <20250113-sm8750_crypto_master-v1-0-d8e265729848@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Satya Durga Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Gaurav Kashyap <quic_gaurkash@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736802990; l=1020;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=kYx1ne3b8juDuVcobYdCJj2Z5nQv/iZNrM6rP7xtAUU=;
 b=TQ5b0w/llxvDHVQnd9VvocaFvjCSbeU0CzLPOvFtmcP95z4DB1CeWzOoyizfvzPGtm00WuxXx
 aW4VHdWrM0FA7KRB/WQoYsyE0Mmhxe5PlATUxkSA7DeI8FjGmgomf3o
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dslp47vCZZtcnVAoejdMzPxvCxUZ523f
X-Proofpoint-ORIG-GUID: Dslp47vCZZtcnVAoejdMzPxvCxUZ523f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=756 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130169

From: Gaurav Kashyap <quic_gaurkash@quicinc.com>

Add the SM8750 nodes for the UFS Inline Crypto Engine (ICE).

Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 9b2ac8c30013b02ca78140eb4144b4530aba5d6a..63231f4d72e2ca2a109efff00ab7a21c7475888a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -1944,6 +1944,14 @@ mmss_noc: interconnect@1780000 {
 			#interconnect-cells = <2>;
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,sm8750-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.46.1


