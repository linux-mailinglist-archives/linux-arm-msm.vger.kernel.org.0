Return-Path: <linux-arm-msm+bounces-84076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 91367C9B86A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 13:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ACC3D346437
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E6C313E1A;
	Tue,  2 Dec 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HphkWmwj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A22313540;
	Tue,  2 Dec 2025 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764680113; cv=none; b=qDQ2WC9aKuBhZFFpVwbCdIZA5k2iBDeFXy4laozXR5tdVSmSjFFpb+KkzSAg/7XpttqsLq8mYDTKCSVWtjXTEd+mh5A+gm5D6wRpCmk2TCMFCIPCuw83432pTElK0YDysXVvZMhINW/4B4jdgkkDOruB+LYVyXoX1erDFIjYLsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764680113; c=relaxed/simple;
	bh=qHOWzvja4DWMO+NjB9uq5+3BgXQaxJRfF1R7Huay3Bg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qrLtvyGFyznRAMv89SdpI/0yFYYIN6TsUVJPlT20dN+iRDE2kRvrFmKF4TZFglaL3gWsTA/ULFeTV5WmA5wG9cq/oKnqSpalxQczEm40EGwkoPpWVKLdu2aZSrr4G662RhqoS35DLTXP0TNayp4LxRBk5eH9yFdELatAQEE7g2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HphkWmwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B28FR2q1491741;
	Tue, 2 Dec 2025 12:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NOi1IpLT3hqt7Yhp0snhhK4gc9WWC6VmIKv
	2Z30g4Sc=; b=HphkWmwjyk2yeALGiPfZz19OXjKibs38o1AY5J3nUbIjF6Kgy1I
	fVys66etNUVCUd9A0ETXPaN+sCmtWqcOaxOSBu+ivGz+SxY18P+SJw0r0OshMAnp
	/hp2EMY+G1xumxTGADAOWDtPocRefs1sg7sQxURvZvk1iznUWrRjZ7IjlSqZxTE0
	72sEuWDwVN7YoLiR52TchFlvTVjE+PG/Dh1P1l4OOY0NQcvHY+5F1g+GIOi0THz4
	JLn/39r9M/qvXOf3kMa4zmyPqOpcuDywiloC0ba5Z4O2nCODi6QwRo9HbYtgnjur
	0uF+MUW28llcFqV0rsqvLpBLJ/JMRA0In4Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4askbd2dtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 12:54:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B2Csq8E023265;
	Tue, 2 Dec 2025 12:54:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4aqswkpyra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 12:54:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5B2Csqfg023259;
	Tue, 2 Dec 2025 12:54:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5B2Csqhv023256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 12:54:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 7C66E5D8; Tue,  2 Dec 2025 18:24:51 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [PATCH V4] iommu/arm-smmu: add actlr settings for mdss on Qualcomm platforms
Date: Tue,  2 Dec 2025 18:24:47 +0530
Message-Id: <20251202125447.2102658-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bYQVAJBa3iekCjcoUw7S9foE0baYEL4H
X-Proofpoint-GUID: bYQVAJBa3iekCjcoUw7S9foE0baYEL4H
X-Authority-Analysis: v=2.4 cv=fLg0HJae c=1 sm=1 tr=0 ts=692ee1a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LWYvQZVa8uIfhQNUIroA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEwMyBTYWx0ZWRfX/4ZhITIdLEfI
 BTKQVALJOWL5RjZNo17aZzfmnIrCs8+CmoXQlwU8KiyX2YiQXzy5GG4dPbXV1HHWF2xLXUJKN2j
 HsFfgUzhY2VqvLWEpGMB2ZYN6SCzQaZkQ+nZET64lvRIIAQWPUwknr+shpTcbP7d9s16EyRWZj8
 rZGm/ahU/Xcc4Xip20+9pDWImcEIbiraVqXrJDSrkHotYpwaWCv/YYL/bdbsiuajlvBjv7FtV/p
 wLnc84/+EjI62SYPF+ffXLOwFgCA4PsYsa33pJzfIpDuwreyppnx/XSEGvca09A7uh3ENpv8CkD
 QPrtNxUQNHTJgMyM2DFG8rJfggDbVAtsTGlgv8ZOZvrARwW+KEvGJ3lYxo5jzm5nm4WpnKZbIGZ
 khKeKMLKfbyX/RmlJfi16cezWPkFqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020103

Add ACTLR settings for missing MDSS devices on Qualcomm platforms.

These are QoS settings and are specific to per SoC thus different
settings, eg: some have shallow prefetch while others have no
prefetch.

Aswell, this prefetch feature is not implemented for all the
platforms, capturing to those are implemented to the best of my
knowledge.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
Changes from V3:
 1) Add actlr setting for missing sc8180x & sm6115.
 2) Improved commit message.
https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/

Changes from V2:
 1) Add actlr settings for all the mdss devices on Qualcomm platforms.
 2) Improved the commit message that explain why different ACTLR
    settings
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t

Changes from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. --
konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c21a401c71eb..149da53091de 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,12 +41,38 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,qcm2290-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8180x-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8280xp-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6115-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6125-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8150-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8250-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8450-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sm8550-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8650-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8750-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,x1e80100-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ }
 };
 
-- 
2.34.1


