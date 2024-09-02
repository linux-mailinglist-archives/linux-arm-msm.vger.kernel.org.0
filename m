Return-Path: <linux-arm-msm+bounces-30415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25492968AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 17:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D02331F22BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 15:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC991A3050;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxupzCLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739E1A2656;
	Mon,  2 Sep 2024 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290759; cv=none; b=RL37llod1HgyFvBDPMGvCEPdjHTuNYCujXLD+TFi74ijj93h++0LLX6SdW+SZrwiWE10v0u3CTuWtmyUg4JURSFkJcyTYt0iuXF/yd+MSGWRAUf8VK4jP5ZaST27CtR9ZWy50HhTZcxVGzf8D2xq9R16aA7Vq7Zj+Z10neYQNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290759; c=relaxed/simple;
	bh=eBGRyIpVzQehl9xGekyRe1Te+y5jWUjLRLylfuuAzJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OeABEQB8erD8j4GY6O6gQqayyQzHi2VFj0G7sX5DTxbG22NbMZGDv5bHvJ2Lo8iS0bpVny06Fi+QSMAicPpOwgEBJJObiWFTRdodQQ/kmeDReckZW+X82OdmE6OTgvnpdKjHYWZHxBKjHY+WwkvsYjvkerlCOdREK+X9cRMwufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxupzCLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F71C4AF13;
	Mon,  2 Sep 2024 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725290759;
	bh=eBGRyIpVzQehl9xGekyRe1Te+y5jWUjLRLylfuuAzJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxupzCLapPOII3223qpzwyGkwoChHO9Jsm4pSw9Jb6XPjvp4wr0rYD/vPKQP1fJ2+
	 TpXdYh+1Yu+uvFkq0X1faC4BQeb8jJBu50liHxzDabskGP/BHIxJX4b1DiyECK2jYf
	 uu1DvwCD4MU+xOuHjpMCYpTYQtOgrCwejvL/jdCR6EPmsLG07nnRaIyGtIzuJMEPE0
	 rm1nWmZ6YwTWTuxBbFuR4sdQ5ZfRedDJnBOmpzcSt2EeCWc6U7HsazgESbKE2j3jS1
	 kNJpSA+g2yvnvu+eyme2XZLvQoKkMJ9fMwov/UFVGAKNp71OpZSXd/cy+23oDVKApO
	 K2rtJ0QKDo6Pg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sl8wX-000000000Ft-3O6K;
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
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 7/8] serial: qcom-geni: disable interrupts during console writes
Date: Mon,  2 Sep 2024 17:24:50 +0200
Message-ID: <20240902152451.862-8-johan+linaro@kernel.org>
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

Disable the GENI interrupts during console writes to reduce the risk of
having interrupt handlers spinning on the port lock on other cores for
extended periods of time.

This can, for example, reduce the total amount of time spent in the
interrupt handler during boot of the x1e80100 CRD by up to a factor nine
(e.g. from 274 ms to 30 ms) while the worst case processing time drops
from 19 ms to 8 ms.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index be620c5703f5..fbed143c90a3 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -488,6 +488,7 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 {
 	struct uart_port *uport;
 	struct qcom_geni_serial_port *port;
+	u32 m_irq_en, s_irq_en;
 	bool locked = true;
 	unsigned long flags;
 
@@ -503,6 +504,11 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
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
@@ -515,6 +521,9 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 
 	__qcom_geni_serial_console_write(uport, s, count);
 
+	writel(m_irq_en, uport->membase + SE_GENI_M_IRQ_EN);
+	writel(s_irq_en, uport->membase + SE_GENI_S_IRQ_EN);
+
 	if (locked)
 		uart_port_unlock_irqrestore(uport, flags);
 }
-- 
2.44.2


