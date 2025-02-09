Return-Path: <linux-arm-msm+bounces-47323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28589A2DEA6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:55:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2646164FDC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865AA17A5A4;
	Sun,  9 Feb 2025 14:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9SoOJ2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C37D13AA31;
	Sun,  9 Feb 2025 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739112914; cv=none; b=jOuTNYU1Dv+cHWVjPJmmjJzAHA2X/f4tvGHthKsablNWwotti+GxZxQTyuKqvs7NCqDPtGq5LLE5Jh8OCUIVcCBxv6N/QgYywl08lZykHwYkfjAGX+GjTSIg2M56mvq7yP6/RXRWLjAmdV3LT9QdpoJFm8PrPbscFJXx0q08XsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739112914; c=relaxed/simple;
	bh=k3txjtZx9ekcvt6SENF5b58wE9f6OfkDAQXrlFXv3cs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7LjvmdRkSKt9vZdIpl+X++Cdk6FSjfSmmsxVZNZ7pmmt5n3Pc9OSvVU0ubHZTVpxU+DMoZHOf3mwqC407vh0CFW5e+tbQhsufNXcUflKbB9/gDlHZKvlgexwto4vxfr5C3v/sHPYePjBXyEvLQ29Ka6iEsrmH64+R+NtedB8gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9SoOJ2x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394036c0efso1546925e9.2;
        Sun, 09 Feb 2025 06:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739112911; x=1739717711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VR6UdNPUPJ42D/VBzpeWAAtAvkLAE7xD5d1I3/gJKTc=;
        b=W9SoOJ2x2SGXwB40g3+hXfVyyiJICJfZrcuP5ahKoiEZ9fhSvZsMDHcGuwAmhxGS07
         DZSilgD1shHdRpFHuN3KstcT0Y7ZFLWU9RzrWYHJsOxHMCWAOP0ULsiADyvC4XNQ8rx4
         OLzBsZXhom0B5G8buHN1PBKsosLRtyOPv7UkcWF5UEa30EFuphExby2urniPReSu/7Ht
         rLTBPJLmrZ15ZB/06qgegcLtQ74LNRV+fvDfHS/JKdvT2BdAWWJ6PLisO/B8hAW5xuvX
         nwKZ33sXflvZKt38gV91SJnPALJ860ijO1aFW9vbsEvKmFDXUhnkOHfsjfUTZbkSk6U3
         HK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739112911; x=1739717711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VR6UdNPUPJ42D/VBzpeWAAtAvkLAE7xD5d1I3/gJKTc=;
        b=ChS1Qu2O/A9osmGqWSzeF4B4jvFsNmPIonrN7sfV6yX6mldsekihXGLCdfcmG0/2IA
         nh2TkaWEbxFnuku70fXWzyep8ctjkxeubhval4SMoSznLp+1iFg3Kg4JM2sTJoaoEPvx
         7SBOWQAtdD+DbxeoNuR2g1Oum55kIkZUpDadZmBP8QCcJi8U0IFe3ycBWeyUk82qqjd/
         Iu3Z47N08KbjnvNgJAdJMpyAKtCAUNaKIjzpyQZqAz6NMKk8Hs4FTthvamnGknIedIZd
         j1Cic79cXe/sx93GD458TsEcXPUs/i269kSolxhnr6nMJY5JCO+frke2SmkweOA/Z4OO
         kSvw==
X-Forwarded-Encrypted: i=1; AJvYcCX+5ZLwTftQv5KvlvAA6BdFPiT7vCgs6BzrKI7lb8Gq5x7lqV3s8DIzxvIAB3evkdArX3m6pR9LEXeO0pYQ@vger.kernel.org, AJvYcCXp1eGwerU0lgRG+kmvIsGUNOxpAPf+6AKArtlRYwyJvPDUQQiIms0Jbrb5dn3XL05Mf7cLQuui2O3W+WUR@vger.kernel.org
X-Gm-Message-State: AOJu0YyAg5Sz1Lm3h1Vr9HAbSCLtp5812BfndJHVL1b6cgF7WSl2cMrR
	qwMz/E4yn2H/NZvXtebpe5+1OXBeC7Z4DvWM41ZMNYkkKVfkyoZyJEo44Q==
X-Gm-Gg: ASbGncvywX7oxWNPQltyOnjwBCMCD4kSCpS6Qpkx7cKW3c+Us/c75nXL1dTwe/vnUnX
	XP/0Ne8OqNEMY1nlPG88hqinzTNY0fc/7cdwAr5ISy843x/526d+epq+fPoLriKyNqyFp+GutrP
	XkrMHh2Vd/rEmPvkN3ovI5aS8TvOTWx99hbhhuhkb21p0l0GdtcW79m5hO7M4VofTv36JOOAGeI
	mth0fvm0mrg1c37FH79nLqo+hbIt8/BS8SpTZjBn6YW9LavJdhsae09v8eLUfQM+Tg8hyP+g+dk
	RrXcS+wzxbqRuuAKORo8SWs9PnijiwQxzMnV+uRTLhNiqgDcFPQ0ktdbPhfq
X-Google-Smtp-Source: AGHT+IFHe7gvVLclb1m+4Z27Ar57CqWhA65W6sLxSy8rAjGx/OK7ohocscL6lEIOsqgeUbXb4Kh4PA==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be6a with SMTP id ffacd0b85a97d-38ddaf3c061mr2341962f8f.40.1739112910710;
        Sun, 09 Feb 2025 06:55:10 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-439069290c7sm138387205e9.0.2025.02.09.06.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 06:55:10 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: rawnand: qcom: finish converting register to FIELD_PREP
Date: Sun,  9 Feb 2025 15:54:32 +0100
Message-ID: <20250209145439.19047-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With some research in some obscure old QSDK, it was possible to find the
MASK of the last register there were still set with raw shift and
convert them to FIELD_PREP API.

