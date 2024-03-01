Return-Path: <linux-arm-msm+bounces-13122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5886EB75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 22:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70794B22BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 21:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F3258AD7;
	Fri,  1 Mar 2024 21:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hPVorvr4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/KYP3h6W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AA57873;
	Fri,  1 Mar 2024 21:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709329977; cv=none; b=fkky0ttq57w3oJDRlganBj2UrtzlIzd1eS3dJWeh4aRD8kPfKjTP6ZvAM4hTL0m9LWIacZf0EVEEypwVBRBfJrAiOXLfcVimqwUBOINhHE5rdph+c5TJLIcDaOOvsKTVLWL8pDHZBCn7l2LJeMutDjI7qUXJzKNt8IfWhn4vSV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709329977; c=relaxed/simple;
	bh=ZSHo7yW56q/OlHOuR8ZSf19ghp6NekGXo4YcajF/HdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqMsUW3/K5+3re97vCiS/ETufMD3bq2cMpqqKg2wAc1pbnwS+/pOrjQApdNLNxxpUj5Sp9KYVeFv7pdo7gnR3nmME15ZDs0zE4aYD6pDa3ZNYw8Ayh09tPT3lfhgxWooTbdTl6T8JUF0qqjU73OXsn3TfUNhd1sPfQSzR2U/vdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hPVorvr4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/KYP3h6W; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709329971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmPH4B4axTpKo5FxjSK3NcariRNbGHfCM6HFELDE+lQ=;
	b=hPVorvr4HEx95TVYMIAgH+mUMaPHgAkQKpg/1R+JW9QNsO6/wzm/AaCImUQAhvuv1GSowQ
	x4qCesKySc7anz3pLghuyOr5uePiwGPQOS4HuMO0+XrVDsUHnWBWHIvBzMehjHTvVut95B
	4JeGs5GZWq1BDTjx57BgEetqBGJIpJvmLpeyPUHC1uLa+JvmodKSVl5QyUgvm+bzgOsy/8
	TaAryy8aCFxeiiG3jcRJ+DJXGuuFDn47XXW466vBH3zj7E/GTO9psU3VehjYE7f0hbZ6f/
	E0266TCHeosRsZUPRsunaI0Nw6DXVpDKnXIQustsXLyZSZ8ZOArEfxiQ/IdlBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709329971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmPH4B4axTpKo5FxjSK3NcariRNbGHfCM6HFELDE+lQ=;
	b=/KYP3h6W869OPAT3O4R56gPNrKlXFktxAb3iKcn1GjGPj1waQH6kBcx/CIFWeKlTQWB06/
	X9pH9Nj4rJbfmNBw==
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 05/18] serial: msm: Use uart_prepare_sysrq_char().
Date: Fri,  1 Mar 2024 22:45:18 +0100
Message-ID: <20240301215246.891055-6-bigeasy@linutronix.de>
In-Reply-To: <20240301215246.891055-1-bigeasy@linutronix.de>
References: <20240301215246.891055-1-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The port lock is a spinlock_t which is becomes a sleeping lock on PREEMPT_R=
T.
The driver splits the locking function into two parts: local_irq_save() and
uart_port_lock() and this breaks PREEMPT_RT.

Delay handling sysrq until port lock is dropped.
Remove the special case in the console write routine an always use the
complete locking function.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/tty/serial/msm_serial.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_seria=
l.c
index e24204ad35def..d27c4c8c84e13 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -588,16 +588,14 @@ static void msm_complete_rx_dma(void *args)
 		if (!(port->read_status_mask & MSM_UART_SR_RX_BREAK))
 			flag =3D TTY_NORMAL;
=20
-		uart_port_unlock_irqrestore(port, flags);
-		sysrq =3D uart_handle_sysrq_char(port, dma->virt[i]);
-		uart_port_lock_irqsave(port, &flags);
+		sysrq =3D uart_prepare_sysrq_char(port, dma->virt[i]);
 		if (!sysrq)
 			tty_insert_flip_char(tport, dma->virt[i], flag);
 	}
=20
 	msm_start_rx_dma(msm_port);
 done:
-	uart_port_unlock_irqrestore(port, flags);
+	uart_unlock_and_check_sysrq_irqrestore(port, flags);
=20
 	if (count)
 		tty_flip_buffer_push(tport);
@@ -763,9 +761,7 @@ static void msm_handle_rx_dm(struct uart_port *port, un=
signed int misr)
 			if (!(port->read_status_mask & MSM_UART_SR_RX_BREAK))
 				flag =3D TTY_NORMAL;
=20
-			uart_port_unlock(port);
-			sysrq =3D uart_handle_sysrq_char(port, buf[i]);
-			uart_port_lock(port);
+			sysrq =3D uart_prepare_sysrq_char(port, buf[i]);
 			if (!sysrq)
 				tty_insert_flip_char(tport, buf[i], flag);
 		}
@@ -825,9 +821,7 @@ static void msm_handle_rx(struct uart_port *port)
 		else if (sr & MSM_UART_SR_PAR_FRAME_ERR)
 			flag =3D TTY_FRAME;
=20
-		uart_port_unlock(port);
-		sysrq =3D uart_handle_sysrq_char(port, c);
-		uart_port_lock(port);
+		sysrq =3D uart_prepare_sysrq_char(port, c);
 		if (!sysrq)
 			tty_insert_flip_char(tport, c, flag);
 	}
@@ -948,11 +942,10 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 	struct uart_port *port =3D dev_id;
 	struct msm_port *msm_port =3D to_msm_port(port);
 	struct msm_dma *dma =3D &msm_port->rx_dma;
-	unsigned long flags;
 	unsigned int misr;
 	u32 val;
=20
-	uart_port_lock_irqsave(port, &flags);
+	uart_port_lock(port);
 	misr =3D msm_read(port, MSM_UART_MISR);
 	msm_write(port, 0, MSM_UART_IMR); /* disable interrupt */
=20
@@ -984,7 +977,7 @@ static irqreturn_t msm_uart_irq(int irq, void *dev_id)
 		msm_handle_delta_cts(port);
=20
 	msm_write(port, msm_port->imr, MSM_UART_IMR); /* restore interrupt */
-	uart_port_unlock_irqrestore(port, flags);
+	uart_unlock_and_check_sysrq(port);
=20
 	return IRQ_HANDLED;
 }
@@ -1621,14 +1614,10 @@ static void __msm_console_write(struct uart_port *p=
ort, const char *s,
 			num_newlines++;
 	count +=3D num_newlines;
=20
-	local_irq_save(flags);
-
-	if (port->sysrq)
-		locked =3D 0;
-	else if (oops_in_progress)
-		locked =3D uart_port_trylock(port);
+	if (oops_in_progress)
+		locked =3D uart_port_trylock_irqsave(port, &flags);
 	else
-		uart_port_lock(port);
+		uart_port_lock_irqsave(port, &flags);
=20
 	if (is_uartdm)
 		msm_reset_dm_count(port, count);
@@ -1667,9 +1656,7 @@ static void __msm_console_write(struct uart_port *por=
t, const char *s,
 	}
=20
 	if (locked)
-		uart_port_unlock(port);
-
-	local_irq_restore(flags);
+		uart_port_unlock_irqrestore(port, flags);
 }
=20
 static void msm_console_write(struct console *co, const char *s,
--=20
2.43.0


