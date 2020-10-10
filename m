Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65838289E8D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Oct 2020 07:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730519AbgJJFc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 01:32:29 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:38498 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730323AbgJJFcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 01:32:13 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 09 Oct 2020 22:32:08 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id ED6B221AD8; Sat, 10 Oct 2020 11:01:42 +0530 (IST)
From:   Md Sadre Alam <mdalam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Date:   Sat, 10 Oct 2020 11:01:39 +0530
Message-Id: <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change will add initial support for qspi (serial nand).

QPIC Version v.2.0 onwards supports serial nand as well so this
change will initialize all required register to enable qspi (serial
nand).

This change is supporting very basic functionality of qspi nand flash.

1. Reset device (Reset QSPI NAND device).

2. Device detection (Read id QSPI NAND device).

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mtd/nand/raw/nand_ids.c   |  13 +++
 drivers/mtd/nand/raw/qcom_nandc.c | 168 +++++++++++++++++++++++++++++++++++---
 2 files changed, 171 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index b994579..32bc419 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -55,6 +55,19 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
 		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
 
+	{"GD5F1GQ4RE9IG SPI NAND 1G 1.8V 4-bit",
+		{ .id = {0xc8, 0xc1} },
+		  SZ_2K, SZ_128, SZ_128K, 0, 2, 128, NAND_ECC_INFO(8, SZ_512) },
+	{"GD5F1GQ4RE9IH SPI NAND 1G 1.8V 4-bit",
+		{ .id = {0xc8, 0xc9} },
+		SZ_2K, SZ_128, SZ_128K, 0, 2, 64, NAND_ECC_INFO(4, SZ_512) },
+	{"GD5F2GQ5REYIH SPI NAND 2G 4-bit",
+		{ .id = {0xc8, 0x22} },
+		SZ_2K, SZ_256, SZ_128K, 0, 2, 64, NAND_ECC_INFO(4, SZ_512) },
+	{"MT29F1G01ABBFDWB-IT SPI NAND 1G 1.8V 4-bit",
+		{ .id = {0x2c, 0x15} },
+		SZ_2K, SZ_128, SZ_128K, 0, 2, 128, NAND_ECC_INFO(8, SZ_512) },
+
 	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
 	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE5, 4, SZ_8K, SP_OPTIONS),
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index bd7a725..f5064ab 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -36,18 +36,33 @@
 #define	NAND_DEV_CMD1			0xa4
 #define	NAND_DEV_CMD2			0xa8
 #define	NAND_DEV_CMD_VLD		0xac
+#define NAND_DEV_CMD7			0xb0
+#define NAND_DEV_CMD8			0xb4
+#define NAND_DEV_CMD9			0xb8
+#define NAND_FLASH_SPI_CFG		0xc0
+#define NAND_SPI_NUM_ADDR_CYCLES	0xc4
+#define NAND_SPI_BUSY_CHECK_WAIT_CNT	0xc8
+#define NAND_DEV_CMD3			0xd0
+#define NAND_DEV_CMD4			0xd4
+#define NAND_DEV_CMD5			0xd8
+#define NAND_DEV_CMD6			0xdc
 #define	SFLASHC_BURST_CFG		0xe0
 #define	NAND_ERASED_CW_DETECT_CFG	0xe8
 #define	NAND_ERASED_CW_DETECT_STATUS	0xec
 #define	NAND_EBI2_ECC_BUF_CFG		0xf0
 #define	FLASH_BUF_ACC			0x100
-
 #define	NAND_CTRL			0xf00
 #define	NAND_VERSION			0xf08
 #define	NAND_READ_LOCATION_0		0xf20
 #define	NAND_READ_LOCATION_1		0xf24
 #define	NAND_READ_LOCATION_2		0xf28
 #define	NAND_READ_LOCATION_3		0xf2c
