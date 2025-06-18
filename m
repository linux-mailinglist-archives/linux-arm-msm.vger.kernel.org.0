Return-Path: <linux-arm-msm+bounces-61692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF32ADE4EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81DD43BCEAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B81B27EFEF;
	Wed, 18 Jun 2025 07:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ihC9xD2Y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xnUmmzXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED5025C6EE;
	Wed, 18 Jun 2025 07:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233236; cv=none; b=qN2gLwGVxanrcj9wwoRDfwuHKlckXYyoLrEy6nQAl2xeJKHz+7BAkX3CBLZ5Z4HQAP4VgIzoI+Xu4pyTyTBumvLbbY1hc2wJcP+6VZKk8b49OGKuFgaxDhJhM6mDHWbr2JigcmU2g1dY0n14ay800pOIx4RPkBSQepBDn5onsVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233236; c=relaxed/simple;
	bh=sxPniixtv78HeENSdQLWPrFdDqTbAf0XLGgHM3Oyj5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TD4QuPArBCx098P9My+s/sH9mnLhtCTo+viAc58httkD8G4hCRY/ifjP3CTtzX0/xNBOIU3BRuuMbb1ZPuNrDJprLQ/31hZKfhwlPBMGzMo+z9oPPHYP5dot1O/wg1gRvY4QqtOnbumpzF1jJJYEPNSgQBYrnue8hfdH+ArL5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ihC9xD2Y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xnUmmzXV; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
	b=ihC9xD2YnV/u3tQk3G9UxLCeNQZZI9UEWueLGrqzdz4a+Fo+ibeY0I6tXh8ISteNqGuTnp
	d5f6rk9g3WLLeB0ZLU6/jm0CFVPFYmkIvkNZ8vm9aV9fp3iCCCRDIftIeI4t+03iLAJmrp
	JzWUziFhICj6JWcxKgnpccxPeFhJNjLgQm34E1Abh+LN45pMjaRcZ3txY9az2S90ideB72
	dYf3OgidbX4I06BPmCnZtE1Ra3Q2YzIs8wX6rL3aHP4+bc4yofrpt2KjXihDeWqbAFsjn2
	R33eRfu+NgjKjJbeCENctYbhbSHh+vuRwwXTj7xxv8p6T9iAMir3+IKWDAWbuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750233232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea8FKYQ5V9ExQA/zTt267Zd86SEpISgQvnKJKRVI550=;
	b=xnUmmzXVhHriwZoRSoBFDkHECYYOaT9HlTRjdtzDIh7/w7nYBZZqGX6gxdbZc6NkrndBzU
	Bx48dXmlRpD2s1CA==
Date: Wed, 18 Jun 2025 09:52:20 +0200
Subject: [PATCH 1/3] drm/bridge: samsung-dsim: Don't use %pK through printk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-restricted-pointers-drm-v1-1-781e0d88cd92@linutronix.de>
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750233231; l=1738;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=sxPniixtv78HeENSdQLWPrFdDqTbAf0XLGgHM3Oyj5Y=;
 b=RmDVzVHrOK1/SRUIDkyh36blgd1I1AzXaNihza4YNvCLRnV1ypxUVsnr+7ZnFeqfJyKQjBlaR
 swO4I8KwM5eAqqFfdOZbGNwyvmlyZBFYBpQxTDAHDI02JzdhKDJuzIY
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

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..bccc88d2594840647d7107c13d69104912087384 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1095,7 +1095,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 	bool first = !xfer->tx_done;
 	u32 reg;
 
-	dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\n",
+	dev_dbg(dev, "< xfer %p: tx len %u, done %u, rx len %u, done %u\n",
 		xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done);
 
 	if (length > DSI_TX_FIFO_SIZE)
@@ -1293,7 +1293,7 @@ static bool samsung_dsim_transfer_finish(struct samsung_dsim *dsi)
 	spin_unlock_irqrestore(&dsi->transfer_lock, flags);
 
 	dev_dbg(dsi->dev,
-		"> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
+		"> xfer %p, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
 		xfer, xfer->packet.payload_length, xfer->tx_done, xfer->rx_len,
 		xfer->rx_done);
 

-- 
2.49.0


