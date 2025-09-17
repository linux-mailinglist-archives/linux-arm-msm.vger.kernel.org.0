Return-Path: <linux-arm-msm+bounces-73826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C300B7F454
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7E965221A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A8E15ADB4;
	Wed, 17 Sep 2025 01:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J919dC6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82B208A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071088; cv=none; b=M1uydfyreWa6CJLr4WRTIlOiCdPlvt40JaknL+lRNV2zdGVTaXJFbnXIB+CBoYffrS+IYgoedqr6gyQr75ZBSyCYRSjUwf36ydn6qPlajSj3aAdTbWVcHuMpAxrCzPGnfISiUbybEcBBu1vJfdB93/L4UW+OB8OC09INZ1quc9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071088; c=relaxed/simple;
	bh=4ZcqJ75pPAujwrk5oKHUOHnezTrHikXVf2O8dJL0dbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Olxq7xcbb1nrr2wzsobGcRzMUINFZrogzl8vHng2OIJlaJ/jtR4znLSZ3hGOYwD0JYuU0CeT30Oh/xGSAtG3ZwPn1shX+CrcKfUProWknqYI4wofnZ43v8nQZpKvoo3jQTpwwgDdYvWSanhueAAbMNK0DzyeGxkKZlsx2ZF871E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J919dC6T; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-267f15eb5d3so1363905ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 18:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758071086; x=1758675886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYOA6+LwL18jl8u1tk3jFNcDy8ykZEeWJOtJwJB5cDo=;
        b=J919dC6T35y3o3dvGgPmkwcTN5ROt2kPltUjvWSsX5tdLFZOwR7mExMMTRoE0fEBfP
         fHw/B7+FNob1HXF/1/ufMeXYpojJHsY/ThJb/V5dn0eRLFwq5H7+piE+anB0ieocPPFE
         TK2I5jp4f0F4JI68nL92p0CJoBa1EXhv6r5gIdfg7/L+oFsHRBlnib3tGexnAn2wmce/
         7jcLn46Xbc9nEzj97OI1BAGk96ssl8qMIl4PPH3jDydlgb6lM+oipI1NTcjm5nDevkCW
         NjS6yzYp+yhW/fb+OTf7S8gevMZspmoot4Ly62lQI8mCW5MYK7lJJL6tZXicw/VKhDCE
         hKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758071086; x=1758675886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYOA6+LwL18jl8u1tk3jFNcDy8ykZEeWJOtJwJB5cDo=;
        b=kFJe3riyeY/UGqmqN8dlAeEIiNSjxJoJh0n8w//Pb/VgpOfSxl9hLl0TYz4PRzlOpi
         8LvuCJ7p4/RQxVqw7p2QdOfVyCqo1sjtlgnWAnB++Ks1aduDqR567kN0BjnPSFHUyGO1
         AdyzPG6lcs1Rpr2AUQu1jTekW/I6IW0iBifiN4LiajmQSlototi+hzvMx7NsbJuavmsd
         sBLHSJQk1e6bxW6GlwDCosMV+vVFEZ1gdBPYESKZcvmGQWHpCUXJ2SOtnnEMWGuQ8Bdj
         4B8a0aDV4LYypbB/12ZlNUSuFtwt4PwMxLV+g6alMpLAgGTv8xi7okvzEPBP7RYcrHr3
         prXw==
X-Forwarded-Encrypted: i=1; AJvYcCWX3STXimfMVX6hGDoSc76Z0hhq+Uos+Yo6VfG30n3X0xPfXgkA+aC0+OPZMyeqVvZKI9p0USnf4bKvsRLE@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnjIindSLwdHmTy+t9qBitDLrJpG+HWsm2zmykRJbZhQhMR1X
	iJFMjmmHYlPr8yoI33RpAKdEEB7EkizgkmvLy0xkYRWkagifQSqW5y452PrHkMv/XUk=
