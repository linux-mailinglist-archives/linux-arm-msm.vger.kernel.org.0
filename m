Return-Path: <linux-arm-msm+bounces-21641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740988FB85F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A23B286A0D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0C114A093;
	Tue,  4 Jun 2024 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BmNw6+PM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C4149E08
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516924; cv=none; b=bLxFpiVKNbgM2UdWZI8mjK+dFMj/JAWDLBJ31bI7IaoAzDnmPeKQE/zQrWIQQysWK6OLLRhxWxkiJLvYXOiXgkIgRtx+x4sTPjnABx1+W74pnwxWf/RVVvIljZ8AyoZNTVS2KV6dxdGm33XqgsxbqRa4Y4g86xPad9Tqwk6M7Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516924; c=relaxed/simple;
	bh=bnvsRG5I2xgj/nMe+fZjbxhUWUQfNMm0FIil9Q0JqCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pu9yu7b70Y48XWey+pqV7g8qsOXOLCdXE8FoRw4WLyusE+QlUudB+ipysacNZTmGcJijDMKrnQmw+DaKxi3qjpqR/FHP9Cy8bUZkqrACf4hwmb5zRU83yT1/VPpRqB8Du0+hrpMGaf/f2hph0/oJFMMlSZ8M2/+rtLNt6Eh9rHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BmNw6+PM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f4c7b022f8so51248415ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717516921; x=1718121721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl3mbGzyk4HljmvFNsl550cvFIcOHwxgUQ0l64G0kBw=;
        b=BmNw6+PM7341w4rAXK/bL/ikeZ4DJSyz4u4kwHae6L48U7FVEH615T+zgvap3mZiSI
         //ykHBzkTHADPdGCphQga1y2SJrf/J3Itz2ytdTndF5XwCHpQkavxMWI6dVa41fDgXrH
         4GugemANtGNbhd4RTDqpQ21/Pw2ZGpgMolats=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717516921; x=1718121721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl3mbGzyk4HljmvFNsl550cvFIcOHwxgUQ0l64G0kBw=;
        b=frPhvkTGJ39rn0Kj8X9j/n8JfccYVh7ri40bz218xSr0X2QIuCpxVt7Z4nhTyJyqJZ
         fYGK2on4G1AJSH0hruk+ejINyTd8HnusECKDvOajsQ0Uzipns8c7M+YqEj17bRPI+24H
         lkbX5t4S+09CtmNAhT+VZ1yXcYp9TTebg2X01aP83roa4MQafy+kzS+EFBHi2b7Ph0w3
         mPYg8IEiYYBsQtPvX5ulFi0nPeBlQwIuWfINO3XhS+9YUVmg8mmf8pqfZdn3KgLfXaDZ
         WPXtsi4fED5X6+cv82VmLy0H1O+U0J94krUXWMGfzSN8SUO/vEUpkwulufPHa2dmmCBH
         p0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWhWBJxZl+B3ibb9IRO8vhOf/iWvmNXsr4H++vv+7R5n7L3LZ5sZFs5Yrit+ofvaQ/j5GA3O9QPiNcJaTlW5ah41UUr3et5pWmPPZhEbA==
X-Gm-Message-State: AOJu0Yz+zrX7q/WHW7SNLMQNfDxfDMkj3OR+mbDBm9hdSYNX6g2QsZiK
	lvq6yLgs/vgQEuN0HTIwcoP8n1rCCl9X+xo8IXDh0o6KvqhE9Mu6kcBZQgGyVg==
X-Google-Smtp-Source: AGHT+IH0W12pPrk3QAm58DX3gocCykT6vzA0P6NewVA10PgYOuE9cfuxJVdhKeLWyi85TIIPwMP4Nw==
X-Received: by 2002:a17:902:d4cf:b0:1f6:73cb:4877 with SMTP id d9443c01a7336-1f673cb4a69mr80614295ad.6.1717516921156;
        Tue, 04 Jun 2024 09:02:01 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632358519sm86118385ad.82.2024.06.04.09.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:02:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v3 7/7] serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
