Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 669D462F499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 13:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235268AbiKRM0l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 07:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241793AbiKRM03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 07:26:29 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E5B976FE
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:11 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a14so9049286wru.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 04:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pF1K9Osvm2bfxV7B3KPTmbXBc6bO2Z5qPB/LIZda4KU=;
        b=CxzI5e9N5IVV6UCsvmfkxAyhT/XdAotthqZtvueaQdC/kcNGJNscZX+6tGcAM4V6Pe
         EAhGgvhwvKRispf0xbrhrVd3lWFN8luWYVNjQ33vNr/niFWXQ0vdS4SGgjAp37f0goIY
         3h1A/JAIJH9o46Sfq4OoIcTZCzWJ7or2/TjzXCWh7I0wLqFfw8JQQhwTpqbIBlhRT8mW
         lyHA6uue5Kvf3hlOZW7hSn1zgP7ZHq0dQCeFAl4OCxkLm6RhbpGWhZZ5J0+Crm8PlA5J
         8luF2weu1CWp8n0yyZ/n/5tSas/gLib7hteSOR7EEtfTUw77XE2GtH6HMnjj4dnourDh
         RxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pF1K9Osvm2bfxV7B3KPTmbXBc6bO2Z5qPB/LIZda4KU=;
        b=JuzIC7C8fxjyM7Jx5fZCIih/Op0f2z4ZG1KSiMLnP6THTDRKFWRg0bXgFt4ybXfxaq
         F75L701Lg+mvmov3BjDW5qpaesHxgl/E5lMPgftHInlIlBKREVBgTT1P8lLeFTewEoXm
         hBDV2FY4YmV3+FUSJ5/hXXJ/2668QTaSiQ/mYsSNYQY++FQmwx1VkjIXq6kuUHWK+o8U
         AoWEYz8vGHwjyC1ZC4Kj/T673M0xb8gpLsJHq4eunR7IFfQ4IUM73SWAa/Y63Xe3CQOZ
         cUoOheiFFF7R7KoctmLx2zrv+oNOGLlOO4Gj9042Iq8KicY3qZYTDPLpHR3q2zKHKQNu
         w2NQ==
X-Gm-Message-State: ANoB5pn1ev1vryQVmkXOvvcRAxKjF1K63mGwwI4qa1YWsJkTsHdWPR86
        nwyEAQ1gZrSVvWK1KsF1Ph8KHQ==
X-Google-Smtp-Source: AA0mqf62NToJtguB/effj1ssvAbUmdtDlXIOSFaU/pbCO/XUA3+Wm0tCpH6C0v/sBB6nX0Gt77n5Lw==
X-Received: by 2002:adf:f6cb:0:b0:236:7a11:b061 with SMTP id y11-20020adff6cb000000b002367a11b061mr4394865wrp.292.1668774370893;
        Fri, 18 Nov 2022 04:26:10 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b10c:1279:a704:75d4])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm9873958wmg.46.2022.11.18.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:26:10 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 09/15] tty: serial: qcom-geni-serial: drop the return value from handle_rx
Date:   Fri, 18 Nov 2022 13:25:33 +0100
Message-Id: <20221118122539.384993-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118122539.384993-1-brgl@bgdev.pl>
References: <20221118122539.384993-1-brgl@bgdev.pl>
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
---
 drivers/tty/serial/qcom_geni_serial.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 4b155ca0ac74..72d0e7b91080 100644
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
@@ -499,7 +499,7 @@ static void qcom_geni_serial_console_write(struct console *co, const char *s,
 		spin_unlock_irqrestore(&uport->lock, flags);
 }
 
-static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
+static void handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
 {
 	u32 i;
 	unsigned char buf[sizeof(u32)];
@@ -534,16 +534,15 @@ static int handle_rx_console(struct uart_port *uport, u32 bytes, bool drop)
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
@@ -554,7 +553,7 @@ static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 	tport = &uport->state->port;
 	ioread32_rep(uport->membase + SE_GENI_RX_FIFOn, port->rx_fifo, words);
 	if (drop)
-		return 0;
+		return;
 
 	ret = tty_insert_flip_string(tport, port->rx_fifo, bytes);
 	if (ret != bytes) {
@@ -564,7 +563,6 @@ static int handle_rx_uart(struct uart_port *uport, u32 bytes, bool drop)
 	}
 	uport->icount.rx += ret;
 	tty_flip_buffer_push(tport);
-	return ret;
 }
 
 static unsigned int qcom_geni_serial_tx_empty(struct uart_port *uport)
-- 
2.37.2

