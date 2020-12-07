Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309372D0C0D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Dec 2020 09:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgLGItG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 03:49:06 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:30169 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgLGItG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 03:49:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607330919; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BNWkd1f8d84aVoPvkJm84zWx+BWBng++SL+Kc5t6eHQ=; b=WQVSsyZJ9Hi+uWvu5oC5iJyH/IRfpLWWQt78/NQpor565c7V5sHgsaqxc5yYUN1X1+CH6Uhl
 cqOsIsqW75/IXY795fcsNknW4mxkw2RqLgCu4mdHDA8fqFKgJj9gQeZ7vsKaffN0mFgKBKi6
 KxS7/EgayklX0XCnWX9QabnnWP0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fcdec4baac94550972be424 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Dec 2020 08:48:11
 GMT
Sender: akashast=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0D4FAC433ED; Mon,  7 Dec 2020 08:48:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0928EC433C6;
        Mon,  7 Dec 2020 08:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0928EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     gregkh@linuxfoundation.org, bjorn.andersson@linaro.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        saravanak@google.com, Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH  3/3] Serial: Separate out earlycon support
Date:   Mon,  7 Dec 2020 14:17:27 +0530
Message-Id: <1607330847-15522-4-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
References: <1607330847-15522-1-git-send-email-akashast@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Separate out earlycon support from serial driver and remove it's
dependency on QUP wrapper driver.

This enable us to manage earlycon independently and we can re-use the
same earlycon driver for android project which currently uses
downstream version of QUP drivers.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 drivers/tty/serial/Kconfig              |   9 +
 drivers/tty/serial/Makefile             |   1 +
 drivers/tty/serial/qcom_geni_earlycon.c | 649 ++++++++++++++++++++++++++++++++
 drivers/tty/serial/qcom_geni_serial.c   |  97 -----
 4 files changed, 659 insertions(+), 97 deletions(-)
 create mode 100644 drivers/tty/serial/qcom_geni_earlycon.c

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 3409e0b..393a017 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -957,6 +957,15 @@ config SERIAL_QCOM_GENI
 	depends on QCOM_GENI_SE
 	select SERIAL_CORE
 
+config SERIAL_QCOM_GENI_EARLYCON
+	bool "QCOM GENI Early Console support"
+	select SERIAL_CORE
+	select SERIAL_CORE_CONSOLE
+	select SERIAL_EARLYCON
+	help
+	  Serial early console driver for Qualcomm Technologies Inc's GENI
+	  based QUP hardware.
+
 config SERIAL_QCOM_GENI_CONSOLE
 	bool "QCOM GENI Serial Console support"
 	depends on SERIAL_QCOM_GENI
diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
index b85d53f..4f9c318 100644
--- a/drivers/tty/serial/Makefile
+++ b/drivers/tty/serial/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_SERIAL_VR41XX) += vr41xx_siu.o
 obj-$(CONFIG_SERIAL_ATMEL) += atmel_serial.o
 obj-$(CONFIG_SERIAL_UARTLITE) += uartlite.o
 obj-$(CONFIG_SERIAL_MSM) += msm_serial.o
+obj-$(CONFIG_SERIAL_QCOM_GENI_EARLYCON) += qcom_geni_earlycon.o
 obj-$(CONFIG_SERIAL_QCOM_GENI) += qcom_geni_serial.o
 obj-$(CONFIG_SERIAL_OMAP) += omap-serial.o
 obj-$(CONFIG_SERIAL_ALTERA_UART) += altera_uart.o
