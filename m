Return-Path: <linux-arm-msm+bounces-47512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C7A30298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 05:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B25F1889B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 04:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3E211E1C3A;
	Tue, 11 Feb 2025 04:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fpnYA/IS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D32F5E;
	Tue, 11 Feb 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739249197; cv=none; b=sIn2CGbHsDkwbH9IIhiZlrn0HtzrGkMVtoGf02Qx3kEShD2NpMhRTMTHhbh5piUeFAzrDIrpnfyvD25Jl6CeG0X8lRj6lH8UbEAvZUsobsyEofTjgxD0nYJYdP/1yvDoUz6eWx/lSBSOCyU230d4/IAVxbPkTztIFlVhXnCfSnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739249197; c=relaxed/simple;
	bh=gcoXknSb0nqMBF7zF9lg0gM7M10yomH9HjJDuP8Rvkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=kCSt98hzelqHeLm/z1n6yaUQ8vbSLw8T6JiBbqK3C/Qfg3WHMqLs3gr7bvdeofjuBk22H7gPUDcnsd1Xm/71nvv3TWdZmpfrau6Jo7kMaBbE968E/j2mMwdbLj48PTX++G8VF2s5gINjsktF3dMIq7sIQvXehyn0pOSYdXCPUWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fpnYA/IS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B3wofr007898;
	Tue, 11 Feb 2025 04:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ry3wqNc5AurTrjK0HmPzRbRKkeVYjEyiwQ9iuY3We4g=; b=fpnYA/ISB0MX56oT
	/L3a3B+2JeU8K4TysHnfutQeX6veHw4RqmMLTk5zuNUNRYZ0fWvEWbnvbLOPPPm9
	uwT0cBmr9tfe78R2O5OTdAGePKSlSR0I9oxxf9LWR8r6p03I8OKOW1Bge3NHHpQu
	C+wE/60wdd9SfRDd3WmztE9eP5ND7+ytG8yzYVr6TSI2gEs+SY2zXycyHrSWG8WL
	EwBOdr57CUH6qhVNku39xaE1zPQUOB5LSpJglud2vFlSxXFXUkQWciUS9KYHlAoW
	t5viqBCq3ZYfzxpn4nxQR3T2DIQUIlEPTHtmuSU6Jdoz8LWFu3qFusVNGiONWtNG
	V+zD2Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qy4d82vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B4kQWu018120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:26 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 20:46:22 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Tue, 11 Feb 2025 10:15:54 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-b4-branch-gfx-smmu-v5-2-ff0bcb6a3c51@quicinc.com>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
In-Reply-To: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739249174; l=2215;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=gcoXknSb0nqMBF7zF9lg0gM7M10yomH9HjJDuP8Rvkc=;
 b=4WeFDyk3oQqXxXujEm7n+MFUw8AwltsKPeuxIhZMIIPSFVpL/aIX/DmFRdiM+FZqY/j/3jRc2
 Zwnzb/lfkxZAg/3+1b+U2mA4c/t/c8jOhyRwPMr933bTGd6KBnN3jwe
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Vb7cShOAO85QkYl-8e1b2qcMokOwfcSW
X-Proofpoint-GUID: Vb7cShOAO85QkYl-8e1b2qcMokOwfcSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=739 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110026

Add the device node for gfx smmu that is required for gpu
specific address translations.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..f1c90db7b0e689035fbbaaa551611be34adf9ab6 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x3da0000 0x0 0x20000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <2>;
+
+			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_AON_CLK>;
+
+			clock-names = "gpu_cc_cx_gmu_clk",
+				      "gpu_cc_hub_cx_int_clk",
+				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
+				      "gcc_gpu_memnoc_gfx_clk",
+				      "gcc_gpu_snoc_dvm_gfx_clk",
+				      "gpu_cc_ahb_clk",
+				      "gpu_cc_hub_aon_clk";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		pmu@9091000 {
 			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0x0 0x9091000 0x0 0x1000>;

-- 
2.34.1


