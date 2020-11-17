Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76B52B6C00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729848AbgKQRjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729733AbgKQRji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:39:38 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828E6C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:39:38 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id js21so845775pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XZq3LdMiBAVThwX/6HfimVVHNbrtDf6lTNLc0V2ON3o=;
        b=eX71zyKqkKwRTekLKKlatG/zA0h7n0Lz4f66OxWEE4W+EqO36iIMrAzOResdDszeJ5
         0S27iAsbzwo5sO5MIA/FyvS8tMZvG3ASfzQvglFNrP9s7CBOXdxe6CDUVEoHxe606AKb
         1M9+1lpHrvf5UIWdeghVNIxmST3gbwMBClRSp5AiqsmFj/vC/bemZdfmOyamcGV0Vcfo
         xnW/VAkXtuSfl6i1y2OfhLG6WCuNqBA9yVmNrrjlBPaZvl5nxTZddG+mki4ZTd/UqY0g
         jR2JsGR1scVkFsdn8T3FzIWHOC6xCkpfRc9QUyM98D402mzfuJX9onyRjt7VpkgqRymV
         gFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XZq3LdMiBAVThwX/6HfimVVHNbrtDf6lTNLc0V2ON3o=;
        b=ZUJPpVgseCmxYJAxes+raXJhrpoa3BbqaC0W0zrgIDIcZARR/1+aQmSk3GWI6RhgHA
         QDC3Em6/8OIw/WOW0Yd8ECxdW+6ulahWS77MNRae464Grvh1cyVrVlqrjc9tr8VTQlVV
         eadfn7g2Agqz4DjbQgg4kKyP9+d1HixU5r71YcKqIFjSkynJHZqTKvioFnfTA6GZn0ay
         0m0PbRoA77oOK1kc2Eoc2/EN+CauT4Y6ZWELdXINrdKrmBHHV65dVaQDWu98V2/nyGMi
         F7Hu0q+kujEXVqgXdLyQEaATo3d0b5b87QNf0JacyedN0InCvH1T27fkmjIjNDgOMP25
         SBpw==
X-Gm-Message-State: AOAM530OQnLUWCxwSZkvjZpW6YLX4/Vnf6yUzhKZSE2CM8gvl6JZV1JM
        igSY9cwHgw5ax8/AfzoirAHh
X-Google-Smtp-Source: ABdhPJyt1IApNTkRHdcNIFUHpXKakkZzF2rgwlpwe4PlGC/z6Bl7Q9KSZ1pJQrf4Ec+k+V4ag58v/Q==
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id d10-20020a170902aa8ab02900d3c9dd77d1mr271360plr.0.1605634777936;
        Tue, 17 Nov 2020 09:39:37 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a21sm1751330pjq.37.2020.11.17.09.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:39:37 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/4] mtd: parsers: Add Qcom SMEM parser
Date:   Tue, 17 Nov 2020 23:09:07 +0530
Message-Id: <20201117173909.23585-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
References: <20201117173909.23585-1-manivannan.sadhasivam@linaro.org>
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
 drivers/mtd/parsers/qcomsmempart.c | 169 +++++++++++++++++++++++++++++
 3 files changed, 178 insertions(+)
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
index 000000000000..d8c2a3fa4dfe
--- /dev/null
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -0,0 +1,169 @@
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
+	u32 offset;
+	u32 length;
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
+	u32 magic1;
+	u32 magic2;
+	u32 version;
+	u32 numparts;
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
+	char *name, *c;
+	int ret, i;
+
+	pr_debug("Parsing partition table info from SMEM\n");
+	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
+	if (IS_ERR(ptable)) {
+		pr_err("Error reading partition table header\n");
+		return PTR_ERR(ptable);
+	}
+
+	/* Verify ptable magic */
+	if (ptable->magic1 != SMEM_FLASH_PART_MAGIC1 ||
+	    ptable->magic2 != SMEM_FLASH_PART_MAGIC2) {
+		pr_err("Partition table magic verification failed\n");
+		return -EINVAL;
+	}
+
+	/* Ensure that # of partitions is less than the max we have allocated */
+	if (ptable->numparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
+		pr_err("Partition numbers exceed the max limit\n");
+		return -EINVAL;
+	}
+
+	/* Find out length of partition data based on table version */
+	if (ptable->version <= SMEM_FLASH_PTABLE_V3) {
+		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V3 *
+			sizeof(struct smem_flash_pentry);
+	} else if (ptable->version == SMEM_FLASH_PTABLE_V4) {
+		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V4 *
+			sizeof(struct smem_flash_pentry);
+	} else {
+		pr_err("Unknown ptable version (%d)", ptable->version);
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
+	parts = kcalloc(ptable->numparts, sizeof(*parts), GFP_KERNEL);
+	if (!parts)
+		return -ENOMEM;
+
+	for (i = 0; i < ptable->numparts; i++) {
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
+		parts[i].offset = pentry->offset * mtd->erasesize;
+		parts[i].mask_flags = pentry->attr;
+		parts[i].size = pentry->length * mtd->erasesize;
+		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
+			 i, pentry->name, pentry->offset, pentry->length,
+			 pentry->attr);
+	}
+
+	pr_debug("SMEM partition table found: ver: %d len: %d\n",
+		 ptable->version, ptable->numparts);
+	*pparts = parts;
+
+	return i;
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
2.17.1

