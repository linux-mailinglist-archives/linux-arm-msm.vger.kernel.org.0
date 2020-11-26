Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4BE2C50D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 09:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389095AbgKZI5b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 03:57:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389092AbgKZI5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 03:57:30 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3C1C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:57:30 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id t18so840888plo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 00:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a81+k4ur4QT2egD08jEqcvgRsZrgAwocvEo+BKS2QZE=;
        b=qBoSv6AWPA1w08TAKgHzO0Ifk6sSdeUK3eV1/yWnMIDlzxxhZTeDbdTpA4+a2+72eO
         357iy4LCFHgnDStriOE89S5PhioE1edQp2xXewzWty/+WPpgMXqyXDah3rzw0jN1+Y09
         B2C1NOzb6hOC3KWC4rXPv7K2gjZfa6YxgxKBq2jDIQZnzR6ZL0tpH6P+ch/BmTZ/YfvD
         cpgAtEc8wBi7JQaJBLKrKPpeD36qOA7u0KpHiCvvZg+sO0dHbN59IxjVUdKMU6wb8EvI
         PLQFOZrZCyKhTSZ8XypkBDtKEIBMxh03p8vyMiedcpeQLaIR9RUjb+Ei9XAYxco4dVJl
         tLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a81+k4ur4QT2egD08jEqcvgRsZrgAwocvEo+BKS2QZE=;
        b=bx+3cMrP/4j5eB/gQDx/VuHUL4bSgZ1TxuYmG6wTINa3V/Ke+gzvVsG/SZj7Q/FKGC
         LXxGoOjqHDc9bdbJz0amxax7XPp97ppSv5PA2unbIjJJ5s5O1zdZ9SCE+AsFsw/gpFj4
         HQlsSTMnqppyox5TGSw5Zn9+Vh4oxW5D1JtPgTzf3vA+7CFXE1nOUxxO46NLijwYlthB
         35jGKd9Ls2tP3l8yV+v4WjVYFxc6aT1Q9u1iaODrTj5szdRPMnegspHSRJLzKrXeipB3
         zYPd/SjtOMrMMynBW66Wi97QZgBQEICGijVy1bym0m/aQzFkrbPtzd13TAz1hE03RdFg
         n5Zg==
X-Gm-Message-State: AOAM531xAkJJCnQvNIJpGKDYX1dUs1iOTeDRBtdzYg22jJKnuV1LgyJb
        IG2Rz902V9Mt6yIiz7gQc0SQ
X-Google-Smtp-Source: ABdhPJxpZgOreFw1Go0GGyKcw6aDn1c2CnXLPrMd+LnLD0xwAQf69HuxyAJWvIkSiIiY9URRcKb7fA==
X-Received: by 2002:a17:902:900a:b029:d7:d966:1a44 with SMTP id a10-20020a170902900ab02900d7d9661a44mr1984646plp.8.1606381050172;
        Thu, 26 Nov 2020 00:57:30 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
        by smtp.gmail.com with ESMTPSA id e29sm4025603pgl.58.2020.11.26.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 00:57:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] mtd: rawnand: qcom: Add NAND controller support for SDX55
Date:   Thu, 26 Nov 2020 14:27:05 +0530
Message-Id: <20201126085705.48399-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
References: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDX55 uses QPIC version 2.0.0 IP for the NAND controller support.
In this version, DEV_CMD_* registers are moved to operational state,
hence CPU access in BAM mode is restricted. So, skip accessing these
registers and also use a different config for reading ONFI parameters.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 68 +++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 777fb0de0680..c7e243dc9b2c 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -145,6 +145,7 @@
 #define	OP_PAGE_READ			0x2
 #define	OP_PAGE_READ_WITH_ECC		0x3
 #define	OP_PAGE_READ_WITH_ECC_SPARE	0x4
+#define	OP_PAGE_READ_ONFI_READ		0x5
 #define	OP_PROGRAM_PAGE			0x6
 #define	OP_PAGE_PROGRAM_WITH_ECC	0x7
 #define	OP_PROGRAM_PAGE_SPARE		0x9
