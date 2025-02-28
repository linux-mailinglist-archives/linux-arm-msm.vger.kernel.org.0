Return-Path: <linux-arm-msm+bounces-49895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7FFA4A55C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:50:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4412216DE90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8A21DBB3A;
	Fri, 28 Feb 2025 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ic7sDnFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13041DC197;
	Fri, 28 Feb 2025 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779406; cv=none; b=Kfz5+swIun8/mdzTCgzdYwWcGVGqAgmhb1Vu9lfr4MMlKVo+hN9XjRgjQiG3+Tjn8H310g3dxRc8It609HoFNtxoKEOiiululDCNJBp+OcwiIV90nykCY2YLvP7IczYOjkyjHItHelajGU2WGa0jUSEt+zlyKRpdU4GN7WtFsYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779406; c=relaxed/simple;
	bh=IInvqWFSJ2RSPIsywgrEQUHoD/3z6Gd3e/OVgvhL+tM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PDYVDFBUkVbwv3tmZwohnPjR5UcYPKwgl0yGxRM/6ocJv1toC1vWnxXzix4CSvNm9Mdr6iR4MIlbiV90wWYfnACrC8wp7gUvKFO2EpF5U4zadPaR1DK8GRCHDAKKVTiZuvlH6ZjDURuorMF5WO7dSe6AM0BfuqZldw3TH6nCbtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ic7sDnFl; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so4716906a12.0;
        Fri, 28 Feb 2025 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779403; x=1741384203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2sEAXzNrYYh57t2T7Sq1YFEf8rRj1uTGhNpoYvvI2Pg=;
        b=ic7sDnFlL/z2cvge0B//AmcDz5by2MF1MKS/M9mIa4NwBUNaKXYU+fvhe4YoGYCvod
         3nlbpsKlcHc4X40i6OHcV0jOcQHRwjGufTDL6CBsCxXjFIj8oIpJYx6LS1STQ/MZw4iO
         J8Z63A5dorwsjlZeGy8qqJlvoOw3GLWHWjKPxScQuziqf4/eVIBjdF9sM4CfOfwt8uP5
         Oh36ZLYbnUens2y5Hiu3iErQuFNsH3D2jEKwz5oj9q/TPZIhaVG26eMk/2pY6SpdZ7DW
         nk6dakr3aLIJnDKWS3dlMy8h/Ud1qale/x5QrmZ7y9xXLGVe0VHMwZjXm39Ys2+FOq4c
         4I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779403; x=1741384203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sEAXzNrYYh57t2T7Sq1YFEf8rRj1uTGhNpoYvvI2Pg=;
        b=DMqhFpZkaSrp36L7PT3g/875Mx+xksvBFs6/mboQCVg1aG8PpcskPZlNTvmCxX1knl
         pSXiCnMfOQEZergPslerij4hODDyN7KW15imfjX4UHLSlNa06ZK1AcJ91KvAscgXDQYc
         hSBv0FOJbatqRPakSJDONmfPu0yfEm1S8V0qgqAZnhcgg2eoo7vm9Z+Vxlz2DSs1jYVC
         8WIVmDu4iXYuPYGdtjcadu8/mkGa1ObAVUWYLvyj8hB4lz9k/XMjJZG3mLpPm2jGr73V
         NFCdKtOg8B6Bbnf64q2gqI05yYIvz5t/kAfMPA6KNTKRHNH+R8mXgENjxXnh/5T/VrWG
         4VRg==
X-Forwarded-Encrypted: i=1; AJvYcCX5qYDxMwesFLyx44Sx2Qkp4srRLGZTrNFRdxcb6hVUbt3DzBT70WTU2+fJVj63TO23Pm8SpMjCxFSx9Ayf@vger.kernel.org
X-Gm-Message-State: AOJu0YzLYqXBQx6qq2eCGJT4aUoaI10J2i/JAnyPUtzJ/9xDsGyShaCh
	b7GRW8/Smhue7nBueGRiEC63pQb8KkqnVd9SzuV8xcozye2E44Ma
