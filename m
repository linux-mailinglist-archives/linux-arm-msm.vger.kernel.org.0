Return-Path: <linux-arm-msm+bounces-25262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF799273D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C301928A714
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0791AB907;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3wxBlSw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7E6A41;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088361; cv=none; b=C4J/rcofJrEezQov/d4bcC1frEUPeNJyhtDG7FN4stbjPekG7vjOpnbQqqkVH0AWYULRjqhHS8p+xgQkYMZ3CSEjNwCQ4E40JdViuDcwbtL6tkaxQlKsZUxhU4KEdPRWNdG3K4znWCODPlT3bRbY911Rlyio514qKuAQVoLvBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088361; c=relaxed/simple;
	bh=av+VV38xeHpi4an6003rfBgwfOBryjxkX0IX6oGpvYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxD61Rm3Dzd1HyyVu3bRYtvQ/5HkXreY/t/wkFWLYtVIXqHDqFCptbth91h9hqZ7tTDdOPPMkZEbR3x+uewHbMAa48dpEMP5K2sDdeNcnCzBr5+5c9w38b58redXMwqF6qSr89DMiXTjSQ36L6vd4njcJoWTcHlwKkdxIXJ21K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3wxBlSw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EEFC4AF0C;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720088361;
	bh=av+VV38xeHpi4an6003rfBgwfOBryjxkX0IX6oGpvYs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S3wxBlSwxOwGvGbXJlIMefefK1Q/Bu99qLspb+7j7x12X5rphpnUGe8PZUwwPyMXS
	 TgbYwIfW1/mxUxkKJ0pmAxMd8gELyLPsbbmBvCWqrB/12tzlogkeKrmfqk7Ypb0tF5
	 cG+ybhVa3QkoJZiSQ4s8TAZx0hqYEyLQ/PU8SxOn0a3MgLX8mNTIolZJs7p06wzOtk
	 kbiToSfQz+XKNEIF23hunhk0FoFLVSKvUjptCBPJ0fFwkcnzB4VeZomkDYhwGqFaDQ
	 XAoUf8uJye5kni3u7cTJuOpkWOlxbwLat7SawxDim4mdMWJit0bXexrjQF4JjyfbPq
	 E0RWFi4/8mrcw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sPJYf-000000007zN-0bbs;
	Thu, 04 Jul 2024 12:19:21 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] serial: qcom-geni: fix soft lockup on sw flow control and suspend
Date: Thu,  4 Jul 2024 12:18:03 +0200
Message-ID: <20240704101805.30612-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240704101805.30612-1-johan+linaro@kernel.org>
References: <20240704101805.30612-1-johan+linaro@kernel.org>
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
the hardware fifo, when shutting down the port. When TX is later
restarted, a transfer command may need to be issued to discard any stale
data that could prevent the watermark interrupt from firing.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org	# 4.17
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 33 +++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 2bd25afe0d92..a41360d34790 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -649,15 +649,25 @@ static void qcom_geni_serial_start_tx_dma(struct uart_port *uport)
 
 static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 {
+	unsigned char c;
 	u32 irq_en;
 
-	if (qcom_geni_serial_main_active(uport) ||
-	    !qcom_geni_serial_tx_empty(uport))
-		return;
+	/*
+	 * Start a new transfer in case the previous command was cancelled and
+	 * left data in the FIFO which may prevent the watermark interrupt
+	 * from triggering. Note that the stale data is discarded.
+	 */
+	if (!qcom_geni_serial_main_active(uport) &&
+	    !qcom_geni_serial_tx_empty(uport)) {
+		if (uart_fifo_out(uport, &c, 1) == 1) {
+			writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+			qcom_geni_serial_setup_tx(uport, 1);
+			writel(c, uport->membase + SE_GENI_TX_FIFOn);
+		}
+	}
 
 	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
 	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
-
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
@@ -665,13 +675,17 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
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
+static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
 	if (!qcom_geni_serial_main_active(uport))
 		return;
 
@@ -684,6 +698,8 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+	port->tx_remaining = 0;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
@@ -1069,11 +1085,10 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 {
 	disable_irq(uport->irq);
 
-	if (uart_console(uport))
-		return;
-
 	qcom_geni_serial_stop_tx(uport);
 	qcom_geni_serial_stop_rx(uport);
+
+	qcom_geni_serial_cancel_tx_cmd(uport);
 }
 
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
-- 
2.44.1


