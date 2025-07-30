Return-Path: <linux-arm-msm+bounces-67067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D00B15A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 335B87AA35B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D4A288CB7;
	Wed, 30 Jul 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ipXgmDEz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCDC25DB1A;
	Wed, 30 Jul 2025 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863801; cv=none; b=gD6xK5XPEtgdOW7G2Qal19aj4iOQiPMlsxOMXsrre+ko/MItwQIxNoztn+OwNfqEhbx3J7cj+Ng2gTHtJd8X34r/aBAkMRG/oTgF/+nTUBcFMGCWV3/MYYov4alu1fqaa8G/dDD8HQ1aMoVzw16Vxs1M3AQwdEQUtY5pF7c1JXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863801; c=relaxed/simple;
	bh=l9ra1GKKdn6FbpirqvAnIMKAjTCuGHCIgwqsyoKF8bc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fj2reXqQf9HzNZms0Ftshr72nis2/LsskbwOexXGntbjFhz5aY04BI7NZeBNPrZ5VDFkxbwlVxE8mZRvoU+7mv2VkG9p8FIifNJ5UjjnXuSZaGKHOmoiRIrVltk9U9pIaDyg895Zs4DEK6xQdToNk3edRZKJwzrBcJx0zGaOC2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ipXgmDEz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U5Z2dE018853;
	Wed, 30 Jul 2025 08:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kywzoxGdItysJuKRdt2PipJB0NrYcZcf7+7OciUQHXE=; b=ipXgmDEzYRx1BzXt
	WCSiroe7w8WBJW22xmyUABXOQaZfMTSmSpUVqD0gKaiooFX6I1yKo8kywag0iRj5
	hkaV3X7aMJsrNPaWhPu/jQj0S3E4+5vL6Z/mLUHOfWH+F4z3hU80bgq77uNMwKMg
	NhtJJ8YU9K7Z3174hOyHYT5bPNoFAeIDy1nJjBCEWocGndFOp/3HMWBdhp5YRShw
	w7zic+khohbo5aZq7EHREf1k46w+34rEI8U+i0Z623Jt5oJFZ4Hp4Au6/N2jShVa
	1jPLGdqWrkkRcn9Tz+zOWidRYsQY5aqEQcolrQe8p/5Tmv60snqBjOIoXhhdUL8Y
	HeotQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q8634hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:23:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U8N09b003151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:23:00 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 01:22:56 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller
Date: Wed, 30 Jul 2025 13:52:28 +0530
Message-ID: <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NyBTYWx0ZWRfX12V5ochnhlH6
 5nD4FVvYh4kRZ+WKgnuhv+QxVDhb6crL/t/etitQHKVEMKRYTQMPBnLrYJBHozHGbjPFJ2qxYhH
 aVjHn16Alta5nuzlJ2Nmlk93Ekzn0RHAwl4PdPMJ9pXQ42l7SAOVhda5JMOKcm6QZpuSpKs8XVv
 n523ZQHJcbz874UI4r8l+qbPPn3dfyFTpPDf/JP+5axjgDE3nIpn5mRP24Gx3+XB9DMyOPQZRLP
 YmposTOdpblz3pAg1WDWFMP5N8mZ83umJsfJHZi+JImoaS88q+H8dm4AzKBxZmCeXqBSv102Zkd
 KJ+hfpAHXhsRIZ7pdqbaizTJZrG88mmfGiNceyZfpWOy5ET1WlofFS9P+7OKAszBlWP+TU16pT4
 yJhRQaUbzt9TODv7fWHO3IPlSNdMhYs6uaAIxQfLpHTMbOovxQRNHi1ONLP12XpLcrDFXRKL
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=6889d665 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=YFqID79JUgxNR6UwwXUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: s31nA5Ix-elAvPW8FRBVK_h307gtTsLS
X-Proofpoint-GUID: s31nA5Ix-elAvPW8FRBVK_h307gtTsLS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=971 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300057

Enable Multi-Circular Queue (MCQ) support for the UFS host controller
on the Qualcomm SM8650 platform by updating the device tree node. This
includes adding new register regions and specifying the MSI parent
required for MCQ operation.

MCQ is a modern queuing model for UFS that improves performance and
scalability by allowing multiple hardware queues. 

Changes:
- Add reg entries for mcq_sqd and mcq_vs regions.
- Define reg-names for the new regions.
- Specify msi-parent for interrupt routing.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71..5d164fe511ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
+			reg = <0 0x01d84000 0 0x3000>,
+			      <0 0x01da5000 0 0x2000>,
+			      <0 0x01da4000 0 0x0010>;
+			reg-names = "ufs_mem",
+				    "mcq_sqd",
+				    "mcq_vs";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
 
@@ -4020,6 +4025,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x60 0>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 
-- 
2.50.1


