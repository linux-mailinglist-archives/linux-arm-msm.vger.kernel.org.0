Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E491441E0F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:19:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350599AbhI3SVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350697AbhI3SVK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:21:10 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEF2C06176E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:26 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id z11so8456775oih.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aMZ/AgEZ1ehZjKbP09jYtyKIb6Gw+NFrOG75sO7xPMo=;
        b=mUzV8g4WsDukzCBAM2zAIdrRNoW3f2bh9t2weapKMrZBSWoPTYIEjpgwrOKMTdHUSY
         JAld0gTWQ79qg6qmEpD1Uli1NDcLE3lpmNcnCz6HV38OAhrhFkVSx8CGhZJzrvSZ71lH
         BLz29v7xFHMlWYDP3oYf4TRbTbNl+x1YSqKgJhuDLj3oxCvuCZNhKHGJ1x6stRB9CLAy
         sTd30Cf42RMMo6Je/wxxnLjbatGDzbfQTfRP0GwKYD3snnsBuuoNXzBVdlI9SRHo4El8
         ZD3jd4fNCCfjN4Zji8MGFmIRyHCS9C2i3CyZgQhiidBTqst72UEqFzb2H9f5nxiHGSYf
         zzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aMZ/AgEZ1ehZjKbP09jYtyKIb6Gw+NFrOG75sO7xPMo=;
        b=cZVcl+f3X9NcXWnLaYUg4O/vuM69OUC+KcvRQn/Ju4g/h3TodiU6WveWRRpis52qMA
         SCQnKuVOeF3P0kMmpp/wF2D6cY+wSJFa2GnjovgB5axMu3lUb3s3XQwFnDj9Wf7+rRw4
         KEU+PaoozrL0g401gCf0cpfSWDVHggfNV38v8+aDEz7k8eqhyAIFA9mrcYGhlNSxaLSD
         mlfUWdrL+539q3OCLy4vxX6L+PTNtvsTgvFiDMMCjrLe9BWWsOp1HgLmWpHjMIdzDrvb
         Axd3Y68X2UULau9RDDCQ21TRKBJOrFGjA/nai7CSTgM90nKNkQdRJxqMo78V/YSWAJsL
         o/bw==
X-Gm-Message-State: AOAM530aphOrv9mp6o7XpCmxpmVOCxAZGTjnbPUmyQaXl6t0SKp8vAdX
        sWPlF4N0FjADl4gH4on9YdfYXw==
X-Google-Smtp-Source: ABdhPJw3GFkyUSmTZHQf35l8y7LLhkvY72sCC0293fdBwTg4PUYWNUe/OtRDUsEfWf2wGafDK4uSwQ==
X-Received: by 2002:a05:6808:256:: with SMTP id m22mr545295oie.150.1633025966319;
        Thu, 30 Sep 2021 11:19:26 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k6sm727416otf.80.2021.09.30.11.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 11:19:25 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chris Lew <clew@codeaurora.org>,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH v2 3/4] soc: qcom: smem: Support reserved-memory description
Date:   Thu, 30 Sep 2021 11:21:10 -0700
Message-Id: <20210930182111.57353-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Practically all modern Qualcomm platforms has a single reserved-memory
region for SMEM. So rather than having to describe SMEM in the form of a
node with a reference to a reserved-memory node, allow the SMEM device
to be instantiated directly from the reserved-memory node.

The current means of falling back to dereferencing the "memory-region"
is kept as a fallback, if it's determined that the SMEM node is a
reserved-memory node.

The "qcom,smem" compatible is added to the reserved_mem_matches list, to
allow the reserved-memory device to be probed.

In order to retain the readability of the code, the resolution of
resources is split from the actual ioremapping.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/of/platform.c   |  1 +
 drivers/soc/qcom/smem.c | 57 ++++++++++++++++++++++++++++-------------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 32d5ff8df747..07813fb1ef37 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -505,6 +505,7 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
 static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,rmtfs-mem" },
 	{ .compatible = "qcom,cmd-db" },
+	{ .compatible = "qcom,smem" },
 	{ .compatible = "ramoops" },
 	{ .compatible = "nvmem-rmem" },
 	{}
diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 4fb5aeeb0843..c7e519bfdc8a 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
@@ -240,7 +241,7 @@ static const u8 SMEM_INFO_MAGIC[] = { 0x53, 0x49, 0x49, 0x49 }; /* SIII */
  * @size:	size of the memory region
  */
 struct smem_region {
-	u32 aux_base;
+	phys_addr_t aux_base;
 	void __iomem *virt_base;
 	size_t size;
 };
@@ -499,7 +500,7 @@ static void *qcom_smem_get_global(struct qcom_smem *smem,
 	for (i = 0; i < smem->num_regions; i++) {
 		region = &smem->regions[i];
 
-		if (region->aux_base == aux_base || !aux_base) {
+		if ((u32)region->aux_base == aux_base || !aux_base) {
 			if (size != NULL)
 				*size = le32_to_cpu(entry->size);
 			return region->virt_base + le32_to_cpu(entry->offset);
@@ -664,7 +665,7 @@ phys_addr_t qcom_smem_virt_to_phys(void *p)
 		if (p < region->virt_base + region->size) {
 			u64 offset = p - region->virt_base;
 
-			return (phys_addr_t)region->aux_base + offset;
+			return region->aux_base + offset;
 		}
 	}
 
@@ -863,12 +864,12 @@ qcom_smem_enumerate_partitions(struct qcom_smem *smem, u16 local_host)
 	return 0;
 }
 
-static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
-				const char *name, int i)
+static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
+				 struct smem_region *region)
 {
+	struct device *dev = smem->dev;
 	struct device_node *np;
 	struct resource r;
-	resource_size_t size;
 	int ret;
 
 	np = of_parse_phandle(dev->of_node, name, 0);
@@ -881,13 +882,9 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
 	of_node_put(np);
 	if (ret)
 		return ret;
-	size = resource_size(&r);
 
-	smem->regions[i].virt_base = devm_ioremap_wc(dev, r.start, size);
-	if (!smem->regions[i].virt_base)
-		return -ENOMEM;
-	smem->regions[i].aux_base = (u32)r.start;
-	smem->regions[i].size = size;
+	region->aux_base = r.start;
+	region->size = resource_size(&r);
 
 	return 0;
 }
@@ -895,12 +892,14 @@ static int qcom_smem_map_memory(struct qcom_smem *smem, struct device *dev,
 static int qcom_smem_probe(struct platform_device *pdev)
 {
 	struct smem_header *header;
+	struct reserved_mem *rmem;
 	struct qcom_smem *smem;
 	size_t array_size;
 	int num_regions;
 	int hwlock_id;
 	u32 version;
 	int ret;
+	int i;
 
 	num_regions = 1;
 	if (of_find_property(pdev->dev.of_node, "qcom,rpm-msg-ram", NULL))
@@ -914,13 +913,35 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	smem->dev = &pdev->dev;
 	smem->num_regions = num_regions;
 
-	ret = qcom_smem_map_memory(smem, &pdev->dev, "memory-region", 0);
-	if (ret)
-		return ret;
+	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
+	if (rmem) {
+		smem->regions[0].aux_base = rmem->base;
+		smem->regions[0].size = rmem->size;
+	} else {
+		/*
+		 * Fall back to the memory-region reference, if we're not a
+		 * reserved-memory node.
+		 */
+		ret = qcom_smem_resolve_mem(smem, "memory-region", &smem->regions[0]);
+		if (ret)
+			return ret;
+	}
 
-	if (num_regions > 1 && (ret = qcom_smem_map_memory(smem, &pdev->dev,
-					"qcom,rpm-msg-ram", 1)))
-		return ret;
+	if (num_regions > 1) {
+		ret = qcom_smem_resolve_mem(smem, "qcom,rpm-msg-ram", &smem->regions[1]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < num_regions; i++) {
+		smem->regions[i].virt_base = devm_ioremap_wc(&pdev->dev,
+							     smem->regions[i].aux_base,
+							     smem->regions[i].size);
+		if (!smem->regions[i].virt_base) {
+			dev_err(&pdev->dev, "failed to remap %pa\n", &smem->regions[i].aux_base);
+			return -ENOMEM;
+		}
+	}
 
 	header = smem->regions[0].virt_base;
 	if (le32_to_cpu(header->initialized) != 1 ||
-- 
2.29.2

