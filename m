Return-Path: <linux-arm-msm+bounces-37927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459E39C8F94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 17:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82584B4742D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 999C4189F3C;
	Thu, 14 Nov 2024 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z8piJrYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049E8166F3D;
	Thu, 14 Nov 2024 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600618; cv=none; b=ShHn2hxoh8WD4NxFbdy09ppxJAZaN4MjGCTxyGpX5auq+u+9lDUT5pUER2ZoX4WarlfUKQJOihWuQJR5U4rjZXxLeqU4PVRd2m7SAtJnobjCMqo/XlUAOOqVKaxTL1w5ehr4HSsuvFBdQ0EYrnzXFfeQ4heIkqqXxE55wEbwR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600618; c=relaxed/simple;
	bh=tTVfRhy+0cF1QAQhvZ8/YDlf/6fJ73Gxjjobgn53D20=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BbWFFvXS6N+G/mXAwNFQuadsANbsj7Ux/BzyFMOsDrA3uGTC3v81k5/4IEXLtXvzBdZy3+NILWC85P2Ti8Kvu4R8Ef99EXB3au6uprH5HvOp7OC2edI99D+s1vaL6LOlBybC5pHPVfBcLx9+jL1HcLbtqmkSiwrtYJc1MwJObsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z8piJrYQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEEkTW0026116;
	Thu, 14 Nov 2024 16:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4gvQXnQ/TnC4ga3wtGtB/oOq2kR1vd+H2yGj2bJNZk=; b=Z8piJrYQqjovqqnr
	+g7P+rFYAgxtKXyj3hjlPCWZTpzqHsh/QILLMrmMWYs26CDji4HJXo5lqHYb1BZo
	NhWNS3a0HqNOKnzjh9BwXhHrlf+9RcUksxeCQNnjEcshFuXuAjymLsc69wGCy6pB
	mo2B62wit+5w5BSRmRZLbv+9rnxdrQZq+Er3iLkbnXQ3vbZ5+k/qkX0gjk8Oy5PL
	9S84cXvYii0/XnOiplewGdNfr4MNTW9zt7lgvwd/980sP9TV7pRk9lQRrgdcI8yu
	qfXDEHd4YriPZQRFt1kZvhnJgWRyEhP5TomhOzoP1y3wI/SJE/MpmMCBfKToVgJz
	+j2tFQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42va07g3jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:09:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEG9mNS027583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:09:48 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 08:09:44 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH RESEND v17 1/5] iommu/arm-smmu: re-enable context caching in smmu reset operation
Date: Thu, 14 Nov 2024 21:37:17 +0530
Message-ID: <20241114160721.1527934-2-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yN6n7R4DqVW3mzj55BwPy_hZcOdiQiZ9
X-Proofpoint-ORIG-GUID: yN6n7R4DqVW3mzj55BwPy_hZcOdiQiZ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140126

Default MMU-500 reset operation disables context caching in
prefetch buffer. It is however expected for context banks using
the ACTLR register to retain their prefetch value during reset
and runtime suspend.

Add config 'ARM_SMMU_MMU_500_CPRE_ERRATA' to gate this errata
workaround in default MMU-500 reset operation which defaults to
'Y' and provide option to disable workaround for context caching
in prefetch buffer as and when needed.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  3 ++-
 drivers/iommu/Kconfig                       | 12 ++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c  |  5 +++--
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b1861..92207d55fd1c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -198,7 +198,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU-500         | #841119,826419  | N/A                         |
+| ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
+|                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-600         | #1076982,1209401| N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b3aa1f5d5321..7eb67608a519 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -366,6 +366,18 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	  'arm-smmu.disable_bypass' will continue to override this
 	  config.

+config ARM_SMMU_MMU_500_CPRE_ERRATA
+	bool "Enable errata workaround for CPRE in SMMU reset path"
+	depends on ARM_SMMU
+	default y
+	help
+	  Say Y here (by default) to apply workaround to disable
+	  MMU-500's next-page prefetcher for sake of 4 known errata.
+
+	  Say N here only when it is sure that any errata related to
+	  prefetch enablement are not applicable on the platform.
+	  Refer silicon-errata.rst for info on errata IDs.
+
 config ARM_SMMU_QCOM
 	def_tristate y
 	depends on ARM_SMMU && ARCH_QCOM
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 99030e6b16e7..db9b9a8e139c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -110,7 +110,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(struct arm_smmu_device *smm
 int arm_mmu500_reset(struct arm_smmu_device *smmu)
 {
 	u32 reg, major;
-	int i;
 	/*
 	 * On MMU-500 r2p0 onwards we need to clear ACR.CACHE_LOCK before
 	 * writes to the context bank ACTLRs will stick. And we just hope that
@@ -128,11 +127,12 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sACR, reg);

+#ifdef CONFIG_ARM_SMMU_MMU_500_CPRE_ERRATA
 	/*
 	 * Disable MMU-500's not-particularly-beneficial next-page
 	 * prefetcher for the sake of at least 5 known errata.
 	 */
-	for (i = 0; i < smmu->num_context_banks; ++i) {
+	for (int i = 0; i < smmu->num_context_banks; ++i) {
 		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
 		reg &= ~ARM_MMU500_ACTLR_CPRE;
 		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, reg);
@@ -140,6 +140,7 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 		if (reg & ARM_MMU500_ACTLR_CPRE)
 			dev_warn_once(smmu->dev, "Failed to disable prefetcher for errata workarounds, check SACR.CACHE_LOCK\n");
 	}
+#endif

 	return 0;
 }
--
2.34.1


