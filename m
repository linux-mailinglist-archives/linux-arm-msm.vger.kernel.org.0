Return-Path: <linux-arm-msm+bounces-47171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F960A2CD4B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 20:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1D2916393F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 19:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77096198A37;
	Fri,  7 Feb 2025 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSMOFm2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF7E23C8CB;
	Fri,  7 Feb 2025 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958132; cv=none; b=R7qo3U4ewzYGUwFkbO3eSl4EjW2As6rEP4lxcUF0abtzdPjrEc0KbPj6JD/g/G69Fm6PaX8TYJqEMaWdcztTwssL/u8IHvC3kZ+A67yOw3BSXRWfXs6g4QBfEX5Z6A/ol9FYpI+FSEn7pcBYxUYU7cnswsb/l5aHuAQaTelHXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958132; c=relaxed/simple;
	bh=MJUdRTHVYHlorYQ/LVArysmz4Q5MD3lRzm3b4c75gzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pNJ7b2pmWMV8n0mV+EwuBMr1iabEqdBOII6GtlDHretbAtIBHXY8IIsvmEEJ2QUChekUuBHfdAHOo3oD5gSGIXrl5bVHwY6qmXnu0SS3lPc6ro6krBnywQQfQo8z3Gi/PLNQpWHFdZKXnXvl2qivtqbJ2Idr1jKiaoud5i8FbOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSMOFm2g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd730so17041475e9.2;
        Fri, 07 Feb 2025 11:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738958129; x=1739562929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rGwJnk6onGTN6F+Q+8uNYESaMmK0c3tfH4f76Zn9gg=;
        b=eSMOFm2gqLCQbmAO0eHj665C/Cp7X8lpterbkyHbKlLdk/7T8eh2RB0+tet3CzgA3A
         2NJ+5yIjXuO30rHGQVo2hnocfDWwCh0ttFxhcuxN2LgdfR/Yhmbc+yZSIOntX2zP/74b
         AiJ5nZPQFnGhkd07RHiQFt+2UZuW6fauK4FEGvg/LwGn38be/NASZN4Q/nO8KJJKfQDR
         p+BFHv+1aSeAQjfMvSYAtsCltLRrpZNbzBT4qJ/m9bRgwAHSQJsffu/GfdmiFi5zlZR4
         urVCzXxIQDaTAseYm/UnwnXUws93i1IBhQJhoUQSaeO8zGxVjLuNHMO2dfxRcC9snBFr
         3MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958129; x=1739562929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rGwJnk6onGTN6F+Q+8uNYESaMmK0c3tfH4f76Zn9gg=;
        b=iLdn8fsEadn8juNvyX3r3l4Clj091LG/Gd1BqZFukrT8LvAOmHbAcWTRSrO6YjvzK8
         4Y73niRxnjPlR/xxHLzQa4pSWvoyCwnFeinaUhbDvIoebz9h2PamM3aujGtl8E1GsO/e
         EfJxhcVDmV+5gRvhfY93/SkSlJAMsAHMNdUeH6G6z/tj68rCY8ZNP4sphx7VabapsIVI
         B+Gc4JM4KL8qa2BQAiwYjlRQQ/bcInv+28XNt1Bn7wbdUTSVEhgwZKa2a4r1FBtsSsse
         MFf3BPzmbCCJSuAvN2ToK0KES1L8wMboFLjK2F4UHWJkCR1zkTIvJN3aoM4wAzQ/0i4+
         fwwA==
X-Forwarded-Encrypted: i=1; AJvYcCUfFhen5Hz9I4Pya1RkH1Axb4KpvTfcwqVa7V9zKShrut84GubvE+DVrTZEciQ1O4kpxbwFzOtJR2/aNGJq@vger.kernel.org, AJvYcCVs+KCgfMHM200cSAgAjmTKOxGtH8/e6Kq0dzFGuIcDSY9SJL1ktp3A/tAdKdiKYjXUjXfVZmWaa5OmD+6B@vger.kernel.org, AJvYcCW8URw8Qs9N1FD+7EhR+CyGLGYWO/+s6jCS/QL2YCnpSypKSz9f5a1FQuOaYaJso0VmiKaulgpX@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/TFRq4maceSfXNHp4l/PpXaiSNwySKzPZ0672oRqnvvKhRPZS
	7I9pB/eAzRpo/MtVfM2WExpohqSueZXualUmBvg+RYMkaKHHhKKh
X-Gm-Gg: ASbGncuGqvgCUCdNktHM0f0XkGnN2koVMK00+QuHGoc2o4jowUSoVklMWEcGuV071ui
	P9qN8xnHunS/23dFuCFB52GxxX8eHodNLoIp6B0jKxqF8w5hWo486E8F//bAKHekNViap9Q/uRR
	oPSluBsocRTknEt7UL6DuQWHkNGBeA7EsGZH230EswcPnL4i1KGeEX8u57ZVxA0jixxQvUKJQmx
	lpMtSaIIDcp6gxrksjqXQzRgfflVLUva648vsdkvUy+IVlM14k393oGmZSbcvMoNrfMQcxUF8uw
	dvraRpCbdEyRI6CDh3w47zqO7OM7aXT4AchGkAyVdkdLv2QiLz/9/MMJHJRZ
X-Google-Smtp-Source: AGHT+IFkCndvhHRme8MUTVSNUm2JXoXYopJcvTKMek4MPe31gk8TP668VFJiyH5pPNKNipL4QhYt0w==
X-Received: by 2002:a05:600c:1c9f:b0:436:1c0c:bfb6 with SMTP id 5b1f17b1804b1-439249c0324mr35381965e9.27.1738958128528;
        Fri, 07 Feb 2025 11:55:28 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm102280335e9.1.2025.02.07.11.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 11:55:27 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
Date: Fri,  7 Feb 2025 20:54:33 +0100
Message-ID: <20250207195442.19157-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix broken config in qcom_param_page_type_exec caused by copy-paste error
from commit 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")

In qcom_param_page_type_exec the value needs to be set to
nandc->regs->cfg0 instead of host->cfg0. This wrong configuration caused
the Qcom NANDC driver to malfunction on any device that makes use of it
(IPQ806x, IPQ40xx, IPQ807x, IPQ60xx) with the following error:

[    0.885369] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xaa
[    0.885909] nand: Micron NAND 256MiB 1,8V 8-bit
[    0.892499] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
[    0.896823] nand: ECC (step, strength) = (512, 8) does not fit in OOB
[    0.896836] qcom-nandc 79b0000.nand-controller: No valid ECC settings possible
[    0.910996] bam-dma-engine 7984000.dma-controller: Cannot free busy channel
[    0.918070] qcom-nandc: probe of 79b0000.nand-controller failed with error -28

Restore original configuration fix the problem and makes the driver work
again.

Cc: stable@vger.kernel.org
Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d2d2aeee42a7..4e3a3e049d9d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1881,18 +1881,18 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	nandc->regs->addr0 = 0;
 	nandc->regs->addr1 = 0;
 
-	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
-		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
-		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
-		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
-
-	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
-		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
-		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
-		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
-		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
-		     FIELD_PREP(WIDE_FLASH, 0) |
-		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
+	nandc->regs->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+			    FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+			    FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+			    FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
+
+	nandc->regs->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+			    FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+			    FIELD_PREP(CS_ACTIVE_BSY, 0) |
+			    FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+			    FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+			    FIELD_PREP(WIDE_FLASH, 0) |
+			    FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
 
 	if (!nandc->props->qpic_version2)
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
-- 
2.47.1


