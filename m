Return-Path: <linux-arm-msm+bounces-30414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E1968AE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CBFF1F22C24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA4E1A304F;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQWDqHxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774561A2658;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=PQnFFPz1Ojc9j2M9IaLFKNDv6dl+AHqtZ6U3ay0dArav5ns+bJLkfokdmqqCdZlbhgOq/0g4WPuihaHTLlFv2fwSMEN256G2Krm0fP+s4g8VLcoTykh37PFxLPopHk5D31V7EVIb3IEc9PDVRX2g4PJS3xLP7+/GxUEgb0gUBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=V5hACLzeVR15kWP871kA/q+aCfEhF0lIeJeWRbN4eF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pxa5SnnA9ubWELY2LoBcLz67Z7iGrHstFIVsji9avnL0svJVLqL/1hp2pvu0R8WYAcZbQ7SeiUSVP81bQXQ1OVhsWHMSo5BL/OjEzLeoNMc3cWGzVGKPimR1oVw+A3YJI9HiY5VIMwTDN/UNlkKz8qvp6w46ZEOphN4Uz2Dz8eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQWDqHxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B43C4AF14;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290759;
	bh=V5hACLzeVR15kWP871kA/q+aCfEhF0lIeJeWRbN4eF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQWDqHxugk34rZI2XEcCsQ7W4d1dHbbiY5FbmIyyIqXI7zkNVpk37Jh3dp6MNSW44
	 gJqNls0b/Cv8C7CUZD7uZ+tv8eUIAdBCbPICRln4T8gqJPE8eIVCUPJCaFogcC0LGg
	 Cgk+RpbQsi1js1Ji2JKnelQzVZvuHIyzS0FXUPb1Vz9Awnzc17rtGfhePLlQqJXPOn
	 nDYN5qlDuj1xDJkG9HZ3nFfMU5o/PpFKRuvyU4dGSUPKIhAz1XSRzgLvfMjnI57NHq
	 JrlfjEGPrOpiu5bH7OLg0AD8c78KRKvCAIDBeHGSDSRmmvl+VGHtdz8xq6ewNCPJni
	 ITOTwwQm+jbcw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fw-3rFq;
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
Subject: [PATCH 8/8] serial: qcom-geni: fix polled console corruption
Date: Mon,  2 Sep 2024 17:24:51 +0200
Message-ID: <20240902152451.862-9-johan+linaro@kernel.org>
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

The polled UART operations are used by the kernel debugger (KDB, KGDB),
which can interrupt the kernel at any point in time. The current
Qualcomm GENI implementation does not really work when there is on-going
serial output as it inadvertently "hijacks" the current tx command,
which can result in both the initial debugger output being corrupted as
well as the corruption of any on-going serial output (up to 4k
characters) when execution resumes:

0190: abcdefghijklmnopqrstuvwxyz0123456789 0190: abcdefghijklmnopqrstuvwxyz0123456789
0191: abcdefghijklmnop[   50.825552] sysrq: DEBUG
qrstuvwxyz0123456789 0191: abcdefghijklmnopqrstuvwxyz0123456789
Entering kdb (current=0xffff53510b4cd280, pid 640) on processor 2 due to Keyboard Entry
[2]kdb> go
omlji3h3h2g2g1f1f0e0ezdzdycycxbxbwawav :t72r2rp
o9n976k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawavu:t7t8s8s8r2r2q0q0p
o9n9n8ml6k6k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawav v u:u:t9t0s4s4rq0p
o9n9n8m8m7l7l6k6k5j5j40q0p                                              p o
o9n9n8m8m7l7l6k6k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawav :t8t9s4s4r4r4q0q0p

Fix this by making sure that the polled output implementation waits for
the tx fifo to drain before cancelling any on-going longer transfers. As
the polled code cannot take any locks, leave the state variables as they
are and instead make sure that the interrupt handler always starts a new
tx command when there is data in the write buffer.

Since the debugger can interrupt the interrupt handler when it is
writing data to the tx fifo, it is currently not possible to fully
prevent losing up to 64 bytes of tty output on resume.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org      # 4.17
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index fbed143c90a3..cf8bafd99a09 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -145,6 +145,7 @@ static const struct uart_ops qcom_geni_uart_pops;
 static struct uart_driver qcom_geni_console_driver;
 static struct uart_driver qcom_geni_uart_driver;
 
+static void __qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 
 static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
@@ -403,13 +404,14 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	if (qcom_geni_serial_main_active(uport)) {
+		qcom_geni_serial_poll_tx_done(uport);
+		__qcom_geni_serial_cancel_tx_cmd(uport);
+	}
+
 	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_setup_tx(uport, 1);
-	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-						M_TX_FIFO_WATERMARK_EN, true));
 	writel(c, uport->membase + SE_GENI_TX_FIFOn);
-	writel(M_TX_FIFO_WATERMARK_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_poll_tx_done(uport);
 }
 #endif
@@ -688,13 +690,10 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 }
 
-static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
+static void __qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 
-	if (!qcom_geni_serial_main_active(uport))
-		return;
-
 	geni_se_cancel_m_cmd(&port->se);
 	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_CMD_CANCEL_EN, true)) {
@@ -704,6 +703,16 @@ static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+}
+
+static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+
+	if (!qcom_geni_serial_main_active(uport))
+		return;
+
+	__qcom_geni_serial_cancel_tx_cmd(uport);
 
 	port->tx_remaining = 0;
 	port->tx_queued = 0;
@@ -930,7 +939,7 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	if (!chunk)
 		goto out_write_wakeup;
 
-	if (!port->tx_remaining) {
+	if (!active) {
 		qcom_geni_serial_setup_tx(uport, pending);
 		port->tx_remaining = pending;
 		port->tx_queued = 0;
-- 
2.44.2


