Return-Path: <linux-arm-msm+bounces-31118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF596F51C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E0BB1F24812
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FD91CE6FF;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSRA41e+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42DD1CB338;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=ev13X39/l8iCJsmj+E8tcSWljffAHdH+Aps6hQ2DFJrP2R3YiCWGNjVbB7IqMFCt+8eYVkuLA7zsZxYNKnmGfSkFT9263/yDnQK68mAzVvZb+wLUe/0y68c5aeppe8LUCzDVKLM2+6P9IWkAT/CR3HYJzIBmBusNj2+Y3Dcbi6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=jzmzh221r7xiN35RPxU6yR+iMWICSstY5MB6EHCIg1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RB0kcOmmYU3fyxvdu7CiY3vtz4tyNaUBxMvPAZvAcBZbcqyrT6oqdJkmwfS3JScZMeJvCn3WW24VoccVHsMocrTHibAl6wTtybHiaVubNIEhCVWwAmaSm0+MNJUGua8hX9oh/kodsGHQZCUTulpCFUZHhs98MQp/7jKTI+Bt7lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OSRA41e+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917B3C4AF0B;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=jzmzh221r7xiN35RPxU6yR+iMWICSstY5MB6EHCIg1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OSRA41e+WdFeL9aqDxJ+XnYFBMHABYbz0raWr94PYVrYSA6Nmh2tOpAq8KdrjN049
	 MuDZNv7S2PgLJ9nPBxralDLwTc9NL+8HPU606W61atOaY0z58UKf4+N4PLEAU00F7g
	 EVVg7a/X0tScD8lZyoiBOgSGxHa6bho6lCAGNDKjj4AER/ftZsh9OO34Uo3gCb7cbZ
	 R6E6KBHLuCb+eV+pkcIdCj/qphsiCgx4A8TB/4j5ZfwZch0t5ikWLPN7oE7W0uK93D
	 cTls5JgMOpYlUFRnhutmFpP7MKzzzjP9VCsm+jrGNxgWj76fy8wY/JV0Xh1fji/kfY
	 3zv0Q9WArHW0Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Ac-0egf;
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
Subject: [PATCH v2 1/8] serial: qcom-geni: fix fifo polling timeout
Date: Fri,  6 Sep 2024 15:13:29 +0200
Message-ID: <20240906131336.23625-2-johan+linaro@kernel.org>
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

The qcom_geni_serial_poll_bit() can be used to wait for events like
command completion and is supposed to wait for the time it takes to
clear a full fifo before timing out.

As noted by Doug, the current implementation does not account for start,
stop and parity bits when determining the timeout. The helper also does
not currently account for the shift register and the two-word
intermediate transfer register.

A too short timeout can specifically lead to lost characters when
waiting for a transfer to complete as the transfer is cancelled on
timeout.

Instead of determining the poll timeout on every call, store the fifo
timeout when updating it in set_termios() and make sure to take the
shift and intermediate registers into account. Note that serial core has
already added a 20 ms margin to the fifo timeout.

Also note that the current uart_fifo_timeout() interface does
unnecessary calculations on every call and did not exist in earlier
kernels so only store its result once. This facilitates backports too as
earlier kernels can derive the timeout from uport->timeout, which has
since been removed.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org	# 4.17
Reported-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 31 +++++++++++++++------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 69a632fefc41..309c0bddf26a 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -124,7 +124,7 @@ struct qcom_geni_serial_port {
 	dma_addr_t tx_dma_addr;
 	dma_addr_t rx_dma_addr;
 	bool setup;
-	unsigned int baud;
+	unsigned long poll_timeout_us;
 	unsigned long clk_rate;
 	void *rx_buf;
 	u32 loopback;
@@ -270,22 +270,13 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
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
-		/*
-		 * Total polling iterations based on FIFO worth of bytes to be
-		 * sent at current baud. Add a little fluff to the wait.
-		 */
-		timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
+		if (port->poll_timeout_us)
+			timeout_us = port->poll_timeout_us;
 	}
 
 	/*
@@ -1244,11 +1235,11 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	unsigned long clk_rate;
 	u32 ver, sampling_rate;
 	unsigned int avg_bw_core;
+	unsigned long timeout;
 
 	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
-	port->baud = baud;
 
 	sampling_rate = UART_OVERSAMPLING;
 	/* Sampling rate is halved for IP versions >= 2.5 */
@@ -1326,9 +1317,21 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	else
 		tx_trans_cfg |= UART_CTS_MASK;
 
-	if (baud)
+	if (baud) {
 		uart_update_timeout(uport, termios->c_cflag, baud);
 
+		/*
+		 * Make sure that qcom_geni_serial_poll_bitfield() waits for
+		 * the FIFO, two-word intermediate transfer register and shift
+		 * register to clear.
+		 *
+		 * Note that uart_fifo_timeout() also adds a 20 ms margin.
+		 */
+		timeout = jiffies_to_usecs(uart_fifo_timeout(uport));
+		timeout += 3 * timeout / port->tx_fifo_depth;
+		WRITE_ONCE(port->poll_timeout_us, timeout);
+	}
+
 	if (!uart_console(uport))
 		writel(port->loopback,
 				uport->membase + SE_UART_LOOPBACK_CFG);
-- 
2.44.2


