Return-Path: <linux-arm-msm+bounces-22229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22E902B9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BFF1F2308A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85DC15383E;
	Mon, 10 Jun 2024 22:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GBJ1TO+S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784E2153838
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058362; cv=none; b=E3rnUBCnwh6t8WjosurEc2oLOVDb1ccScjesRJdY1EkJ446eDhmxTslvGrFK6ZgFADZLLu5RYvKRq/vpN2azrbHIrlddYeOrz/2HC9EWo9Q7x/XwmW6ZvK09+yOh6ObmUWI6lxltnTp4Gnse41pqrN/olQ4yvJtNLUajSayQCH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058362; c=relaxed/simple;
	bh=6+I43QryeRZn3uz/tfN9x/osf/RymHpjsLm8l8LWIm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7hvAEhexqZpXJsgHmYj9k9kQqvBb/RjZUEtjjWIPxdqmX3Xl/oqn4neujCoEV7Qvx4z9Us/RaPfK2uPahNs8Z5WJeEeJVA4NuBtB71LKj2MaQncseiprPESOJmvxF4ZGIW0T9q9imGetTeMh9ts4Qoaf15/WC+mXrU205P2t0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GBJ1TO+S; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c4f3e0e3d2so3810145a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058359; x=1718663159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnIzY2tV+Slvvd3Qjhbvofz2wsAqh6ZmPde9xHGHuDI=;
        b=GBJ1TO+Sy09Yi8P+lztydW+FcBZwMmEqaR7unAtR3moC+D8WDoByM+EXP+WEdmlkNN
         Ex33ZPzipJTMUJ0ZuXKobjaY1oJ18HHQFyzQJhi4Vv1dy9s33cZFt45bnE++9IprFCLw
         1wZDfuu0LYMYmoDIaM8hIigqSJreU6UKdxy3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058359; x=1718663159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnIzY2tV+Slvvd3Qjhbvofz2wsAqh6ZmPde9xHGHuDI=;
        b=J/KWpFX1R2GaOacmKwsQmfGksGShsOqQ02BNpFHKi2u/sgzR/j+QLwQJ9ZVddOzfT6
         bSN+w/uZkh2MNZIzUcUxy4a8tDge6ZAx+z7iofSoUC5nFyU1KXS/8TfxB6DsGnvoT4a2
         OI92pXEoqc/9TjW9JPkZYZlkmvrtSdaifs9yAH9qcGq08fGYv237XZwh8HevuxG0ZvaA
         80eD0prsAgSvYD2dF3XnNj0bRJ0+Kyg0po77rLyDuoAOS2kCeZdnBvhwzFIkIVUf0Iea
         C3pBYinXNJnlTdyJhrx6SJQFFs0nGT8NCKmezpJx5PbZtRZ+2pznmnAFt/36TEChOBiL
         uXbA==
X-Forwarded-Encrypted: i=1; AJvYcCVJtiHmHWrbIAHqM+AWgHzrAHhDW8PZEaMZxcglE5CO8SbUfvi+BUyIDdZrguRR827597c7q4sJoe3FSljH/rI3wHc32tsNK2PcRDR5tw==
X-Gm-Message-State: AOJu0YwR/FflhKm4WASwxoazYxaNMg3Hk9uoT7U6p4BralidN/kOL1aq
	L6kpxSUd9KwvVixARuwpO7z4vEkVf/GfSG/2xARL7nhasz5/hUoakd+K1HrAVQ==
X-Google-Smtp-Source: AGHT+IFyPIZTVRO3u8p+/f3HQcgVHfwhXmvmYNXiv7/vm0rg/P3dRhbbWWRsNJWW3IqUelwkr0jKaw==
X-Received: by 2002:a17:902:ea12:b0:1f4:8a14:f4cd with SMTP id d9443c01a7336-1f6d0311441mr129847625ad.39.1718058358654;
        Mon, 10 Jun 2024 15:25:58 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:bba2:69f4:1b51:d0f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71029e223sm29212325ad.170.2024.06.10.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:25:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 8/8] serial: qcom-geni: Rework TX in FIFO mode to fix hangs/lockups
