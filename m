Return-Path: <linux-arm-msm+bounces-37716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3AD9C681A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 05:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E31DE1F24BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 04:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EDA1632D5;
	Wed, 13 Nov 2024 04:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TTQroaE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C432566;
	Wed, 13 Nov 2024 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731472466; cv=none; b=Yj4noWCeonGZxE16xZ1C0mcOj/hIzQv23tfrUTmGzSYNfgfQO7BWtoq+NJm1RfaxpsQfdwtzvjqtM5RpNGABlpng2RTkqx8EN7FKWlDqPnbIQjNm3dRJr2+UU0RgnMT4ZPORiX2oqkZWi8IU2ZouiorSr6nORhYbQnesxhmPb50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731472466; c=relaxed/simple;
	bh=9IR2F0n1a9tE3JOk81vWawNec85pbFnPZCFN34CLxfE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nr7io6LV4C+f5UEsShvPu9q/R0EFmmiD9sHj3d5euTyaRTyZL3aA3M5QtU2aVpAvL7Dku4HNbVBJkI6OATj5WGlAc+uB9G55nEIen5QAK1HNfpIzZsEE/mGAtwdq413XlSwOU7F85OMPOBdajU2r8FlfWxCdLp2TSca+aLpSf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TTQroaE3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRSnK029644;
	Wed, 13 Nov 2024 04:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q3ucm7q0Unlzb9UB9y5EMOEag4Mi2ROhQRK/SnF3quM=; b=TTQroaE3hiR/xMd3
	zarIsODf1meLcTI/fIfapAs11LsLDbaFPWQrxDK19uB9Acv257+7cBD34nztm5bh
	G9yHR33RWVTbc7UM1jFxWjTTuKomPQDSXkbcO61B4MZmA9uUe4BvNuvwOVZaT2p5
	IFFYh8PLqDV12wPorLjFCzNnaG6n/1Ml0ueN+janxhGZ58ojgpO4/nJRBH2EASMH
	zxTGeZuw6gOWP5X3+FDBSZjWecdbA0n7bUwIrzDh8FhUP9YybOYzSmDel3LOqFjj
	gbhhoRw73JZEn8p9tX5OvX3w9/e+rBuVEwxhL+sobWX5aNPfLlcMoOSol0E1wcaq
	pyjM+w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0469j7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 04:34:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD4YGvr000770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 04:34:16 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 20:34:12 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300: enable the inline crypto engine
Date: Wed, 13 Nov 2024 10:03:51 +0530
Message-ID: <20241113043351.2889027-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113043351.2889027-1-quic_yrangana@quicinc.com>
References: <20241113043351.2889027-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: 4--EQgQ-EYG4zZTEGk8v9wGXQxsg2onk
X-Proofpoint-ORIG-GUID: 4--EQgQ-EYG4zZTEGk8v9wGXQxsg2onk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=901 impostorscore=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130039

Add an ICE node to qcs8300 SoC description and enable it by adding a
phandle to the UFS node.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..2d6ce6014329 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -685,6 +685,7 @@ &mc_virt SLAVE_EBI1 0>,
 					<0 0>,
 					<0 0>,
 					<0 0>;
+			qcom,ice = <&ice>;
 			status = "disabled";
 		};
 
@@ -710,6 +711,13 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x8000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.34.1


