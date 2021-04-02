Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435173525E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 05:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhDBD4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 23:56:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233841AbhDBD4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 23:56:13 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 420AFC0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 20:56:13 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id y32so2831475pga.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 20:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iB9SooeXb8aToQh6AowZmjkOEn+DBwCWyr7GlC/6EWI=;
        b=cKmDZO+u7GCe0yd64RSuCnAZwpInO3JEx86HCovfkz4oAkJ5kbDx6FMCsGcIhtZrtF
         STG+3oduJAAav78IMRfBsI8WE9es3vI3eHXl+91Y74zEL7VYBC/XyGX+D2PIkzp9CDeu
         XnS2HOWNRytTBOOGd2tOBRwQHbljpHnA9B9SdEQZY+tn6wIlvxtBJyi/4PQM2acVrIuc
         XRGeo7Ym6NA2b5+nFqIpm6Wl8cRoDGXccMLmnbL2u8tYOAQel7WP5jBdcfgCyZ+OGo+w
         nXdSfftIyP0WrccBIwCYAzcZqP2xElCUcY2Z2Au0tHQW5piFPywPju/lea1QdRR9fu7e
         YqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iB9SooeXb8aToQh6AowZmjkOEn+DBwCWyr7GlC/6EWI=;
        b=F3LIx2nVOay2wTtTStSajYaHA+CfEPo0CNkDtA+3g3t4tOt56E0Eaq+P6pDAlIohlm
         aenc6LUqrhJd+5YSaxCgOGwZ27Vq+fY5KJBpOvLvoEnxrVgYsQpboPbW2BvmcQ9SkRbH
         7Y/7Iqa0WWnqS/vbx50roKgd7/6LaoAjykinZ1pie2LaSy0qJb44ucaf8jLpYnnEDnWL
         cLDwEivW3f/PefT4hO0n3N37b0TLGRsInS+yqgVFTHh6oMbyFZrehdLMCsHJoHPFiCiR
         dB79e3TF6/Sp7wYJvcp4gm48WDmmDXv9n2iN/dMW0qVbMc4+2E/hhsn2pgpv9Cse6DBd
         5vbA==
X-Gm-Message-State: AOAM531I9BIHZd30zk13JJPNTWS8SczhTlNFVuoLoV+oANYYYv68eEzE
        E1bRLf83H7G7aDuWyjaL9Hl2dw==
X-Google-Smtp-Source: ABdhPJyt6wA15AntzKhNCSCuYVREINHKVKOH4FBYIcW6a9EZ8fEDHIW8eBa5tXP60ZQ50rgbUpy0ZA==
X-Received: by 2002:a63:5807:: with SMTP id m7mr10211892pgb.73.1617335772757;
        Thu, 01 Apr 2021 20:56:12 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 81sm6875972pfu.164.2021.04.01.20.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 20:56:12 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/3] ACPI/IORT: Consolidate use of SMMU device platdata
Date:   Fri,  2 Apr 2021 11:56:00 +0800
Message-Id: <20210402035602.9484-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210402035602.9484-1-shawn.guo@linaro.org>
References: <20210402035602.9484-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the platdata is being used in different way by SMMU and PMCG
device.  The former uses it for acpi_iort_node pointer passing, while
the later uses it for model identifier.  As it's been seen that the
model identifier is useful for SMMU devices as well, let's consolidate
the platdata use to get it accommodate both acpi_iort_node pointer and
model identifier, so that all IORT devices (SMMU, SMMUv3 and PMCG) pass
platdata in a consistent manner.

With this change, model identifier is not specific to PMCG, so
IORT_SMMU_V3_PMCG_GENERIC gets renamed to IORT_SMMU_GENERIC.  While at
it, the spaces used in model defines are converted to tabs.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/acpi/arm64/iort.c                   | 31 ++++++++-------------
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  6 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  9 ++++--
 drivers/perf/arm_smmuv3_pmu.c               |  8 ++++--
 include/linux/acpi_iort.h                   | 11 ++++++--
 5 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 2494138a6905..e2a96d2d399a 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1463,25 +1463,28 @@ static void __init arm_smmu_v3_pmcg_init_resources(struct resource *res,
 				       ACPI_EDGE_SENSITIVE, &res[2]);
 }
 
