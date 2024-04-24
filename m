Return-Path: <linux-arm-msm+bounces-18399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 025438B0366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 09:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25D2DB25E5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 07:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEDE1581E7;
	Wed, 24 Apr 2024 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RVoIN6Uq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B4F157E79
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713944573; cv=none; b=keLes4bhs/HdkVpguVz2c0eDcD9em5x2T3k4QQcUuRBczrmREtLI6M66G0RAzc8t/uMmawFMRwgOTXltlwIbmtqy1NZd4SlJEM5Fby/AgAmp00oE7gPttQDZeQ4DpG0DeD32CYiIU8K6V8hIUSB6kPCKitVud0TwJfg4w7YTlpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713944573; c=relaxed/simple;
	bh=KEOY/H38r2q4LMqOZqaCRp80aSw3OHhkx+jVNw2tNvc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rEFRvDrDxk9EyIGPWi1dCLAXSY5UaMWZNiUNl8PbGFV1TLiNNC/3DmVfmm3OQVJ3uLMZEmmv/bKqmWrj7FFZL3/YnHTpFXKe8yP3bc6r/Ue6oZX/fz3BMCdFsYBUTOj9noD/nyyBNQGHFQrw854OD3goZEMthRsHCxDGrm897Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RVoIN6Uq; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61ab173fe00so128958237b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713944571; x=1714549371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=RVoIN6UqYxyAd44cFqI4HdBfPPfIJNwdxG9tps4jglVmL9AYADYK8f0VP8KPPxHtjD
         xVmvSgIaUQWgZujAklMzOANFcLXv5IwX0BS/cRPwdYe5t4MachnUvaiOUxtjOM6SMmX4
         3s39ErUlGb4zOgJTIi7rHwg+l378U4KKdalhkU2ZZ7hh4/i9t8p0cheuxblFAXqrhAbe
         f1wUjTjkrJ5B43u0RwswtYzosthTKGdFjyrBUfv7hT5zJ+71pUpUweZtbSsdhCqT9fcf
         DHei9J68gt9snSxlGnSvQxuPn34inQg/QfRnDRmFQq8gEZ5q7WjE6JwOJk3KdOQhl1Fh
         4qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713944571; x=1714549371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=oLk6D+C0UVHOw5iKrqMe+RrpphYdu2gInSTDHz0EHjBmX5ZM3MyLb1pZfuFDCaGwXU
         F/r0xC/naxa6/8a29oDePPu0p9oANttMOueWym+k1hJBsafsapRLdGNWBJxfUKG2rnqv
         8XkXxQ62uV3P2LCTiWthljIxUbu4XZL4Cchfrb7ato8Hh9Xo8h4IJYN/veY1rwpcFLkl
         +SPQ6FEtEPr5pmcp31MIx4NW8hOhEIS+wmibMMSzXmZmbEZ0akE/VlEQU5IOGNHZJJRp
         eadrVkxTK/OQYBddwCyya0zKAPdhcjdh8Oy1kgQlN2lGCEwpbrLzASTGtYYNlAQ65pgl
         IdJw==
X-Forwarded-Encrypted: i=1; AJvYcCXDov3g0ymCpmxPpPfpWtY0UJKwy+hscnj3tzNTyTmThETWSPm8bpG5nBcBTlMWh/hzzoKjkqvKltdhJy7MZleeHhhCoZmeTtvfzKAXmQ==
X-Gm-Message-State: AOJu0YxJIE+pLYfB5cqMxLlDfotufBxoIKwhR9gouAIYx6nw2UY09Udf
	1kYpHgkt5at1fGIPwpmgqwsvXYP9C22uqOATS0Vq/1n88joJ1dLEsRC3k+PJbVKX0t0YrLmZwDv
	TjR8kDBSAaA==
X-Google-Smtp-Source: AGHT+IHAgakRN1GMcYnGCFXgcp0S6jDEiv/2+gY/KRM4h43j6n7j458O2RZcU7HXGWBkkYoEbxUyhX44RKGCPA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:154f:b0:de5:1f88:ae4e with SMTP
 id r15-20020a056902154f00b00de51f88ae4emr651015ybu.2.1713944570760; Wed, 24
 Apr 2024 00:42:50 -0700 (PDT)
Date: Wed, 24 Apr 2024 07:42:41 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424074242.519895-1-joychakr@google.com>
Subject: [PATCH v2 0/1] nvmem: Handle actual amount of data read/written by suppliers
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
 drivers/nvmem/sunxi_sid.c           | 15 +++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 253 insertions(+), 231 deletions(-)

-- 
2.44.0.769.g3c40516874-goog


