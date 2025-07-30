Return-Path: <linux-arm-msm+bounces-67065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9ECB15A73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 10:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 866275463DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4271255E4E;
	Wed, 30 Jul 2025 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kCsQKrbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F92512D7;
	Wed, 30 Jul 2025 08:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753863796; cv=none; b=vA0SwYXvQIO7lcV163bvW0pFEeZR80lfogyb+96pZxvD9bO/xPtdspxCsAGL1w+mAWbbNVdPAef09JsB+V11eFWJH2MiYlYkbLrnlFSE10BRcR165SEvJlQMH9zb7r6TiQbFkkL/t3rBRteUuw9OhnlpvIj43OSYYZ4fxGXvnM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753863796; c=relaxed/simple;
	bh=iIADWUHyZLwNebj8AZ9Vn0BrPX5WX6yaZsYValg9rsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIxZfeWDhBFwbDVY5Xf0E9cj7c0FfaD5rgkK3zpDe+9reGMFtI7+u55Nn7dkwxqdzeE7Pz/QAo7vMQycuSXAGtOFbzU907hwgOYiPv6RdTPxAK6rOWiCGseF/g+6GdEya5O3Vwf/qyv121OQERumckEFxv8Wy8CHv1Ybg1RP834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kCsQKrbZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U4l3at014609;
	Wed, 30 Jul 2025 08:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9MvI1nk60WdoG2bc7QtALmUwBFVl0IUg6QvjINNa64Q=; b=kCsQKrbZ+RaaeXK+
	uZa4OPB47hJcg5SPUeN087XgL2twuJqN2IyTqxXzURuSrnpGFur1A3Et53lSDCu7
	uNEjpfV3yquuMkz8Vyjuda8aDo+b4Gw3/k+o3hzWuDPOjOzh+5lUAmQPa5ZO6PYD
	uh4NLSdI1AzjqAWOl9LuFXADsbTj4+fpfKIxarerbk8tv4t3UPFe6Q5FWfKtfAmI
	WGhUVxXMNGNWiInAL968sMJdNErD/gmEvQ1vHGpbYw1GZv9b3F3loyXPKhJXgpRV
	PmhJvJ8H4zTrp41wRh3gmMWFM+U/7yBNa9duk8BteUhJsVpD2qS5VggXss8cOHLa
	tzz8gw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xtx8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:23:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56U8N5V4008534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jul 2025 08:23:05 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 30 Jul 2025 01:23:01 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 3/3] arm64: dts: qcom: sm8750: Enable MCQ support for UFS controller
Date: Wed, 30 Jul 2025 13:52:29 +0530
Message-ID: <20250730082229.23475-4-quic_rdwivedi@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889d66a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Jh_ldMv1e_q4xxFTlQwA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HIBHNy8Aenk1oD5M7SAzZTHCS-RjvrJ_
X-Proofpoint-GUID: HIBHNy8Aenk1oD5M7SAzZTHCS-RjvrJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA1NCBTYWx0ZWRfXzycjsQAx4mGM
 1cCEpT36793yYNXh4UZfleky1hL+F0DJSScmX8ocyScij/pk6SS4EZsJtXdmpdnMOe13jiSYXf8
 FfIe356+qI7dPadAdwycN8eSOD/Ey7szGzLmSgqh+ho3VcdzHvoqSFNXV8ipxT8E5duNlx+xqS4
 KB9EGDf0NouGm0mITVrjBOIQzQjOIXwU8bNWhLeI3Qb8YmKZQE5Slckxt3jaUL4P5RpV6LjqGsm
 Z1jOeqb4V5Ofxjby5vGjBCwSrcMEEmSVzqm9Yt4aUDuSyCVTLo+eV2zS0onPHCLJrxRgftyD8tu
 7i8AnwAysJmeCxckfW7CimcZLkZTRgNQmNHLoCYQ35yD5nwZPHf7mmwtIT7CtOEy4r66HihxB9m
 XFPRPvN9S/faXOvHr56SCdTKLlM/jzOR62DsT3HXolCJdHsC45EUhTr2q6AF2a8h4+LtjJRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300054

From: Palash Kambar <quic_pkambar@quicinc.com>

Enable Multi-Circular Queue (MCQ) support for the UFS host controller
on the Qualcomm SM8750 platform by updating the device tree node. This
includes adding new register regions and specifying the MSI parent
required for MCQ operation.

MCQ is a modern queuing model for UFS that improves performance and
scalability by allowing multiple hardware queues. Although MCQ support
has existed in the UFS driver for several years, this patch enables it
via Device Tree for SM8750.

Changes:
- Add reg entries for mcq_sqd and mcq_vs regions.
- Define reg-names for the new regions.
- Specify msi-parent for interrupt routing.

Signed-off-by: Palash Kambar <quic_pkambar@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 4643705021c6..401e510ee738 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3329,7 +3329,12 @@ ufs_mem_phy: phy@1d80000 {
 
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
-			reg = <0x0 0x01d84000 0x0 0x3000>;
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x1da5000 0x0 0x2000>,
+			      <0x0 0x1da4000 0x0 0x10>;
+			reg-names = "ufs_mem",
+				    "mcq_sqd",
+				    "mcq_vs";
 
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
@@ -3363,11 +3368,12 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
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


