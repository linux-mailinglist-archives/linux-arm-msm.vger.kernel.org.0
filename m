Return-Path: <linux-arm-msm+bounces-36885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 173619BAD51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639BC1F21933
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 07:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DD51AB505;
	Mon,  4 Nov 2024 07:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oV+JiCOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE511A265B;
	Mon,  4 Nov 2024 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705973; cv=none; b=G265jIYELUY6AFpnSWTPXByewUlXnX1C5X/haZTCFG/ovmfbjq42tRJdWIeAxWsFjVB2hvyqSb2HHpoSitM9VpqA/Vq7imOkb/Jw3/zF270TL6bpl1Hw8M9NlqqGgi0je+//CemcnVBpelWVyv1l85tuTqNQfIDHruleVVUGukU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705973; c=relaxed/simple;
	bh=1M2xR+Funs3PxL7DlRI0vGp26AIM8VSkCS2Uyks3Alw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVXcXLBtmlmHpQdE+sfBhaJKKdvs+3UP/qdVtWkSbsLMBpRfOyfnx51Uu0TsG57mnOrWH3JcupM70CmstcBiGFmcXzAKEd6/woTSpI73f7vsvQoJBKzmcaJAobL9hB6JETPkFECrtSD+1tYSgEkgGNUhqE7gEOcXnwg0rP4EB2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oV+JiCOB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Nv27R021876;
	Mon, 4 Nov 2024 07:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XIivlSdYiAwF8Xd5eF240Iu3g3OfHPHGHfnKaoHgE8=; b=oV+JiCOBSr0xzyPd
	ZZGt0Xf1L9pcmLuALA+pjlMgQdOMYUHXJYLUusNKdkoQiV0cLbm5Eqh7YgOn4gu9
	MPZpRxvI/bQQRfZub3Ux9N58FFx0zXNV5HNeaRE7sA6u10kgE3SZvNkNR/dw2phv
	8sOAC2Qs26S1HACMwZ4Gkan49jnBLwnfg9qZYGhiJjcXjjvK5zYMMjHS5ocvouln
	VwkIv7EFkoXA8kM2Jcm/+xrDXET9sLH2MqlrWFk/xHRtAIa2qQH07nshr4n+qNap
	7tK8Pbu0+QqyQj2qTsH5honRGm/l+psl/hreyUSgG3s+0F4sa/uCFeWv0UIQGxAI
	gERwnw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd283eat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:39:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A47dRa2012049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 07:39:28 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 3 Nov 2024 23:39:24 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 3/3] arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller
Date: Mon, 4 Nov 2024 13:08:40 +0530
Message-ID: <20241104073840.3686674-4-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104073840.3686674-1-quic_varada@quicinc.com>
References: <20241104073840.3686674-1-quic_varada@quicinc.com>
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
X-Proofpoint-ORIG-GUID: W8BuxbMBO5wSjSPo7taWJoMdFW8khRxu
X-Proofpoint-GUID: W8BuxbMBO5wSjSPo7taWJoMdFW8khRxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=616
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040067

Add a DT node for Last level cache (aka. system cache) controller
which provides control over the last level cache present on
IPQ5424 SoCs.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 76af0d87e9a8..497df93acf47 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -137,6 +137,13 @@ soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		system-cache-controller@800000 {
+			compatible = "qcom,ipq5424-llcc";
+			reg = <0 0x00800000 0 0x200000>;
+			reg-names = "llcc0_base";
+			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5424-tlmm";
 			reg = <0 0x01000000 0 0x300000>;
-- 
2.34.1


