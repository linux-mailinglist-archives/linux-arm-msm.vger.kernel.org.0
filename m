Return-Path: <linux-arm-msm+bounces-20320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 739828CDDA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 01:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACF41F22526
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 23:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490C91292C2;
	Thu, 23 May 2024 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TttDrzA4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871E128362
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 23:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716506564; cv=none; b=RROigFT8v33uDc+ec9xbUw5+vGCsK/WFjRlJ74Vuf3XQ6gXqhLF+pj1JrH4CiOhFITjaVfEnkD33h0OX6xV4rmWwOa0l6lUKGd+EtsMSx20GMkjcQqPv1Lat3mwiNAOP/i6XSDrwHnLAptEov2Gt4yrGmlDlDfJ8VlMu1Ghxzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716506564; c=relaxed/simple;
	bh=rgPr4Ngu722SRDj2ZtjbrxVxv2puo2dZm2D+9CkatPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Hl6/Jwwq89yyJcHKB5ubtaB4u0KHUMWNeCDZLkLJpWypCmxJv7ObSs/43RR287hXzJn/vJPOp2oQhabkAoNSOm5FumMGKuZhnqlBopH5FdWVPKAO6bh0u8GjrZxzBhuo8kOBjRd9fpklknwnY5nNidcyyhgJZsNorsyJfNlBsSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TttDrzA4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f3421564d2so8222495ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716506561; x=1717111361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfP9vIEmS390P3O4iAtZjeM8HWFzEOcH0/2SUf3/Hok=;
        b=TttDrzA4qnK/uWrFshTTPAVszxLlkHAJ5wbe4kgITRdvWR/nkEXrJsLEcEQw7On3/t
         wDD8A+GalWqEFGeEcJVTZtMiTEZQKvxPxrbN0Tu5i1XuHGZyQ4gkUC9GYb2sQxyPcbVx
         WwtM5wwMViUyTnhfzAuyhYOLcKjj6EKviLaUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716506561; x=1717111361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfP9vIEmS390P3O4iAtZjeM8HWFzEOcH0/2SUf3/Hok=;
        b=eTdTIPLPmRGqfyoRHT3wxERJfvRFi/d2Ap1SBZXjj4UH7IfzJ/IJ1YXpAsAB48mNwN
         N59koNuNtReR3lrIWlfFPRJh+6WZnuuKMfDrvqVW33bRobDyhx134gePbNSdxFkc1Y4l
         FS6rXNnKk82x1zU4uiUmlz2cJUMESJ+yBRf86rJ+HCp3dZs+JUK5sRaTCkGuJdPv8OcJ
         DwwaUZV6HuyTTnxskvY7RUMVlj4uNLuZx7MaWSyZgSNZF1GXzCeB9P/woE96pisKUyCZ
         s78q6fFompNmPDqO4JAfL/14wZI95ud0jc2f8dptkqB9x186OVTWZF6DxigPG45KV7El
         bDkw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8f4xZyxHvYvWy/RKMOxRtnbSFEoC2mnLFEzJQGO3zcurJv/H5cHuihlew0ntzznZFBElg65ks1TEuCdxfGz6UuyhLoN82byzjSNB3g==
X-Gm-Message-State: AOJu0YyHoOQHP1nRCP8LPi+I8bykhE/5y3K0YO3g4HvFiCxgxQOwNR7J
	wlg1HxDuSaphkcy79KVYThcN0FnGUAP9pEEtkSNCuIrmpyK/UI4W4/FehT4Psg==
X-Google-Smtp-Source: AGHT+IGv12M53lM+GUULtAWysbxmBRhEDbBtm/AXwGQlH56IEyIRCa/lNDP8GHgZxm6j/t23nijr+Q==
X-Received: by 2002:a17:902:d58c:b0:1f2:fcc0:66f with SMTP id d9443c01a7336-1f448248a0emr11751435ad.31.1716506560961;
        Thu, 23 May 2024 16:22:40 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:b835:ba86:8e6d:41c6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c797938sm1279545ad.64.2024.05.23.16.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 16:22:40 -0700 (PDT)
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
	James Clark <james.clark@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 0/2] serial: Fix problems when serial transfer is happening at suspend time
Date: Thu, 23 May 2024 16:22:11 -0700
Message-ID: <20240523232216.3148367-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This is a set of two patches that fix problems related to suspending
while a serial transfer is going on. The two patches are independent
from each other and can land in any order. The only thing tying them
together is that I used the same test to reproduce both of them.
Specifically, I could reproduce my problemes by logging in via an
agetty on the debug serial port (which was _not_ used for kernel
console) and running:
  cat /var/log/messages
...and then (via an SSH session) forcing a few suspend/resume cycles.

The first patch solves a problem that is probably more major. It was
introduced recently and has even shown up in stable trees.
Suspend/resume testing in ChromeOS test labs are hitting the problem
fixed by this patch. The fix hasn't been tested in labs, but when I
reproduced the problem locally I could see that the fix worked. IMO it
should land ASAP.

The second patch fixes an ancient problem that I only found because I
was trying to reproduce the first problem. Given how long it's been
around it's probably not urgent but it would be nice to get fixed.


Douglas Anderson (2):
  serial: port: Don't block system suspend even if bytes are left to
    xmit
  serial: qcom-geni: Fix qcom_geni_serial_stop_tx_fifo() while xfer

 drivers/tty/serial/qcom_geni_serial.c | 45 +++++++++++++++++++++++++--
 drivers/tty/serial/serial_port.c      | 10 ++++++
 2 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.45.1.288.g0e0cd299f1-goog


