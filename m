Return-Path: <linux-arm-msm+bounces-48563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E5A3CAE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:08:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF9C16BF31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA672254AFC;
	Wed, 19 Feb 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eij/UqWl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4D22D7B0;
	Wed, 19 Feb 2025 21:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999099; cv=none; b=NS+qJO7iFE2TrK5Mw8yAbEFaeybe/+YpR0HaqwTKPvZ59vi4Yzkj2o9hTzCzFMogCQIHrXVQAS3nBPkL9OPsTfvs9Ubtf42osq9amlbVnvj6N0HuRZcv3VguHvVKiTomX9i38MWfHY5Gzh0/W1KGxTpx9WbPKObExnuF8ebSVIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999099; c=relaxed/simple;
	bh=1TPzBnhc1OecM3+8ZD5IznmARcHJ24bRQsRNBMLaASA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QUJJKJykgnMJufGyPb3lu2zqXC+DlpiuVCTyiLyqgUcg2O2p77zyS6vbUE7FQeAWWbm/fJfiHt3EU00c4EKToR8WbT/Chv6FN06sCHT70cEWZb8IMp2oYu2hlHSUPWAZrCRVSQtTiiIVSryNgo5cw2mliVXRaxX2kR3B2LyFjSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eij/UqWl; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso258786a12.0;
        Wed, 19 Feb 2025 13:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999096; x=1740603896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GiTWRCXPfGh0fvzoJCbCAJqFe3jBL0Wxwym2QoHrDh4=;
        b=Eij/UqWlvIu+pO0tSc24c/7Ega3bCnwN6wFENbsj/f6+2sxV2LAvs1gKsFfKj/yqJ+
         CbP9ucLCmNWKa15/KadqODOjesxrWN7hnl/dJWpiCTVrjN7tb+w6mlid3/ik6Ep6ee4J
         fjatzGMRVQPMLFNRhX3RMbLp63fgB9f1SKmZ3EVNk1GTJ5LxB/JYAaNiVb4/icTr+gmO
         gvhxuSCjpC3+B0e0RGiHAuWiZEaDZtHtIINQ+uoqLKLub991N68LgCOkkm4vY03tV+yn
         4YGRAQcv/yyuFmrfg9dEwsN1bgw5Z3nshkDX0zQYxgwDqEQAzCygNw0cMi+77RC3yKgF
         7hVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999096; x=1740603896;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiTWRCXPfGh0fvzoJCbCAJqFe3jBL0Wxwym2QoHrDh4=;
        b=rAjLRu32t3gX8fvUen6eSGqM84Eg3E0YTJih9Y3zAhmkOxZQbl7Rzv6onWUktHUZ/q
         i56qd6tFmY29VCltd6EY8Eq/Ckwivj1kMnObRX3tHpL9l+PXcUWsXw5Khq598eYgtT85
         UwEWoPGIxkmeL73shHlHG0/nEug32H5dXpp+wFwLWsfAug/SdsmhwH41ANZvNA5aWzI2
         GhJ72hx2EtjClriqilbN6zIuvd35DuQ1HyoWqTzkCxV8huG9A/coOT4A83teWU9KMKu4
         0p8HsdeapjwVA28PiJtvwBGuW84GI+Te9xz/xfQW6fItoxgSemZshzuHfzwO6WhWw9Kf
         zA2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1+fNv13LLX14lGDZJMotYjerLFKSvEWyDyrC4JQlqMhw10cawDC9ocxGAp6MwjU85LshtcRuepZHorga1@vger.kernel.org
X-Gm-Message-State: AOJu0YwsEhpUlJnqwyOfw+4hpqhVD3Z5G9dhjfo7KQ3lcKRE32ZPxKqE
	4p23V30iDXK+3W+Qr8+/vLMdSJSThRtA6kxt/xrRDceQcELCmpPx
X-Gm-Gg: ASbGncsr4VNU0S2MObiaAM/8YU94xWQVMU7gnjsv/0akE0F1A6BDaXI90bSz4vQrqjO
	WvlNrtib1gQ37Q9ymlfNjN0i9ei1r4Axr0g2HxM61DsVLVnS2N5ssNZ4txW6mrU4KkHGFPXvYzA
	Ouj0OIju89w5wRe8CEehlaZe1dUBG0f5kgPjqowmuLKK2C5bgI23Y8moKSs2hi/zC0O+pCnN878
	UYFQV0TZL83XDiwyZhVIyuj4UGbNvdfk3GqpuwculClbLoINpftoagff+nBSMb1leVpMM4Fdg7n
	L24l2kUOE4rOjpkpw+Bei8/0y0mWx4uRmsrFzXoBmIs2SQHzBpRl57kGUDDqM2q5Sb372XiTrmS
	yZZ3YYJk7WAFVateDft1cjQlbFFxKyHGpy6ORQf6b2ecfbZWYnwSPVg7BQfNh/W/cjKE0JTlOkD
	I+jU445VE=
X-Google-Smtp-Source: AGHT+IFyKOOMZb6wpbyno6frA69nV7SUos/bcpq7j+SraqaFZMIw/K6fhb0FJEMjWn3bcFmK4tXrWQ==
X-Received: by 2002:a05:6402:a001:b0:5e0:4c2d:b81c with SMTP id 4fb4d7f45d1cf-5e04c2db9demr13366555a12.31.1739999096078;
        Wed, 19 Feb 2025 13:04:56 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3624sm11220121a12.40.2025.02.19.13.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:04:54 -0800 (PST)
Message-ID: <3cfe65f4-1314-4e2b-8d2f-1af8c250ca6b@gmail.com>
Date: Wed, 19 Feb 2025 22:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 4/8] net: phy: qca807x: use new phy_package_shared
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
 drivers/net/phy/qcom/qca807x.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 3279de857..297086828 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -486,13 +486,16 @@ static int qca807x_read_status(struct phy_device *phydev)
 
 static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv;
 	unsigned int tx_drive_strength;
 	const char *package_mode_name;
+	struct device_node *np;
+
+	priv = phy_package_shared_get_priv(phydev);
+	np = phy_package_shared_get_node(phydev);
 
 	/* Default to 600mw if not defined */
-	if (of_property_read_u32(shared->np, "qcom,tx-drive-strength-milliwatt",
+	if (of_property_read_u32(np, "qcom,tx-drive-strength-milliwatt",
 				 &tx_drive_strength))
 		tx_drive_strength = 600;
 
@@ -541,7 +544,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 	}
 
 	priv->package_mode = PHY_INTERFACE_MODE_NA;
-	if (!of_property_read_string(shared->np, "qcom,package-mode",
+	if (!of_property_read_string(np, "qcom,package-mode",
 				     &package_mode_name)) {
 		if (!strcasecmp(package_mode_name,
 				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
@@ -558,10 +561,11 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 
 static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv;
 	int val, ret;
 
+	priv = phy_package_shared_get_priv(phydev);
+
 	/* Make sure PHY follow PHY package mode if enforced */
 	if (priv->package_mode != PHY_INTERFACE_MODE_NA &&
 	    phydev->interface != priv->package_mode)
@@ -708,7 +712,6 @@ static int qca807x_probe(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct qca807x_shared_priv *shared_priv;
 	struct device *dev = &phydev->mdio.dev;
-	struct phy_package_shared *shared;
 	struct qca807x_priv *priv;
 	int ret;
 
@@ -722,8 +725,7 @@ static int qca807x_probe(struct phy_device *phydev)
 			return ret;
 	}
 
-	shared = phydev->shared;
-	shared_priv = shared->priv;
+	shared_priv = phy_package_shared_get_priv(phydev);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.48.1



