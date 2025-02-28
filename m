Return-Path: <linux-arm-msm+bounces-49891-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96838A4A549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:47:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67D5A16C01C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AF11DCB0E;
	Fri, 28 Feb 2025 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIQDKWxW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87191D9A50;
	Fri, 28 Feb 2025 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779225; cv=none; b=rnZWVZ1drWba1C5YwfAz9Kv4TNUE7cb1tqaBZO2WT1DoK83dv1RV3rt23NSi++mmnjunBkKFO9lff85N3VCgWVZRYdRku9rSBVwDEapWfInKW5+EYsgAiv77JAktGhgeXDSTkml8PdWfo5ddPAvn5221KNmVryvADNIhYGD5t3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779225; c=relaxed/simple;
	bh=uguFkPyhLHqqHy6Oa3gPcmGsNAcmpL4z+DzL8HxNyMI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VwCoUdVZ0+AL1MYzw8Oh0bWXcoGclVPjAiOr9zFnqVKjU4rByvKoIxtgs2fKspovDLNmWiMYcJvPks9ZNBprf26rDpmQDfjoz0HYqEUP/AaZ2Nwq6JO4o7dc14eK9Vb0jD88wPWeuhFmwXnQUlJlhfBOixn3eSM2XYMoCfpNxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIQDKWxW; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e05717755bso3746058a12.0;
        Fri, 28 Feb 2025 13:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779222; x=1741384022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=aIQDKWxWZnunp8lfujCD93yDHsYagLZi9PbVcByqzXCGVb8wrQ6rKZXbHO/sDW0NeS
         NbHlXQK+CyhEz8I94JiURRRDUDhI2vZULVLBmOMM2t+qRpErwSzGYY+X5qDkR+vqnB2Q
         wASDjhC/IdZ8FBVDXg0C6nZl4tbBFWaH/aXZ0kh8yAxWhY77ODOjhSxTL+5buoVqHcUM
         41x6vDTrf3JMIt7BiTSihhq+c5Dwqm8zA/yue4rvksWD4+yPJxBeGp1VnnKgglQ9uBm6
         ELgStzFP9Ms0N/hDyBAp+q2QvO/UeT2x87s4WNh+ffTJGsz/FqmSvNvROfx0Vr4XZ5To
         d7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779222; x=1741384022;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=gG2Sq8C7fElQN4qxTbRw9S1YGELX2jHkwgx2eSc86MzdgTlVRQTJUynD5lok40iwUR
         bl9vggOAHV/ETg7uEhOmga3cNPUCKN8r+fhuilLTKnp0lO0LKxomVafAfYs734RimOk6
         phMjrmKciba9R0EhtorEMj+qd/iTalUSwf1ibqrPgGJk3IQtv+dCzkVXjM1fBA95nCbh
         VBVt4X+dJTyL9cD65jFsyXUIMHDvkr5mzllUIjbzFFD4Pkr3MUUKPyxQvYR0m97H9cHa
         9Njag0+lwRKqsPPgui0c6IpYr5TRrCwSZZnN1D3/tigZMihsXrV4aIqkDXOC+VLTdNF2
         4DFw==
X-Forwarded-Encrypted: i=1; AJvYcCWXtFyAg79cE5/h0/l+MaLxSTxekGY6Hkpfi5z5462qXUEjXzjf3g8SXjK6VXH3gLubqKB9m84n2HG4Dpqt@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkqSkgAzSDw34Z5gg3uxmEZT12MKaF3GVfkrOQYnSSLKzSjQZ
	bnWypov2L7UmK5Bu24DJDS9j0VAo+5Nc5iwJJBkYl+pxK90xv+GU
X-Gm-Gg: ASbGnctjL5z1z0tjX0s5y89dcWCmL9MJd6QDuxhjSr9TtDH+bauNbk9a91LR8vMFPhO
	cQIPAzcwB/1ZoXCFqh9FJ3VEOQSiG5p5lNLuEwbeKv2hSWSDp85IBZxgqE+pEYwrLiGC55Q5/KO
	GFZtvcnQyZrePx08G2CDLkgSwR/xEBh4oOQ88ZCW9IRlVLmHXK1n6meMr6t56goaLHWw7BF5UEs
	3ZFloeHMjx/f/wufMjbnGuJJMRy8aEZG0t3cGjbnAsZV0y+F0V5cWZa1Hbb0YXJYU09FKBAyVi1
	PKwGdTQ2oO2tBnzmnMCsbrCPnv7/8cYP3xcAOGFGn/tdpmytRq7BjqpcZHpRennAxsv63cHpOVH
	fSSQ/hEZunalXxsZCfKnTx9zG/oIJyv3sNxLu1rmaMJ7bAUou8+Kzshp2J64D1kFneRk8aS9KGg
	E9EdNHzLSfOy8KwlFoxQ==
X-Google-Smtp-Source: AGHT+IExl1j4pHBwdTbidpfyZFj4T5YmQ4QIQxv+UwSzRsUopoj7fPWFY6xPxbeL8P2l/qxJQ1aoCA==
X-Received: by 2002:a17:907:96a2:b0:abe:eebf:ae54 with SMTP id a640c23a62f3a-abf25fdbdb3mr501157666b.20.1740779221688;
        Fri, 28 Feb 2025 13:47:01 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c6ee486sm356284766b.90.2025.02.28.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:47:01 -0800 (PST)
Message-ID: <fbdf85ea-81d4-4a87-9560-262edeb97468@gmail.com>
Date: Fri, 28 Feb 2025 22:48:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 3/8] net: phy: qca807x: use new phy_package_shared
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
 drivers/net/phy/qcom/qca807x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 2ad8c2586..1af6b5ead 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/sfp.h>
 
+#include "../phylib.h"
 #include "qcom.h"
 
 #define QCA807X_CHIP_CONFIGURATION				0x1f
@@ -486,13 +487,13 @@ static int qca807x_read_status(struct phy_device *phydev)
 
 static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
+	struct device_node *np = phy_package_get_node(phydev);
 	unsigned int tx_drive_strength;
 	const char *package_mode_name;
 
 	/* Default to 600mw if not defined */
-	if (of_property_read_u32(shared->np, "qcom,tx-drive-strength-milliwatt",
+	if (of_property_read_u32(np, "qcom,tx-drive-strength-milliwatt",
 				 &tx_drive_strength))
 		tx_drive_strength = 600;
 
@@ -541,7 +542,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 	}
 
 	priv->package_mode = PHY_INTERFACE_MODE_NA;
-	if (!of_property_read_string(shared->np, "qcom,package-mode",
+	if (!of_property_read_string(np, "qcom,package-mode",
 				     &package_mode_name)) {
 		if (!strcasecmp(package_mode_name,
 				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
@@ -558,8 +559,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 
 static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
 	int val, ret;
 
 	/* Make sure PHY follow PHY package mode if enforced */
@@ -708,7 +708,6 @@ static int qca807x_probe(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct qca807x_shared_priv *shared_priv;
 	struct device *dev = &phydev->mdio.dev;
-	struct phy_package_shared *shared;
 	struct qca807x_priv *priv;
 	int ret;
 
@@ -722,8 +721,7 @@ static int qca807x_probe(struct phy_device *phydev)
 			return ret;
 	}
 
-	shared = phydev->shared;
-	shared_priv = shared->priv;
+	shared_priv = phy_package_get_priv(phydev);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.48.1



