Return-Path: <linux-arm-msm+bounces-37732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14B9C6907
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 07:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8232D284E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 06:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FCA171E6E;
	Wed, 13 Nov 2024 06:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lCp7kqat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C8F17085A;
	Wed, 13 Nov 2024 06:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731477848; cv=none; b=CQ7UvByBlm02yviSzXS9/kmGEV3IWMG17lwQl7xqIoDjKYSLa6nvKWc9F+xQpHC64KO/l0Fox55C5Dkb+tAstJmxExG6jgYkzm6fn5Ms3AZGNB9cd2/43HNfNaoTzTyJATYGNkbXuCE5QhiHWRPKJluC0NXWwc3JFiBgIeu/IdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731477848; c=relaxed/simple;
	bh=EgpxNRyGutweolrHWQl/DCfjzt3xXnVkjh/9skErv2o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7znwLYM5KPC23wwd2mtufI21HV9VA0hntqdnumt03Llh3rAEtsSBkI9OuTj8f+yvHEMz2cNePm58+ZxNgo94TrVrxvwZtCQguL+y1CbA9fnAAvkwUwlzNeA62wjg15U6P8eSQBnw77peARTEjLZRwdaLCbS0WertZViJfL0PCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lCp7kqat; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRUZ9019975;
	Wed, 13 Nov 2024 05:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVXpUI3My5NkCFqipv8urDFAaqNDNVrSksHC7nfJL58=; b=lCp7kqatgiaTJn1O
	kyyNzeeUdgTvOH19fJ2R7Ql9DqGsVby3VzbnkierqGbJKYlPv+FWzC7qElTs+8lP
	o4sqnYD7md/FOTzwK9taI6iQgbVeAejW28e7YB7brLlgi21/y8OkgkPN/VSBnMe/
	Gz/xKbTc6HEeuGZ+nH0XKP2Cf3/8N80LIw0jjXtXpRT0zu/6yZGNZMAP2g8C2JGw
	QM5A4uPbhMCBitFKI3LTrt0PLllZjo999Jfm1sBHB3m6xgtsvtXcgsWWTwlMmmT3
	rG0Xb5AKZ5o/TcyS7Yb64unYoOlsxhWJNl9zr964CrmvpqliMrXixlNwp7D+DzVK
	UMhgvQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uc60eb9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:58:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD5wtQg011579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 05:58:55 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 21:58:51 -0800
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
CC: <linux-crypto@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>
Subject: [PATCH 2/2] arm64: dts: qcom: qcs8300: add QCrypto nodes
Date: Wed, 13 Nov 2024 11:28:30 +0530
Message-ID: <20241113055830.2918347-3-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113055830.2918347-1-quic_yrangana@quicinc.com>
References: <20241113055830.2918347-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: llPjb9lL41Oki_lb1y3hj-XZGP5SwdeA
X-Proofpoint-ORIG-GUID: llPjb9lL41Oki_lb1y3hj-XZGP5SwdeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 mlxlogscore=804 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130051

Add the QCE and Crypto BAM DMA nodes.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..d7007e175c15 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -710,6 +710,30 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		cryptobam: dma-controller@1dc4000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01dc4000 0x0 0x28000>;
+			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			num-channels = <20>;
+			qcom,num-ees = <4>;
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+		};
+
+		crypto: crypto@1dfa000 {
+			compatible = "qcom,qcs8300-qce", "qcom,qce";
+			reg = <0x0 0x01dfa000 0x0 0x6000>;
+			dmas = <&cryptobam 4>, <&cryptobam 5>;
+			dma-names = "rx", "tx";
+			iommus = <&apps_smmu 0x480 0x00>,
+				 <&apps_smmu 0x481 0x00>;
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.34.1


