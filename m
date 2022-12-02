Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B20D6402A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiLBI5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:57:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiLBI42 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:56:28 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3782C056B
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:56:06 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso3706855wms.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at8CWDblZ4WCi9Y1OeAGaa4YOdEtlxTYBw/Cs3tSYBA=;
        b=G2Yb/sc7ahqc+jrJKB8b6M95ZGrp/Xaa0rbBWpp8mdfHoRlyHfxUh3VOTbv705mEry
         vov4YPUdl8oFiMnlnNC4EHKkNslHxSnc+i7A6bLKDiPMTmN4BDuRl+Dy6ZjlHCwmAa2+
         UzNB99ScvlaFoYbiN+vBHEAEVDV6QZeHOhzaDmBUMZyObl24hVZpUd7VQ01iPf2Hl4/a
         cu5mmcW7KmNAt26cADHwq4l7hwCACO8Hrn/4aEcXTLX60ZU3u1ZoOWOPhhXjl3pndIcr
         ckMxTv3LyY1E6HTusyZyntp1/Mi/bKlG58D0GGV3vfdI9jlNuTQO5WFIIPHnpPe+zuge
         xQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=at8CWDblZ4WCi9Y1OeAGaa4YOdEtlxTYBw/Cs3tSYBA=;
        b=Yfv4u/5VgJBF7mvpl9Fx9itNRi2nGQdSFGXA4dmiqhDnTukYUR3pggzJHGB+GqZIKH
         4VgnWqJpjMT+EoH+wt7gGoiwNTv3zUK6V9kNfiuEXwsSq6xWlndfKLemBCB1Egz64lZj
         dwQJz5fAxIYKZKGebq+1jrXVRTG5jVfSdjeoaKu2bGl7j1qWlW1YsqoE1y8b2Trfvdht
         vhePn14JYhDdC3Y04fMm+IYR4UCheYuFmaZo7kAgzMwFgdw/c01uowjZqltTUV3eQLsx
         UaeeMGzLRzRWeZdMhuTC0KoXUx8TfMqTb6cRhggMjCkn1tppapfzT8qQ0dpHxQ6JKNCv
         Xc+Q==
X-Gm-Message-State: ANoB5plGxcJzLDzdXNbKxlP8V1Dsb2fswK7OYJ4m1zBACWkJHiE0GCel
        sf5p0Kx5noihiS2kFL49oO5Zhw==
X-Google-Smtp-Source: AA0mqf5YOHDP3k7FOdOIMbfX/1dFPul0NoVTQaFdE2DpkopDIgrHQ0NzXnU0CpB60zJip6OEqB3JGA==
X-Received: by 2002:a05:600c:198a:b0:3b4:8603:e2ae with SMTP id t10-20020a05600c198a00b003b48603e2aemr42014201wmq.148.1669971366174;
        Fri, 02 Dec 2022 00:56:06 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:29a4:6f04:ddb1:1ed7])
        by smtp.gmail.com with ESMTPSA id a13-20020adfed0d000000b0024219b1cb1bsm6527517wro.60.2022.12.02.00.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 00:56:05 -0800 (PST)
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
Subject: [PATCH v5 09/14] tty: serial: qcom-geni-serial: refactor qcom_geni_serial_send_chunk_fifo()
Date:   Fri,  2 Dec 2022 09:55:49 +0100
Message-Id: <20221202085554.59637-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221202085554.59637-1-brgl@bgdev.pl>
References: <20221202085554.59637-1-brgl@bgdev.pl>
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

Shuffle the code a bit, drop unneeded variables, make types of others
more consistent and use uart_xmit_advance() instead of handling
tail->xmit manually.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/tty/serial/qcom_geni_serial.c | 28 ++++++++++-----------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 91336d2d20fc..40daf58eb1e7 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -93,7 +93,7 @@
 #define IO_MACRO_IO2_IO3_SWAP		0x4640
 
 /* We always configure 4 bytes per FIFO word */
-#define BYTES_PER_FIFO_WORD		4
+#define BYTES_PER_FIFO_WORD		4U
 
 struct qcom_geni_private_data {
 	/* NOTE: earlycon port will have NULL here */
@@ -704,36 +704,28 @@ static void qcom_geni_serial_start_rx(struct uart_port *uport)
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 }
 
-static int qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
-					    unsigned int chunk)
+static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
+					     unsigned int chunk)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
 	struct circ_buf *xmit = &uport->state->xmit;
-	size_t remaining = chunk;
-	int i, tail = xmit->tail;
-
-	for (i = 0; i < chunk; ) {
-		unsigned int tx_bytes;
-		u8 buf[sizeof(u32)];
-		int c;
+	unsigned int tx_bytes, c, remaining = chunk;
+	u8 buf[BYTES_PER_FIFO_WORD];
 
+	while (remaining) {
 		memset(buf, 0, sizeof(buf));
-		tx_bytes = min_t(size_t, remaining, BYTES_PER_FIFO_WORD);
+		tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
 
 		for (c = 0; c < tx_bytes ; c++) {
-			buf[c] = xmit->buf[tail++];
-			tail &= UART_XMIT_SIZE - 1;
+			buf[c] = xmit->buf[xmit->tail];
+			uart_xmit_advance(uport, 1);
 		}
 
 		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
 
-		i += tx_bytes;
-		uport->icount.tx += tx_bytes;
 		remaining -= tx_bytes;
 		port->tx_remaining -= tx_bytes;
 	}
-
-	return tail;
 }
 
 static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
@@ -778,7 +770,7 @@ static void qcom_geni_serial_handle_tx(struct uart_port *uport, bool done,
 					uport->membase + SE_GENI_M_IRQ_EN);
 	}
 
-	xmit->tail = qcom_geni_serial_send_chunk_fifo(uport, chunk);
+	qcom_geni_serial_send_chunk_fifo(uport, chunk);
 
 	/*
 	 * The tx fifo watermark is level triggered and latched. Though we had
-- 
2.37.2

