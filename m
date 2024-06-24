Return-Path: <linux-arm-msm+bounces-23955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD8914EBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 647081F20FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B557414375D;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rCzQE2Yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76723143739;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235901; cv=none; b=XeZxudDtavjODIut7deOK42g9NSVQzCJKnYMQmvHJTbE7nleck33D7RBynwS55V1y39Kg7/NKQg4lCeUHKxJPBvTZxiI3DxXdrDFxJB6slF8qS5l9hQj0xZNy8LcuobJ05PBSwwgnwD9ujgsTyO6DlYHB3Ztg9/T7xKgCw1dZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235901; c=relaxed/simple;
	bh=iaBx0pKDhCtH1GENa4aTAEo0/WKpJ6n5K95+bmY8LOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NDPggz2HsLIIh3d6L+ZVHwDN8UiVP5oe2zZxbex0qgyVdpk1N0fO9m9EsPIZBfyOyteE7w5kewJc4zgiEdEo9/MQGaQq7lnI3HGZT0hf49ILD6yLBQ7ld64koR3qIrxmrF6fbcW94Tv2Jub6/T6rtFGuGgFw0A3cxzgLIl4nLpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rCzQE2Yg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF43C4AF0C;
	Mon, 24 Jun 2024 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719235901;
	bh=iaBx0pKDhCtH1GENa4aTAEo0/WKpJ6n5K95+bmY8LOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rCzQE2Yg0lqmETb8TJ1/zkmnO7Rp2BwFfitRhF7MALOvcaR910Dri3TO9I8yECWnS
	 DVx66kwp7A5M524psW4+za38z6XGl2NyA7x70wHXZr2zPYmAsNMOdYXB83gDv+QKWi
	 VSBQXAgJ1nUwtEaTW9gAUr/7+gibvDtk1KDF8Z0mvINUKZY5xsuko9Qt0WJY9L4VXs
	 JF6EZY0d0mPJzgoU72DoYUyEwKwjkXZL6NbPX/EOFfpGJTPqrVeEjJmJgz0pnx1XQ4
	 j15FUCc3IAK0VT7MSns6hINh4E7SbcReYGaMX8Yje0Ste21WOgihv8ywZJvaCDbAzS
	 yrYsANG4GM1JQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sLjnP-000000001wW-0HIo;
	Mon, 24 Jun 2024 15:31:47 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] serial: qcom-geni: fix soft lockup on sw flow control and suspend
Date: Mon, 24 Jun 2024 15:31:34 +0200
Message-ID: <20240624133135.7445-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240624133135.7445-1-johan+linaro@kernel.org>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The stop_tx() callback is used to implement software flow control and
must not discard data as the Qualcomm GENI driver is currently doing
when there is an active TX command.

Cancelling an active command can also leave data in the hardware FIFO,
which prevents the watermark interrupt from being enabled when TX is
later restarted. This results in a soft lockup and is easily triggered
by stopping TX using software flow control in a serial console but this
can also happen after suspend.

Fix this by only stopping any active command, and effectively clearing
the hardware fifo, when shutting down the port. Make sure to temporarily
raise the watermark level so that the interrupt fires when TX is
restarted.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org	# 4.17
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 28 +++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 1d5d6045879a..72addeb9f461 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -651,13 +651,8 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
 
-	if (qcom_geni_serial_main_active(uport) ||
-	    !qcom_geni_serial_tx_empty(uport))
-		return;
-
 	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
 	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
-
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
@@ -665,16 +660,28 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 {
 	u32 irq_en;
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
 	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
 	writel(0, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
-	/* Possible stop tx is called multiple times. */
+}
+
+static void qcom_geni_serial_clear_tx_fifo(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
 	if (!qcom_geni_serial_main_active(uport))
 		return;
 
+	/*
+	 * Increase watermark level so that TX can be restarted and wait for
+	 * sequencer to start to prevent lockups.
+	 */
+	writel(port->tx_fifo_depth, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+					M_TX_FIFO_WATERMARK_EN, true);
+
 	geni_se_cancel_m_cmd(&port->se);
 	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_CMD_CANCEL_EN, true)) {
@@ -684,6 +691,8 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+	port->tx_remaining = 0;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -1069,11 +1078,10 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
 
-	if (uart_console(uport))
-		return;
-
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
+
+	qcom_geni_serial_clear_tx_fifo(uport);
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.44.1


