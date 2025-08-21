Return-Path: <linux-arm-msm+bounces-70145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080EB2F694
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E87D1CC787B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 11:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E2731AF17;
	Thu, 21 Aug 2025 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C16JoFy9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C431985A;
	Thu, 21 Aug 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755775551; cv=none; b=U3h9973dYhfvBuRdRthLukWDH9cDaCKpQIP8OaHdrP7k9tjPbOYGObA4PW0AHNE6vi6LZQRxIjJp8n95bx1l+v8fqkpYc1SVATz5xW7SgGyDXIWWH9g+SsW1V1R+IDUQZmM8y+hzJJu2kcjsIeHbQCBu/B64Zq/9FNOaIUIzTvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755775551; c=relaxed/simple;
	bh=DQI5PFOftteEpgUgGsM1ZTHGhuKliyoVKDfrACcNPWo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M94xbX34tzBPUGI/NlfkR6yA3Vbp3HBmW+uh0A05/c0bmJU4zNHSQkELC2CSVxxiub6w1b2YP2mZRk8bbR/SfUWMllN5Jf7SIxY8lIBr44inEiw2MBxIHzkt3/rZ/ZcCau9ZJ5py4JbXso2lp/mAIbLL9jeYO59BuI3f6lZpdvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C16JoFy9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bCFE015666;
	Thu, 21 Aug 2025 11:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XMdxPyMUKzLOCLIVG29pgB5DIDRNKXHxpZB0AYQFL0=; b=C16JoFy9Y0J5BsUo
	cSCDw9ntpx3R1/pzZxPs6ArHW9ZAoZnMNCoo2qCmEBBZjPu8z7ADBZBwm8iZDrhG
	mOL4FpyvUVtCu/jA6R7Z3looYxKtIcwWTsRZ3oPJg32IMoV0RTUyMEXKCUiKA96t
	UmMdfRMBBOltl3/jBBWH2UoM8CRWj6mWhnd8m7D0HbQyYZC3RI99ZRc2CvGL7MQZ
	VfHcuzzW/KhagMtHbUhR9381Z2dIHT0pIjvWY+PZF+h/Aqa+lgIVX1gBmgbQFRZt
	Tf5+XaQ4ejboHZoT2GG97cMvEdOZjbKf4eZfaKSs/m+i0x6YDD6J/jicsM+qfY/C
	9Jbmmw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52955kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LBPGsm029368
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 11:25:16 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 21 Aug 2025 04:25:12 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <mani@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: [PATCH V3 5/5] arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller
Date: Thu, 21 Aug 2025 16:54:03 +0530
Message-ID: <20250821112403.12078-6-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a7021d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=lw8srnNUBVFv889I-LYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: D3LI--i-AweVs-y4jotR_8ZHBgDnWJI6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3Tt7EUNtJAj4
 DAbMZVY8R+BGh1W5eadX7KNl6KJQ1QuJITxcEpQmTFz+5Ly08C2Yd8hoX1y7NdeuJGkmuFemOLu
 t0nd15P5ehYceiSA0OJpH8VfDJynPqjsAjJj73MmFUltmhyHWeSGE4z3XNteLkg7FjJVkvuYt0k
 ETQuJWhBAiBbJjy+gWXQO6J8tsgbDZIVBBzSvVNZoi5Xsn5LdiwYy1WI8HxF5dDj0+2UA1HlEkf
 cVcr/l6Z/3YKtRFAP0CGD1M0cRBpC5Mk3UoD3/SzOOqGqQ5MGAp16YfO9QPpSu7BqaHkhaqAyv+
 zGskkKz/lMzHliqfMuOz9uX4aCXIAxjwAtBOS/6NBRH4ihYq0pF+7BWz5EZ0MiR+d56IqWNXaEj
 yJ5JKSjEVN41k4L8VDY3jZytr8sLeQ==
X-Proofpoint-GUID: D3LI--i-AweVs-y4jotR_8ZHBgDnWJI6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

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
index 79ca262f5811..e55edc0a6e6e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3329,7 +3329,10 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x1da0000  0x0 0x15000>;
+			reg-names = "std",
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


