Return-Path: <linux-arm-msm+bounces-21164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8158D55B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9B01C2212A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604EB190693;
	Thu, 30 May 2024 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EsaDtyaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40E5183977
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109195; cv=none; b=LTjvAPSh62Y7e0BicTBnjTA6t3sXYtNKWraI46+HaENTiCB+Cn3lLVRUWUV+JFRC/LTLQ2nNH0qSvcJjZB53NMjxilqX06RGKb4FJ3Lls9SV/7pzM7GOIWuARMvOj3UrRMDOadVCNKU9hXx+ZrOifJDrDV2zyHxIS5QxOtRT50E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109195; c=relaxed/simple;
	bh=b6j3qep3/dVPBYOEA9OobtieM0cWDCA0y3UiGOZqxLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UdxLz9BZ7wb6DJKjivksn98Lm2gWLaVKASkLrdpTVyAmeXgIqpYVcdr+tQqL1gu+RpCDSnc5drPK8wbMJuhQiLI1LhvohFWy/TnsnOO/X2yAfjigog4vu8aHWNRzOBH667yoyTznY1Bkhesl8AS+qlQRdF7WkNYiqvAXAmcvWII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EsaDtyaO; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f3469382f2so10991505ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109193; x=1717713993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRt2EVlSGWfvgcEGvpTae3Wd9PPOHk66+wob5fd4cjk=;
        b=EsaDtyaOr6OA6ew2C9XkG8QpxMOvKG1hqu1ObiqSk5KT9f+vDWoMH5CkMrN+4RFvuq
         RJrIgn0veAQS44WdcUuSF0xXz2O0Jpp5jJnZIyVM2b+lYk54mf9YU2T44glRxXsUm04P
         oLXjiL0QZp22kaxCGrc8Pa6MV2khzRoikgIyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109193; x=1717713993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRt2EVlSGWfvgcEGvpTae3Wd9PPOHk66+wob5fd4cjk=;
        b=AJdvMEwv3LDi/AgH0wSxWELX1kttUDuTx6sqS7VRW73FH0BvUTAFWrJSeck1YSV1EZ
         Ji/n3lC785tpx3rCM+QGrwVZczL8J849p1DX/MUFiI2thPccw0Xn2Buv+GeeUQrP+ANk
         204zyZ7JxTSY4dUqOpQh69f4km/zmiRU10hTwbaM9jssiRXatgGvnUWXyhxPaiVAudNr
         BGtzW1ATR02WD+zE03Ths5aYnHJmvSzI1EbdKBd/PXevwisZnMu25InhFlHgrYMsMogs
         z4oKoB1nq4GoE1EKxTlEfxZzpeW8FIhroK0ckdK1c7QenKHl2WpewR9jDjaJGPZDT4bL
         GFVA==
X-Gm-Message-State: AOJu0Yy3ytKvAYgKVV+ib9pol5fn38QrjXKDxkDBmQCJQ+WCtSb3rfK+
	BIgnwKj3T2KIMgQeMTWTWGs//Xn2Eh3J8UOMAVROOXXhlfFZ2EFs0roGgW646w==
X-Google-Smtp-Source: AGHT+IFLS38Awc/uP8zdYxlKSCJW6ZygB1Oo+TXQ+lWWKB6xxCk7S6Eujk3HAmkCnnByluAGVdPUxQ==
X-Received: by 2002:a17:902:f68b:b0:1e8:5cf9:37fc with SMTP id d9443c01a7336-1f63701f236mr3384745ad.35.1717109192829;
        Thu, 30 May 2024 15:46:32 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:31 -0700 (PDT)
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
Subject: [PATCH v2 6/7] serial: qcom-geni: Fix suspend while active UART xfer
Date: Thu, 30 May 2024 15:45:58 -0700
Message-ID: <20240530154553.v2.6.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530224603.730042-1-dianders@chromium.org>
References: <20240530224603.730042-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On devices using Qualcomm's GENI UART it is possible to get the UART
stuck such that it no longer outputs data. Specifically, I could
reproduce this problem by logging in via an agetty on the debug serial
port (which was _not_ used for kernel console) and running:
  cat /var/log/messages
...and then (via an SSH session) forcing a few suspend/resume cycles.

Digging into this showed a number of problems that are all related.