@@ -460,12 +461,14 @@ struct qcom_nand_host {
  * @ecc_modes - ecc mode for NAND
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
+ * @qpic_v2 - flag to indicate QPIC IP version 2
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
 	bool is_bam;
 	bool is_qpic;
+	bool qpic_v2;
 	u32 dev_cmd_reg_start;
 };
 
@@ -1164,7 +1167,13 @@ static int nandc_param(struct qcom_nand_host *host)
 	 * in use. we configure the controller to perform a raw read of 512
 	 * bytes to read onfi params
 	 */
-	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_PAGE_READ | PAGE_ACC | LAST_PAGE);
+	if (nandc->props->qpic_v2)
+		nandc_set_reg(nandc, NAND_FLASH_CMD, OP_PAGE_READ_ONFI_READ |
+			      PAGE_ACC | LAST_PAGE);
+	else
+		nandc_set_reg(nandc, NAND_FLASH_CMD, OP_PAGE_READ |
+			      PAGE_ACC | LAST_PAGE);
+
 	nandc_set_reg(nandc, NAND_ADDR0, 0);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0, 0 << CW_PER_PAGE
@@ -1180,21 +1189,28 @@ static int nandc_param(struct qcom_nand_host *host)
 					| 1 << DEV0_CFG1_ECC_DISABLE);
 	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
 
-	/* configure CMD1 and VLD for ONFI param probing */
-	nandc_set_reg(nandc, NAND_DEV_CMD_VLD,
-		      (nandc->vld & ~READ_START_VLD));
-	nandc_set_reg(nandc, NAND_DEV_CMD1,
-		      (nandc->cmd1 & ~(0xFF << READ_ADDR))
-		      | NAND_CMD_PARAM << READ_ADDR);
+	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
+	if (!nandc->props->qpic_v2) {
+		nandc_set_reg(nandc, NAND_DEV_CMD_VLD,
+			      (nandc->vld & ~READ_START_VLD));
+		nandc_set_reg(nandc, NAND_DEV_CMD1,
+			      (nandc->cmd1 & ~(0xFF << READ_ADDR))
+			      | NAND_CMD_PARAM << READ_ADDR);
+	}
 
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
-	nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
+	if (!nandc->props->qpic_v2) {
+		nandc_set_reg(nandc, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
+		nandc_set_reg(nandc, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
+	}
+
 	nandc_set_read_loc(nandc, 0, 0, 512, 1);
 
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
-	write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
+	if (!nandc->props->qpic_v2) {
+		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
+		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
+	}
 
 	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
@@ -1205,8 +1221,10 @@ static int nandc_param(struct qcom_nand_host *host)
 		      nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
-	write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
+	if (!nandc->props->qpic_v2) {
+		write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
+		write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
+	}
 
 	return 0;
 }
@@ -2770,8 +2788,10 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	/* kill onenand */
 	if (!nandc->props->is_qpic)
 		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
-	nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
-		    NAND_DEV_CMD_VLD_VAL);
+
+	if (!nandc->props->qpic_v2)
+		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
+			    NAND_DEV_CMD_VLD_VAL);
 
 	/* enable ADM or BAM DMA */
 	if (nandc->props->is_bam) {
@@ -2791,8 +2811,10 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
-	nandc->vld = NAND_DEV_CMD_VLD_VAL;
+	if (!nandc->props->qpic_v2) {
+		nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
+		nandc->vld = NAND_DEV_CMD_VLD_VAL;
+	}
 
 	return 0;
 }
@@ -3050,6 +3072,14 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.dev_cmd_reg_start = 0x7000,
 };
 
+static const struct qcom_nandc_props sdx55_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.is_qpic = true,
+	.qpic_v2 = true,
+	.dev_cmd_reg_start = 0x7000,
+};
+
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
@@ -3067,6 +3097,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,sdx55-nand",
+		.data = &sdx55_nandc_props,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
2.25.1

