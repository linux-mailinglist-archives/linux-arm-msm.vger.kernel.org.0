Return-Path: <linux-arm-msm+bounces-20921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 321788D344B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 808CD1F23815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B4917DE34;
	Wed, 29 May 2024 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GPEAHGEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E556D17DE0D;
	Wed, 29 May 2024 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716977767; cv=none; b=WKCqse0dUm0gGB3dlEzCsMEYy/8PkadIv0O99x5xh7t5qxt9Vcb/XA25Sp+pVGhvH5FreWKbrMjeAlKIZVtwvibrG3Gp0j7xh54GnczJtEEi8j5Qptuy+XvuyVT9iQhZoTNoe0YM5EjKhj9/AU7JnRw5OCQbdUFZKCg2FE0vlTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716977767; c=relaxed/simple;
	bh=ntFqdUqKYxrTsbJa0FBoNHdPGh4ACO9fJkViEO4r+H4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sojKq5E3M1g0W1n5NlvKvFcIaOHbaOVyNlw1t5YjOqWi4XjpU1D7qybs4a/625FC4fdqnTHI/RI37s1rgU3OGpCfyoXnCMgnKgBNDAWavywGwA++Hyl8IcRSI/18GTW28zPNl6oLmEh6siWkYMeetbzMQsPviBUbBJ6QzD8pR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GPEAHGEk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T7MJwh015693;
	Wed, 29 May 2024 10:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhMsfyU8vMZm7///E/US7eaO4Di6fkE66UjnUDfXHPo=; b=GPEAHGEkiv4cSCtq
	yrfeRZlIIdi0rQFJZUieabogduw764G/f/szmYeEMUHKwjPnJiRkyGTJ2Eki5/gF
	a10rILs5THkjHX3FbsrFsD1HzSJ5m984066QZsJanQcfOQBhaZwQh5EBwAWFSr+B
	qPmT1h8RJY0ZR2NRD/bUPXSBmi2/zCKNiRTgNWDDN6TOZzZk0og2xdsdYn1N2MbE
	hxg8368OaIaeM/5TKxNHzNMrZXYMy4NSB+I+B3Cv0jHIm+NHAsaFVK8QL0xARmp4
	qLqHdBjNnGRyBOCBktLYV28wHGoukaPjefz6K7mRvh6+z1E3y9UWgVFzqk60y648
	7QS5Og==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ydyws0b8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:16:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TAG2YN009809
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 10:16:02 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 03:15:58 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
Date: Wed, 29 May 2024 18:15:34 +0800
Message-ID: <20240529101534.3166507-4-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
References: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8mtf1OTOl348ZABD3ykoLeA59CQxeG-L
X-Proofpoint-GUID: 8mtf1OTOl348ZABD3ykoLeA59CQxeG-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_06,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 mlxlogscore=604
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290068

Add llcc support for the SA8775p platform.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5632fa896b93..8f910ab113f5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2885,6 +2885,25 @@ serdes1: phy@8902000 {
 			status = "disabled";
 		};
 
+		llcc: system-cache-controller@9200000 {
+			compatible = "qcom,sa8775p-llcc";
+			reg = <0x0 0x09200000 0x0 0x80000>,
+			      <0x0 0x09300000 0x0 0x80000>,
+			      <0x0 0x09400000 0x0 0x80000>,
+			      <0x0 0x09500000 0x0 0x80000>,
+			      <0x0 0x09600000 0x0 0x80000>,
+			      <0x0 0x09700000 0x0 0x80000>,
+			      <0x0 0x09a00000 0x0 0x80000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc4_base",
+				    "llcc5_base",
+				    "llcc_broadcast_base";
+			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
-- 
2.25.1


