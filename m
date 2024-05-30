Return-Path: <linux-arm-msm+bounces-21134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B88D4F66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07BA3282220
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 15:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F1DB1CD2C;
	Thu, 30 May 2024 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VYWHc88Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CEE1F94C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 15:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717084148; cv=none; b=GS5Tbz9K6ejaEyeC193m7D1vO9uXQuP/AB4WVwzDCd0y+njyG395gTA9eqd1mVfMrmSbIgEcikeCNXSyHpV9D7m8VzERZpLYtcjyU8la7orj6wOjKTRPphGyYZ1TsGgJvqV/TVWIML3ofhPwTfHuopJfFwUJWZ90t3IXF019je8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717084148; c=relaxed/simple;
	bh=V496EBsN/8sDzK0xPf/lafp2vL/Y6Qrr0P9nD/nTSvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lq/FbPe5idZfDhTAcf2xRsQzvmoHagPxNTlqgxdPNYzowzsG+58SprCcfFo8TbH13niIXo57XsfdcRO8W8eY1G3bzG40rWAYbB3VBclZvV8Y0Pt4a5Z/2QAQlEDJNFmobL7AqAdh1UFfxNkKyoYpPMtsZLZaTReHIlpcFUv2gEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VYWHc88Y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f62fae8c1aso1099465ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 08:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717084146; x=1717688946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KrjPSd85eM16lzQd2l+Jx3zs8iJGA94JtJTphdKIu1w=;
        b=VYWHc88YFhmzlWLphmiLx3Ty+2A/zi11zvAjO73Zim25Zt+Ngg3aDwj8S4uvXKJlqI
         9uTokSnAN2NNMIi0OCl5LBR6mlHi1N49O8+IiWOvq8Kxjp4RraInXDnequjqZmm8Xmfy
         hgb0/XdeGxj4VTZuvOwMrweNZJDpY53a0ByUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717084146; x=1717688946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KrjPSd85eM16lzQd2l+Jx3zs8iJGA94JtJTphdKIu1w=;
        b=VBqmk5ra517UvsP6ZX18ihw/CrLUtywTDXZaDv8IBIRhNIKDQ5k7/+AiB+yBY01W/t
         c98+E2d0cGopDQwnbTIInnKWwbEvA/YJ6qf3nXgDGv/aJNllx/8Q9t4zOpukk8K33hPj
         RZFWecAFKA3VD6WYqUl54HROCu6sUlzyzcScLtSQYjck1rDCvQEv5P1Q3urHCoJC++H2
         4uue21QaEiPAmCYwwjTCuOHD6GTBx9e6Qb/VyvIFtLh/xT29PxoJtfIfnN5s7Y0aeF4U
         j6aiO2HqN5Pat9CYyniOPjQTrLmk/vLOl4NLWTRtHHF+gsspNnrEsl1pLRtvhKc+nrf/
         /ODA==
X-Forwarded-Encrypted: i=1; AJvYcCXn23W8k02vmcOOa1lOgLMLcrFK4fWLlEn1qAakIml+ueMrcn3kHhNTeGw//zBw7BRXv6GJxz2uwiyYshrQVB6l2/5WVmbtk+xxoINt5Q==
X-Gm-Message-State: AOJu0YzrX5mnKP4Ncrd0hNrxHzvssSfZsBdZIyCfB1SxjTOTnuA8YIAp
	395a6Urz5rWW1pY7zWYzdAjCqCF5CrMF0yt7vesKnujGamgFmoeCYDo/3VPRDg==
X-Google-Smtp-Source: AGHT+IGn2tzzPa7fMTUghoHMSFR9I59iuxYacjgwwItgbhIUyfqhgbSLtvHe2FUJBmr5tdAjh0x3OQ==
X-Received: by 2002:a17:902:d512:b0:1f3:1200:ceb3 with SMTP id d9443c01a7336-1f619b2cd29mr28968425ad.51.1717084146231;
        Thu, 30 May 2024 08:49:06 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:564b:72b6:4827:cf6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c994a66sm120156915ad.182.2024.05.30.08.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 08:49:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	linux-arm-msm@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Douglas Anderson <dianders@chromium.org>,
	Guanbing Huang <albanhuang@tencent.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2] serial: port: Don't block system suspend even if bytes are left to xmit
Date: Thu, 30 May 2024 08:48:46 -0700
Message-ID: <20240530084841.v2.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid>
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
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
In v1 [1] this was part of a 2-patch series. I'm now just sending this
patch on its own since the Qualcomm GENI serial driver has ended up
having a whole pile of problems that are taking a while to unravel.
It makes sense to disconnect the two efforts. The core problem fixed
by this patch and the geni problems never had any dependencies anyway.

[1] https://lore.kernel.org/r/20240523162207.1.I2395e66cf70c6e67d774c56943825c289b9c13e4@changeid/

Changes in v2:
- Fix "regulator" => "regular" in comment.
- Fix "PM Runtime" => "runtime PM" in comment.
- Commit messages says how serdev devices should ensure bytes xfered.

 drivers/tty/serial/serial_port.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/tty/serial/serial_port.c b/drivers/tty/serial/serial_port.c
index 91a338d3cb34..93ca94426162 100644
--- a/drivers/tty/serial/serial_port.c
+++ b/drivers/tty/serial/serial_port.c
@@ -64,6 +64,16 @@ static int serial_port_runtime_suspend(struct device *dev)
 	if (port->flags & UPF_DEAD)
 		return 0;
 
+	/*
+	 * We only want to check the busyness of the port if runtime PM is
+	 * enabled. Specifically runtime PM will be disabled by
+	 * pm_runtime_force_suspend() during system suspend and we don't want
+	 * to block system suspend even if there is data still left to
+	 * transmit. We only want to block regular runtime PM transitions.
+	 */
+	if (!pm_runtime_enabled(dev))
+		return 0;
+
 	uart_port_lock_irqsave(port, &flags);
 	if (!port_dev->tx_enabled) {
 		uart_port_unlock_irqrestore(port, flags);
-- 
2.45.1.288.g0e0cd299f1-goog