Date: Mon, 10 Jun 2024 15:24:26 -0700
Message-ID: <20240610152420.v4.8.I1af05e555c42a9c98435bb7aee0ee60e3dcd015e@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>
References: <20240610222515.3023730-1-dianders@chromium.org>
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

(no changes since v3)

Changes in v3:
- Reword commit message.

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 192 +++++++++++++-------------
 1 file changed, 94 insertions(+), 98 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 1a66424f0f5f..9d71296eae11 100644
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
@@ -336,6 +336,14 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
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
@@ -357,7 +365,7 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
 	 * get lost.
 	 */
 	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LENGTH,
-				       port->tx_total - port->tx_remaining);
+				       port->tx_total);
 
 	/*
 	 * If clearing the FIFO made us inactive then we're done--no need for
@@ -386,14 +394,6 @@ static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
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
@@ -453,11 +453,12 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
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
@@ -487,6 +488,8 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	int i;
 	u32 bytes_to_send = count;
 
+	qcom_geni_serial_drain_tx_fifo(uport);
+
 	for (i = 0; i < count; i++) {
 		/*
 		 * uart_console_write() adds a carriage return for each newline.
@@ -537,7 +540,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	bool locked = true;
 	unsigned long flags;
 	u32 geni_status;
-	u32 irq_en;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -553,38 +555,10 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
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
@@ -661,9 +635,9 @@ static void qcom_geni_serial_stop_tx_dma(struct uart_port *uport)
 
 	if (port->tx_dma_addr) {
 		geni_se_tx_dma_unprep(&port->se, port->tx_dma_addr,
-				      port->tx_remaining);
+				      port->tx_total);
 		port->tx_dma_addr = 0;
-		port->tx_remaining = 0;
+		port->tx_total = 0;
 	}
 
 	geni_se_cancel_m_cmd(&port->se);
@@ -708,26 +682,27 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
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
@@ -895,10 +870,20 @@ static void qcom_geni_serial_stop_tx(struct uart_port *uport)
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
 
@@ -911,52 +896,74 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
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
@@ -964,17 +971,9 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
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
@@ -984,10 +983,10 @@ static void qcom_geni_serial_handle_tx_dma(struct uart_port *uport)
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
@@ -1001,7 +1000,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	u32 m_irq_en;
 	u32 m_irq_status;
 	u32 s_irq_status;
-	u32 geni_status;
 	u32 dma;
 	u32 dma_tx_status;
 	u32 dma_rx_status;
@@ -1019,7 +1017,6 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	s_irq_status = readl(uport->membase + SE_GENI_S_IRQ_STATUS);
 	dma_tx_status = readl(uport->membase + SE_DMA_TX_IRQ_STAT);
 	dma_rx_status = readl(uport->membase + SE_DMA_RX_IRQ_STAT);
-	geni_status = readl(uport->membase + SE_GENI_STATUS);
 	dma = readl(uport->membase + SE_GENI_DMA_MODE_EN);
 	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	writel(m_irq_status, uport->membase + SE_GENI_M_IRQ_CLEAR);
@@ -1066,9 +1063,7 @@ static irqreturn_t qcom_geni_serial_isr(int isr, void *dev)
 	} else {
 		if (m_irq_status & m_irq_en &
 		    (M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN))
-			qcom_geni_serial_handle_tx_fifo(uport,
-					m_irq_status & M_CMD_DONE_EN,
-					geni_status & M_GENI_CMD_ACTIVE);
+			qcom_geni_serial_handle_tx_fifo(uport);
 
 		if (s_irq_status & (S_RX_FIFO_WATERMARK_EN | S_RX_FIFO_LAST_EN))
 			qcom_geni_serial_handle_rx_fifo(uport, drop_rx);
@@ -1176,6 +1171,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	qcom_geni_serial_enable_cmd_done(uport);
 	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
-- 
2.45.2.505.gda0bf45e8d-goog


