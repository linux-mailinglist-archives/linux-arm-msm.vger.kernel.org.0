Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8AC20B992
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2020 22:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgFZUBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jun 2020 16:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgFZUA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jun 2020 16:00:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA158C03E979
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:00:59 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d10so4641450pls.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2020 13:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=;
        b=kw5llNn/AfTSTCkoBZbQldAVoB9RomIr31RSMH32YULEsUd/dNEtUnbSFK+nyM1761
         BEV9eQxusgef5wIJOXwbx+sxLRWVII1VKSaPsKAIJF9ASgE4Ih4oh0BNdZQXvXehiMXV
         3T+C6f2jWfspnhrfPQDbS0hzt5xWsuBwGlahQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qkv/VxHWefC5lUyKA8n1Hz1OCbBvMseIHHitJ71savo=;
        b=GhsskeWchvzfixXSF9KO+Em8OFQ5oN1CXQVePjIhn9Q2fiK227oZv523YwS1qTLEOp
         C+rj4YtTGPteCTSRVb6UGwJHJgejOEKdgR5cZ2vdGzMPNl6im+DYw3Sbzbfj/8WSBGBK
         Go7CxASIslCQuhEkDGgoqboZHiJTpOw2NE4AIiRNQcwBhdcOuX41EoEQnVcyI1AR90aM
         Sa7EGOlzaPlDO35sbtAY7thtUKxCtN0QQ2c4Xv4MIlP0lc5cqyPUtbGLdnJFMiTaHDm0
         1wFUf+Y8rasLwroGW2ONidV/8JRqBG6HcFX9K4Uq3rp2kfmfFhVGGC3GIIYUhCxKY8td
         6YWw==
X-Gm-Message-State: AOAM533Aiw1Ce5IS2PKW4nVt1dlnOTEPdTsjR8q91joAFnXUDGm6/I3h
        0jYVTDt00q3Q+PJesQuSD3I9oA==
X-Google-Smtp-Source: ABdhPJzuo5CGUj0KWrNvbLBx8x80yd0S+PRmolL/V/IiPvTaFV87C8WlpLw6Fq1U4qD3FnOzB8470A==
X-Received: by 2002:a17:902:7109:: with SMTP id a9mr4105159pll.58.1593201659045;
        Fri, 26 Jun 2020 13:00:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id p8sm23461610pgs.29.2020.06.26.13.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:00:58 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     gregkh@linuxfoundation.org
Cc:     evgreen@chromium.org, daniel.thompson@linaro.org,
        akashast@codeaurora.org, swboyd@chromium.org,
        kgdb-bugreport@lists.sourceforge.net,
        linux-arm-msm@vger.kernel.org, sumit.garg@linaro.org,
        vivek.gautam@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 2/2] serial: qcom_geni_serial: Always use 4 bytes per TX FIFO word
Date:   Fri, 26 Jun 2020 13:00:33 -0700
Message-Id: <20200626125844.2.Iabd56347670b9e4e916422773aba5b27943d19ee@changeid>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626200033.1528052-1-dianders@chromium.org>
References: <20200626200033.1528052-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The geni serial driver had a rule that we'd only use 1 byte per FIFO
word for the TX FIFO if we were being used for the serial console.
This is ugly and a bit of a pain.  It's not too hard to fix, so fix
it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 57 +++++++++++++++++----------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4610e391e886..583d903321b5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -103,12 +103,18 @@
 #define DEFAULT_IO_MACRO_IO2_IO3_MASK		GENMASK(15, 4)
 #define IO_MACRO_IO2_IO3_SWAP		0x4640
 
+/* We always configure 4 bytes per FIFO word */
+#define BYTES_PER_FIFO_WORD		4
+
 struct qcom_geni_private_data {
 	/* NOTE: earlycon port will have NULL here */
 	struct uart_driver *drv;
 
 	u32 poll_cached_bytes;
 	unsigned int poll_cached_bytes_cnt;
+
+	u32 write_cached_bytes;
+	unsigned int write_cached_bytes_cnt;
 };
 
 struct qcom_geni_serial_port {
@@ -121,8 +127,6 @@ struct qcom_geni_serial_port {
 	bool setup;
 	int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
 	unsigned int baud;
-	unsigned int tx_bytes_pw;
-	unsigned int rx_bytes_pw;
 	void *rx_fifo;
 	u32 loopback;
 	bool brk;
@@ -390,13 +394,25 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
 static void qcom_geni_serial_wr_char(struct uart_port *uport, int ch)
 {
-	writel(ch, uport->membase + SE_GENI_TX_FIFOn);
+	struct qcom_geni_private_data *private_data = uport->private_data;
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
 }
 
 static void
 __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 				 unsigned int count)
 {
+	struct qcom_geni_private_data *private_data = uport->private_data;
+
 	int i;
 	u32 bytes_to_send = count;
 
@@ -431,6 +447,15 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 							SE_GENI_M_IRQ_CLEAR);
 		i += chars_to_write;
 	}
