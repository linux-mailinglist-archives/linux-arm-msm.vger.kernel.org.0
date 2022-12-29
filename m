Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF01658E90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 16:51:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233526AbiL2Pvn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 10:51:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbiL2Puu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 10:50:50 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842BFF0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:45 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id g25-20020a7bc4d9000000b003d97c8d4941so7943394wmk.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKmGeFAtCyk6wBb7MKS50ERYhoSBE5l1Jj0s77qCt2Y=;
        b=qnqdNb4kxb1jxs1Spj/pvbWBW66ZYoSxr6UxXULQWtfkOqAV51A+ul4xRGmbCBYx3F
         75Jo/Kq6YKjb8ax4Y+mB9hJdRfPoDXrl/MQUruQnz6XdeyMPOKl3tLF0NcMwPODcnYLc
         zhnEmbuSPfq1svTG/yEm69tkznGpVk3F1WvLi4lknvoxNArcUYEOCXgNc9MhXo5tyXRr
         xkhkSLwUJODNH0CBp2+hD5IrvCqUeRlECBRc3Tijj+JXPQbexfX4ZP2mILJrKN+kRRhA
         D7zpAqASHqdRD0eh6JuZmRhIFrxMm7TaBrbVg5I66wqjfFnXXvP5hUhHN4pFc0JyZN04
         E4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKmGeFAtCyk6wBb7MKS50ERYhoSBE5l1Jj0s77qCt2Y=;
        b=t7V/WPs8w1olfNJuK00KptbmkLyLUYk3jvmZLTrPwvG0ud/h0E4kMWYUTqoaYYpQYI
         PjAiTfbaPtJ/Hm3iO1WSB0z+UP/RvMrhqH9iRFxRHP8VuC318TfXZes2N5GZS4t0mhVn
         /b9YsT1CCoQPwQeV79SNqCNIIv5Rnh59v411fdEjFK97Fy3AhtUbsHF0GbAXVKF6G048
         w7oS9CUEtwG/GpnUYZcyXb1ng0zHPBJz5uUq5qoTnn61qSp8IDG9fTP8+lTj5l8UZ0DL
         bAllu/lzRwkZ0K3r44qp30N7gd+TDtOZJTHVu3B/x+IWW6ex61+Q1j6/EOw4JF3BDCIY
         9Eqw==
X-Gm-Message-State: AFqh2koiPLHxRmwMdfLtSF60hXQJW5JvgT2XmWuKjNn3FMBIpERWfecA
        zXLpS37BW2+q6DyN6FLKpY0ZUQ==
X-Google-Smtp-Source: AMrXdXtQRjHIeu0CRFLWb7kAQQMmQafohWQiZ+H9Q682c3hewHyO6M7UsBf0Fa8pxhZ++QBR8N8lUg==
X-Received: by 2002:a1c:6a14:0:b0:3d1:f302:1975 with SMTP id f20-20020a1c6a14000000b003d1f3021975mr20473918wmc.33.1672329044677;
        Thu, 29 Dec 2022 07:50:44 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8f7a:98d8:9d8d:ced8])
        by smtp.gmail.com with ESMTPSA id bh12-20020a05600c3d0c00b003cfa81e2eb4sm25251647wmb.38.2022.12.29.07.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 07:50:44 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v6 11/14] tty: serial: qcom-geni-serial: drop the return value from handle_rx
Date:   Thu, 29 Dec 2022 16:50:27 +0100
Message-Id: <20221229155030.418800-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221229155030.418800-1-brgl@bgdev.pl>
References: <20221229155030.418800-1-brgl@bgdev.pl>
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

The return value of the handle_rx() callback is never checked. Drop it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3705c0f893a4..6daa3e205fc9 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -114,7 +114,7 @@ struct qcom_geni_serial_port {
 	u32 tx_fifo_width;
 	u32 rx_fifo_depth;
 	bool setup;
-	int (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
+	void (*handle_rx)(struct uart_port *uport, u32 bytes, bool drop);
 	unsigned int baud;
 	void *rx_fifo;
 	u32 loopback;
@@ -502,7 +502,7 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 		spin_unlock_irqrestore(&uport->lock, flags);
 }
 
-static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 {
 	u32 i;
 	unsigned char buf[sizeof(u32)];
@@ -537,16 +537,15 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 	}
 	if (!drop)
 		tty_flip_buffer_push(tport);
-	return 0;
 }
 #else
-static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 {
-	return -EPERM;
+
 }
 #endif /* CONFIG_SERIAL_QCOM_GENI_CONSOLE */
 
-static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 {
 	struct tty_port *tport;
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
@@ -557,7 +556,7 @@ static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 	tport = &uport->state->port;
 	ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, port->rx_fifo, words);
 	if (drop)
-		return 0;
+		return;
 
 	ret = tty_insert_flip_string(tport, port->rx_fifo, bytes);
 	if (ret != bytes) {
@@ -567,7 +566,6 @@ static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 	}
 	uport->icount.rx += ret;
 	tty_flip_buffer_push(tport);
-	return ret;
 }
 
 static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
-- 
2.37.2

