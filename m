Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4B016402AA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbiLBI5R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232852AbiLBI43 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:29 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F06BBEC78
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:06 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id h12so6734716wrv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9KBlEE4azsWDdEqHoIw3zf1p218z3Yb8Z5E0IDcw8M=;
        b=SkUvqcIAd73kDG42S6QB6U76WvXAzT/BOgDjn10hVqfNl12MhimRk/M1zOxlQZs477
         gqQlU4L+UDnx94Z8r+153WErEZDY6kPYaj8r12w+JSkFdHulDnoOCnFwEru0Hwa6ddlf
         DazhVeJimLSunp4EVMYe7N48+yRfBdW+4iLi+1O7S8leBwAdYeYLCVJlcgltc11z7Po6
         uPBuADvmfidd8+BknjDWreVMz6I1XvpIoTgB5RM9S35qsSNiWJiILmwxTOrTuIqZNEw5
         A6Vf7fmE8IiaF+D9pbCEGsM/6yUQIpRycclDsaDRyfLnYiPjhZZ8m98ydP5fmImtNJEV
         MTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9KBlEE4azsWDdEqHoIw3zf1p218z3Yb8Z5E0IDcw8M=;
        b=UMc2510ty5Nyp8UW8ocdnWN/3YTBSxIh4uDxexyPT5NeTPWcx/3YV0ZZkTMBQaS4x5
         5UdObf5IQOrNrSX32UOmpF5eHq4gHHVsGq61THXYb6UVqn4tCAAgjMdDvuPkDMBBDfTh
         SQHO674cKNbFFvnC1eLKMY2wnnhy5/PjlD+BSoPKbADnKLorUIGat+IyGvRUzUnr20GL
         98bco73bsQeORbaxGUIfN9IPzNntxlHd6p6VQ4gpdCu9wu8+eJHBq3T8vLL+JdFeuE9N
         M43teY1QXtvV4svOeSLtHI/tdffPiDjPDqIw38+a8ODGK9dswhsHbTACiD78fE4ilc5j
         Vkaw==
X-Gm-Message-State: ANoB5pnM5QJoRdBIQhC81nfRupwQ/+xW4nS08DlJsXqaLSnCfGCYMTrB
        LTR3S1F8l84Lk4ZChCCjBr7t1A==
X-Google-Smtp-Source: AA0mqf5b5ms65cPJXa1FoxhdEHJjBXpIj4wTipcyyNx37CsRn0kmBt/StwmPIy2w70s+JS7jPeUPbA==
X-Received: by 2002:a5d:4149:0:b0:242:149c:5690 with SMTP id c9-20020a5d4149000000b00242149c5690mr15384879wrq.491.1669971365264;
        Fri, 02 Dec 2022 00:56:05 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:04 -0800 (PST)
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
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 08/14] tty: serial: qcom-geni-serial: split out the FIFO tx code
Date:   Fri,  2 Dec 2022 09:55:48 +0100
Message-Id: <20221202085554.59637-9-brgl@bgdev.pl>
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

qcom_geni_serial_handle_tx() is pretty big, let's move the code that
handles the actual writing of data to a separate function which makes
sense in preparation for introducing a dma variant of handle_tx().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 60 +++++++++++++++------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 68a1402fbe58..91336d2d20fc 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -704,19 +704,48 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 }
 
+static int qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
+					    unsigned int chunk)
+{
+	struct qcom_geni_serial_port *port = to_dev_port(uport);
+	struct circ_buf *xmit = &uport->state->xmit;
+	size_t remaining = chunk;
+	int i, tail = xmit->tail;
+
+	for (i = 0; i < chunk; ) {
+		unsigned int tx_bytes;
+		u8 buf[sizeof(u32)];
+		int c;
+
+		memset(buf, 0, sizeof(buf));
+		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
+
+		for (c = 0; c < tx_bytes ; c++) {
+			buf[c] = xmit->buf[tail++];
+			tail &= UART_XMIT_SIZE - 1;
+		}
+
+		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
+
+		i += tx_bytes;
+		uport->icount.tx += tx_bytes;
+		remaining -= tx_bytes;
+		port->tx_remaining -= tx_bytes;
+	}
+
+	return tail;
+}
+
 static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 		bool active)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct circ_buf *xmit = &uport->state->xmit;
 	size_t avail;
-	size_t remaining;
 	size_t pending;
-	int i;
 	u32 status;
 	u32 irq_en;
 	unsigned int chunk;
-	int tail;
 
 	status = readl(uport->membase + SE_GENI_TX_FIFO_STATUS);
 
@@ -735,7 +764,6 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 	avail = port->tx_fifo_depth - (status & TX_FIFO_WC);
 	avail *= BYTES_PER_FIFO_WORD;
 
-	tail = xmit->tail;
 	chunk = min(avail, pending);
 	if (!chunk)
 		goto out_write_wakeup;
@@ -750,29 +778,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 					uport->membase + SE_GENI_M_IRQ_EN);
 	}
 
-	remaining = chunk;
-	for (i = 0; i < chunk; ) {
-		unsigned int tx_bytes;
-		u8 buf[sizeof(u32)];
-		int c;
-
-		memset(buf, 0, sizeof(buf));
-		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
-
-		for (c = 0; c < tx_bytes ; c++) {
-			buf[c] = xmit->buf[tail++];
-			tail &= UART_XMIT_SIZE - 1;
-		}
-
-		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
-
-		i += tx_bytes;
-		uport->icount.tx += tx_bytes;
-		remaining -= tx_bytes;
-		port->tx_remaining -= tx_bytes;
-	}
-
-	xmit->tail = tail;
+	xmit->tail = qcom_geni_serial_send_chunk_fifo(uport, chunk);
 
 	/*
 	 * The tx fifo watermark is level triggered and latched. Though we had
-- 
2.37.2

