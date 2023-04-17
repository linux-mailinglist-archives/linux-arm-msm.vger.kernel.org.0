Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25DC76E4A10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 15:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbjDQNiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 09:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjDQNiL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 09:38:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06B137DA7
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:37:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2a8b766322bso13431901fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 06:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681738673; x=1684330673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=orKyQ+5xycM5jIDwpzyxBulKMAb91OuxkIA/XjFytMY=;
        b=bZaiLZV14CYwzHPbV9ecmLPy0qhBnpsd9Skky6Wi0gAfs37qeCpJ8bsu5dqL38pzLO
         oeaSqdanU3i3Jly/yqF+1V7BivVGFuFEeBM84IOKGYv4XmHncBOpCWAzJwOwbtXJ42H7
         +mq1pHORWDZ5zVr3gaksWbvffZhQDGIgpDBGhL1U+tIssG53nEuWfoqPp+cWbxnayjcf
         JVqLrurhM1y7Lfn9hyxRx9dGK6qQ1HS7DljB7KzhTNUiyfsHLqtKU66ijVUffcC0L6LI
         aqQFA5alo2eYgxvhartVRnSw5wIwZ8E7LGUWQ2+bPzULICxoXW/VgiqS1m2dpdR19BDY
         9z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681738673; x=1684330673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orKyQ+5xycM5jIDwpzyxBulKMAb91OuxkIA/XjFytMY=;
        b=LjDG28IP0C6SOZRJqmQZrrbulBT9077DADp+4wCANFUJwhL1wYVlK+cqWWJeJXfoLs
         tWAGr2n+8zP5eStH1hV2I4CdqYxr2eUHD6VQolo+LAWSRdve+K/Xr0UAs0iH7athpROs
         hNrxM9LM1V9BV1Y+vvA155jkJBJjNhBAWuRWeYK/VIociRZaFBtQxRjyZ16ehMu7376Y
         gC8dthn6/mykvLn+d2x+bLeAv/Ty3TeEqMYnuJ5OACGPEGAohObdV2jU/8O9TQEeSke8
         xIJ9BJP9quHSDWQsJWniHc6s4/J/+EgHjdl7jOmLFp0AiLxABClAEI5bbZizuvYm6Nlc
         bexw==
X-Gm-Message-State: AAQBX9c1yBDeqDptY0IZh+diejV8mQcsDNP4HtWY3JBYeBahmNO4ohBn
        OeC9tquN2qE3RqnoiI4xPYg=
X-Google-Smtp-Source: AKy350YHYUa0TQhTJg50SJOu7ThDROh/FaB2/PO3UXQ0QV6AYJM3VWbathf/A9cx9Dv5rB+so/nNRg==
X-Received: by 2002:ac2:560e:0:b0:4cc:5e3a:dd82 with SMTP id v14-20020ac2560e000000b004cc5e3add82mr1763743lfd.58.1681738673088;
        Mon, 17 Apr 2023 06:37:53 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id g22-20020a19ee16000000b0049ad2619becsm2054520lfb.131.2023.04.17.06.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:37:52 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: parsers: qcom: deal with partitions names on Netgear WAX218
Date:   Mon, 17 Apr 2023 15:37:19 +0200
Message-Id: <20230417133719.16592-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Netgear WAX218 has two similar partitions: "rootfs" and "rootfs_1". They
both contain device firmware (kernel + rootfs). Bootloader chooses the
one to boot from depending on the "active_fw" variable.

The whole mechanism is used for safe firmware upgrades.

Sadly original bootloader on this device doesn't let know what firmware
it has booted.

To run system reliably we need to know which kernel has been booted and
mount proper rootfs accordingly. This patch registers currently used
partition using the "firmware" name.

It isn't clear how many devices will need this so just check for a
WAX218 compatible string for now.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 92 +++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 4311b89d8df0..352fb153745c 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -54,6 +54,69 @@ struct smem_flash_ptable {
 	struct smem_flash_pentry pentry[SMEM_FLASH_PTABLE_MAX_PARTS_V4];
 } __packed __aligned(4);
 
