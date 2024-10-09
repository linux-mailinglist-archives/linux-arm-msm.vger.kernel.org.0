Return-Path: <linux-arm-msm+bounces-33714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A66E2996EA5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D61F1F22B1D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAF419F47E;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e87dP9Nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E319CC3E;
	Wed,  9 Oct 2024 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485489; cv=none; b=mQp2sXzzUlWwTpxmcb4Df3gj+ugo4myUNSeWI+sulv0DhLLZ8IWFMlqJYUrpmt2kIdlEQdaz9s6pYaRsv7sOM3xwqO4oLfcAQhKUyHgyXKX6QOS7APJqvxonLP4liLSv1YjNh+arbGJ5yXMtpTUBe2yVSwGBjN2SSup37ttEd/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485489; c=relaxed/simple;
	bh=hA1GeyxbnSLCBiHHg6Bb4ny0jlhc5XDjypu7jIcha+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6eiq0sE5yLvCqzi3FZIJvflOkZAm6NDUwX4yQsB6gsCYcJWz+IEoEU/fkWWIfM0zM9+2MLplhk3c0GdSDiDejhXZuNqVKC+4LgiLrpmZ+Xmih82GozLeKrQ68EJfo2t1ZsZ5R1+k6aQD1/UOALUxpdmsq8tH/0pjtqMotnf1LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e87dP9Nx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB5CC4CEC5;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485488;
	bh=hA1GeyxbnSLCBiHHg6Bb4ny0jlhc5XDjypu7jIcha+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e87dP9NxhuCIAVm+bDqyl3Df/MlwyA8gX2yAL8GU4nsYaekseywIuHXlfOWlwFxBs
	 9tV0XbfXzlSYb6Whc7dp/uC0lOvC1963vce7OYAFmo4J9zot5fxk3XLb0jexaZ2oRz
	 o9MPRZMhykKcX8xIVW5/ZtVV4me7ng7dmrUQzhykEB8POWSwGMOJuC/I+4sPk2PmkO
	 umEMN7ZFfKXGGeptCL7HxXhOA5l/RSGwG88CaMbIzoIZYL+S8nZCH/runyCnqhYhiL
	 IEG16X/vthfa+ZYX2yIHhlK3eFQ4IF1cEFNswHXJSxqc+p37UuvjjHxCzBaJ+CjfDn
	 vF5v33OUAn3bA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2G-000000004OV-2dfF;
	Wed, 09 Oct 2024 16:51:32 +0200
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
	stable@vger.kernel.org
Subject: [PATCH v3 1/9] serial: qcom-geni: fix polled console initialisation
Date: Wed,  9 Oct 2024 16:51:02 +0200
Message-ID: <20241009145110.16847-2-johan+linaro@kernel.org>
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

The polled console (KGDB/KDB) implementation must not call port setup
unconditionally as the port may already be in use by the console or a
getty.

Only make sure that the receiver is enabled, but do not enable any
device interrupts.

Fixes: d8851a96ba25 ("tty: serial: qcom-geni-serial: Add a poll_init() function")
Cc: stable@vger.kernel.org	# 6.4
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 6f0db310cf69..c237c9d107cd 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -147,6 +147,7 @@ static struct uart_driver qcom_geni_uart_driver;
 
 static void __qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
 static void qcom_geni_serial_cancel_tx_cmd(struct uart_port *uport);
+static int qcom_geni_serial_port_setup(struct uart_port *uport);
 
 static inline struct qcom_geni_serial_port *to_dev_port(struct uart_port *uport)
 {
@@ -395,6 +396,23 @@ static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 	writel(c, uport->membase + SE_GENI_TX_FIFOn);
 	qcom_geni_serial_poll_tx_done(uport);
 }
+
+static int qcom_geni_serial_poll_init(struct uart_port *uport)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	int ret;
+
+	if (!port->setup) {
+		ret = qcom_geni_serial_port_setup(uport);
+		if (ret)
+			return ret;
+	}
+
+	if (!qcom_geni_serial_secondary_active(uport))
+		geni_se_setup_s_cmd(&port->se, UART_START_READ, 0);
+
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_SERIAL_QCOM_GENI_CONSOLE
@@ -1582,7 +1600,7 @@ static const struct uart_ops qcom_geni_console_pops = {
 #ifdef CONFIG_CONSOLE_POLL
 	.poll_get_char	= qcom_geni_serial_get_char,
 	.poll_put_char	= qcom_geni_serial_poll_put_char,
-	.poll_init = qcom_geni_serial_port_setup,
+	.poll_init = qcom_geni_serial_poll_init,
 #endif
 	.pm = qcom_geni_serial_pm,
 };
-- 
2.45.2


