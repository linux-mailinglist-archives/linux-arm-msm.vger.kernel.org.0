Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50223635B47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236435AbiKWLKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbiKWLIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:37 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52C7B8F98
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:17 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id s5so11653161wru.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbJbOuUac1/7/2K6KBn9Bgk00aMtSqA5zPVvYbFkZOk=;
        b=RqeB9fNk5zpcIFTtoU52wn3zC34Q1EdzSewuRfSpCUWbxvdz3h96H+1Ogm1OczKO88
         K7B+OtUYyiHDN77ZoerAq8bn80RcL6bjQM/kfeIDLe+VC/bHV7NCdw3yZ2brE/dNFfmf
         HxIU51qaQZOaVawrHQWfXFCz3vZydUq5FTroTgIxWMbIqqcH8iurbvi1UmDQaQfLYT5w
         lB0jZR6r4Iu/UoQLbIKpckOHjoJ5NStoF1wa0XHabdoEtfK9UMGTIcA0jkizstlQdlPl
         BnCLnsh13+Slh6IfiIy5qB6v6U+YbpKP5xsV9Gso9Z16QD8o8nbf+pSNKVVUk03tQpBe
         I2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbJbOuUac1/7/2K6KBn9Bgk00aMtSqA5zPVvYbFkZOk=;
        b=1U8Ya++1LGPS/ysV7TBU7/vx2ZAIMzzIB3j6qwXv7sImBYFib9tQhqxjVbwZGfYOCF
         lWeZRcmP871y8vTS+pR4cx30LjI8n+9XQVYmV0IPxhUGTmUhweEcdo5x0VwCAqRiY6Pi
         7e+JdN2M9UH6UQSDGBoQtI53dlTjv4Oiz/U7g7i4PAQFyzPbO8C4/suzifzGSZlmpUbw
         iIKbEOl52gHH7DhaVBZmaQKaDe05yKhJDzXF7fuCVCQb0jcSqc7wJF89AGyJcWv1zk84
         oW6Y+IlwHBufFljjYjmwCJB3oIFlVXiOSBFuOXFrlVvJQRk790DMOVytuExd/zcx5Z9X
         uCwA==
X-Gm-Message-State: ANoB5plT1bXQpnut7/MqmPWoY/kONKmx2er9dWc9lVB0ytby3h9M3nhu
        AGMhVYkWjcUDnAi41F1LIHVHxQ==
X-Google-Smtp-Source: AA0mqf4H9mtivNFnlTKb0zKYueqniEvB2XRVFo1Iyi0Bzd9HEN7nlzOJST9KsSoGm3+QXk4kOOzEyg==
X-Received: by 2002:a5d:5d0d:0:b0:236:ea0d:e49b with SMTP id ch13-20020a5d5d0d000000b00236ea0de49bmr17180291wrb.472.1669201697066;
        Wed, 23 Nov 2022 03:08:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 13/13] tty: serial: qcom-geni-serial: add support for serial engine DMA
Date:   Wed, 23 Nov 2022 12:07:59 +0100
Message-Id: <20221123110759.1836666-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221123110759.1836666-1-brgl@bgdev.pl>
References: <20221123110759.1836666-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The qcom-geni-serial driver currently only works in SE FIFO mode. This
limits the UART speed to around 180 kB/s. In order to achieve higher
speeds we need to use SE DMA mode.

Keep the console port working in FIFO mode but extend the code to use DMA
for the high-speed port.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 289 ++++++++++++++++++++++----
 1 file changed, 247 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 82242a40a95a..0f4ba909c792 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -70,6 +70,8 @@
 #define UART_START_TX			0x1
 /* UART S_CMD OP codes */
 #define UART_START_READ			0x1
+#define UART_PARAM			0x1
+#define UART_PARAM_RFR_OPEN		BIT(7)
 
 #define UART_OVERSAMPLING		32
 #define STALE_TIMEOUT			16
@@ -95,9 +97,11 @@
 /* We always configure 4 bytes per FIFO word */
 #define BYTES_PER_FIFO_WORD		4
 
