Return-Path: <linux-arm-msm+bounces-50053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC0A4CC90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8456189200C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E831E9B3B;
	Mon,  3 Mar 2025 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBybF9oL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09AC2B9AA;
	Mon,  3 Mar 2025 20:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032974; cv=none; b=KjkxXUYjchoBA8mlw3uKui/exstooWiinuvVt0XNdAFMdQ56W6EZn1eUARfDLZ2YDHTh8X28ZzoURkw01hpROxjW7Hme9rRB+BoVxFbJyqfCbzaFd8jepH832qJXZfGTlV2BYb34rt6rzdA7gDhERfLhpJGGofjuG/VruBOAv3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032974; c=relaxed/simple;
	bh=nGdrqzmYBWLlIyKySsbXmwHw//4YoXKMbTDVFXoHdSU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pk3moM1zTqrq76I+q3u3c9y7c6b1aYZTpax1Qj4tUzqx5mt9vopuZeCf1JDR3UcafMDxcGdH8/Naj3oU2SXXSJIw/1slZZI8sXYg+122JPpR8umImiVSqTjbRZSsUWN/mjjP+isfwOCVjuDvtoh3oaJVqz2myQEBwVL8RkWrIiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBybF9oL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so33591745e9.0;
        Mon, 03 Mar 2025 12:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032971; x=1741637771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=BBybF9oLFoRaPl/JCsr0C9h+Q0mXuhOnaaNpJ9s2acs5I0pJUD00XBVDB2ip9u4YLD
         Ur0lW5lFr26i/UPV6YpEI8WDGDaTxxWT2qbEB7DDYzNRa4IjEjeXc6FJ+NWa/pTUEam7
         M8F2qe/turouL1ospDCaIGTZt58NC4DguNVGGLw2B8MKfR7nMZSU0T+uCfXNi/kt41V+
         gyhC9QP9yqjitQp9sOLupNncE6tXDzyWggdncsM3im3Jmu8eXUGuTIqMalYQacV2yqKT
         193komzYmBlIxk/tbT5wRxaahrAckKu3qaxEO3tdlzXubGC/kvYKScLN+lPMJC9q4Wl0
         n3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032971; x=1741637771;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdFnhhzQEC3jcbLOShIpWKd9ImN69zhVCCxS6xvU9/c=;
        b=XN6NbMuzA/+Y9rGEoX4GclCl4ObiWshwxW5ZV9ZzDQeTz7ODg/ilAAAANqt+JHI8XR
         6mITbz1395/LUj4HFVIVaoQTxfxsFvMRq5Mw8xcGvFngSt7EU+f8CCO+jb0SFhpwSEB6
         Qpr6KXmoQFRl4XA1aqjgJ1f8Vycwb+OEvYutu0AKyEqh8cL3YVahpFGvjKJwUgmmA+Uk
         mBEWLaJPOwYVFDlmTvunQ4wNt9uWe8P7GRaXYhQRL+bD4AEnB18brPqU6tO30OY8voBC
         tpb2ukhkI0LRcOG3zGKqaprDnNSTrgLEGPjOuKhl2NzJdgkFcDuWwtqo5NmflJce/pKb
         hgZw==
X-Forwarded-Encrypted: i=1; AJvYcCUBhgbrf/LGlwrT2jwfFGO8dKoUKH5A7wX2Ds4s997lwIQZgWZUBQ4CXoRz2uGxJGijNQiK3jfBZXfHwQ/L@vger.kernel.org
X-Gm-Message-State: AOJu0YxPoMSm2SNpPwP+60/d7ClM7+iVoQ1u06SiXV8/kEHER3oHgwAk
	f76ovuLjYORBrPY0r8VDKv+JM00/mettLiCxlk0f8CCOs7CQh00B
X-Gm-Gg: ASbGncsazoEK3Sy6m+IUMb9Dl9DwgU3AnnTMfzCYrl6QHAL1MJyR0R20jgx0xdOZXsk
	YB9901M0VLPcmsQUpK6b968VtLb+jTZ9v5hxoBlk7HktW8BLLBJNwwjHCDpywVrI7KbpwNFFNsG
	Bu0d4n7zRzUz7YtX/LDsmVxtUT7dECEfjBPIfTlNkn83PM2kNbLiCNmTc7PouBDysOy7FocA20Q
	nohdvb6NpzY6SwoFD41hDsyc98Q2uV1PO4ukOsbFxe20yZkzFBRGbjsnQNPLdjQfptxzxPIKPVL
	29Xo6pIVkaKvaZ1DBo7Sxrvd/uwugu1u+L374STcJVUZTYFRXtPP9Br2NrYUDMWPSWYUZ248M83
	08qGooBinuIvjrLXHwzYyCobkFLed6zhpjS7wl8MDVp+Kpn3n+0Nfcajqxm4JFnZUaEkMHheOY2
	Ln2DQFEP/Xc2Rvn+2GAqfRIsUzUa4GB97mynMS
X-Google-Smtp-Source: AGHT+IE2WHAI9Q8sks+u+Vw+VXj4T+Qkt+LLg37+CNMS2AGJxGA7jj3GmrVP3i4Ky1U1Op3SUJLNxA==
X-Received: by 2002:a05:600c:a48:b0:439:a1c7:7b2d with SMTP id 5b1f17b1804b1-43ba66da31fmr116087725e9.4.1741032971032;
        Mon, 03 Mar 2025 12:16:11 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e479652dsm15729733f8f.16.2025.03.03.12.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:16:10 -0800 (PST)
Message-ID: <356a257f-68d0-47bc-a474-4dafaeaa149f@gmail.com>
Date: Mon, 3 Mar 2025 21:17:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 5/8] net: phy: mediatek: use new
 phy_package_shared getters
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
 drivers/net/phy/mediatek/mtk-ge-soc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 9de6fbb45..175cf5239 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -8,6 +8,7 @@
 #include <linux/phy.h>
 #include <linux/regmap.h>
 
+#include "../phylib.h"
 #include "mtk.h"
 
 #define MTK_GPHY_ID_MT7981			0x03a29461
@@ -1278,7 +1279,7 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
-	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	struct mtk_socphy_shared *priv = phy_package_get_priv(phydev);
 	u32 polarities;
 
 	if (led_num == 0)
@@ -1317,7 +1318,7 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
-	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct mtk_socphy_shared *shared = phy_package_get_priv(phydev);
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
@@ -1368,7 +1369,7 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 			return err;
 	}
 
-	shared = phydev->shared->priv;
+	shared = phy_package_get_priv(phydev);
 	priv = &shared->priv[phydev->mdio.addr];
 
 	phydev->priv = priv;
-- 
2.48.1



