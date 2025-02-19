Return-Path: <linux-arm-msm+bounces-48565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD51A3CB0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F5697A9CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFCC257433;
	Wed, 19 Feb 2025 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSIZ9CC7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D6E257452;
	Wed, 19 Feb 2025 21:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999174; cv=none; b=aDyoA34rpoMuC+VG5xbSm/AruiBMuDxIAYYkUb1oK1+2FhDsUISsop1YAa+3JrU6ZSIRRAMTgyXu/9BgfwSC+qTJLgXSuU6ch0hx7d/hybKQrNYP5PskRnBq7qz79qBoK8wKR24BSiSoiY4at3AiB3vXvHw6mKHS7PZc+MZfTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999174; c=relaxed/simple;
	bh=DEd9YDMcRs++3m+nIPwOpi2GEVrjgaqZav5MBaBjFjU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ISLJXroF3O1yw/bChxDyG0q3cUdj8K1ZWhY7zY6wOR5vYOtKsnIO0Mcz/DwUEkzKLAzrtg8o+EqRz+8fChJe8pXebA5C0E7zEmT0UJnLZnaZ63ywF0mIkZkC3zp+WGp8HS2YdCyhscqtjA3wesQJ5CrgwxZRovp5hj7oimYYxV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSIZ9CC7; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so40297866b.3;
        Wed, 19 Feb 2025 13:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999171; x=1740603971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VbZmcot8Eg1esviTkY9r0HKtYQa8aOZEhqkLR6boS78=;
        b=kSIZ9CC7OpwguiejXtIoyJ8KL0g4Nx4/Tjucjtqgom6OWs42PiY1lN0QD9WPrdZqTI
         DkdXrJXlfHOIKDDGCnvY5VrGO33sOvUmmpxaHuW8UImwp7eBjmmiWNwYkp4kL4nqzJiO
         qixBZ+rI8wDRBi5FTiBt1FfkOlJyiOfuqc9cTuTZztfU07OGGulrRkuJme/p/g/Y8ReU
         qdiWEeGcYUriJIZbApy3hd9fRcf3UDHuTcqfSWbhbO3E6FEgamLtNtO6F7zPaDnqlgge
         93UYPtyt5Udvz1npVyvnTwvrfearn6A+IMaf7WfupT4RKBAfc8O9ZtrGsHvdReuJSMbn
         ZXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999171; x=1740603971;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbZmcot8Eg1esviTkY9r0HKtYQa8aOZEhqkLR6boS78=;
        b=rTg5w36f4T7J8aX2c4B5wlWzKWsRH4B8ovFVc+SyoxURrRURX8bP5ppbghkn+nSPzp
         0A4/WYv5UO9QcwjJJZCHq9fv/ciQYpTMtpvfE2kU0pIHXwy4/roLmZnpt96c7+sfrBp9
         AjiT2n2soEVP0hKM8rEzW00pQONL6lUo5G9Cg46tykCrwO542bZjocOrg0VOqj8Hr7l+
         tzafVCqKh3t4yqiwB6KqGXZWBX+/cIkv0CECIyJk7dPU4swEzt6X2IXWtNGXddoNEkB4
         0HKvWizUWJV1YMpeVAcwxGU9cD3hsMSaqs6eWpZC5AXKynT6ko5XsAg//xlQyxCMlCCs
         Hlww==
X-Forwarded-Encrypted: i=1; AJvYcCVPeFBT3euhfKyfReQcsEJky2dTGzevii+bxtm3p0JHvUbrgbk/TGwHdZ3xE0lhUp/s7JCpYD4smX78o7+o@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+iejFlBq+vdoP9BzECVTR60CXXhba19S+BTQRJ1WDDwsePwd4
	su/naGe3Tn1w+rpEvQP3xYlte6wMiiETixjZfXGNTs1ZA2Orr45j
X-Gm-Gg: ASbGnct43d8epoz0n6mjKnj1N19Td9mkkAEQv4Jv11uuGpumleWQqsH3SoAvisrv12X
	Z9Hc2Ste6jz86yy1ygWpYznATbUjkpLWLy/I9j2WSvAGa79tmcs9oi9ECVdoAVo7aqIf+pA0Yct
	nlZlg1WQWtFEg3ibwqgORLBLFle8pJalLV+HQ76VKD2We6r0rkkJlR3uXPco3UEp3ByB9azcOqY
	BgpmkAAVLVf/fWqKf9TilThXqCzf2T2/CrnaJxD7piuf4ykxhaDtNO1aVK/jcLT3R1v0sd4fqK1
	cku027XrFdnMUI/3stkQzUiNAPKwnefKAfWw1bBk7WHsjwVBgJdhutCIug6nf5RaU/KsvNb3Y24
	ypYTapiJC+ucV1EMCnJA253+FCQO+EwsaF/MyL+/1n7zwdl40zR1RsG6632a0ya6Q+pP6yGH8zX
	0j5hgtWMM=
X-Google-Smtp-Source: AGHT+IHjndRED0hE6QMhUpOfvHONTajTDrwGIQ97O3LRboYxeIOv3iux1jtAZ5e2Nn+9QtnWU2VtqQ==
X-Received: by 2002:a17:907:60d6:b0:ab7:f0fa:1340 with SMTP id a640c23a62f3a-abbcd0b2d3dmr580914866b.50.1739999170486;
        Wed, 19 Feb 2025 13:06:10 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb989d89edsm681114166b.81.2025.02.19.13.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:06:09 -0800 (PST)
Message-ID: <bbf97a74-c601-4eff-a302-15f5d525f85e@gmail.com>
Date: Wed, 19 Feb 2025 22:06:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 6/8] net: phy: mtk-ge-soc: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index bdf99b327..c3ed97937 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1190,9 +1190,11 @@ static int mt798x_phy_led_hw_control_set(struct phy_device *phydev, u8 index,
 
 static bool mt7988_phy_led_get_polarity(struct phy_device *phydev, int led_num)
 {
-	struct mtk_socphy_shared *priv = phydev->shared->priv;
+	struct mtk_socphy_shared *priv;
 	u32 polarities;
 
+	priv = phy_package_shared_get_priv(phydev);
+
 	if (led_num == 0)
 		polarities = ~(priv->boottrap);
 	else
@@ -1229,11 +1231,13 @@ static int mt7988_phy_fix_leds_polarities(struct phy_device *phydev)
 static int mt7988_phy_probe_shared(struct phy_device *phydev)
 {
 	struct device_node *np = dev_of_node(&phydev->mdio.bus->dev);
-	struct mtk_socphy_shared *shared = phydev->shared->priv;
+	struct mtk_socphy_shared *shared;
 	struct regmap *regmap;
 	u32 reg;
 	int ret;
 
+	shared = phy_package_shared_get_priv(phydev);
+
 	/* The LED0 of the 4 PHYs in MT7988 are wired to SoC pins LED_A, LED_B,
 	 * LED_C and LED_D respectively. At the same time those pins are used to
 	 * bootstrap configuration of the reference clock source (LED_A),
@@ -1280,7 +1284,7 @@ static int mt7988_phy_probe(struct phy_device *phydev)
 			return err;
 	}
 
-	shared = phydev->shared->priv;
+	shared = phy_package_shared_get_priv(phydev);
 	priv = &shared->priv[phydev->mdio.addr];
 
 	phydev->priv = priv;
-- 
2.48.1



