Return-Path: <linux-arm-msm+bounces-30411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D557968ADD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CADE7B2102E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF181A2650;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds/RoX93"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D8D19F135;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=qE9534OsKGNaFm7EjKH3Bb8rJhgCXjhY/ZotDYUQ+9FvJm4A9F49ORe6EKlJ8oyWg7E6iNMwFuY5uGFSI3oE8Ru2zIEadfacdzu+zDi69k7ZVQm/hyn4MejIkuItyZ9qiSjAMzNUBOTIdvDGKc0tuUvhvEcY+wdVR/W8HgAKZOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=Vn+vbILnEWPZel6iiH6ofez7iKyV+9ORZYvdR68PlGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nF5uqO8JWLR5+4pYDLJ/j2W8/gm8yLs4VdLsQeT8qFWLs/0iXG93Kln62YINfRB6Yo4Dfy73VxzgrmD2WiScscafFq42dmNQV/hYPWQB9W6CSSKgqWeCrCL0p/nVlXgfMmOhxSrTlXSxvnv+yz+e6+Q2oTLkUdWGf6RVpI7xJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ds/RoX93; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F80C4CECB;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=Vn+vbILnEWPZel6iiH6ofez7iKyV+9ORZYvdR68PlGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ds/RoX93hAWPSBPAHCEGQbFMq6FqumiuLioi8NaSEZ0qzH8RIKOM06/OcYnNATj74
	 NLYFqpXeF0q4lMWE1m3aF9bcSM5d6NITMJraBKcajTFnT972Z0a6ur07BJ0AFHX6Rx
	 Ds4wh+tvkPTjgfBBfUV593MSwnmrFI3b9DYzV6hE9RR2cUsxIhg+UTE79aT1zp7BXU
	 FcBk667n7fMK3OeDQRXEyWzZofYdi7sH4t4dI18pN+034HfgnjokSAtovDz+uPwLy0
	 dxwSq55tCJiz/gqYguyJx9wz3XZxmWbTdzYJ4KpWMMBWM2MHeEJ3sQySWAwC8X5pkA
	 IoeMfAMsQgGjQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Fd-12zI;
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
Subject: [PATCH 1/8] serial: qcom-geni: fix fifo polling timeout
Date: Mon,  2 Sep 2024 17:24:44 +0200
Message-ID: <20240902152451.862-2-johan+linaro@kernel.org>
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

The qcom_geni_serial_poll_bit() can be used to wait for events like
command completion and is supposed to wait for the time it takes to
clear a full fifo before timing out.

As noted by Doug, the current implementation does not account for start,
stop and parity bits when determining the timeout. The helper also does
not currently account for the shift register and the two-word
intermediate transfer register.

Instead of determining the fifo timeout on every call, store the timeout
when updating it in set_termios() and wait for up to 19/16 the time it
takes to clear the 16 word fifo to account for the shift and
intermediate registers. Note that serial core has already added a 20 ms
margin to the fifo timeout.

Also note that the current uart_fifo_timeout() interface does
unnecessary calculations on every call and also did not exists in
earlier kernels so only store its result once. This also facilitates
backports as earlier kernels can derive the timeout from uport->timeout,
which has since been removed.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org	# 4.17
Reported-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 69a632fefc41..e1926124339d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -124,7 +124,7 @@ struct qcom_geni_serial_port {
 	dma_addr_t tx_dma_addr;
 	dma_addr_t rx_dma_addr;
 	bool setup;
-	unsigned int baud;
+	unsigned long fifo_timeout_us;
 	unsigned long clk_rate;
 	void *rx_buf;
 	u32 loopback;
@@ -270,22 +270,21 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
-	unsigned int baud;
-	unsigned int fifo_bits;
 	unsigned long timeout_us = 20000;
 	struct qcom_geni_private_data *private_data = uport->private_data;
 
 	if (private_data->drv) {
 		port = to_dev_port(uport);
-		baud = port->baud;
-		if (!baud)
-			baud = 115200;
-		fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
+
 		/*
-		 * Total polling iterations based on FIFO worth of bytes to be
-		 * sent at current baud. Add a little fluff to the wait.
+		 * Wait up to 19/16 the time it would take to clear a full
+		 * FIFO, which accounts for the three words in the shift and
+		 * intermediate registers.
+		 *
+		 * Note that fifo_timeout_us already has a 20 ms margin.
 		 */
-		timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
+		if (port->fifo_timeout_us)
+			timeout_us = 19 * port->fifo_timeout_us / 16;
 	}
 
 	/*
@@ -1248,7 +1247,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
-	port->baud = baud;
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
@@ -1326,8 +1324,10 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	else
 		tx_trans_cfg |= UART_CTS_MASK;
 
-	if (baud)
+	if (baud) {
 		uart_update_timeout(uport, termios->c_cflag, baud);
+		port->fifo_timeout_us = jiffies_to_usecs(uart_fifo_timeout(uport));
+	}
 
 	if (!uart_console(uport))
 		writel(port->loopback,
-- 
2.44.2