Date: Tue,  4 Jun 2024 09:00:33 -0700
Message-ID: <20240604090028.v3.7.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240604160123.2029413-1-dianders@chromium.org>
References: <20240604160123.2029413-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fact that the Qualcomm GENI hardware interface is based around
"packets" is really awkward to fit into Linux's UART design.
Specifically, in order to send bytes you need to start up a new
"command" saying how many bytes you want to send and then you need to
send all those bytes. Once you've committed to sending that number of
bytes it's very awkward to change your mind and send fewer, especially
if you want to do so without dropping bytes on the ground.

There may be a few cases where you might want to send fewer bytes than
you originally expected:
1. You might want to interrupt the transfer with something higher
   priority, like the kernel console or kdb.
2. You might want to enter system suspend.
3. The user might have killed the program that had queued bytes for
   sending over the UART.

Despite this awkwardness the Linux driver has still tried to send
bytes using large transfers. Whenever the driver started a new
transfer it would look at the number of bytes in the OS's queue and
start a transfer for that many. The idea of using larger transfers is
that it should be more efficient. When you're in the middle of a large
transfer you can get interrupted when the hardware FIFO is close to
empty and add more bytes in. Whenever you get to the end of a transfer
you have to wait until the transfer is totally done before you can add
more bytes and, depending on interrupt latency, that can cause the
UART to idle a bit.

Unfortunately there were lots of corner cases that the Linux driver
didn't handle.

One problem with the current driver is that if the user killed the
program that queued bytes for sending over the UART then bad things
would happen. Before commit 1788cf6a91d9 ("tty: serial: switch from
circ_buf to kfifo") we'd just send stale data out the UART. After that
commit we'll hard lockup.

Another problem with the current driver can be seen if you queue a
bunch of data to the UART and enter kdb. Specifically on a device
_without_ kernel console on the UART, with an agetty on the UART, and
with kgdb on the UART, doing `cat /var/log/messages` and then dropping
into kdb and resuming caused console output to stop.

Give up on trying to use large transfers in FIFO mode on GENI UART
since there doesn't appear to be any way to solve these problems
cleanly. Visually inspecting the console output even after these
patches doesn't show any big pauses.

In order to make this all work:
- Switch the watermark interrupt to just being used to prime the TX
  pump. Once transfers are running, use "done" to queue the next
  batch. As part of this, change the watermark to fire whenever the
  queue is empty.
- Never queue more than what can fit in the FIFO. This means we don't
  need to keep track of a command we're partway through.
- For the console code and kgdb code where we can safely block while
  the queue empties, just do that rather than trying to queue a
  command when one was already in progress (which didn't work so well
  and is why there were some weird/awkward hacks in
  qcom_geni_serial_console_write()).
- Leave the CMD_DONE interrupt enabled all the time since there's
  never any reason we don't want to see it.
- Start using the "SE_GENI_M_IRQ_EN_SET" and "SE_GENI_M_IRQ_EN_CLEAR"
  registers to avoid read-modify-write of the "SE_GENI_M_IRQ_EN"
  register. This could be done in more of the driver if needed but for
  now just update code that's touched.

Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
Fixes: a1fee899e5be ("tty: serial: qcom_geni_serial: Fix softlock")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I'm listing two "fixes" commits here. The first is the kfifo change
since it is very easy to see a hardlockup after that change. Almost
certainly anyone with the kfifo patch wants this patch. I've also
listed a much earlier patch as one being fixed since that was the one
that made us send larger transfers.

I've tested this commit on an sc7180-trogdor board both with and
without kernel console going to the UART. I've tested across some
suspend/resume cycles and with kgdb. I've also confirmed that
bluetooth, which uses the DMA paths in this driver, continues to work.
That all being said, a lot of things change here so I'd love any
testing folks want to do.

I'm not explicitly CCing stable here. The only truly terrible problem
is the hardlockup introduced by the kfifo change. The rest of the
issue have been around for years. If someone wants the fixes ported
back to stable that's fine but IMO unless you're seeing problems it's
not 100% required.

Changes in v3:
- Reword commit message.

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 192 +++++++++++++-------------
 1 file changed, 94 insertions(+), 98 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 46b6674d90c5..204c6f40d7f2 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -78,7 +78,7 @@
 #define GENI_UART_CONS_PORTS		1
 #define GENI_UART_PORTS			3
 #define DEF_FIFO_DEPTH_WORDS		16
-#define DEF_TX_WM			2
+#define DEF_TX_WM			1
 #define DEF_FIFO_WIDTH_BITS		32
 #define UART_RX_WM			2
 
@@ -128,8 +128,8 @@ struct qcom_geni_serial_port {
 	void *rx_buf;
 	u32 loopback;
 	bool brk;
+	bool tx_fifo_stopped;
 
-	unsigned int tx_remaining;
 	unsigned int tx_total;
 	int wakeup_irq;
 	bool rx_tx_swap;
@@ -337,6 +337,14 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
 							M_CMD_ABORT_EN, true);
 	}
 	writel(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+	/*
+	 * Re-enable the TX watermark interrupt when we clear the "done"
+	 * in case we were waiting on the "done" bit before starting a new
+	 * command. The interrupt routine will re-disable this if it's not
+	 * appropriate.
+	 */
+	writel(M_TX_FIFO_WATERMARK_EN, uport->membase +	SE_GENI_M_IRQ_EN_SET);
 }
 
 static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
