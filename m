Return-Path: <linux-arm-msm+bounces-30413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16F968AE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBB91C2195C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC44C1A303B;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjOesjXe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B919F13A;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=VVqYORgwKQfnm378Ce1yzzoXXA0v1bf7hd9xNRMSlzKrOgfCfgaedyoFCq9UYJzogxMdRcY9HNMAdTvk99oVKtCtxJzj/GZWPIyHPePeg/Y+eEJxxZ0ZOxSs0RYszNff9WqmHhnoWcsBVD39wazW7b6NGVNgMKDd7Phe1HgMRuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=IqoYBd+6Nc2oBTOWFgBukZ7TNSr6fQxp6+Ytgcq8EKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbwyRsDGtnFhmvl8S1R7JMbWR7UTgQc5S8+dJPH3Q3xGQ9yV1cxwAHa6nX//xhGv7yNejHfy2wzxcMoii66FQWrH7sfgbt1XksDrswy6LNENVEpPDErIfOJf0Kxx/tfxCYchxFPaw4Fy05sMoiT9eFddquwlEtIxjAz4khOvuDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjOesjXe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C35C4CECA;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=IqoYBd+6Nc2oBTOWFgBukZ7TNSr6fQxp6+Ytgcq8EKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjOesjXeK4f0+BBlSsItSEFrUa0m+UG6KkTgHXbkjYgPnF2t2T1saG8IEZ5uratK8
	 FzxctbR1w4+WWW6vMJGgsBQbGRpuWsqwNoVlrF/TDUfawqynFZ6oeep47qWFGp35E0
	 yVU4BtcxCzgQl+8lOLeKMOt9MufA2gkT0E3JNhH02lTUSX3l1pz6WG2kCFeUQNkwTM
	 uCrvkgdxjPeOzRhjHrmLb0FdT6KVPHW5V+9lNCuKMo6ihC6sBRwp3clqqjAH38g2iJ
	 aZf5bpSb83l885aJ9qCRnb5OEB98MTE4hjaYT9KJl6hLCGsC+MvU2spB47MwXOV+Lr
	 uNAdwsEUpPbxQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fp-31Rz;
	Mon, 02 Sep 2024 17:26:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?=27N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado=27?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 6/8] serial: qcom-geni: fix console corruption
Date: Mon,  2 Sep 2024 17:24:49 +0200
Message-ID: <20240902152451.862-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902152451.862-1-johan+linaro@kernel.org>
References: <20240902152451.862-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm serial console implementation is broken and can lose
characters when the serial port is also used for tty output.

Specifically, the console code only waits for the current tx command to
complete when all data has already been written to the fifo. When there
are on-going longer transfers this often means that console output is
lost when the console code inadvertently "hijacks" the current tx
command instead of starting a new one.

This can, for example, be observed during boot when console output that
should have been interspersed with init output is truncated:

	[    9.462317] qcom-snps-eusb2-hsphy fde000.phy: Registered Qcom-eUSB2 phy
	[  OK  ] Found device KBG50ZNS256G KIOXIA Wi[    9.471743ndows.
	[    9.539915] xhci-hcd xhci-hcd.0.auto: xHCI Host Controller

Add a new state variable to track how much data has been written to the
fifo and use it to determine when the fifo and shift register are both
empty. This is needed since there is currently no other known way to
determine when the shift register is empty.

This in turn allows the console code to interrupt long transfers without
losing data.

Note that the oops-in-progress case is similarly broken as it does not
cancel any active command and also waits for the wrong status flag when
attempting to drain the fifo (TX_FIFO_NOT_EMPTY_EN is only set when
cancelling a command leaves data in the fifo).

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Fixes: a1fee899e5be ("tty: serial: qcom_geni_serial: Fix softlock")
Fixes: 9e957a155005 ("serial: qcom-geni: Don't cancel/abort if we can't get the port lock")
Cc: stable@vger.kernel.org	# 4.17
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 48 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7029c39a9a21..be620c5703f5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -131,6 +131,7 @@ struct qcom_geni_serial_port {
 	bool brk;
 
 	unsigned int tx_remaining;
+	unsigned int tx_queued;
 	int wakeup_irq;
 	bool rx_tx_swap;
 	bool cts_rts_swap;
@@ -144,6 +145,8 @@ static const struct uart_ops qcom_geni_uart_pops;
 static struct uart_driver qcom_geni_console_driver;
 static struct uart_driver qcom_geni_uart_driver;
 
+static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
+
 static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 {
 	return container_of(uport, struct qcom_geni_serial_port, uport);
@@ -308,6 +311,17 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
 }
 
+static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	if (!qcom_geni_serial_main_active(uport))
+		return;
+
+	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LENGTH,
+			port->tx_queued);
+}
+
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
 	u32 m_cmd;
@@ -476,7 +490,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	struct qcom_geni_serial_port *port;
 	bool locked = true;
 	unsigned long flags;
-	u32 geni_status;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -490,34 +503,20 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	else
 		uart_port_lock_irqsave(uport, &flags);
 
-	geni_status = readl(uport->membase + SE_GENI_STATUS);
+	if (qcom_geni_serial_main_active(uport)) {
+		/* Wait for completion or drain FIFO */
+		if (!locked || port->tx_remaining == 0)
+			qcom_geni_serial_poll_tx_done(uport);
+		else
+			qcom_geni_serial_drain_fifo(uport);
 
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
+		qcom_geni_serial_cancel_tx_cmd(uport);
 	}
 
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
@@ -698,6 +697,7 @@ static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 
 	port->tx_remaining = 0;
+	port->tx_queued = 0;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -924,6 +924,7 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	if (!port->tx_remaining) {
 		qcom_geni_serial_setup_tx(uport, pending);
 		port->tx_remaining = pending;
+		port->tx_queued = 0;
 
 		irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 		if (!(irq_en & M_TX_FIFO_WATERMARK_EN))
@@ -932,6 +933,7 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	}
 
 	qcom_geni_serial_send_chunk_fifo(uport, chunk);
+	port->tx_queued += chunk;
 
 	/*
 	 * The tx fifo watermark is level triggered and latched. Though we had
-- 
2.44.2


