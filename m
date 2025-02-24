Return-Path: <linux-arm-msm+bounces-49144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E402BA41A52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9816C3BDE7E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACDF2505D5;
	Mon, 24 Feb 2025 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TBXBMCeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31462505C1;
	Mon, 24 Feb 2025 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391483; cv=none; b=oATgtwTLsAoUU4KfJ0pzo2Q+vaKY8sc3d+aDUqcbyv0JTo2oFH//dTiwSfYZ+rpVo3SjV4WKFqlSBY/UlYh7m0DHQp5pDdb71lfVQGMc39mxAPwP5IkpdnUmX0I7XeMBVXjJQUzT4rOGJd2+C3neFGBjDK5nHqFMmgB70q2GD8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391483; c=relaxed/simple;
	bh=mFunrZPgxc5g4pR+EJ2Jiatq4BCm1HE8m4IUBB7i918=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QvVYCejqNmLoT2sy6swTR1u8fqaJdwWh8+Fiag5r5kmIqUGQG72/6d66B9hSNjzeudOkyK1ArMJygEANwpjVHF/59H9b36aM5VmQ8IYKIk3sgxe6S3nhbcMmCvhRpMVyK0c+HSw+znfMWFnPIn4aq+IEP3a21yBdMavHCgzblDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TBXBMCeq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OA2Ae9013284;
	Mon, 24 Feb 2025 10:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y9nnaaFTCDpQI4m++vXKSQKo3MkoGZ3T04oZLQIxHj8=; b=TBXBMCeqtZWBme0q
	32EqCbIRv8uipbKtMf8DOFjqNiH2ft+WdqJoFlrl2hr2RFqFMzc3CfaqeMuX1Qfo
	MwUmkx3xmvVn/OtyCsN6P706HVr0MNEwx4NkTzCpMW5JN7wugKWNA0yvd99qx4ft
	Ov+A3MH6DN2m/V2bUQfUXT0WgpJFJFLQySnztHeaz8Dv5RtD0bw5g86Mawoxvr9a
	YTg+EY0nanmvn9kgCJsrgsKNpXKXwLiEoPC2v8Sh9UZtJH87a80BQjWgk4DP97wl
	61SFMwvi2trKcOA8Ev+nA5qJy2bKo7KioMrO2/+QTZv6wf/23RNHDLwHbgV2WOMj
	Iq+O9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6mkme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:35 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OA4XVM020693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:33 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 02:04:29 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Mon, 24 Feb 2025 15:34:11 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: qcs615: add QCrypto nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-enable-qce-for-qcs615-v1-2-e7c665347eef@quicinc.com>
References: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
In-Reply-To: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S0yf1r-Ou6fAS3Eo0epXLAB6KUrRzOzR
X-Proofpoint-GUID: S0yf1r-Ou6fAS3Eo0epXLAB6KUrRzOzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=688 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240073

Add the QCE and Crypto BAM DMA nodes.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4abfad474ea62dea13d05eb874530947e1e8d3e..25e98d20ec1d941f0b45cc3d94f298065c9a5566 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1114,6 +1114,31 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x24000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <16>;
+			qcom,num-ees = <4>;
+			iommus = <&apps_smmu 0x0104 0x0011>,
+				 <&apps_smmu 0x0114 0x0011>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,qcs615-qce", "qcom,sm8150-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x0104 0x0011>,
+				 <&apps_smmu 0x0114 0x0011>;
+			interconnects = <&aggre1_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;

-- 
2.34.1


