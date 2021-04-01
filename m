Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582CF351796
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbhDARmZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbhDARg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:36:58 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BEFC00F7FE
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:15:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id v23so1169435ple.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v+aoqp7/hh2ZJdg8Bt5Hf7dmndB59spkh4lB3mp0E74=;
        b=kGBK/r8CKBxUNprCLJ6ee9nOvbOqWpDSdZJUuszXHKcioB/BkSJAcMMc8wbwiBeQxg
         EYkP3PZT1RxY88LvRMhINgnkjtqMCFCPwWZdbe7ndIVaihFMZYNBkJBnvCGyob94oQud
         iNf7QlgVJgbXhj1el6Rlsm/nAlXZpyLhiSWfnFMCSFg/SoNZZc8mGvxvB4RFNDprXC73
         QuxrFsIKqb7uxLo/MgrWkrf3whDIrg8LmKPYhyZRGs3QVPGROa/qxdpFzDY0LDPM7i5A
         K/2D9YX8AhClTgoTUKXaMRJyMv2Spq53DRBW0txjxp2rEnnywWOgoReioJW49t5AKzMC
         yiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v+aoqp7/hh2ZJdg8Bt5Hf7dmndB59spkh4lB3mp0E74=;
        b=k9fmeBnHK51NqtOkBqMACXLNZgGYrYMTi3VFPCuqKF09DYjcIFcltWctlfaX9zptt5
         mYJi+xvKVcc5EoJ8Pw9CkUE93qBNZp8bhdH+YCgpZGkkZi8Yt4vHH0i5KVrx5Zg7x74G
         zOwOiL+hECo8JgFnG0d24juuu0fjEOfBy1FnJNPdEM42sOJnBxTGaNQ+U2TLNGkXdCKP
         Yr9dWFELDPv3DzeW8kVYn990kCvuUrzch5x5yn85KXxlng/Vy1AXS9cd4Eqb/iTm1yCq
         5oGAEBGxkCST+T9KaQZT1AXwby+HbhRBL8xrqJzGfvNahg4f+ExyXEW5b5M5OeXAINkH
         CzJQ==
X-Gm-Message-State: AOAM531rrjfEw/mTvV9jt5hTzDxAJLjI6RBqXBG6A5Z7TE1/FMduPfFm
        SWrFVUUJlDLBxVNyNPF4fuDY
X-Google-Smtp-Source: ABdhPJyLl09ogfVFgj/40f2XOlVbEF3wsCwgBy9MwM0lPlcS8zD1vWvy+BWlPcZDVcEBOZFpehentQ==
X-Received: by 2002:a17:903:2490:b029:e6:faf5:86df with SMTP id p16-20020a1709032490b02900e6faf586dfmr8239479plw.69.1617290135384;
        Thu, 01 Apr 2021 08:15:35 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
        by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:15:35 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 3/4] mtd: rawnand: Add support for secure regions in NAND memory
Date:   Thu,  1 Apr 2021 20:45:07 +0530
Message-Id: <20210401151508.143075-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
References: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

The regions are declared using a NAND chip DT property,
"secure-regions". So let's make use of this property in the raw NAND
core and skip access to the secure regions present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/nand_base.c | 107 ++++++++++++++++++++++++++++++-
 include/linux/mtd/rawnand.h      |  14 ++++
 2 files changed, 120 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..c216d3eca915 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,50 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+/**
+ * nand_region_is_secured() - Check if the region is secured
+ * @chip: NAND chip object
+ * @offset: Offset of the region to check
+ * @size: Size of the region to check
+ *
+ * Checks if the region is secured by comparing the offset and size with the
+ * list of secure regions obtained from DT. Returns true if the region is
+ * secured else false.
+ */
+static bool nand_region_is_secured(struct nand_chip *chip, loff_t offset, u64 size)
+{
+	int i;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0; i < chip->nr_secure_regions; i++) {
+		const struct nand_secure_region *region = &chip->secure_regions[i];
+
+		if (offset + size <= region->offset ||
+		    offset >= region->offset + region->size)
+			continue;
+
+		pr_debug("%s: Region 0x%llx - 0x%llx is secured!",
+			 __func__, offset, offset + size);
+
+		return true;
+	}
+
+	return false;
+}
+
 static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 {
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int last_page = ((mtd->erasesize - mtd->writesize) >>
+			 chip->page_shift) & chip->pagemask;
+
 	if (chip->options & NAND_NO_BBM_QUIRK)
 		return 0;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, ofs, last_page))
