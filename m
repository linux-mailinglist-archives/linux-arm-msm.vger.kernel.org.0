Return-Path: <linux-arm-msm+bounces-31854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8BA97A6B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 19:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0A41C2681F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B3B15B10C;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gszUH7vQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C83157A59;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726507623; cv=none; b=dHWV3pUxx6IGCNHYmut/CFhafyGt7CY7EJhp+sRWPJ9qMQBi1UnE92vvjo4vk/tGESc+i+UYkaoljViNybcuTQgBjOoJ7fU61Z47ioNRW+R8vGLArV5NhhwCen1q+u5GMl1t1x5xXmfg4ZXm6qOzaf5TwQSc8n39T2pnNqII/pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726507623; c=relaxed/simple;
	bh=wbyyvVbAwK0TTkdf+yzuQfBYJwErlMDyLPtz/JPez44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDfFkqXPEUuFILXZREd9aU4YPh2lWl99PtX8/EAhGIoRuuf1Pz6CTdpT2XC84pSPwxuRJPi3DdPzHccoTkkfHktfQd9Yzgxln5fkDW8jRU1eyjeJqBLs3PWRGHawpMSVgeY9/nf3Qnjlk9ngA7nB26v81jBTUtDulOXnyc+cmDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gszUH7vQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25933C4CEC5;
	Mon, 16 Sep 2024 17:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726507623;
	bh=wbyyvVbAwK0TTkdf+yzuQfBYJwErlMDyLPtz/JPez44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gszUH7vQP6plBOSjalJjSiurW/X6SUQPWF3kSYXfLj30TsVpQ3z3Q7/9Vk/3vrc5F
	 xsq7lzQomUKt3CGg/7hABYasWsNDdQTLw8VyXV+xkq6T+r0zhguAMR8cjO4IZWSQdk
	 +0oLxzPWPbhJcfghdVyJOmayfETaheMqwAzeoCJPMpIDgD8jcy7sTXilsgJ0xdVIvQ
	 cXSSrikfHWmTCwqJLMRGYXI20AHxPBoqYkUhfKfEaQ21W08HUtn3ICh1qjg8h8WjNb
	 C9vMj50xwm2Rktwz91c7VkZys80EO8WcWhBKLPm60dWl1JqIROz0WUtPi7rMFRo6bH
	 Vj7vx8bkg5LUw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sqFVT-00000000238-02yb;
	Mon, 16 Sep 2024 19:27:23 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 3/3] serial: qcom-geni: fix receiver enable
Date: Mon, 16 Sep 2024 19:26:42 +0200
Message-ID: <20240916172642.7814-4-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916172642.7814-1-johan+linaro@kernel.org>
References: <20240916172642.7814-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receiver should be enabled in the startup() callback and there is no
need to stop it on every termios update.

Since commit 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during
console writes") the calls to manipulate the secondary interrupts, which
were done without holding the port lock, can lead to the receiver being
left disabled when set_termios() races with the console code (e.g. when
init opens the tty during boot).

Fixes: 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during console writes")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 88ad5a6e7de2..85c2742e6cc4 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1167,6 +1167,11 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
 		if (ret)
 			return ret;
 	}
+
+	uart_port_lock_irq(uport);
+	qcom_geni_serial_start_rx(uport);
+	uart_port_unlock_irq(uport);
+
 	enable_irq(uport->irq);
 
 	return 0;
@@ -1252,7 +1257,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	unsigned int avg_bw_core;
 	unsigned long timeout;
 
-	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
 
@@ -1268,7 +1272,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		dev_err(port->se.dev,
 			"Couldn't find suitable clock rate for %u\n",
 			baud * sampling_rate);
-		goto out_restart_rx;
+		return;
 	}
 
 	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
@@ -1359,8 +1363,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
-out_restart_rx:
-	qcom_geni_serial_start_rx(uport);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-- 
2.44.2