X-Gm-Gg: ASbGncu8KhSboZ7zP89qBkif+bVuwMhVVR/9XuW/QwpySGzwejciqhYmNCXlWicyi9R
	ioYFjoFmQdXvL5KNqq9RnWxsiAq6VLnaICliZpCZ7zkW8Q+UQCPHXwrnIpuQI7I9l1kTibnPqEy
	EUajdnCRMSsjGyC/LTDp3JDsSmm1mGEdjHVnPj05BHvmwFBnF8opiRQuXPR7nbrwaqW0BnvEeWS
	K33e3yeD9yrRdaVrKSlTJ9i3u0Mjzxj8bsnrYrNeZ0gDL+3AAkbOOVHK4UneZuagAdasZi7L6wd
	rJWBSMvkHBlxgWUEAvZgzL/U6PJnVv1+NRv7/zBCH1h4IjU8Y+/tBK42J0+GBdbhxr24Dk5gNw1
	7W6u5iths0BKCk7eVteIVzH3+WeiDhosy9q3/n+JuVaU8dCt+2+Yz0BvlhelBq+PsBdgYOht8+M
	D08d7GozJq8jiUpu4lOQ==
X-Google-Smtp-Source: AGHT+IGXjPJ7JaXzFWncktK5jLFwdkU9I2iHfTnjUKBzyLJTIAAqM7rp3R1mpPy/8cGW4sQ64EZYOA==
X-Received: by 2002:a05:6402:3582:b0:5e0:2e70:c2af with SMTP id 4fb4d7f45d1cf-5e4d6b62663mr3420958a12.26.1740779402902;
        Fri, 28 Feb 2025 13:50:02 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3b4a81asm3033651a12.9.2025.02.28.13.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:50:01 -0800 (PST)
Message-ID: <edba99c5-0f95-40bd-8398-98d811068369@gmail.com>
Date: Fri, 28 Feb 2025 22:51:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 7/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
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

Move PHY package related inline functions from phy.h to phy_package.c.
While doing so remove locked versions phy_package_read() and
phy_package_write() which have no user.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mscc/mscc_main.c  |  2 +
 drivers/net/phy/phy-core.c        |  1 +
 drivers/net/phy/phy_package.c     | 61 ++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h |  2 +
 drivers/net/phy/phylib.h          |  6 +++
 include/linux/phy.h               | 86 -------------------------------
 6 files changed, 72 insertions(+), 86 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 19cf12ee8..7ff975efd 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -17,6 +17,8 @@
 #include <linux/of.h>
 #include <linux/netdevice.h>
 #include <dt-bindings/net/mscc-phy-vsc8531.h>
+
+#include "../phylib.h"
 #include "mscc_serdes.h"
 #include "mscc.h"
 
diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index b1c1670de..154d29be6 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -6,6 +6,7 @@
 #include <linux/phy.h>
 #include <linux/of.h>
 
+#include "phylib.h"
 #include "phylib-internal.h"
 
 /**
diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 873420e58..12c92d26e 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -7,6 +7,7 @@
 #include <linux/phy.h>
 
 #include "phylib.h"
+#include "phylib-internal.h"
 
 struct device_node *phy_package_get_node(struct phy_device *phydev)
 {
@@ -20,6 +21,66 @@ void *phy_package_get_priv(struct phy_device *phydev)
 }
 EXPORT_SYMBOL_GPL(phy_package_get_priv);
 
+int phy_package_address(struct phy_device *phydev, unsigned int addr_offset)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	u8 base_addr = shared->base_addr;
+
+	if (addr_offset >= PHY_MAX_ADDR - base_addr)
+		return -EIO;
+
+	/* we know that addr will be in the range 0..31 and thus the
+	 * implicit cast to a signed int is not a problem.
+	 */
+	return base_addr + addr_offset;
+}
+
+int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
+		       u32 regnum)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
+}
+EXPORT_SYMBOL_GPL(__phy_package_read);
+
+int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
+			u32 regnum, u16 val)
+{
+	int addr = phy_package_address(phydev, addr_offset);
+
+	if (addr < 0)
+		return addr;
+
+	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
+}
+EXPORT_SYMBOL_GPL(__phy_package_write);
+
+static bool __phy_package_set_once(struct phy_device *phydev, unsigned int b)
+{
+	struct phy_package_shared *shared = phydev->shared;
+
+	if (!shared)
+		return false;
+
+	return !test_and_set_bit(b, &shared->flags);
+}
+
+bool phy_package_init_once(struct phy_device *phydev)
+{
+	return __phy_package_set_once(phydev, 0);
+}
+EXPORT_SYMBOL_GPL(phy_package_init_once);
+
+bool phy_package_probe_once(struct phy_device *phydev)
+{
+	return __phy_package_set_once(phydev, 1);
+}
+EXPORT_SYMBOL_GPL(phy_package_probe_once);
+
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phylib-internal.h b/drivers/net/phy/phylib-internal.h
index dc9592c6b..afac2bd15 100644
--- a/drivers/net/phy/phylib-internal.h
+++ b/drivers/net/phy/phylib-internal.h
@@ -20,6 +20,8 @@ void of_set_phy_timing_role(struct phy_device *phydev);
 int phy_speed_down_core(struct phy_device *phydev);
 void phy_check_downshift(struct phy_device *phydev);
 