diff --git a/drivers/tty/serial/qcom_geni_earlycon.c b/drivers/tty/serial/qcom_geni_earlycon.c
new file mode 100644
index 0000000..847cc7b
--- /dev/null
+++ b/drivers/tty/serial/qcom_geni_earlycon.c
@@ -0,0 +1,649 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, The Linux foundation. All rights reserved.
+
+#include <linux/console.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/slab.h>
+#include <linux/tty.h>
+#include <linux/tty_flip.h>
+
+/* Common SE registers */
+#define GENI_FORCE_DEFAULT_REG		0x20
+#define GENI_FW_REVISION_RO		0x68
+#define SE_GENI_DMA_MODE_EN		0x258
+#define SE_GENI_M_CMD0			0x600
+#define SE_GENI_M_CMD_CTRL_REG		0x604
+#define SE_GENI_M_IRQ_STATUS		0x610
+#define SE_GENI_M_IRQ_EN		0x614
+#define SE_GENI_M_IRQ_CLEAR		0x618
+#define SE_GENI_S_CMD0			0x630
+#define SE_GENI_S_CMD_CTRL_REG		0x634
+#define SE_GENI_S_IRQ_STATUS		0x640
+#define SE_GENI_S_IRQ_EN		0x644
+#define SE_GENI_S_IRQ_CLEAR		0x648
+#define SE_GENI_TX_FIFOn		0x700
+#define SE_GENI_RX_FIFOn		0x780
+#define SE_GENI_TX_FIFO_STATUS		0x800
+#define SE_GENI_RX_FIFO_STATUS		0x804
+#define SE_GENI_TX_WATERMARK_REG	0x80c
+#define SE_GENI_RX_WATERMARK_REG	0x810
+#define SE_GENI_RX_RFR_WATERMARK_REG	0x814
+#define SE_DMA_TX_IRQ_CLR		0xc44
+#define SE_DMA_RX_IRQ_CLR		0xd44
+
+/* GENI_FORCE_DEFAULT_REG fields */
+#define FORCE_DEFAULT	BIT(0)
+
+/* GENI_FW_REVISION_RO fields */
+#define FW_REV_PROTOCOL_MSK		GENMASK(15, 8)
+#define FW_REV_PROTOCOL_SHFT		8
+
+/* SE_GENI_DMA_MODE_EN */
+#define GENI_DMA_MODE_EN		BIT(0)
+
+/* GENI_M_CMD0 fields */
+#define M_OPCODE_MSK			GENMASK(31, 27)
+#define M_OPCODE_SHFT			27
+#define M_PARAMS_MSK			GENMASK(26, 0)
+
+/* GENI_M_CMD_CTRL_REG */
+#define M_GENI_CMD_CANCEL		BIT(2)
+#define M_GENI_CMD_ABORT		BIT(1)
+#define M_GENI_DISABLE			BIT(0)
+
+/* GENI_S_CMD0 fields */
+#define S_OPCODE_MSK			GENMASK(31, 27)
+#define S_OPCODE_SHFT			27
+#define S_PARAMS_MSK			GENMASK(26, 0)
+
+/* GENI_S_CMD_CTRL_REG */
+#define S_GENI_CMD_CANCEL		BIT(2)
+#define S_GENI_CMD_ABORT		BIT(1)
+#define S_GENI_DISABLE			BIT(0)
+
+/* GENI_M_IRQ_EN fields */
+#define M_CMD_DONE_EN			BIT(0)
+#define M_CMD_OVERRUN_EN		BIT(1)
+#define M_ILLEGAL_CMD_EN		BIT(2)
+#define M_CMD_FAILURE_EN		BIT(3)
+#define M_CMD_CANCEL_EN			BIT(4)
+#define M_CMD_ABORT_EN			BIT(5)
+#define M_TIMESTAMP_EN			BIT(6)
+#define M_RX_IRQ_EN			BIT(7)
+#define M_GP_SYNC_IRQ_0_EN		BIT(8)
+#define M_GP_IRQ_0_EN			BIT(9)
+#define M_GP_IRQ_1_EN			BIT(10)
+#define M_GP_IRQ_2_EN			BIT(11)
+#define M_GP_IRQ_3_EN			BIT(12)
+#define M_GP_IRQ_4_EN			BIT(13)
+#define M_GP_IRQ_5_EN			BIT(14)
+#define M_IO_DATA_DEASSERT_EN		BIT(22)
+#define M_IO_DATA_ASSERT_EN		BIT(23)
+#define M_RX_FIFO_RD_ERR_EN		BIT(24)
+#define M_RX_FIFO_WR_ERR_EN		BIT(25)
+#define M_RX_FIFO_WATERMARK_EN		BIT(26)
+#define M_RX_FIFO_LAST_EN		BIT(27)
+#define M_TX_FIFO_RD_ERR_EN		BIT(28)
+#define M_TX_FIFO_WR_ERR_EN		BIT(29)
+#define M_TX_FIFO_WATERMARK_EN		BIT(30)
+#define M_SEC_IRQ_EN			BIT(31)
+#define M_COMMON_GENI_M_IRQ_EN	(GENMASK(6, 1) | \
+				M_IO_DATA_DEASSERT_EN | \
+				M_IO_DATA_ASSERT_EN | M_RX_FIFO_RD_ERR_EN | \
+				M_RX_FIFO_WR_ERR_EN | M_TX_FIFO_RD_ERR_EN | \
+				M_TX_FIFO_WR_ERR_EN)
+
+/* GENI_S_IRQ_EN fields */
+#define S_CMD_DONE_EN			BIT(0)
+#define S_CMD_OVERRUN_EN		BIT(1)
+#define S_ILLEGAL_CMD_EN		BIT(2)
+#define S_CMD_FAILURE_EN		BIT(3)
+#define S_CMD_CANCEL_EN			BIT(4)
+#define S_CMD_ABORT_EN			BIT(5)
+#define S_GP_SYNC_IRQ_0_EN		BIT(8)
+#define S_GP_IRQ_0_EN			BIT(9)
+#define S_GP_IRQ_1_EN			BIT(10)
+#define S_GP_IRQ_2_EN			BIT(11)
+#define S_GP_IRQ_3_EN			BIT(12)
+#define S_GP_IRQ_4_EN			BIT(13)
+#define S_GP_IRQ_5_EN			BIT(14)
+#define S_IO_DATA_DEASSERT_EN		BIT(22)
+#define S_IO_DATA_ASSERT_EN		BIT(23)
+#define S_RX_FIFO_RD_ERR_EN		BIT(24)
+#define S_RX_FIFO_WR_ERR_EN		BIT(25)
+#define S_RX_FIFO_WATERMARK_EN		BIT(26)
+#define S_RX_FIFO_LAST_EN		BIT(27)
+#define S_COMMON_GENI_S_IRQ_EN	(GENMASK(5, 1) | GENMASK(13, 9) | \
+				 S_RX_FIFO_RD_ERR_EN | S_RX_FIFO_WR_ERR_EN)
+
+/*  GENI_RX_FIFO_STATUS fields */
+#define RX_LAST				BIT(31)
+#define RX_LAST_BYTE_VALID_MSK		GENMASK(30, 28)
+#define RX_LAST_BYTE_VALID_SHFT		28
+#define RX_FIFO_WC_MSK			GENMASK(24, 0)
+
+/* UART specific GENI registers */
+#define SE_UART_TX_TRANS_CFG		0x25c
+#define SE_UART_TX_WORD_LEN		0x268
+#define SE_UART_TX_STOP_BIT_LEN		0x26c
+#define SE_UART_TX_TRANS_LEN		0x270
+#define SE_UART_RX_TRANS_CFG		0x280
+#define SE_UART_RX_WORD_LEN		0x28c
+#define SE_UART_TX_PARITY_CFG		0x2a4
+#define SE_UART_RX_PARITY_CFG		0x2a8
+
+/* SE_UART_TRANS_CFG */
+#define UART_TX_PAR_EN		BIT(0)
+#define UART_CTS_MASK		BIT(1)
+
+/* SE_UART_TX_WORD_LEN */
+#define TX_WORD_LEN_MSK		GENMASK(9, 0)
+
+/* SE_UART_TX_STOP_BIT_LEN */
+#define TX_STOP_BIT_LEN_MSK	GENMASK(23, 0)
+#define TX_STOP_BIT_LEN_1	0
+#define TX_STOP_BIT_LEN_1_5	1
+#define TX_STOP_BIT_LEN_2	2
+
+/* SE_UART_TX_TRANS_LEN */
+#define TX_TRANS_LEN_MSK	GENMASK(23, 0)
+
+/* SE_UART_RX_TRANS_CFG */
+#define UART_RX_INS_STATUS_BIT	BIT(2)
+#define UART_RX_PAR_EN		BIT(3)
+
+/* SE_UART_RX_WORD_LEN */
+#define RX_WORD_LEN_MASK	GENMASK(9, 0)
+
+/* Common SE registers */
+#define GENI_OUTPUT_CTRL		0x24
+#define GENI_CGC_CTRL			0x28
+#define SE_GENI_BYTE_GRAN		0x254
+#define SE_GENI_TX_PACKING_CFG0		0x260
+#define SE_GENI_TX_PACKING_CFG1		0x264
+#define SE_GENI_RX_PACKING_CFG0		0x284
+#define SE_GENI_RX_PACKING_CFG1		0x288
+#define SE_GSI_EVENT_EN			0xe18
+#define SE_IRQ_EN			0xe1c
+#define SE_DMA_GENERAL_CFG		0xe30
+
+/* GENI_OUTPUT_CTRL fields */
+#define DEFAULT_IO_OUTPUT_CTRL_MSK	GENMASK(6, 0)
+
+/* GENI_CGC_CTRL fields */
+#define CFG_AHB_CLK_CGC_ON		BIT(0)
+#define CFG_AHB_WR_ACLK_CGC_ON		BIT(1)
+#define DATA_AHB_CLK_CGC_ON		BIT(2)
+#define SCLK_CGC_ON			BIT(3)
+#define TX_CLK_CGC_ON			BIT(4)
+#define RX_CLK_CGC_ON			BIT(5)
+#define EXT_CLK_CGC_ON			BIT(6)
+#define PROG_RAM_HCLK_OFF		BIT(8)
+#define PROG_RAM_SCLK_OFF		BIT(9)
+#define DEFAULT_CGC_EN			GENMASK(6, 0)
+
+/* SE_GSI_EVENT_EN fields */
+#define DMA_RX_EVENT_EN			BIT(0)
+#define DMA_TX_EVENT_EN			BIT(1)
+#define GENI_M_EVENT_EN			BIT(2)
+#define GENI_S_EVENT_EN			BIT(3)
+
+/* SE_IRQ_EN fields */
+#define DMA_RX_IRQ_EN			BIT(0)
+#define DMA_TX_IRQ_EN			BIT(1)
+#define GENI_M_IRQ_EN			BIT(2)
+#define GENI_S_IRQ_EN			BIT(3)
+
+/* SE_DMA_GENERAL_CFG */
+#define DMA_RX_CLK_CGC_ON		BIT(0)
+#define DMA_TX_CLK_CGC_ON		BIT(1)
+#define DMA_AHB_SLV_CFG_ON		BIT(2)
+#define AHB_SEC_SLV_CLK_CGC_ON		BIT(3)
+#define DUMMY_RX_NON_BUFFERABLE		BIT(4)
+#define RX_DMA_ZERO_PADDING_EN		BIT(5)
+#define RX_DMA_IRQ_DELAY_MSK		GENMASK(8, 6)
+
+/* UART M_CMD OP codes */
+#define UART_START_TX		0x1
+#define UART_START_BREAK	0x4
+#define UART_STOP_BREAK		0x5
+
+/* UART S_CMD OP codes */
+#define UART_START_READ		0x1
+#define UART_PARAM		0x1
+
+#define DEF_FIFO_DEPTH_WORDS	16
+#define DEF_TX_WM		2
+#define DEF_FIFO_WIDTH_BITS	32
+
+/* We always configure 4 bytes per FIFO word */
+#define BYTES_PER_FIFO_WORD		4
+
+#define UART_PROTOCOL		2
+
+#define NUM_PACKING_VECTORS 4
+#define PACKING_START_SHIFT 5
+#define PACKING_DIR_SHIFT 4
+#define PACKING_LEN_SHIFT 1
+#define PACKING_STOP_BIT BIT(0)
+#define PACKING_VECTOR_SHIFT 10
+
+struct geni_earlycon_private_data {
+	u32 poll_cached_bytes;
+	unsigned int poll_cached_bytes_cnt;
+
+	u32 write_cached_bytes;
+	unsigned int write_cached_bytes_cnt;
+};
+
+struct qcom_geni_serial_port {
+	struct uart_port uport;
+	unsigned int baud;
+
+	struct geni_earlycon_private_data private_data;
+};
+
+static u32 qcom_geni_earlycon_get_proto(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + GENI_FW_REVISION_RO);
+
+	return (val & FW_REV_PROTOCOL_MSK) >> FW_REV_PROTOCOL_SHFT;
+}
+
+static void qcom_geni_earlycon_config_packing(void __iomem *base, int bpw,
+						int pack_words, bool msb_to_lsb,
+						bool tx_cfg, bool rx_cfg)
+{
+	u32 cfg0, cfg1, cfg[NUM_PACKING_VECTORS] = {0};
+	int len;
+	int temp_bpw = bpw;
+	int idx_start = msb_to_lsb ? bpw - 1 : 0;
+	int idx = idx_start;
+	int idx_delta = msb_to_lsb ? -BITS_PER_BYTE : BITS_PER_BYTE;
+	int ceil_bpw = ALIGN(bpw, BITS_PER_BYTE);
+	int iter = (ceil_bpw * pack_words) / BITS_PER_BYTE;
+	int i;
+
+	if (iter <= 0 || iter > NUM_PACKING_VECTORS)
+		return;
+
+	for (i = 0; i < iter; i++) {
+		len = min_t(int, temp_bpw, BITS_PER_BYTE) - 1;
+		cfg[i] = idx << PACKING_START_SHIFT;
+		cfg[i] |= msb_to_lsb << PACKING_DIR_SHIFT;
+		cfg[i] |= len << PACKING_LEN_SHIFT;
+
+		if (temp_bpw <= BITS_PER_BYTE) {
+			idx = ((i + 1) * BITS_PER_BYTE) + idx_start;
+			temp_bpw = bpw;
+		} else {
+			idx = idx + idx_delta;
+			temp_bpw = temp_bpw - BITS_PER_BYTE;
+		}
+	}
+	cfg[iter - 1] |= PACKING_STOP_BIT;
+	cfg0 = cfg[0] | (cfg[1] << PACKING_VECTOR_SHIFT);
+	cfg1 = cfg[2] | (cfg[3] << PACKING_VECTOR_SHIFT);
+
+	if (tx_cfg) {
+		writel(cfg0, base + SE_GENI_TX_PACKING_CFG0);
+		writel(cfg1, base + SE_GENI_TX_PACKING_CFG1);
+	}
+	if (rx_cfg) {
+		writel(cfg0, base + SE_GENI_RX_PACKING_CFG0);
+		writel(cfg1, base + SE_GENI_RX_PACKING_CFG1);
+	}
+
+	/*
+	 * Number of protocol words in each FIFO entry
+	 * 0 - 4x8, four words in each entry, max word size of 8 bits
+	 * 1 - 2x16, two words in each entry, max word size of 16 bits
+	 * 2 - 1x32, one word in each entry, max word size of 32 bits
+	 * 3 - undefined
+	 */
+	if (pack_words || bpw == 32)
+		writel(bpw / 16, base + SE_GENI_BYTE_GRAN);
+}
+
+static void qcom_geni_earlycon_io_set_mode(void __iomem *base)
+{
+	u32 val;
+
+	val = readl_relaxed(base + SE_IRQ_EN);
+	val |= GENI_M_IRQ_EN | GENI_S_IRQ_EN;
+	val |= DMA_TX_IRQ_EN | DMA_RX_IRQ_EN;
+	writel_relaxed(val, base + SE_IRQ_EN);
+
+	val = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
+	val &= ~GENI_DMA_MODE_EN;
+	writel_relaxed(val, base + SE_GENI_DMA_MODE_EN);
+
+	writel_relaxed(0, base + SE_GSI_EVENT_EN);
+}
+
+static void qcom_geni_earlycon_io_init(void __iomem *base)
+{
+	u32 val;
+
+	val = readl_relaxed(base + GENI_CGC_CTRL);
+	val |= DEFAULT_CGC_EN;
+	writel_relaxed(val, base + GENI_CGC_CTRL);
+
+	val = readl_relaxed(base + SE_DMA_GENERAL_CFG);
+	val |= AHB_SEC_SLV_CLK_CGC_ON | DMA_AHB_SLV_CFG_ON;
+	val |= DMA_TX_CLK_CGC_ON | DMA_RX_CLK_CGC_ON;
+	writel_relaxed(val, base + SE_DMA_GENERAL_CFG);
+
+	writel_relaxed(DEFAULT_IO_OUTPUT_CTRL_MSK, base + GENI_OUTPUT_CTRL);
+	writel_relaxed(FORCE_DEFAULT, base + GENI_FORCE_DEFAULT_REG);
+}
+
+static void qcom_geni_earlycon_irq_clear(void __iomem *base)
+{
+	writel_relaxed(0, base + SE_GSI_EVENT_EN);
+	writel_relaxed(0xffffffff, base + SE_GENI_M_IRQ_CLEAR);
+	writel_relaxed(0xffffffff, base + SE_GENI_S_IRQ_CLEAR);
+	writel_relaxed(0xffffffff, base + SE_DMA_TX_IRQ_CLR);
+	writel_relaxed(0xffffffff, base + SE_DMA_RX_IRQ_CLR);
+	writel_relaxed(0xffffffff, base + SE_IRQ_EN);
+}
+
+static void qcom_geni_earlycon_init(void __iomem *base, u32 rx_wm, u32 rx_rfr)
+{
+	u32 val;
+
+	qcom_geni_earlycon_irq_clear(base);
+	qcom_geni_earlycon_io_init(base);
+	qcom_geni_earlycon_io_set_mode(base);
+
+	writel_relaxed(rx_wm, base + SE_GENI_RX_WATERMARK_REG);
+	writel_relaxed(rx_rfr, base + SE_GENI_RX_RFR_WATERMARK_REG);
+
+	val = readl_relaxed(base + SE_GENI_M_IRQ_EN);
+	val |= M_COMMON_GENI_M_IRQ_EN;
+	writel_relaxed(val, base + SE_GENI_M_IRQ_EN);
+
+	val = readl_relaxed(base + SE_GENI_S_IRQ_EN);
+	val |= S_COMMON_GENI_S_IRQ_EN;
+	writel_relaxed(val, base + SE_GENI_S_IRQ_EN);
+}
+
+static bool qcom_geni_earlycon_poll_bit(struct uart_port *uport,
+				int offset, int field, bool set)
+{
+	u32 reg;
+	unsigned long timeout_us = 20000;
+
+	/*
+	 * Use custom implementation instead of readl_poll_atomic since ktimer
+	 * is not ready at the time of early console.
+	 */
+	while (timeout_us) {
+		reg = readl(uport->membase + offset);
+		if ((bool)(reg & field) == set)
+			return true;
+		udelay(10);
+		timeout_us -= 10;
+	}
+	return false;
+}
+
+static void qcom_geni_earlycon_setup_tx(struct uart_port *uport, u32 xmit_size)
+{
+	u32 m_cmd;
+
+	writel(xmit_size, uport->membase + SE_UART_TX_TRANS_LEN);
+	m_cmd = UART_START_TX << M_OPCODE_SHFT;
+	writel(m_cmd, uport->membase + SE_GENI_M_CMD0);
+}
+
+static void qcom_geni_earlycon_poll_tx_done(struct uart_port *uport)
+{
+	int done;
+	u32 irq_clear = M_CMD_DONE_EN;
+
+	done = qcom_geni_earlycon_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+						M_CMD_DONE_EN, true);
+	if (!done) {
+		writel(M_GENI_CMD_ABORT, uport->membase +
+						SE_GENI_M_CMD_CTRL_REG);
+		irq_clear |= M_CMD_ABORT_EN;
+		qcom_geni_earlycon_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+							M_CMD_ABORT_EN, true);
+	}
+	writel(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
+}
+
+static void qcom_geni_earlycon_abort_rx(struct uart_port *uport)
+{
+	u32 irq_clear = S_CMD_DONE_EN | S_CMD_ABORT_EN;
+
+	writel(S_GENI_CMD_ABORT, uport->membase + SE_GENI_S_CMD_CTRL_REG);
+	qcom_geni_earlycon_poll_bit(uport, SE_GENI_S_CMD_CTRL_REG,
+					S_GENI_CMD_ABORT, false);
+	writel(irq_clear, uport->membase + SE_GENI_S_IRQ_CLEAR);
+	writel(FORCE_DEFAULT, uport->membase + GENI_FORCE_DEFAULT_REG);
+}
+
+static void qcom_geni_earlycon_select_fifo_mode(void __iomem *base)
+{
+	u32 val;
+
+	val = readl_relaxed(base + SE_GENI_DMA_MODE_EN);
+	val &= ~GENI_DMA_MODE_EN;
+	writel_relaxed(val, base + SE_GENI_DMA_MODE_EN);
+}
+
+#ifdef CONFIG_CONSOLE_POLL
+
+static void geni_se_setup_s_cmd(void __iomem *base, u32 cmd, u32 params)
+{
+	u32 s_cmd;
+
+	s_cmd = readl(base + SE_GENI_S_CMD0);
+	s_cmd &= ~(S_OPCODE_MSK | S_PARAMS_MSK);
+	s_cmd |= (cmd << S_OPCODE_SHFT);
+	s_cmd |= (params & S_PARAMS_MSK);
+	writel(s_cmd, base + SE_GENI_S_CMD0);
+}
+
+static int qcom_geni_earlycon_get_char(struct uart_port *uport)
+{
+	struct geni_earlycon_private_data *private_data = uport->private_data;
+	u32 status;
+	u32 word_cnt;
+	int ret;
+
+	if (!private_data->poll_cached_bytes_cnt) {
+		status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
+		writel(status, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+		status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
+		writel(status, uport->membase + SE_GENI_S_IRQ_CLEAR);
+
+		status = readl(uport->membase + SE_GENI_RX_FIFO_STATUS);
+		word_cnt = status & RX_FIFO_WC_MSK;
+		if (!word_cnt)
+			return NO_POLL_CHAR;
+
+		if (word_cnt == 1 && (status & RX_LAST))
+			private_data->poll_cached_bytes_cnt =
+				(status & RX_LAST_BYTE_VALID_MSK) >>
+				RX_LAST_BYTE_VALID_SHFT;
+		else
+			private_data->poll_cached_bytes_cnt = 4;
+
+		private_data->poll_cached_bytes =
+			readl(uport->membase + SE_GENI_RX_FIFOn);
+	}
+
+	private_data->poll_cached_bytes_cnt--;
+	ret = private_data->poll_cached_bytes & 0xff;
+	private_data->poll_cached_bytes >>= 8;
+
+	return ret;
+}
+#endif
+
+static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
+{
+	struct geni_earlycon_private_data *private_data = uport->private_data;
+
+	private_data->write_cached_bytes =
+		(private_data->write_cached_bytes >> 8) | (ch << 24);
+	private_data->write_cached_bytes_cnt++;
+
+	if (private_data->write_cached_bytes_cnt == BYTES_PER_FIFO_WORD) {
+		writel(private_data->write_cached_bytes,
+		       uport->membase + SE_GENI_TX_FIFOn);
+		private_data->write_cached_bytes_cnt = 0;
+	}
+}
+
+static void qcom_geni_earlycon_write(struct console *con, const char *s,
+					unsigned int count)
+{
+	struct earlycon_device *dev = con->data;
+	struct uart_port *uport = &dev->port;
+	struct geni_earlycon_private_data *private_data = uport->private_data;
+
+	int i;
+	u32 bytes_to_send = count;
+
+	for (i = 0; i < count; i++) {
+		/*
+		 * uart_console_write() adds a carriage return for each newline.
+		 * Account for additional bytes to be written.
+		 */
+		if (s[i] == '\n')
+			bytes_to_send++;
+	}
+
+	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	qcom_geni_earlycon_setup_tx(uport, bytes_to_send);
+	for (i = 0; i < count; ) {
+		size_t chars_to_write = 0;
+		size_t avail = DEF_FIFO_DEPTH_WORDS - DEF_TX_WM;
+
+		/*
+		 * If the WM bit never set, then the Tx state machine is not
+		 * in a valid state, so break, cancel/abort any existing
+		 * command. Unfortunately the current data being written is
+		 * lost.
+		 */
+		if (!qcom_geni_earlycon_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+						M_TX_FIFO_WATERMARK_EN, true))
+			break;
+		chars_to_write = min_t(size_t, count - i, avail / 2);
+		uart_console_write(uport, s + i, chars_to_write,
+						qcom_geni_serial_wr_char);
+		writel(M_TX_FIFO_WATERMARK_EN, uport->membase +
+							SE_GENI_M_IRQ_CLEAR);
+		i += chars_to_write;
+	}
+
+	if (private_data->write_cached_bytes_cnt) {
+		private_data->write_cached_bytes >>= BITS_PER_BYTE *
+			(BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
+		writel(private_data->write_cached_bytes,
+		       uport->membase + SE_GENI_TX_FIFOn);
+		private_data->write_cached_bytes_cnt = 0;
+	}
+
+	qcom_geni_earlycon_poll_tx_done(uport);
+}
+
+#ifdef CONFIG_CONSOLE_POLL
+static int qcom_geni_earlycon_read(struct console *con, char *s, unsigned int n)
+{
+	struct earlycon_device *dev = con->data;
+	struct uart_port *uport = &dev->port;
+	int num_read = 0;
+	int ch;
+
+	while (num_read < n) {
+		ch = qcom_geni_earlycon_get_char(uport);
+		if (ch == NO_POLL_CHAR)
+			break;
+		s[num_read++] = ch;
+	}
+
+	return num_read;
+}
+
+static void __init qcom_geni_earlycon_enable_read(void __iomem *base,
+						      struct console *con)
+{
+	geni_se_setup_s_cmd(base, UART_START_READ, 0);
+	con->read = qcom_geni_earlycon_read;
+}
+#else
+static inline void qcom_geni_earlycon_enable_read(void __iomem *base,
+						      struct console *con) { }
+#endif
+
+static struct geni_earlycon_private_data earlycon_private_data;
+
+static int __init qcom_geni_earlycon_setup(struct earlycon_device *dev,
+								const char *opt)
+{
+	struct uart_port *uport = &dev->port;
+	u32 tx_trans_cfg;
+	u32 tx_parity_cfg = 0;	/* Disable Tx Parity */
+	u32 rx_trans_cfg = 0;
+	u32 rx_parity_cfg = 0;	/* Disable Rx Parity */
+	u32 stop_bit_len = 0;	/* Default stop bit length - 1 bit */
+	u32 bits_per_char;
+
+	if (!uport->membase)
+		return -EINVAL;
+
+	uport->private_data = &earlycon_private_data;
+
+	if (qcom_geni_earlycon_get_proto(uport->membase) != UART_PROTOCOL)
+		return -ENXIO;
+	/*
+	 * Ignore Flow control.
+	 * n = 8.
+	 */
+	tx_trans_cfg = UART_CTS_MASK;
+	bits_per_char = BITS_PER_BYTE;
+
+	/*
+	 * Make an unconditional cancel on the main sequencer to reset
+	 * it else we could end up in data loss scenarios.
+	 */
+	qcom_geni_earlycon_poll_tx_done(uport);
+	qcom_geni_earlycon_abort_rx(uport);
+	qcom_geni_earlycon_config_packing(uport->membase, BITS_PER_BYTE,
+				BYTES_PER_FIFO_WORD, false, true, true);
+	qcom_geni_earlycon_init(uport->membase, DEF_FIFO_DEPTH_WORDS / 2,
+			DEF_FIFO_DEPTH_WORDS - 2);
+	qcom_geni_earlycon_select_fifo_mode(uport->membase);
+
+	writel(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
+	writel(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
+	writel(rx_trans_cfg, uport->membase + SE_UART_RX_TRANS_CFG);
+	writel(rx_parity_cfg, uport->membase + SE_UART_RX_PARITY_CFG);
+	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
+	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
+	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
+
+	dev->con->write = qcom_geni_earlycon_write;
+	dev->con->setup = NULL;
+	qcom_geni_earlycon_enable_read(uport->membase, dev->con);
+
+	return 0;
+}
+
+OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
+			qcom_geni_earlycon_setup);
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0d85b55..739598c 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -107,7 +107,6 @@
 #define BYTES_PER_FIFO_WORD		4
 
 struct qcom_geni_private_data {
-	/* NOTE: earlycon port will have NULL here */
 	struct uart_driver *drv;
 
 	u32 poll_cached_bytes;
@@ -1139,102 +1138,6 @@ static int qcom_geni_console_setup(struct console *co, char *options)
 	return uart_set_options(uport, co, baud, parity, bits, flow);
 }
 
-static void qcom_geni_serial_earlycon_write(struct console *con,
-					const char *s, unsigned int n)
-{
-	struct earlycon_device *dev = con->data;
-
-	__qcom_geni_serial_console_write(&dev->port, s, n);
-}
-
-#ifdef CONFIG_CONSOLE_POLL
-static int qcom_geni_serial_earlycon_read(struct console *con,
-					  char *s, unsigned int n)
-{
-	struct earlycon_device *dev = con->data;
-	struct uart_port *uport = &dev->port;
-	int num_read = 0;
-	int ch;
-
-	while (num_read < n) {
-		ch = qcom_geni_serial_get_char(uport);
-		if (ch == NO_POLL_CHAR)
-			break;
-		s[num_read++] = ch;
-	}
-
-	return num_read;
-}
-
-static void __init qcom_geni_serial_enable_early_read(struct geni_se *se,
-						      struct console *con)
-{
-	geni_se_setup_s_cmd(se, UART_START_READ, 0);
-	con->read = qcom_geni_serial_earlycon_read;
-}
-#else
-static inline void qcom_geni_serial_enable_early_read(struct geni_se *se,
-						      struct console *con) { }
-#endif
-
-static struct qcom_geni_private_data earlycon_private_data;
-
-static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
-								const char *opt)
-{
-	struct uart_port *uport = &dev->port;
-	u32 tx_trans_cfg;
-	u32 tx_parity_cfg = 0;	/* Disable Tx Parity */
-	u32 rx_trans_cfg = 0;
-	u32 rx_parity_cfg = 0;	/* Disable Rx Parity */
-	u32 stop_bit_len = 0;	/* Default stop bit length - 1 bit */
-	u32 bits_per_char;
-	struct geni_se se;
-
-	if (!uport->membase)
-		return -EINVAL;
-
-	uport->private_data = &earlycon_private_data;
-
-	memset(&se, 0, sizeof(se));
-	se.base = uport->membase;
-	if (geni_se_read_proto(&se) != GENI_SE_UART)
-		return -ENXIO;
-	/*
-	 * Ignore Flow control.
-	 * n = 8.
-	 */
-	tx_trans_cfg = UART_CTS_MASK;
-	bits_per_char = BITS_PER_BYTE;
-
-	/*
-	 * Make an unconditional cancel on the main sequencer to reset
-	 * it else we could end up in data loss scenarios.
-	 */
-	qcom_geni_serial_poll_tx_done(uport);
-	qcom_geni_serial_abort_rx(uport);
-	geni_se_config_packing(&se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
-			       false, true, true);
-	geni_se_init(&se, DEF_FIFO_DEPTH_WORDS / 2, DEF_FIFO_DEPTH_WORDS - 2);
-	geni_se_select_mode(&se, GENI_SE_FIFO);
-
-	writel(tx_trans_cfg, uport->membase + SE_UART_TX_TRANS_CFG);
-	writel(tx_parity_cfg, uport->membase + SE_UART_TX_PARITY_CFG);
-	writel(rx_trans_cfg, uport->membase + SE_UART_RX_TRANS_CFG);
-	writel(rx_parity_cfg, uport->membase + SE_UART_RX_PARITY_CFG);
-	writel(bits_per_char, uport->membase + SE_UART_TX_WORD_LEN);
-	writel(bits_per_char, uport->membase + SE_UART_RX_WORD_LEN);
-	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
-
-	dev->con->write = qcom_geni_serial_earlycon_write;
-	dev->con->setup = NULL;
-	qcom_geni_serial_enable_early_read(&se, dev->con);
-
-	return 0;
-}
-OF_EARLYCON_DECLARE(qcom_geni, "qcom,geni-debug-uart",
-				qcom_geni_serial_earlycon_setup);
-
 static int __init console_register(struct uart_driver *drv)
 {
 	return uart_register_driver(drv);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

