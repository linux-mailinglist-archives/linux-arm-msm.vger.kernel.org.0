Return-Path: <linux-arm-msm+bounces-20322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8098CDDAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5232B1C20A01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 23:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FAF1292D6;
	Thu, 23 May 2024 23:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SruNbPq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B61292E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 23:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716506567; cv=none; b=ht1aIZXF1QyPLSVHlXK/mqOnTgEVxzJsmkK4FmJcKyG0VdHFhlOfBnp+qSQd+j8DYRRPkFKhlCysSlWQWh97q86n1HuXpYXKWN43JSTnJYlktPuWvSPOEfeEKVv+fWHpl+m99wN5eUUecHY8Tq/Ww5yJZ0ECw3jFPxWI1brI9JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716506567; c=relaxed/simple;
	bh=oV1Rfj+qKyPdHTzJSmq+wfpP0m/pXfeqpjvSIitjMtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DX5aPpPJKAA5iqrq7mKkGLHuUpUHpyMfRZ9+LqZUKn7IaFfE1Ft4RfnwRkPycWtpyoypYcDlhj8S7PFybI1B2MNmR4R6PQdsSWMJMDVxOePWUSbwhEe8COJHpme1vJcZTNykR8hGzqlmPON/loPE9TAV6GKf3SXXqzx6LYyKs0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SruNbPq6; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f69422c090so3478113b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716506565; x=1717111365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2cndOyPusWD60XrwWYL/VwafNE0FrOs0G8XlptnnkQ=;
        b=SruNbPq6CfDND7ZWpZKM/xov5+ElNuMX0r2YpZMdQUy0DjfVHrMuv27feV8gEu1hxi
         HmI6aE7aSdi9Lt2RKdj+ZFBjwEtk19XxF2t14U430l99lDkDpPuoKerdxxXxSiVPTFCX
         S7w9qygItxt9Tk6sTmMyUn+N0iYVO45LHYyvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716506565; x=1717111365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2cndOyPusWD60XrwWYL/VwafNE0FrOs0G8XlptnnkQ=;
        b=BrNoe2dAt2WIXzSaPoO0P6BtiKXQJ390WvE8ckybFZkr5gnyWHY+WZCiqJH/orDjMx
         LYKkM48/ZihFZf8jWzpFK+iVl+ZnMzwp0vxppmzqxXoyj4FxT84xI4u3KZQb0QskYaHC
         FU8fzllO0ghVCbgkB3EwMcjUy9Tya4Fy+5tabseZWXtmGupYzFZUGEUBZF9hC55Gb6UO
         MQyAa6cgzxnBZPvATuej/hbsm0IstKng5t2jhgMc3tG7IsswEQ7IrM6C66HwyDYYJdUY
         NHCbsXJb5EmoXhO3u8xzhpm1a1QGJyu17/hOAf0ks5Se7lmsW6xi/jnL+73r9sLIi7wF
         Exyw==
X-Forwarded-Encrypted: i=1; AJvYcCUgAEDkupvQQbt4u6IgOVmW0wLP/bQztid5YVlUlsl7Y0vUzkJKqcyNv5ssiIJiIifgzH05sy7PoXIICabx/8QxD3Wa6x/XuwTqSw971Q==
X-Gm-Message-State: AOJu0YyKFfjNF0LzXtslXSx3l2BnTfFQNiMn1NIbP8HjT6WPOis/liE1
	O6xO4a740DhNP+qb/dkpizSnWHHCDJJt15+vfNWtngq8+jI1J/pqoeVTmVuuRA==
X-Google-Smtp-Source: AGHT+IHumt/MN1WgDMPiG970IBz7UzTszuFv7QPc41T4yeFO+pUdGKncQVg5TJZDuSajZ38nDHv2fA==
X-Received: by 2002:a17:902:f68d:b0:1f2:fccf:32d1 with SMTP id d9443c01a7336-1f4486dc807mr9531725ad.17.1716506565523;
        Thu, 23 May 2024 16:22:45 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b835:ba86:8e6d:41c6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c797938sm1279545ad.64.2024.05.23.16.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:22:44 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Douglas Anderson <dianders@chromium.org>,
	James Clark <james.clark@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 2/2] serial: qcom-geni: Fix qcom_geni_serial_stop_tx_fifo() while xfer
