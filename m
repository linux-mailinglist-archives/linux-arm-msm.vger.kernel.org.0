Return-Path: <linux-arm-msm+bounces-49892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7EA4A54E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CE816CCD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667EF1DC98A;
	Fri, 28 Feb 2025 21:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEE62jSz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420D1DC04A;
	Fri, 28 Feb 2025 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779271; cv=none; b=nljX/jnkVQc38fA1KgUDZvbqU4PMUEw8FPGDkAjJKMnR+i7Xck7OdXSlhZKfDeiOBbp/rPEq74TSvMo+sysUmIUNc+LNlQ3mp3I5Pv4z2fhoDBJ1IOUUCXLHiCLT2Q8bR2SwMx9aPjDE/SxEqweoejc7sjCXa6uaeMAL8IigjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779271; c=relaxed/simple;
	bh=E8dTXEATRpIM3qJmtMmRiqbePawYIPNt+a3OVQYKFGk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SFuhmvY+SptH6yEHl+EotU9nHVl+DG2PO1voZTNiev07p4gZlunfzbAdAymxsBOps7yNel4C05eEE98O+rOmzpOPmco8m6Enn9Hyyisw0yGH9lXDzTJXtKgpvN1KXt+q8PQdhOEzsHph8q1NvNnUOXAedm3EkR4TcugsjNM0BH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEE62jSz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abb81285d33so486490566b.0;
        Fri, 28 Feb 2025 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779268; x=1741384068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=OEE62jSzjWaKUVzheB2qQ/pmX0Putkj0KYRT/UTZa+oR3NHQ67SYgacyfqaEGospVe
         gQwfmYxPzr20lenY4J01qg6h9AOuCpVYljALSN3jddLrCClwl2EX327tSG1Mn6NG3MvV
         W7/3Ai0/kmtHkMW7hofI2NeIt0je9+9P7DZOdV2V0P8/C6AGXq9bKATRthxA3rlCcv63
         9JZ2d/VF1BEKu/VSgZTzeAZY9Yr+Cp8tKmS10H6RkNU1L8b3PmwZOGhLBWe7+H0B/k8r
         WY4W4mprTD+9TP+aO+Vv/YSzBgTHbbkRbEGG75o76Akc7fPiwWILSexib4MVft1ZRx2S
         3qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779268; x=1741384068;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8CwhEspY1ms4dX4C4Y0HnOr+QSQfhHDkdgewsp42Pk=;
        b=km/4Q+gLpCZjQPN1QA7rNTsO2pwhvAuPcCt8OfXLogHjJzYlP+W2J+BM5TurkdL+0J
         CMcAoFWt8zxip5J0O81ggXIl19YdBW0/qkdWfBcEov96Q880gIhbNLGnAp5pPQ8gbn7X
         zQUZFb4ytTlN+ahCSi677y9WqVXoXx/W/7A14lmN2ScZQ9XblxMuXOwgQPhvA9gi6JeE
         ZNuSlHhIgOKUB7U+NfrYIxySKVcN0Fv6DzVvERhcXjNISY5lHQTLiFtDhxH5JgLab3CI
         fOB0H18Z5Rw5XZQrA4Qvmel9wLf1jETYYrJ+ibqVkquZezwPSnN4MPaHcMOG5vEvHpmp
         umaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnjdM9GSPX3BWsArEgtLIvr65EYu62dTFv7k2H2ngF6JS1Q+YfIrmEb31zwZdAfqBqWW2DrBa46UIHE2HQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+qpfuMx5qIHYpgCYvY8rLHBmbX7Hu8tDAzxVcT1wUDJlQdSk
	FMsovz6fo66Ah/wg9p6LhsED2izh2ipY2u6SfNdgsII393xR6D4Z
X-Gm-Gg: ASbGncuVRLD+ZCCnqU+sSl6yhpSUFqMdU3Yw6SAolNfIMNq5LWUNUatKNJfUobiF8fi
	KeB4zawzZ1VrTT2hr1Muj8d2UtEYaqlKbHHA3tHZKLfCdBJPSNVQlDUXueCzxOY77zyYxOdyjzX
	p8mKgjwM6y1S7xNEN7WrQP5+5D3gGcn5SOSEz+HzBfhDdCgKqTH4k1tWINGv+gX+DahxgC905oZ
	5JLRzthgcjp7HoiPyn2zDKO4znRHb4rYTUlAbTzL5RW3PC5KwQnROuZbRI14+V2GyOGi2rCI810
	bfbWsQevP6NMeoTTdL5HhLeo9suTssVVcmck2rX+ZB1FyImDDy9kMgk5+4IV/P3sHufeWq3xVKX
	JjfXruyDbkp3ctd45BLWrPAUsHUDI7c94ABI8zfER8G6eB5drkyVqbgUTR43PXXyfAWD7EcXdgv
	vtJKP/GtbMP0dt5CFv/Q==
X-Google-Smtp-Source: AGHT+IF+h/Li1VyE9OxDse2QjEcQlAaMcRq8CKJSdNUVXrvqPL44/VoyPNWybJjCTgD/lHb/PQPcVw==
X-Received: by 2002:a17:907:d8a:b0:ab7:b072:8481 with SMTP id a640c23a62f3a-abf265ce47bmr488214866b.45.1740779267725;
        Fri, 28 Feb 2025 13:47:47 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c0b91dcsm351095766b.21.2025.02.28.13.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:47:47 -0800 (PST)
Message-ID: <2a197fb0-322d-45bb-8fb5-0ec8d93a47f7@gmail.com>
Date: Fri, 28 Feb 2025 22:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 4/8] net: phy: micrel: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
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



