Return-Path: <linux-arm-msm+bounces-82069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B53C63668
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 11:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8586F351110
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 09:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824BA320CB5;
	Mon, 17 Nov 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OlcSFWHn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E9E327783
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763373298; cv=none; b=e3Q3A/dYd64daoTLeeQS+Eycfjqz5G2gT1czELGuTwJiY1kFkCgm30SVkyhPoCKDxFW/PgF9pmfwRZwjtYzlj5wz9q2iHSv/0u3ES1x3AIXQMfMDN8lIejc/JS1Y0Q8wBqQlmRbs+QLwbGjaAF+m1n/TW+bLML1GNVeyKvBxyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763373298; c=relaxed/simple;
	bh=Y8IzrJFPXEJ2OuufostQBEvuvuOKU3pbm8KlsDXPLP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pvpt/4BEInUfKxmqwrLYopeh7ooDMXvujGuYh15+woBNoPTYQKKhgwRQcRxJh0UC3SAm+BGPNHH1XfQawXc1xBCV4v99W3tsNHcsomOcvQWmigKVfjB4GcOMq+TS4ahY7TQHPJ1a+KqsmyJftYzv/5AF4Nut5tX2CeisEVP7N1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OlcSFWHn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477549b3082so33464825e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 01:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763373293; x=1763978093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQakO2W4jxxWZ2irP7gAZmr+hAQ7O/Ov4z2X+DwzoWo=;
        b=OlcSFWHnw7jonSImb/lr8ZQGaqwW5wqHmTXHl/3pTnbKq0GSIxsHa4UQyf+aYAUyEz
         rWMmIHEB1nRU9nrs/EEYevLk2eFI70Lhcm5NvEb0V9uhDoZbh5btQHyWm+B2MGqgiR/d
         WO4QpMDWg6bG+TbuHIh1cd//iK39BlJJoXL0LTOhSNK+OBdwqGudrT2ci2ZhY0I83Ctd
         B4LR8ml0juRryKEaeoTb69epBRDkdznea1gGMfcOQbfzhPjEfKTP0pDwFUo8jaualMSF
         kWMFs7G+kCiD0tzDhAM5M62fIAB9bd8Fcd0HBFUyQkREyK1/wPVzkS6GYD0E1RikP83C
         XcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763373293; x=1763978093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQakO2W4jxxWZ2irP7gAZmr+hAQ7O/Ov4z2X+DwzoWo=;
        b=MxPnGdrFCVICAz0Vo0qtV3GG9u5yxe4I5LzmEypOx9zKzDfWMw3XLYNLOls1dOjXvk
         539vLi7GxgEgYWAF6TaPva7f6etO6JRcgacl694/Qie+EAjP8Vh4fRZh1SovoL16MIKB
         xApmYD8NW3UfY5eKZsbFN13egQey1oAwImRExl4O8FRKiX9bn69+Qm7tEvITiwR2OJmD
         SGd/GxInxqMJsienvV1jAgV0+LoQGWdiGeHvyU/GI52r1XyG3nLE7KYstJJBsa6iM58a
         djOvmZCgn6WVtBfEbn4fTww0Wotf7BVQNTS6sjyA/XL+beoqRKAYBDkeVvUGGkgLwhuK
         Aplw==
X-Forwarded-Encrypted: i=1; AJvYcCUsNf8V+lvNB7k1moURfFRflLfAC04FHAzWBV4+3JdKu5oV6HWQqFJUfKD62p9gY9YJGoweOS/YJ/PwBQPv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8roql34hSM6r6sBvxTgcVGu5e4894wmW9moLgONBy1aR7B0ck
	esyMAxXtAvcpB5Yyk8wuCMwYBxKNiG8mqT1jAs1dLbWmsbX2IGckHQulaCzOOrK/W1U=
