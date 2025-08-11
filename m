Return-Path: <linux-arm-msm+bounces-68377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 374EBB20C11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AADF3ACE0F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28182D3759;
	Mon, 11 Aug 2025 14:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cpIADKLU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B312561B9;
	Mon, 11 Aug 2025 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922742; cv=none; b=KJ/B6Sp1miGTZEn3p6BqOndMF/EkHrGYL14kdgzFdxpEaDqhuUZY82DqtBj/s8TQD6Td5E1pri6gjGv0j7go89mQq26j335qMzb2qkl0wr6r7R6sA+fwVvShfpt5kZJhn+0pex0oogjSb0Nt+zadRlwjBW/BWxLl/Qnnyb+qJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922742; c=relaxed/simple;
	bh=V2MITJkAWgVChAakqqHHWURqebOYZDjWFsXyQp74D78=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HRBt+znNMCaS14xPy0hM5VqA2/ABSRViJe/SexUIzyEUCMmEb7rX0m9rw/fqPWLtsF3xD47Ko2cZFKxE8KeqRobx0u9mocdf12rdcI2u5C5C2dEb8exCQzJ72k0S7Tg2ospRCgjMVFI5tWUFEXs4R6ALfnAq44GFNY0yG/UrCbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cpIADKLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGpTY024514;
	Mon, 11 Aug 2025 14:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHuLfx+SzAPMH1Rcg6Ces3pJhMZfCmoX8Tp997ksbkg=; b=cpIADKLUwFy58/sV
	U3E0jCsvlHC26ltfyYpX4VdOWztf1BmQlT6zKo0SxsUOiN98ik5UZl/gnjC8Wrry
	5+pQyQ4ZwjYDgfAxblGkGGGKuuO95GPRGBxeWyi7NAir6POuMmOfANhUuVCmKsPA
	7OLyWQkXHA6zzwT+GnDCxtBxdL0/e975lUHW2iuG8cfMHV0U/bE98e5vNsWz1vHR
	LRVpiYXfqCo9+la9lBxc2Lza/ifv/f3cbDtxG/5eBXc+2dmI/t7D1kDsCSg0Kc7X
	VodC/itU6jgI/YSViQC+7+SGPMikpDvSTWK/GZCDXYKG0rjegyPEtRkBuAZVBmHu
	Um1dqg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem48sp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BEW860027365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:08 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 07:32:03 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/4] arm64: dts: qcom: sm8650: Enable MCQ support for UFS controller
Date: Mon, 11 Aug 2025 20:01:37 +0530
Message-ID: <20250811143139.16422-3-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-GUID: BhB2THmpboqQIdOtTmW6yM47_xQTN96x
X-Proofpoint-ORIG-GUID: BhB2THmpboqQIdOtTmW6yM47_xQTN96x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX7Iw/Fbo8Qnlx
 Wo7n1iLDaENfhEtXAleeFBjz4oRCmeNmCTI3bv3H79ez4CXflrKVo1DAq2ZigZ12SsDygOvm8U7
 A9O1LdQGDQQ0aFjvy3dl4AVAvIduGKyp1fSqNIITw42q9C8M4iUOLB5p52qRAjGqJyQLuweZ5Zi
 iYJqFjkRL1OmfD21hC24K7uC371Eg0x4qdl1bDFXntq/5wqNUthzPi07qFNwjfYEH3s06NnHxne
 SPV3Qhy2ZfEt3pvZLbCZ+iwObDf/NIOJQvo3+CvBg9sAM8/xjOWhG89/YyKossbaxCl+eXxgTJ/
 sBdl6prqz3F1dVNqhp8Uhs+bDbLTudq9bsUODYxs3mq528wXA9ZoXYW25NWo1mUgbQaRtH/l+fD
 F/CZ2ajY
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899fee9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=GbTRQnthUMyhj2PjmLAA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068

Enable Multi-Circular Queue (MCQ) support for the UFS host controller
on the Qualcomm SM8650 platform by updating the device tree node. This
includes adding new register region for MCQ and specifying the MSI parent
required for MCQ operation.

Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index e14d3d778b71..1885d88abc3a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3982,7 +3982,10 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0 0x01d84000 0 0x3000>;
+			reg = <0 0x01d84000 0 0x3000>,
+			      <0 0x1da0000 0 0x15000>;
+			reg-names = "ufs_mem",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
 
@@ -4020,6 +4023,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x60 0>;
 
+			msi-parent = <&gic_its 0x60>;
+
 			lanes-per-direction = <2>;
 			qcom,ice = <&ice>;
 
-- 
2.50.1


