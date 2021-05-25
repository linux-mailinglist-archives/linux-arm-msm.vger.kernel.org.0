Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4EE38F6E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhEYAQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhEYAQd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:16:33 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E827C061574;
        Mon, 24 May 2021 17:15:03 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id jt22so233150ejb.7;
        Mon, 24 May 2021 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsmlRIkgq2zV5frevaV4WTTbksGQGcj6H85aoJ0Ejt8=;
        b=q7Ocqmkns5l1r5KzX/QKurVUeFmPQH9c1DhFDzd87dFqvC5j4v+cO6y6Y3ndzRX0u5
         Cl97L0mD2Zp9T7moehtSRy65RmpLbjEM1IgYR0/EfQFTFGtMDOv3WWjDk4QcdMB/oTWe
         dWl6cnN0quBvaYbBwQGoHSMVOfUg32Il2vtpbBX3kMJAuoM4PLwNFJsqCSIKmM9kutoO
         UPzSxqi1//NfbTQFS9lsOI8GHdiH0L5FS3fmrYoaNLrpGpAN3VlcC3WV2cTljlKsRzWB
         Tq2o0Qx/AMkRPMcsI+dALFfDnOfWHeHPYBpZWA+9wKNJcaEyPGXJSUOPVlQ4E7HUHIDI
         NxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsmlRIkgq2zV5frevaV4WTTbksGQGcj6H85aoJ0Ejt8=;
        b=GbrIp+0sw+I5UIm0/K9eTPZKpI/8Hku2ahjFoILLmKhlTxCdfm66TVxMXhpvCZxjn2
         VZMU1KyUG4iP/utDEHay9mfPSRJ57ebOpXNW/JI7Bl45qhXQ78rT31OpSSHEW2vmGVd+
         gijrAiVmL90t11tKDFd/dyxO000dOdWRsrFFwd4FHL/C/I7wgcEDoVLCyKTF8mvT/k9w
         xVPeOAoyDyUrfvv62cj8j9mdl/F9hutnjKb9SL3QZ5NV8f/GJCzufLlYqooabaVRyFAO
         HytK1OFnUn+2uZMjpRmQngN1Ax96RGX4ySsPaEcaLcll/7BJPx4marS8+PEvRxOZgo6H
         Y2TA==
X-Gm-Message-State: AOAM5310e+Q9CFmibV9kmTggldCM4UaupnOuKfX5kfhiCRPCBlsvFXsQ
        zwkG0rFeOhETX4ejt3X38fku1SG7GaO0KQ==
X-Google-Smtp-Source: ABdhPJxLpRdzFVmTZm9zlKW4qOFdgQStppgfa8WmFcOlQhXn2XulruJIuoMAi/X73ZXZ6n0OJlVMgA==
X-Received: by 2002:a17:907:d1a:: with SMTP id gn26mr23234142ejc.42.1621901702156;
        Mon, 24 May 2021 17:15:02 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it. [93.35.189.2])
        by smtp.googlemail.com with ESMTPSA id yr15sm8448017ejb.16.2021.05.24.17.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:15:01 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH] mtd: parsers: qcom: Fix leaking of partition name
Date:   Tue, 25 May 2021 02:14:49 +0200
Message-Id: <20210525001449.10386-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Partition name are already allocated and defined by the ptable struct.
Skip reallocation of name variable and directly lowercase the name in
the ptable struct. The name variable was duplicated but never freed.
The leak was found using kmemleak.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d9083308f6ba..3d083f0815f8 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -62,8 +62,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	struct smem_flash_ptable *ptable;
 	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
 	struct mtd_partition *parts;
-	int ret, i, numparts;
-	char *name, *c;
+	int i, numparts;
+	char *c;
 
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
 			&& mtd->type == MTD_NORFLASH) {
@@ -125,17 +125,11 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 		if (pentry->name[0] == '\0')
 			continue;
 
-		name = kstrdup(pentry->name, GFP_KERNEL);
-		if (!name) {
-			ret = -ENOMEM;
-			goto out_free_parts;
-		}
-
 		/* Convert name to lower case */
-		for (c = name; *c != '\0'; c++)
+		for (c = pentry->name; *c != '\0'; c++)
 			*c = tolower(*c);
 
-		parts[i].name = name;
+		parts[i].name = pentry->name;
 		parts[i].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
 		parts[i].mask_flags = pentry->attr;
 		parts[i].size = le32_to_cpu(pentry->length) * mtd->erasesize;
@@ -149,14 +143,6 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	*pparts = parts;
 
 	return numparts;
-
-out_free_parts:
-	while (--i >= 0)
-		kfree(parts[i].name);
-	kfree(parts);
-	*pparts = NULL;
-
-	return ret;
 }
 
 static const struct of_device_id qcomsmem_of_match_table[] = {
-- 
2.31.1