+#define DMA_RX_BUF_SIZE		2048
+
 struct qcom_geni_device_data {
 	bool console;
-	void (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
+	enum geni_se_xfer_mode mode;
 };
 
 struct qcom_geni_private_data {
@@ -118,9 +122,11 @@ struct qcom_geni_serial_port {
 	u32 tx_fifo_depth;
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
+	dma_addr_t tx_dma_addr;
+	dma_addr_t rx_dma_addr;
 	bool setup;
 	unsigned int baud;
-	void *rx_fifo;
+	void *rx_buf;
 	u32 loopback;
 	bool brk;
 
@@ -552,18 +558,11 @@ static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 
 static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 {
-	struct tty_port *tport;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	u32 num_bytes_pw = port->tx_fifo_width / BITS_PER_BYTE;
-	u32 words = ALIGN(bytes, num_bytes_pw) / num_bytes_pw;
+	struct tty_port *tport = &uport->state->port;
 	int ret;
 
-	tport = &uport->state->port;
-	ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, port->rx_fifo, words);
-	if (drop)
-		return;
-
-	ret = tty_insert_flip_string(tport, port->rx_fifo, bytes);
+	ret = tty_insert_flip_string(tport, port->rx_buf, bytes);
 	if (ret != bytes) {
 		dev_err(uport->dev, "%s:Unable to push data ret %d_bytes %d\n",
 				__func__, ret, bytes);
@@ -578,7 +577,70 @@ static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
 	return !readl(uport->membase + SE_GENI_TX_FIFO_STATUS);
 }
 
-static void qcom_geni_serial_start_tx(struct uart_port *uport)
+static void qcom_geni_serial_stop_tx_dma(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	bool done;
+	u32 status;
+	u32 m_irq_en;
+
+	status = readl(uport->membase + SE_GENI_STATUS);
+	if (!(status & M_GENI_CMD_ACTIVE))
+		return;
+
+	if (port->rx_dma_addr) {
+		geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr,
+				      port->tx_remaining);
+		port->tx_dma_addr = (dma_addr_t)NULL;
+		port->tx_remaining = 0;
+	}
+
+	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
+	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
+	geni_se_cancel_m_cmd(&port->se);
+
+	done = qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
+					 S_CMD_CANCEL_EN, true);
+	if (!done) {
+		geni_se_abort_m_cmd(&port->se);
+		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+					  M_CMD_ABORT_EN, true);
+		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+	}
+
+	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+}
+
+static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct circ_buf *xmit = &uport->state->xmit;
+	unsigned int xmit_size;
+	int ret;
+
+	if (port->tx_dma_addr)
+		return;
+
+	xmit_size = uart_circ_chars_pending(xmit);
+	if (xmit_size < WAKEUP_CHARS)
+		uart_write_wakeup(uport);
+
+	xmit_size = CIRC_CNT_TO_END(xmit->head, xmit->tail, UART_XMIT_SIZE);
+
+	qcom_geni_serial_setup_tx(uport, xmit_size);
+
+	ret = geni_se_tx_dma_prep(&port->se, &xmit->buf[xmit->tail],
+				  xmit_size, &port->tx_dma_addr);
+	if (ret) {
+		dev_err(uport->dev, "unable to start TX SE DMA: %d\n", ret);
+		qcom_geni_serial_stop_tx_dma(uport);
+		return;
+	}
+
+	port->tx_remaining = xmit_size;
+}
+
+static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 	u32 status;
@@ -597,7 +659,7 @@ static void qcom_geni_serial_start_tx(struct uart_port *uport)
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
 
-static void qcom_geni_serial_stop_tx(struct uart_port *uport)
+static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 	u32 status;
@@ -623,14 +685,13 @@ static void qcom_geni_serial_stop_tx(struct uart_port *uport)
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 }
 
