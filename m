Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277A9635B1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 12:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236261AbiKWLJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 06:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237611AbiKWLId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 06:08:33 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BAD9B3BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:13 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id d1so16732896wrs.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 03:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27Y/3dF94+Cm6VsgYrXb3WffaYznVRIrRKIsZki0OWQ=;
        b=Cc3DMUi1+c91wbdCi+9yhbPRKydM/WD64VcFUqJSe/t+SDR0m8l26JNYNHPgO+3QxH
         0i52QRdKTKqJfUxlWqlVcx+GDxMnF09QUpCHZK3OOYYn6JK5DOZWhFbgcb9Aez6ruY73
         OwTp59On3Wv2c/b6bg/BB5e5RU6tRNy3yyvc4pVzyMBj35P80IhBaUBFeAYSJebUGBLs
         q4I8wtVjpQgeNRas7D7KX2A2o+jgu0cX89ItAZ0sCKHYFx0jpJNKunr3HlqHz+PAJwhQ
         jzC1mmkSC/XD/BSChddqxSlVbox2M80YP6L0RvwGC29dzQ5zonGnsAsczpPI+05L2r5e
         kneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Y/3dF94+Cm6VsgYrXb3WffaYznVRIrRKIsZki0OWQ=;
        b=Tw9yVLjK0WfMCFG0Y69XBUPT/VwnOcnLr7K6o4fwLlIZzKs0tLxti1M/Q4727kSBNC
         kBfeslXx/Vup/XHOsC/j9K9qekXCgU+aH7vAQskrWtOsJvsOOLc3Mdg09MgMCcen2Jc8
         1TlvfPEY8bEWxPjqBFCb+G/GVTtOaCuDK/4eX9f34GiI9X8Oyivkzdo4GwMhVgV4GLFa
         e2oDnQycuPoDl1eR875GJRuJwd+lmUUSvnnpRmUvikLfzauZNLb+NXwLPMm3pA2F1vX1
         cF/PSUZnYHr0WFAIKW1uzrnqvH1DkPNkPV74MTDUNK1zmSSBqoiW+c8DgN1uDljZjh47
         E5/w==
X-Gm-Message-State: ANoB5pkssU9LkDmfkfW/zjBHlidrZL4ms1I8SAV6BIvyQp3bjNdfk2XT
        JKeV+KgI0IBfpm3axKfRiGAq1Q==
X-Google-Smtp-Source: AA0mqf5jiktsdjzoCnzBe1yObbtRtHVkH9qehnPnM5ylifQ7wq2tJJ5oK1rONcdcM+svuz8jWl6LSA==
X-Received: by 2002:adf:f3d0:0:b0:241:f721:3ba2 with SMTP id g16-20020adff3d0000000b00241f7213ba2mr399710wrp.681.1669201693316;
        Wed, 23 Nov 2022 03:08:13 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ae74:d94f:4677:3378])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003c6c182bef9sm2560406wmq.36.2022.11.23.03.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 03:08:12 -0800 (PST)
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
Subject: [PATCH v3 09/13] tty: serial: qcom-geni-serial: drop the return value from handle_rx
Date:   Wed, 23 Nov 2022 12:07:55 +0100
Message-Id: <20221123110759.1836666-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221123110759.1836666-1-brgl@bgdev.pl>
References: <20221123110759.1836666-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
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
index 658b6d596f58..d5c343b06c23 100644
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

