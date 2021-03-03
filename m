Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9D632C22E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389717AbhCCVq0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:46:26 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:49401 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347054AbhCCQte (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 11:49:34 -0500
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 295A744025F;
        Wed,  3 Mar 2021 18:48:48 +0200 (IST)
From:   Baruch Siach <baruch@tkos.co.il>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH v2] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Date:   Wed,  3 Mar 2021 18:48:16 +0200
Message-Id: <0a2611f885b894274436ded3ca78bc0440fca74a.1614790096.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Partition size and offset value are in block size units, which is the
same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
4K. Bail out in that case.

Fixes: 803eb124e1a64 ("mtd: parsers: Add Qcom SMEM parser")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:

  * Improve error message (Manivannan Sadhasivam)

  * Add Fixes tag (Miquel Raynal)
---
 drivers/mtd/parsers/qcomsmempart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 808cb33d71f8..73b75a30e0ad 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -65,6 +65,13 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	int ret, i, numparts;
 	char *name, *c;
 
+	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
+			&& mtd->type == MTD_NORFLASH) {
+		pr_err("%s: SMEM partition parser is incompatible with 4K sectors\n",
+				mtd->name);
+		return -EINVAL;
+	}
+
 	pr_debug("Parsing partition table info from SMEM\n");
 	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
 	if (IS_ERR(ptable)) {
-- 
2.30.1

