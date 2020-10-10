Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030C8289E94
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 07:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730683AbgJJFiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 01:38:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18434 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbgJJFcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 01:32:17 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 09 Oct 2020 22:32:10 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id 19D3421ADC; Sat, 10 Oct 2020 11:01:43 +0530 (IST)
From:   Md Sadre Alam <mdalam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH 3/5] mtd: rawnand: qcom: Read QPIC version
Date:   Sat, 10 Oct 2020 11:01:40 +0530
Message-Id: <1602307902-16761-4-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change will add support to read QPIC version.
QPIC version V2.0 onwards some new register introduced
in QPIC. So based on hw_version we will update those
register.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f5064ab..eabb803 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
 
 	u32 cmd1, vld;
 	const struct qcom_nandc_props *props;
+	u32 hw_version;
 };
 
 /*
@@ -2538,6 +2539,7 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	int ecc_mode = 1;
 	int num_addr_cycle = 5, dsbl_sts_aftr_write = 0;
 	int wr_rd_bsy_gap = 2, recovery_cycle = 7;
+	u32 version_reg;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
@@ -2545,6 +2547,26 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	cwperpage = mtd->writesize / NANDC_STEP_SIZE;
 
 	/*
+	 * Read the required ecc strength from NAND device and overwrite the
+	 * device tree ecc strength
+	 */
+	if (chip->base.eccreq.strength >= 8)
+		ecc->strength = 8;
+
+	/* Read QPIC version register */
+	if (nandc->props->is_serial_nand)
+		version_reg = (NAND_VERSION + 0x4000);
+	else
+		version_reg = NAND_VERSION;
+	nandc->hw_version = nandc_read(nandc, version_reg);
+	pr_debug("QPIC controller hw version Major:%d, Minor:%d\n",
+		((nandc->hw_version & NAND_VERSION_MAJOR_MASK)
+		 >> NAND_VERSION_MAJOR_SHIFT),
+		((nandc->hw_version & NAND_VERSION_MINOR_MASK)
+		 >> NAND_VERSION_MINOR_SHIFT));
+	nandc->hw_version = ((nandc->hw_version & NAND_VERSION_MAJOR_MASK)
+			>> NAND_VERSION_MAJOR_SHIFT);
+	/*
 	 * Each CW has 4 available OOB bytes which will be protected with ECC
 	 * so remaining bytes can be used for ECC.
 	 */
-- 
2.7.4

