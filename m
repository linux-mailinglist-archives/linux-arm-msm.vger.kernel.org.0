Return-Path: <linux-arm-msm+bounces-37657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C33AC9C62F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 21:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB682BA52F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 16:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AF4215021;
	Tue, 12 Nov 2024 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WuuDlFPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D01A215010;
	Tue, 12 Nov 2024 16:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430567; cv=none; b=g2LgSQalDGYO4yV/VARrg54+35zjo26+mxXDjHVoABKjiFeelRnaTASbbTQiDu6Vd5902s9liYOZYjMqyYkkRgous7Rz0xGXY3anKDB1FMlY2SZL3ggVjlQxRRIGuXTFutAZ84b/ywtpCuI9CafJmNtJI9/gg4GGCsLHDbb/4jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430567; c=relaxed/simple;
	bh=K1TKFWrXrTxyJs5X/6wELhG8DlYidaX42aF2JFk2gbo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YMUI5uRJksMW6yU1YbyJ2kSHW+SVxuzExCpVlabDFcTbpzQMs44KwfoeV07/d0VqiJA64nUYuQHoXFkzle6SbU8QBMEWVXw++OhBCaUtD0ozyf20T0FwKFWA23NvSId9kZZVEUffLkYu8/qIt2akJ6Np6L30OEpcc2cMj98Ak+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WuuDlFPm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACFmmxp011894;
	Tue, 12 Nov 2024 16:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wCVnf/TyUHhxgeZ7ScMhiy4Pc0EXuCRI9iHUN3SXrRg=; b=WuuDlFPmGZqbszvp
	eEpDsEpeQk0KRVM2AtWfX3YoVWNAOaP35xu59VLY7sb/nmV+pE0wOhcIEHDE2Qh/
	tIwBk2NbcU+Ep3KxRZG1TEAIvgtT3c0WRbC7eXEn+DCm+qNLpr3RJx2Htjz9TdZ+
	YMBd3ZZ6+CJrZq//iFyVsBuLpgu7l/iyGvRS1NDSBZY3ysxUrMNcq85qfgjX8lEs
	kvgNVeeYNOgaIa+JhBQCUjprhSTAv9S3C2YUCFVzwPkcV1hapPEVD0yL4VYK5qMd
	FjTY9NMTUoXxy0bwMcaGouZcV7st49HH/gMHipshhBi+BqjtqsIrrVjXpbVngX3G
	UQnk9w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va0789sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 16:55:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACGtn1l015911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 16:55:49 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 08:55:44 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH v17 4/5] iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
Date: Tue, 12 Nov 2024 22:24:53 +0530
Message-ID: <20241112165454.2698269-5-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112165454.2698269-1-quic_bibekkum@quicinc.com>
References: <20241112165454.2698269-1-quic_bibekkum@quicinc.com>
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
X-Proofpoint-GUID: QJmFDdnJ-bYgct7fEjqwPn_a68CdBceh
X-Proofpoint-ORIG-GUID: QJmFDdnJ-bYgct7fEjqwPn_a68CdBceh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120135

Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
the TLB to fetch just the next page table. MMU-500 features ACTLR
register which is implementation defined and is used for Qualcomm SoCs
to have a custom prefetch setting enabling TLB to prefetch the next set
of page tables accordingly allowing for faster translations.

ACTLR value is unique for each SMR (Stream matching register) and stored
in a pre-populated table. This value is set to the register during
context bank initialisation.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 0e4f3fbda961..b595fee23836 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -235,14 +235,37 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 	return true;
 }

+static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *smmu, int cbndx,
+		const struct of_device_id *client_match)
+{
+	const struct of_device_id *match =
+			of_match_device(client_match, dev);
+
+	if (!match) {
+		dev_dbg(dev, "no ACTLR settings present\n");
+		return;
+	}
+
+	arm_smmu_cb_write(smmu, cbndx, ARM_SMMU_CB_ACTLR, (unsigned long)match->data);
+}
+
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
 	const struct device_node *np = smmu_domain->smmu->dev->of_node;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct of_device_id *client_match;
+	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;

 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;

+	client_match = qsmmu->data->client_match;
+
+	if (client_match)
+		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
+
 	/* Only enable split pagetables for the GPU device (SID 0) */
 	if (!qcom_adreno_smmu_is_gpu_device(dev))
 		return 0;
@@ -306,8 +329,18 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 static int qcom_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct of_device_id *client_match;
+	int cbndx = smmu_domain->cfg.cbndx;
+
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;

+	client_match = qsmmu->data->client_match;
+
+	if (client_match)
+		qcom_smmu_set_actlr_dev(dev, smmu, cbndx, client_match);
+
 	return 0;
 }

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index b55cd3e3ae48..8addd453f5f1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -28,6 +28,7 @@ struct qcom_smmu_match_data {
 	const struct qcom_smmu_config *cfg;
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
+	const struct of_device_id * const client_match;
 };

 irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
--
2.34.1