@@ -358,7 +366,7 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
 	 * get lost.
 	 */
 	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GENMASK(31, 0),
-				       port->tx_total - port->tx_remaining);
+				       port->tx_total);
 
 	/*
 	 * If clearing the FIFO made us inactive then we're done--no need for
@@ -387,14 +395,6 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
-
-	/*
-	 * We've cancelled the current command. "tx_remaining" stores how
-	 * many bytes are left to finish in the current command so we know
-	 * when to start a new command. Since the command was cancelled we
-	 * need to zero "tx_remaining".
-	 */
-	port->tx_remaining = 0;
 }
 
 static void qcom_geni_serial_abort_rx(struct uart_port *uport)
@@ -454,11 +454,12 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
+	qcom_geni_serial_drain_tx_fifo(uport);
+
 	qcom_geni_serial_setup_tx(uport, 1);
 	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true));
 	writel(c, uport->membase + SE_GENI_TX_FIFOn);
-	writel(M_TX_FIFO_WATERMARK_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_poll_tx_done(uport);
 }
 #endif
@@ -488,6 +489,8 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	int i;
 	u32 bytes_to_send = count;
 
+	qcom_geni_serial_drain_tx_fifo(uport);
+
 	for (i = 0; i < count; i++) {
 		/*
 		 * uart_console_write() adds a carriage return for each newline.
@@ -538,7 +541,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	bool locked = true;
 	unsigned long flags;
 	u32 geni_status;
-	u32 irq_en;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -554,38 +556,10 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
 	geni_status = readl(uport->membase + SE_GENI_STATUS);
 
-	if (!locked) {
-		/*
-		 * We can only get here if an oops is in progress then we were
-		 * unable to get the lock. This means we can't safely access
-		 * our state variables like tx_remaining. About the best we
-		 * can do is wait for the FIFO to be empty before we start our
-		 * transfer, so we'll do that.
-		 */
-		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-					  M_TX_FIFO_NOT_EMPTY_EN, false);
-	} else if ((geni_status & M_GENI_CMD_ACTIVE) && !port->tx_remaining) {
-		/*
-		 * It seems we can't interrupt existing transfers if all data
-		 * has been sent, in which case we need to look for done first.
-		 */
-		qcom_geni_serial_poll_tx_done(uport);
-
-		if (!kfifo_is_empty(&uport->state->port.xmit_fifo)) {
-			irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-			writel(irq_en | M_TX_FIFO_WATERMARK_EN,
-					uport->membase + SE_GENI_M_IRQ_EN);
-		}
-	}
-
 	__qcom_geni_serial_console_write(uport, s, count);
 
-
-	if (locked) {
-		if (port->tx_remaining)
-			qcom_geni_serial_setup_tx(uport, port->tx_remaining);
+	if (locked)
 		uart_port_unlock_irqrestore(uport, flags);
-	}
 }
 
 static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
