Return-Path: <linux-arm-msm+bounces-49746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFE1A48752
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 19:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9360C1888F57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 18:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510201F5840;
	Thu, 27 Feb 2025 18:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hS7Q/Sde"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39721F5820;
	Thu, 27 Feb 2025 18:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679723; cv=none; b=b4lM/cmviHr4AhgsZ1Qv3JqvSE3HJCxZTtVsxh+EWPa2v3ewu8Ev+95nXA4oQcpMbGsVHlPaoZWceM2VBx4CRlfEl+fXPnvwQJV42m469asVou3rkKQLL2btCUEXGQTSOQBvNcG4DdiI/htkhbTJAeFpLP4JOCL4qdfeR5WNmr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679723; c=relaxed/simple;
	bh=+I/dSbrUpqOAppv7/MXkR0pNAsBP5MSDsTu8kHnOy90=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3yRfxE3Kc8HHSo1hbtOQezXkheWbemVu/9QG8bbB2u82WnrRohfGTBRvoOKXTZsrtTD/vzOsNuhMeG8rcrGY2ASHHp7i/zkX0TASG4NQ5nRcpiskHBY5rBMMGX1skzOivvphGUCnadKHDNOdkL1wBymcf1TaOoY9JxsBazBNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hS7Q/Sde; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RAmBuI003226;
	Thu, 27 Feb 2025 18:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XdH84Qqakaf3iBoO2rpQ/Lqww+8dJ0ne6LCr24cmOI=; b=hS7Q/SdetOvzVyTe
	oI6LYpatEScasP4ML+Rv2gTUAotvGxaFHjkl2TbZnUaJyNt1Z0pX7M7YTsT0AiHZ
	3+a+HS0I5jGRS3Q5fcyL1mHK5mwNufmg+0W8i1CNCOYgpehb70hjiYZVdcb4nwEf
	M7zfUyOxCR1LMZEeDTunrXErDcBWz7nXk6DaX543iRCRGExNfjeAptrIeDg8H5mG
	2QSe5YqK2H3z2hfmnvqCyW2scl15CNZEZ2p8Gj5TYvS/0Q2o078u/JvuoG6EYMMm
	DFwZBsR84xaCrXz7QoBjbB6w0I0Xb0I57CCxiOMH1GbASKno5a8+ieAG3u478WWn
	zhftzA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7haeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 18:08:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RI8cEa028124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 18:08:38 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 10:08:35 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_yrangana@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300: add QCrypto node
Date: Thu, 27 Feb 2025 23:38:17 +0530
Message-ID: <20250227180817.3386795-2-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-ORIG-GUID: szqvIjlDFl0pOCOBgiUJmvo-4t5tWC9u
X-Proofpoint-GUID: szqvIjlDFl0pOCOBgiUJmvo-4t5tWC9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=845
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270134

The initial QCE node change is reverted by the following patch
https://lore.kernel.org/all/20250128115333.95021-2-krzysztof.kozlowski@linaro.org/
because of the build warning,

  qcs8300-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
    ...
    'qcom,qcs8300-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']

1. ICE crypto node is not sorted and fix to sort it.
2. Add the QCE node back that fix the above warning.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 13b1121cdf17..0ee0539a22e8 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -785,6 +785,13 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,qcs8300-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x01d88000 0x0 0x18000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;
@@ -798,11 +805,16 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x00>;
 		};
 
-		ice: crypto@1d88000 {
-			compatible = "qcom,qcs8300-inline-crypto-engine",
-				     "qcom,inline-crypto-engine";
-			reg = <0x0 0x01d88000 0x0 0x18000>;
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,qcs8300-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