-static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop)
+static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
 {
 	u32 status;
 	u32 word_cnt;
 	u32 last_word_byte_cnt;
 	u32 last_word_partial;
 	u32 total_bytes;
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
 	status = readl(uport->membase +	SE_GENI_RX_FIFO_STATUS);
 	word_cnt = status & RX_FIFO_WC_MSK;
@@ -645,10 +706,10 @@ static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop)
 		total_bytes += last_word_byte_cnt;
 	else
 		total_bytes += BYTES_PER_FIFO_WORD;
-	port->dev_data->handle_rx(uport, total_bytes, drop);
+	handle_rx_console(uport, total_bytes, drop);
 }
 
-static void qcom_geni_serial_stop_rx(struct uart_port *uport)
+static void qcom_geni_serial_stop_rx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 	u32 status;
@@ -678,7 +739,7 @@ static void qcom_geni_serial_stop_rx(struct uart_port *uport)
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 	/* Flush the Rx buffer */
 	if (s_irq_status & S_RX_FIFO_LAST_EN)
-		qcom_geni_serial_handle_rx(uport, true);
+		qcom_geni_serial_handle_rx_fifo(uport, true);
 	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
 
 	status = readl(uport->membase + SE_GENI_STATUS);
@@ -686,7 +747,7 @@ static void qcom_geni_serial_stop_rx(struct uart_port *uport)
 		qcom_geni_serial_abort_rx(uport);
 }
 
-static void qcom_geni_serial_start_rx(struct uart_port *uport)
+static void qcom_geni_serial_start_rx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 	u32 status;
@@ -694,7 +755,7 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
 
 	status = readl(uport->membase + SE_GENI_STATUS);
 	if (status & S_GENI_CMD_ACTIVE)
-		qcom_geni_serial_stop_rx(uport);
+		qcom_geni_serial_stop_rx_fifo(uport);
 
 	geni_se_setup_s_cmd(&port->se, UART_START_READ, 0);
 
@@ -707,6 +768,101 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 }
 
+static void qcom_geni_serial_stop_rx_dma(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	u32 status;
+
+	status = readl(uport->membase + SE_GENI_STATUS);
+	if (!(status & S_GENI_CMD_ACTIVE))
+		return;
+
+	geni_se_cancel_s_cmd(&port->se);
+	qcom_geni_serial_poll_bit(uport, SE_GENI_S_IRQ_STATUS,
+				  S_CMD_CANCEL_EN, true);
+
+	status = readl(uport->membase + SE_GENI_STATUS);
+	if (status & S_GENI_CMD_ACTIVE)
+		qcom_geni_serial_abort_rx(uport);
+
+	if (port->rx_dma_addr) {
+		geni_se_rx_dma_unprep(&port->se, port->rx_dma_addr,
+				      DMA_RX_BUF_SIZE);
+		port->rx_dma_addr = (dma_addr_t)NULL;
+	}
+}
+
+static void qcom_geni_serial_start_rx_dma(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	u32 status;
+	int ret;
+
+	status = readl(uport->membase + SE_GENI_STATUS);
+	if (status & S_GENI_CMD_ACTIVE)
+		qcom_geni_serial_stop_rx_dma(uport);
+
+	geni_se_setup_s_cmd(&port->se, UART_START_READ, UART_PARAM_RFR_OPEN);
+
+	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
+				  DMA_RX_BUF_SIZE,
+				  &port->rx_dma_addr);
+	if (ret) {
+		dev_err(uport->dev, "unable to start RX SE DMA: %d\n", ret);
+		qcom_geni_serial_stop_rx_dma(uport);
+	}
+}
+
+static void qcom_geni_serial_handle_rx_dma(struct uart_port *uport, bool drop)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	u32 status;
+	u32 rx_in;
+	int ret;
+
+	status = readl(uport->membase + SE_GENI_STATUS);
+	if (!(status & S_GENI_CMD_ACTIVE))
+		return;
+
+	if (!port->rx_dma_addr)
+		return;
+
+	geni_se_rx_dma_unprep(&port->se, port->rx_dma_addr, DMA_RX_BUF_SIZE);
+	port->rx_dma_addr = (dma_addr_t)NULL;
+
+	rx_in = readl(uport->membase + SE_DMA_RX_LEN_IN);
+	if (!rx_in) {
+		dev_warn(uport->dev, "serial engine reports 0 RX bytes in!\n");
+		return;
+	}
+
+	if (!drop)
+		handle_rx_uart(uport, rx_in, drop);
+
+	ret = geni_se_rx_dma_prep(&port->se, port->rx_buf,
+				  DMA_RX_BUF_SIZE,
+				  &port->rx_dma_addr);
+	if (ret) {
+		dev_err(uport->dev, "unable to start RX SE DMA: %d\n", ret);
+		qcom_geni_serial_stop_rx_dma(uport);
+	}
+}
+
+static void qcom_geni_serial_start_rx(struct uart_port *uport)
+{
+	uport->ops->start_rx(uport);
+}
+
+static void qcom_geni_serial_stop_rx(struct uart_port *uport)
+{
+	uport->ops->stop_rx(uport);
+}
+
+static void qcom_geni_serial_stop_tx(struct uart_port *uport)
+{
+	uport->ops->stop_tx(uport);
+}
+
 static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 					     unsigned int chunk)
 {
@@ -733,8 +889,8 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 	}
 }
 
