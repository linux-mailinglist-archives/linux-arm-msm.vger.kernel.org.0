Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5A9390CC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 01:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhEYXLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 19:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhEYXLN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 19:11:13 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F18C061574;
        Tue, 25 May 2021 16:09:41 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id g7so26042789edm.4;
        Tue, 25 May 2021 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X1MvS/6mSvBdfpSbPfN/7JJWpwiBa9tcmoBU0a7X3Cs=;
        b=JbhzrHYWbaZWQbBevPTwVRlDDqmSjaoc6umPdR/hxegRe9Wus8j9yoSRWUje/zaqLq
         3umESW2EMLgRPhGH7uyEKu2uAog1EajMO+ic8Zg1ZsQ1eTm7ufI+810GUOC4FiDMzwDf
         /dtNNsK8zDDjTHEqOJQrtVH0lq/PSXzRu7cTi16xjya4EGHj1zXxjooZzwYE/nYGSI97
         KDXn+XksNlQMSB9ppfUuCHnNQPjpX/TI/hrvwh0BalEqePmhY69Y4nMqktargP1hzacm
         rwrlv74ASPp1xk1f9gIz3V9/+keZs1a7QuRpmrMG/1uwuFdwH8TGo4RyrMkHPkNHU5wa
         Eq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X1MvS/6mSvBdfpSbPfN/7JJWpwiBa9tcmoBU0a7X3Cs=;
        b=Aqq60taKiGVNGydMZslolL6QU6+k5FV3hMSUERclHOvvdLzWpKh/uEOW0vCo3bt1me
         L1emFAucBJAb8bH542O9o32c1A45TRZZDAWlOu5Ya7GBhFl29EEb9ScdSjYR00/Ng9fZ
         IQRGrSKwBqBt1lccOfnUgZ+21ja8tLNy9G4S8qBlMEkS+IbtmAN+2Nky3Mk1gwgOUREa
         aK9ofmh9at2i11T0vtWVcmGf1L/h7TvFrxnT+r5wDFZiPRlh/BBrc61mBn8DJBVsyvKU
         D4WHeIq3jm5sTVUiY5Gi61IjHhw6cClwv9R90mLhQSRY76XfGyBoDI2m3/rwwDBs2Pt0
         mIpg==
X-Gm-Message-State: AOAM5315eMEWxCHv56Q67OXD2ajLSzj4fEoMcp4jysVDnTBP7cQ6WUHK
        V9l5mQ9wtL6PKKkeAJY+sjnUVYygRoBnoA==
X-Google-Smtp-Source: ABdhPJwnbSMs/DuokhZnqXONkMqw5YfOqzsLuKAGmGEdRxIfWoTRgG7a7HUlXByMrbcZgyAQkbWcCg==
X-Received: by 2002:a05:6402:2706:: with SMTP id y6mr6247878edd.355.1621984179869;
        Tue, 25 May 2021 16:09:39 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-35-189-2.ip56.fastwebnet.it. [93.35.189.2])
        by smtp.googlemail.com with ESMTPSA id zg18sm9503105ejb.41.2021.05.25.16.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 16:09:39 -0700 (PDT)
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
Subject: [PATCH v2] mtd: parsers: qcom: Fix leaking of partition name
Date:   Wed, 26 May 2021 01:09:31 +0200
Message-Id: <20210525230931.30013-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add cleanup function as the name variable for the partition name was
allocaed but never freed after the use as the add mtd function
duplicate the name and free the pparts struct as the partition name is
assumed to be static.
The leak was found using kmemleak.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/qcomsmempart.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d9083308f6ba..06a818cd2433 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -159,6 +159,15 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	return ret;
 }
 
+static void parse_qcomsmem_cleanup(const struct mtd_partition *pparts,
+				   int nr_parts)
+{
+	int i;
+
+	for (i = 0; i < nr_parts; i++)
+		kfree(pparts[i].name);
+}
+
 static const struct of_device_id qcomsmem_of_match_table[] = {
 	{ .compatible = "qcom,smem-part" },
 	{},
@@ -167,6 +176,7 @@ MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
 
 static struct mtd_part_parser mtd_parser_qcomsmem = {
 	.parse_fn = parse_qcomsmem_part,
+	.cleanup = parse_qcomsmem_cleanup,
 	.name = "qcomsmem",
 	.of_match_table = qcomsmem_of_match_table,
 };
-- 
2.31.1

