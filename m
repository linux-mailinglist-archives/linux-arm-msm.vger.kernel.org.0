Return-Path: <linux-arm-msm+bounces-22226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA9D902B96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BB71F2302A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846F91527BF;
	Mon, 10 Jun 2024 22:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R/iJd/+V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7901527A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058352; cv=none; b=Xnf8xpTMXzKay/dZKCu3rO1BNWuC/7OB+Znlpu3Q0jMsi4yFVvp6b8LSsVeYOhuXzZbUIEnWadoaJuAsaxBfAaqfa9ezgw7jdHdB4f8qfach59X7MH8zrIgMBGkzJ0uDZ2qPHks18v+z6A9sdhKnC7EE+MtIpcX7Xehm2zK64qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058352; c=relaxed/simple;
	bh=Vz9TKpxXaJUlf8hvN5Wqa/7wPSCv1FZBm1VFSvSSE8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5xhyPEElIKPe5cn7t4OMxumx/sW95oBsu4+3IUbQl5KPiyzEaSGQMBmioowYkHFcAWNdVKTWc8E8YhVbEl8a4PWRQYgbdsSp5kFm0wY6LF6VSdjtUgBOpn0E23cV1JOLnRBvyBPYMZ5/eNEFQHmFp6J4ltKlhyxHeK13cqLI44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R/iJd/+V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6cdf9a16229so3698296a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058350; x=1718663150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSTUD4Ocrb2gEGomy7xAcQdY/lBQY+IJMt+9e60LLYI=;
        b=R/iJd/+V4lGi8cWA2GXBSe7IyiPuuSCH/bAbe6TcWiSRdroDcFX0mVMSqG+To4W+uN
         JCyJ/xX+IUyEI75ZVMGdKCa21suBaTqYOgxelbg1GESYfB+2hPIMwyqQstaiqTtz3lRo
         5carxT1mvbOMl0DggOgWT/XCPLyprO7RX3ELA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058350; x=1718663150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSTUD4Ocrb2gEGomy7xAcQdY/lBQY+IJMt+9e60LLYI=;
        b=HeSzG28iXDJc4WpNyt0e03ET23729Fe0cqKAmRGWbt69YEiXiAChl3wa+4wx7gicLc
         EOln2kc5oxGO/0+zx506hwBLIg8WRiwXmqlDEzcjzH0dS5TA1b17DT4oyy+6169250Kh
         Eflh0MLHKHFEs5IjHl0o8wxjm2bgvmHEUK11+0HeFXuF0/NbKVCLa7aMyAJFU6oPaDmR
         o6U1OnBK7zhv8hAeHu+rPM7+di02P1hFy5smK0mKPYhR8/feldZthc6QyZKG9n5aI8sI
         ThFRKR442rfmzvHaeKHNVzqx0ozmFmtbihLLnM+TGF0tEwH1GOYv/AWwSEjbF8IsHDzX
         niYA==
X-Forwarded-Encrypted: i=1; AJvYcCWgOkmzqKp6D+UMejGenQX39uO0W7WI3DbkmVXiJGc9SUnTx0YZT8OkpTESRt5+PLBG/MKM6Qf79ADD5j57v1APzNmLExI8B2x8/J2alg==
X-Gm-Message-State: AOJu0YyryNYU++Xp13uW7ybBQMLeacyzH5SHTN3h2Vt1YhL22SFfK+LJ
	WAODX0UbjxWecLr7gB4FGOpi2HNC6j1RPC0n/VxOs3OflkQ4grz6LqmoC5rUgQ==
X-Google-Smtp-Source: AGHT+IHqIr8vpRYc4uwmzpno3iUSS3wJCJ9L8/7MUrxcgwNdr5ZSOTxy7x+jFDss8DeytLWBFbynFg==
X-Received: by 2002:a17:902:c406:b0:1f6:7212:75f0 with SMTP id d9443c01a7336-1f6d02e234emr130658925ad.17.1718058350584;
        Mon, 10 Jun 2024 15:25:50 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:bba2:69f4:1b51:d0f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71029e223sm29212325ad.170.2024.06.10.15.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 15:25:49 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Subject: [PATCH v4 5/8] serial: qcom-geni: Introduce qcom_geni_serial_poll_bitfield()
Date: Mon, 10 Jun 2024 15:24:23 -0700
Message-ID: <20240610152420.v4.5.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid>
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

With a small modification the qcom_geni_serial_poll_bit() function
could be used to poll more than just a single bit. Let's generalize
it. We'll make the qcom_geni_serial_poll_bit() into just a wrapper of
the general function.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The new function isn't used yet (except by the wrapper) but will be
used in a future change.

(no changes since v2)

Changes in v2:
- New

 drivers/tty/serial/qcom_geni_serial.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index db933a1549ad..bd03b998ed04 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -264,8 +264,8 @@ static bool qcom_geni_serial_secondary_active(struct uart_port *uport)
 	return readl(uport->membase + SE_GENI_STATUS) & S_GENI_CMD_ACTIVE;
 }
 
-static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
-				      unsigned int offset, u32 field, bool set)
+static bool qcom_geni_serial_poll_bitfield(struct uart_port *uport,
+					   unsigned int offset, u32 field, u32 val)
 {
 	u32 reg;
 	unsigned long timeout_us;
@@ -294,7 +294,7 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	 */
 	while (timeout_us) {
 		reg = readl(uport->membase + offset);
-		if ((bool)(reg & field) == set)
+		if ((reg & field) == val)
 			return true;
 		udelay(10);
 		timeout_us -= 10;
@@ -302,6 +302,12 @@ static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
 	return false;
 }
 
+static bool qcom_geni_serial_poll_bit(struct uart_port *uport,
+				      unsigned int offset, u32 field, bool set)
+{
+	return qcom_geni_serial_poll_bitfield(uport, offset, field, set ? field : 0);
+}
+
 static void qcom_geni_serial_setup_tx(struct uart_port *uport, u32 xmit_size)
 {
 	u32 m_cmd;
-- 
2.45.2.505.gda0bf45e8d-goog


