Return-Path: <linux-arm-msm+bounces-19640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F768C1FB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26BD21F21DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F76615FCF6;
	Fri, 10 May 2024 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t0w2zPD9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C593161925
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329786; cv=none; b=liOoocmrGwUlT4OkEhcCFt2cIK0BCpdtsiqi+Y9A+LqPZZk7Ryws+utJOMfTvtx8XFs2a0LeK0QUYoYd55nHgaexiPsPJwr4K1QADnqAADpGjhMmYxObiGQUnXE1EVwtuzev2Jgq4l6VgY3jAkAgHcebyYDh0ZW1HDkuVuh7Jhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329786; c=relaxed/simple;
	bh=7cev1urkkriXH1Kz2Kjf4vy0a3n4geUSsLoRNQ3CwIw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=T9J9R1VFkVFK493P+q7MW7BM1soSuypCxz6f5ITnOVdMnGp8L1TLrcj53fZA/8iQWIK4egoS7mwRP/EUPqz9SqquduXxXTIrIDRA9yQ9K7yQuUJpIJqFfNAnC6GvVe1RZiIjMRdgDe8bqG8EGre2+c6UqJQkT/QMIyTh+1M9F5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t0w2zPD9; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so2707524276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715329776; x=1715934576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=t0w2zPD9iw89N23PVRmDREsXj/Ma/C5dMdEP2G6CTrq3mlaxwmX7fxcZyuFflqoFGp
         9hbdj0l+vvqKuYdGZZOnMExqBVEnNlhJH6CLh38D3UWs6/8iTYWZxNXZOPkcyMcjkimY
         QQ8mMq9sWQ9mkCKfVMPrBs+Xti3PLgLVI7uI9g1ygsFVKTEz/DKlVOrAH0KOcd5v/p5g
         O/ipwtybSsLBz286LncqhZ5IMnC47oZ0wKSobq+3rbBvrauIQK2LY2J7YgH7IP73dVdD
         0DhBqxfkbot6LV6zIJRi3Ic+9BTdZeHKSuZAutinuv5eKajfSaRFH4P3Q6ux0J8eF5nk
         xk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715329776; x=1715934576;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=D9c444Q1NuZjw2cdxCytqi8BxfLxE4JvXOcMIw6tQMRWhUUbc24MPPkqrJhliXtHNX
         AQ9+Vwq94NoVs0KJQXrV5WXh8JMmb3hvLKz0xQ6jQSOa5cJRMyKq6zFbcKCsF6rmPsG1
         P1zsu8MvjzuKtSHQyZrzVJkZjEhx9/gtun9P0aBB8x2fqYqUtDU9ewU4FLEf+Mw8qdK2
         KZ2uDpsKEE/6DEtQV1GPEZdGkBM3RqJLtOZ5LgevNEXPyob3c3iyEvnSMqVL6I/F104G
         mm6zPUsr5pr37V+TxKWctP2KRZh1wGoqfYw203IaIF8Beoenp4jdjjyI1vClJDHyHQ6w
         67WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgvqptH6eui7LNpqHnpgVXbpQ6be0G1QStEymOv08ZrW1U+x8g/JdJeQ3jMYgFY9zuK5k5BNbuVs3OyWETLIpW2nRIYCc+ys6UI5EjEQ==
X-Gm-Message-State: AOJu0Yw04MoZ1p9pBo0e43mWfqCQY/Ufj8NMW+ld7VQ0uyw9AxJEUv3J
	CGLt1OtzYe9uG0/UydNBxD2FMcRzGE1u+TNcOgUetO3RQi6rDrn8BdYrBnAoP70VSIFp6EVSQlm
	aMFfHydDM8g==
X-Google-Smtp-Source: AGHT+IEiknRtBHdrQ2HgiFa5pD74L/Ye3Nv3Q0grhoikyts9vAUMehW+Dt9fd3K3/ZrjmNUP76nhD8GAX7HaoA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with SMTP
 id 3f1490d57ef6-dee4f52d715mr180759276.11.1715329776091; Fri, 10 May 2024
 01:29:36 -0700 (PDT)
Date: Fri, 10 May 2024 08:29:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510082929.3792559-1-joychakr@google.com>
Subject: [PATCH v3 0/1] nvmem: Handle actual amount of data read/written by suppliers
From: Joy Chakraborty <joychakr@google.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rafal Milecki <rafal@milecki.pl>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	manugautam@google.com, Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

This Patch series stems from discussions in patchset,
"[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
(https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
Where we come across the fact that currently the nvmem suppliers do not
actually let the core know how much data has been actually read or written.
Instead they are expected to return 0 for success and the core assumes that
the amount of data written is equal to what the core has requested.

On addition this patchset will also add some guards and checks based on the
count of data returned by the nvmem supplier.
---
V3 Changes : Fix return value of reg_read in sunxi_sid.c driver
---
V2 Changes : Rebase on for-next.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  7 +--
 drivers/nvmem/bcm-ocotp.c           | 12 ++---
 drivers/nvmem/brcm_nvram.c          | 10 ++--
 drivers/nvmem/core.c                | 83 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  6 +--
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       | 12 ++---
 drivers/nvmem/imx-ocotp.c           | 10 ++--
 drivers/nvmem/jz4780-efuse.c        |  7 +--
 drivers/nvmem/lan9662-otpc.c        | 12 ++---
 drivers/nvmem/layerscape-sfp.c      | 11 ++--
 drivers/nvmem/lpc18xx_eeprom.c      | 14 ++---
 drivers/nvmem/lpc18xx_otp.c         |  6 +--
 drivers/nvmem/meson-efuse.c         | 22 +++++---
 drivers/nvmem/meson-mx-efuse.c      |  6 +--
 drivers/nvmem/microchip-otpc.c      |  6 +--
 drivers/nvmem/mtk-efuse.c           |  6 +--
 drivers/nvmem/mxs-ocotp.c           |  7 +--
 drivers/nvmem/nintendo-otp.c        |  6 +--
 drivers/nvmem/qcom-spmi-sdam.c      | 12 ++---
 drivers/nvmem/qfprom.c              | 14 ++---
 drivers/nvmem/qoriq-efuse.c         |  6 +--
 drivers/nvmem/rave-sp-eeprom.c      | 18 +++----
 drivers/nvmem/rmem.c                |  4 +-
 drivers/nvmem/rockchip-efuse.c      | 19 +++----
 drivers/nvmem/rockchip-otp.c        | 19 +++----
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 17 +++---
 drivers/nvmem/sprd-efuse.c          |  8 +--
 drivers/nvmem/stm32-bsec-optee-ta.c | 12 ++---
 drivers/nvmem/stm32-bsec-optee-ta.h | 20 +++----
 drivers/nvmem/stm32-romem.c         | 26 ++++-----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 18 ++++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 255 insertions(+), 232 deletions(-)

-- 
2.45.0.118.g7fe29c98d7-goog