@@ -662,9 +636,9 @@ static void qcom_geni_serial_stop_tx_dma(struct uart_port *uport)
 
 	if (port->tx_dma_addr) {
 		geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr,
-				      port->tx_remaining);
+				      port->tx_total);
 		port->tx_dma_addr = 0;
-		port->tx_remaining = 0;
+		port->tx_total = 0;
 	}
 
 	geni_se_cancel_m_cmd(&port->se);
@@ -709,26 +683,27 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 		qcom_geni_serial_stop_tx_dma(uport);
 		return;
 	}
-
-	port->tx_remaining = xmit_size;
 }
 
 static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 {
-	u32 irq_en;
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
-	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
-	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
-	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
+	port->tx_fifo_stopped = false;
+
+	/* Prime the pump to get data flowing. */
+	writel(M_TX_FIFO_WATERMARK_EN, uport->membase +	SE_GENI_M_IRQ_EN_SET);
 }
 
 static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 {
-	u32 irq_en;
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
-	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
-	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
+	/*
+	 * We can't do anything to safely pause the bytes that have already
+	 * been queued up so just set a flag saying we shouldn't queue any more.
+	 */
+	port->tx_fifo_stopped = true;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -896,10 +871,20 @@ static void qcom_geni_serial_stop_tx(struct uart_port *uport)
 	uport->ops->stop_tx(uport);
 }
 
+static void qcom_geni_serial_enable_cmd_done(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	/* If we're not in FIFO mode we don't use CMD_DONE. */
+	if (port->dev_data->mode != GENI_SE_FIFO)
+		return;
+
+	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_EN_SET);
+}
+
 static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 					     unsigned int chunk)
 {
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	unsigned int tx_bytes, remaining = chunk;
 	u8 buf[BYTES_PER_FIFO_WORD];
 
@@ -912,52 +897,74 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
 
 		remaining -= tx_bytes;
-		port->tx_remaining -= tx_bytes;
 	}
 }
 
-static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
-					    bool done, bool active)
+static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct tty_port *tport = &uport->state->port;
 	size_t avail;
 	size_t pending;
 	u32 status;
-	u32 irq_en;
 	unsigned int chunk;
+	bool active;
 
-	status = readl(uport->membase + SE_GENI_TX_FIFO_STATUS);
-
-	/* Complete the current tx command before taking newly added data */
-	if (active)
-		pending = port->tx_remaining;
-	else
-		pending = kfifo_len(&tport->xmit_fifo);
+	/*
+	 * The TX watermark interrupt is only used to "prime the pump" for
+	 * transfers. Once transfers have been kicked off we always use the
+	 * "done" interrupt to queue the next batch. Once were here we can
+	 * always disable the TX watermark interrupt.
+	 *
+	 * NOTE: we use the TX watermark in this way because we don't ever
+	 * kick off TX transfers larger than we can stuff into the FIFO. This
+	 * is because bytes from the OS's circular queue can disappear and
+	 * there's no known safe/non-blocking way to cancel the larger
+	 * transfer when bytes disappear. See qcom_geni_serial_drain_tx_fifo()
+	 * for an example of a safe (but blocking) way to drain, but that's
+	 * not appropriate in an IRQ handler. We also can't just kick off one
+	 * large transfer and queue bytes whenever because we're using 4 bytes
+	 * per FIFO word and thus we can only queue non-multiple-of-4 bytes as
+	 * in the last word of a transfer.
+	 */
+	writel(M_TX_FIFO_WATERMARK_EN, uport->membase +	SE_GENI_M_IRQ_EN_CLEAR);
 
