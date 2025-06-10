Return-Path: <linux-arm-msm+bounces-60776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C80AD36F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24E437AC63A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ED22BE7D0;
	Tue, 10 Jun 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xenBnU60"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C43B2BE7BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559083; cv=none; b=nMaDKGMx4rYJbSKgthWvW8/FxmuD0NhXuL56M9JTXxTxwGTh4x0IxruWmLjY+FlZF8Zo0jJWwSZOIutFy8G6IfDiwFqOOlfobuz57ipZjTi8wRXGAwOppEirzsteZAvJsmwha+xmWzhNMWIlGh3k4m06LjQVrs2Ym+nucdsi7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559083; c=relaxed/simple;
	bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZZWRk/o/B6GqTdWAsfSrghhqBcZCYx/NSAe57SWW3/Dnh+Tnf8lQVx15/rBdgtlCEsBxxKmdHSV3YUfctd1copmDO7E7kjlipDUkDEb5Y1m37wluel24cD6oCbgSPG3mNI5hi0z5MIJXCl30m+NxVgcHU+HFUg3/ywHU/1NrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xenBnU60; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a35c894313so4840398f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559080; x=1750163880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=xenBnU60b9gQp90ap5DPzJhLcijnnQdsXm2JClJGNt/V4YeFS0PUSSsnpA1dXjpvrN
         Gk3QlCfAEqP7ISc0YuVfRDOVMuy4fgnsMCUnZue4agx1vFIag8r2QopEKQFtyX+G46YP
         CWCsfMIgFTAtbArmZTB1LsHOzshRzJGODf2IJpQ6195g7cniMhWaqJ1c6c30hd1Gxu/I
         62S43YH15Jaeq7wvWlMWIyh3wiLTWBfcp38S4GnJKId40yrZbFY1rUDKZrUlUn1LbaWI
         +GGPjn1QryGSU5hBbzZ6Flj+9DlycDJpw1ngOCnG9lp4uWEh7BmgqAusugVqNAlX7uj4
         EFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559080; x=1750163880;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76J2LCVixashUDb/m2qpfx8ikv/ZEUvoe4KOmQxn0YQ=;
        b=a3ijfIq0D89rBf/J/At1iQrVCLqkuzfpzW7/D3MgrmXlp4P0551qvHVFzT06+Go3qx
         slauYnxe+VZhtWJ2t7lD0JakHa8yRTC3jfhLF6KhxwqO1jsf9GoDYnoGEx2GTN3NCDVk
         KpLtzel1WyxiO+OEaCCwQeh/o8m2KgObpTHRLG7+knvPQ4rtJSm5OddW2mOLjfxuzX28
         bPDhPlZ3RJVr4+5FTHKBwYz1e+xLWkU9BU1h7TmrTBcVXiRdd0h5tBAjAd1WJBpSiA3j
         z4p8ZYuDs7xlbUvTno2pJAfqql9pagPVGIaLclJhE0W4cijoekJQv86vFMsyy7rHBt04
         0DPg==
X-Forwarded-Encrypted: i=1; AJvYcCXX3OMJjr0gSdq3ltoXEmI/pfYn8YBzAsEKpyjKGMaZGWLRVKsoNaXNmoXJ2r0uSGkNG6cbNTEVOuDgd6gJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywze/S+biHjAUnmMFUFOHmeWn0ywE6DeJQ+hfyNK27BG+KCfA+M
	IgdKEnyUKvYaEhP/zcVPGzAg5X8ilyH4dx1OuFWORzL0u5QjDm2S2XDSkNBHBTvxwRc=
X-Gm-Gg: ASbGncvrYGkyKrN/PVamye4+gRApe/5w2Ydb2M8Xelj1hSZBmrhW4250lde3yWfZzQ1
	OYwTpP/qQTARlfTnzNq5Za/j/atDrM8wkION5l9TyfyfOOMu9RPkurC3xg4piKcAJ4fpZapDFdW
	i3lhrYbTpcUw4qS8nGvLmrqBU6rOh7olIv8o6itGWrYEpnbEyiqhYTvdQfKr7cG7ytwyZA1hHgM
	ffmoRhIwms9s5R0pHIFoGgYgyixUuvq5S4ZrCC32oJ7tLNtJ7X92BLC9+IBYrMGGoIDRGSsXoo6
	queECSJ/4cbvhrbQX9KfKl51/bToWZOX2pcWoSfHVkPsMpckVjMyjG+i1T4GgNdn
