Return-Path: <linux-arm-msm+bounces-21165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADC48D55BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE5CE1C22DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167AB194C76;
	Thu, 30 May 2024 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iREbt5V0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24538194C64
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109198; cv=none; b=NZH7NVCR+h04zPY1PcMbCHeTlyvD5/ht8CROg+pKs5XO3HKjMTEwracp99pm1MvRBKkoErKl+p1agWkdda8Nbo0+UizPXRxGkEdwoXYjOEvsCGtskvP7MLWNRacUPcPUs3OivZvo254m4HjuhTRzcvJQBiRFT0NI51uWLET9SOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109198; c=relaxed/simple;
	bh=dYQG2uZdy/1rVNXujDXBm4SlFNLD74RGPIkgsTY0dMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aZ2X2B/IXFHfMgDLbWuykzMR5MZlGB1lWHq4q3oVnN2rMsVDyfyXv+lkL33CHuJe8cxVMysMLJMtYdzPYjls1Lvim1UTHt4uAj5qoz0Cyrd0k7pmYVm9AE2tQvtWUzlM0D99iE8F5btB0bHB7UWtbRwmf+zEFb17pDP4yE6C4Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iREbt5V0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f47f07aceaso3876565ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109195; x=1717713995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsgVqar/ZibnobIU2tZqJgfYFupn4BGm0JZevOJYAUY=;
        b=iREbt5V0MPhTw0SIHk8bpoJdINZGAgaF9ADdNMB4/9MXvVpJO1sqX3RvUyfP/rSZ6z
         2tRzCIp9bBdudJtssjhtK6DeujqBzeNc/DIdFc3llZ2yY0phBJ4PdZ/sv8wl/CcNGcJh
         oJbh1LHIeLAqvCJvKcndt6LaKvF6Hardkis5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109195; x=1717713995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsgVqar/ZibnobIU2tZqJgfYFupn4BGm0JZevOJYAUY=;
        b=c50KYo2imEf9UCkWU5R6pYNtxQGr3RI9KYlNso+TOEggcgib8U1x+UZkYul65CZtVt
         +vMQ9oLDj8aug2tywCnO3AjFsVDGppy1apQ4/uJbJ7LdJCYdkKvBvY1XhjyyI3WN+Q8w
         CQrgXMlqq5FhCzavQOkdlb5EFjo/UAQBAsnrEV0bDNwNvtVDsHWbXorGhqVZ+SMLTzg4
         X5CbQwg24a/wXGHG+03mN4JZAtR4WS22u6jxGmUxuge74OcrnZTR05jm52EwKLDIqs0D
         gpDN2fhKGd0f0y8PimJQSoxZWnNwwIAi/fDBYuiQGjBfWceRkJK60Xp+uxh+LRmlihFO
         YR1w==
X-Gm-Message-State: AOJu0YzaRZM6zDo3kH5sU3EWv9tnLwQMYswfE6ZGogTvkJp4ccbeu70a
	OscPFUg8R6duVPS5cOdYbDuK+yC5c4H2aWkC2IrlHU7qXcaJH311y65uhjZ5Wg==
X-Google-Smtp-Source: AGHT+IF/BnecJTcUljBsfx7blUPfSOOrIEqvvao0pHu4k4PsQWZAQS7ovwUVFXdlILFJGbMA9vd5WA==
X-Received: by 2002:a17:903:2285:b0:1e2:9aa7:fd21 with SMTP id d9443c01a7336-1f6370a77admr1664575ad.54.1717109195265;
        Thu, 30 May 2024 15:46:35 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:34 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v2 7/7] serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
Date: Thu, 30 May 2024 15:45:59 -0700
Message-ID: <20240530154553.v2.7.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530224603.730042-1-dianders@chromium.org>
References: <20240530224603.730042-1-dianders@chromium.org>
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
that it should be more efficient. When we're in the middle of a large
transfer we can get interrupted when the hardware FIFO is close to
empty and add more bytes in. Whenever we get to the end of a transfer
we have to wait until the transfer is totally done before we can add
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
_without_ kernel console on the UART, with an agetty on the uart, and
with kgdb on the UART, I did `cat /var/log/messages` and then dropped
into kdb. After resuming from kdb console output stopped.