X-Gm-Gg: ASbGncuBoP8ehZ19ygK7ByAR7UZfsFpngVRQAhmeuJL8mIW+mXNGXOoxIZMRKKJziOW
	73fI1EtUrjRBohABTMYyQvYxBAHrbGw52wNLEpStb2EidpC3Ws0FsP2nxoo06n4khUajk4hJ1Cp
	z85J25iJPsLnqRdmwTI9SULNZYtRugdDZhZRmm/E28DcL59rGgOkgPNHYDoKlbZ2G4zhIebv/y9
	mEZZwahn363orXOy5YsGTLqn14v8Uia3ShTJTLhuPooMOkEghZIdmG4ihLCm8WEaSOmo3FIJryt
	9rjbQlooFuOYKLSvVp2HtRiU+q4d7AXQuVY++u4ihpJwK6hdkOrnbbANqZX+QK4SsIHFkBltHnp
	IqK1eo6NIuhUfWQeR02KKGo4xdX5Mhmw=
X-Google-Smtp-Source: AGHT+IG4cg2s7I7MouXl4q8VgdPiSIQsWLG1cTbVLWxNQsLo9TxoOObZ2J8dnaVABh816nCyCR12iw==
X-Received: by 2002:a17:90b:33c8:b0:32d:f925:ce58 with SMTP id 98e67ed59e1d1-32ee3fa406cmr221938a91.5.1758071085719;
        Tue, 16 Sep 2025 18:04:45 -0700 (PDT)
