Return-Path: <linux-arm-msm+bounces-31117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAAD96F51B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82B3B2857B9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF741CE6E8;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZn20ZJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43301CBE8A;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=J0inCuaFKaFk68bBiPFNGXQZrEWW4U5k8Abcg9pWNlO28aj4t156131bFPhOV5yWnT06k2OSuXlO9AeRqkLTCv0mufo9ZVBBOm725TaLrK/p8jnq3PRHFP2MLIFtPgJUtGcMbaCZiMlUUmHrnyAVJdnHnR43PZVgMqisEBNI+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=m62cY20WvDhqd0wyAzMWpkpsp6ZbaGEV0lCpZuGNUhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7I09g2bj/e0XUVz1bi8DhINhFjvMal33ccKmjler2x2P7pD9BflHliX2wujCuY7NxRQ+u/+XMMdGP8UWk1jib1hZZZ+8x3+XaymT59HdeubA7Rmnj1cAb5k46CsUX30iibfcyXr2xhOw19Z1ibeAc/Rx84x4ZuunP4DSgMLLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZn20ZJ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8FFC4CEC5;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=m62cY20WvDhqd0wyAzMWpkpsp6ZbaGEV0lCpZuGNUhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZn20ZJ3LBYXdmg36f0LtsjNgedqqA67AKgasEf8HgO0vrkcdBG9Pg068URPLaMZr
	 i2bmUe69ks8ygpAutk3uxH+cXpYm5BvcRQ33Ga1pyCHwsOGg19Eq77Vf6wnMr1Gb3U
	 rMaVOnYCU4xI+nt9b83ExOmpRU3T/aVLd8Oa4N/BIHjWUBHTUGOSr/t3ngv2hoWSMq
	 68R5JXCzb+I1FdG3BWdbg5gOeoiuHMfOCmDaXqZtenEm/GXP5UgaTnleEFHfGKR/GJ
	 7sWvqEMYGk8/vNmG0qxncdoZf5whfIpq6lXyyA3Sm8c4GBNUhoEYKAeuqEM3O7lgGZ
	 7s0ePOktEDMoQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Ae-0yqh;
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
Subject: [PATCH v2 2/8] serial: qcom-geni: fix false console tx restart
Date: Fri,  6 Sep 2024 15:13:30 +0200
Message-ID: <20240906131336.23625-3-johan+linaro@kernel.org>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 309c0bddf26a..b88435c0ea50 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -306,18 +306,16 @@ static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
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
@@ -378,6 +376,7 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_setup_tx(uport, 1);
 	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true));
@@ -422,6 +421,7 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 	}
 
 	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
+	writel(M_CMD_DONE_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	qcom_geni_serial_setup_tx(uport, bytes_to_send);
 	for (i = 0; i < count; ) {
 		size_t chars_to_write = 0;
@@ -463,7 +463,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	bool locked = true;
 	unsigned long flags;
 	u32 geni_status;
-	u32 irq_en;
 
 	WARN_ON(co->index < 0 || co->index >= GENI_UART_CONS_PORTS);
 
@@ -495,12 +494,6 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
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