The root of the problems was with qcom_geni_serial_stop_tx_fifo()
which is called as part of the suspend process. Specific problems with
that function:
- When we cancel an in-progress "tx" command it doesn't appear to
  fully drain the FIFO. That meant qcom_geni_serial_tx_empty()
  continued to report that the FIFO wasn't empty. The
  qcom_geni_serial_start_tx_fifo() function didn't re-enable
  interrupts in this case so we'd never start transferring again.
- We cancelled the current "tx" command but we forgot to zero out
  "tx_remaining". This confused logic elsewhere in the driver
- From experimentation, it appears that cancelling the "tx" command
  could drop some of the queued up bytes. While maybe not the end of
  the world, it doesn't seem like we should be dropping bytes when
  stopping the FIFO, which is defined more of a "pause".

One idea to fix the above would be to add FIFO draining to
qcom_geni_serial_stop_tx_fifo(). However, digging into the
documentation in serial_core.h for stop_tx() makes this seem like the
wrong choice. Specifically stop_tx() is called with local interrupts
disabled. Waiting for a FIFO (which might be 64 bytes big) to drain at
115.2 kbps doesn't seem like a wise move.

Ideally qcom_geni_serial_stop_tx_fifo() would be able to pause the
transmitter, but nothing in the documentation for the GENI UART makes
me believe that is possible.

Given the lack of better choices, we'll change
qcom_geni_serial_stop_tx_fifo() to simply disable the
TX_FIFO_WATERMARK interrupt and call it a day. This seems OK as per
the serial core docs since stop_tx() is supposed to stop transferring
bytes "as soon as possible" and there doesn't seem to be any possible
way to stop transferring sooner. As part of this, get rid of some of
the extra conditions on qcom_geni_serial_start_tx_fifo() which simply
weren't needed and are now getting in the way. It's always fine to
turn the interrupts on if we want to receive and it'll be up to the
IRQ handler to turn them back off if somehow they're not needed. This
works fine.

Unfortunately, doing just the above change causes new/different
problems with suspend/resume. Now if you suspend while an active
transfer is happening you can find that after resume time you're no
longer receiving UART interrupts at all. It appears to be important to
drain the FIFO and send a "cancel" command if the UART is active to
avoid this. Since we've already decided that
qcom_geni_serial_stop_tx_fifo() shouldn't be doing this, let's add the
draining / cancelling logic to the shutdown() call where it should be
OK to delay a bit. This is called as part of the suspend process via
uart_suspend_port().

Finally, with all of the above, the test case where we're spamming the
UART with data and going through suspend/resume cycles doesn't kill
the UART and doesn't drop bytes.

NOTE: though I haven't gone back and validated on ancient code, it
appears from code inspection that many of these problems have existed
since the start of the driver. In the very least, I could reproduce
the problems on vanilla v5.15. The problems don't seem to reproduce
when using the serial port for kernel console output and also don't
seem to reproduce if nothing is being printed to the console at
suspend time, so this is presumably why they were not noticed until
now.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
There are still a number of problems with GENI UART after this but
I've kept this change separate to make it easier to understand.
Specifically on mainline just hitting "Ctrl-C" after dumping
/var/log/messages to the serial port hangs things after the kfifo
changes. Those issues will be addressed in future patches.

Changes in v2:
- Totally rework / rename patch to handle suspend while active xfer

 drivers/tty/serial/qcom_geni_serial.c | 97 +++++++++++++++++++++------
 1 file changed, 75 insertions(+), 22 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d7814f9e5c26..10aeb0313f9b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -131,6 +131,7 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
+	unsigned int tx_total;
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
@@ -337,11 +338,14 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	u32 m_cmd;
 
 	writel(xmit_size, uport->membase + SE_UART_TX_TRANS_LEN);
 	m_cmd = UART_START_TX << M_OPCODE_SHFT;
 	writel(m_cmd, uport->membase + SE_GENI_M_CMD0);
+
+	port->tx_total = xmit_size;
 }
 
 static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
@@ -361,6 +365,64 @@ static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
 	writel(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
 }
 
