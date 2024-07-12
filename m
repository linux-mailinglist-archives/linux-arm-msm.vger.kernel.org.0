Return-Path: <linux-arm-msm+bounces-26018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B492F7AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 11:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889501C21966
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BA0D528;
	Fri, 12 Jul 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dy+SZtag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64221146D57
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 09:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720775597; cv=none; b=ayOvBJvgJmBFtswcgKXV5j32ndfFZJ1Wt1Xkbmg3I+Z+icLQ+59IXkC06zEHtEdY0eDPmM4ssoFGc2dC4HM0DWDHwBBHKrRT6blK85AKTPRE4R+KFxm8UGPmnxgeOKj2zCmQFk1MYG/OSnOM3K58vBC4+4qUXbP7NvLDG/ApoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720775597; c=relaxed/simple;
	bh=O0udixIhFIlkQTpES69xYcmtII6BLgpv7Aux1uCd4Ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNPACMA7n/5wMJIWl8RsfHn7+t03IYL7ZexiCa54osXbBpmiTt3ZADzS0KUIwb/fkglPJRuGx0SlAjXfx4eDyW6cUgwGDgYAP2XkkO8BEjm+y4PIRHIV+MVDmrRPPMRXLCotEYPd+uamA8LmvQee7g9SrCyyePFBv7BXDB37X84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dy+SZtag; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42795086628so11618525e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720775593; x=1721380393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TC7yfYJbviu34ruPABofUUVbagrt3olVNXXc2jSVt6g=;
        b=Dy+SZtagNrluodzuwPtlHKzYiUerm8vg70xd58ZZyyx+Qh/YNWUUxFCkqrEim8Dby2
         MyEvjWzgvoEB+tS0XivrKDRU5zKkJz5vlFIwJBg7G8M6baxW5mLmKf3V4YyrfkX+30hr
         RxmMf2rUWZvG2hOX1Flz1l13/CzDEJBJuoHgCh/EorgLmtE8XUo/zbN3JwYxI8m/Lqqe
         KmQ4VcStoqmgOl2ofw7CCEn4g7ck9+CvEjT/LgXbeXta5O4yANTVTcJimWXvDB4nBa/1
         41XJYNFgdMtAS95aJ05CAhMjeYDuUDhNJdboKcwhYuDoygptS8xgko7TTEhd8gbJLyPG
         Gfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720775593; x=1721380393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TC7yfYJbviu34ruPABofUUVbagrt3olVNXXc2jSVt6g=;
        b=uO3cJ8IAqP0JbbL+mw7/Bx8nkxryqxYQDEMQCraxwWTSzFFA05Py4h9h8Noyqb08Kr
         CdzZrtHEu8LFbg66TlBzk8hRj7jSUmKdwXmbODb07HPn69fdAd3Q9Pu62eavXCfhlKnt
         flMLzbXcJHB5j4c5Ed4AAd8993t8sOhu44murqjr6j1ZAPwtZqlRHDDNOhOMOZHYbfE+
         KlCbUj846JHm/ISTQAWfZZK8ibOx7G2Ch/p8VS8NC8QJyOddwxuWwJwjzf6oylDQS+GW
         Y74C5UoADJ1TovPdoR4Ar8GDD/RbjKp8gEnCrTWtH04o8ue9C71s0Ufi41vy5NukJjhX
         sBPA==
X-Forwarded-Encrypted: i=1; AJvYcCXox/L9Nd3OYlukQUlWdiOp69/JpL9Ms3YfWOXWwVrRza5mX2uukEmm8+jOoivJsGyONFF+bBtnAp+4vrNk+r5KlKpP1nKZrWsxljtIXg==
X-Gm-Message-State: AOJu0Yw4SjX0IsNbWoXJIxyFOpCSPYzp5x4C3y+SIXk2FWbxzNc3psaR
	DQzZXW3d6n3iWHHOD/ivMiHBvUYNmNUMZ46niepreDJXcgJpSF4JR9+tc80yc9osk6leatQFWMt
	4
X-Google-Smtp-Source: AGHT+IEyV+qMKabf7Lhp+SPEVFoBgOg/FYABYcBuVBv0YNzlKd31oWS8D/mDy3Ib1FIvwp+Gnx0xvA==
X-Received: by 2002:a05:600c:4797:b0:426:6945:75b8 with SMTP id 5b1f17b1804b1-426708f14ccmr71137695e9.31.1720775592614;
        Fri, 12 Jul 2024 02:13:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ac5f:fcfa:c856:a4d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f24495bsm16339145e9.2.2024.07.12.02.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 02:13:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] power sequencing updates for v6.11-rc1
Date: Fri, 12 Jul 2024 11:10:08 +0200
Message-ID: <20240712091008.14815-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

I'm sending this early as this is the initial pull-request for a new driver
subsystem living under drivers/power/sequencing/. I'll try to be brief here
and allow myself to link the cover letter from the last time the series was
sent in its entirety[1] (as opposed to smaller chunks targetting specific
maintainers) for a very detailed description of the problem and the solution.
I'll just stick to the key points below.

This has been in development since last year's Linux Plumbers Conference and
was inspired by the need to enable support upstream for Bluetooth/WLAN chips
on Qualcomm platforms.

The main problem we're fixing is powering up devices which are represented as
separate objects in the kernel (binding to different drivers) but which share
parts of the power-up sequence and thus need some kind of a mediator who knows
the possible interactions and can assure they don't interfere with neither
device's bring up. An example of such an inter-driver interaction is the WCN
family of BT/WLAN chips from Qualcomm of which some models require the user to
observe a certain delay between driving the bt-enable and wlan-enable GPIOs.

