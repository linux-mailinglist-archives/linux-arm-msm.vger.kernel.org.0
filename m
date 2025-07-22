Return-Path: <linux-arm-msm+bounces-66141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC9B0E15F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B223AECF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4801827AC2F;
	Tue, 22 Jul 2025 16:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="auGFu3C0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F0246764;
	Tue, 22 Jul 2025 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200702; cv=none; b=SF8ocnu9bB6U2EICL42R45ucvhKxVrvSPYjsL2cZO/4EWgxLSVUoJnw5wbbq/77af0FQWkvHZW4CggqzXat22k5hCsfvGm2LogZ8d7iL0TLwkwGIZ347/WBX8XOH3iq2CvoNBs16HUaLD8iYmOFNt2oWcnMwCPzMVNnxpsHzsI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200702; c=relaxed/simple;
	bh=8+fwQ317YHkrhYzi3WUxSNFUUpRfQiujntb8fx4tssw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2VK8O0mOHl4lKQSHwsHa0HqQJIFvYIAGZZ+lP+CmivY7m0cu0mYbWkjwnCST4MDW02mI4hmCKBClDDsm0er4fuOcdOokl6nFFZgBYFvTrssxt87Opa/wp7MAf7UTMys18ZKVlTiruoIN2Z5TC6RYWC0gCZJhd2qZgDg6gcdFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=auGFu3C0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEb9SS019401;
	Tue, 22 Jul 2025 16:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOaSdR+sG1OJMnVV76/qMDR601xje3mziwmY6uEY24A=; b=auGFu3C0xFdSdJ5X
	CijNWPqukQzyxZoDHSrUma1wMI+U71ZUdmcZM1DNa4FNypl58rIrPeAI5ynYDPlc
	2aqv7ZTtftV8baapq/zkIS7g7Fggdxklwubm/lWMIpkMad4QYtA853JiALLb4a+7
	HbMgaY4t/MuiuhAX/jVqmfu1N1T1l5gzDwmjIb1UuTLjqygiplJI+ZqllS4tqMcV
	prXHPGiliLQ4EqqM85LcTcfu7hdCDIBrE9FJ/xizRYxxwo8do3aWsU5orppnbwHs
	pP6DCSAyfWzLBNA//63sFKwhpZWZIDjqeeEeAiC3IftOpuOq2qO4jDDWeasmKjmq
	qF11dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na0gvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56MGBSsw003872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:28 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 09:11:24 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit properties to UFS
Date: Tue, 22 Jul 2025 21:41:02 +0530
Message-ID: <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lCrSiqw2Z-VOrVFXXXmEsp9ilU9P8sIX
X-Proofpoint-ORIG-GUID: lCrSiqw2Z-VOrVFXXXmEsp9ilU9P8sIX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNCBTYWx0ZWRfX/8QM5fIVdwsD
 mn2MoWpHGvMNlPk+5m0K6r14S6YmbMVzRG0BVGq6P81932uuMAmnZXzdRtffwdJXD/CjkRiIe/P
 D6RUg5YlPMtr03gIgkfUbo5IZPNFUYzBCwvHl5goOn4sR17kzO24sohkquWi9IhL7ZrstQ305RE
 6T3PsP/gT9symL6bNMQWaCsmqukO8W3PQ69lFnu4rAT7uLSwvNbhW6Qs4tdGKYfMynHNNuvOBOz
 M39o6K8nUyPyRVDMHDf72vt+CwGuEyCeWhs2MekThTembUylQNr2apdDBP3NqRecg+f65jPHTgO
 OH3FpGmlnnf18xEHbHsjJ4l9DSaZA1EKllQuFqgPgxeqS+TZM3Ntou+cFk5dVLThlFFJsCbTfKV
 qMAJuGWukANqEBK3MVHHjaKAKQwZe37aSeKx0ubIKC/eiHxGe9rUGLkvXraO7zSe63gcdXne
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fb831 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=neGoHJKfWSazPTLmwxIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220134

Add optional limit-hs-gear and limit-rate properties to the UFS node to
support automotive use cases that require limiting the maximum Tx/Rx HS
gear and rate due to hardware constraints.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b5494bcf5cff..87e8b60b3b2d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2082,6 +2082,9 @@ ufs_mem_hc: ufshc@1d84000 {
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
 
+			limit-hs-gear = <3>;
+			limit-rate = <1>;
+
 			iommus = <&apps_smmu 0x300 0>;
 
 			clock-names =
-- 
2.50.1