Received: from kuoka.. ([218.51.42.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760955263fsm16852911b3a.8.2025.09.16.18.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 18:04:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Praveen Talari <quic_ptalari@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2] serial: qcom-geni: Fix blocked task
Date: Wed, 17 Sep 2025 10:04:38 +0900
Message-ID: <20250917010437.129912-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert commit 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for
serial driver") and its dependent commit 86fa39dd6fb7 ("serial:
qcom-geni: Enable Serial on SA8255p Qualcomm platforms") because the
first one causes regression - hang task on Qualcomm RB1 board (QRB2210)
and unable to use serial at all during normal boot:

  INFO: task kworker/u16:0:12 blocked for more than 42 seconds.
        Not tainted 6.17.0-rc1-00004-g53e760d89498 #9
  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
  task:kworker/u16:0   state:D stack:0     pid:12    tgid:12    ppid:2      task_flags:0x4208060 flags:0x00000010
  Workqueue: async async_run_entry_fn
  Call trace:
   __switch_to+0xe8/0x1a0 (T)
   __schedule+0x290/0x7c0
   schedule+0x34/0x118
   rpm_resume+0x14c/0x66c
   rpm_resume+0x2a4/0x66c
   rpm_resume+0x2a4/0x66c
   rpm_resume+0x2a4/0x66c
   __pm_runtime_resume+0x50/0x9c
   __driver_probe_device+0x58/0x120
   driver_probe_device+0x3c/0x154
   __driver_attach_async_helper+0x4c/0xc0
   async_run_entry_fn+0x34/0xe0
   process_one_work+0x148/0x290
   worker_thread+0x2c4/0x3e0
   kthread+0x118/0x1c0
   ret_from_fork+0x10/0x20

The issue was reported on 12th of August and was ignored by author of
commits introducing issue for two weeks.  Only after complaining author
produced a fix which did not work, so if original commits cannot be
reliably fixed for 5 weeks, they obviously are buggy and need to be
dropped.

Fixes: 1afa70632c39 ("serial: qcom-geni: Enable PM runtime for serial driver")
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct reference to cause (proper commit) in the commit msg.
---
 drivers/tty/serial/qcom_geni_serial.c | 176 +++-----------------------
 1 file changed, 16 insertions(+), 160 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0fdda3a1e70b..7c5befe5490d 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -14,7 +14,6 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -102,16 +101,10 @@
 #define DMA_RX_BUF_SIZE		2048
 
 static DEFINE_IDA(port_ida);
-#define DOMAIN_IDX_POWER	0
-#define DOMAIN_IDX_PERF		1
 
 struct qcom_geni_device_data {
 	bool console;
 	enum geni_se_xfer_mode mode;
-	struct dev_pm_domain_attach_data pd_data;
-	int (*resources_init)(struct uart_port *uport);
-	int (*set_rate)(struct uart_port *uport, unsigned int baud);
-	int (*power_state)(struct uart_port *uport, bool state);
 };
 
 struct qcom_geni_private_data {
@@ -149,7 +142,6 @@ struct qcom_geni_serial_port {
 
 	struct qcom_geni_private_data private_data;
 	const struct qcom_geni_device_data *dev_data;
-	struct dev_pm_domain_list *pd_list;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -1301,42 +1293,6 @@ static int geni_serial_set_rate(struct uart_port *uport, unsigned int baud)
 	return 0;
 }
 
-static int geni_serial_set_level(struct uart_port *uport, unsigned int baud)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	struct device *perf_dev = port->pd_list->pd_devs[DOMAIN_IDX_PERF];
-
-	/*
-	 * The performance protocol sets UART communication
-	 * speeds by selecting different performance levels
-	 * through the OPP framework.
-	 *
-	 * Supported perf levels for baudrates in firmware are below
-	 * +---------------------+--------------------+
-	 * |  Perf level value   |  Baudrate values   |
-	 * +---------------------+--------------------+
-	 * |      300            |      300           |
-	 * |      1200           |      1200          |
-	 * |      2400           |      2400          |
-	 * |      4800           |      4800          |
-	 * |      9600           |      9600          |
-	 * |      19200          |      19200         |
-	 * |      38400          |      38400         |
-	 * |      57600          |      57600         |
-	 * |      115200         |      115200        |
-	 * |      230400         |      230400        |
-	 * |      460800         |      460800        |
-	 * |      921600         |      921600        |
-	 * |      2000000        |      2000000       |
-	 * |      3000000        |      3000000       |
-	 * |      3200000        |      3200000       |
-	 * |      4000000        |      4000000       |
-	 * +---------------------+--------------------+
-	 */
-
-	return dev_pm_opp_set_level(perf_dev, baud);
-}
-
 static void qcom_geni_serial_set_termios(struct uart_port *uport,
 					 struct ktermios *termios,
 					 const struct ktermios *old)
@@ -1355,7 +1311,7 @@ static void qcom_geni_serial_set_termios(struct uart_port *uport,
 	/* baud rate */
 	baud = uart_get_baud_rate(uport, termios, old, 300, 8000000);
 
-	ret = port->dev_data->set_rate(uport, baud);
+	ret = geni_serial_set_rate(uport, baud);
 	if (ret)
 		return;
 
@@ -1642,27 +1598,8 @@ static int geni_serial_resources_off(struct uart_port *uport)
 	return 0;
 }
 
-static int geni_serial_resource_state(struct uart_port *uport, bool power_on)
+static int geni_serial_resource_init(struct qcom_geni_serial_port *port)
 {
-	return power_on ? geni_serial_resources_on(uport) : geni_serial_resources_off(uport);
-}
-
-static int geni_serial_pwr_init(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	int ret;
-
-	ret = dev_pm_domain_attach_list(port->se.dev,
-					&port->dev_data->pd_data, &port->pd_list);
-	if (ret <= 0)
-		return -EINVAL;
-
-	return 0;
-}
-
-static int geni_serial_resource_init(struct uart_port *uport)
-{
-	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	int ret;
 
 	port->se.clk = devm_clk_get(port->se.dev, "se");
@@ -1707,10 +1644,10 @@ static void qcom_geni_serial_pm(struct uart_port *uport,
 		old_state = UART_PM_STATE_OFF;
 
 	if (new_state == UART_PM_STATE_ON && old_state == UART_PM_STATE_OFF)
-		pm_runtime_resume_and_get(uport->dev);
+		geni_serial_resources_on(uport);
 	else if (new_state == UART_PM_STATE_OFF &&
 		 old_state == UART_PM_STATE_ON)
-		pm_runtime_put_sync(uport->dev);
+		geni_serial_resources_off(uport);
 
 }
 
@@ -1813,16 +1750,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
 
-	ret = port->dev_data->resources_init(uport);
+	ret = geni_serial_resource_init(port);
 	if (ret)
 		return ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		ret = -EINVAL;
-		goto error;
-	}
-
+	if (!res)
+		return -EINVAL;
 	uport->mapbase = res->start;
 
 	uport->rs485_config = qcom_geni_rs485_config;
@@ -1834,26 +1768,19 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (!data->console) {
 		port->rx_buf = devm_kzalloc(uport->dev,
 					    DMA_RX_BUF_SIZE, GFP_KERNEL);
-		if (!port->rx_buf) {
-			ret = -ENOMEM;
-			goto error;
-		}
+		if (!port->rx_buf)
+			return -ENOMEM;
 	}
 
 	port->name = devm_kasprintf(uport->dev, GFP_KERNEL,
 			"qcom_geni_serial_%s%d",
 			uart_console(uport) ? "console" : "uart", uport->line);
-	if (!port->name) {
-		ret = -ENOMEM;
-		goto error;
-	}
+	if (!port->name)
+		return -ENOMEM;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		goto error;
-	}
-
+	if (irq < 0)
+		return irq;
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
@@ -1875,18 +1802,16 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			IRQF_TRIGGER_HIGH, port->name, uport);
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	ret = uart_get_rs485_mode(uport);
 	if (ret)
 		return ret;
 
