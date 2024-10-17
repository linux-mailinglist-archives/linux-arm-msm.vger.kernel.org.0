Return-Path: <linux-arm-msm+bounces-34754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341999A2566
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE5F82833E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B0A1DE8A3;
	Thu, 17 Oct 2024 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OMdPQdI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B81DE4F3;
	Thu, 17 Oct 2024 14:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176344; cv=none; b=PletNGE1coj2aOPpTaNF1b6tv7xO8z4emMa7eQ/O3h/hq1g6/Jbj26J0Dvk2roR8C/t1x5a3keFG7MAqiwF8Ny68bwRl8Ff+bD/jNs9p7pRpH14whXWWCPRouqKOFiGO15YTTuuzEN07zsKfwIM7SqVD8xtG8J7t2sWNLAaEhTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176344; c=relaxed/simple;
	bh=s92it2O7+5WJhLeZzXnM2EdMXeZfSPLwLL/DBJgP7jI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLuzDfpe/3pLTMiup5P9wfkxPkCBdkEZajk4tlbty2FEE5qf7sMbaOzj5SkNDTGUK6l2IkPNoyEFxLm38fBZTby88EBp1XNDfGBGwL6K5JuHbo0iCnnuujluH5yehNd46yfpSE6jS90fO+9e7Y8vqEnEtgDsyfQhnqfQyWITk4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OMdPQdI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H8LRGi001607;
	Thu, 17 Oct 2024 14:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8EOz2Bh7xGk7ZHHqx317E1gqtO3TDQuawGdzyNvI7MA=; b=OMdPQdI5RsVWsNgR
	ZMHbT8JDG047WzjonQWFCItLBSkgQaokTQu7D6yMJgALOW84NUNh68hAMP1T63UU
	H+7j32+3lZQTTr/4/TaIY1HjsNPZjtZkfA6Vwa/1pxBcs50dAvpNt6FszkEHEcoS
	ePuY6MZ+Gh2JZnBwd8ixcO3N8ZKAx5mEbNN3/ZJYsEo6iQwGVzthWw1xveyzSbxi
	uYXUHgnWvQ7OC43Wa/g9evH4gsUAoD2WBmXAc0PgwzUtNmHsNzrwsOr439to2vYM
	B5MUP7Qavgv5xQLTuzcvPJvVfOztTx5K3g64GkQb8tOYdJ38pMPB2+9/OEpB7CYh
	CxXqKw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5avnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 14:45:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HEjS5D008871
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 14:45:28 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 07:45:23 -0700
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
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
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>, <quic_sravank@quicinc.com>
Subject: [PATCH V1 2/2] arm64: dts: qcom: sa8775p: add QCrypto nodes
Date: Thu, 17 Oct 2024 20:15:00 +0530
Message-ID: <20241017144500.3968797-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017144500.3968797-1-quic_yrangana@quicinc.com>
References: <20241017144500.3968797-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: SBpJQFZiyrwrFyV57yn32qaSD1hWDPIE
X-Proofpoint-ORIG-GUID: SBpJQFZiyrwrFyV57yn32qaSD1hWDPIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=908
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170101

Add the QCE and Crypto BAM DMA nodes.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e8dbc8d820a6..c1c53f81a555 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1912,6 +1912,28 @@ ice: crypto@1d88000 {
 			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,sa8775p-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		stm: stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x4002000 0x0 0x1000>,
-- 
2.34.1


