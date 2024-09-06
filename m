Return-Path: <linux-arm-msm+bounces-31123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AB96F52D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 15:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7451E1F24C9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 13:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1561CF2B7;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bq5Cmu35"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2B1CEABC;
	Fri,  6 Sep 2024 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725628499; cv=none; b=U3wblq7D5gb470Ahko7jWNWV+ze0MMq6/o8dOi+z/UNCfo8lzbcukACgDBtQy7xoVL8fl+MA9DgEi3CT3uVJMmI/5A1JnTdXS8I1v3x0ThGoVXI5ZEuBN/43/CHd3VeMpu0AgsL+cNzjOmTxcW76V6v8O72HcsaRaEqXWkW/0Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725628499; c=relaxed/simple;
	bh=GDQOGSpitpZi51yoXPlIy1fHyV3RNsflRSIpWdUHojs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SU33NqEg6ms3u5r4amLYXxiF3N6MhQxcZg4JGv4kIU54Bs661+Gs5AmF82v20R7NvNTXG+28wvUwsjBAyBxKJRIJp10z1V4siHPQ+YTwfJOLmQv7gOXsmsYTFTagnsSXnEfgcSNLQaFy4AOptyUyTc0SK6GAffIeLAsOwGYSm+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bq5Cmu35; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4392C4CECD;
	Fri,  6 Sep 2024 13:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725628498;
	bh=GDQOGSpitpZi51yoXPlIy1fHyV3RNsflRSIpWdUHojs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bq5Cmu35bzqwbyQCRRWRLSgGUGnBgwr874RRvmSLZGhDBKqEaMqpnjeZe+mngvDdl
	 UwZ322fG3ET1JUWYspzmvU90Qi7jLoKcvE02ezvogUP7Zmr8KESzcewY2sQoXbgg35
	 5QjSv9+ouXWZqacpXBBTz4uAPHjc2uS6HqG+/arq+Foi1LAOCFNgPkEfAuILvwlA6M
	 f+hSiVDQiqC+Dwjth4qg3ycSILvPWjX8IXnj3XMOxhFDZIHfwr8XzHWhIchROANmZe
	 rnnvmShP6fWzmltkwcdb7oxEhuV8Kc6NKPU9SqMGd3TUKOk2WGvF472iVKflWDmqL4
	 Pjan+iRqL2zqw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1smYo3-000000006Aq-2lPx;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 7/8] serial: qcom-geni: disable interrupts during console writes
Date: Fri,  6 Sep 2024 15:13:35 +0200
Message-ID: <20240906131336.23625-8-johan+linaro@kernel.org>
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

Disable the GENI interrupts during console writes to reduce the risk of
having interrupt handlers spinning on the port lock on other cores for
extended periods of time.

This can, for example, reduce the total amount of time spent in the
interrupt handler during boot of the x1e80100 CRD by up to a factor nine
(e.g. from 274 ms to 30 ms) while the worst case processing time drops
from 19 ms to 8 ms.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f8f6e9466b40..f23fd0ac3cfd 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -477,6 +477,7 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 {
 	struct uart_port *uport;
 	struct qcom_geni_serial_port *port;
+	u32 m_irq_en, s_irq_en;
 	bool locked = true;
 	unsigned long flags;
 
@@ -492,6 +493,11 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 	else
 		uart_port_lock_irqsave(uport, &flags);
 
+	m_irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
+	s_irq_en = readl(uport->membase + SE_GENI_S_IRQ_EN);
+	writel(0, uport->membase + SE_GENI_M_IRQ_EN);
+	writel(0, uport->membase + SE_GENI_S_IRQ_EN);
+
 	if (qcom_geni_serial_main_active(uport)) {
 		/* Wait for completion or drain FIFO */
 		if (!locked || port->tx_remaining == 0)
@@ -504,6 +510,9 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
 	__qcom_geni_serial_console_write(uport, s, count);
 
+	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
+	writel(s_irq_en, uport->membase + SE_GENI_S_IRQ_EN);
+
 	if (locked)
 		uart_port_unlock_irqrestore(uport, flags);
 }
-- 
2.44.2