Date: Thu, 23 May 2024 16:22:13 -0700
Message-ID: <20240523162207.2.I0f81a5baa37d368f291c96ee4830abca337e3c87@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240523232216.3148367-1-dianders@chromium.org>
References: <20240523232216.3148367-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If qcom_geni_serial_stop_tx_fifo() was called while a transfer was
happening then the UART would be effectively stuck and wouldn't
transmit again. Specifically, I could reproduce these problem by
logging in via an agetty on the debug serial port (which was _not_
used for kernel console) and running:
  cat /var/log/messages
...and then (via an SSH session) forcing a few suspend/resume cycles.

Digging into this showed a number of problems. One problem was that we
cancelled the current "tx" command but we forgot to zero out
"tx_remaining". Another problem was that we didn't drain the buffer
before cancelling the "tx" command and thus those bytes were
lost. Another problem was that failing to drain the buffer meant that
the hardware still reported something in the FIFO and that caused
qcom_geni_serial_start_tx_fifo() to be a no-op, since it doesn't do
anything if the TX FIFO is not empty.

Though I haven't gone back and validated on ancient code, it appears
from code inspection that many of these problems have existed since
the start of the driver. In the very least, I could reproduce the
problems on vanilla v5.15. The problems don't seem to reproduce when
using the serial port for kernel console output and also don't seem to
reproduce if nothing is being printed to the console at suspend time,
so this is presumably why they were not noticed until now.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 45 +++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 2bd25afe0d92..9110ac4bdbbf 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -265,8 +265,8 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 	return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTIVE;
 }
 
-static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				int offset, int field, bool set)
+static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
+					   int offset, int field, u32 val)
 {
 	u32 reg;
 	struct qcom_geni_serial_port *port;
@@ -295,7 +295,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	timeout_us = DIV_ROUND_UP(timeout_us, 10) * 10;
 	while (timeout_us) {
 		reg = readl(uport->membase + offset);
-		if ((bool)(reg & field) == set)
+		if ((reg & field) == val)
 			return true;
 		udelay(10);
 		timeout_us -= 10;
@@ -303,6 +303,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	return false;
 }
 
+static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
+				      int offset, int field, bool set)
+{
+	return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
+}
+
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
 	u32 m_cmd;
@@ -675,6 +681,31 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 	if (!qcom_geni_serial_main_active(uport))
 		return;
 
+	/*
+	 * Wait until the FIFO has been drained. We've already taken bytes out
+	 * of the higher level queue in qcom_geni_serial_send_chunk_fifo() so
+	 * if we don't drain the FIFO but send the "cancel" below they seem to
+	 * get lost.
+	 */
+	qcom_geni_serial_poll_bitfield(uport, SE_GENI_TX_FIFO_STATUS, TX_FIFO_WC, 0);
+
+	/*
+	 * If we send the cancel immediately after the FIFO reports that it's
+	 * empty then bytes still seem to get lost. From trial and error, it
+	 * appears that a small delay here keeps bytes from being lost and
+	 * there is (apparently) no bit that we can poll instead of this.
+	 * Specifically it can be noted that the sequencer is still "active"
+	 * if it's waiting for us to send it more bytes from the current
+	 * transfer.
+	 */
+	mdelay(1);
+
+	/*
+	 * Cancel the current command. After this the main sequencer will
+	 * stop reporting that it's active and we'll have to start a new
+	 * transfer command. If the cancel doesn't take, we'll also send an
+	 * abort.
+	 */
 	geni_se_cancel_m_cmd(&port->se);
 	if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_CMD_CANCEL_EN, true)) {
@@ -684,6 +715,14 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 		writel(M_CMD_ABORT_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
 	}
 	writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+
+	/*
+	 * We've cancelled the current command. "tx_remaining" stores how
+	 * many bytes are left to finish in the current command so we know
+	 * when to start a new command. Since the command was cancelled we
+	 * need to zero "tx_remaining".
+	 */
+	port->tx_remaining = 0;
 }
 
 static void qcom_geni_serial_handle_rx_fifo(struct uart_port *uport, bool drop)
-- 
2.45.1.288.g0e0cd299f1-goog