+int phy_package_address(struct phy_device *phydev, unsigned int addr_offset);
+
 int genphy_c45_read_eee_adv(struct phy_device *phydev, unsigned long *adv);
 
 #endif /* __PHYLIB_INTERNAL_H */
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
index a42e1fc07..06c50d275 100644
--- a/drivers/net/phy/phylib.h
+++ b/drivers/net/phy/phylib.h
@@ -11,5 +11,11 @@ struct phy_device;
 
 struct device_node *phy_package_get_node(struct phy_device *phydev);
 void *phy_package_get_priv(struct phy_device *phydev);
+int __phy_package_read(struct phy_device *phydev, unsigned int addr_offset,
+		       u32 regnum);
+int __phy_package_write(struct phy_device *phydev, unsigned int addr_offset,
+			u32 regnum, u16 val);
+bool phy_package_init_once(struct phy_device *phydev);
+bool phy_package_probe_once(struct phy_device *phydev);
 
 #endif /* __PHYLIB_H */
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7bfbae510..2b12d1bef 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -350,10 +350,6 @@ struct phy_package_shared {
 	void *priv;
 };
 
-/* used as bit number in atomic bitops */
-#define PHY_SHARED_F_INIT_DONE  0
-#define PHY_SHARED_F_PROBE_DONE 1
-
 /**
  * struct mii_bus - Represents an MDIO bus
  *
@@ -2149,67 +2145,6 @@ int __phy_hwtstamp_set(struct phy_device *phydev,
 		       struct kernel_hwtstamp_config *config,
 		       struct netlink_ext_ack *extack);
 
-static inline int phy_package_address(struct phy_device *phydev,
-				      unsigned int addr_offset)
-{
-	struct phy_package_shared *shared = phydev->shared;
-	u8 base_addr = shared->base_addr;
-
-	if (addr_offset >= PHY_MAX_ADDR - base_addr)
-		return -EIO;
-
-	/* we know that addr will be in the range 0..31 and thus the
-	 * implicit cast to a signed int is not a problem.
-	 */
-	return base_addr + addr_offset;
-}
-
-static inline int phy_package_read(struct phy_device *phydev,
-				   unsigned int addr_offset, u32 regnum)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return mdiobus_read(phydev->mdio.bus, addr, regnum);
-}
-
-static inline int __phy_package_read(struct phy_device *phydev,
-				     unsigned int addr_offset, u32 regnum)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return __mdiobus_read(phydev->mdio.bus, addr, regnum);
-}
-
-static inline int phy_package_write(struct phy_device *phydev,
-				    unsigned int addr_offset, u32 regnum,
-				    u16 val)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return mdiobus_write(phydev->mdio.bus, addr, regnum, val);
-}
-
-static inline int __phy_package_write(struct phy_device *phydev,
-				      unsigned int addr_offset, u32 regnum,
-				      u16 val)
-{
-	int addr = phy_package_address(phydev, addr_offset);
-
-	if (addr < 0)
-		return addr;
-
-	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
-}
-
 int __phy_package_read_mmd(struct phy_device *phydev,
 			   unsigned int addr_offset, int devad,
 			   u32 regnum);
@@ -2226,27 +2161,6 @@ int phy_package_write_mmd(struct phy_device *phydev,
 			  unsigned int addr_offset, int devad,
 			  u32 regnum, u16 val);
 
-static inline bool __phy_package_set_once(struct phy_device *phydev,
-					  unsigned int b)
-{
-	struct phy_package_shared *shared = phydev->shared;
-
-	if (!shared)
-		return false;
-
-	return !test_and_set_bit(b, &shared->flags);
-}
-
-static inline bool phy_package_init_once(struct phy_device *phydev)
-{
-	return __phy_package_set_once(phydev, PHY_SHARED_F_INIT_DONE);
-}
-
-static inline bool phy_package_probe_once(struct phy_device *phydev)
-{
-	return __phy_package_set_once(phydev, PHY_SHARED_F_PROBE_DONE);
-}
-
 extern const struct bus_type mdio_bus_type;
 
 struct mdio_board_info {
-- 
2.48.1



