Return-Path: <linux-arm-msm+bounces-49745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 853FEA4874E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 19:08:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E15B1881BAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7661EB5DA;
	Thu, 27 Feb 2025 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g004y6jy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C931199239;
	Thu, 27 Feb 2025 18:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679720; cv=none; b=j2SOXNV0E5ahXG5r6kOTMfd+6qNTkb/ppjUn6dMJ7DaCIlEcTOKAL+FwAnsABzhwskkkkJ3IVDv4zWURKEkyr8f+wQdkZ64HHx0vi9lvKU782azUZJ0TJiLPnzw8PSSKT0CiOt+rDuM6ojWqo+5VUxlQiV0Yz9dnxAhja9opJbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679720; c=relaxed/simple;
	bh=sWYq2BLlmh3rHjBO+mBEwtyLYmiYWvSIjBSTdkR7nMk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bB/TiaZLbgTl1ToTTkwkYADaCC/F13Hjp5YcXtJggZM164Ep/cmwsUWrCOssLBOvtcxc5wNQbcDF4qCW+FRaPZNpkF8L+4VeZR4NP1bZnfakcDhvCI0MEC+ceK9o8x/oYj0Q/JFFDMyfFXywowQszZPQzeWRJ828jVFBOTFcg2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g004y6jy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R9oSU6005917;
	Thu, 27 Feb 2025 18:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qSr1jn029U/PH0+JcwV5hq
	ViSKHamKOwz8L1wWw3xEM=; b=g004y6jyjLCTMiu8BlWQaCYelIXe8lr2gq+by/
	KPxEhOMLGNkdUlyXWRFsQ7vuYCgIGBOe75gwqCh8jOjru/fBlnhC2iXFLLz/30sH
	gOd74FtyRjKZuyyEioQc0iR29QZ+P2J/u32B6mQx+euOmaujieMAPp/JBBot4OXP
	l2DakSNKcSYYST3iDvoUeEe9IRtrLdJ4mIzgIss5FHDrNgdbfY68/N2TzAdUwYBR
	Ii8kJiSlK3ln7hEwDWc7F0xHbL/InyojYgzkevELBA/+ZSPO5qKxL7btyYUgCofk
	3+eootrk8CxOmPuYv0r3ScOWVaQQ8Ob+jmAmxIaMlTnGqBQw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6k760-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 18:08:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51RI8Z8l018601
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 18:08:35 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Feb 2025 10:08:32 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_yrangana@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Date: Thu, 27 Feb 2025 23:38:16 +0530
Message-ID: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: 75hC6mdmmP8HT9xUmrkhh93gxEFabo72
X-Proofpoint-ORIG-GUID: 75hC6mdmmP8HT9xUmrkhh93gxEFabo72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=725 phishscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502270134

The initial QCE node change is reverted by the following patch 
https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
because of the build warning,

  sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
    ...
    'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']

Add the QCE node back that fix the warnings.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 23049cc58896..b0d77b109305 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2418,6 +2418,18 @@ cryptobam: dma-controller@1dc4000 {
 				 <&apps_smmu 0x481 0x00>;
 		};
 
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sa8775p-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0
+					 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		stm: stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x4002000 0x0 0x1000>,
-- 
2.34.1


