Return-Path: <linux-arm-msm+bounces-1920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B289A7F874A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 01:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4612815C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 00:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55C6259D;
	Sat, 25 Nov 2023 00:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUsvjnkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA7D1BC1;
	Fri, 24 Nov 2023 16:35:29 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b27726369so17263385e9.0;
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872528; x=1701477328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7OVOcGHUcPnU+8BUU2tjf4Y7gvtOJAy7pXlV7RvF1I=;
        b=LUsvjnkmu78VqrV5G5vv9wqZBp8i1oOkR0zd9XjcmO5PsWVzK7n7NPb8D8DR+D2X4T
         yv7Oz6LjoyFYxkS9N5uNJVu9Xft6tUsvxZzXNouB2T1Sr8d2ee+H9o6V75HitxYj8a0a
         T17LOHwQjGrQr3qF1jSUzlpyahaYDg7ephknuyK/lUmo10jcGhSW6CzyPMb4xugsRk8d
         x3AawqgqbsBzghjTrwpAUDRargf5vq3xf1b3IoelqOSbty8ulh8VHNZPy1OEH2YXC4BE
         Jm3MoJfZOlFIMJUBT7LcMjSj3lFjurcC2Y2jCHCHbQkrWejcBi2jinrRVsiOfk/Z9XWI
         CVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872528; x=1701477328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7OVOcGHUcPnU+8BUU2tjf4Y7gvtOJAy7pXlV7RvF1I=;
        b=gao/7ZSK7eP7zMjoJOt9sjkuhFeS/IQDjibomW3v/uai1bHqaFbxcjVpSSTRP+/ii+
         qWUMMqZBpu6Zk+BpquZNB4nF+zAH1xX1JB6Ytupq6SL8G/s+DILxirKFpsC5SIdxytXr
         aW4vso4QJw+yPJGJ+m0fRp6FoZOgy+4Imkw9DuEGsklr0a4DjQwwHCV0VWVQaW4vf2Gz
         2rcQB07wSNCDGnYCfJeAb/zAljZvVmBuCT1iK4t2EPJWLMsNmW/ta5GjCBjamulPsSvm
         CSwcq5Q7zJ0mv8ZRiRWO2b2mxG0ZRnW14eMUYA0j9VVVfwPp+RpN/46ehc/EkgF3TRWu
         jVCQ==
X-Gm-Message-State: AOJu0YyMhsPemQH4PRjJFyU0nyb0JB4JZe8a0WL8dx/ioUWHYjukmH8I
	AeE5ICoAPH0b2aWq9HwlaCk=
X-Google-Smtp-Source: AGHT+IGcE1dOF2/4XmII3D8k9pAOirkX3JthCM23UGSAVeigejq1ME7yX5mhXBajq2F60t3CrBZvGg==
X-Received: by 2002:a05:600c:3b16:b0:3fe:ba7:f200 with SMTP id m22-20020a05600c3b1600b003fe0ba7f200mr3564351wms.20.1700872527977;
        Fri, 24 Nov 2023 16:35:27 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:27 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 07/11] net: phy: add support for PHY package MMD read/write
Date: Sat, 25 Nov 2023 01:11:23 +0100
Message-Id: <20231125001127.5674-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some PHY in PHY package may require to read/write MMD regs to correctly
configure the PHY package.

Add support for these additional required function in both lock and no
lock variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 72 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 0f3b21c90583..4c5856d9865d 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2104,6 +2104,78 @@ static inline int __phy_package_write(struct phy_device *phydev,
 	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
 }
 
+static inline int phy_package_read_mmd(struct phy_device *phydev,
+				       int global_phy_index, int devad, u32 regnum)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr, val;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+
+	phy_lock_mdio_bus(phydev);
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	val = __mdiobus_read(bus, addr, MII_MMD_DATA);
+	phy_unlock_mdio_bus(phydev);
+
+	return val;
+}
+
+static inline int __phy_package_read_mmd(struct phy_device *phydev,
+					 int global_phy_index, int devad, u32 regnum)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	return __mdiobus_read(bus, addr, MII_MMD_DATA);
+}
+
+static inline int phy_package_write_mmd(struct phy_device *phydev,
+					int global_phy_index, int devad,
+					u32 regnum, u16 val)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr, ret;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+
+	phy_lock_mdio_bus(phydev);
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	ret = __mdiobus_write(bus, addr, MII_MMD_DATA, val);
+	phy_unlock_mdio_bus(phydev);
+
+	return ret;
+}
+
+static inline int __phy_package_write_mmd(struct phy_device *phydev,
+					  int global_phy_index, int devad,
+					  u32 regnum, u16 val)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	return __mdiobus_write(bus, addr, MII_MMD_DATA, val);
+}
+
 static inline bool __phy_package_set_once(struct phy_device *phydev,
 					  unsigned int b)
 {
-- 
2.40.1


