Return-Path: <linux-arm-msm+bounces-33564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0C3994C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7302F1C25003
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 12:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0691DFD89;
	Tue,  8 Oct 2024 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kVs9Gj79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AB41DEFF3;
	Tue,  8 Oct 2024 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392116; cv=none; b=AdB3Z1VOayJUy9uMtVb1ns4UBOrz1VavGY3G1oSMZ866sRcENT+qv7XFS7YbGAGvzgTYKLjIm83wKpsQqusa3D4UEewoAePHTZ+D+rbZ2cPtzhBd9qcrC5zcQIKEZY/uiQa2nqWqwbeN2rDDtptPT6v9zeGwdIcp9h1I2duMc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392116; c=relaxed/simple;
	bh=l/b19yHhRgowD8uZbq6v6nd8mEoqlnR2l3DgywaCr+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2qseMmCCPEFyh28nlxxpu16fGs3K5RRQUIsuEuV2j1Bbwmek4DTCw2zFFewQFv+JFlGmXMKYvGsKO3LTpULJENCBmZvkb2WPbRT0rxJRwVSQVCbs2O5jWQJCpO8dT/S33eWMig4jTSgJVpgVdnXr0TdbZKJDmSbpUxKQd+w8HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kVs9Gj79; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984Sbkm008697;
	Tue, 8 Oct 2024 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fgmdtKlode30qWQkEogieWVhsRaELfprkiUceOphRvQ=; b=kVs9Gj79jI1cZTEv
	oL+mPYKT28MdNx+ceE/8oxO/MliFHCgtm5uzcPVfx3ZDVV0bAubLOpxCtf+dPOtn
	C8nihZFxTlVEB/uvh506KrDHM+1r1ON27SMpbExq3m6BomutSqr0fDd7bTtIvWMT
	M3/taqdDxoBqteYsY1zeZzOEOSiughmlNycly9KEL+u+hAUzCxsJGZW+LhvRJahZ
	rfg6xvyAnlZvB9OcEtmak2rqJONzyjiH+i0836929AqG61KNyW43+qQRPovZhLSu
	N9w2IEM2vs2Ccs0g1l4gQS0FK5qS2SDrxXEn5jF3cwGMhLjJfIfXhgkAlpcxvASR
	rkDxzA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc1a8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 12:55:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498CsxOV026523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Oct 2024 12:54:59 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Oct 2024 05:54:55 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH v16 5/5] iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
Date: Tue, 8 Oct 2024 18:24:10 +0530
Message-ID: <20241008125410.3422512-6-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
References: <20241008125410.3422512-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tbrYY9ZAs0jOHVCenqJBWH9BW1rFzCEn
X-Proofpoint-ORIG-GUID: tbrYY9ZAs0jOHVCenqJBWH9BW1rFzCEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080081

Add ACTLR data table for qcom_smmu_500 including
corresponding data entry and set prefetch value by
way of a list of compatible strings.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2d2c1e75632c..dd4fb883ebcd 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -25,8 +25,31 @@

 #define CPRE			(1 << 1)
 #define CMTLB			(1 << 0)
+#define PREFETCH_SHIFT		8
+#define PREFETCH_DEFAULT	0
+#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
+#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
+#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
 #define GFX_ACTLR_PRR		(1 << 5)

+static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
+	{ .compatible = "qcom,adreno",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-gmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-smmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,fastrpc",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-venus",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8550-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ }
+};
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -640,6 +663,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.impl = &qcom_smmu_500_impl,
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
+	.client_match = qcom_smmu_actlr_client_of_match,
 };

 /*
--
2.34.1


