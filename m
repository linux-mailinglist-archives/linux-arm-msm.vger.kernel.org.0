Return-Path: <linux-arm-msm+bounces-7160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAB982C7D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jan 2024 00:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51A231F23138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jan 2024 23:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C398E18E14;
	Fri, 12 Jan 2024 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M5D3wji+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F9D18C32
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 23:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2046dee3c14so3861279fac.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jan 2024 15:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705100650; x=1705705450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpqKIDk36VlVzO0rugmoEmqPTQlUdVUabRrmvMVC4u0=;
        b=M5D3wji+C7rELO4bfxY/KZduTKCvW9DaAJt5REteuEZEpO6gFvMA8zwXFFcD4Vny/+
         WoEFIC2hSVqzL87TZH3jYWLTTIqafucjqQO0YEZ7emBULcthNKzDIow0u/9Xf2HrxRZN
         HutcZOOyLRi2HHG9WhUtm1iQfTN2G/whEKj0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705100650; x=1705705450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpqKIDk36VlVzO0rugmoEmqPTQlUdVUabRrmvMVC4u0=;
        b=hohCApEVOHAYCPWUHQlVE/aLSQNG3HTjGe8vpOj2Zmq4bWWvRNjgUVTz1R3LN2f1XC
         2D6RggTO2cuve/zlcWeTQVnw7vj42aqEjqRUBV6Me6AH9BAJygrVw8o+qcg8E7qiAkpF
         SypMjh2WKRDwVphHTBH8SvHPfzc9mNSd0m3qN6YXjV3PuTCDl7yEff4YX68xZonSC92f
         +fAKDQ3SGo08/Njx2WLE6FLJyMmNpQdtj3advyfRnO9GIAa0YI2YugAjZ4S9JNgPaiAE
         dXmNnSRduQShEyabDG2sXrCvCGF+GdYx+F6hYDy7kmJ9cmzwZgZ0eoJImBtUIdp9C+ZL
         HvxQ==
X-Gm-Message-State: AOJu0YxCaEtOZkeHPI8jdJFKa2kCknnAkqBxDJg+DkJUVksR2tIP2bSN
	i7BgIHjS/OpLKBysKFjBvyGuivml5Xw/ZBSpKmy8esogtQ==
X-Google-Smtp-Source: AGHT+IEL0tFoLu9ftH9Yrk9OESPN6qWXu9TY9EjnN01P+Hxb8oKx+2lK9GtS7t/Z9Zr8wwOeiRDFpA==
X-Received: by 2002:a05:6871:b2a:b0:204:4926:1824 with SMTP id fq42-20020a0568710b2a00b0020449261824mr2346994oab.80.1705100650626;
        Fri, 12 Jan 2024 15:04:10 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3e64:3a29:441b:e07e])
        by smtp.gmail.com with ESMTPSA id fd41-20020a056a002ea900b006d49ed3eff2sm3678612pfb.75.2024.01.12.15.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 15:04:10 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] serial: qcom-geni: Don't cancel/abort if we can't get the port lock
