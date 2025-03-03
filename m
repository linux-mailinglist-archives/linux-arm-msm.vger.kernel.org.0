Return-Path: <linux-arm-msm+bounces-50055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC91A4CC97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FE5C18921AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A321EC012;
	Mon,  3 Mar 2025 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZZzMqY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022062B9AA;
	Mon,  3 Mar 2025 20:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741033062; cv=none; b=qd9ySmOWX3/tH5ayB5G8opkhZwtC0H9TQqz238zTeVsBl531DQmH8jPLiJvQ1mu9meh512qi+80ovHOhrwqKQ4YwvZ7xqIAfFQdUFs0KxrwYZqWQAY8PD20uDzmW9na0/76UOXaPb7wTelQ8mZcrfUXhKMFQEeQuLJpt1jp9I/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741033062; c=relaxed/simple;
	bh=WSEtS1hoALJn+KBvsixe/uFMas9ZHPACAkN8OlLzy5I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=X12yWSi1YB8xaaOz3KKo9XchgZNx+EkK8369TjlZ9o49OwByrgYcX5Z2fudQ4O9oW7CB0TA3TdzGuZ7p86ty/mC/uiM2Ght/OEG2fsn8mMN+hamkgw237/d7SxARHTDA3YFXiaDlSkYQoTkRISmoRkjyzQ41oZ1/4Kwzvjcsq4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZZzMqY4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso4077988f8f.0;
        Mon, 03 Mar 2025 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741033059; x=1741637859; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tvKkt8IW0AOI1rKL+pyhxjNZjLfY2G93iwn07bnCOCE=;
        b=cZZzMqY4C8YMh1Tcfj7O1B/oE04oqzk2or1I8co3sPjZs7s0+aqVK2UB4IZIowqVf+
         H5N7YH6Sl4L0n1qwaaJDQrFxFqju3gfD4dhW1nOgKl94Zpyb5uDMTzBfW7F+ll/ZHv4l
         fnNt8VjWZxl9EGRVckXEZ/drjWDxZSQb5Pz+DIX8+RBS387+7eZzlKi3v60ZGBIG+wYJ
         CdytwHVToH+VMbW9LUOETdzxrBna+2TfQ4vv1tSHKT74SvZfTlOPeaoepEJ+3YyFhjoT
         844PWc24L/Wirxl+aPO0HTDZSI/co5gOBBN8oPctJwL+TABMM1caFiML/BFiznSoy/bS
         KzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741033059; x=1741637859;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvKkt8IW0AOI1rKL+pyhxjNZjLfY2G93iwn07bnCOCE=;
        b=oRETH74nxyFWTwnGoUfr12hnH8uZTAmxdSaD1VdzPoO6DO7kbcBQqtQV3WsNdQ5d/G
         nfPwwlQ1Gs9bYppoJEY2AMueyam6f8HsyEXSAqryYOmhHW+EzgGaYzdr3irMRAChiEJA
         FTnDUxwBUEeHO+bIbvRMCDVCDanm9n4e3eT1V49tSwpfahsTQLujWkeCT7IVzVEjl3t/
         87G6pw9NcorRzYPJplvjV2WtFDdkmhUJHBheqDhVE5pi2h7YP8kfVZ80snnci5UeOUin
         1VO+5x+mOpCqJVJJang5IzeabUhuHBHqDBVqN8Pocs5Bh4rbz74ub5t2TOfG01+0dZ/b
         2PiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzf/gvsBD104RRv8/3pezhy89yuVXHvaHmcjhnJ2f9wwKs6mpTuE9oh2DPY+m0guLuomM/1fmJ1J2XUuaB@vger.kernel.org
X-Gm-Message-State: AOJu0YxvIUGdSQohStt2qJo+Pl07VAzmj0Wg6Pk0rZHSX1Ycr6gJanFy
	cawIgN49w79jQ8e4jtb0O80wcw05TgDgj0T3ppfgnrYkP9jFGI07
X-Gm-Gg: ASbGnctpOX/jlhxO8vW98mJK64OaakVO7oyKWhmg8upOE6QJ5Zfz+tR3lgMBxRwTQtW
	ybadwR10Pz+aCAnUM/gS9IflOg+3cWZ9rqM3CYRHi9qF6/mQ3dHaLBTULkm5FU2tP4jzw3i0zMF
	zhX89sCvtbbxKfSoFGoVNCbazqQS/AcSITDenok1fHJOw5/TZf/qJrQ1AhLEl+AN1ulwVoIos5J
	B4VidLZXCaXD2Pl6wfI0ks2i4iawmq7jgvctvwaySCugv+zuR5BOJuiO9EIWS6FIvMLShAxKuuW
	5vpJdJLcMgWPNktprT3cWLuKVWHjRAFxMH4hciC/tsARhJNA+QXNOEgwnbz1oNf6049P+SfZBi6
	QkLEk4ktraOEq1929bZAxs/8WIDdYGwGm5zK0ctzch2ZmMPBU207bHFoUWP7MvxLOWzh92uEgCv
	NPZ6kCQ0v/JqiErll1iOVN/ZPU3R3WQetK4Flc
X-Google-Smtp-Source: AGHT+IHhzVtdwbiG46c1/MnPMyZscLTCC1pfbhJKEc28z9j8UG/oT7SQdd4CSbQW7E09jyqHe78kIg==
X-Received: by 2002:a05:6000:154e:b0:390:fe2d:3172 with SMTP id ffacd0b85a97d-391155fa457mr463436f8f.3.1741033058993;
        Mon, 03 Mar 2025 12:17:38 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e47b7c43sm15146539f8f.49.2025.03.03.12.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:17:38 -0800 (PST)
Message-ID: <a4518379-7a5d-45f3-831c-b7fde6512c65@gmail.com>
Date: Mon, 3 Mar 2025 21:18:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 7/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
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

Move PHY package related inline functions from phy.h to phy_package.c.
While doing so remove locked versions phy_package_read() and
phy_package_write() which have no user.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/bcm54140.c        |  1 +
 drivers/net/phy/mscc/mscc_main.c  |  2 +
 drivers/net/phy/phy-core.c        |  1 +
 drivers/net/phy/phy_package.c     | 61 ++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h |  2 +
 drivers/net/phy/phylib.h          |  6 +++
 include/linux/phy.h               | 86 -------------------------------
 7 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/drivers/net/phy/bcm54140.c b/drivers/net/phy/bcm54140.c
index 7969345f6..a8edf45fd 100644
--- a/drivers/net/phy/bcm54140.c
+++ b/drivers/net/phy/bcm54140.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/phy.h>
 
+#include "phylib.h"
 #include "bcm-phy-lib.h"
 
 /* RDB per-port registers
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