+
+	if (private_data->write_cached_bytes_cnt) {
+		private_data->write_cached_bytes >>= BITS_PER_BYTE *
+			(BYTES_PER_FIFO_WORD - private_data->write_cached_bytes_cnt);
+		writel(private_data->write_cached_bytes,
+		       uport->membase + SE_GENI_TX_FIFOn);
+		private_data->write_cached_bytes_cnt = 0;
+	}
+
 	qcom_geni_serial_poll_tx_done(uport);
 }
 
@@ -503,7 +528,7 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 	tport = &uport->state->port;
 	for (i = 0; i < bytes; ) {
 		int c;
-		int chunk = min_t(int, bytes - i, port->rx_bytes_pw);
+		int chunk = min_t(int, bytes - i, BYTES_PER_FIFO_WORD);
 
 		ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, buf, 1);
 		i += chunk;
@@ -683,11 +708,11 @@ static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop)
 
 	if (!word_cnt)
 		return;
-	total_bytes = port->rx_bytes_pw * (word_cnt - 1);
+	total_bytes = BYTES_PER_FIFO_WORD * (word_cnt - 1);
 	if (last_word_partial && last_word_byte_cnt)
 		total_bytes += last_word_byte_cnt;
 	else
-		total_bytes += port->rx_bytes_pw;
+		total_bytes += BYTES_PER_FIFO_WORD;
 	port->handle_rx(uport, total_bytes, drop);
 }
 
@@ -720,7 +745,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 	}
 
 	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
-	avail *= port->tx_bytes_pw;
+	avail *= BYTES_PER_FIFO_WORD;
 
 	tail = xmit->tail;
 	chunk = min(avail, pending);
@@ -744,7 +769,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		int c;
 
 		memset(buf, 0, ARRAY_SIZE(buf));
-		tx_bytes = min_t(size_t, remaining, port->tx_bytes_pw);
+		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
 
 		for (c = 0; c < tx_bytes ; c++) {
 			buf[c] = xmit->buf[tail++];
@@ -861,12 +886,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	u32 proto;
 	u32 pin_swap;
 
-	if (uart_console(uport))
-		port->tx_bytes_pw = 1;
-	else
-		port->tx_bytes_pw = 4;
-	port->rx_bytes_pw = 4;
-
 	proto = geni_se_read_proto(&port->se);
 	if (proto != GENI_SE_UART) {
 		dev_err(uport->dev, "Invalid FW loaded, proto: %d\n", proto);
@@ -898,10 +917,8 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	 */
 	if (uart_console(uport))
 		qcom_geni_serial_poll_tx_done(uport);
-	geni_se_config_packing(&port->se, BITS_PER_BYTE, port->tx_bytes_pw,
-						false, true, false);
-	geni_se_config_packing(&port->se, BITS_PER_BYTE, port->rx_bytes_pw,
-						false, false, true);
+	geni_se_config_packing(&port->se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
+			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, GENI_SE_FIFO);
 	port->setup = true;
@@ -1197,8 +1214,8 @@ static int __init qcom_geni_serial_earlycon_setup(struct earlycon_device *dev,
 	 */
 	qcom_geni_serial_poll_tx_done(uport);
 	qcom_geni_serial_abort_rx(uport);
-	geni_se_config_packing(&se, BITS_PER_BYTE, 1, false, true, false);
-	geni_se_config_packing(&se, BITS_PER_BYTE, 4, false, false, true);
+	geni_se_config_packing(&se, BITS_PER_BYTE, BYTES_PER_FIFO_WORD,
+			       false, true, true);
 	geni_se_init(&se, DEF_FIFO_DEPTH_WORDS / 2, DEF_FIFO_DEPTH_WORDS - 2);
 	geni_se_select_mode(&se, GENI_SE_FIFO);
 
-- 
2.27.0.212.ge8ba1cc988-goog