+static void qcom_geni_serial_drain_tx_fifo(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	/*
+	 * If the main sequencer is inactive it means that the TX command has
+	 * been completed and all bytes have been sent. Nothing to do in that
+	 * case.
+	 */
+	if (!qcom_geni_serial_main_active(uport))
+		return;
+
+	/*
+	 * Wait until the FIFO has been drained. We've already taken bytes out
+	 * of the higher level queue in qcom_geni_serial_send_chunk_fifo() so
+	 * if we don't drain the FIFO but send the "cancel" below they seem to
+	 * get lost.
+	 */
+	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, 0xffffffff,
+				       port->tx_total - port->tx_remaining);
+
+	/*
+	 * If clearing the FIFO made us inactive then we're done--no need for
+	 * a cancel.
+	 */
+	if (!qcom_geni_serial_main_active(uport))
+		return;
+
+	/*
+	 * Cancel the current command. After this the main sequencer will
+	 * stop reporting that it's active and we'll have to start a new
+	 * transfer command.
+	 *
+	 * If we skip doing this cancel and then continue with a system
+	 * suspend while there's an active command in the main sequencer
+	 * then after resume time we won't get any more interrupts on the
+	 * main sequencer until we send the cancel.
+	 */
+	geni_se_cancel_m_cmd(&port->se);
+	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+				       M_CMD_CANCEL_EN, true)) {
+		/* The cancel failed; try an abort as a fallback. */
+		geni_se_abort_m_cmd(&port->se);
+		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+						M_CMD_ABORT_EN, true);
+		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+	}
+	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+	/*
+	 * We've cancelled the current command. "tx_remaining" stores how
+	 * many bytes are left to finish in the current command so we know
+	 * when to start a new command. Since the command was cancelled we
+	 * need to zero "tx_remaining".
+	 */
+	port->tx_remaining = 0;
+}
+
 static void qcom_geni_serial_abort_rx(struct uart_port *uport)
 {
 	u32 irq_clear = S_CMD_DONE_EN | S_CMD_ABORT_EN;
@@ -681,37 +743,18 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 
-	if (qcom_geni_serial_main_active(uport) ||
-	    !qcom_geni_serial_tx_empty(uport))
-		return;
-
 	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
 	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
-
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
 
 static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
 	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
-	/* Possible stop tx is called multiple times. */
-	if (!qcom_geni_serial_main_active(uport))
-		return;
-
-	geni_se_cancel_m_cmd(&port->se);
-	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-						M_CMD_CANCEL_EN, true)) {
-		geni_se_abort_m_cmd(&port->se);
-		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-						M_CMD_ABORT_EN, true);
-		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
-	}
-	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -1093,7 +1136,15 @@ static int setup_fifos(struct qcom_geni_serial_port *port)
 }
 
 
-static void qcom_geni_serial_shutdown(struct uart_port *uport)
+static void qcom_geni_serial_shutdown_dma(struct uart_port *uport)
+{
+	disable_irq(uport->irq);
+
+	qcom_geni_serial_stop_tx(uport);
+	qcom_geni_serial_stop_rx(uport);
+}
+
+static void qcom_geni_serial_shutdown_fifo(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
 
@@ -1102,6 +1153,8 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
+
+	qcom_geni_serial_drain_tx_fifo(uport);
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
@@ -1560,7 +1613,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 	.startup = qcom_geni_serial_startup,
 	.request_port = qcom_geni_serial_request_port,
 	.config_port = qcom_geni_serial_config_port,
-	.shutdown = qcom_geni_serial_shutdown,
+	.shutdown = qcom_geni_serial_shutdown_fifo,
 	.type = qcom_geni_serial_get_type,
 	.set_mctrl = qcom_geni_serial_set_mctrl,
 	.get_mctrl = qcom_geni_serial_get_mctrl,
@@ -1582,7 +1635,7 @@ static const struct uart_ops qcom_geni_uart_pops = {
 	.startup = qcom_geni_serial_startup,
 	.request_port = qcom_geni_serial_request_port,
 	.config_port = qcom_geni_serial_config_port,
-	.shutdown = qcom_geni_serial_shutdown,
+	.shutdown = qcom_geni_serial_shutdown_dma,
 	.type = qcom_geni_serial_get_type,
 	.set_mctrl = qcom_geni_serial_set_mctrl,
 	.get_mctrl = qcom_geni_serial_get_mctrl,
-- 
2.45.1.288.g0e0cd299f1-goog