+#define NAND_READ_LOCATION_LAST_CW_0	0xf40
+#define NAND_READ_LOCATION_LAST_CW_1	0xf44
+#define NAND_READ_LOCATION_LAST_CW_2	0xf48
+#define NAND_READ_LOCATION_LAST_CW_3	0xf4c
+#define NAND_QSPI_MSTR_CONFIG		0xf60
+
 
 /* dummy register offsets, used by write_reg_dma */
 #define	NAND_DEV_CMD1_RESTORE		0xdead
@@ -180,6 +195,28 @@
 #define	ECC_BCH_4BIT	BIT(2)
 #define	ECC_BCH_8BIT	BIT(3)
 
+/* QSPI NAND config reg bits */
+#define LOAD_CLK_CNTR_INIT_EN	(1 << 28)
+#define CLK_CNTR_INIT_VAL_VEC	0x924
+#define FEA_STATUS_DEV_ADDR	0xc0
+#define SPI_CFG	(1 << 0)
+
+/* CMD register value for qspi nand */
+#define CMD0_VAL	0x1080D8D8
+#define CMD1_VAL	0xF00F3000
+#define CMD2_VAL	0xF0FF709F
+#define CMD3_VAL	0x3F310015
+#define CMD7_VAL	0x04061F0F
+#define CMD_VLD_VAL	0xd
+#define SPI_NUM_ADDR	0xDA4DB
+#define WAIT_CNT	0x10
+
+/* QSPI NAND CMD reg bits value */
+#define SPI_WP		(1 << 28)
+#define SPI_HOLD	(1 << 27)
+#define SPI_TRANSFER_MODE_x1	(1 << 29)
+#define SPI_TRANSFER_MODE_x4	(3 << 29)
+
 #define nandc_set_read_loc(nandc, reg, offset, size, is_last)	\
 nandc_set_reg(nandc, NAND_READ_LOCATION_##reg,			\
 	      ((offset) << READ_LOCATION_OFFSET) |		\
@@ -315,6 +352,9 @@ struct nandc_regs {
 	__le32 read_location1;
 	__le32 read_location2;
 	__le32 read_location3;
+	__le32 spi_cfg;
+	__le32 num_addr_cycle;
+	__le32 busy_wait_cnt;
 
 	__le32 erased_cw_detect_cfg_clr;
 	__le32 erased_cw_detect_cfg_set;
@@ -368,6 +408,7 @@ struct qcom_nand_controller {
 
 	struct clk *core_clk;
 	struct clk *aon_clk;
+	struct clk *iomacro_clk;
 
 	union {
 		/* will be used only by QPIC for BAM DMA */
@@ -461,12 +502,14 @@ struct qcom_nand_host {
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
+ * @is_serial_nand - QSPI nand flag, whether QPIC support serial nand or not
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
 	bool is_bam;
 	bool is_qpic;
 	u32 dev_cmd_reg_start;
+	bool is_serial_nand;
 };
 
 /* Frees the BAM transaction memory */
@@ -641,6 +684,12 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
 		return &regs->read_location2;
 	case NAND_READ_LOCATION_3:
 		return &regs->read_location3;
+	case NAND_FLASH_SPI_CFG:
+		return &regs->spi_cfg;
+	case NAND_SPI_NUM_ADDR_CYCLES:
+		return &regs->num_addr_cycle;
+	case NAND_SPI_BUSY_CHECK_WAIT_CNT:
+		return &regs->busy_wait_cnt;
 	default:
 		return NULL;
 	}
@@ -1245,11 +1294,23 @@ static int read_id(struct qcom_nand_host *host, int column)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	u32 cmd = OP_FETCH_ID;
 
 	if (column == -1)
 		return 0;
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_FETCH_ID);
+	if (nandc->props->is_serial_nand) {
+		cmd |= (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1);
+		/* For spi nand read 2-bytes id only
+		 * else if nandc->buf_count == 4; then the id value
+		 * will repeat and the SLC device will be detect as MLC.
+		 * by nand base layer
+		 * so overwrite the nandc->buf_count == 2;
+		 */
+		nandc->buf_count = 2;
+	}
+
+	nandc_set_reg(nandc, NAND_FLASH_CMD, cmd);
 	nandc_set_reg(nandc, NAND_ADDR0, column);
 	nandc_set_reg(nandc, NAND_ADDR1, 0);
 	nandc_set_reg(nandc, NAND_FLASH_CHIP_SELECT,
@@ -1269,8 +1330,13 @@ static int reset(struct qcom_nand_host *host)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	int cmd_rst;
+
+	cmd_rst = OP_RESET_DEVICE;
+	if (nandc->props->is_serial_nand)
+		cmd_rst |= (SPI_WP | SPI_HOLD | SPI_TRANSFER_MODE_x1);
 
-	nandc_set_reg(nandc, NAND_FLASH_CMD, OP_RESET_DEVICE);
+	nandc_set_reg(nandc, NAND_FLASH_CMD, cmd_rst);
 	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
 
 	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
@@ -2470,6 +2536,8 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	int cwperpage, bad_block_byte, ret;
 	bool wide_bus;
 	int ecc_mode = 1;
+	int num_addr_cycle = 5, dsbl_sts_aftr_write = 0;
+	int wr_rd_bsy_gap = 2, recovery_cycle = 7;
 
 	/* controller only supports 512 bytes data steps */
 	ecc->size = NANDC_STEP_SIZE;
@@ -2571,33 +2639,43 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	host->cw_size = host->cw_data + ecc->bytes;
 	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
 
+	/* For QSPI serial nand QPIC config register value got changed
+	 * so configure the new value for qspi serial nand
+	 */
+	if (nandc->props->is_serial_nand) {
+		num_addr_cycle = 3;
+		dsbl_sts_aftr_write = 1;
+		wr_rd_bsy_gap = 20;
+		recovery_cycle = 0;
+	}
+
 	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
 				| host->cw_data << UD_SIZE_BYTES
-				| 0 << DISABLE_STATUS_AFTER_WRITE
-				| 5 << NUM_ADDR_CYCLES
+				| dsbl_sts_aftr_write << DISABLE_STATUS_AFTER_WRITE
+				| num_addr_cycle << NUM_ADDR_CYCLES
 				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
 				| 0 << STATUS_BFR_READ
 				| 1 << SET_RD_MODE_AFTER_STATUS
 				| host->spare_bytes << SPARE_SIZE_BYTES;
 
-	host->cfg1 = 7 << NAND_RECOVERY_CYCLES
+	host->cfg1 = recovery_cycle << NAND_RECOVERY_CYCLES
 				| 0 <<  CS_ACTIVE_BSY
 				| bad_block_byte << BAD_BLOCK_BYTE_NUM
 				| 0 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
+				| wr_rd_bsy_gap << WR_RD_BSY_GAP
 				| wide_bus << WIDE_FLASH
 				| host->bch_enabled << ENABLE_BCH_ECC;
 
 	host->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
 				| host->cw_size << UD_SIZE_BYTES
-				| 5 << NUM_ADDR_CYCLES
+				| num_addr_cycle << NUM_ADDR_CYCLES
 				| 0 << SPARE_SIZE_BYTES;
 
-	host->cfg1_raw = 7 << NAND_RECOVERY_CYCLES
+	host->cfg1_raw = recovery_cycle << NAND_RECOVERY_CYCLES
 				| 0 << CS_ACTIVE_BSY
 				| 17 << BAD_BLOCK_BYTE_NUM
 				| 1 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
+				| wr_rd_bsy_gap << WR_RD_BSY_GAP
 				| wide_bus << WIDE_FLASH
 				| 1 << DEV0_CFG1_ECC_DISABLE;
 
@@ -2805,6 +2883,47 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
+static void qspi_write_reg_bam(struct qcom_nand_controller *nandc,
+		unsigned int val, unsigned int reg)
+{
+	int ret;
+
+	clear_bam_transaction(nandc);
+	nandc_set_reg(nandc, reg, val);
+	write_reg_dma(nandc, reg, 1, NAND_BAM_NEXT_SGL);
+
+	ret = submit_descs(nandc);
+	if (ret)
+		dev_err(nandc->dev, "Error in submitting descriptor to write config reg\n");
+	free_descs(nandc);
+}
+
+static void qspi_nand_init(struct qcom_nand_controller *nandc)
+{
+	u32 spi_cfg_val = 0x0;
+	u32 reg = 0x0;
+
+	spi_cfg_val |= (LOAD_CLK_CNTR_INIT_EN | CLK_CNTR_INIT_VAL_VEC
+			| FEA_STATUS_DEV_ADDR | SPI_CFG);
+
+	qspi_write_reg_bam(nandc, 0x0, NAND_FLASH_SPI_CFG);
+	qspi_write_reg_bam(nandc, spi_cfg_val, NAND_FLASH_SPI_CFG);
+	spi_cfg_val &= ~LOAD_CLK_CNTR_INIT_EN;
+	qspi_write_reg_bam(nandc, spi_cfg_val, NAND_FLASH_SPI_CFG);
+
+	reg = dev_cmd_reg_addr(nandc, NAND_DEV_CMD0);
+	nandc_write(nandc, reg, CMD0_VAL);
+	nandc_write(nandc, reg + 4, CMD1_VAL);
+	nandc_write(nandc, reg + 8, CMD2_VAL);
+	nandc_write(nandc, reg + 12, CMD_VLD_VAL);
+	nandc_write(nandc, reg + 16, CMD7_VAL);
+	reg = dev_cmd_reg_addr(nandc, NAND_DEV_CMD3);
+	nandc_write(nandc, reg, CMD3_VAL);
+
+	qspi_write_reg_bam(nandc, SPI_NUM_ADDR, NAND_SPI_NUM_ADDR_CYCLES);
+	qspi_write_reg_bam(nandc, WAIT_CNT, NAND_SPI_BUSY_CHECK_WAIT_CNT);
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2854,6 +2973,9 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	/* set up initial status value */
 	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
 
+	if (nandc->props->is_serial_nand)
+		qspi_nand_init(nandc);
+
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return ret;
@@ -2961,6 +3083,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (IS_ERR(nandc->aon_clk))
 		return PTR_ERR(nandc->aon_clk);
 
+	if (nandc->props->is_serial_nand) {
+		nandc->iomacro_clk = devm_clk_get(dev, "io_macro");
+		if (IS_ERR(nandc->iomacro_clk))
+			return PTR_ERR(nandc->iomacro_clk);
+	}
+
 	ret = qcom_nandc_parse_dt(pdev);
 	if (ret)
 		return ret;
@@ -2989,6 +3117,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_aon_clk;
 
+	if (nandc->props->is_serial_nand) {
+		ret = clk_prepare_enable(nandc->iomacro_clk);
+		if (ret)
+			goto err_setup;
+	}
+
 	ret = qcom_nandc_setup(nandc);
 	if (ret)
 		goto err_setup;
@@ -3042,6 +3176,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.is_bam = false,
 	.dev_cmd_reg_start = 0x0,
+	.is_serial_nand = false,
 };
 
 static const struct qcom_nandc_props ipq4019_nandc_props = {
@@ -3049,6 +3184,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x0,
+	.is_serial_nand = false,
 };
 
 static const struct qcom_nandc_props ipq8074_nandc_props = {
@@ -3056,6 +3192,14 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x7000,
+	.is_serial_nand = false,
+};
+
+static const struct qcom_nandc_props ipq5018_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.dev_cmd_reg_start = 0x7000,
+	.is_serial_nand = true,
 };
 
 /*
@@ -3075,6 +3219,10 @@ static const struct of_device_id qcom_nandc_of_match[] = {
 		.compatible = "qcom,ipq8074-nand",
 		.data = &ipq8074_nandc_props,
 	},
+	{
+		.compatible = "qcom,ipq5018-nand",
+		.data = &ipq5018_nandc_props,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
2.7.4

