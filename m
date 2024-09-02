Return-Path: <linux-arm-msm+bounces-30410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCEF968ADA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68AF9B21873
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670861A2640;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOajRi7b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5AC19F112;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=WSJHnJBSnnIwey0/j+P3ReTHWj8BH8i7cr0v/P1ymaZ8VjCvNcKvm5uH07RjB8TlrXJK7W9RzReQnlJWBvRyE/Z63XXGMs3/2VY165PlWe/QYwxjGVGCccnpm5b8KOWnT8eBCw+k9mRIaymioSVaDLrdC/qDvLNCiKwKwSiNba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=oQKVeNddgWEZ+iUeSzOZSrp67FiADWhXubuEZAGpt6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XUxMTkHsEMPmdWCz6NMSqEcENXsM6wFh7/TUZ0pa2+uac9zKXHAqFN/76FACEVp1lynNXaTpetMEeTDmaX19+bJgueYnsOs5G6Ed8OZYFvljym90iRIft/t2h8mLiM4CZVPen+ULSwVFnpfFRjPJttiN87kTLNFI85EBsp0FfjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOajRi7b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B03C4CEC7;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290758;
	bh=oQKVeNddgWEZ+iUeSzOZSrp67FiADWhXubuEZAGpt6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OOajRi7bRKowYZTuQrEyBdR7fwwclxQAsIawkpV58KGaIE66hD4ueweC+li+nvc69
	 3NgmQt29AKM08F5SdIf9yAr7a4ZZiZVIlydCzbXKubNc21iABCre/8xmG84k5nNPbp
	 cp++tl9S9nT9pzDmHcOc4plSraVEvjqPnfzOme8lXdCdcDokQAOEWsPMauZw/c5KOW
	 bXjM3ULgHu5jfks85xnz7HOkKqg++tVCnSvLnmhnFDVI0vkq87xOtzcip+aowTglNO
	 lXovFsyTrBfxvPRutft9/+sPXJ+KMj7Ko+VQ9XjPmm29Vea6Qdbp4IllIPTRt+lxU6
	 bsZlFXXa+tfOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Ff-1TEK;
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
Subject: [PATCH 2/8] serial: qcom-geni: fix false console tx restart
Date: Mon,  2 Sep 2024 17:24:45 +0200
Message-ID: <20240902152451.862-3-johan+linaro@kernel.org>
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

Commit 663abb1a7a7f ("tty: serial: qcom_geni_serial: Fix UART hang")
addressed an issue with stalled tx after the console code interrupted
the last bytes of a tx command by reenabling the watermark interrupt if
there is data in write buffer. This can however break software flow
control by re-enabling tx after the user has stopped it.

Address the original issue by not clearing the CMD_DONE flag after
polling for command completion. This allows the interrupt handler to
start another transfer when the CMD_DONE interrupt has not been disabled
due to flow control.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Fixes: 663abb1a7a7f ("tty: serial: qcom_geni_serial: Fix UART hang")
Cc: stable@vger.kernel.org	# 4.17
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index e1926124339d..0af4a93c0af5 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -314,18 +314,16 @@ static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 static void qcom_geni_serial_poll_tx_done(struct uart_port *uport)
 {
 	int done;
-	u32 irq_clear = M_CMD_DONE_EN;
 
 	done = qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_CMD_DONE_EN, true);
 	if (!done) {
 		writel(M_GENI_CMD_ABORT, uport->membase +
 						SE_GENI_M_CMD_CTRL_REG);
-		irq_clear |= M_CMD_ABORT_EN;
 		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 							M_CMD_ABORT_EN, true);
+		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
-	writel(irq_clear, uport->membase + SE_GENI_M_IRQ_CLEAR);
 }
 
 static void qcom_geni_serial_abort_rx(struct uart_port *uport)
@@ -386,6 +384,7 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_setup_tx(uport, 1);
 	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true));
@@ -430,6 +429,7 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	}
 
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_setup_tx(uport, bytes_to_send);
 	for (i = 0; i < count; ) {
 		size_t chars_to_write = 0;
@@ -471,7 +471,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	bool locked = true;
 	unsigned long flags;
 	u32 geni_status;
-	u32 irq_en;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -503,12 +502,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 		 * has been sent, in which case we need to look for done first.
 		 */
 		qcom_geni_serial_poll_tx_done(uport);
-
-		if (!kfifo_is_empty(&uport->state->port.xmit_fifo)) {
-			irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
-			writel(irq_en | M_TX_FIFO_WATERMARK_EN,
-					uport->membase + SE_GENI_M_IRQ_EN);
-		}
 	}
 
 	__qcom_geni_serial_console_write(uport, s, count);
-- 
2.44.2


