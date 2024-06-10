Return-Path: <linux-arm-msm+bounces-22227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB83902B9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 784A3B2230E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2644C153569;
	Mon, 10 Jun 2024 22:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SwC2UyqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525E152E05
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058356; cv=none; b=dSvFfi1a8Sv+/AUHq5AENulCXWNw+qEacc266SHPsGmPOtcIhiC+LyqALn5TSVu8w8XgmB2Ps4Tecwb2szMlLs8S2HuaO/QFybxKHTd62QHxu3hwxryI9oEVYDCA43ExpTQqfWSGTFnN7goXuDWNeFnttAjCKOansPZbKJ3KLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058356; c=relaxed/simple;
	bh=T5OLyywzVlFurET65GWs4Use8AE33uLe7yuCTL9LXoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY+sOk3q9hKWpBArvjD61Rqg4/hGgdm1eD4YEFlnic4srfpRWO89QZslaeqNT4AtnlkSjPooXHvKhzmzj6rAek8mCr9zw5uGC0SAzRxf9eOt22V6Mst7q84aMke/SHw7Mk/2u6TSTFIHEMNMciWMeDFmFJPe+0/5VxOfUdHUap0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SwC2UyqD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f717ee193fso3135125ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058353; x=1718663153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqognB14Qp/8L0cEa0xbpDxiXXZEj4JiNnjscQN0iLs=;
        b=SwC2UyqDeg1+AETILJREvwHFV/hRFhSC24cbCJmnaizVaHgnPDOBW6ieyYD3INYtGl
         kCD8fAN92bYH4qxDyE0tN5jR+6phTe9jWtKxvFPzzwrW/FwUtTC22oQNN8+fzehkv1YX
         /LNFX6a4Oc00wbGEobjuN0EuOZqUulsuman00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058353; x=1718663153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqognB14Qp/8L0cEa0xbpDxiXXZEj4JiNnjscQN0iLs=;
        b=lTebn5zuSebs3mK3hBSlScKW374zsdPqaeJYnVfh2d4SFXSBXv7x5bNrjtANCtzulo
         9O6+USzH2QzVfkAws30M4h9nhjCQqHzr6dfVePWYQ00x6EISFg+02EOuOdSwYcA/PIe0
         HKTXyBSXmt4x68X9qcGY4y9g/9GJwKq7jgBQ9PemwUqQ7Sb0hgKCJTEoRQJlHGGqmVup
         AXUhO2Wli6lZrgAJH5LU6MqxX2FMCHMAePR8LWhKbZ1vss/r6IfLjklcm4fjgAijufU7
         5/NHsK7Cg8G3ffAoxYbYNfaeWWILJq5F9V89cLlyu8c7sndJ2MYb9OOcvkBg6n9sCvn5
         bBpA==
X-Forwarded-Encrypted: i=1; AJvYcCUpSz88uqzlJ2KMdc+TeE8jbNXv5x5B3gV5DoXKeJGJDzMkfAGZKCyeqpueob/6tR7vW7BVaVTinfTjC/TWF96swaBYn7p2U7WV+9JXPA==
X-Gm-Message-State: AOJu0YzbF63Rxx4BDBMvH2FA6WVDQ3/4A8nD0TkdGloO6Ek823oXXsbB
	42hJrTZwaQN5X6B5CnP0wyeoGi9QwUqP91xNxlZtXJInsTKX8XQJvm7Q1nm1hQ==
X-Google-Smtp-Source: AGHT+IGRD5vE34alDO+sziMhlcJdI1lhwO848ApwoqxHcu+WdfFnr8XzF2Vq5NcxF2woJmJFfRkAAw==
X-Received: by 2002:a17:902:d4ce:b0:1f6:3721:bca with SMTP id d9443c01a7336-1f6d02db91emr149922465ad.15.1718058352746;
        Mon, 10 Jun 2024 15:25:52 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:bba2:69f4:1b51:d0f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71029e223sm29212325ad.170.2024.06.10.15.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:25:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>,
	Tony Lindgren <tony@atomide.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 6/8] serial: qcom-geni: Just set the watermark level once
Date: Mon, 10 Jun 2024 15:24:24 -0700
Message-ID: <20240610152420.v4.6.Ie02dcdf46089457026de3bd665c08f0210711966@changeid>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240610222515.3023730-1-dianders@chromium.org>
References: <20240610222515.3023730-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no reason to set the TX watermark level to 0 when we disable
TX since we're disabling the interrupt anyway. Just set the watermark
level once at init time and leave it alone.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index bd03b998ed04..132669a2da34 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -391,7 +391,6 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_setup_tx(uport, 1);
 	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true));
@@ -435,7 +434,6 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 			bytes_to_send++;
 	}
 
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_setup_tx(uport, bytes_to_send);
 	for (i = 0; i < count; ) {
 		size_t chars_to_write = 0;
@@ -663,7 +661,6 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
 	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
 
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
 
@@ -674,7 +671,6 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 
 	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
-	writel(0, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 	/* Possible stop tx is called multiple times. */
 	if (!qcom_geni_serial_main_active(uport))
@@ -1126,6 +1122,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
+	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
-- 
2.45.2.505.gda0bf45e8d-goog


