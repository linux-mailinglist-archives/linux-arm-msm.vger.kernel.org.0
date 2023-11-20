Return-Path: <linux-arm-msm+bounces-1165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161247F14DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4752F1C21879
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B22E1BDD7;
	Mon, 20 Nov 2023 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzOWvVfr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25C510D1;
	Mon, 20 Nov 2023 05:51:29 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083740f92dso16080325e9.3;
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488288; x=1701093088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KlciZ6HGUzRiM58ultDgzciNJogKhU8Km072RfwAf4=;
        b=DzOWvVfrm178CDzV/mmSwdpTxeWYfjw4xLSRh4/7NcSxsrsTEMdLtDxUwYB4H4K14c
         VHt7GejI75AwRzQLlkUD8oprRaoW2JN20GX3QP272DTZg4oNtnjo5K9kJbBCuL4V8Ivu
         m2XUwRMbvoSrYNbIEFeSIo0zTMstFtVlO7Ln85DAFlndy3lQlU9KL9VTrjOTuHC9Pj2O
         Y3AmooLD7HRhaJm3p7JU7b6eRQlkxJ3DM+0qmW7FI90aohrFLuJ6DZmHKgBdfXeGV12G
         sQcMxhAPay8f/sn7nNnesotJNvxV/vrjqOCuTyHZDU8l4YzGYJp/qLaXH31zizVPPlTL
         j4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488288; x=1701093088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KlciZ6HGUzRiM58ultDgzciNJogKhU8Km072RfwAf4=;
        b=g7XDxOj66xPyly01UZ9P773JGpiwwdYByCmt5EnswTarDR450T9hg579tapTVY3yWd
         Tm4wRs/WsJp+OrNZg5/jx6gknf0l/cYKcbjL8GdE9Bcbldq/DO/G5iKxgc/ZR9jVo+KC
         jkM0XPDW6zI67k+TptjM6rgJfCWZnLEMLJB8CquCz+AKhpwqpHDPs/2B2Xz6v2ml8U6T
         e3tR6iQxNaiFy+FXgMD6WgKRE/bcModXY0Wt38tH1rvklYQzdh3Q+6uSFc5+bxDu1A5D
         EfZQk44MomjjneYdpxiNpRnTY+CdqQPBDROApPcrAo5HVbSGbZjY3uyME0l2qq/a+uaF
         xU+w==
X-Gm-Message-State: AOJu0YxjcsSSW6dhOKZPCo9e0vaxbCkzU2+ZVF5PyWKmwcerfxs/rnX/
	1Jxr6v5N/2YOCjEuRN0jfZw=
X-Google-Smtp-Source: AGHT+IEgMWdVSmBqk/Db3v8YVKpL/4mMmUM+K0FYzCeo2AsDXwgh5SY0EbCSMcmSejPYpR8JOj4Fqg==
X-Received: by 2002:a05:600c:3113:b0:408:e441:1697 with SMTP id g19-20020a05600c311300b00408e4411697mr5904786wmo.39.1700488288141;
        Mon, 20 Nov 2023 05:51:28 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:27 -0800 (PST)
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
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 10/14] net: phy: add support for PHY package MMD read/write
Date: Mon, 20 Nov 2023 14:50:37 +0100
Message-Id: <20231120135041.15259-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
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
index dd2381652dd1..90bfaa36689f 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2110,6 +2110,78 @@ static inline int __phy_package_write(struct phy_device *phydev,
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


