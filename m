Return-Path: <linux-arm-msm+bounces-21160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EC8D55AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 00:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 886992857AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A445B186298;
	Thu, 30 May 2024 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="agkvG0CQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289AC18413D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 22:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717109186; cv=none; b=ceNxo+VU0xebkU691SLcZWbBzfkzXvmxAozYVFbulrIrx7+bZNKhmaomhtxLvkCAMUPR5vPT0ITZLHmCUIMhV7yaxwemCwZgkRIddPOVlNZv696Ae4F8hyKt5lZcKb4uMhMUOHmCVZ6FiQ/gtvjYAGvnFDLbq+sxueyzokAVRJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717109186; c=relaxed/simple;
	bh=JvGABUZ3Lt4FbHnmcWkDhqUbvee4GNMb1KzXw/oRPI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtiswZpSIbLLK9NFxiKlq3ZrPOdP0Tr5x4CC5Tkj3q9bppKZYOtu6/ub4iXz0+LyUB/+C+6M17qBRey8empMBDNpZksK4GACX+VotI0m7ZyI8OlvW8TO0WpykyRKCYx0WjsiZ46QvcbtZXVuc+yjrGmDaHnTGiq9ufhwJGOdB3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=agkvG0CQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f4a52b9413so11998775ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717109183; x=1717713983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f20bdelRQYxHx7q0JQ7q316V8FZx4HSKVjsqLajTHlA=;
        b=agkvG0CQvH/xM6sHMoGrbd/ki/U26GOTJ3AKsCHfUdymFYIFDFDcDbZg6/fY84IbKY
         peT4pniORTdFMpl2weLehZYLI6uZzFlA3u8Zkk7Es82EIQWde4fZ94EzmgHbrtmPI/ir
         ofKn5ftqb4Chg6pIRaP0pnvedL0xdWlbTFfvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717109183; x=1717713983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f20bdelRQYxHx7q0JQ7q316V8FZx4HSKVjsqLajTHlA=;
        b=BjtB1ooybXUy8Q9eo5L3kC54XGjW0Ic3YXLM0c5vyf0GYtAU7rVnUvb/Ek35JbeIyM
         xG6u2ggJTOFLtSpWFFAJz5Kmnda7Sdpp8kYiMkY8/2J45KtsiUk+fCl1OIuxb1SMegBh
         mXWURxP1+BDXNF6kyJlXY6q8+OXrVn+giIN9UIppfxsmVd5m3NmRfQrO8eKnH8Tcfwrp
         k2spicu5zGjGbBqBxJPe9B0is4HE5+brbtp7isQvy2NG+yiQzdbbmoaK4Hb0RQsxlJEH
         7JDQWUVknyNmkGpKg9wN2VU1qkwj9mgnD7yx7PMoUNkBEDHw18ypgxkJkotVIwYaByCU
         Vzmg==
X-Gm-Message-State: AOJu0YybxEFCZmxlHZArtN7yDM38hXkhRzsGkr1iU+PmQiqeVWuu7T8v
	jn55o19rtuPoSamo/hJ+CFexJehjXLg3HAGjioa4TH9wwae9v1ciTL5mCPiawA==
X-Google-Smtp-Source: AGHT+IGfax+l05lNl2UskJFXZtLTKIlUrnNHoGYAkrAQP1LpkIfI7gvGX9NbqfAhSBtevCUZYN2+lg==
X-Received: by 2002:a17:903:22c1:b0:1f6:1778:7f1b with SMTP id d9443c01a7336-1f636fd9d3dmr2188115ad.1.1717109183463;
        Thu, 30 May 2024 15:46:23 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632410b20sm2955795ad.273.2024.05.30.15.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 15:46:22 -0700 (PDT)
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
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v2 2/7] serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
Date: Thu, 30 May 2024 15:45:54 -0700
Message-ID: <20240530154553.v2.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid>
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

The qcom_geni_serial_poll_bit() is supposed to be able to be used to
poll a bit that's will become set when a TX transfer finishes. Because
of this it tries to set its timeout based on how long the UART will
take to shift out all of the queued bytes. There are two problems
here:
1. There appears to be a hidden extra word on the firmware side which
   is the word that the firmware has already taken out of the FIFO and
   is currently shifting out. We need to account for this.
2. The timeout calculation was assuming that it would only need 8 bits
   on the wire to shift out 1 byte. This isn't true. Typically 10 bits
   are used (8 data bits, 1 start and 1 stop bit), but as much as 13
   bits could be used (14 if we allowed 9 bits per byte, which we
   don't).

The too-short timeout was seen causing problems in a future patch
which more properly waited for bytes to transfer out of the UART
before cancelling.

Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 32 ++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 2bd25afe0d92..32e025705f99 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -271,7 +271,8 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	u32 reg;
 	struct qcom_geni_serial_port *port;
 	unsigned int baud;
-	unsigned int fifo_bits;
+	unsigned int max_queued_bytes;
+	unsigned int max_queued_bits;
 	unsigned long timeout_us = 20000;
 	struct qcom_geni_private_data *private_data = uport->private_data;
 
@@ -280,12 +281,37 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 		baud = port->baud;
 		if (!baud)
 			baud = 115200;
-		fifo_bits = port->tx_fifo_depth * port->tx_fifo_width;
+
+		/*
+		 * Add 1 to tx_fifo_depth to account for the hidden register
+		 * on the firmware side that can hold a word.
+		 */
+		max_queued_bytes =
+			DIV_ROUND_UP((port->tx_fifo_depth + 1) * port->tx_fifo_width,
+				     BITS_PER_BYTE);
+
+		/*
+		 * The maximum number of bits per byte on the wire is 13 from:
+		 * - 1 start bit
+		 * - 8 data bits
+		 * - 1 parity bit
+		 * - 3 stop bits
+		 *
+		 * While we could try count the actual bits per byte based on
+		 * the port configuration, this is a rough timeout anyway so
+		 * using the max is fine.
+		 */
+		max_queued_bits = max_queued_bytes * 13;
+
 		/*
 		 * Total polling iterations based on FIFO worth of bytes to be
 		 * sent at current baud. Add a little fluff to the wait.
+		 *
+		 * NOTE: this assumes that flow control isn't used, but with
+		 * flow control we could wait indefinitely and that wouldn't
+		 * be OK.
 		 */
-		timeout_us = ((fifo_bits * USEC_PER_SEC) / baud) + 500;
+		timeout_us = ((max_queued_bits * USEC_PER_SEC) / baud) + 500;
 	}
 
 	/*
-- 
2.45.1.288.g0e0cd299f1-goog


