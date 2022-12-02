Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5B06402AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiLBI5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232736AbiLBI4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:53 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCB5BF652
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:08 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u12so5816415wrr.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qH7b7fe8Hb5qheb3lmn+qvXpc5CyEBL9hWh3RvxG08=;
        b=wXhd4niCBjGs5r0Ayxt/b8cwpV0OG2fC/nCckzvY8jM+sm33VcJKPONwn5yuFJ3bqd
         y8GbjNGH3oNnwm6HI1S8PX04EZsWQ8clRBcCaAK7W43BRUPVrjfn0/zjdnEQB+dpaswU
         HE7thOq8HJhpo79FYC78di7vrx15tEm0KxRXJexhgTfNVZsxCIukAQMy+vNE8sNRLIiM
         nUbp1Ek8uf+DKngCLrrXPLduVCRAtR+Q6csQt/LCCZkUjzQW0HmcpcCXjUj38nipHtq+
         RWtMjzQq9/XHzrV9xdftjkGoikdlDLVD2dmEGEo8pB3fEZXxH3dd7h2CcbU9PupAtxEz
         TEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1qH7b7fe8Hb5qheb3lmn+qvXpc5CyEBL9hWh3RvxG08=;
        b=DLTeVFtEyorF5xHUFH5snov49FlYv/36xM38cA2ASPYVnbf8/0L5znhR0EuYXB4ge/
         +629VpzRIrebiTqUIUQHWgcFKY2eLlCXTLG53Mb4YLgtnAikmKqwXV07WVUx/+zRBfFK
         1aXUxKlTo7MFHFC8MVg6C3pJSrrtfRdi47ywSTg+OdVx2tQADDZP+jzDHILAmYaNR0+h
         Qip3zQe0/dFy/nOneiRNk0DvOAcEPXmHuSGbpndZya0WPTddFUlBdRCXdl7VHTH3Mtmk
         EDaN5k9a6scAwTIQXD5VdWvK86kc1j1/L9Tjjty5WRTGvYnAxbsEqe0nLDfkUijnlIFc
         OBmw==
X-Gm-Message-State: ANoB5pmsaot8+wcBtp1CTB7BdNIug2EFM6qREsVGKno0aKDobBY2vCo8
        00wI5985Fsq2+KMFKYaFrZ7WgQ==
X-Google-Smtp-Source: AA0mqf4Fm3Z/7IMCc8A0/E/F8iXmDDmRENvVNvcb2ouLKhPXWXRTHB3SRXkJcJXsCd0yag4xRqjN4w==
X-Received: by 2002:a05:6000:142:b0:242:49d9:9d8f with SMTP id r2-20020a056000014200b0024249d99d8fmr494642wrx.446.1669971367165;
        Fri, 02 Dec 2022 00:56:07 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:06 -0800 (PST)
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
Subject: [PATCH v5 10/14] tty: serial: qcom-geni-serial: drop the return value from handle_rx
Date:   Fri,  2 Dec 2022 09:55:50 +0100
Message-Id: <20221202085554.59637-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221202085554.59637-1-brgl@bgdev.pl>
References: <20221202085554.59637-1-brgl@bgdev.pl>
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
index 40daf58eb1e7..163310107263 100644
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

