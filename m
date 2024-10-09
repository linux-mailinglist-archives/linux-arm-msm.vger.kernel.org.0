Return-Path: <linux-arm-msm+bounces-33721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC67996EBC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 16:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9753284067
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 14:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C101AED5C;
	Wed,  9 Oct 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEuKbpyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7414F1A4F0C;
	Wed,  9 Oct 2024 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485490; cv=none; b=roTM2bg2GyfeySKZmaDjZbFBKKjjj9BfBGHvYmpUg1YzgLXN3OAGh1ZGLfB/qAIqjY5KKs+hwGgqbVDbARIkmzo5G3v1MjWimbEFuXTkLg0/n4bgd1v5FOyyT8chqFHkQtPG453yx7htGzQqy8z82d8NUaJsDlX1ww+t8IhJliQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485490; c=relaxed/simple;
	bh=5X379KfhJLHXk+Rf6uIayisvi5RGJbFHeIw5cV9JW6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWIup4NuIdYklimMHXX+iIZhsetGtysUYssoD9Dc+1ra9OG4oENk8vgEGWJeEwR3fANxOgsZvkwv0ay6RE4/dcK0t57rEI6Sb0+gvLcxFk+owPsW17fFOIxkfstJcjMwUq0/UBd5AUAnv3splxhRWgHqFXZ1u+ynps+HKJpuxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEuKbpyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC69C4CECD;
	Wed,  9 Oct 2024 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728485490;
	bh=5X379KfhJLHXk+Rf6uIayisvi5RGJbFHeIw5cV9JW6A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nEuKbpyT5LQP7PES7W35eK5pZYm8yUjsKC0ph6dxnJuNEUG9BezUGwuzBUsVXoWVP
	 K41HrXiFXOdW7ZIYQGTYXGLpZ1RBWCwEPF6XnXasuyceF6O6Gqasv1B1tx1gjies1z
	 T3TNpsSjF/eaprvlBrIzjLiDSZCeEbPQPsDpPB/BOIMXVuR7r4JUOpgBSWKqXbFZD0
	 KZd9kDKC2XraOZYV8XZYFcZ7eq46LnwILZ1eMgo5PLR4zN0hUw7wOBz3QU1i9Sv/dS
	 vaAbtlbuMwUSYQDThl8ZolIJHa1CAyQqKD4pQOK/P6aOYpFe7B+FYUnwninwf8zNG0
	 +xN1+NG26Fm2g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1syY2G-000000004OX-2ypK;
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
	stable@vger.kernel.org,
	Aniket Randive <quic_arandive@quicinc.com>
Subject: [PATCH v3 2/9] serial: qcom-geni: revert broken hibernation support
Date: Wed,  9 Oct 2024 16:51:03 +0200
Message-ID: <20241009145110.16847-3-johan+linaro@kernel.org>
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

This reverts commit 35781d8356a2eecaa6074ceeb80ee22e252fcdae.

Hibernation is not supported on Qualcomm platforms with mainline
kernels yet a broken vendor implementation for the GENI serial driver
made it upstream.

This is effectively dead code that cannot be tested and should just be
removed, but if these paths were ever hit for an open non-console port
they would crash the machine as the driver would fail to enable clocks
during restore() (i.e. all ports would have to be closed by drivers and
user space before hibernating the system to avoid this as a comment in
the code hinted at).

The broken implementation also added a random call to enable the
receiver in the port setup code where it does not belong and which
enables the receiver prematurely for console ports.

Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibernation feature")
Cc: stable@vger.kernel.org	# 6.2
Cc: Aniket Randive <quic_arandive@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 41 ++-------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index c237c9d107cd..2e4a5361f137 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1170,7 +1170,6 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
-	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
 	return 0;
@@ -1799,38 +1798,6 @@ static int qcom_geni_serial_sys_resume(struct device *dev)
 	return ret;
 }
 
-static int qcom_geni_serial_sys_hib_resume(struct device *dev)
-{
-	int ret = 0;
-	struct uart_port *uport;
-	struct qcom_geni_private_data *private_data;
-	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-
-	uport = &port->uport;
-	private_data = uport->private_data;
-
-	if (uart_console(uport)) {
-		geni_icc_set_tag(&port->se, QCOM_ICC_TAG_ALWAYS);
-		geni_icc_set_bw(&port->se);
-		ret = uart_resume_port(private_data->drv, uport);
-		/*
-		 * For hibernation usecase clients for
-		 * console UART won't call port setup during restore,
-		 * hence call port setup for console uart.
-		 */
-		qcom_geni_serial_port_setup(uport);
-	} else {
-		/*
-		 * Peripheral register settings are lost during hibernation.
-		 * Update setup flag such that port setup happens again
-		 * during next session. Clients of HS-UART will close and
-		 * open the port during hibernation.
-		 */
-		port->setup = false;
-	}
-	return ret;
-}
-
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
@@ -1842,12 +1809,8 @@ static const struct qcom_geni_device_data qcom_geni_uart_data = {
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
-	.suspend = pm_sleep_ptr(qcom_geni_serial_sys_suspend),
-	.resume = pm_sleep_ptr(qcom_geni_serial_sys_resume),
-	.freeze = pm_sleep_ptr(qcom_geni_serial_sys_suspend),
-	.poweroff = pm_sleep_ptr(qcom_geni_serial_sys_suspend),
-	.restore = pm_sleep_ptr(qcom_geni_serial_sys_hib_resume),
-	.thaw = pm_sleep_ptr(qcom_geni_serial_sys_hib_resume),
+	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
+					qcom_geni_serial_sys_resume)
 };
 
 static const struct of_device_id qcom_geni_serial_match_table[] = {
-- 
2.45.2


