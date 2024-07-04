Return-Path: <linux-arm-msm+bounces-25221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B022926CE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 03:08:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBADFB21271
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 01:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B8A610D;
	Thu,  4 Jul 2024 01:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZ0kVhvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5B9443;
	Thu,  4 Jul 2024 01:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720055307; cv=none; b=cwkujqrNmBIXQ9vjJJpgKMe3EI6o7KUbLjsbvKfVCRWycIA4VYy7ipc9Mtl33k8i58ZJxYj0m8b/jfvSjqHFrIKHSy2wwWv46Dc5lx6G+Wa+WxuGCT4EHoRyCYSycv6ZvRgTrZ5eaDp8qbDakMNb2Q6pA+gwbVs8TfYms6Pt8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720055307; c=relaxed/simple;
	bh=V+dXDqGJjnGbyc2bwTlaQhHqYQEdhaUrMmxVmbmIZRg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xa8s/wRTxnQwvZstYj6jGbi8vA3x3StnDc86JbliUcFG7uPvFjTs2qDR+7Ngk1u/Si5nLCkINHffXqgKZAdkafagVmnLntD5zOMZAR6wrEQ5ZEQumcUX9kAwI8rRFUogk62R2n3fqfsuy+iv42vl9sMPeR2QqZ94aby/YYLKTG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZ0kVhvj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463J4lCK003579;
	Thu, 4 Jul 2024 01:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TRUtAEaquZLa4fI9PksGGv
	ASEJtNlleDTxbGorNjudI=; b=QZ0kVhvj+vNf/+rwevBzMCNXwRcRI6Yjdvmma5
	57JkOl0N4hWaAs3FtD391KE6logPnwW9Aa/VbLskT0icBJH2kfl1Z6tQm4i11q2N
	yRVLzdgxoM8sq3Kc11Z6EX71C819kq8orHsBvyFgSi+0cHS6y8SZctLrvQV9z4U+
	OCKtOUOLY+KdAE9qkMNe88ujkyjUf5OnUBhmcWBgr/6fo/JoPtoa3GkSQdcPdZjV
	R304Ndr+cQEAwvTJhOn62BXwPG4wuhCbfUC1OeGr4NIcbP+UWL22jPE+zYVFYDlp
	C8ILTAMeOnmV7vXFe27GzsWpw1rBikv9USy5HGaH09dgSI9w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 405cg28gb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 01:08:13 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46418CYj016818
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 4 Jul 2024 01:08:12 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 18:08:12 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <will@kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <iommu@lists.linux.dev>,
        <robdclark@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <djakov@kernel.org>
Subject: [PATCH] iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init
Date: Wed, 3 Jul 2024 18:07:59 -0700
Message-ID: <20240704010759.507798-1-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tuXnG1sorY0ZLiR6C3AWyKj5DlQEkiMK
X-Proofpoint-ORIG-GUID: tuXnG1sorY0ZLiR6C3AWyKj5DlQEkiMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040007

Currently the TBU driver will only probe when CONFIG_ARM_SMMU_QCOM_DEBUG
is enabled. The driver not probing would prevent the platform to reach
sync_state and the system will remain in sub-optimal power consumption
mode while waiting for all consumer drivers to probe. To address this,
let's register the TBU driver in qcom_smmu_impl_init(), so that it can
probe, but still enable its functionality only when the debug option in
Kconfig is enabled.

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Closes: https://lore.kernel.org/r/CAA8EJppcXVu72OSo+OiYEiC1HQjP3qCwKMumOsUhcn6Czj0URg@mail.gmail.com
Fixes: 414ecb030870 ("iommu/arm-smmu-qcom-debug: Add support for TBUs")
Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 17 +-------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 39 +++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  2 +
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index ef93f825f11f..548783f3f8e8 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -464,7 +464,7 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev)
 	return ret;
 }
 
-static int qcom_tbu_probe(struct platform_device *pdev)
+int qcom_tbu_probe(struct platform_device *pdev)
 {
 	struct of_phandle_args args = { .args_count = 2 };
 	struct device_node *np = pdev->dev.of_node;
@@ -506,18 +506,3 @@ static int qcom_tbu_probe(struct platform_device *pdev)
 
 	return 0;
 }
-
-static const struct of_device_id qcom_tbu_of_match[] = {
-	{ .compatible = "qcom,sc7280-tbu" },
-	{ .compatible = "qcom,sdm845-tbu" },
-	{ }
-};
-
-static struct platform_driver qcom_tbu_driver = {
-	.driver = {
-		.name           = "qcom_tbu",
-		.of_match_table = qcom_tbu_of_match,
-	},
-	.probe = qcom_tbu_probe,
-};
-builtin_platform_driver(qcom_tbu_driver);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 971c6a2e592b..36c6b36ad4ff 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -8,6 +8,8 @@
 #include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "arm-smmu.h"
 #include "arm-smmu-qcom.h"
@@ -562,10 +564,47 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
 };
 #endif
 
+static int qcom_smmu_tbu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
+		ret = qcom_tbu_probe(pdev);
+		if (ret)
+			return ret;
+	}
+
+	if (dev->pm_domain) {
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id qcom_smmu_tbu_of_match[] = {
+	{ .compatible = "qcom,sc7280-tbu" },
+	{ .compatible = "qcom,sdm845-tbu" },
+	{ }
+};
+
+static struct platform_driver qcom_smmu_tbu_driver = {
+	.driver = {
+		.name           = "qcom_tbu",
+		.of_match_table = qcom_smmu_tbu_of_match,
+	},
+	.probe = qcom_smmu_tbu_probe,
+};
+
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 	const struct of_device_id *match;
+	static u8 tbu_registered;
+
+	if (!tbu_registered++)
+		platform_driver_register(&qcom_smmu_tbu_driver);
 
 #ifdef CONFIG_ACPI
 	if (np == NULL) {
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 9bb3ae7d62da..3c134d1a6277 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -34,8 +34,10 @@ irqreturn_t qcom_smmu_context_fault(int irq, void *dev);
 
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
 void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
+int qcom_tbu_probe(struct platform_device *pdev);
 #else
 static inline void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu) { }
+static inline int qcom_tbu_probe(struct platform_device *pdev) { return -EINVAL; }
 #endif
 
 #endif /* _ARM_SMMU_QCOM_H */