+/**
+ * parse_qcomsmem_get_active_fw - get active firmware index
+ *
+ * Some devices have active and backup/fallback firmwares. This function returns index of the active
+ * one. It's useful for registering MTD partitions using clear names.
+ */
+static int parse_qcomsmem_get_active_fw(struct mtd_info *mtd, struct smem_flash_ptable *ptable)
+{
+	bool found = false;
+	size_t offset;
+	size_t bytes;
+	size_t size;
+	char *buf;
+	char *var;
+	int err;
+	int i;
+
+	if (!of_machine_is_compatible("netgear,wax218"))
+		return -EOPNOTSUPP;
+
+	/* Find partition with environment data */
+
+	for (i = 0; i < le32_to_cpu(ptable->numparts); i++) {
+		struct smem_flash_pentry *pentry = &ptable->pentry[i];
+
+		if (!strcmp(pentry->name, "0:APPSBLENV")) {
+			offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
+			size = le32_to_cpu(pentry->length) * mtd->erasesize;
+			found = true;
+			break;
+		}
+	}
+	if (!found)
+		return -ENOENT;
+
+	/* Read it */
+
+	buf = kcalloc(1, size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	err = mtd_read(mtd, offset, size, &bytes, buf);
+	if ((err && !mtd_is_bitflip(err)) || bytes != size) {
+		pr_err("Failed to read environment\n");
+		return -EIO;
+	}
+
+	/* Find & parse entry with active firmware index */
+
+	for (var = buf + 4; var < buf + size && *var; var += strlen(var) + 1) {
+		const char *prefix = "active_fw=";
+		unsigned long idx;
+
+		if (strstarts(var, prefix)) {
+			err = kstrtol(var + strlen(prefix), 0, &idx);
+
+			return err ? err : idx;
+		}
+	}
+
+	return -ENOENT;
+}
+
 static int parse_qcomsmem_part(struct mtd_info *mtd,
 			       const struct mtd_partition **pparts,
 			       struct mtd_part_parser_data *data)
@@ -64,6 +127,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	struct smem_flash_ptable *ptable;
 	struct mtd_partition *parts;
 	char *name, *c;
+	int active_fw;
+	int fw_idx;
 
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
 			&& mtd->type == MTD_NORFLASH) {
@@ -123,24 +188,35 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 			numparts++;
 	}
 
+	active_fw = parse_qcomsmem_get_active_fw(mtd, ptable);
+
 	parts = kcalloc(numparts, sizeof(*parts), GFP_KERNEL);
 	if (!parts)
 		return -ENOMEM;
 
+	fw_idx = -1;
 	for (i = 0, j = 0; i < tmpparts; i++) {
 		pentry = &ptable->pentry[i];
 		if (pentry->name[0] == '\0')
 			continue;
 
-		name = kstrdup(pentry->name, GFP_KERNEL);
-		if (!name) {
-			ret = -ENOMEM;
-			goto out_free_parts;
-		}
+		if (active_fw >= 0 && strstarts(pentry->name, "rootfs")) {
+			name = kstrdup(++fw_idx == active_fw ? "firmware" : "backup", GFP_KERNEL);
+			if (!name) {
+				ret = -ENOMEM;
+				goto out_free_parts;
+			}
+		} else {
+			name = kstrdup(pentry->name, GFP_KERNEL);
+			if (!name) {
+				ret = -ENOMEM;
+				goto out_free_parts;
+			}
 
-		/* Convert name to lower case */
-		for (c = name; *c != '\0'; c++)
-			*c = tolower(*c);
+			/* Convert name to lower case */
+			for (c = name; *c != '\0'; c++)
+				*c = tolower(*c);
+		}
 
 		parts[j].name = name;
 		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
-- 
2.34.1

