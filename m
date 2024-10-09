Return-Path: <linux-arm-msm+bounces-33717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F586996EB4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EED80283FBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDD91A264A;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7NZj/yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F40719DFA5;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=sdqjIMVssqJfg7kOOwvs+7a7O/b4LYfiFP/AAPMvp1FOw8xt/q+ojzLNlulsbpC8N2t4UNy8vCKL5QT9aaFUantacSzqQyjUghDGtWGvubI4ZAdanhPA/5820rFhElZ5d3NpcXwHY6XFo8KoNw3cefS1Z/hiD4bMRMB4hVR+pUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=6EScB7CZdFUvFKjORGCL1uixj3+Bszuc7l9Y6WimbDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ps4peLX73nBA2e9kWQQwnWGKZt8ZhHiMZfLGAiiWbgx4zfZ19+XIrSyEUcJjmgkz+2zWyH6w2CkIAe2GOOghi9vRkgXmAn4e0g0LlPz/A8feyNJZhG3gm7Zks/OJZhYE4eiKrZLqupSFyN5c5N69WReddwSQ653fdNQ98vLhpQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7NZj/yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055B0C4CED1;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485489;
	bh=6EScB7CZdFUvFKjORGCL1uixj3+Bszuc7l9Y6WimbDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s7NZj/yuj3uoKBubxOzc3meVMP3ZlU+idCD2gO2TGNoMsI6g1aRzzENPajcZXwAPe
	 G1aaMoAGLk9wZY98m+S8E+L0d7905mrIaDbiImfepdYelrISQ+ZuZEbuBZejPAdwqs
	 vcD/ARd6mtaxJBkjjXI3hPOeKniHuRczsNFLUAQWeARcfngf3r0wnkrUuo7gEgMbzI
	 OSJKsHJDY6wxn6IHb5bRq/ZcF9JoLaN1XaoFYnc7rtMUViEp7G3Bv/sQxqAFriWRUs
	 Tcca2qCh0rVn5MlI0E/rZlioTs1w40K6DjtGzvOpC9n/vqJ28lf7kcG8aqa5H4eMzZ
	 NquSGIprWghAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2G-000000004Od-49jE;
	Wed, 09 Oct 2024 16:51:33 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 5/9] serial: qcom-geni: fix receiver enable
Date: Wed,  9 Oct 2024 16:51:06 +0200
Message-ID: <20241009145110.16847-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009145110.16847-1-johan+linaro@kernel.org>
References: <20241009145110.16847-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receiver is supposed to be enabled in the startup() callback and not
in set_termios() which is called also during console setup.

This specifically avoids accepting input before the port has been opened
(and interrupts enabled), something which can also break the GENI
firmware (cancel fails and after abort, the "stale" counter handling
appears to be broken so that later input is not processed until twelve
chars have been received).

There also does not appear to be any need to keep the receiver disabled
while updating the port settings.

Since commit 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during
console writes") the calls to manipulate the secondary interrupts, which
were done without holding the port lock, can also lead to the receiver
being left disabled when set_termios() races with the console code (e.g.
when init opens the tty during boot). This can manifest itself as a
serial getty not accepting input.

The calls to stop and start rx in set_termios() can similarly race with
DMA completion and, for example, cause the DMA buffer to be unmapped
twice or the mapping to be leaked.

Fix this by only enabling the receiver during startup and while holding
the port lock to avoid racing with the console code.

Fixes: 6f3c3cafb115 ("serial: qcom-geni: disable interrupts during console writes")
Fixes: 2aaa43c70778 ("tty: serial: qcom-geni-serial: add support for serial engine DMA")
Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Cc: stable@vger.kernel.org      # 6.3
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index aaf24bd037a7..6c4349ea5720 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1197,6 +1197,11 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
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
@@ -1282,7 +1287,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	unsigned int avg_bw_core;
 	unsigned long timeout;
 
-	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
 
@@ -1298,7 +1302,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		dev_err(port->se.dev,
 			"Couldn't find suitable clock rate for %u\n",
 			baud * sampling_rate);
-		goto out_restart_rx;
+		return;
 	}
 
 	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
@@ -1389,8 +1393,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
-out_restart_rx:
-	qcom_geni_serial_start_rx(uport);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-- 
2.45.2


