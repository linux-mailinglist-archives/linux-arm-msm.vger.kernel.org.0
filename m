Return-Path: <linux-arm-msm+bounces-38782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC449D5A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 08:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8341428399B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 07:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A894F18787D;
	Fri, 22 Nov 2024 07:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dDGwBdCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE8417B4E9;
	Fri, 22 Nov 2024 07:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261799; cv=none; b=dzgjbffEo9/XqcEBh1MoDsqF7SD2lWi2wIVrLmRZQy0h4JxWwdL5zDblPLtFedmJ2E3qqjFPur3Yz5QdXEdhj2q+Ou4j+ObQXJpLQL5Lq0iiJu3cxKnFMZss85o8KmJMoMkoW3b63U353agcy5DUnt7RSLimXE1hWedyg9A+bZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261799; c=relaxed/simple;
	bh=My2daiLfBR+Mjsh4foxYiUEZjUV7dalooaztddo2IJ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2uSjpgJTqoDHvdf7f5Fh86V2Kiq8V9Zl76tJtuI8qeZUTurcNbBoBft3MQTI/5DIiHtJ8TKDb+nw0LE0vU4Z8B5XK9UMMHM/OP7dYEKj2Pybi5fwKf4V6iLUMktiSxc3lq+nCSxL538QPYVIOceaVWRNphkO6SpebHbTwS6JTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dDGwBdCr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7GHr9016886;
	Fri, 22 Nov 2024 07:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bvGB5UyFGU5Om5T062j/cNyn
	+OTjL/N8AF0U0yGGO34=; b=dDGwBdCrRbkFPgZVgPTeXdSuUsCDmVAxCYCZqBrZ
	C6c47p/Dy+6xvMwApTfaEGyeut4yQshb9TP9vbnwpgVAWc7K1WbkxdD/iDIE7yDS
	8RaePA1PPq22If4kC+XSy2fqqQry1ZZ19roeyRjIx/GynzqMJ7XGaWHPSyhUTH96
	04DQQTIGxKvh1UTDL+oktqWC6MDjvMSCa38XYYOSusjunKwEOco66y+E9eGKgN2U
	LBHEAA6irMN27IVOrUKzchhAf4ZVdiXmuxSBYSvjdmSWuOvpssdh2TGS5VHxecbY
	myJ5UNuDsrChba0HbK5SIGnJYkxZF9pmLiS2F41QdlV2EQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9kcvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:49:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM7nnmI024584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 07:49:49 GMT
Received: from hu-qqzhou-sha.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 21 Nov 2024 23:49:46 -0800
From: Qingqing Zhou <quic_qqzhou@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <robimarko@gmail.com>,
        <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
        Qingqing Zhou
	<quic_qqzhou@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs615: add the GPU SMMU node
Date: Fri, 22 Nov 2024 13:19:22 +0530
Message-ID: <20241122074922.28153-3-quic_qqzhou@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
References: <20241122074922.28153-1-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TZ3k1Tz6GBDgMYVKgXHGDRokyG8CGYiH
X-Proofpoint-ORIG-GUID: TZ3k1Tz6GBDgMYVKgXHGDRokyG8CGYiH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=876 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220064

Add the Adreno GPU SMMU node for QCS615 platform.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 56af38d4f75f..4e0f26563db9 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -528,6 +528,33 @@
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@50a0000 {
+			compatible = "qcom,qcs615-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x50a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			dma-coherent;
+
+			power-domains = <&gpucc CX_GDSC>;
+			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>;
+			clock-names = "mem",
+				      "hlos",
+				      "iface";
+
+			interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";
-- 
2.17.1