-static struct acpi_platform_list pmcg_plat_info[] __initdata = {
+static struct acpi_platform_list iort_plat_info[] __initdata = {
 	/* HiSilicon Hip08 Platform */
 	{"HISI  ", "HIP08   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
 	 "Erratum #162001800", IORT_SMMU_V3_PMCG_HISI_HIP08},
 	{ }
 };
 
-static int __init arm_smmu_v3_pmcg_add_platdata(struct platform_device *pdev)
+static int __init iort_smmu_add_platdata(struct platform_device *pdev,
+					 struct acpi_iort_node *node)
 {
-	u32 model;
+	struct iort_smmu_pdata pdata;
 	int idx;
 
-	idx = acpi_match_platform_list(pmcg_plat_info);
+	pdata.node = node;
+
+	idx = acpi_match_platform_list(iort_plat_info);
 	if (idx >= 0)
-		model = pmcg_plat_info[idx].data;
+		pdata.model = iort_plat_info[idx].data;
 	else
-		model = IORT_SMMU_V3_PMCG_GENERIC;
+		pdata.model = IORT_SMMU_GENERIC;
 
-	return platform_device_add_data(pdev, &model, sizeof(model));
+	return platform_device_add_data(pdev, &pdata, sizeof(pdata));
 }
 
 struct iort_dev_config {
@@ -1494,7 +1497,6 @@ struct iort_dev_config {
 				     struct acpi_iort_node *node);
 	int (*dev_set_proximity)(struct device *dev,
 				    struct acpi_iort_node *node);
-	int (*dev_add_platdata)(struct platform_device *pdev);
 };
 
 static const struct iort_dev_config iort_arm_smmu_v3_cfg __initconst = {
@@ -1516,7 +1518,6 @@ static const struct iort_dev_config iort_arm_smmu_v3_pmcg_cfg __initconst = {
 	.name = "arm-smmu-v3-pmcg",
 	.dev_count_resources = arm_smmu_v3_pmcg_count_resources,
 	.dev_init_resources = arm_smmu_v3_pmcg_init_resources,
-	.dev_add_platdata = arm_smmu_v3_pmcg_add_platdata,
 };
 
 static __init const struct iort_dev_config *iort_get_dev_cfg(
@@ -1579,17 +1580,7 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
 	if (ret)
 		goto dev_put;
 
-	/*
-	 * Platform devices based on PMCG nodes uses platform_data to
-	 * pass the hardware model info to the driver. For others, add
-	 * a copy of IORT node pointer to platform_data to be used to
-	 * retrieve IORT data information.
-	 */
-	if (ops->dev_add_platdata)
-		ret = ops->dev_add_platdata(pdev);
-	else
-		ret = platform_device_add_data(pdev, &node, sizeof(node));
-
+	ret = iort_smmu_add_platdata(pdev, node);
 	if (ret)
 		goto dev_put;
 
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8ca7415d785d..91c9a74d8ac6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3397,9 +3397,13 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 {
 	struct acpi_iort_smmu_v3 *iort_smmu;
 	struct device *dev = smmu->dev;
+	struct iort_smmu_pdata *pdata = dev_get_platdata(dev);
 	struct acpi_iort_node *node;
 
-	node = *(struct acpi_iort_node **)dev_get_platdata(dev);
+	if (pdata == NULL)
+		return -ENODEV;
+
+	node = pdata->node;
 
 	/* Retrieve SMMUv3 specific data */
 	iort_smmu = (struct acpi_iort_smmu_v3 *)node->node_data;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d8c6bfde6a61..d53ab3927a30 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1991,11 +1991,16 @@ static int arm_smmu_device_acpi_probe(struct platform_device *pdev,
 				      struct arm_smmu_device *smmu)
 {
 	struct device *dev = smmu->dev;
-	struct acpi_iort_node *node =
-		*(struct acpi_iort_node **)dev_get_platdata(dev);
+	struct iort_smmu_pdata *pdata = dev_get_platdata(dev);
+	struct acpi_iort_node *node;
 	struct acpi_iort_smmu *iort_smmu;
 	int ret;
 
+	if (pdata == NULL)
+		return -ENODEV;
+
+	node = pdata->node;
+
 	/* Retrieve SMMU1/2 specific data */
 	iort_smmu = (struct acpi_iort_smmu *)node->node_data;
 
diff --git a/drivers/perf/arm_smmuv3_pmu.c b/drivers/perf/arm_smmuv3_pmu.c
index 74474bb322c3..77fcf5e7413a 100644
--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -747,17 +747,19 @@ static void smmu_pmu_reset(struct smmu_pmu *smmu_pmu)
 
 static void smmu_pmu_get_acpi_options(struct smmu_pmu *smmu_pmu)
 {
-	u32 model;
+	struct iort_smmu_pdata *pdata = dev_get_platdata(smmu_pmu->dev);
 
-	model = *(u32 *)dev_get_platdata(smmu_pmu->dev);
+	if (pdata == NULL)
+		goto done;
 
-	switch (model) {
+	switch (pdata->model) {
 	case IORT_SMMU_V3_PMCG_HISI_HIP08:
 		/* HiSilicon Erratum 162001800 */
 		smmu_pmu->options |= SMMU_PMCG_EVCNTR_RDONLY;
 		break;
 	}
 
+done:
 	dev_notice(smmu_pmu->dev, "option mask 0x%x\n", smmu_pmu->options);
 }
 
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index 1a12baa58e40..678cdf036948 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -15,12 +15,17 @@
 #define IORT_IRQ_TRIGGER_MASK(irq)	((irq >> 32) & 0xffffffffULL)
 
 /*
- * PMCG model identifiers for use in smmu pmu driver. Please note
+ * Model identifiers for use in SMMU drivers. Please note
  * that this is purely for the use of software and has nothing to
  * do with hardware or with IORT specification.
  */
-#define IORT_SMMU_V3_PMCG_GENERIC        0x00000000 /* Generic SMMUv3 PMCG */
-#define IORT_SMMU_V3_PMCG_HISI_HIP08     0x00000001 /* HiSilicon HIP08 PMCG */
+#define IORT_SMMU_GENERIC		0x00000000 /* Generic SMMU */
+#define IORT_SMMU_V3_PMCG_HISI_HIP08	0x00000001 /* HiSilicon HIP08 PMCG */
+
+struct iort_smmu_pdata {
+	struct acpi_iort_node *node;
+	u32 model;
+};
 
 int iort_register_domain_token(int trans_id, phys_addr_t base,
 			       struct fwnode_handle *fw_node);
-- 
2.17.1