+		return -EIO;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
@@ -397,6 +436,10 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, to, ops->ooblen))
+		return -EIO;
+
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -565,6 +608,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 	if (!chip->bbt)
 		return 0;
+
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, ofs, 0))
+		return -EIO;
+
 	/* Return info from the table */
 	return nand_isreserved_bbt(chip, ofs);
 }
@@ -3127,6 +3175,10 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	int retry_mode = 0;
 	bool ecc_fail = false;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, from, readlen))
+		return -EIO;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	nand_select_target(chip, chipnr);
 
@@ -3458,6 +3510,10 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, from, readlen))
+		return -EIO;
+
 	stats = mtd->ecc_stats;
 
 	len = mtd_oobavail(mtd, ops);
@@ -3979,6 +4035,10 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, to, writelen))
+		return -EIO;
+
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
@@ -4180,6 +4240,10 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, instr->addr, instr->len))
+		return -EIO;
+
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
@@ -4995,6 +5059,31 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
+static int of_get_nand_secure_regions(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	int nr_elem, i, j;
+
+	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
+	if (!nr_elem)
+		return 0;
+
+	chip->nr_secure_regions = nr_elem / 2;
+	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
+				       GFP_KERNEL);
+	if (!chip->secure_regions)
+		return -ENOMEM;
+
+	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
+		of_property_read_u64_index(dn, "secure-regions", j,
+					   &chip->secure_regions[i].offset);
+		of_property_read_u64_index(dn, "secure-regions", j + 1,
+					   &chip->secure_regions[i].size);
+	}
+
+	return 0;
+}
+
 static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
@@ -5953,6 +6042,16 @@ static int nand_scan_tail(struct nand_chip *chip)
 			goto err_free_interface_config;
 	}
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	ret = of_get_nand_secure_regions(chip);
+	if (ret)
+		goto err_free_interface_config;
+
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
 		return 0;
@@ -5960,10 +6059,13 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/* Build bad block table */
 	ret = nand_create_bbt(chip);
 	if (ret)
-		goto err_free_interface_config;
+		goto err_free_secure_regions;
 
 	return 0;
 
+err_free_secure_regions:
+	kfree(chip->secure_regions);
+
 err_free_interface_config:
 	kfree(chip->best_interface_config);
 
@@ -6051,6 +6153,9 @@ void nand_cleanup(struct nand_chip *chip)
 
 	nanddev_cleanup(&chip->base);
 
+	/* Free secure regions data */
+	kfree(chip->secure_regions);
+
 	/* Free bad block table memory */
 	kfree(chip->bbt);
 	kfree(chip->data_buf);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..17ddc900a1dc 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1036,6 +1036,16 @@ struct nand_manufacturer {
 	void *priv;
 };
 
+/**
+ * struct nand_secure_region - NAND secure region structure
+ * @offset: Offset of the start of the secure region
+ * @size: Size of the secure region
+ */
+struct nand_secure_region {
+	u64 offset;
+	u64 size;
+};
+
 /**
  * struct nand_chip - NAND Private Flash Chip Data
  * @base: Inherit from the generic NAND device
@@ -1086,6 +1096,8 @@ struct nand_manufacturer {
  *          NAND Controller drivers should not modify this value, but they're
  *          allowed to read it.
  * @read_retries: The number of read retry modes supported
+ * @secure_regions: Structure containing the secure regions info
+ * @nr_secure_regions: Number of secure regions
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
@@ -1135,6 +1147,8 @@ struct nand_chip {
 	unsigned int suspended : 1;
 	int cur_cs;
 	int read_retries;
+	struct nand_secure_region *secure_regions;
+	u8 nr_secure_regions;
 
 	/* Externals */
 	struct nand_controller *controller;
-- 
2.25.1

