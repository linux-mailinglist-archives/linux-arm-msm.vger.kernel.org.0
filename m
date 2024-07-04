Return-Path: <linux-arm-msm+bounces-25263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 494429273DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7ED41F216D8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74581AB90C;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRcoAIz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B82B13C8FF;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088361; cv=none; b=WLpNToeMFZoxXVMOAbS96pyNib0KF26F1oxW7W7YI1MNstzblZYKU8ZKhkcKevK/PuSlaCJzZE+vTCMi63BqIISv7bL2Zis3S33tN6k6T/IHCB9klz3vbX52UDVzBmkW+KyPjg8vQ4Di0I3VVNFSRWdzMr8HeMvUvd/oKiXxbjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088361; c=relaxed/simple;
	bh=kB83DN3LYrLXwAxtLBcxkuvnDD4VsSkzzf5MSWSoQiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0faN7PeHzbK+T5zgzWycKAFE/cwwq9GmRoDpIeUUh9QEqsZmCIDut64dO0Oxqn6tTv5OOGqu3gvmxyS9JR6nrddf059zWom0RRcuMrek9wTDGtY/wll+MirJ2nqSUHGkwkgf+MaDTQn9yC9bKWa+iSXdtknQ9dFg9rE31Y/lDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRcoAIz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDADC4AF0B;
	Thu,  4 Jul 2024 10:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720088361;
	bh=kB83DN3LYrLXwAxtLBcxkuvnDD4VsSkzzf5MSWSoQiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LRcoAIz2HOxnmVFe+OKHrBOlXyrVkZl0Fh2jmUuk3PYxAvhRLT73OzBysw8ascY3a
	 DyW4UcICHJsdZl1txFMJZnEXaT/aqX8DhfuUqJxyb3DdcreGTFAQN24jcM01rKKGc/
	 eK7TTwUnKpiAgIb0Kcb/Sa1eVOQOSZWy7G+lyZCaqbhKMDbnW1vDPg3e/hQfIVEljL
	 WL8T1cz0F/nx6LSXr/4Sup+QVhB2F76FKZN/UPS/c2DUfbGYQZiM5PBh+cb557rmb9
	 DlItxngq2hG4vHSEw8WTWeY3NZdo+vyK15am4aQQTKjtp7DwfTf5xYaKoF0S6pNn8W
	 Ggw+8OCJx/XPw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sPJYf-000000007zP-11nn;
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
Subject: [PATCH v2 2/3] serial: qcom-geni: fix hard lockup on buffer flush
Date: Thu,  4 Jul 2024 12:18:04 +0200
Message-ID: <20240704101805.30612-3-johan+linaro@kernel.org>
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

The Qualcomm GENI serial driver does not handle buffer flushing and used
to continue printing discarded characters when the circular buffer was
cleared. Since commit 1788cf6a91d9 ("tty: serial: switch from circ_buf
to kfifo") this instead results in a hard lockup due to
qcom_geni_serial_send_chunk_fifo() spinning indefinitely in the
interrupt handler.

This is easily triggered by interrupting a command such as dmesg in a
serial console but can also happen when stopping a serial getty on
reboot.

Implement the flush_buffer() callback and use it to cancel any active TX
command when the write buffer has been emptied.

Reported-by: Douglas Anderson <dianders@chromium.org>
Link: https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/
Fixes: 1788cf6a91d9 ("tty: serial: switch from circ_buf to kfifo")
Fixes: a1fee899e5be ("tty: serial: qcom_geni_serial: Fix softlock")
Cc: stable@vger.kernel.org	# 5.0
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index a41360d34790..b2bbd2d79dbb 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -906,13 +906,17 @@ static void qcom_geni_serial_handle_tx_fifo(struct uart_port *uport,
 	else
 		pending = kfifo_len(&tport->xmit_fifo);
 
-	/* All data has been transmitted and acknowledged as received */
-	if (!pending && !status && done) {
+	/* All data has been transmitted or command has been cancelled */
+	if (!pending && done) {
 		qcom_geni_serial_stop_tx_fifo(uport);
 		goto out_write_wakeup;
 	}
 
-	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
+	if (active)
+		avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
+	else
+		avail = port->tx_fifo_depth;
+
 	avail *= BYTES_PER_FIFO_WORD;
 
 	chunk = min(avail, pending);
@@ -1091,6 +1095,11 @@ static void qcom_geni_serial_shutdown(struct uart_port *uport)
 	qcom_geni_serial_cancel_tx_cmd(uport);
 }
 
+static void qcom_geni_serial_flush_buffer(struct uart_port *uport)
+{
+	qcom_geni_serial_cancel_tx_cmd(uport);
+}
+
 static int qcom_geni_serial_port_setup(struct uart_port *uport)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
@@ -1547,6 +1556,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 	.request_port = qcom_geni_serial_request_port,
 	.config_port = qcom_geni_serial_config_port,
 	.shutdown = qcom_geni_serial_shutdown,
+	.flush_buffer = qcom_geni_serial_flush_buffer,
 	.type = qcom_geni_serial_get_type,
 	.set_mctrl = qcom_geni_serial_set_mctrl,
 	.get_mctrl = qcom_geni_serial_get_mctrl,
-- 
2.44.1


