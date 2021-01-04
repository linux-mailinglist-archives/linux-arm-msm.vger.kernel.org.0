Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487982E8FBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbhADENL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhADENI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:13:08 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F19C06179E
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 20:11:55 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id hk16so9980868pjb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 20:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LtzJNG/ybBQAKeE9SVe1i2pD24AqKDwuHMdBBu5YoUw=;
        b=Pjq/zlDhQU52ec2VtPWznvDEY3x/Pg2EJpOnTPWJua91GPipl2FzaaAqLy6u4hELFm
         u3UilYsYaE1X/pf7JeiG+w0khUQmi0u08V2KFJNOxyCpgyuSmSJ+0MTQKdpAGdE55f7T
         ccHf3NlUWEvU+U0/rNkZxiry2Uf9QkqtPhUATjnFWWgX/POHQR/E1PUTSzy+WkgHhXaF
         atQkAqo3PTWqyjFQJv/ILMRNvtsqc8K+i3Jd298LHDetTeWogt1VJRX3oN5L7LpblFG7
         AJ8mZ4niSwfGaYGiQg2XgopKGxNDeev5bdhfNlotl0tAoZXCrGZa8otC+MAGN3wTUw0g
         R7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LtzJNG/ybBQAKeE9SVe1i2pD24AqKDwuHMdBBu5YoUw=;
        b=SZ68p5TWS9LOcACzwnslzAp3QKujs+RBJWNdp0K34q1i99RNF118+26hFrquljVxUq
         dETmhwqj610uu//SNa1qKSbnKS4edHYcAxfmvZXGXgjpnADhtCAbbWtBVgGhXu0wZY5L
         Ea+SZ/iSxGN3h286Q1fuwbaEbO7hkVk3SdJfJGNSN3b6m9xuYRpj8h7JdzVchPZhF38T
         bcyljvVusq3KP3IlgLMzxY+lVspvtguMQZlwR4ZsbwElPLlU1ebW4OgwCWMCYbXxid7c
         apgVRjuboLhIR/Q3kV7LlIc0863VD7damg+SWu/EVIjnJuRuPdsofnf7Dv6h/o0+vQnj
         fEXg==
X-Gm-Message-State: AOAM532bOQijSsWdckmYPYiDiIcfjDwNmYvbPDVISM53Les437/BOEw/
        K7QkvHcg4cdqO338oM8gWBbW
X-Google-Smtp-Source: ABdhPJxKkCb9ii0QJCo6/tAnzJ9CckUe6NnYMhqJDC3aM5prsjEkCquJldoJd9v+JQgqBrMZZ7z6BQ==
X-Received: by 2002:a17:90a:2e82:: with SMTP id r2mr27192058pjd.46.1609733514616;
        Sun, 03 Jan 2021 20:11:54 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 20:11:54 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/4] mtd: parsers: Add Qcom SMEM parser
Date:   Mon,  4 Jan 2021 09:41:35 +0530
Message-Id: <20210104041137.113075-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

NAND based Qualcomm platforms have the partition table populated in the
Shared Memory (SMEM). Hence, add a parser for parsing the partitions
from it.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/parsers/Kconfig        |   8 ++
 drivers/mtd/parsers/Makefile       |   1 +
 drivers/mtd/parsers/qcomsmempart.c | 170 +++++++++++++++++++++++++++++
 3 files changed, 179 insertions(+)
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index e72354322f62..d90c30229052 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -160,3 +160,11 @@ config MTD_REDBOOT_PARTS_READONLY
 	  'FIS directory' images, enable this option.
 
 endif # MTD_REDBOOT_PARTS
+
+config MTD_QCOMSMEM_PARTS
+	tristate "Qualcomm SMEM NAND flash partition parser"
+	depends on MTD_NAND_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM
+	help
+	  This provides support for parsing partitions from Shared Memory (SMEM)
+	  for NAND flash on Qualcomm platforms.
diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
index b0c5f62f9e85..50eb0b0a2210 100644
--- a/drivers/mtd/parsers/Makefile
+++ b/drivers/mtd/parsers/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
 obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
 obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
 obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
