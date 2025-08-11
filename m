Return-Path: <linux-arm-msm+bounces-68378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03287B20C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9E03B5C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C01325D558;
	Mon, 11 Aug 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfWDhrSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D5253B64;
	Mon, 11 Aug 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922749; cv=none; b=p36LIVwwLKcIFiyYzNH7XK8U5pStCyDrDGYVXqpJFSMCm940CtcMsNQRLZJFaFb5yHnIGX8HPOC2rbGySDCmn+CHbBMy9S6W7GP3NAkQ/BIFTw3elJdGzVaRJjZgT5TITilalTrMUY8kgV3sodjTUwKZshW8nn2olGVc7gqcZVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922749; c=relaxed/simple;
	bh=DjIOVZwbQQEYCg9XRFShNKjFxGGaFBT81u2+Ac/mlx4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twZFgtTqZsWMXojBegPHvbaWhVIGFL8zxEwXJHS2vDHfLReR69stpt7R+Lcpb+s3w7g7sMlaSNGls9OhzFmOS0Hv/jIm7sYTZmh29rszPPfm1L5mklxkbhb0zmq9+v31ggXx6Yz7Y2gtG1LgByfdqlsrASnauKG/bW//sjs4Ykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfWDhrSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BBJJjG008272;
	Mon, 11 Aug 2025 14:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LHBRWqUk9MxQQAUVDOfqgFGBN7Uht00efOoxvzo68TM=; b=LfWDhrSLlwQUQz5p
	H3+EeobnwKYbOWRjhhe85tghbzeg+19ZTWRfOlFo+uL0Cn2QLRrs26Q0SQvkYHIO
	d9G5PfvgG75oKIAVqSwTaCfJTJNfrtU5kqt7GUO9LCsCkWX8gZrAZGGgX+isNA1P
	U3CUhZ1eH9XZrdBifsXMEEMdIi1xfBW61GkMEw0wlI7RV57jsU18JWfG0wVuGOn+
	qCgf27TBmXV+m50xJFOK0kJbwadgvBs2FzPsIkToceec/zbgUcIJ4jmIenMBBjMZ
	+xb/d5P3gE7TCJDn9VyVcdqQhyTnh4sDSLsMjKJm3NocPi/ErvaQM74t07g3fChK
	kdKR8g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjgj3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BEWDEn002477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:13 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 07:32:08 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/4] arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller
Date: Mon, 11 Aug 2025 20:01:38 +0530
Message-ID: <20250811143139.16422-4-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX17n4bkkgmYRo
 dzRwq0HfyfpfuOQCGxgPBaXUYhhWgCohd3o/zaQikQyUMnNuAiXa8SH3ObY0eKD5Z4hDY7X3WoZ
 rma0XPGjTGHth/xxVSA0/JmyccEYQ2iGckLZ/fgG5QnigLrp0cR5GrIZJTb58jmf248UOKFAd99
 jFYeKZM/zr+0EVnI8uReqPjfCODSOm7UILyh5ypp9qOHY57n7Cqx1Fl+jTCPklxrodeESn1Kuqq
 oj4jA+Qeh7CZO63D/yKc88PIpFS1lIPSeSzK6aFdCkalqJE87Xtnq85g0j+27IXE8zgOuaNfCbB
 RmDRkPaIvYQJN/WqIZcWBEjGKqHJteohIEvYvAM8mjhjbcMT3iVzzfenfLix4s5/W6nrSSXwmBO
 UVRK53i5
X-Proofpoint-GUID: 9ipMiuxtzrlebRlzgKqVtF7uhf39w5sK
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=6899feee cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=lw8srnNUBVFv889I-LYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9ipMiuxtzrlebRlzgKqVtF7uhf39w5sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

From: Palash Kambar <quic_pkambar@quicinc.com>

Enable Multi-Circular Queue (MCQ) support for the UFS host controller
on the Qualcomm SM8750 platform by updating the device tree node. This
includes adding new register region for MCQ and specifying the MSI parent
required for MCQ operation.

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 4643705021c6..3cd701ca4020 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3329,7 +3329,10 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x1da0000  0x0 0x2000>;
+			reg-names = "ufs_mem",
+				    "mcq";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -3363,11 +3366,12 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 					     "cpu-ufs";
 
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
 			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x60 0>;
 			dma-coherent;
-
+			msi-parent = <&gic_its 0x60>;
 			lanes-per-direction = <2>;
 
 			phys = <&ufs_mem_phy>;
-- 
2.50.1


