Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6120D33F048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCQM0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 08:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhCQMZn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 08:25:43 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E44CC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:25:43 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso1243831pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 05:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z9Fk1ZVyrYehdc+R8QhCU6Tgcb/96NRNVoZXBJNxJZ8=;
        b=pcy3PYxfgPaq0YtZWW2OkwIzM8SuhFe9vOBN5vfVaDRUp0VgoDES+8wSprKDSPzux9
         qNov6w++VBsZxEAU0ZzHqqQnKye9l1D1PMWR9MYBcjr7j10pjK2EGOnlrlCr3qVwFc4x
         W5c5uWhODUIQ2jGxyppxZgYhw3sGXbmJhhEXb0JkEGiLY8TelZeSq42NdBQhQlIX4wI6
         +aEOh3ccQEqek4KpkY8/DpFI+wi24QPqQRX6otiryKQ5hzUycfr0skxOSP0vGAVAO+DV
         k5rStb/r2UDetDcm8VO5dTNCcGmRvBKkplmQlki69cwY3PQFRvkv940t3exHyutxvdv7
         9cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z9Fk1ZVyrYehdc+R8QhCU6Tgcb/96NRNVoZXBJNxJZ8=;
        b=MN5ob/RtJf/hGunGj47H/nopiW1CYzOLc0viblzF4PbGCl8vDDaF0R/g3nilcYK+LR
         qYfIokcSYjK1AM5j+KBySus9ukHG9WT9jz4lcxKvNP7ahrZNDdoT3P6VI0WZdUqRM4oA
         krPQGKZlap8tlumPz52JeGd18nsiqqy02o68P+bwc+5i2pXZF/GtkpdbYBMc4Rrr32rU
         3ZLrlAFlR4qxXPeSiLq+jbge+a+1sI3DAqygjE81PTnLyV++5mCK2Z4dsv0UcAiEnp63
         OwCtIjCAH1IjKXDNr12ZzQo5pQvBVqNrhDi10KywGZjRe4VK6l0t/IWSzxn3gW8nPSNi
         QVtw==
X-Gm-Message-State: AOAM5320u3erwpUIcDiPkhW6ZN6iyPufT96HEnUTwJb/foSMnDG+Z7gI
        M9yiE3rVhZidz2eluW3PJMkn
X-Google-Smtp-Source: ABdhPJzlFdp2J54cSveK57XVm7JnmcuKR1Km9zMVFnyzTP7SNgoNE20RVy00UUAojZimSTzwdc7xRQ==
X-Received: by 2002:a17:90a:550f:: with SMTP id b15mr4490615pji.102.1615983942618;
        Wed, 17 Mar 2021 05:25:42 -0700 (PDT)
Received: from localhost.localdomain ([103.66.79.72])
        by smtp.gmail.com with ESMTPSA id y23sm19285730pfo.50.2021.03.17.05.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 05:25:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 3/3] mtd: rawnand: Add support for secure regions in NAND memory
Date:   Wed, 17 Mar 2021 17:55:13 +0530
Message-Id: <20210317122513.42369-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
References: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
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
"secure-regions". So let's make use of this property in the nand core
and skip access to the secure regions present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/nand_base.c | 105 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |   4 ++
 2 files changed, 109 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..c85cbd491f05 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,41 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+/**
+ * nand_check_sec_region() - Check if the region is secured
+ * @chip: NAND chip object
+ * @offset: Offset of the region to check
+ *
+ * Checks if the region is secured by comparing the offset with the list of
+ * secure regions obtained from DT. Returns -EIO if the region is secured
+ * else 0.
+ */
+static int nand_check_sec_region(struct nand_chip *chip, loff_t offset)
+{
+	int i, j;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0, j = 0; i < chip->nr_sec_regions; i++, j += 2) {
+		if (offset >= chip->sec_regions[j] &&
+		    (offset <= chip->sec_regions[j] + chip->sec_regions[j + 1]))
+			return -EIO;
+	}
+
+	return 0;
+}
+
 static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
 {
+	int ret;
+
 	if (chip->options & NAND_NO_BBM_QUIRK)
 		return 0;
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, ofs);
+	if (ret)
+		return ret;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
@@ -397,6 +427,11 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, to);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -565,6 +600,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 	if (!chip->bbt)
 		return 0;
