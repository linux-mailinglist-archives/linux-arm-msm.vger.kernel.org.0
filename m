Return-Path: <linux-arm-msm+bounces-21307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D98D6569
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D3A8B2EC16
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 15:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B3074076;
	Fri, 31 May 2024 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qo8YFZO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4AB158DC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 15:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717168207; cv=none; b=KN1fd0QDLbWIZ5HSoBQRtVIUNFYIFJWXKRQpEdvyEE4l9/YgUKFMUEbp98d5Rvu8vu5nx49+bkHVpyj0aHD1nvN74iDpfn7GwjL8mrYcTFOi0NjmG4U5AFCv+xmORt7NjiUlSCPZK2peHCuWwzMdxGyfb96ujAUUU6PvvXwPl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717168207; c=relaxed/simple;
	bh=lSBTA0Qk/B4VrsMyrQ+UGHVIIpiGLtyvVy9RZsGZb6g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yg72AJdSGjib/HaKQXIl2pFW/B/cztqEcPO08ZG1V2RdRqTyvHBk4uzX7bnXwQ1aEVjIYJNSY6yCsCSpUQjs3M5SFWFxh05MWoB8uhJ3KuxNLgTDO1iqPQ5IqNQXLkaj1+ol5qdZLH0EVfRonORfGacyq4EmnuT8MKVDmWUmcAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qo8YFZO+; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7023b6d810bso1288072b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 08:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717168205; x=1717773005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0iJi0PJvFvf1CFWoWmSdo3d7YUtAaK0ClDdvyTsNzKU=;
        b=Qo8YFZO++iQjWGWvSL+TSGJuosY4EJVIKhULH7gcRYS1qgLIw0Tln30SvuJVO/9vvn
         xuogBx5tx8cFjtz2fZDBl8etHqCvPLUtC0PQjsOIyVyE+2aZozo7JxIisXS+3xrX2gNi
         PIjYjz3lSZowxBRqYXyboMiryyelB9XCpLncg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717168205; x=1717773005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0iJi0PJvFvf1CFWoWmSdo3d7YUtAaK0ClDdvyTsNzKU=;
        b=OKF/20Tdo4IHI7MZvFxsizksVSfKdPBpmkWLnuLfRIdftYO3U8nCA+8YZkAnrnt1Ax
         MLZIANaoQZ4yOYFpVezJ7azICEgU5uUgpgBKKlQR6/bMNbhngUtlC6utR1brBbzDX3N/
         0mB/4EZsg5dqSK2hxptvkqOD6SvZJ0wzHpIPCvkgnDvr3R4YaNTAbgZz+3V1TNx7TdLw
         /pcT4H3GT3lOuCSR6Bthj/4KGF6ZdHzmRl6HC+REV7yhU+aq37faYgQ+K6FAP3yUrIbg
         NcB0nUnFYenuGIw0W3VY6t88w1ATGOF9O+uYxvSgtmKVqqNOM/fU8oFC1B4syhi41mWR
         WmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGn9L52fUAgTqljHkFIZpDPWwfuiYKsIckRnJGSJK+gkv05Y/Fd3pVR6jdDfl9rZgiZL9rpD0PPZtiZuJOWsCD68oHQqLr/RtMDyN6LQ==
X-Gm-Message-State: AOJu0Ywtf1lGAF1QgQI6hmDpy4XmZZJcs1tVtiKjH8ngGk5I38qTHj+E
	Jz5fXALexuCRG4yat4h0omFRRFoLZA2tkW+dIncV6dpOgxJqqpFi5mTq5DTczw==
X-Google-Smtp-Source: AGHT+IF0dfrykqzmUvNhdjADW7h9n7zm7Vm0UiyRN3i+/5G4mCKeIjmvMB7zJv32Mh9bRCpkaz5h1A==
X-Received: by 2002:a05:6a00:1905:b0:6ec:e785:98b9 with SMTP id d2e1a72fcca58-70247899ea5mr2712668b3a.27.1717168205237;
        Fri, 31 May 2024 08:10:05 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:6c7c:c1c7:e465:4f2f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b2bfc6sm1484111b3a.193.2024.05.31.08.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 08:10:04 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	Tony Lindgren <tony.lindgren@linux.intel.com>,
	Bing Fan <tombinfan@tencent.com>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3] serial: port: Don't block system suspend even if bytes are left to xmit
Date: Fri, 31 May 2024 08:09:18 -0700
Message-ID: <20240531080914.v3.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recently, suspend testing on sc7180-trogdor based devices has started
to sometimes fail with messages like this:

  port a88000.serial:0.0: PM: calling pm_runtime_force_suspend+0x0/0xf8 @ 28934, parent: a88000.serial:0
  port a88000.serial:0.0: PM: dpm_run_callback(): pm_runtime_force_suspend+0x0/0xf8 returns -16
  port a88000.serial:0.0: PM: pm_runtime_force_suspend+0x0/0xf8 returned -16 after 33 usecs
  port a88000.serial:0.0: PM: failed to suspend: error -16

I could reproduce these problems by logging in via an agetty on the
debug serial port (which was _not_ used for kernel console) and
running:
  cat /var/log/messages
...and then (via an SSH session) forcing a few suspend/resume cycles.

Tracing through the code and doing some printf()-based debugging shows
that the -16 (-EBUSY) comes from the recently added
serial_port_runtime_suspend().

The idea of the serial_port_runtime_suspend() function is to prevent
the port from being _runtime_ suspended if it still has bytes left to
transmit. Having bytes left to transmit isn't a reason to block
_system_ suspend, though. If a serdev device in the kernel needs to
block system suspend it should block its own suspend and it can use
serdev_device_wait_until_sent() to ensure bytes are sent.

The DEFINE_RUNTIME_DEV_PM_OPS() used by the serial_port code means
that the system suspend function will be pm_runtime_force_suspend().
In pm_runtime_force_suspend() we can see that before calling the
runtime suspend function we'll call pm_runtime_disable(). This should
be a reliable way to detect that we're called from system suspend and
that we shouldn't look for busyness.

Fixes: 43066e32227e ("serial: port: Don't suspend if the port is still busy")
Cc: stable@vger.kernel.org
Reviewed-by: Tony Lindgren <tony.lindgren@linux.intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In v1 [1] this was part of a 2-patch series. I'm now just sending this
patch on its own since the Qualcomm GENI serial driver has ended up
having a whole pile of problems that are taking a while to unravel.
It makes sense to disconnect the two efforts. The core problem fixed
by this patch and the geni problems never had any dependencies anyway.

[1] https://lore.kernel.org/r/20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid/

Changes in v3:
- Adjust comment as per Tony Lindgren.
- Add Cc: stable.

Changes in v2:
- Fix "regulator" => "regular" in comment.
- Fix "PM Runtime" => "runtime PM" in comment.
- Commit messages says how serdev devices should ensure bytes xfered.

 drivers/tty/serial/serial_port.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 91a338d3cb34..d35f1d24156c 100644
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -64,6 +64,13 @@ static int serial_port_runtime_suspend(struct device *dev)
 	if (port->flags & UPF_DEAD)
 		return 0;
 
+	/*
+	 * Nothing to do on pm_runtime_force_suspend(), see
+	 * DEFINE_RUNTIME_DEV_PM_OPS.
+	 */
+	if (!pm_runtime_enabled(dev))
+		return 0;
+
 	uart_port_lock_irqsave(port, &flags);
 	if (!port_dev->tx_enabled) {
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.45.1.288.g0e0cd299f1-goog


