Return-Path: <linux-arm-msm+bounces-36679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401D9B8B50
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42A671C21E75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC9F14F9E2;
	Fri,  1 Nov 2024 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SA0bYk1P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E614F126;
	Fri,  1 Nov 2024 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730443550; cv=none; b=AL+jnOnGPFNBJ8y8Dxz1pfe7Df1HaGBWcpiDy0dQwTG45CVKqcPmy/bkPntfv6sxRsh1UIJRB0Mbzej+7EjR6hYZNdWg1rv4aeMIdNv0/eXzmyHX9oKjvYDGnvYRwa4chxWVVL1mBAPiJ3MW5acjc3d9LTZ/WJTLhDfn92Y0hCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730443550; c=relaxed/simple;
	bh=dD6n8dYf73lPJVK9y7xGUHbcGj9kSpUo2yX1dU/LzAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=fHrMVTxrgMiKyUoLseXp2yjkAm0kavVGnMaaJtykFSeQju17VmJWNkHHnSjlcNOVW/VRMfIimxROg9paMaUzZwjRoEwuY/ZbcRW8A1eT/vss5JeUYQsEPxCr12/yFUFjHF+xBsRQGfui+1enm3mnTDiREl8MLaJ7bv9eG0nkn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SA0bYk1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VJEmev004719;
	Fri, 1 Nov 2024 06:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D4YoBXN5lJ2MmnLJcSfY8I
	0IaJsddDd7ER381sl30bQ=; b=SA0bYk1POEcxvzReGmNvalQJC7umQ5KPc+kQAH
	1hijwF3sIc2RmKKkhws8vaz6VBRH/yjTawZqscCQO5Qdrdcy+Y9sn+rJ/8jE4enG
	fl2CFEaDMlYFbZzyzawQSFTKhdPOj56snXHIFMoFDUmaMq/2OGwwxchYGoRIKtlj
	EgIb+WLSNk/zvo9NWlB4NCC/V6qFjW/3vAUq83dTN8jtWiYG5jNmPD+wWoluxs3/
	LAPEUPy4Oin8e6OIQxsG303x3Z6JM7Tt/FN+pxAtIBtzOTsNwAcZaBbHhAy8+iAo
	m5XwvRF88NjyoLEAkwTm6YOqNIslxncXi9DdAbWOaQ7CKSQw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42m65pb9yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 06:45:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A16jiK2005676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 06:45:44 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 31 Oct 2024 23:45:41 -0700
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Fri, 1 Nov 2024 14:44:46 +0800
Subject: [PATCH] arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241101-qcs8300_pmu-v1-1-3f3d744a3482@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAN54JGcC/0XMUQrCMBBF0a2UfBvIpElMuxWRkk4mOmCrNrUIp
 Xs3KujnffDOKjJNTFm01SomWjjzdSwBu0rgOYwnkhxLC620AVAg75h9rVR3Gx4SXQKrdUiOGlE
 et4kSPz/a4fjtie6Pgs7f8W+21VtUjbY/kUeeOVy6OGeWFByYRMbWBtpFv/U+ZJJ4HQae2yoSl
 q8NoD1BgzYh1n3swcPexr1XjUF02kRx3LYX9aZvAeUAAAA=
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730443541; l=1476;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=dD6n8dYf73lPJVK9y7xGUHbcGj9kSpUo2yX1dU/LzAg=;
 b=uhgJ4gm+aaSRrd+eiBeXkdaQJ1Hhk2GWMFAhiFgWvYG33iFCAN3CJ15z7u70s38Zf2vpd5SqS
 7DGvRyuzcLJArnjo+UyQBtZ9ccs1WaoZMoPJj/oPOkhhoYar3dI50MX
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FLTRm1rOfe4GTBGKbexH3sCSrT9yKNfZ
X-Proofpoint-GUID: FLTRm1rOfe4GTBGKbexH3sCSrT9yKNfZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=861 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010046

Add Performance Monitoring Unit(PMU) nodes on the QCS8300 platform.

Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
This patch depends on below patch series:
https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/ - Reviewed
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..b716c0791b3d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -302,6 +302,16 @@ mc_virt: interconnect-1 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";

---
base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
change-id: 20241101-qcs8300_pmu-c6f1522af6e9
prerequisite-change-id: 20240925-qcs8300_initial_dtsi-ea614fe45341:v2
prerequisite-patch-id: 73c78f31fa1d504124d4a82b578a6a14126cccd8
prerequisite-patch-id: 5a01283c8654ae7c696d9c69cb21505b71c5ca27
prerequisite-patch-id: dc633d5aaac790776a8a213ea2faa4890a3f665d
prerequisite-patch-id: 9ecf4cb8b5842ac64e51d6baa0e6c1fbe449ee66

Best regards,
-- 
Jingyi Wang <quic_jingyw@quicinc.com>


