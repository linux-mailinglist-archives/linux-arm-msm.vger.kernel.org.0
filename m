Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62B534206A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 16:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhCSPBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 11:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhCSPAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 11:00:43 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F150C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:43 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id m3so3849946pga.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Mar 2021 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fmtK1MM67niOw8YSNL7HrH7t8pie08ljvyp28iFoaR4=;
        b=wIFxEL3S1U4oGGMe68lLz3PrqemfiHQfCvYTE/d9e7Tg5uGaeoOwC4TFhgfzXzfRSh
         D1FKPesmsULz9lgj27hrDdxKUSvXkg1vVZjH+3N00U1E+RQ7iom0gbWiGRlhdyxHvMIb
         mlMrVf7CaPZ39gjTl7LGwGVgJkOJZyV25myI33XlH3cxmdY4ClO8wm/vFRrbPrT77wpc
         j7o3BWjtDG+I7sqAgKU5zP7hUYCEq81GWg8LGX2Wtx8TAF/zTN3f5QySxi+/B/lYVKXY
         RYwUwPQJJTkP7SfATvz7trRDCm4psH0eMI/qubc5UHrOwZZ0y4rTHQDdhL12DvqlWsXa
         gxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fmtK1MM67niOw8YSNL7HrH7t8pie08ljvyp28iFoaR4=;
        b=omJSc3xonE8FhPGud0gttWLCUIJ2fbgWjoOkb4rAoCWhbODWF3t+QabZVhaHo648AX
         pRpsAtuGtyVg6EW5s5/YJMj65KSmIx1OcMAJZqABkAoDnb3bCIue3h+Lu/hizXAB1kqZ
         iHc0iYkirT05M0xHOnEqCn7HjJo1dYE1PViv2xnBVPPW4YxHpkLiGxWYpYnxlupy7XM6
         lc/0vvrnLjFwsmQwlIlOeY+IrP2fHZkIsho+TC13lijzKfmx4E++x+ZYy9/GazGmZJBC
         LQA0B4D2znmv00gQn4wrfFWsv6qQzwaIZeCEzUs0OrMVBVKGeSVVZClZrkieF4imeqLI
         AqAQ==
X-Gm-Message-State: AOAM531OkAA4edfHFIo/853Q2fWzppWYlRSIqxm4j9yFAAUKDxvTA0PE
        Ix0RaWVEhnIuvHe8ceIN2Jln
X-Google-Smtp-Source: ABdhPJwwo6AcBYUiI7ObGm2uEAnC0dK0I6xmJapU/c/V0xYyZduEQSx1y05lVWJ9dTzXbbxwtSy1MA==
X-Received: by 2002:a63:e715:: with SMTP id b21mr11629664pgi.300.1616166042502;
        Fri, 19 Mar 2021 08:00:42 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:387:dba9:92f4:36c7:1aec:59de])
        by smtp.gmail.com with ESMTPSA id h19sm6092345pfc.172.2021.03.19.08.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 08:00:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 3/3] mtd: rawnand: Add support for secure regions in NAND memory
Date:   Fri, 19 Mar 2021 20:30:10 +0530
Message-Id: <20210319150010.32122-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
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
 drivers/mtd/nand/raw/nand_base.c | 111 +++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h      |   4 ++
 2 files changed, 115 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index c33fa1b1847f..479a79e682cd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -278,11 +278,47 @@ static int nand_block_bad(struct nand_chip *chip, loff_t ofs)
 	return 0;
 }
 
+/**
+ * nand_check_secure_region() - Check if the region is secured
+ * @chip: NAND chip object
+ * @offset: Offset of the region to check
+ * @size: Size of the region to check
+ *
+ * Checks if the region is secured by comparing the offset and size with the
+ * list of secure regions obtained from DT. Returns -EIO if the region is
+ * secured else 0.
+ */
+static int nand_check_secure_region(struct nand_chip *chip, loff_t offset, u64 size)
+{
+	int i, j;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0, j = 0; i < chip->nr_secure_regions; i++, j += 2) {
+		/* First compare the start offset */
+		if (offset >= chip->secure_regions[j] &&
+		    (offset < chip->secure_regions[j] + chip->secure_regions[j + 1]))
+			return -EIO;
+		/* ...then offset + size */
+		else if (offset < chip->secure_regions[i] &&
+			 (offset + size) >= chip->secure_regions[i])
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
+	ret = nand_check_secure_region(chip, ofs, 0);
+	if (ret)
+		return ret;
+
 	if (chip->legacy.block_bad)
 		return chip->legacy.block_bad(chip, ofs);
 
@@ -397,6 +433,11 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, to, ops->ooblen);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(to >> chip->chip_shift);
 
 	/*
@@ -565,6 +606,11 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 
 	if (!chip->bbt)
 		return 0;
+
+	/* Check if the region is secured */
+	if (nand_check_secure_region(chip, ofs, 0))
+		return -EIO;
+
 	/* Return info from the table */
 	return nand_isreserved_bbt(chip, ofs);
 }
