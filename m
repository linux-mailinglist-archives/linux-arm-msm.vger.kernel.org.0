Return-Path: <linux-arm-msm+bounces-32877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EF98BCB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBDC21F24851
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A881C3310;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PldLBLov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4751C2DA5;
	Tue,  1 Oct 2024 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787071; cv=none; b=q5v2XzSnb/EddxZVgyODXTmdi5i5fhcNEf+UXGV5QUzyaZgaw/D4bCuQsD1z8KY3f4jI4+VoFS7EgM/qVKqSX6z2rK7C97bb8Ci0qeX58kTqYYoW6gIX7Mu/GcJEMaN39pkvvTuhbS42jEzwlaJSL8ILh/+NLBeklgvbOPXE6Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787071; c=relaxed/simple;
	bh=n14DOMLu+tTkfzWSwxnagK5nwZFIdud0kYQvc+s8lB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pWPlsxscsETbmbhhz36anqyOKl7WeXA4tO4buze4IVmlnpDfHk6YbBmRIMtdWd4c5JrobjtGNl5c7OpWJQFdk1rlYtrBit27v21fTczAo26s6vkpDybc+OMqzbNZXj1P7f+4tKueAwpFHplckhyRDIs6KuW5HP0AIUTDOlPzTyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PldLBLov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BEDC4AF09;
	Tue,  1 Oct 2024 12:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787071;
	bh=n14DOMLu+tTkfzWSwxnagK5nwZFIdud0kYQvc+s8lB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PldLBLovX7GBq3jtWtaU6FGiLT2Y7EHjBoiqflV2PS7A+Slg9aWx/vLHSAsijLuVP
	 ZN0tOvLV+90AmtaUVSy6BtK48xgm5+h9THowTpJbOGbQHSWTCnHteCPSb/n4ZXlbSS
	 09w+UD7dAFeEp0qWxnzBnYdvODGeEmBvOwwOdqkow0sJL5QNhr3lxSnqESGxj3wATX
	 uhVVs96kvodNNynt8TZ/g/HxSSxgnUGtl2+6wc6ZGPtPx8FDF+39MpXR5NM7XSALEx
	 slm0Tt4q6t/KqGroHvNOy9yk6eAI165o7fXzSMZoPd5V1TSKp+We3ualJ0xpJ2TqUv
	 f6oTllHogg2Jg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svcLP-000000002mK-0sJo;
	Tue, 01 Oct 2024 14:51:11 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 4/7] serial: qcom-geni: fix receiver enable
Date: Tue,  1 Oct 2024 14:50:30 +0200
Message-ID: <20241001125033.10625-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001125033.10625-1-johan+linaro@kernel.org>
References: <20241001125033.10625-1-johan+linaro@kernel.org>
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

The calls to stop and start rx in set_termios() can similarly race with
DMA completion and, for example, cause the DMA buffer to be unmapped
twice or the mapping to be leaked.

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
index dea688db0d7c..5b6c5388efee 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1179,6 +1179,11 @@ static int qcom_geni_serial_startup(struct uart_port *uport)
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
@@ -1264,7 +1269,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	unsigned int avg_bw_core;
 	unsigned long timeout;
 
-	qcom_geni_serial_stop_rx(uport);
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 4000000);
 
@@ -1280,7 +1284,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 		dev_err(port->se.dev,
 			"Couldn't find suitable clock rate for %u\n",
 			baud * sampling_rate);
-		goto out_restart_rx;
+		return;
 	}
 
 	dev_dbg(port->se.dev, "desired_rate = %u, clk_rate = %lu, clk_div = %u\n",
@@ -1371,8 +1375,6 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	writel(stop_bit_len, uport->membase + SE_UART_TX_STOP_BIT_LEN);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_M_CLK_CFG);
 	writel(ser_clk_cfg, uport->membase + GENI_SER_S_CLK_CFG);
-out_restart_rx:
-	qcom_geni_serial_start_rx(uport);
 }
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
-- 
2.45.2


