Return-Path: <linux-arm-msm+bounces-47305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9CA2DE36
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 15:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5218F162FF0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 14:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5F71DE3BF;
	Sun,  9 Feb 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQzYlNI0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DDB14A0A8;
	Sun,  9 Feb 2025 14:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739110221; cv=none; b=LmG3EPbSdOFurrIE4nf6RkU+h+n9BzninaCNdPlbMPsGh8hOHpDWogFlzR0hKqvLdkE3NgoBDuc2Ihs/BXFyQccupYYpX6UMa8nqP/pmHtZDqbvyKges7or2T2acLVkN8hIXS9ycJL3zqc2n1YsSc7VPZaYit36kn/UXdQk0i0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739110221; c=relaxed/simple;
	bh=rtWOpiqXDkydwu95A2+KMs6Qz7yMMvzZ8r7PUymcAlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HQWT27uo0xCuhMXvyby/sQmHLjxXBs34pLKJ4gh6V7AmN6I8acKLxF6KEXmjnCPxQMDQhCtfYaSddSCMtmHRZ1W/x6zPW8aYUSEesgki36EaQzKrW1z/knl23JrVQVZoQ3SIoiZRKI/gP/Bw4g1hmh20oWFL9KOVyHV099hhkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQzYlNI0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dc8b5bb0bso1214822f8f.1;
        Sun, 09 Feb 2025 06:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739110218; x=1739715018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajeuJVOh+9HeCX7nzLDN53ifrTD6lkRc9i/XGHY2kXc=;
        b=MQzYlNI0OfNkDFVvjpUYj1E0bedAByJDr8R6B1YlXeF8m2Cc05ntljh9W98/jiFGHN
         L1UnlAppdJvVuE8fRsgIJkjUrVwMXgOKIbq4xB5Rmvkv1l50X87S4sGpj9BHifs8+yvl
         MqWvgP7U4PFX+jOOEG3wX5Sae1GUsJCpoT9pFsoedUy5KbbfuP8fGOFGqzzzZ7BHxoR4
         RgAko8keyvSflFY9m7VbwuLcvr+PI90ae4eECL9r0Itz866RjoA5ol6q4KuvWR2qj4oA
         VfeIDTLN6XWtYXuuN7viAwQmJZ6Un/n72xyTznlKYYjeEpue+DloPC9svksERl7JLthi
         41Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739110218; x=1739715018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajeuJVOh+9HeCX7nzLDN53ifrTD6lkRc9i/XGHY2kXc=;
        b=d+ZB3tQ5VsEl4NFcgb408Yp49j2RBtB8jFm9lewKKwbhe2DMR036Rf/8zTbCsO02mN
         PvNuLqfbWAXeEmQjhWBNGnDvT5/kyjbWJ1LLya4r3urBAOuT2bhyG7fOISHz2DWFO45w
         Mo0sN0S1jlJl5QpE22cKiecxMjKs7T7/5Gi9rm9nz3Cb0XjE4YkvqqylNChufMzjtCf9
         yplZhWLt+vYhRcvb+fDJcXfdRMZYf8I3ETptDSy1+Sm5x69bHpY5Vfi66aej6krh1Mkg
         VFUctSdsqon2ADkeqmwMVXq312jTsbsZS0u3FwbdMIniH8/y8C/lkbHBd2ickxQim6PE
         4i/g==
X-Forwarded-Encrypted: i=1; AJvYcCUxI3oUyGR+a9p4VhA7SFnHWR0EOfGUET0J6uLZrjNtD7FICaphyx8SvM1lW+DJ1XUuO5yBf12L@vger.kernel.org, AJvYcCW08vG40nRktqD2fLymb7L4jWxdkl16LjhRXCGx+L7XO+fYkNGjbO9u1jze1Ml/bKRvduKm9Z3OagNLX3O6@vger.kernel.org, AJvYcCWOtxuHeFzy3DjKzLuoxOId6HitcZAXntNZuLTrouPldTYmwPGnHQrSPygM1PdwtB+nEmngUi4OCboSaTiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YypQdcyewWpPtCWUc3LUxXdV3vm7zT/rAbVCV/Ml45hWXLLLL8G
	Q0zIGGWPw+QeVFuqSAlPyBtnEAvXyvtjHpRMidLCeM7Ni+NA6fgS
X-Gm-Gg: ASbGnctJjr+ARRe6e6X9Dxgwq9vscEus4/ahfGXbTKa7Ebn3U9sdMZfcxEx+YdxPZTC
	WtNRSlUBL4WrL6L61kl/SO2fSgSJmB/0EPChVcEU/9kIb4fh7hl0jOB/0aj4NrRSMD9CU2yP8wJ
	Y8/ogik6gFdxPYUTCNkUhumYziiXiCDSJhJmnFlZW4zlD4EQMcU4iteN4SPxK+8re5Cka3ZamXv
	koeJBEyKG/o3li/7TzpqWJF2j/wNLwCstfF91dAN6QKTGHN7eYOTAOubWZJ7bX4QcCMyvpjUIn+
	AZTYqgomXV+VaQ+VpsRwfbdVSbYVtjfMbQy5dR2fjvhLet3t5/0vN2V4RVLM
X-Google-Smtp-Source: AGHT+IEpJbYfrq+vlnKMBwnl0T5BCZSlfekmzoaVWvq4nX/g31e4Y9jxfhM6Hdgz/rOhLVMSGYkqKw==
X-Received: by 2002:a5d:598c:0:b0:38a:888c:679c with SMTP id ffacd0b85a97d-38dc9374610mr5634105f8f.42.1739110217751;
        Sun, 09 Feb 2025 06:10:17 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390d94d685sm150843985e9.13.2025.02.09.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 06:10:16 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org,
	Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2] mtd: rawnand: qcom: fix broken config in qcom_param_page_type_exec
Date: Sun,  9 Feb 2025 15:09:38 +0100
Message-ID: <20250209140941.16627-1-ansuelsmth@gmail.com>
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

Also restore the wrongly dropped cpu_to_le32 to correctly support BE
systems.

Cc: stable@vger.kernel.org
Fixes: 0c08080fd71c ("mtd: rawnand: qcom: use FIELD_PREP and GENMASK")
Tested-by: Robert Marko <robimarko@gmail.com> # IPQ8074 and IPQ6018
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix smatch warning (add missing cpu_to_le32 that was also dropped
  from the FIELD_PREP patch)

 drivers/mtd/nand/raw/qcom_nandc.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d2d2aeee42a7..6720b547892b 100644
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
+	nandc->regs->cfg0 = cpu_to_le32(FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+					FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+					FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+					FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0));
+
+	nandc->regs->cfg1 = cpu_to_le32(FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+					FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+					FIELD_PREP(CS_ACTIVE_BSY, 0) |
+					FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+					FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+					FIELD_PREP(WIDE_FLASH, 0) |
+					FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1));
 
 	if (!nandc->props->qpic_version2)
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
-- 
2.47.1


