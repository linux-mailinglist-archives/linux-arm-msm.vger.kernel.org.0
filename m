Return-Path: <linux-arm-msm+bounces-61691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E38ADE4ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65E691799E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B77227E1C3;
	Wed, 18 Jun 2025 07:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Z7HXL4d";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tcc7XPlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A4225B687;
	Wed, 18 Jun 2025 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233235; cv=none; b=UycQzX/aM8rYqHb1y/06zniXH00eP+aD81LriWY8l4/RcaPF9QcjEXBggzhWQhNmPMk3BeK4hNTXByhgRncEDkoQuqCP9U4Ixga1TCh9gjYM6dvwv7N6vDm+AdUB8VGUQbkScODQDpgjiA3HWm93OYKxa7AxSpHRRioc4FLOOIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233235; c=relaxed/simple;
	bh=ZGg7BEj9Zk6TuFkTwYnSmEoyEZPeB0NY8xBLjHfQJZY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jMW67wU2sDLMV2x8UafAXFnrmNH1cLEyqLW1qo45h3atK6GA3Pg6HyoaVoDQynvGUxxGmuugcNUMeCgTXZbg5G9+pCQItpep1gm4dFhbEZjmA4KOkm+xj8KCeRTdUz4iydPyhsJvDnjr6u3NnS1RrZAIADiTMKyOmeGrtvm7sLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Z7HXL4d; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tcc7XPlF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lJEJerT30uVZeLbMloQis7w9Ly4m8IEIdpJZd3Pc9DU=;
	b=0Z7HXL4dErSQLVLsyMoZIe63Mo11EmBOh3csLLgOHzz+LhnIDZt81PmP8jlfkt3gSvdi4j
	4J6Xdo4a2TR1FMqh26GAK/ZC4XVKhKlbzMnshoYYdbjF0r8TjYDq9CCk2nRhaAUKffNMq+
	1qa3Ai5RGeazgqoo1wfbxTx5+WhKju5sCRobkM1c59MxkwJr1mfAuUpXw8Llt1/ECPOolF
	vPN9OeNq4/rORlb/skFfH2A89jZkYDg3+1cJ9QUnDZb7pEWSKNakM7NG+nmTCw5FCIbolE
	wNb8F+ul6JoQqOQA7mWaPmqqocYNwq7L7woH+tAEH0Zskpepkg4iDvqcZJHAwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lJEJerT30uVZeLbMloQis7w9Ly4m8IEIdpJZd3Pc9DU=;
	b=tcc7XPlFrtUWw6TWH00NCkmrkFyHBCCHbY9mZWCx9RgB5mKOgKepQea6SWDYFecg6kHkF6
	CGKzfR0iDuD5qNBA==
Subject: [PATCH 0/3] drm: Don't use %pK through printk
Date: Wed, 18 Jun 2025 09:52:19 +0200
Message-Id: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADNwUmgC/x3MTQ5AMBBA4avIrE1Sv8VVxAIdzELJTCMScXeN5
 bd47wElYVLokgeELlY+fESWJjBvo18J2UVDbvLKlKZEIQ3CcyCH58E+kCg62bGxkzVFbdtldBD
 rU2jh+z/3w/t+klJVYGkAAAA=
X-Change-ID: 20250404-restricted-pointers-drm-87b703679fad
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=1512;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZGg7BEj9Zk6TuFkTwYnSmEoyEZPeB0NY8xBLjHfQJZY=;
 b=kxcx3RkP3c4uH68PbMFCnE5QAQ0f3j92Ut+jSaXyoSJxxZQVBSkR7GYRX5/mWdahdihpofEYG
 8RZi6sQoKLrDiKOK1mYQ4Nb450F8EfdRvHDs3bbJvRDWjQeLIbkJk1m
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.
There is still a user of %pK left, but this uses it through seq_file,
for which its usage is safe.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (3):
      drm/bridge: samsung-dsim: Don't use %pK through printk
      drm/exynos: Don't use %pK through printk
      drm/msm: Don't use %pK through printk

 drivers/gpu/drm/bridge/samsung-dsim.c       |  4 ++--
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 32 ++++++++++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++--
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 7 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
change-id: 20250404-restricted-pointers-drm-87b703679fad

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


