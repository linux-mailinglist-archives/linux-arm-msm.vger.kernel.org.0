Return-Path: <linux-arm-msm+bounces-85105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B35CB833B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 09:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CFB63012952
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E03830F812;
	Fri, 12 Dec 2025 08:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VQyN9t+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235525B30D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765526973; cv=none; b=CNCo6WwPcb/z8XiCkhPt6NRm1Pma/8uccYlDYrK9/nYj8X43DHXO6C8Lqz9F0viDG7uVbuMeHV0RAA7Xir1sapPkROLku52SxtPztqP6/J0C/xRkov3NRqsxjdofcJEiAirCv868hDTUu5OiVMW4jgJeFdXBtY7drox0OFOeQoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765526973; c=relaxed/simple;
	bh=K06CTF1+H8fsvJB8Sz7I3QqOSTfTlCxCmD4vCQHcp/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EDNu2edVN+NRDMzgA+yhW2T4mwNidQOxePGShkfBdW1oPfwW55P/hqPS4Zr5jjmDA0rWt5XsPU1x8U5HCDe8vtrF6Z8cmnvhjXq8T1iS99+N6FYiy1NzAhyTG5DN6zFpqSsoN9/CpJbMD8EmdD4q5IAeNbfypbg06X6c2WjEXHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VQyN9t+s; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so1299811a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 00:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765526967; x=1766131767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4ODxaS91WWg8dms1l29deWZrC7eVseakTTbVZP9TPM=;
        b=VQyN9t+sLEL/hIuBW/KIOEI00UrAqUlJjnEqwC+FdON6JLO9z7/yUMsP/cwtSqfOcx
         D7CdkARndnfuvifT8wNgW11N7IwwnAqmWK76Q4E6b9iHh3M2IG58U9pMWbkCF9wzs89u
         LEbhI9HYa8BioFTqLVMf3lTio7rhTTeZPMsbq9cJMopoD9HyqdTEaSxCv9TR08ZHx5wZ
         XJ/cvZqmrLgksernPaiaU1JoiqT8GmGzmq6iliUP772TD72w6G4WKrXV97682fTIqvn+
         3ud+YZOH7fC4TyMqbm9XTuEwPnEMnKm8nsLAGUF/YoZWkh5MivVoMJ7gJdRJrj90CoCx
         p1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526967; x=1766131767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4ODxaS91WWg8dms1l29deWZrC7eVseakTTbVZP9TPM=;
        b=xJ4+dXLRaFj/JSXVbKQXc5y6ISpiNiPkXs73qlCo9X9Pec6hImW99DgAhql/eBcDkX
         5hAUFaoixyqt92ahGeAwbbevZj/+bCBEkbhcHj+H8inhPGkySbMgSE5qmLrb5QSnGvkk
         684ouTD5b2xASM0PCFUhbctcRDABMUp14Nm66JPmVRZ1Z4AtF3sc+foKOeJANVIH4JOY
         UEcv/AjVhNLQ5t7ceoL/GcY4rTw6qlyNVOVt+iO42lnJvuqL/d6YYLq2zt13W3yQ1lKV
         1Wzoy5kuvfY+nRajFyntfbs8qGroUR+sRWjCCueOtNZfo22Y23MoxWPP9C6vfCEQGxdN
         zkBg==
X-Forwarded-Encrypted: i=1; AJvYcCWzMJLFDlSuKFElhXrgmpV0Z5joGHMT7860Z7dTQ/5BwO+Y/F9OIjtPDa68P5dXkTbxrJh6hZaEtAntWMQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YylJMWVKee8hcwDaRHlEOEhEQDgtz9lKCqxmoP2WLGsSBqoU0Pu
	7I77Uo+BGoAYU5E+T2Vc7Qlw37tnNPry4qXlWAf4sj5LXZOHPGlkuOyCM7fytFvdZ8ErCEeZ9x1
	065gH
