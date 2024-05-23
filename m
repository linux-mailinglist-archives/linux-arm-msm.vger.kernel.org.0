Return-Path: <linux-arm-msm+bounces-20321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1138CDDA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90C3B1C2180C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 23:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A76D1292D1;
	Thu, 23 May 2024 23:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JX8RbgWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF8128829
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 23:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716506565; cv=none; b=Z0vZhVXGoH5X4afbho6x7y8H7SSOe8F/gtdjVvlZVPzSM1x4ZB944bb930C4ZNZjbDzygmBMrmox9V2rfwnZC6Lhd4Lc8zs77Trg21WkM7A3AUMRcQJXH6TWTcHFcvBYzeaVSOWBf+XWL61h+hZOxdfyOj9O252JNb8dfXVXKPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716506565; c=relaxed/simple;
	bh=kkkhBwgehEF7n1T23cL1CwSfbc9VolDpTC3FStnSsd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TP2m90hmobIXBbiWPfIH3HGsGXWhKETwvgzaqqw11+T9cmu+oBehBOj4jy/bIXixbtAJEb3jszyLIGCfrmPVeK8qtZ0qXUwz4rpikia/1Wop3AARcBrc3SxOTJxtJsn/craWWUTZZjC8O6+ImkPzuciQmx33vr/Kzgad7ebP/es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JX8RbgWd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f3434c36baso8935425ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 16:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716506563; x=1717111363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7fuT9Y1ix7BMb1d7jsMKipipzI5RerSwpQeO523sQw=;
        b=JX8RbgWdxgUBdtuKPPGK+oZTV6ybfM+6/iCINoVkpbj2AB7vEJLyrcpyttl/WMizyq
         HSnObBpNoFvOWinAynCsp9X4sIa75bhO8WDa3TjpR9oDiuzQsQe8PZnTmSRcitX+ouAN
         D6F12LawjqfHddl07AhKumoDrL0yXS2atYQ0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716506563; x=1717111363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7fuT9Y1ix7BMb1d7jsMKipipzI5RerSwpQeO523sQw=;
        b=OeRCY5CngRJCH9XwMSNV1j9g4sh7LzS779a57AUIVApS6touXeyTKkG1qra5hcDWyK
         rIQHX8bQYDP6zJ7uGwhrkDEtSz/xIPge2t6aylEo5WfqGT1szlA6I4FLYwK/+hQvrYzs
         W+xAxDmE1q2Uw8gheghUIWriDV7jyu/EpBXiksaY2QwEGGZbMqxeeVy6CLcGhPTSlfD1
         mTY1wvGpAh2D/4CL6N/L/HEXG2ZIUoS9xf/ifmnWZkckzRJ4wPcIt4H03EWC0A9f47b7
         pRzFaKnf4aO87AvAAoseCda79N2F4l6mPxLn/7+3vWwfnqEZI4ZSFKMXODxxG2R+Jj8h
         LiKw==
X-Forwarded-Encrypted: i=1; AJvYcCUtCfEx5Iedv7t3RCh+IS9MbZFNw2Q6HdK2ROZ6Xtq1suXulp5+Cm4rNE8f6YcmNpPjH0bkO2+N0UgDTwR0TxRDYG7C085l4h/m5919Mg==
X-Gm-Message-State: AOJu0YyEKqYK4Dd1K4nvcLWL90HgiYYO2DlW+8Nyw94gF6cfRQFXMXht
	1x1YaOJyDBMVmFurvzm+rBj3dYQtzb+RL63wkcR8Dmpsb5w1Zyiz1t0jfcLMfg==
X-Google-Smtp-Source: AGHT+IGwLF6m50OvfMrgXu5OtjFWL8dtO9YTmydt+ZsukEMXxXhyqzG9PSYlm5popmEqsreBccc6Gg==
X-Received: by 2002:a17:902:c408:b0:1f3:29f1:76be with SMTP id d9443c01a7336-1f4497d8af4mr9107695ad.56.1716506562808;
        Thu, 23 May 2024 16:22:42 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b835:ba86:8e6d:41c6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c797938sm1279545ad.64.2024.05.23.16.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:22:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-msm@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Douglas Anderson <dianders@chromium.org>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 1/2] serial: port: Don't block system suspend even if bytes are left to xmit
Date: Thu, 23 May 2024 16:22:12 -0700
Message-ID: <20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240523232216.3148367-1-dianders@chromium.org>
References: <20240523232216.3148367-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently, suspend testing on sc7180-trogdor based devices has started
to sometimes fail with messages like this:

  port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
  port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
  port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
  port a88000.serial:0.0: PM: failed to suspend: error -16

I could reproduce these problem by logging in via an agetty on the
debug serial port (which was _not_ used for kernel console) and
running:
  cat /var/log/messages
...and then (via an SSH session) forcing a few suspend/resume cycles.

Tracing through the code and doing some printf debugging shows that
the -16 (-EBUSY) comes from the recently added
serial_port_runtime_suspend().

The idea of the serial_port_runtime_suspend() function is to prevent
the port from being _runtime_ suspended if it still has bytes left to
transmit. Having bytes left to transmit isn't a reason to block
_system_ suspend, though. The DEFINE_RUNTIME_DEV_PM_OPS() used by the
serial_port code means that the system suspend function will be
pm_runtime_force_suspend(). In pm_runtime_force_suspend() we can see
that before calling the runtime suspend function we'll call
pm_runtime_disable(). This should be a reliable way to detect that
we're called from system suspend and that we shouldn't look for
busyness.

Fixes: 43066e32227e ("serial: port: Don't suspend if the port is still busy")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/tty/serial/serial_port.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 91a338d3cb34..b781227cc996 100644
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -64,6 +64,16 @@ static int serial_port_runtime_suspend(struct device *dev)
 	if (port->flags & UPF_DEAD)
 		return 0;
 
+	/*
+	 * We only want to check the busyness of the port if PM Runtime is
+	 * enabled. Specifically PM Runtime will be disabled by
+	 * pm_runtime_force_suspend() during system suspend and we don't want
+	 * to block system suspend even if there is data still left to
+	 * transmit. We only want to block regulator PM Runtime transitions.
+	 */
+	if (!pm_runtime_enabled(dev))
+		return 0;
+
 	uart_port_lock_irqsave(port, &flags);
 	if (!port_dev->tx_enabled) {
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.45.1.288.g0e0cd299f1-goog