-static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
-		bool active)
+static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
+					    bool done, bool active)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct circ_buf *xmit = &uport->state->xmit;
@@ -754,7 +910,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 
 	/* All data has been transmitted and acknowledged as received */
 	if (!pending && !status && done) {
-		qcom_geni_serial_stop_tx(uport);
+		qcom_geni_serial_stop_tx_fifo(uport);
 		goto out_write_wakeup;
 	}
 
@@ -797,12 +953,32 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		uart_write_wakeup(uport);
 }
 
+static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct circ_buf *xmit = &uport->state->xmit;
+
+	uart_xmit_advance(uport, port->tx_remaining);
+	geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr, port->tx_remaining);
+	port->tx_dma_addr = (dma_addr_t)NULL;
+	port->tx_remaining = 0;
+
+	if (!uart_circ_empty(xmit))
+		qcom_geni_serial_start_tx_dma(uport);
+
+	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
+		uart_write_wakeup(uport);
+}
+
 static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 {
 	u32 m_irq_en;
 	u32 m_irq_status;
 	u32 s_irq_status;
 	u32 geni_status;
+	u32 dma;
+	u32 dma_tx_status;
+	u32 dma_rx_status;
 	struct uart_port *uport = dev;
 	bool drop_rx = false;
 	struct tty_port *tport = &uport->state->port;
@@ -815,10 +991,15 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 
 	m_irq_status = readl(uport->membase + SE_GENI_M_IRQ_STATUS);
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
+	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
+	dma_rx_status = readl(uport->membase + SE_DMA_RX_IRQ_STAT);
 	geni_status = readl(uport->membase + SE_GENI_STATUS);
+	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	writel(s_irq_status, uport->membase + SE_GENI_S_IRQ_CLEAR);
+	writel(dma_tx_status, uport->membase + SE_DMA_TX_IRQ_CLR);
+	writel(dma_rx_status, uport->membase + SE_DMA_RX_IRQ_CLR);
 
 	if (WARN_ON(m_irq_status & M_ILLEGAL_CMD_EN))
 		goto out_unlock;
@@ -828,10 +1009,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 		tty_insert_flip_char(tport, 0, TTY_OVERRUN);
 	}
 
