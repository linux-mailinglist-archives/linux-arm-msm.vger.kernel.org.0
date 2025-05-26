Return-Path: <linux-arm-msm+bounces-59372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D385AC38FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0B427A325B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 829D51DDC08;
	Mon, 26 May 2025 05:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AQgQMdUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99691DDA2D;
	Mon, 26 May 2025 05:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236949; cv=none; b=CbybhIiUtQp2HhygoldcDrksODY0LDVeH0zzwzpyg3BzFEU4tusgq4eN4mgbLPBPnXULGqMiOGZJ8PSUy5Ck0KEUJ68Yg20VWgWYstO6XslmBD4XPhNWuQWrdjiDsAIK3JK+PDQXIz6nDUGfk5HkVbRPn2g7sD4dPGhOs2rDYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236949; c=relaxed/simple;
	bh=oXtgh3aypnt35kE/uAWpWA2Ii3T4347MtEn2Fja+J3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JM3gGX/fB3hwCpsF7F1RJFWndHeVuyySaD7i3m2aJi7kZvjGMrAr6l4PHGmKcOGCGUWlvWHbaR/zAh80QnMFwW1/Q7ph78i/OWMVhPmBkkyQQfC3Xop1yB4a7nWJdDIKKgsaLCp5tYTi8q4dqwBmqfaL9EM4GPz+Hl/BxgIydU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AQgQMdUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNQMgG025624;
	Mon, 26 May 2025 05:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/XnBXinwLaKCAhLcrvhrOPLv/pEXE03jY7HxoB8TqY=; b=AQgQMdUmCAbfeT6j
	j1FeQ4KCQ6oMdR4ItFZFNdIIF9ZwwtaNAg2hbfl+eyi6eJCG+KMO5M8NQFM0CueO
	f9aWDRPCI5OD3r8rRPO7+95OtjolDPZQ331xAG3QC2vAZy8YTwJPePhB6E/WI3r6
	13AgBtx6LISTC8bJxEH98KeyGqgEqj5xCx197yXLRyB3euap5yjGVW3+KjNNildC
	/+AJTFSOxhnb/AeJM/9L8YvFS/4CT6Ogl80aUPRjt0FTy6u09hNhKIdOgD+i88yx
	Ndh8R0ExwxVhNkfIIvAtaVWIgAoalCvRtGsbwhXpgmSz4oK/2BIpoZNbuu9tH2h7
	yhvlDg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u7dc306v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:24 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MNIh031030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:23 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:17 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:50 +0800
Subject: [PATCH v4 4/6] arm64: dts: qcom: qcs615: Add IMEM and PIL info
 region
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-4-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=1324;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=oXtgh3aypnt35kE/uAWpWA2Ii3T4347MtEn2Fja+J3c=;
 b=njw6TLBsX2Se9kW5lJ3zNuyaXZL4ghd0Khe2UQ15yM4QNNNoxoyfEFXiMQ/wAH+hfMAMFNb8F
 LPjYdPiU9iIBzjGT3unqVbDYU2VN9fbsEMr7R40XPOSQyotPxHz3Vjw
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Ilme4Q9BDcBbCWNGkmaDg4HI_04_f1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfXxYucb8cA0sS2
 GLxSIZFou9QicIHoeGOIYOIoHXg10vrwk2wweaEEqun89ykGFQ+6zTCxti/eXsu1WyVlefO1brG
 k2pkTYFDsudc9TTijCbvDpR1FZrqq8R56efC5m8HgUMyVCK+HZRKRMKVfmZT105YlfvW4Ojkseh
 qV3k4SZnCA2aX7YwnbRbTqqTTgheVI3zu4PtT9NDRBd6ZabclYYept9i+pZsu4cVTV5zdL4AGN2
 FiL2uuJ7RPxTrHbe/E9q9QNpSXbDqTTNE+K+1FKVu0AIX0MXIBe9+9aMAi11ceNIbVPShIq48Z8
 tQkUrCX9NmbZ2uSQ0uGveIKTxePwAX62h6xtlLAnCe4CEWMYeiduHdtpqbEyg/MVBOIFDHPqu8/
 BIP1awgVGhPJuSU7bvVxSQMP8nCo5SRswUFeXNHGa092f+MYPIPSjg5/SxbSzJmEtkEfc6hD
X-Proofpoint-ORIG-GUID: 5Ilme4Q9BDcBbCWNGkmaDg4HI_04_f1w
X-Authority-Analysis: v=2.4 cv=Mq5S63ae c=1 sm=1 tr=0 ts=6833fa90 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=7w6Y4NPPTjXLb_l0MjYA:9 a=BUlihzhsjqwocDGc:21
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=691
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260042

Add a simple-mfd representing IMEM on QCS615 and define the PIL
relocation info region as its child. The PIL region in IMEM is used to
communicate load addresses of remoteproc to post mortem debug tools, so
that these tools can collect ramdumps.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 3f1f674884e5e9b3b01ec75bcea11d9c2ea6355c..9220d6727136b34fa42b5eeb3eb00938d21a5adf 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3289,6 +3289,20 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		sram@14680000 {
+			compatible = "qcom,qcs615-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@2a94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x2a94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,qcs615-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x80000>;

-- 
2.34.1