This is not a new problem but up to this point all attempts at addressing it
ended up hitting one wall or another and being dropped. The main obstacle was
the fact that most these attempts tried to introduce the concept of a "power
sequence" into the device-tree bindings which breaks the main DT rule:
describe the hardware, not its behavior. The solution I proposed focuses on
making the power sequencer drivers interpret the actual HW description
flexibly. More details on that are in the linked cover letter.

The second problem fixed here is powering up PCI devices before they are
detected on the bus. This is achieved by creating special platform devices
for device-tree nodes describing hard-wired PCI devices which bind to the
so-called PCI power control drivers which enable required resources and
trigger a bus rescan once the controlled device is up then setup the correct
devlink hierarchy for power-management.

By combining the two new frameworks we implemented the power sequencing PCI
power control driver which is capable of powering up the WLAN modules of the
QCom WCN family of chipsets.

All this has spent a significant amount of time in linux-next and enabled
WLAN/BT support on several Qualcomm platforms. To further prove that this is
useful and needed: right after this was picked up into next, I was sent
a series using the subsystem for a similar use-case on Amlogic platforms[2].

This PR contains the core power sequencing framework, the first driver, PCI
changes using the pwrseq library (blessed by Bjorn Helgaas) and some fixes
that came later.

You'll also see the pwrseq core pulled into the Bluetooth tree to satisfy the
build-time dependency on power sequencing in the hci_qca driver which uses the
same power sequence provider as the PCI pwrctl driver added in this PR.

More changes that don't have build-time dependencies on pwrseq are scattered
across three other maintainer trees: there will be DT bindings in the
regulator and wireless trees and DTS changes in the arm64 tree.

Please consider pulling for v6.11.

Best Regards,
Bartosz Golaszewski

[1] https://lore.kernel.org/all/20240528-pwrseq-v8-0-d354d52b763c@linaro.org/
[2] https://lore.kernel.org/lkml/20240705-pwrseq-v1-0-31829b47fc72@amlogic.com/

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-updates-for-v6.11-rc1

for you to fetch changes up to 50b040ef373293b4ae2ecdc5873daa4656724868:

  PCI/pwrctl: only call of_platform_populate() if CONFIG_OF is enabled (2024-07-08 21:15:26 +0200)

----------------------------------------------------------------
pwrseq updates for v6.11-rc1

- add the pwrseq core framework
- add the first power sequencing driver: pwrseq-qcom-wcn
- add power control (pwrctl) changes to PCI core
- add the first PCI pwrctl power sequencing driver

----------------------------------------------------------------
Bartosz Golaszewski (7):
      power: sequencing: implement the pwrseq core
      power: pwrseq: add a driver for the PMU module on the QCom WCN chipsets
      PCI: Hold the rescan mutex when scanning for the first time
      PCI/pwrctl: Reuse the OF node for power controlled devices
      PCI/pwrctl: Create platform devices for child OF nodes of the port node
      PCI/pwrctl: Add PCI power control core code
      PCI/pwrctl: Add a PCI power control driver for power sequenced devices

Bert Karwatzki (1):
      PCI/pwrctl: only call of_platform_populate() if CONFIG_OF is enabled

Krzysztof Kozlowski (1):
      power: sequencing: simplify returning pointer without cleanup

 MAINTAINERS                                |   16 +
 drivers/pci/Kconfig                        |    1 +
 drivers/pci/Makefile                       |    1 +
 drivers/pci/bus.c                          |    9 +
 drivers/pci/of.c                           |   14 +-
 drivers/pci/probe.c                        |    2 +
 drivers/pci/pwrctl/Kconfig                 |   17 +
 drivers/pci/pwrctl/Makefile                |    6 +
 drivers/pci/pwrctl/core.c                  |  137 ++++
 drivers/pci/pwrctl/pci-pwrctl-pwrseq.c     |   89 +++
 drivers/pci/remove.c                       |    3 +-
 drivers/power/Kconfig                      |    1 +
 drivers/power/Makefile                     |    1 +
 drivers/power/sequencing/Kconfig           |   29 +
 drivers/power/sequencing/Makefile          |    6 +
 drivers/power/sequencing/core.c            | 1105 ++++++++++++++++++++++++++++
 drivers/power/sequencing/pwrseq-qcom-wcn.c |  336 +++++++++
 include/linux/pci-pwrctl.h                 |   51 ++
 include/linux/pwrseq/consumer.h            |   56 ++
 include/linux/pwrseq/provider.h            |   75 ++
 20 files changed, 1950 insertions(+), 5 deletions(-)
 create mode 100644 drivers/pci/pwrctl/Kconfig
 create mode 100644 drivers/pci/pwrctl/Makefile
 create mode 100644 drivers/pci/pwrctl/core.c
 create mode 100644 drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
 create mode 100644 drivers/power/sequencing/Kconfig
 create mode 100644 drivers/power/sequencing/Makefile
 create mode 100644 drivers/power/sequencing/core.c
 create mode 100644 drivers/power/sequencing/pwrseq-qcom-wcn.c
 create mode 100644 include/linux/pci-pwrctl.h
 create mode 100644 include/linux/pwrseq/consumer.h
 create mode 100644 include/linux/pwrseq/provider.h

