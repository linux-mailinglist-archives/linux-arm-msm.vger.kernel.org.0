Return-Path: <linux-arm-msm+bounces-49896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8914AA4A562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA621189BCBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFD91DD525;
	Fri, 28 Feb 2025 21:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSGklgyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D81D9A50;
	Fri, 28 Feb 2025 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779465; cv=none; b=pqRCY1cHpqRMSxb66yftvV7YSuqj0Tuhhdc/yT2plq5i8bvvHfcx1JtO6qbEBYdYWr59zZoZnCFqTNuHZWeDMxqzgqQr0qNIfBqkIjsjMr44cGEYEYOKU1KKP9kYLt02VtEhT3bT68A7bst3iff3+OiRYFHcsp2K+7myzPRaeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779465; c=relaxed/simple;
	bh=2Bgry5eqL07//oOplHXGS9pHwfi54a8S1nUPVE4j0X0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IWu3Ka8ftv2Oe3OuS20n9FOto7paZCF2bHLY21HM6oPGD2UQYtFdeBFrNwiuR2ZEjoNybSEefc7KRdvTSHgOOm2W9EGM0fPUUeQqUfXAGZc7vljUwEB6CUTSWhMTlSWluFoy5CBcO96na5DZRKjci0IB7I/TUkqbop/Gr4A23NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSGklgyF; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so3216011a12.1;
        Fri, 28 Feb 2025 13:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779461; x=1741384261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=SSGklgyFCo9LHNytGXUKKt5dwrFwhJhmfeHOTCuEhMw9Qv8cvCWkw7bsTAbq5T6L4z
         8ut9I0WZjSlaPSdZlykZzfpaosY3NaEpWj/j93Nlv60ipuDCo93lXAg/zmJmb7DEBI4r
         TNe07HrbP1hMRjavqWB/1fWCbnTuc3feCxSwuyj8ttEL4MZ1LbULo0tXUQPcOWoy6Fzf
         H3Tq5edAuEp9JyK3WmhDoxXBAxoEmdk3//TrTc+Fgy0dKM+BMAsyobAMNsnF++9k4WnP
         XzRurEub2W/xm4YVzRvEo7ouHxxzapf1ficp+wLhMX6yV6/HVp7vFuFXrT1v+1qC0phG
         Gxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779461; x=1741384261;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohEJ1FwDpFTkrVu0Ct+G3zL1K8cCEz95xL4GXyCX2D4=;
        b=SJ+NmqhAjHY+73NjEJk2f79MB1g7i6s4FlorOjYKjhaAc2sXs/RP7n/ZDkQyr3uz5Z
         l66xActE0qelSsDPL62Qqp3H0I5aixr9IlvpLkDgojK/e+AcB+bhpkAIYVeY8lsLlPQa
         V1eVKpBdO8ChRFGwdPWGaVPt6cKXl5QAt57NadCGcQ5UvBzGjRr+v/CjdirNQL1hRE8+
         luKRIIwrh0/6kj6/rRyJ5GZZ/ZJJKkPeftfukhbl4SOV33lIW6ptUYfApxiuXJhuBFEK
         OeEcJLTKq2UI0e18saUrkJPQ3yswBJ9B28gf7AhToRTLmcJt4nU7wzDHNrdzceCM99TF
         IEhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD2Z0iInkllmEGJfFgQmEjzyFk8cbSZUiaPTNCS67yMkzB7ChjQNUN5Lks+vVpy8/Uv9tjDv9aApFx7BeN@vger.kernel.org
X-Gm-Message-State: AOJu0YzwsXWiKLrRH6XA0JxLGRWJQQpK3leFIcezjmYvfqV0SucizfUJ
	wDMBXboSKAx+MbZt9r0t7t4GzDld2WI7CO/Qt2AcgHQUN/DZZUvM
X-Gm-Gg: ASbGnct9yrAq11a5DjKDJ5D/v82B1JujEvEykEHIu3xQWBWIg8tz6KA6pruiZmPXBHI
	2vMe+DVYU0lbc2a6Tb2JxTHb5MTQHjk24WYJbCPzgnuZl92zq0nr6zicA840IMLRAcz1dqdzakY
	0aSzkGw1zhFf0g7am6ktLfJrL7RV2XdLsy/Vtsd2lAcwewt5E3XIvBbWwVpZr5o8nvCFAY74LSC
	T/gn35edX0ApxeyMC1uKjM4CMPxTZixAoihl2KBSR4vFUYsX+HwjtyHR97q3ZEGdHFwLmc2VLH4
	KXbPrmzhwx6m9mJwK3xUbRk4GE/HrLd5nA3EcauzAi5NCQOk+SPIHxqCvbs80RJF22irCXztZ1x
	q60Ac27J277zJLlqi+cAmqSErYySDjHPCMnEaNuc6SmIzkxb6fvsH8pVBxUdhR2gepCiScfkeNn
	UdTis5jSHugvJIBwO6LW46rbkNTsF3nBWpI5PZ
X-Google-Smtp-Source: AGHT+IHIxBD0q37AS6941FVNwixF/wGxSXpz2TASeoAjXdHZi+Zi5OpJg1iefscixpFzLBBtLAvS/A==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr10684098a12.16.1740779461344;
        Fri, 28 Feb 2025 13:51:01 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a55e0sm3053226a12.79.2025.02.28.13.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:51:00 -0800 (PST)
Message-ID: <6ad490fa-61ad-48b8-9660-bb525f756f41@gmail.com>
Date: Fri, 28 Feb 2025 22:52:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 8/8] net: phy: remove remaining PHY package
 related definitions from phy.h
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

Move definition of struct phy_package_shared to phy_package.c, and
move remaining PHY package related declarations from phy.h to
phylib.h, thus making them accessible for PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 31 ++++++++++++++++++++++++++++
 drivers/net/phy/phylib.h      |  7 +++++++
 include/linux/phy.h           | 38 -----------------------------------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 12c92d26e..c738f76e8 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -9,6 +9,37 @@
 #include "phylib.h"
 #include "phylib-internal.h"
 
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
 struct device_node *phy_package_get_node(struct phy_device *phydev)
 {
 	return phydev->shared->np;
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
index 06c50d275..f0e499fed 100644
--- a/drivers/net/phy/phylib.h
+++ b/drivers/net/phy/phylib.h
@@ -17,5 +17,12 @@ int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
 			u32 regnum, u16 val);
 bool phy_package_init_once(struct phy_device *phydev);
 bool phy_package_probe_once(struct phy_device *phydev);
+int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
+int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
+void phy_package_leave(struct phy_device *phydev);
+int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
+			  int base_addr, size_t priv_size);
+int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
+			     size_t priv_size);
 
 #endif /* __PHYLIB_H */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2b12d1bef..c4a6385fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -319,37 +319,6 @@ struct mdio_bus_stats {
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
@@ -2109,13 +2078,6 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
-int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
-int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
-void phy_package_leave(struct phy_device *phydev);
-int devm_phy_package_join(struct device *dev, struct phy_device *phydev,
-			  int base_addr, size_t priv_size);
-int devm_of_phy_package_join(struct device *dev, struct phy_device *phydev,
-			     size_t priv_size);
 
 int __init mdio_bus_init(void);
 void mdio_bus_exit(void);
-- 
2.48.1



