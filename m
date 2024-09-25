Return-Path: <linux-arm-msm+bounces-32471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28076985749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E313528466A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D77189F20;
	Wed, 25 Sep 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HqXWx2iv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05A189B88;
	Wed, 25 Sep 2024 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727261049; cv=none; b=somahjjRlzBu5KmR/+E1fxgB2saQ0oBvvvVV3LOFinFW7II4Au9UXNQXHpC0s1zW8NGucDnA+/rjVQ/sxJr+krWkFm4g3e4xTSYQItJa0BdZd5vbLGpjTJBly0lSw5b7Kha42RZBW9W+u0ZjxlgBJ6upl4VGGrxARCkJZorF/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727261049; c=relaxed/simple;
	bh=vxxLMEoyeE2DetZFZuvbHLmzvfseK7JDzqmLPzwbd1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RALkq9MyTH31CXd9YGS8kYqmrCMMlcHXGEs+BxYRyC2b0Lkh8xBHdVQMaDa0XyKpCtY7rHdVTalE4a2Havz47XhyC9KCOxgwPdEQXEMNSaBnI5+yUd+oFh6pSA/YGHmTGhEeB1MdSKoIeckIdWWwxEmj/IwyyvZ1br+th5K70Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HqXWx2iv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P8HJYa011805;
	Wed, 25 Sep 2024 10:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tsGwsKyayTTJu33+gQeuwcIZQp4kPBOKecKkgsInNk4=; b=HqXWx2ivFVDFectu
	xEifHGirQTx8XiXXp7gh3igK+++UMk1qJxs9d+xQqOJEk3U0KfHNUEXl+2on+vCN
	m+Q6s84/t2ttaE4SOfldlPAmQnVCD3+p71innPw4xgkczTP9EtWiW7Ppjx6+hdnu
	V1M0wYbqoeEFQeuyAN9VU7f1OT1ZOi47YBdvd31u5mu80V1eIJAyHDuDUTPDNyvO
	pgYGDxjCQjEkmPmxnNQGXkbAzy2/Fn/laMdDSzuoUapTE0CTA3OEgfpH9eF9OEl9
	AiK+XxJZauFV/ciC054O+HxXHHGalC0SBMG84l5GIwwtP0mEasUSu7/chTA+r+fE
	x+lFaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgnc7bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:44:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PAhx26016540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 10:43:59 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 03:43:55 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Wed, 25 Sep 2024 18:43:33 +0800
Subject: [PATCH v2 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240925-qcs8300_initial_dtsi-v2-2-494c40fa2a42@quicinc.com>
References: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
In-Reply-To: <20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, Jingyi Wang <quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727261026; l=1433;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=vxxLMEoyeE2DetZFZuvbHLmzvfseK7JDzqmLPzwbd1s=;
 b=TU7CSg4/Uidl1kREaYjuUg0bAHfV6z+KQft79DrqXNLdTULYyajO2g160mwLq9/YlC7/lL8qK
 D25M8eK7CBuDSx0uGfwZnenv3miutX0FAWE/2HDRSEv4ZTcXWA/wMUP
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oag1oImGC9IB0PRdj-Cc1AU7kd6Cis5r
X-Proofpoint-GUID: oag1oImGC9IB0PRdj-Cc1AU7kd6Cis5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxlogscore=701 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250072

Enable clock controller, interconnect and pinctrl for Qualcomm
QCS8300 platform to boot to UART console.

The serial engine depends on gcc, interconnect and pinctrl. Since
the serial console driver is only available as built-in, so these
configs needs be built-in for the UART device to probe and register
the console.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..0b5634ceeaff 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -607,6 +607,7 @@ CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_MSM8998=y
 CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
+CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_SA8775P=y
@@ -1323,6 +1324,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
+CONFIG_QCS_GCC_8300=y
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m
@@ -1625,6 +1627,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS8300=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y

-- 
2.25.1