-	if (m_irq_status & m_irq_en & (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
-		qcom_geni_serial_handle_tx(uport, m_irq_status & M_CMD_DONE_EN,
-					   geni_status & M_GENI_CMD_ACTIVE);
-
 	if (s_irq_status & (S_GP_IRQ_0_EN | S_GP_IRQ_1_EN)) {
 		if (s_irq_status & S_GP_IRQ_0_EN)
 			uport->icount.parity++;
@@ -841,8 +1018,35 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 		port->brk = true;
 	}
 
-	if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
-		qcom_geni_serial_handle_rx(uport, drop_rx);
+	if (dma) {
+		if (dma_tx_status & TX_DMA_DONE)
+			qcom_geni_serial_handle_tx_dma(uport);
+
+		if (dma_rx_status) {
+			if (dma_rx_status & RX_RESET_DONE)
+				goto out_unlock;
+
+			if (dma_rx_status & RX_DMA_PARITY_ERR) {
+				uport->icount.parity++;
+				drop_rx = true;
+			}
+
+			if (dma_rx_status & RX_DMA_BREAK)
+				uport->icount.brk++;
+
+			if (dma_rx_status & (RX_DMA_DONE | RX_EOT))
+				qcom_geni_serial_handle_rx_dma(uport, drop_rx);
+		}
+	} else {
+		if (m_irq_status & m_irq_en &
+		    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
+			qcom_geni_serial_handle_tx_fifo(uport,
+					m_irq_status & M_CMD_DONE_EN,
+					geni_status & M_GENI_CMD_ACTIVE);
+
+		if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
+			qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
+	}
 
 out_unlock:
 	uart_unlock_and_check_sysrq(uport);
@@ -912,7 +1116,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	geni_se_config_packing(&port->se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
 			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
-	geni_se_select_mode(&port->se, GENI_SE_FIFO);
+	geni_se_select_mode(&port->se, port->dev_data->mode);
 	port->setup = true;
 
 	return 0;
@@ -1310,10 +1514,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 
 static const struct uart_ops qcom_geni_console_pops = {
 	.tx_empty = qcom_geni_serial_tx_empty,
-	.stop_tx = qcom_geni_serial_stop_tx,
-	.start_tx = qcom_geni_serial_start_tx,
-	.stop_rx = qcom_geni_serial_stop_rx,
-	.start_rx = qcom_geni_serial_start_rx,
+	.stop_tx = qcom_geni_serial_stop_tx_fifo,
+	.start_tx = qcom_geni_serial_start_tx_fifo,
+	.stop_rx = qcom_geni_serial_stop_rx_fifo,
+	.start_rx = qcom_geni_serial_start_rx_fifo,
 	.set_termios = qcom_geni_serial_set_termios,
 	.startup = qcom_geni_serial_startup,
 	.request_port = qcom_geni_serial_request_port,
@@ -1331,9 +1535,10 @@ static const struct uart_ops qcom_geni_console_pops = {
 
 static const struct uart_ops qcom_geni_uart_pops = {
 	.tx_empty = qcom_geni_serial_tx_empty,
-	.stop_tx = qcom_geni_serial_stop_tx,
-	.start_tx = qcom_geni_serial_start_tx,
-	.stop_rx = qcom_geni_serial_stop_rx,
+	.stop_tx = qcom_geni_serial_stop_tx_dma,
+	.start_tx = qcom_geni_serial_start_tx_dma,
+	.start_rx = qcom_geni_serial_start_rx_dma,
+	.stop_rx = qcom_geni_serial_stop_rx_dma,
 	.set_termios = qcom_geni_serial_set_termios,
 	.startup = qcom_geni_serial_startup,
 	.request_port = qcom_geni_serial_request_port,
@@ -1402,9 +1607,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
 	if (!data->console) {
-		port->rx_fifo = devm_kcalloc(uport->dev,
-			port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
-		if (!port->rx_fifo)
+		port->rx_buf = devm_kzalloc(uport->dev,
+					    DMA_RX_BUF_SIZE, GFP_KERNEL);
+		if (!port->rx_buf)
 			return -ENOMEM;
 	}
 
@@ -1534,12 +1739,12 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
-	.handle_rx = handle_rx_console,
+	.mode = GENI_SE_FIFO,
 };
 
 static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
-	.handle_rx = handle_rx_uart,
+	.mode = GENI_SE_DMA,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
-- 
2.37.2

