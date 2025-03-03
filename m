Return-Path: <linux-arm-msm+bounces-50052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF19A4CC8F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ACD97A73CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DABC1EB1B8;
	Mon,  3 Mar 2025 20:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qu/mlhcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6721E5B9B;
	Mon,  3 Mar 2025 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032939; cv=none; b=NuEqOlNI9BlkrE34q3OZ9T9ijT1PlQqEfQIcxgcWnXoKJ56Ly4LT9k3TqjjWIo/ndZ5JjXPxKbWpggNY9PmZU3nnVTTbvQmkYDo3AcSt14iyYzXgFklgwlPXAOndonDzDtfwjfythoU7g0w8XxKpdHuTFGwqFH3dCzNSqxEE+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032939; c=relaxed/simple;
	bh=E8dTXEATRpIM3qJmtMmRiqbePawYIPNt+a3OVQYKFGk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RPmf8E1/apYd9V/MEAUlaPNXlGcIwsuD390CnGjkyAfRvTi8d8zxuPhG4AbUCsHUCigKWDJMZmvhoXV6XlYlxIsVbUHkUwM5nkASUuxdKkcdUm+l3bYpPVk3U3LRgEYgmIpp4vDm64cwZ9zncGQdeX6P8F4iyfVeVQWQZ7lUwvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qu/mlhcY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43996e95114so33414585e9.3;
        Mon, 03 Mar 2025 12:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032936; x=1741637736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=Qu/mlhcYSVpBCzn2meORu0oiOvXusoXDtnwyzy7bYpHtOdTDvzbt8wwxs821YlcWO/
         fntEfaBtMxEKsZM2DFXnwLU1nbmcS/zD6euNLMl61dAJO1xYNgVTXa55GpqGe6HmgxOr
         C70IUaJGVArYvmD+3spV7KoGRl2P0dnOFVKG5+1Tnx5g1A5jqa8Ow8+egimrNWyxeO+i
         l5DH917JevEnCGsav5QihQDZd+CpzDmiO1ThbwxXNhrh5To8GMqfllD0QcCc9tx3kqQi
         OldZk2YUowou6LsXTmDgtjloXxmVv2DK5R4sOg/B7ZDGMAhkZyOEQQ+7I9MTt2tUVKLD
         LGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032936; x=1741637736;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=B6zxl8QdH/D5qRhotXYFyZK9lKUwSkP5i44KBtXcqAgycvD0rjSd6TJtWrPjQxS3PP
         5ZvAexjtPvs3RS9C5+90u9mgZZi2BHwuHnYLWe6ljwEnijfIIcKbFeL3Gyh2gcHuItCP
         WOROb8/tP2wJgALCqsC6CSgs8GAX8GxQo2g8Alh2RzWmQ+Yf6pVFFJJlolXAx8fw8Oho
         VDUe6D4EN7b0Xdm4d33dxi5F7STZA6RJBzppGbPazP1qn60XNUaMlQWXhnh2gI5//UiP
         PisbOkxNZpNd3eghNyNz0zTN1mTbLqdKzbDU4eycmSR+KSRkV8405FvuA4RFFpUgOmdH
         lE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWA6Fzms0JtwPOrW3eunNmkOaZrVNaZhQPf8ZljnPBcbVocMFNmuNuWiilfWTZnV/myYXRGiATOE6Ac5JyF@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoP1UarCwfJ6uUKGz6BYyokpGNEwnknBa+IoW71mHqtb1wd3o
	vFRSJ99LG69SNW7cdMcGB3uhC7jh63Uk2deLGVuRYKCxhtLZEZDz
X-Gm-Gg: ASbGncuJi1DADUYcLXiHZGJRSj9NFpTKJWR0vRijKP+CvaecCQm4cAvXWL8RwAmM0Ed
	cofKHcWye3BITIHbD8TBNzt0xPuQCkKwJwFEm6+vf6tZfdn2ZcbPxjzID2JcNSKAG9U7oos8pbY
	CBHR3zm+HrM+IvAgsaWXlkzAQDimkTL7ppTNYMjoAN9rsvMo+VfsOu0lUtXMsGSrxQUyTSzhvXJ
	joXruTMKGG3pQjNZl1w+fpD95VKRCB/mArHIBboeVM/LufUaN7kCU+L5k9wr3WNphXAMyyPuRBg
	eSbx3c6ht9iBpUddErTHZ46fzwxyMm5ahQEJ65QOeX1mtLAsZi/ewlJM+8qlrCNn/8atovgrOn3
	xqPL41uQRsabLP9vzfoedr10rViR2xaFRaYmPRT2tJii6gkwyco9Nh+6COK6d+g/ltqCFtgM1nl
	I6yp3iXU4cM2GHj/TXnRjA/3AMHzlB9aZzxy6I
X-Google-Smtp-Source: AGHT+IH/IMfNtCuqQ2FJviAs1RgK/Rd4Cju6cry5jC/Lm8SLZoUPe2Kvod2T7FUr3N/bfh6mPLBhTQ==
X-Received: by 2002:a05:6000:1788:b0:391:10f9:f3a6 with SMTP id ffacd0b85a97d-39110f9f4c1mr3262340f8f.34.1741032935649;
        Mon, 03 Mar 2025 12:15:35 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e47a6a87sm15659695f8f.32.2025.03.03.12.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:15:35 -0800 (PST)
Message-ID: <18e5d29e-fb96-4771-92e4-689e0c992177@gmail.com>
Date: Mon, 3 Mar 2025 21:16:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 4/8] net: phy: micrel: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/micrel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 9c0b1c229..289e1d56a 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -34,6 +34,8 @@
 #include <linux/net_tstamp.h>
 #include <linux/gpio/consumer.h>
 
+#include "phylib.h"
+
 /* Operation Mode Strap Override */
 #define MII_KSZPHY_OMSO				0x16
 #define KSZPHY_OMSO_FACTORY_TEST		BIT(15)
@@ -2631,8 +2633,7 @@ static void lan8814_ptp_tx_ts_get(struct phy_device *phydev,
 static int lan8814_ts_info(struct mii_timestamper *mii_ts, struct kernel_ethtool_ts_info *info)
 {
 	struct kszphy_ptp_priv *ptp_priv = container_of(mii_ts, struct kszphy_ptp_priv, mii_ts);
-	struct phy_device *phydev = ptp_priv->phydev;
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(ptp_priv->phydev);
 
 	info->so_timestamping = SOF_TIMESTAMPING_TX_HARDWARE |
 				SOF_TIMESTAMPING_RX_HARDWARE |
@@ -3653,7 +3654,7 @@ static int lan8814_gpio_process_cap(struct lan8814_shared_priv *shared)
 
 static int lan8814_handle_gpio_interrupt(struct phy_device *phydev, u16 status)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(phydev);
 	int ret;
 
 	mutex_lock(&shared->shared_lock);
@@ -3864,7 +3865,7 @@ static void lan8814_ptp_init(struct phy_device *phydev)
 
 static int lan8814_ptp_probe_once(struct phy_device *phydev)
 {
-	struct lan8814_shared_priv *shared = phydev->shared->priv;
+	struct lan8814_shared_priv *shared = phy_package_get_priv(phydev);
 
 	/* Initialise shared lock for clock*/
 	mutex_init(&shared->shared_lock);
-- 
2.48.1



