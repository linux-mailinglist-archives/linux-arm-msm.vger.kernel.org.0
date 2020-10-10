Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48F0289E8C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 07:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730531AbgJJFce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 01:32:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52496 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730366AbgJJFcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 01:32:16 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 09 Oct 2020 22:32:08 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id 3A99621ADD; Sat, 10 Oct 2020 11:01:43 +0530 (IST)
From:   Md Sadre Alam <mdalam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH 4/5] mtd: rawnand: qcom: Enable support for erase,read & write for serial nand.
Date:   Sat, 10 Oct 2020 11:01:41 +0530
Message-Id: <1602307902-16761-5-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change will enable support for erase , read & write support for
QSPI serial nand. In QPIC V2.0 onwards, to read last code word new
regiater is introduced. So to read for first three code word we have to
use LOCATION_n register and for last code word we ahve to use LAST_CW_n.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 97 +++++++++++++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index eabb803..4e8e1dc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -216,6 +216,7 @@
 #define SPI_HOLD	(1 << 27)
 #define SPI_TRANSFER_MODE_x1	(1 << 29)
 #define SPI_TRANSFER_MODE_x4	(3 << 29)
+#define QPIC_v2_0	0x2
 
 #define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
 nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
@@ -223,6 +224,12 @@ nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
 	      ((size) << READ_LOCATION_SIZE) |			\
 	      ((is_last) << READ_LOCATION_LAST))
 
+#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
+nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
+	      ((offset) << READ_LOCATION_OFFSET) |		\
+	      ((size) << READ_LOCATION_SIZE) |			\
+	      ((is_last) << READ_LOCATION_LAST))
+
 /*
  * Returns the actual register address for all NAND_DEV_ registers
  * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and NAND_DEV_CMD_VLD)
@@ -352,6 +359,10 @@ struct nandc_regs {
 	__le32 read_location1;
 	__le32 read_location2;
 	__le32 read_location3;
+	__le32 read_location_last0;
+	__le32 read_location_last1;
+	__le32 read_location_last2;
+	__le32 read_location_last3;
 	__le32 spi_cfg;
 	__le32 num_addr_cycle;
 	__le32 busy_wait_cnt;
@@ -685,6 +696,14 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->read_location2;
 	case NAND_READ_LOCATION_3:
 		return &regs->read_location3;
+	case NAND_READ_LOCATION_LAST_CW_0:
+		return &regs->read_location_last0;
+	case NAND_READ_LOCATION_LAST_CW_1:
+		return &regs->read_location_last1;
+	case NAND_READ_LOCATION_LAST_CW_2:
+		return &regs->read_location_last2;
+	case NAND_READ_LOCATION_LAST_CW_3:
+		return &regs->read_location_last3;
 	case NAND_FLASH_SPI_CFG:
 		return &regs->spi_cfg;
 	case NAND_SPI_NUM_ADDR_CYCLES:
@@ -734,13 +753,18 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u32 cmd, cfg0, cfg1, ecc_bch_cfg;
 
+	cmd = (PAGE_ACC | LAST_PAGE);
+
+	if (nandc->props->is_serial_nand)
+		cmd |= (SPI_TRANSFER_MODE_x1 | SPI_WP | SPI_HOLD);
+
 	if (read) {
 		if (host->use_ecc)
-			cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
+			cmd |= OP_PAGE_READ_WITH_ECC;
 		else
-			cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
+			cmd |= OP_PAGE_READ;
 	} else {
-		cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
+		cmd |= OP_PROGRAM_PAGE;
 	}
 
 	if (host->use_ecc) {
@@ -766,9 +790,14 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
 	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
-	if (read)
+	if (read) {
+		if (nandc->hw_version >= QPIC_v2_0)
+			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
+					host->cw_data : host->cw_size, 1);
+
 		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
 				   host->cw_data : host->cw_size, 1);
+	}
 }
 
 /*
@@ -1143,9 +1172,13 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
 static void
 config_nand_cw_read(struct qcom_nand_controller *nandc, bool use_ecc)
 {
-	if (nandc->props->is_bam)
+	if (nandc->props->is_bam) {
+		if (nandc->hw_version >= QPIC_v2_0)
+			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
+					4, NAND_BAM_NEXT_SGL);
 		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
 			      NAND_BAM_NEXT_SGL);
+	}
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
 	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -1266,9 +1299,13 @@ static int erase_block(struct qcom_nand_host *host, int page_addr)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	u32 ers_cmd = OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE;
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD,
-		      OP_BLOCK_ERASE | PAGE_ACC | LAST_PAGE);
+	if (nandc->props->is_serial_nand) {
+		ers_cmd |= (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1);
+		page_addr <<= 16;
+	}
+	nandc_set_reg(nandc, NAND_FLASH_CMD, ers_cmd);
 	nandc_set_reg(nandc, NAND_ADDR0, page_addr);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_DEV0_CFG0,
@@ -1680,16 +1717,32 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (nandc->props->is_bam) {
-		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
 		read_loc += data_size1;
 
-		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
+		else
+			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
 		read_loc += oob_size1;
 
-		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
 		read_loc += data_size2;
 
-		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
+		if ((nandc->hw_version >= QPIC_v2_0) &&
+			(cw == (ecc->steps - 1)))
+			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
+		else
+			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
 	}
 
 	config_nand_cw_read(nandc, false);
@@ -1924,10 +1977,26 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 				nandc_set_read_loc(nandc, 1, data_size,
 						   oob_size, 1);
 			} else if (data_buf) {
-				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
+				if (nandc->hw_version >= QPIC_v2_0) {
+					if (i == (ecc->steps - 1))
+						nandc_set_read_loc_last(nandc, 0, 0,
+							data_size, 1);
+					else
+						nandc_set_read_loc(nandc, 0, 0,
+							data_size, 1);
+				} else
+					nandc_set_read_loc(nandc, 0, 0, data_size, 1);
 			} else {
-				nandc_set_read_loc(nandc, 0, data_size,
-						   oob_size, 1);
+				if (nandc->hw_version >= QPIC_v2_0) {
+					if (i == (ecc->steps - 1))
+						nandc_set_read_loc_last(nandc, 0, data_size,
+							oob_size, 1);
+					else
+						nandc_set_read_loc(nandc, 0, data_size,
+							oob_size, 1);
+				} else
+					nandc_set_read_loc(nandc, 0, data_size,
+							oob_size, 1);
 			}
 		}
 
-- 
2.7.4