X-Gm-Gg: AY/fxX4vR2lJIv/Yxc+Ii4uoisKTMcnpdc0tjh1DyObByuFwCf+NJj69A2WDvuJe61D
	4+aGp6FmFibGeezxhl3nuWsiCoqgmtS9J1r6VveJW4OWt2G9CWD9jZ1UMd1xt79x9OmqIZhntEZ
	esaZWesDZ/egIC5IzsudIJvG9azh9rNDxjElPfHZA+9rWcnPflateTaj+m4wXKaqi9Hu22/Sa+/
	2rO/c0ZueGpL2jIWme8PF9Vvdz2F79GKrvP0ADpZ1ip0pXzr5lUVpHOH+0qjRxdof/+FVzBJ8M1
	UfzQ+SNKzen0EyX+sorZdXiob8De5COSqh1xLt9kypw8RJ0AxZ3NBYGycc8IX2VBfIzP2huO6KK
	CrA2T2MFF0+anF9eN7o66OnkZupEAHwUSVu9groblZF73GnlJan3vONpZmdPyxPMeZ5c/Zv3oGx
	KMkrMtajwizx4KlvOm3wD5Sya50amOEoTBWWvROA7htWoTnUAEXy5oswiphEk6lHtzKFsdd6cyd
	t8=
X-Google-Smtp-Source: AGHT+IGjlZGO7rwXFONsbS/nqwyomTwF06cuS1NBQZnSkxQyjYYdO5U9mb9vjrawLsD5RVoidrAzyQ==
X-Received: by 2002:a17:907:8011:b0:b7a:6c98:32ba with SMTP id a640c23a62f3a-b7d235c977amr57851566b.1.1765526967412;
        Fri, 12 Dec 2025 00:09:27 -0800 (PST)
Received: from localhost (p200300f65f0066082ad4229ee042f7ed.dip0.t-ipconnect.de. [2003:f6:5f00:6608:2ad4:229e:e042:f7ed])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa29bedbsm510984066b.9.2025.12.12.00.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:09:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Yang Li <yang.li@amlogic.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-serial@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 0/4] serdev: Stop using device_driver callbacks
Date: Fri, 12 Dec 2025 09:09:05 +0100
Message-ID: <cover.1765526117.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=K06CTF1+H8fsvJB8Sz7I3QqOSTfTlCxCmD4vCQHcp/Y=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpO82hS2J33V3DvLBVORXLLnffbAMzV3OfWdh2a VVjbXTGbp6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTvNoQAKCRCPgPtYfRL+ To3JCACryjD6szyIbOAJaZIbJtZMnL1IOkIiXNzrMoIlqNyOhOwBe/3SwVg+zplh4KCp8HCJk+O y0YB98avclKkhAN8MqyBBiONeBwksmxil9PatLgexVwxQlb3BRfFCKaWkdecsThmRQoVC1dJ3FZ TiFdiZZFveRo4TT2RE2fj8mlgtdtwzponNXPqcznoA5L7QN5w2ZVUAGB3tRk585tZwFkZMYm56s B5YrvZ2zovmO2vhkdWeMc0rXKgJN2FjP4GVbYm8aWcSz3qFSY8cmzChofq/YnzdzSrPxuN+ttjD whNGQH+Nu7ZdRFUDa0F+PD93nRgzYZjNFt74aRphPSZAJzWw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the serdev subsystem currently doesn't provide a shutdown callback, thus
drivers that want being notified on shutdown have to implement the
respective callback in struct device_driver. This (and more)
functionality can be provided by a bus method as it already done for
.probe() and .remove().

The eventual goal is to remove .shutdown() (and .probe() and .remove())
from struct device_driver.

Note that the first patch introduces a warning when the three affected
drivers are registered (in driver_register() because `drv->bus->shutdown
&& drv->shutdown`). Patches #2 - #4 fix these warnings. So from a user
perspective it would be good to get the whole series in during a single
merge window---either by creating an immutable branch containing patch
#1 that is merged into the respective subsystems before applying the
following patches, or merging the complete series via a single tree.

At a later point in time the added check in
__serdev_device_driver_register() and the function
serdev_legacy_shutdown() can be dropped. I intend to cope for that in
the merge window that removes the callbacks from struct device_driver
because drivers that I might have missed to convert or that are rebased
over that change break silently as long as struct
device_driver::shutdown exists.

Best regards
Uwe

Uwe Kleine-König (4):
  serdev: Provide a bustype shutdown function
  Bluetooth: hci_aml: Migrate to serdev specific shutdown function
  Bluetooth: hci_qca: Migrate to serdev specific shutdown function
  platform/surface: Migrate to serdev specific shutdown function

 drivers/bluetooth/hci_aml.c                | 16 ++++++++--------
 drivers/bluetooth/hci_qca.c                |  5 ++---
 drivers/platform/surface/aggregator/core.c |  6 +++---
 drivers/tty/serdev/core.c                  | 21 +++++++++++++++++++++
 include/linux/serdev.h                     |  1 +
 5 files changed, 35 insertions(+), 14 deletions(-)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


