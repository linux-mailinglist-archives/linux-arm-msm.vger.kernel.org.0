Return-Path: <linux-arm-msm+bounces-70144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47018B2F69C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F64016BD62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABA930F7E8;
	Thu, 21 Aug 2025 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dMQdaBVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456E3054E0;
	Thu, 21 Aug 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775547; cv=none; b=afqV6MEVdPCZhOhlw5geDqiaNfLr1ZZspKjD/+HpgXQLsNzzOCaakt2AmzUFcq5jhWcInssVIWXW/lQSkFY1G/J9DUZLssj4azenK3azPdx+iArqSknWXZVjnfKAsJ2BLGLPzBs5+HYStWqfHp8aMqGhmeOoEGOHg97p1Z1hYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775547; c=relaxed/simple;
	bh=7A0nD77iNFoG4z+W5MKvuCOoitlmqP8lB/YETqpH4Ek=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thrAfpSm1OXsmA89vtathUo/3+9T7FWQnsGEpkSQioxUGQ2tCExnjR4RsW0l3suojfyiRsDc4j2MnLQCAZQ8JseV2FvVci0s1octqns1Kr686SMCprubqtHMfYuONsDX4zcaT/CZ6WhmJ/ZDS4Kntcravmj6+jfppdFICWfp1A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dMQdaBVf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b6LB026958;
	Thu, 21 Aug 2025 11:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gb9k66tEvuyg8r5fmB7L1LmEZqeDKNW5O/aSMlR5dXk=; b=dMQdaBVfsErSDhnZ
	PDNCAxS3fBbOD50Rzmhivbejobx5JdTWmyoKlT9TuP/fG4OBX61xPYquwn50GKyv
	6xMacy23uUiHuzxF+o8LBh+Gn0W6Yyx8iGBdrgST9Oi2JEKWSxPFoZnCQucPEx4g
	4tN9PIAMgPSw8xTLZ27VABO5dKDrTu1/y4mlpBGqYJkm+g+heBVmouTj371xa5LZ
	YiF7c3e2okEL2SOAcrf+oCt/8/ib6pvnTohcWqSC5+y/bIEtsie3SPpzVkkEfo41
	tlbcYajz4gLCvBTj2JnPW3AaFTnfCRowgNtzSo0Gc8ejMu67Ze2DahQBEuWZgBdS
	BbjFJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528w6b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBPBgd014463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:11 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 04:25:07 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [PATCH V3 4/5] arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller
Date: Thu, 21 Aug 2025 16:54:02 +0530
Message-ID: <20250821112403.12078-5-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=I4c8hNgg c=1 sm=1 tr=0 ts=68a7022e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=GbTRQnthUMyhj2PjmLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: FPXxTfrrHE1sX_WgljzR7CfTYOaC0SFS
X-Proofpoint-ORIG-GUID: FPXxTfrrHE1sX_WgljzR7CfTYOaC0SFS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX7MIGo0463sND
 mhQWIygULFBcV6iM6bwd7Y0Q1cPL/nblaXhkWrZnFNoAwDTG0FwZj7IlLoMR/oL0ljhZoSuLBFT
 4/rNCLN/Em0tOQkjaWRbVAYBptY1xspURGnDEmbLrZoC7LvK7h1Jsxu8u82Ol4KYIIJI6szngst
 NHyfkc1nf1A4dPudhAj3arIj8r71OxE4tMAoIZYniYyGMUD9dwu8+/6new0gWd5DK2WMLW7L/kY
 T2qe1o6VYYtoJFwb98ZMpQsqr25O6tbevdbakfIGbT/QNCXzNaC8OqHY2d0mw+L3UyDLFVS1Let
 EbYsE3pmnKd5JgbOUe/nRtTXrGy4GCgiOGAdpiiIY6M3kJs/jXCDo/VMGKbiH5U46drhcnmbMAo
 iykSIKRKkIwORrpWtE4A69BhoZeQ8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Enable Multi-Circular Queue (MCQ) support for the UFS host controller
on the Qualcomm SM8650 platform by updating the device tree node. This
includes adding new register region for MCQ and specifying the MSI parent
required for MCQ operation.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d6794901f06b..18c4ebf3c1a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3950,7 +3950,10 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
+			reg = <0 0x01d84000 0 0x3000>,
+			      <0 0x1da0000 0 0x15000>;
+			reg-names = "std",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
 
@@ -3988,6 +3991,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x60 0>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 
-- 
2.50.1