+
+	/* Check if the region is secured */
+	if (nand_check_sec_region(chip, ofs))
+		return -EIO;
+
 	/* Return info from the table */
 	return nand_isreserved_bbt(chip, ofs);
 }
@@ -2737,6 +2777,11 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
 	uint8_t *ecc_code = chip->ecc.code_buf;
 	unsigned int max_bitflips = 0;
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, ((loff_t)page << chip->page_shift));
+	if (ret)
+		return ret;
+
 	chip->ecc.read_page_raw(chip, buf, 1, page);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -3127,6 +3172,11 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	int retry_mode = 0;
 	bool ecc_fail = false;
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, from);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	nand_select_target(chip, chipnr);
 
@@ -3458,6 +3508,11 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, from);
+	if (ret)
+		return ret;
+
 	stats = mtd->ecc_stats;
 
 	len = mtd_oobavail(mtd, ops);
@@ -3709,6 +3764,11 @@ static int nand_write_page_swecc(struct nand_chip *chip, const uint8_t *buf,
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	const uint8_t *p = buf;
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, ((loff_t)page << chip->page_shift));
+	if (ret)
+		return ret;
+
 	/* Software ECC calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(chip, p, &ecc_calc[i]);
@@ -3979,6 +4039,11 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, to);
+	if (ret)
+		return ret;
+
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
@@ -4180,6 +4245,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
+	/* Check if the region is secured */
+	ret = nand_check_sec_region(chip, instr->addr);
+	if (ret)
+		return ret;
+
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
@@ -4995,10 +5065,32 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 
+static int of_get_nand_secure_regions(struct nand_chip *chip)
+{
+	struct device_node *dn = nand_get_flash_node(chip);
+	struct property *prop;
+	int length, nr_elem;
+
+	prop = of_find_property(dn, "secure-regions", &length);
+	if (prop) {
+		nr_elem = length / sizeof(u64);
+		chip->nr_sec_regions = nr_elem / 2;
+
+		chip->sec_regions = kcalloc(nr_elem, sizeof(u32), GFP_KERNEL);
+		if (!chip->sec_regions)
+			return -ENOMEM;
+
+		of_property_read_u64_array(dn, "secure-regions", chip->sec_regions, nr_elem);
+	}
+
+	return 0;
+}
+
 static int rawnand_dt_init(struct nand_chip *chip)
 {
 	struct nand_device *nand = mtd_to_nanddev(nand_to_mtd(chip));
 	struct device_node *dn = nand_get_flash_node(chip);
+	int ret;
 
 	if (!dn)
 		return 0;
@@ -5015,6 +5107,16 @@ static int rawnand_dt_init(struct nand_chip *chip)
 	of_get_nand_ecc_user_config(nand);
 	of_get_nand_ecc_legacy_user_config(chip);
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	ret = of_get_nand_secure_regions(chip);
+	if (!ret)
+		return ret;
+
 	/*
 	 * If neither the user nor the NAND controller have requested a specific
 	 * ECC engine type, we will default to NAND_ECC_ENGINE_TYPE_ON_HOST.
@@ -6068,6 +6170,9 @@ void nand_cleanup(struct nand_chip *chip)
 	/* Free manufacturer priv data. */
 	nand_manufacturer_cleanup(chip);
 
+	/* Free secure regions data */
+	kfree(chip->sec_regions);
+
 	/* Free controller specific allocations after chip identification */
 	nand_detach(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..5ae77ecf41f3 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1086,6 +1086,8 @@ struct nand_manufacturer {
  *          NAND Controller drivers should not modify this value, but they're
  *          allowed to read it.
  * @read_retries: The number of read retry modes supported
+ * @sec_regions: Array representing the secure regions
+ * @nr_sec_regions: Number of secure regions
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
@@ -1135,6 +1137,8 @@ struct nand_chip {
 	unsigned int suspended : 1;
 	int cur_cs;
 	int read_retries;
+	u64 *sec_regions;
+	u8 nr_sec_regions;
 
 	/* Externals */
 	struct nand_controller *controller;
-- 
2.25.1

