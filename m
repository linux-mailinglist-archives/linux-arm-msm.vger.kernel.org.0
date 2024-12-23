Return-Path: <linux-arm-msm+bounces-43118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B939FAD7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D03D1884B92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D019D8A9;
	Mon, 23 Dec 2024 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uf3Wo8Gb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9B19D074;
	Mon, 23 Dec 2024 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734952200; cv=none; b=VTTInXuGlnvWpdBojd2vI5rNeSsr7jtQcZf6xJD0Vijq1tn0Fe+8IOjJe9Uwscvb6oMJKpiKsvWsLJIJ55A9PvHYCzLq/OmTAqsJTlMrV8hgQqINQjmGpvhio8iLi+bOEzBQpklO3Y1RAqjQvv+T/zQH8uZFEZ6z5zkMNvOwWAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734952200; c=relaxed/simple;
	bh=7nEoARmPuJcql7CnM6XAABuuVo9Xoq69Mry3K40LSDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B8athOkC20Z34d+Z0KBWA5yosQOqbQ10Ec5+clrEs+LPtmp437LfK04cnxWaKTI4++FNm34RwEm4E36P0WhoWObPhfvovpzy9782YipJQ2dA27rspHDAWWBSZ7P1AJOUG0c7jb/ZQ94wQV4oHUEg8g9omk0ZCde4SPegpHtgKFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uf3Wo8Gb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN9TONY014901;
	Mon, 23 Dec 2024 11:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p6xTc6h4v548aS3R/mRUjG
	zkTEj66fmYVZTPJiRhfww=; b=Uf3Wo8GbWajqmHgv3ScX/1mh5nXFtxDhVT76S7
	3AsqczIm+NfVnWMJ81r/pe32RY7bQEe8X25Vf1reTkdIk5hxzykDHXRI3fQwDtyy
	MCOo0AYjVGd3eAdeQF/Vc5SqR/heF90mIWZJCLdcrMa6pFI7aQBvoVXjqe22/a2H
	sYuqj/UZrGRnAYcVCP9JEqDjKobXyxTm0F9TKXu94sAmwiqon4gwN+krFUl58dI0
	JFzCnUhJpFNbW1RJrPbBX1RK5yW5iJ3AaHv6FTcxscuVSbkKbPR4sCTj0qqY6HtB
	vi+d3U0SlF2NiSWSj6SE+NvtuvV4wkQqO3BPuzf7BBtkJRRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43nnrsrsm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 11:09:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BNB9sg2003707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 11:09:54 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Dec 2024 03:09:50 -0800
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_yrangana@quicinc.com>
Subject: [PATCH v3] arm64: dts: qcom: qcs8300: add QCrypto nodes
Date: Mon, 23 Dec 2024 16:39:36 +0530
Message-ID: <20241223110936.3428125-1-quic_yrangana@quicinc.com>
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
X-Proofpoint-GUID: ZWlhSuI9qILepqLwsM32P35z7-zJXQR7
X-Proofpoint-ORIG-GUID: ZWlhSuI9qILepqLwsM32P35z7-zJXQR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=706 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412230099

Add the QCE and Crypto BAM DMA nodes.

Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
---
Changes in v3:
 - Wrap the lengthy lines
 - Reduced the patch series as other patch is merged.
 - Link to v2: https://lore.kernel.org/all/20241125111923.2218374-3-quic_yrangana@quicinc.com/

Changes in v2:
 - Set the interconnect tag to QCOM_ICC_TAG_ALWAYS instead of passing 0(no TAG). 
 - Link to v1:  https://lore.kernel.org/all/20241113055830.2918347-1-quic_yrangana@quicinc.com/

---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 73abf2ef9c9f..30c1de1c4ad2 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -736,6 +736,31 @@ ufs_mem_phy: phy@1d87000 {
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
+			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "memory";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x20000>;
-- 
2.34.1


