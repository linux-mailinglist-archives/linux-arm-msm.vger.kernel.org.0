Return-Path: <linux-arm-msm+bounces-21163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D448D55B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B7581C23DCB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A64187355;
	Thu, 30 May 2024 22:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FcoSSNVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCC7187343
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109192; cv=none; b=edK4VE7fwenGoZqc4j8NnG96lQG9+7Lx7mdBGjsJ02pCBvf4872gjRnmWDY1ObVOk6TdKZ92cBk4fxXM6nPjWO3rUKas12fmyqJzTY+piitQosqUf9ymxpfWc/MSsRwtmCpuFOxbhihsLjaUVlv0SMscAGU6kKxC1LXtOxzXfog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109192; c=relaxed/simple;
	bh=78gYEUyzyaFfiXbdVxUAmTlMq0HG762eI0EiZRG8OIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VAi99D1Qylx97eMmqd7agFin3UmyqUB/s547N+g+fzjuMALFTsdxxVm+TevfJklfcOSspVI6udLKUqep1E1OsWUHfYuK0+zrU/rh8GUIhDr9QhpCyO4GjnCexxEu7lhtOCyVUejS1YLGykZpIuNE6FTI0COVIdrXylaVp1oeIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FcoSSNVy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f48e9414e9so12800995ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109190; x=1717713990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOWbb9qbkvOEUGdLBBAENqDT3ts5Zzk0WB4O6/YZK90=;
        b=FcoSSNVyr/CNq5JAJp0AcMlLHPUxBJsp538WTxDjHyo/z9WnYDhbhua40P5xFyE86Z
         fRCv58heDyuuMrjnyAa4uo6Hf3vAfL3nsEnbJdEHGgVrebjGd/FOTPsy68idyvgIG56F
         Jc1Q9ObCFAkC7dy2AcXk48YZIEtEBytYQOtVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109190; x=1717713990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOWbb9qbkvOEUGdLBBAENqDT3ts5Zzk0WB4O6/YZK90=;
        b=YMJPVT4N/eehxyW/eEz03OkgH0PIJHcmSmls/28FY/eHoHqGDP0HabBD469JC4QMM3
         GRhCn0Dqe/FDJkwlA7m1zSvXWzrHWdW2T5jW0YvBhh1/JoWPKxvgSzQjc0jIu66XmyGL
         nYDYriiQSJrtSnqP5hxqynB1UdvHvYgrmNI3qWv1clY2lv5M/Yuh66EX+ngWOyyE7hCm
         hPcmMrAxvPUIQrNDHpqRDx3dXKSV764Lv6+zBRnVH76wPc2JZoNbXlDJsn00eCUTtMEM
         dLvMnQODhr915zN9/SJkPoukvDETZL3q2BfvjAtHuinupPUsKV2y8U7AKZPBCTnKl+Vj
         8kmg==
X-Gm-Message-State: AOJu0YyskQDx8YhqMPQU4n+1ubwMoAt418GJG3VBR0Wnn0pv8Nntmarz
	84nHrzry46GeSvcvecFAp1sqdZBlmbDe16UA2w9Nd/a5o3deqPbuD+CcfNNx0w==
X-Google-Smtp-Source: AGHT+IFKS0W6dOoGfNolcljOTmURsU8XJDFLlm8UaKsYnhx17kA5MKtjML0iYvJa38VzjuZeAIT9vA==
X-Received: by 2002:a17:902:e544:b0:1f4:5dea:f3a1 with SMTP id d9443c01a7336-1f635a99418mr3524095ad.34.1717109190113;
        Thu, 30 May 2024 15:46:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-serial@vger.kernel.org,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 5/7] serial: qcom-geni: Just set the watermark level once
Date: Thu, 30 May 2024 15:45:57 -0700
Message-ID: <20240530154553.v2.5.Ie02dcdf46089457026de3bd665c08f0210711966@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530224603.730042-1-dianders@chromium.org>
References: <20240530224603.730042-1-dianders@chromium.org>
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

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 539a6ac85511..d7814f9e5c26 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -418,7 +418,6 @@ static int qcom_geni_serial_get_char(struct uart_port *uport)
 static void qcom_geni_serial_poll_put_char(struct uart_port *uport,
 							unsigned char c)
 {
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_setup_tx(uport, 1);
 	WARN_ON(!qcom_geni_serial_poll_bit(uport, SE_GENI_M_IRQ_STATUS,
 						M_TX_FIFO_WATERMARK_EN, true));
@@ -462,7 +461,6 @@ __qcom_geni_serial_console_write(struct uart_port *uport, const char *s,
 			bytes_to_send++;
 	}
 
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_setup_tx(uport, bytes_to_send);
 	for (i = 0; i < count; ) {
 		size_t chars_to_write = 0;
@@ -690,7 +688,6 @@ static void qcom_geni_serial_start_tx_fifo(struct uart_port *uport)
 	irq_en = readl(uport->membase +	SE_GENI_M_IRQ_EN);
 	irq_en |= M_TX_FIFO_WATERMARK_EN | M_CMD_DONE_EN;
 
-	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase +	SE_GENI_M_IRQ_EN);
 }
 
@@ -701,7 +698,6 @@ static void qcom_geni_serial_stop_tx_fifo(struct uart_port *uport)
 
 	irq_en = readl(uport->membase + SE_GENI_M_IRQ_EN);
 	irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
-	writel(0, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	writel(irq_en, uport->membase + SE_GENI_M_IRQ_EN);
 	/* Possible stop tx is called multiple times. */
 	if (!qcom_geni_serial_main_active(uport))
@@ -1153,6 +1149,7 @@ static int qcom_geni_serial_port_setup(struct uart_port *uport)
 			       false, true, true);
 	geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
 	geni_se_select_mode(&port->se, port->dev_data->mode);
+	writel(DEF_TX_WM, uport->membase + SE_GENI_TX_WATERMARK_REG);
 	qcom_geni_serial_start_rx(uport);
 	port->setup = true;
 
-- 
2.45.1.288.g0e0cd299f1-goog


