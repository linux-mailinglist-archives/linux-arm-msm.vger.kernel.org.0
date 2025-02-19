Return-Path: <linux-arm-msm+bounces-48567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AACA3CB13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D223BCA8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3E3253F17;
	Wed, 19 Feb 2025 21:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaS6MF5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BB2580E9;
	Wed, 19 Feb 2025 21:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999263; cv=none; b=C7DUnnVRbS/uzq/plMyvJWb1fnNiV+jPb/CK02oj43Zw0Nt30uPAiJLBVtAy+q2z1XWbK8vgyO5H6QJ5Vp1eaEMxP7gtjHWqsPhq/zkaMOYGXvZlr5YkT0UzjhEU8CyGgso/y9ATLl6qVYb3rTj5jIwRaWsYiD8K/dMXuXZkF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999263; c=relaxed/simple;
	bh=lH83m2PlgoWL6lW/rICrPt6YcXYpHWk21xlAGO+T/1o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eaJt4Hl+iZlCagTxQtnui5wL+bZGDINkEot5f7Zu/XcgALZdcOpO76nbA9vhOv0g4+oJoL7Atkt7uCdlGDxcLsglWJz37XLimnhDIbdcU1nRVOg3/irz2Nn4jTKcS5/7rV4qRFgEQU68OVeTviD+oenRvll0Jmq3B2+6QX7zOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaS6MF5v; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaeec07b705so43315866b.2;
        Wed, 19 Feb 2025 13:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999259; x=1740604059; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QZs3YbRvN8DNt3197H8da0uczE1W96IyWr4w3SXE9jo=;
        b=KaS6MF5vtUpPWZM2UW7GR1J+Z0JkjxpIrwi9sjHUB5tio3PiVDUhrYtbR4m1MmN7B2
         JoHFiD4yCGGYBpVp9mDbLSCb/SSAT/QTbb+lH3AOu5Je4+GqKGWhYy2/cZ7ZqE9Jn1h9
         LbhDcyjOuqW54L7D2HSz6XbhcHFqw4htKdX72uNEMTkh2Y56iUxwC2/PlU3E/DEjFElw
         cmxlAsbZ6b+yrQN+erZc/s2YOu5/7EBWULRl7E9BmGdlUsLTCX8/+2iWvqvM+Wl7BMr0
         JNUITl7ykj3wQfQFfHv02lSjCYImPHHy7jUzSZEm7rsKmEJy/nig2xNJR2hYBXoDQwDT
         HT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999259; x=1740604059;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZs3YbRvN8DNt3197H8da0uczE1W96IyWr4w3SXE9jo=;
        b=ojgZRY8i2B0S9d7q7c6D/A2+shfv405Oj7GqSxx2i2dA9LSQcFtOa3LYL/5zdgYrVw
         u+C8dSxPCz8vHcypm2z8EjlIsm9fftwlxHWn8e8M9hAFq1avj9Znb9Yhl5sSmv6Rx92d
         rmfWWP97XG4ktwlnubh2lnwi6XIpZwOMv7bn+0a4XLyrZ9hjYQezbUV2L+gZULVR27uu
         DHi8P1fNvMlLcjighNbWVIXVV+1ToO5JH754LJyzi6GAp8r9YaptkTcnac73OcrrpmTi
         XUE7IN9lGvywEG1boBuQRspGMu/tp2B7k0gHVfrnrIf70irpzymn/tgHwW8iKoQFR4P7
         7Y0w==
X-Forwarded-Encrypted: i=1; AJvYcCVQW69EaROJPt8f19G18Tp/0Sumuma+UeKDR2xTzpmkp66U69IwR0lYrjOrZeN1wJuOvIpgcdUnbh7hK0Lu@vger.kernel.org
X-Gm-Message-State: AOJu0YxR1xQlTBdOHHTorL6UDiTH8HpYFFvu1vC4PjWHoxA5O2jMMm0q
	QKW95UmcSbOSVmrV1TN8TlrRm+ore0IkEo4gaXV3wpkviEmvF715
