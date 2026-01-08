Return-Path: <linux-arm-msm+bounces-88143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CB8D063B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83A23300090E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9E4335557;
	Thu,  8 Jan 2026 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JxU0u2rA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p+4ri8QJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3C335544
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907031; cv=none; b=mhAMiGBkfzH1VWF3CIFVGRRhkZV9gneeZMAi9ecb0bPLs1BJiXoXzKRkXNCHvBOMfpq7Z/uShC6/vPOQnyO4+rvHlaNqM5LoeR7RV70Uxbkgahz/2k2nasn7va04UCEdg0UXUPcVt10Ay8QGOTvjYowoGKO8W//VI9ABJ72wVak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907031; c=relaxed/simple;
	bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kgx4PJhO2ax99QBuLd8iUzdxgbrF9WnwoXkwcJd9Oo8iHAIERry+7BGpVURXdPBZwIHw9hqmW7Vkri3mldjcZNkt6+qXY2q6YBadN6dxCV5PMUtsHAnLN14V97UQ3P4TgkiwEsRr2+IKc8tuJ5+z51r2pGeYRuPVRA89DHoy1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JxU0u2rA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p+4ri8QJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
	b=JxU0u2rAqLLgObICtO/LydX4/F68sVrdPi7tDQ8qIcYcf/4q4vTBeCQt8APznRlIc3irsA
	mSc/8w1RSNM7WyKl/gEBKqBqeEZiGg3L+W8KZTE0V1EFK+kEMthHtMnwyKbSXzJ262L/Fp
	8K4OjlHCkk3MEkwSd5785vNfEzVmoCs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-9Z1hV7JmPKq0btAgsxlDfw-1; Thu, 08 Jan 2026 16:17:05 -0500
X-MC-Unique: 9Z1hV7JmPKq0btAgsxlDfw-1
X-Mimecast-MFC-AGG-ID: 9Z1hV7JmPKq0btAgsxlDfw_1767907025
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94120e0acbdso3870700241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907025; x=1768511825; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
        b=p+4ri8QJwFCJ26x1u00s5MsGP+cATPO+y4dg/CSbkLtgP1aFco1DKB91M7p0KftLC/
         mGm27JaaOQ/rnaFqLgVWW7x8VjzYWnY7z2D+C5fk9lUi9vHufcCgvnGco7loOi3meeW1
         dbYB+Ben0m/aMErLqW+NhK4m7EjWeUaKgVFZVKEVZHAI1cUzas3j/h6Li5rzWcAolraD
         ES64kaYiuYl+aRXFGBI7oDqHQmXELo4+6n/1tLehB50KDpOEmvpsxu6XfLvzAVscaasi
         FWyKV8fz81qfL2AdE26ljrHoXP3VoDl6aIIBCf1/Xk1TcGGAHa75RsQGJF8Tt1WSPM6G
         +RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907025; x=1768511825;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne57iAfUngCEZ/eJnFXNUIoW6Gx1gYxdMUdG2ktOUNY=;
        b=ijGOkeFVudJcn/BuiSDa8tO9duh7KwFgzhNbTM7lDsiSYjSlQR58b5jLKJ2wV8vRmV
         rMFLWIbRYxmsX0MkzEJ4aOdODrkbPSF7emIuUPChGNQ2jg+ZEFyQaV78tXSBnELNn2ML
         cZBG8l2FM4vWYhJa0v3DqsBz3jW/N7G+3VyXXvG+VYAvA814rZmvh447rkbq6bZnDUbV
         9NC5FyLYhmv0CTtjpBUW/UAM7Aic+w5hA1AZbJRmgE/Xw+RLb6Bgtlpz+xX3dLonF5bW
         e5QE4FLlQHfV3W3mPgJPR+V89TlPpGNU97N+LYQwE3/InAaHYVJ0ur1TkWCxXqAjxG5D
         6rDw==
X-Forwarded-Encrypted: i=1; AJvYcCVkQhd4QHcLgibTbgQVSgkN/eMziNUnnyzCeSOy1uNi5HyIcU2Eh6B6p05UgUzQyvijdsH/9F04EVkLbdu2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd35rGFION6a45hZxb7jDX3M8ecLERSShD1h6MHwgehosJe9c8
	4rCdDwQ96nSSWwNB3woB3nsBd3quc16I7eHUYEkrzsbuF2BljNGoSkHfQ7Lr/uDvvgM45LkBe4h
	mr8ELkWYRNrWRHrAxXXV44i7MIlFsNhP+p9vfFM3rNtSPwI0Z09g1tWhoYdRsH7A8WrQ=