-	devm_pm_runtime_enable(port->se.dev);
-
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		goto error;
+		return ret;
 
 	if (port->wakeup_irq > 0) {
 		device_init_wakeup(&pdev->dev, true);
@@ -1896,15 +1821,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			device_init_wakeup(&pdev->dev, false);
 			ida_free(&port_ida, uport->line);
 			uart_remove_one_port(drv, uport);
-			goto error;
+			return ret;
 		}
 	}
 
 	return 0;
-
-error:
-	dev_pm_domain_detach_list(port->pd_list);
-	return ret;
 }
 
 static void qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1917,31 +1838,6 @@ static void qcom_geni_serial_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	ida_free(&port_ida, uport->line);
 	uart_remove_one_port(drv, &port->uport);
-	dev_pm_domain_detach_list(port->pd_list);
-}
-
-static int __maybe_unused qcom_geni_serial_runtime_suspend(struct device *dev)
-{
-	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
-	int ret = 0;
-
-	if (port->dev_data->power_state)
-		ret = port->dev_data->power_state(uport, false);
-
-	return ret;
-}
-
-static int __maybe_unused qcom_geni_serial_runtime_resume(struct device *dev)
-{
-	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
-	struct uart_port *uport = &port->uport;
-	int ret = 0;
-
-	if (port->dev_data->power_state)
-		ret = port->dev_data->power_state(uport, true);
-
-	return ret;
 }
 
 static int qcom_geni_serial_suspend(struct device *dev)
@@ -1979,46 +1875,14 @@ static int qcom_geni_serial_resume(struct device *dev)
 static const struct qcom_geni_device_data qcom_geni_console_data = {
 	.console = true,
 	.mode = GENI_SE_FIFO,
-	.resources_init = geni_serial_resource_init,
-	.set_rate = geni_serial_set_rate,
-	.power_state = geni_serial_resource_state,
 };
 
 static const struct qcom_geni_device_data qcom_geni_uart_data = {
 	.console = false,
 	.mode = GENI_SE_DMA,
-	.resources_init = geni_serial_resource_init,
-	.set_rate = geni_serial_set_rate,
-	.power_state = geni_serial_resource_state,
-};
-
-static const struct qcom_geni_device_data sa8255p_qcom_geni_console_data = {
-	.console = true,
-	.mode = GENI_SE_FIFO,
-	.pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-		.pd_names = (const char*[]) { "power", "perf" },
-		.num_pd_names = 2,
-	},
-	.resources_init = geni_serial_pwr_init,
-	.set_rate = geni_serial_set_level,
-};
-
-static const struct qcom_geni_device_data sa8255p_qcom_geni_uart_data = {
-	.console = false,
-	.mode = GENI_SE_DMA,
-	.pd_data = {
-		.pd_flags = PD_FLAG_DEV_LINK_ON,
-		.pd_names = (const char*[]) { "power", "perf" },
-		.num_pd_names = 2,
-	},
-	.resources_init = geni_serial_pwr_init,
-	.set_rate = geni_serial_set_level,
 };
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
-	SET_RUNTIME_PM_OPS(qcom_geni_serial_runtime_suspend,
-			   qcom_geni_serial_runtime_resume, NULL)
 	SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_suspend, qcom_geni_serial_resume)
 };
 
@@ -2027,18 +1891,10 @@ static const struct of_device_id qcom_geni_serial_match_table[] = {
 		.compatible = "qcom,geni-debug-uart",
 		.data = &qcom_geni_console_data,
 	},
-	{
-		.compatible = "qcom,sa8255p-geni-debug-uart",
-		.data = &sa8255p_qcom_geni_console_data,
-	},
 	{
 		.compatible = "qcom,geni-uart",
 		.data = &qcom_geni_uart_data,
 	},
-	{
-		.compatible = "qcom,sa8255p-geni-uart",
-		.data = &sa8255p_qcom_geni_uart_data,
-	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
-- 
2.48.1