@@ -2737,6 +2783,11 @@ static int nand_read_page_swecc(struct nand_chip *chip, uint8_t *buf,
 	uint8_t *ecc_code = chip->ecc.code_buf;
 	unsigned int max_bitflips = 0;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
+	if (ret)
+		return ret;
+
 	chip->ecc.read_page_raw(chip, buf, 1, page);
 
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
@@ -3127,6 +3178,11 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	int retry_mode = 0;
 	bool ecc_fail = false;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, from, readlen);
+	if (ret)
+		return ret;
+
 	chipnr = (int)(from >> chip->chip_shift);
 	nand_select_target(chip, chipnr);
 
@@ -3458,6 +3514,11 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	pr_debug("%s: from = 0x%08Lx, len = %i\n",
 			__func__, (unsigned long long)from, readlen);
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, from, readlen);
+	if (ret)
+		return ret;
+
 	stats = mtd->ecc_stats;
 
 	len = mtd_oobavail(mtd, ops);
@@ -3709,6 +3770,11 @@ static int nand_write_page_swecc(struct nand_chip *chip, const uint8_t *buf,
 	uint8_t *ecc_calc = chip->ecc.calc_buf;
 	const uint8_t *p = buf;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, ((loff_t)page << chip->page_shift), 0);
+	if (ret)
+		return ret;
+
 	/* Software ECC calculation */
 	for (i = 0; eccsteps; eccsteps--, i += eccbytes, p += eccsize)
 		chip->ecc.calculate(chip, p, &ecc_calc[i]);
@@ -3979,6 +4045,11 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		return -EINVAL;
 	}
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, to, writelen);
+	if (ret)
+		return ret;
+
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
@@ -4180,6 +4251,11 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
+	/* Check if the region is secured */
+	ret = nand_check_secure_region(chip, instr->addr, instr->len);
+	if (ret)
+		return ret;
+
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
@@ -4995,10 +5071,32 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
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
+		chip->nr_secure_regions = nr_elem / 2;
+
+		chip->secure_regions = kcalloc(nr_elem, sizeof(*chip->secure_regions), GFP_KERNEL);
+		if (!chip->secure_regions)
+			return -ENOMEM;
+
+		of_property_read_u64_array(dn, "secure-regions", chip->secure_regions, nr_elem);
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
@@ -5015,6 +5113,16 @@ static int rawnand_dt_init(struct nand_chip *chip)
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
@@ -6068,6 +6176,9 @@ void nand_cleanup(struct nand_chip *chip)
 	/* Free manufacturer priv data. */
 	nand_manufacturer_cleanup(chip);
 
+	/* Free secure regions data */
+	kfree(chip->secure_regions);
+
 	/* Free controller specific allocations after chip identification */
 	nand_detach(chip);
 
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..d385c4fe8b0f 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1086,6 +1086,8 @@ struct nand_manufacturer {
  *          NAND Controller drivers should not modify this value, but they're
  *          allowed to read it.
  * @read_retries: The number of read retry modes supported
+ * @secure_regions: Array representing the secure regions
+ * @nr_secure_regions: Number of secure regions
  * @controller: The hardware controller	structure which is shared among multiple
  *              independent devices
  * @ecc: The ECC controller structure
@@ -1135,6 +1137,8 @@ struct nand_chip {
 	unsigned int suspended : 1;
 	int cur_cs;
 	int read_retries;
+	u64 *secure_regions;
+	u8 nr_secure_regions;
 
 	/* Externals */
 	struct nand_controller *controller;
-- 
2.25.1