X-Gm-Gg: ASbGnctMflSG6p6CaJkmsDBHHjSP5HvG7PGxyyKwfjK9gd1oW4KTtLhvah2Su5YROK4
	wlLZibloEaw4sL7J50lytROo/TBfFy4XdDqMJc3HyzAdqA6DdWktIDna6sFu/cWjrPRNiMsVAGr
	FdRd5QfgoP8A+5W2IdVVT/6802W4L93WQeS5kDTvyrg8K3sMkUy2qAqc6mAab/laGOXZQEMC4/f
	LJZzBpJjs/hlRqMXUpX4pH8GmkwwA910woL3enMOO1qr3/VKP4dBAUi0ggtsQegh/EXBTFP9UQm
	84uUreE7iL6qCHDbTuO2D92gwAMqPhQrWqX0A0mvjJrpeGaE1b3+rmCNLxu3rhKiOvov+7am+PS
	yLwPQOlgOL6iJ9wBQI3B83T0tXuumLIDyIke4mpeemzznz/iI+SzwjYz/DyiLdH7tVdB22oJMHC
	p8Woyb7E0=
X-Google-Smtp-Source: AGHT+IFB8TbXEW8oyxCMw5I9hPAsJ5x8xBIRsmTCx+D4bgFcD07BpYfc68ij8nWfwZBgDBmj8kWcvA==
X-Received: by 2002:a17:906:c154:b0:ab8:95f8:b5e4 with SMTP id a640c23a62f3a-abb70d943c3mr2292970066b.41.1739999259305;
        Wed, 19 Feb 2025 13:07:39 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb8eea4d65sm762573866b.161.2025.02.19.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:07:38 -0800 (PST)
Message-ID: <ee5947e6-9bf0-4c69-a014-57fb0da015cd@gmail.com>
Date: Wed, 19 Feb 2025 22:08:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 8/8] net: phy: make struct phy_package_shared private
 to phylib
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

Move definition of struct phy_package_shared to phy_package.c to
make it private to phylib.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 31 +++++++++++++++++++++++++++++++
 include/linux/phy.h           | 31 -------------------------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 6955b4132..a8c3f26d2 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,37 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+/**
+ * struct phy_package_shared - Shared information in PHY packages
+ * @base_addr: Base PHY address of PHY package used to combine PHYs
+ *   in one package and for offset calculation of phy_package_read/write
+ * @np: Pointer to the Device Node if PHY package defined in DT
+ * @refcnt: Number of PHYs connected to this shared data
+ * @flags: Initialization of PHY package
+ * @priv_size: Size of the shared private data @priv
+ * @priv: Driver private data shared across a PHY package
+ *
+ * Represents a shared structure between different phydev's in the same
+ * package, for example a quad PHY. See phy_package_join() and
+ * phy_package_leave().
+ */
+struct phy_package_shared {
+	u8 base_addr;
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
+	refcount_t refcnt;
+	unsigned long flags;
+	size_t priv_size;
+
+	/* private data pointer */
+	/* note that this pointer is shared between different phydevs and
+	 * the user has to take care of appropriate locking. It is allocated
+	 * and freed automatically by phy_package_join() and
+	 * phy_package_leave().
+	 */
+	void *priv;
+};
+
 struct device_node *phy_package_shared_get_node(struct phy_device *phydev)
 {
 	return phydev->shared->np;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index ce591307a..3008f31de 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -322,37 +322,6 @@ struct mdio_bus_stats {
 	struct u64_stats_sync syncp;
 };
 
-/**
- * struct phy_package_shared - Shared information in PHY packages
- * @base_addr: Base PHY address of PHY package used to combine PHYs
- *   in one package and for offset calculation of phy_package_read/write
- * @np: Pointer to the Device Node if PHY package defined in DT
- * @refcnt: Number of PHYs connected to this shared data
- * @flags: Initialization of PHY package
- * @priv_size: Size of the shared private data @priv
- * @priv: Driver private data shared across a PHY package
- *
- * Represents a shared structure between different phydev's in the same
- * package, for example a quad PHY. See phy_package_join() and
- * phy_package_leave().
- */
-struct phy_package_shared {
-	u8 base_addr;
-	/* With PHY package defined in DT this points to the PHY package node */
-	struct device_node *np;
-	refcount_t refcnt;
-	unsigned long flags;
-	size_t priv_size;
-
-	/* private data pointer */
-	/* note that this pointer is shared between different phydevs and
-	 * the user has to take care of appropriate locking. It is allocated
-	 * and freed automatically by phy_package_join() and
-	 * phy_package_leave().
-	 */
-	void *priv;
-};
-
 /**
  * struct mii_bus - Represents an MDIO bus
  *
-- 
2.48.1