X-Google-Smtp-Source: AGHT+IGsSDaRB1hqZwU1/G5MCu4Szr+Exf9GnhrFkMwxOumN0QR4RfbCMoZmzXDX0IpoSo9pzctkjw==
X-Received: by 2002:a05:6000:26c8:b0:3a3:7077:aba1 with SMTP id ffacd0b85a97d-3a531ce677bmr13926248f8f.48.1749559080359;
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm142476805e9.38.2025.06.10.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] net: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:37:56 +0200
Message-Id: <20250610-gpiochip-set-rv-net-v1-0-35668dd1c76f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQnSGgC/x2MMQqAMAwAv1IyG9CgFP2KOGiNbZZaUimC+HeL0
 3HD3QOZVTjDZB5QLpLljFW6xoALa/SMslcHamloB7Lok5wuSMLMF2rBWDGy3cZu7emwDmqZlA+
 5/+u8vO8HXLWAMGUAAAA=
X-Change-ID: 20250527-gpiochip-set-rv-net-9e7b91a42f7c
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KwxEa/uJuk3pJvTN2X8lujDshvrYOWCdkyKc2L1pS/I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCcm+33A95fkBlAJxBo1vos+qspK8wslT2V1V
 Wh30tXt2cyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnJgAKCRARpy6gFHHX
 cuYrD/44rRjrB6mmO6/fNfGeJctkPA103u6ffSW8zmiUHtgIJ5B1V5Qasz+jhTr2tg3lUTCnbYe
 w34O88SipckwpEJoWpdvuB2hboyNKzPQQS1WPa2E39MYGaJw7fYPsbvFVVrtxBCZ7RzWFExW3MQ
 3TOsO1fEzH+UzzX4LwNR5DYvCTbc5uo6WA/tYEj2Cf5UdkI3ukiMfJB3cxEaZgW1Xhv0oVIOX0C
 NpnbvH/9zY+5TwvO/xjSNoOdxotzl2H05KRpJ5Aa5WaeU68D/TlijfF/9pB3tsq0N0SK4uPITOk
 1nvjFoAGwO9zoPERN3DQ+sB0Tp5RHQXfrfpo11vUn9qqGhDExZAen6z8FlYixLirLMdzj+UvWxj
 XBKO0O1hoZfuK4ZHjVYa5tdLT5ofLoIoKxVQd3n3UENerD2HXefvq4tvwtxQ4+MVk9r0Vwd8BZL
 dweZ0tHZ/7Ntl8kGYNe7A7JtI42JgVzJXVV/t3fa7pzQBU+ulPgswxTSNIeYXYxETT7g4cYWjK7
 25FpJqsQrKFCE9mZbAaj+kQt6QKR7ceIUa3pe0x5mnErUjbysE7QUJcphFy2dh4QZ+YpI328z8P
 Z8jaeoUcMeTqO8wIjnMJV4NBzsCznTgTgvtZ5EFwA8JfF2IN/tWFT0I8wKy1PwzioUBgGqzP1R3
 QGBdUz7g9snOoDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/net/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      net: dsa: vsc73xx: use new GPIO line value setter callbacks
      net: dsa: mt7530: use new GPIO line value setter callbacks
      net: can: mcp251x: use new GPIO line value setter callbacks
      net: phy: qca807x: use new GPIO line value setter callbacks

 drivers/net/can/spi/mcp251x.c          | 16 ++++++++++------
 drivers/net/dsa/mt7530.c               |  6 ++++--
 drivers/net/dsa/vitesse-vsc73xx-core.c | 10 +++++-----
 drivers/net/phy/qcom/qca807x.c         | 10 ++++------
 4 files changed, 23 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250527-gpiochip-set-rv-net-9e7b91a42f7c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