X-Gm-Gg: ASbGncuegzTcz+D0vKzF2oyLdAXnzeapR655VZcrzImSTwipPGd4R/bb5wzVkrzVOlg
	ovA/yFm4CTpsrkeL0Zksh2/+B/zhNz9o/KYvyDjSctyOmGbQxpq56/NZwOT7w18tDj7rkYLNjrR
	CmB7YzPmeZGOZrKdSC4FzbYYpSQGcLeRWxeoJOI5TgUAMYhiYSBboQ1Af5+R5UEKsxCwJEQD1eO
	goQvXD4wS8gjDa8GX79ZgoQBJ3wYsW8QIU7TyGB0CVHgvzkuMQa/cjfc+YwuPnznYkqwoGsSJ+Y
	hkgfdJ8kwxHkrdJbd8aa+I67TpmfFfjOeZZ6fOHsuuSc24z2NltCO2epP2xI5LFfG6gY/HxbbI5
	jTkcnBuLy+LNqeztuaJL7WjdxFt/AGHa8Y2ie4Pww1n9S8694JawTEekxD9xma3slu2S+8LERDB
	e286RQ
X-Google-Smtp-Source: AGHT+IFhjSKYX/arBJL3/rXffXBpiEHsSupWSNw5jzv7CJLF3z4ydrD8nr7kTuUVeh7M/OglnfLL9Q==
X-Received: by 2002:a05:600c:4752:b0:477:7b30:a6fe with SMTP id 5b1f17b1804b1-4778fe6391amr100771505e9.18.1763373293056;
        Mon, 17 Nov 2025 01:54:53 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:36dc:12ef:ca32:1a1c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e6acsm310053395e9.9.2025.11.17.01.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:54:52 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] Immutable branch between the GPIO, ASoC and regulator trees for v6.19-rc1
Date: Mon, 17 Nov 2025 10:54:41 +0100
Message-ID: <20251117095441.46680-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hi Mark!

Please pull the following changes into the ASoC and regulator trees as
a prerequisite to applying patches 8-10 for v6.19-rc1 from the series
improving support for shared GPIOs[1].

Please note that there's a small conflict between v6.18-rc1 and my
gpio/for-next branch where gpio_chip_hwgpio() has been renamed to
gpiod_hwgpio().

In linux-next it can be fixed like this:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index fa1d16635ea78..c22eaf05eef23 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -462,7 +462,7 @@ static struct gpio_shared_entry *gpiod_shared_find(struct auxiliary_device *adev
 			entry->shared_desc = shared_desc;
 
 			pr_debug("Device %s acquired a reference to the shared GPIO %u owned by %s\n",
-				 dev_name(&adev->dev), gpio_chip_hwgpio(shared_desc->desc),
+				 dev_name(&adev->dev), gpiod_hwgpio(shared_desc->desc),
 				 gpio_device_get_label(shared_desc->desc->gdev));

Thanks!
Bartosz

[1] https://lore.kernel.org/all/20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org/

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio/shared-gpios-for-v6.19-rc1

for you to fetch changes up to e511d484cbe44fe48a1b9f621f6a947c72503f9e:

  arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM (2025-11-17 10:16:51 +0100)

----------------------------------------------------------------
Immutable branch between the GPIO, ASoC and regulator trees for v6.19-rc1

Add better support for GPIOs shared by multiple consumers.

----------------------------------------------------------------
Bartosz Golaszewski (7):
      string: provide strends()
      gpiolib: define GPIOD_FLAG_SHARED
      gpiolib: implement low-level, shared GPIO support
      gpio: shared-proxy: implement the shared GPIO proxy driver
      gpiolib: support shared GPIOs in core subsystem code
      gpio: provide gpiod_is_shared()
      arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM

 arch/arm64/Kconfig.platforms     |   1 +
 drivers/gpio/Kconfig             |  17 ++
 drivers/gpio/Makefile            |   2 +
 drivers/gpio/gpio-shared-proxy.c | 333 +++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.c    | 558 +++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-shared.h    |  71 +++++
 drivers/gpio/gpiolib.c           |  70 ++++-
 drivers/gpio/gpiolib.h           |   2 +
 include/linux/gpio/consumer.h    |   9 +
 include/linux/string.h           |  18 ++
 lib/tests/string_kunit.c         |  13 +
 11 files changed, 1085 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpio/gpio-shared-proxy.c
 create mode 100644 drivers/gpio/gpiolib-shared.c
 create mode 100644 drivers/gpio/gpiolib-shared.h