This is only a cleanup and modernize the code a bit and doesn't make
any behaviour change.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 36 ++++++++++++++--------------
 include/linux/mtd/nand-qpic-common.h |  6 ++++-
 2 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 6720b547892b..5eaa0be367cd 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -165,9 +165,9 @@ static void nandc_set_read_loc_first(struct nand_chip *chip,
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) |
-		  ((is_last_read_loc) << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -197,9 +197,9 @@ static void nandc_set_read_loc_last(struct nand_chip *chip,
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
-	u32 val = (((cw_offset) << READ_LOCATION_OFFSET) |
-		  ((read_size) << READ_LOCATION_SIZE) |
-		  ((is_last_read_loc) << READ_LOCATION_LAST));
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
 
 	locreg_val = cpu_to_le32(val);
 
@@ -271,14 +271,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 	}
 
 	if (host->use_ecc) {
-		cfg0 = cpu_to_le32((host->cfg0 & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE);
+		cfg0 = cpu_to_le32((host->cfg0 & ~CW_PER_PAGE_MASK) |
+				   FIELD_PREP(CW_PER_PAGE_MASK, (num_cw - 1)));
 
 		cfg1 = cpu_to_le32(host->cfg1);
 		ecc_bch_cfg = cpu_to_le32(host->ecc_bch_cfg);
 	} else {
-		cfg0 = cpu_to_le32((host->cfg0_raw & ~(7U << CW_PER_PAGE)) |
-				(num_cw - 1) << CW_PER_PAGE);
+		cfg0 = cpu_to_le32((host->cfg0_raw & ~CW_PER_PAGE_MASK) |
+				   FIELD_PREP(CW_PER_PAGE_MASK, (num_cw - 1)));
 
 		cfg1 = cpu_to_le32(host->cfg1_raw);
 		ecc_bch_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
@@ -882,12 +882,12 @@ static void qcom_nandc_codeword_fixup(struct qcom_nand_host *host, int page)
 			    host->bbm_size - host->cw_data;
 
 	host->cfg0 &= ~(SPARE_SIZE_BYTES_MASK | UD_SIZE_BYTES_MASK);
-	host->cfg0 |= host->spare_bytes << SPARE_SIZE_BYTES |
-		      host->cw_data << UD_SIZE_BYTES;
+	host->cfg0 |= FIELD_PREP(SPARE_SIZE_BYTES_MASK, host->spare_bytes) |
+		      FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_data);
 
 	host->ecc_bch_cfg &= ~ECC_NUM_DATA_BYTES_MASK;
-	host->ecc_bch_cfg |= host->cw_data << ECC_NUM_DATA_BYTES;
-	host->ecc_buf_cfg = (host->cw_data - 1) << NUM_STEPS;
+	host->ecc_bch_cfg |= FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, host->cw_data);
+	host->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, host->cw_data - 1);
 }
 
 /* implements ecc->read_page() */
@@ -1531,7 +1531,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 			    FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, host->ecc_bytes_hw);
 
 	if (!nandc->props->qpic_version2)
-		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
+		host->ecc_buf_cfg = FIELD_PREP(NUM_STEPS_MASK, 0x203);
 
 	host->clrflashstatus = FS_READY_BSY_N;
 	host->clrreadstatus = 0xc0;
@@ -1817,7 +1817,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 		q_op.cmd_reg |= cpu_to_le32(PAGE_ACC | LAST_PAGE);
 		nandc->regs->addr0 = q_op.addr1_reg;
 		nandc->regs->addr1 = q_op.addr2_reg;
-		nandc->regs->cfg0 = cpu_to_le32(host->cfg0_raw & ~(7 << CW_PER_PAGE));
+		nandc->regs->cfg0 = cpu_to_le32(host->cfg0_raw & ~CW_PER_PAGE_MASK);
 		nandc->regs->cfg1 = cpu_to_le32(host->cfg1_raw);
 		instrs = 3;
 	} else if (q_op.cmd_reg != cpu_to_le32(OP_RESET_DEVICE)) {
@@ -1900,8 +1900,8 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_version2) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
-		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~(0xFF << READ_ADDR))
-				    | NAND_CMD_PARAM << READ_ADDR);
+		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
+						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
 	}
 
 	nandc->regs->exec = cpu_to_le32(1);
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 4d9b736ff8b7..35e7ee0f7809 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -108,7 +108,7 @@
 #define	ECC_FORCE_CLK_OPEN		BIT(30)
 
 /* NAND_DEV_CMD1 bits */
-#define	READ_ADDR			0
+#define	READ_ADDR_MASK			GENMASK(7, 0)
 
 /* NAND_DEV_CMD_VLD bits */
 #define	READ_START_VLD			BIT(0)
@@ -119,6 +119,7 @@
 
 /* NAND_EBI2_ECC_BUF_CFG bits */
 #define	NUM_STEPS			0
+#define	NUM_STEPS_MASK			GENMASK(9, 0)
 
 /* NAND_ERASED_CW_DETECT_CFG bits */
 #define	ERASED_CW_ECC_MASK		1
@@ -139,8 +140,11 @@
 
 /* NAND_READ_LOCATION_n bits */
 #define READ_LOCATION_OFFSET		0
+#define READ_LOCATION_OFFSET_MASK	GENMASK(9, 0)
 #define READ_LOCATION_SIZE		16
+#define READ_LOCATION_SIZE_MASK		GENMASK(25, 16)
 #define READ_LOCATION_LAST		31
+#define READ_LOCATION_LAST_MASK		BIT(31)
 
 /* Version Mask */
 #define	NAND_VERSION_MAJOR_MASK		0xf0000000
-- 
2.47.1


