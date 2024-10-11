Return-Path: <linux-arm-msm+bounces-34023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EFB999CBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C015628500D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E63D20A5DF;
	Fri, 11 Oct 2024 06:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FnyGTEMM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F71D20A5CA;
	Fri, 11 Oct 2024 06:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628327; cv=none; b=YcKyU1bGlrrXk/9cbJgXyEGQt/guBz0XdLxQciD3g8uuk3s1ekwOFnQ9SywFUMA7k9qnoMgGw0jvOIGU7pNewm9D3Ij9hxNQhBdsT6jrIx0CjBlrSYll++meOEGiqKlvqGMSqllB27epmRLItF2EANquZEjjn5QvNQ4jBttWv9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628327; c=relaxed/simple;
	bh=/lRN1fRtvgCddmJE4BwxegqnA5l7P5tfodhFSQlZFiU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/CZ3gh2mmY2DLBO0PK9IGTuRfBjHcYzEp7kKVixeTC6qeZI1fBCcVwsjWNpsFku+U+SRNPUg6wIj+9vvgUdY0h28WZz0lZKRjcrBD5MsyUihXK7leqDqsbW4lIwdUprA0GPkbpZYUaD9Zrm1wVJZ6IKhiE5R+4epxbQewcwglE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FnyGTEMM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ANvvVS022616;
	Fri, 11 Oct 2024 06:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rQJTztl2bhM1pzaqlxEKn6nB
	XXChw5OuypaqDbySJV0=; b=FnyGTEMMSRRUWtnc6wJt+Z+ImENrb+RJZWytU6Wc
	dD6YBJz7wlK9p+pqmQN1cATf/qiha8FAkCK4oE2Wzwj7XRo7pvh0DjKzwUMKIypc
	mnsd4qZS8lph08uRlUVoiKaPgVORUGMEO2Orb7ge5WIVLuckqkPBMhFLSMiyP195
	BVb1ECDZ4nzq89MPoIN7g6nII30+4ewZQ6tNiIYVbLOI//kiWsSRlPDCK4J4qyrr
	d0Ap2sprXC/l8hucYk+93MuYU1GV80VHLRgficptEnx12fIYd5zqS8BoRmleTXcZ
	9YOFkztbJr3aW1o9xIDocZzrGZN2Z4sGWL0gng4kpaywhw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7jms8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B6VuaB007203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 06:31:56 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 23:31:52 -0700
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <quic_gurus@quicinc.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 4/4] arm64: dts: qcom: qcs615: add the APPS SMMU node
Date: Fri, 11 Oct 2024 12:01:12 +0530
Message-ID: <20241011063112.19087-5-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
References: <20241011063112.19087-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4sQTpp5WM4JVcdxzgZa448L3MSusv3EN
X-Proofpoint-GUID: 4sQTpp5WM4JVcdxzgZa448L3MSusv3EN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=733 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110042

Add the APPS SMMU node for qcs615-based platforms. Add the dma-ranges
to limit DMA address range to 36bit width to align with system
architecture.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 74 ++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 027c5125f36b..fcba83fca7cf 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -379,6 +379,7 @@
 	soc: soc@0 {
 		compatible = "simple-bus";
 		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 
@@ -524,6 +525,79 @@
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		apps_smmu: iommu@15000000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x80000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
-- 
2.17.1