+obj-$(CONFIG_MTD_QCOMSMEM_PARTS)	+= qcomsmempart.o
diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
new file mode 100644
index 000000000000..808cb33d71f8
--- /dev/null
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm SMEM NAND flash partition parser
+ *
+ * Copyright (C) 2020, Linaro Ltd.
+ */
+
+#include <linux/ctype.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+
+#define SMEM_AARM_PARTITION_TABLE	9
+#define SMEM_APPS			0
+
+#define SMEM_FLASH_PART_MAGIC1		0x55ee73aa
+#define SMEM_FLASH_PART_MAGIC2		0xe35ebddb
+#define SMEM_FLASH_PTABLE_V3		3
+#define SMEM_FLASH_PTABLE_V4		4
+#define SMEM_FLASH_PTABLE_MAX_PARTS_V3	16
+#define SMEM_FLASH_PTABLE_MAX_PARTS_V4	48
+#define SMEM_FLASH_PTABLE_HDR_LEN	(4 * sizeof(u32))
+#define SMEM_FLASH_PTABLE_NAME_SIZE	16
+
+/**
+ * struct smem_flash_pentry - SMEM Flash partition entry
+ * @name: Name of the partition
+ * @offset: Offset in blocks
+ * @length: Length of the partition in blocks
+ * @attr: Flags for this partition
+ */
+struct smem_flash_pentry {
+	char name[SMEM_FLASH_PTABLE_NAME_SIZE];
+	__le32 offset;
+	__le32 length;
+	u8 attr;
+} __packed __aligned(4);
+
+/**
+ * struct smem_flash_ptable - SMEM Flash partition table
+ * @magic1: Partition table Magic 1
+ * @magic2: Partition table Magic 2
+ * @version: Partition table version
+ * @numparts: Number of partitions in this ptable
+ * @pentry: Flash partition entries belonging to this ptable
+ */
+struct smem_flash_ptable {
+	__le32 magic1;
+	__le32 magic2;
+	__le32 version;
+	__le32 numparts;
+	struct smem_flash_pentry pentry[SMEM_FLASH_PTABLE_MAX_PARTS_V4];
+} __packed __aligned(4);
+
+static int parse_qcomsmem_part(struct mtd_info *mtd,
+			       const struct mtd_partition **pparts,
+			       struct mtd_part_parser_data *data)
+{
+	struct smem_flash_pentry *pentry;
+	struct smem_flash_ptable *ptable;
+	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
+	struct mtd_partition *parts;
+	int ret, i, numparts;
+	char *name, *c;
+
+	pr_debug("Parsing partition table info from SMEM\n");
+	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
+	if (IS_ERR(ptable)) {
+		pr_err("Error reading partition table header\n");
+		return PTR_ERR(ptable);
+	}
+
+	/* Verify ptable magic */
+	if (le32_to_cpu(ptable->magic1) != SMEM_FLASH_PART_MAGIC1 ||
+	    le32_to_cpu(ptable->magic2) != SMEM_FLASH_PART_MAGIC2) {
+		pr_err("Partition table magic verification failed\n");
+		return -EINVAL;
+	}
+
+	/* Ensure that # of partitions is less than the max we have allocated */
+	numparts = le32_to_cpu(ptable->numparts);
+	if (numparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
+		pr_err("Partition numbers exceed the max limit\n");
+		return -EINVAL;
+	}
+
+	/* Find out length of partition data based on table version */
+	if (le32_to_cpu(ptable->version) <= SMEM_FLASH_PTABLE_V3) {
+		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V3 *
+			sizeof(struct smem_flash_pentry);
+	} else if (le32_to_cpu(ptable->version) == SMEM_FLASH_PTABLE_V4) {
+		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V4 *
+			sizeof(struct smem_flash_pentry);
+	} else {
+		pr_err("Unknown ptable version (%d)", le32_to_cpu(ptable->version));
+		return -EINVAL;
+	}
+
+	/*
+	 * Now that the partition table header has been parsed, verified
+	 * and the length of the partition table calculated, read the
+	 * complete partition table
+	 */
+	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
+	if (IS_ERR_OR_NULL(ptable)) {
+		pr_err("Error reading partition table\n");
+		return PTR_ERR(ptable);
+	}
+
+	parts = kcalloc(numparts, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0; i < numparts; i++) {
+		pentry = &ptable->pentry[i];
+		if (pentry->name[0] == '\0')
+			continue;
+
+		name = kstrdup(pentry->name, GFP_KERNEL);
+		if (!name) {
+			ret = -ENOMEM;
+			goto out_free_parts;
+		}
+
+		/* Convert name to lower case */
+		for (c = name; *c != '\0'; c++)
+			*c = tolower(*c);
+
+		parts[i].name = name;
+		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
+		parts[i].mask_flags = pentry->attr;
+		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
+		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
+			 i, pentry->name, le32_to_cpu(pentry->offset),
+			 le32_to_cpu(pentry->length), pentry->attr);
+	}
+
+	pr_debug("SMEM partition table found: ver: %d len: %d\n",
+		 le32_to_cpu(ptable->version), numparts);
+	*pparts = parts;
+
+	return numparts;
+
+out_free_parts:
+	while (--i >= 0)
+		kfree(parts[i].name);
+	kfree(parts);
+	*pparts = NULL;
+
+	return ret;
+}
+
+static const struct of_device_id qcomsmem_of_match_table[] = {
+	{ .compatible = "qcom,smem-part" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
+
+static struct mtd_part_parser mtd_parser_qcomsmem = {
+	.parse_fn = parse_qcomsmem_part,
+	.name = "qcomsmem",
+	.of_match_table = qcomsmem_of_match_table,
+};
+module_mtd_part_parser(mtd_parser_qcomsmem);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm SMEM NAND flash partition parser");
-- 
2.25.1

