Return-Path: <linux-arm-msm+bounces-31121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADE896F52B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5943C285951
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9684D1CF2A1;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKj0BY+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1C11CEAB7;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=X/+lnIUD1w6a3w9LyvzChppN4Ota7zBLJht/mZ4/Sn2Up7LYkAfVkVRtxBcm91X7jE85QIKlcjfFBYooSAVtvNHs2pKGQAUYFBCe5bFXUxh2v5ZqLHcj6sFcxYCKLjmBZ6DrFoEnHi6s2Wtgd0pub5YOdyFske29o7z49KJjO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=B4X4P1sytRno/fUbzaXrrScFhWyftVIa9keHoXMdIDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hu460dCk8dVSHwXLAIoNjNQvcfOr6PRYrT0cyZavrRP4Ov6UX+XGLMoL2DP5Bm8aqw9sDFeQewU9Q+EMZBS5Zs4P0sPaj+B25P7j3IUzkSVjigTt6grAspaM1gOACEcdZw4F8F+q9HuOpxEzFhkl2HKJhTqnb771CObiV8JlcpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKj0BY+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B50FC4CECB;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=B4X4P1sytRno/fUbzaXrrScFhWyftVIa9keHoXMdIDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fKj0BY+EbWzu8+2XSaZBfQzuxy3EhtiXLFddAMYvHscZmpwABHLNt9vryWaYpImia
	 5/SuXV+ZQHxz7w/+YS8YJme4AUluThm7gIqA73ygxx1WO3VphvrbEyJIGpXNk9Wd4J
	 PMwxdFxwDAjLH2z9f4G8skKH3MMEf03im2j60cgtc/HIV4wETPnNRFMVJEKLwbDpwd
	 e9FVK01Km0BGfIfHF2VShh3H3p5YD+5p1xeeLFKnjFz2KgK/Isi+/z+iY54RyyG8SG
	 ueOCkXsYqqcpfFmAo0U6SbM0bEYNKeybZU61MbT1wcpg6sS/vIWdkyfavnr1HVOeCI
	 DCtapUxF9vsoA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006An-2LPv;
	Fri, 06 Sep 2024 15:15:19 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 6/8] serial: qcom-geni: fix console corruption
Date: Fri,  6 Sep 2024 15:13:34 +0200
Message-ID: <20240906131336.23625-7-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240906131336.23625-1-johan+linaro@kernel.org>
References: <20240906131336.23625-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 45 +++++++++++++--------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7bbd70c30620..f8f6e9466b40 100644
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
@@ -393,6 +396,14 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 #endif
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
+static void qcom_geni_serial_drain_fifo(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	qcom_geni_serial_poll_bitfield(uport, SE_GENI_M_GP_LENGTH, GP_LENGTH,
+			port->tx_queued);
+}
+
 static void qcom_geni_serial_wr_char(struct uart_port *uport, unsigned char ch)
 {
 	struct qcom_geni_private_data *private_data = uport->private_data;
@@ -468,7 +479,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	struct qcom_geni_serial_port *port;
 	bool locked = true;
 	unsigned long flags;
-	u32 geni_status;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -482,34 +492,20 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
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
@@ -690,6 +686,7 @@ static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 
 	port->tx_remaining = 0;
+	port->tx_queued = 0;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -916,6 +913,7 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	if (!port->tx_remaining) {
 		qcom_geni_serial_setup_tx(uport, pending);
 		port->tx_remaining = pending;
+		port->tx_queued = 0;
 
 		irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 		if (!(irq_en & M_TX_FIFO_WATERMARK_EN))
@@ -924,6 +922,7 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	}
 
 	qcom_geni_serial_send_chunk_fifo(uport, chunk);
+	port->tx_queued += chunk;
 
 	/*
 	 * The tx fifo watermark is level triggered and latched. Though we had
-- 
2.44.2