Let's give up on trying to use large transfers in FIFO mode on GENI
UART since there doesn't appear to be any way to solve these problems
cleanly. Visually inspecting the console output even after these
patches doesn't show any big pauses so this should be fine.

In order to make this all work:
- Switch the watermark interrupt to just being used to prime the TX
  pump. Once transfers are running we'll use "done" to queue the next
  batch. As part of this, change the watermark to fire whenever the
  queue is empty.
- Never queue more than what can fit in the FIFO. This means we don't
  need to keep track of a command we're partway through.
- For the console code and kgdb code where we can safely block while
  the queue empties we can just do that rather than trying to queue a
  command when one was already in progress. This didn't actually work
  so well which is presumably why there were some weird/awkward hacks
  in qcom_geni_serial_console_write().
- Leave the CMD_DONE interrupt enabled all the time since there's
  never any reason we don't want to see it.
- Start using the "SE_GENI_M_IRQ_EN_SET" and "SE_GENI_M_IRQ_EN_CLEAR"
  registers to avoid read-modify-write of the "SE_GENI_M_IRQ_EN"
  register. We could do this in more of the driver if needed but for
  now just update code we're touching.

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

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 192 +++++++++++++-------------
 1 file changed, 94 insertions(+), 98 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 10aeb0313f9b..853f5288dde5 100644
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
 
@@ -129,8 +129,8 @@ struct qcom_geni_serial_port {
 	void *rx_buf;
 	u32 loopback;
 	bool brk;
+	bool tx_fifo_stopped;
 
-	unsigned int tx_remaining;
 	unsigned int tx_total;
 	int wakeup_irq;
 	bool rx_tx_swap;
@@ -363,6 +363,14 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
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
@@ -384,7 +392,7 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
 	 * get lost.
 	 */
 	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, 0xffffffff,
-				       port->tx_total - port->tx_remaining);
+				       port->tx_total);
 
 	/*
 	 * If clearing the FIFO made us inactive then we're done--no need for
@@ -413,14 +421,6 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
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
@@ -480,11 +480,12 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
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
@@ -514,6 +515,8 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	int i;
 	u32 bytes_to_send = count;
 
+	qcom_geni_serial_drain_tx_fifo(uport);
+
 	for (i = 0; i < count; i++) {
 		/*
 		 * uart_console_write() adds a carriage return for each newline.
@@ -564,7 +567,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	bool locked = true;
 	unsigned long flags;
 	u32 geni_status;
-	u32 irq_en;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -580,38 +582,10 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
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
@@ -688,9 +662,9 @@ static void qcom_geni_serial_stop_tx_dma(struct uart_port *uport)
 
 	if (port->tx_dma_addr) {
 		geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr,
-				      port->tx_remaining);
+				      port->tx_total);
 		port->tx_dma_addr = 0;
-		port->tx_remaining = 0;
+		port->tx_total = 0;
 	}
 
 	geni_se_cancel_m_cmd(&port->se);
@@ -735,26 +709,27 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
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
@@ -922,10 +897,20 @@ static void qcom_geni_serial_stop_tx(struct uart_port *uport)
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
 
@@ -938,52 +923,74 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
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
@@ -991,17 +998,9 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
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
@@ -1011,10 +1010,10 @@ static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
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
@@ -1028,7 +1027,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	u32 m_irq_en;
 	u32 m_irq_status;
 	u32 s_irq_status;
-	u32 geni_status;
 	u32 dma;
 	u32 dma_tx_status;
 	u32 dma_rx_status;
@@ -1046,7 +1044,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
 	dma_rx_status = readl(uport->membase + SE_DMA_RX_IRQ_STAT);
-	geni_status = readl(uport->membase + SE_GENI_STATUS);
 	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
@@ -1093,9 +1090,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	} else {
 		if (m_irq_status & m_irq_en &
 		    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
-			qcom_geni_serial_handle_tx_fifo(uport,
-					m_irq_status & M_CMD_DONE_EN,
-					geni_status & M_GENI_CMD_ACTIVE);
+			qcom_geni_serial_handle_tx_fifo(uport);
 
 		if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
 			qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
@@ -1203,6 +1198,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	qcom_geni_serial_enable_cmd_done(uport);
 	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
-- 
2.45.1.288.g0e0cd299f1-goog