Date: Fri, 12 Jan 2024 15:03:08 -0800
Message-ID: <20240112150307.2.Idb1553d1d22123c377f31eacb4486432f6c9ac8d@changeid>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
In-Reply-To: <20240112150307.1.I7dc0993c1e758a1efedd651e7e1670deb1b430fb@changeid>
References: <20240112150307.1.I7dc0993c1e758a1efedd651e7e1670deb1b430fb@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As of commit d7402513c935 ("arm64: smp: IPI_CPU_STOP and
IPI_CPU_CRASH_STOP should try for NMI"), if we've got pseudo-NMI
enabled then we'll use it to stop CPUs at panic time. This is nice,
but it does mean that there's a pretty good chance that we'll end up
stopping a CPU while it holds the port lock for the console
UART. Specifically, I see a CPU get stopped while holding the port
lock nearly 100% of the time on my sc7180-trogdor based Chromebook by
enabling the "buddy" hardlockup detector and then doing:

  sysctl -w kernel.hardlockup_all_cpu_backtrace=1
  sysctl -w kernel.hardlockup_panic=1
  echo HARDLOCKUP > /sys/kernel/debug/provoke-crash/DIRECT

UART drivers are _supposed_ to handle this case OK and this is why
UART drivers check "oops_in_progress" and only do a "trylock" in that
case. However, before we enabled pseudo-NMI to stop CPUs it wasn't a
very well-tested situation.

Now that we're testing the situation a lot, it can be seen that the
Qualcomm GENI UART driver is pretty broken. Specifically, when I run
my test case and look at the console output I just see a bunch of
garbled output like:

  [  201.069084] NMI backtrace[  201.069084] NM[  201.069087] CPU: 6
  PID: 10296 Comm: dnsproxyd Not tainted 6.7.0-06265-gb13e8c0ede12
  #1 01112b9f14923cbd0b[  201.069090] Hardware name: Google Lazor
  ([  201.069092] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DI[
  201.069095] pc : smp_call_function_man[  201.069099]

That's obviously not so great. This happens because each call to the
console driver exits after the data has been written to the FIFO but
before it's actually been flushed out of the serial port. When we have
multiple calls into the console one after the other then (if we can't
get the lock) each call tells the UART to throw away any data in the
FIFO that hadn't been transferred yet.

I've posted up a patch to change the arm64 core to avoid this
situation most of the time [1] much like x86 seems to do, but even if
that patch lands the GENI driver should still be fixed.

From testing, it appears that we can just delete the cancel/abort in
the case where we weren't able to get the UART lock and the output
looks good. It makes sense that we'd be able to do this since that
means we'll just call into __qcom_geni_serial_console_write() and
__qcom_geni_serial_console_write() looks much like
qcom_geni_serial_poll_put_char() but with a loop. However, it seems
safest to poll the FIFO and make sure it's empty before our
transfer. This should reliably make sure that we're not
interrupting/clobbering any existing transfers.

As part of this change, we'll also avoid re-setting up a TX at the end
of the console write function if we weren't able to get the lock,
since accessing "port->tx_remaining" without the lock is not
safe. This is only needed to re-start userspace initiated transfers.

[1] https://lore.kernel.org/r/20231207170251.1.Id4817adef610302554b8aa42b090d57270dc119c@changeid

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/qcom_geni_serial.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7e78f97e8f43..06ebe62f99bc 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -488,18 +488,16 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
 	geni_status = readl(uport->membase + SE_GENI_STATUS);
 
-	/* Cancel the current write to log the fault */
 	if (!locked) {
-		geni_se_cancel_m_cmd(&port->se);
-		if (!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-						M_CMD_CANCEL_EN, true)) {
-			geni_se_abort_m_cmd(&port->se);
-			qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
-							M_CMD_ABORT_EN, true);
-			writel(M_CMD_ABORT_EN, uport->membase +
-							SE_GENI_M_IRQ_CLEAR);
-		}
-		writel(M_CMD_CANCEL_EN, uport->membase + SE_GENI_M_IRQ_CLEAR);
+		/*
+		 * We can only get here if an oops is in progress then we were
+		 * unable to get the lock. This means we can't safely access
+		 * our state variables like tx_remaining. About the best we
+		 * can do is wait for the FIFO to be empty before we start our
+		 * transfer, so we'll do that.
+		 */
+		qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
+					  M_TX_FIFO_NOT_EMPTY_EN, false);
 	} else if ((geni_status & M_GENI_CMD_ACTIVE) && !port->tx_remaining) {
 		/*
 		 * It seems we can't interrupt existing transfers if all data
@@ -516,11 +514,12 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
 	__qcom_geni_serial_console_write(uport, s, count);
 
-	if (port->tx_remaining)
-		qcom_geni_serial_setup_tx(uport, port->tx_remaining);
 
-	if (locked)
+	if (locked) {
+		if (port->tx_remaining)
+			qcom_geni_serial_setup_tx(uport, port->tx_remaining);
 		uart_port_unlock_irqrestore(uport, flags);
+	}
 }
 
 static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
-- 
2.43.0.275.g3460e3d667-goog


