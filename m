Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F59635B2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbiKWLJh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbiKWLId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:33 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE469B6C
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:14 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z4so14261205wrr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npWHp37Z5aqJft0VcgEPQBxH0XaK5lUmiP+By6Idpv0=;
        b=p5qE2jgb2LOAm20iEZm7s3ykUED/tYXYc3k13raCuZX0DelZXEOCyr/PRW0AoMv0Y8
         sucY5CNWUKtDcQenxcPkDcL8iYQxl3qjZwq1eo1o5Tlg8lloFIVh/VlAaqeGxuwmJ1C+
         Oq60FkB0BD5Eg55H3qwjlzchz47elJPRNsZdYXToGuQfZXz9QJ+FmNUaoSir5ifYZaJn
         g5xvR2leVI3vadEDjLatUsif0ZnNYcz6qTz+4yUYiV4R8Pr78A9MEBj8hmzCjbjoMbDY
         RPQUN5k5ATMpPlfbDOHFFmdjpktjmWBVyBIFJa03raoUVtB1kE8COOcyZtigbPoIIaHl
         lEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npWHp37Z5aqJft0VcgEPQBxH0XaK5lUmiP+By6Idpv0=;
        b=tbc/qlXk2VCW19zc/K5iZxeKNVYOKRSum1ALgJXzGT5IiW+/EobdA+0EWBsUQn2LBg
         qfsnU6m6SsZbagzvz/p/1UFfbyN2CsY0+fQuJRPw3l5CUUmFDa0hQ9TKstjiXutVQyh+
         Uv18NCBJ4N4rYPirhFXYTmJWbBcwJ+bPE1SvEdSvPdBk/eiuqWW9hXhGuOPJiSPNJLzB
         BRHCYC3m5f/d2Iwhr05Y785FMrkFJaJDqeGCnPorfs0zOxW0438WkmzoGx9SY8YxYAuM
         uCf4OvP/At14G5/cmljU6GjlQ8y9kyQ5EFc+xu9NbKH6zw6RnikOB2cCTq2tFZzm5+/O
         hYoQ==
X-Gm-Message-State: ANoB5pnXzBTerIg1fgzpMeExkmbwzZio1rP4/+YTXzu+12whJYr1COFp
        BXkC3hJ7oK08XYkfd9Z3S0dM+g==
X-Google-Smtp-Source: AA0mqf5+3ezzPBMAFpVFdbfhYu+i06gkthJsnhn9lLI/1aFi9z1z0nuriRqpp5wVr3jSB8gmuMm0lg==
X-Received: by 2002:adf:ea0b:0:b0:236:695b:6275 with SMTP id q11-20020adfea0b000000b00236695b6275mr17368695wrm.116.1669201694233;
        Wed, 23 Nov 2022 03:08:14 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:13 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 10/13] tty: serial: qcom-geni-serial: use of_device_id data
Date:   Wed, 23 Nov 2022 12:07:56 +0100
Message-Id: <20221123110759.1836666-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221123110759.1836666-1-brgl@bgdev.pl>
References: <20221123110759.1836666-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Instead of checking the device compatible in probe(), assign the
device-specific data to struct of_device_id. We'll use it later when
providing SE DMA support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 46 ++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index d5c343b06c23..036231106321 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -95,6 +95,11 @@
 /* We always configure 4 bytes per FIFO word */
 #define BYTES_PER_FIFO_WORD		4
 
+struct qcom_geni_device_data {
+	bool console;
+	void (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
+};
+
 struct qcom_geni_private_data {
 	/* NOTE: earlycon port will have NULL here */
 	struct uart_driver *drv;
@@ -114,7 +119,6 @@ struct qcom_geni_serial_port {
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
 	bool setup;
-	void (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
 	unsigned int baud;
 	void *rx_fifo;
 	u32 loopback;
@@ -126,6 +130,7 @@ struct qcom_geni_serial_port {
 	bool cts_rts_swap;
 
 	struct qcom_geni_private_data private_data;
+	const struct qcom_geni_device_data *dev_data;
 };
 
 static const struct uart_ops qcom_geni_console_pops;
@@ -640,7 +645,7 @@ static void qcom_geni_serial_handle_rx(struct uart_port *uport, bool drop)
 		total_bytes += last_word_byte_cnt;
 	else
 		total_bytes += BYTES_PER_FIFO_WORD;
-	port->handle_rx(uport, total_bytes, drop);
+	port->dev_data->handle_rx(uport, total_bytes, drop);
 }
 
 static void qcom_geni_serial_stop_rx(struct uart_port *uport)
@@ -1345,13 +1350,14 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	struct uart_port *uport;
 	struct resource *res;
 	int irq;
-	bool console = false;
 	struct uart_driver *drv;
+	const struct qcom_geni_device_data *data;
 
-	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
-		console = true;
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -EINVAL;
 
-	if (console) {
+	if (data->console) {
 		drv = &qcom_geni_console_driver;
 		line = of_alias_get_id(pdev->dev.of_node, "serial");
 	} else {
@@ -1361,7 +1367,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 			line = of_alias_get_id(pdev->dev.of_node, "hsuart");
 	}
 
-	port = get_port_from_line(line, console);
+	port = get_port_from_line(line, data->console);
 	if (IS_ERR(port)) {
 		dev_err(&pdev->dev, "Invalid line %d\n", line);
 		return PTR_ERR(port);
@@ -1373,6 +1379,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	uport->dev = &pdev->dev;
+	port->dev_data = data;
 	port->se.dev = &pdev->dev;
 	port->se.wrapper = dev_get_drvdata(pdev->dev.parent);
 	port->se.clk = devm_clk_get(&pdev->dev, "se");
@@ -1391,7 +1398,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->rx_fifo_depth = DEF_FIFO_DEPTH_WORDS;
 	port->tx_fifo_width = DEF_FIFO_WIDTH_BITS;
 
-	if (!console) {
+	if (!data->console) {
 		port->rx_fifo = devm_kcalloc(uport->dev,
 			port->rx_fifo_depth, sizeof(u32), GFP_KERNEL);
 		if (!port->rx_fifo)
@@ -1421,7 +1428,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	uport->irq = irq;
 	uport->has_sysrq = IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
 
-	if (!console)
+	if (!data->console)
 		port->wakeup_irq = platform_get_irq_optional(pdev, 1);
 
 	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
@@ -1443,7 +1450,6 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	port->private_data.drv = drv;
 	uport->private_data = &port->private_data;
 	platform_set_drvdata(pdev, port);
-	port->handle_rx = console ? handle_rx_console : handle_rx_uart;
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
@@ -1523,14 +1529,30 @@ static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 	return ret;
 }
 
+static const struct qcom_geni_device_data qcom_geni_console_data = {
+	.console = true,
+	.handle_rx = handle_rx_console,
+};
+
+static const struct qcom_geni_device_data qcom_geni_uart_data = {
+	.console = false,
+	.handle_rx = handle_rx_uart,
+};
+
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(qcom_geni_serial_sys_suspend,
 					qcom_geni_serial_sys_resume)
 };
 
 static const struct of_device_id qcom_geni_serial_match_table[] = {
-	{ .compatible = "qcom,geni-debug-uart", },
-	{ .compatible = "qcom,geni-uart", },
+	{
+		.compatible = "qcom,geni-debug-uart",
+		.data = &qcom_geni_console_data,
+	},
+	{
+		.compatible = "qcom,geni-uart",
+		.data = &qcom_geni_uart_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_geni_serial_match_table);
-- 
2.37.2