-	/* All data has been transmitted and acknowledged as received */
-	if (!pending && !status && done) {
-		qcom_geni_serial_stop_tx_fifo(uport);
+	/*
+	 * If we've got an active TX command running then we expect to still
+	 * see the "done" bit in the future and we can't kick off another
+	 * transfer till then. Bail. NOTE: it's important that we read "active"
+	 * after we've cleared the "done" interrupt (which the caller already
+	 * did for us) so that we know that if we show as non-active we're
+	 * guaranteed to later get "done".
+	 *
+	 * If nothing is pending we _also_ want to bail. Later start_tx()
+	 * will start transfers again by temporarily turning on the TX
+	 * watermark.
+	 */
+	active = readl(uport->membase + SE_GENI_STATUS) & M_GENI_CMD_ACTIVE;
+	pending = port->tx_fifo_stopped ? 0 : kfifo_len(&tport->xmit_fifo);
+	if (active || !pending)
 		goto out_write_wakeup;
-	}
 
+	/* Calculate how much space is available in the FIFO right now. */
+	status = readl(uport->membase + SE_GENI_TX_FIFO_STATUS);
 	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
 	avail *= BYTES_PER_FIFO_WORD;
 
-	chunk = min(avail, pending);
-	if (!chunk)
+	/*
+	 * It's a bit odd if we get here and have bytes pending and we're
+	 * handling a "done" or "TX watermark" interrupt but we don't
+	 * have space in the FIFO. Stick in a warning and bail.
+	 */
+	if (!avail) {
+		dev_warn(uport->dev, "FIFO unexpectedly out of space\n");
 		goto out_write_wakeup;
-
-	if (!port->tx_remaining) {
-		qcom_geni_serial_setup_tx(uport, pending);
-		port->tx_remaining = pending;
-
-		irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-		if (!(irq_en & M_TX_FIFO_WATERMARK_EN))
-			writel(irq_en | M_TX_FIFO_WATERMARK_EN,
-					uport->membase + SE_GENI_M_IRQ_EN);
 	}
 
+
+	/* We're ready to throw some bytes into the FIFO. */
+	chunk = min(avail, pending);
+	qcom_geni_serial_setup_tx(uport, chunk);
 	qcom_geni_serial_send_chunk_fifo(uport, chunk);
 
 	/*
@@ -965,17 +972,9 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	 * cleared it in qcom_geni_serial_isr it will have already reasserted
 	 * so we must clear it again here after our writes.
 	 */
-	writel(M_TX_FIFO_WATERMARK_EN,
-			uport->membase + SE_GENI_M_IRQ_CLEAR);
+	writel(M_TX_FIFO_WATERMARK_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 
 out_write_wakeup:
-	if (!port->tx_remaining) {
-		irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-		if (irq_en & M_TX_FIFO_WATERMARK_EN)
-			writel(irq_en & ~M_TX_FIFO_WATERMARK_EN,
-					uport->membase + SE_GENI_M_IRQ_EN);
-	}
-
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(uport);
 }
@@ -985,10 +984,10 @@ static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct tty_port *tport = &uport->state->port;
 
-	uart_xmit_advance(uport, port->tx_remaining);
-	geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr, port->tx_remaining);
+	uart_xmit_advance(uport, port->tx_total);
+	geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr, port->tx_total);
 	port->tx_dma_addr = 0;
-	port->tx_remaining = 0;
+	port->tx_total = 0;
 
 	if (!kfifo_is_empty(&tport->xmit_fifo))
 		qcom_geni_serial_start_tx_dma(uport);
@@ -1002,7 +1001,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	u32 m_irq_en;
 	u32 m_irq_status;
 	u32 s_irq_status;
-	u32 geni_status;
 	u32 dma;
 	u32 dma_tx_status;
 	u32 dma_rx_status;
@@ -1020,7 +1018,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
 	dma_rx_status = readl(uport->membase + SE_DMA_RX_IRQ_STAT);
-	geni_status = readl(uport->membase + SE_GENI_STATUS);
 	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
@@ -1067,9 +1064,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	} else {
 		if (m_irq_status & m_irq_en &
 		    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
-			qcom_geni_serial_handle_tx_fifo(uport,
-					m_irq_status & M_CMD_DONE_EN,
-					geni_status & M_GENI_CMD_ACTIVE);
+			qcom_geni_serial_handle_tx_fifo(uport);
 
 		if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
 			qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
@@ -1177,6 +1172,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	qcom_geni_serial_enable_cmd_done(uport);
 	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
-- 
2.45.1.288.g0e0cd299f1-goog