X-Gm-Gg: AY/fxX63JxmF6WxbEmOD31N9vtB1/Yifd4kfs/xjMRwcWqg0RAtre7eCAORxtsLkxu2
	xVF7Wmais0lNjZ1+58BK25Bi906pLXgNbSdSFGxZZrEXQ5pslIHTJbUSQwQwnneFeqQtMion0f6
	zv2DTd6LN2y+t2GZtlyon8aPVO1PX8SRgd+BT00B7VOSMSy+rhXxcxbB4XP9Vt5KCd+JC0S5E3V
	1/c19ro6Hw1caKufgYaVIxXLErShKVEE5kSHTu01F80twwlY4A9L+c/CR47jFTx8PRdUKiozcGW
	gUtM80mgYyHeo1opzpaw36i4hjRTYFBXfPzXBvFFW8XcZznjRy/IY3eG+S32DMXhFDnp1aSgIM/
	bIAKKDpR2h3kcL+U=
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id ada2fe7eead31-5ecb68aff05mr2988605137.21.1767907024801;
        Thu, 08 Jan 2026 13:17:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz/p7kGP9fvfk2vXLPq3R9VUjKVw1cdN6NrP5mq/P0PGpCjqA4/hKeGKMrVWaYIPrb1wIVZw==
X-Received: by 2002:a05:6102:554b:b0:5ea:67f4:c1ad with SMTP id ada2fe7eead31-5ecb68aff05mr2988572137.21.1767907024314;
        Thu, 08 Jan 2026 13:17:04 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:17:03 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and
 friends
Date: Thu, 08 Jan 2026 16:16:18 -0500
Message-Id: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnA0kHizsVcYO2kQNG3WkKkLpu
 6/s+B3+v0BWN83w6Aq4XpZtTw3cdxC3Ka2KJs0w0DASU8D4eaPYZaKOvp9J0KdDkeMizGGmMRC
 0+Ou62P0fP1+1/gDlVpEzaAAAAA==
X-Change-ID: 20260107-clk-divider-round-rate-1cfd117b0670
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Michal Simek <michal.simek@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-phy@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5523; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=5gEzfGrJrZBcK9ab2+97vww3qO4uDY2TibGccFpsz3I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Lb+j2COyZDSrq1aGtHuW3Hnjb6jSZa7wqEZi1UKM
 +/wfPfoKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCLePxj+cE8JZ4ir1XC94hPf
 wLfqhfvjO0u5RdiClDPF9/n9TrNyZGT4NKcq8ciUz4qK0XG3a+4381Zd+31jtWu5nMfx+TvuVsY
 xAAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a series that gets rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

Three of the patches ended up being a more complicated migration, and I
put them as the first three patches in this series (clk: sophgo:
cv18xx-ip), (clk: sunxi-ng), and (rtc: ac100). The remaining patches I
feel are all straight forward.

Merge strategy
==============

Only three of the patches are outside of drivers/clk (drm/msm, phy, and
rtc). For simplicity, I think it would be easiest if Stephen takes this
whole series through the clk tree. Subsystem maintainers please leave an
Acked-by for Stephen. Thanks!

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (27):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
      clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
      phy: ti: phy-j721e-wiz: convert from divider_round_rate() to divider_determine_rate()
      clk: divider: remove divider_ro_round_rate_parent()
      clk: divider: remove divider_round_rate() and divider_round_rate_parent()

 drivers/clk/actions/owl-composite.c        |  11 +--
 drivers/clk/actions/owl-divider.c          |  17 +---
 drivers/clk/actions/owl-divider.h          |   5 -
 drivers/clk/clk-bm1880.c                   |  13 +--
 drivers/clk/clk-divider.c                  |  44 ---------
 drivers/clk/clk-loongson1.c                |   5 +-
 drivers/clk/clk-milbeaut.c                 |  15 +--
 drivers/clk/clk-versaclock3.c              |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c  |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c   |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c              |   6 +-
 drivers/clk/qcom/clk-alpha-pll.c           |  21 ++--
 drivers/clk/qcom/clk-regmap-divider.c      |  16 +--
 drivers/clk/sophgo/clk-cv18xx-ip.c         | 154 ++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c     |  15 +--
 drivers/clk/sprd/div.c                     |   6 +-
 drivers/clk/stm32/clk-stm32-core.c         |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c             |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c              |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c            |  16 +--
 drivers/clk/sunxi-ng/ccu_mux.c             |  49 +++++----
 drivers/clk/sunxi-ng/ccu_mux.h             |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c             |  25 ++---
 drivers/clk/x86/clk-cgu.c                  |   6 +-
 drivers/clk/zynqmp/divider.c               |   5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |   7 +-
 drivers/phy/ti/phy-j721e-wiz.c             |   5 +-
 drivers/rtc/rtc-ac100.c                    |  75 +++++++-------
 include/linux/clk-provider.h               |  28 ------
 29 files changed, 257 insertions(+), 408 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260107-clk-divider-round-rate-1cfd117b0670

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


