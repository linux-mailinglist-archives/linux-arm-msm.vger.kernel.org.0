Return-Path: <linux-arm-msm+bounces-2014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63567F90C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 02:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07583B21194
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 01:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67F720EC;
	Sun, 26 Nov 2023 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqXCKf3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31097127;
	Sat, 25 Nov 2023 17:53:57 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40b399a6529so10317765e9.1;
        Sat, 25 Nov 2023 17:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963635; x=1701568435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOK9PAOl19fPFmgimOsyHNB983ByM9cI1PYSUQPStAQ=;
        b=TqXCKf3p8tkZSf6GKHxfqWgl6RIk6WsEEbtdGoBzBUpRWTN9IWxECjkRbBBWzPqn2t
         yecW+Tjs3jJu67L2TJkUGFkZFPG0yiuxT5ZiX2gHBHLIxkywICNMG/WXUrRTPcDM6IPJ
         RDGCDFoEuGryZ5N9gPD03kTP10Ei2CdnK/Fd/hbUkZpBTIYQLZzp+blIvZwxq1/UVmp4
         mX7CMnbIW4/DKB/yF7NHP4m+m70nAni6B3HsDtZIo6A1VTichX45GlMEAh5v8QZ26aiQ
         939jTQ0ZmtodMLOk/O/oyk5rk2JLpcTdK6gdDnhdyRv49aUdGnc+ZEkTE3oQgYPvOj6K
         yI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963635; x=1701568435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOK9PAOl19fPFmgimOsyHNB983ByM9cI1PYSUQPStAQ=;
        b=UXmR893NA15QunPjq2yydhTD5fCIi07yx0F3hhv01d+wJZMIjbAN0KhOclUtylALMX
         UBSS8nq6e7g3dD+w2LqLf/8UfdWqNL7Fky9450P1bO7lxi92fDcGFrx4lIorrmKF3r3P
         I23cV79U4zbB7wxsKILHk0jHETRCLJB3Oz44afx+UHP8WHV9QT9fWtZ/Ne8Y6szUHhoX
         mH3s3V9UaZlIidwda2y8Hrzoie6AnUUS3w/OsSwxd7o6LMaTDdey02uQ205bqFuLcZcG
         8Bs+fIalZ8QWSiqJ8uLkHh3snPc1pjcqaauEjGTl9tajceay4hLUx+DJJ8mbFKHput8+
         L+bQ==
X-Gm-Message-State: AOJu0Yyp9nrKGmS2GZ12o45SFXiiS2Ep1bLzMUxoUOvK9R/EF6JZysv1
	bpO8xh7IW33NEQlAiYoLWd8=
X-Google-Smtp-Source: AGHT+IG33CN2KwdqsLUMmsJRpojWbtR5CerjAlfyOT09LzeNoBrgNS94y/QS4NSpp0nmzyGoWCIkDA==
X-Received: by 2002:a05:600c:348f:b0:401:b92f:eec5 with SMTP id a15-20020a05600c348f00b00401b92feec5mr9238078wmq.9.1700963635593;
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:55 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 2/8] net: phy: add initial support for PHY package in DT
Date: Sun, 26 Nov 2023 02:53:40 +0100
Message-Id: <20231126015346.25208-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support for PHY package in DT.

Make it easier to define PHY package and describe the global PHY
directly in DT by refereincing them by phandles instead of custom
functions in each PHY driver.

Each PHY in a package needs to be defined in a dedicated node in the
mdio node. This dedicated node needs to have the node name with the
prefix "ethernet-phy-package" and compatible set to
"ethernet-phy-package".

With this defined, the generic PHY probe will join each PHY in this
dedicated node to the package.

PHY package will be joined based on the reg defined in the
ethernet-phy-package node.

mdio_bus.c and of_mdio.c is updated to now support and parse also
PHY package subnote by checking if the node compatible is
"ethernet-phy-package".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/of_mdio.c   | 68 +++++++++++++++++++++++++-----------
 drivers/net/phy/mdio_bus.c   | 35 ++++++++++++++-----
 drivers/net/phy/phy_device.c | 35 +++++++++++++++++++
 include/linux/phy.h          |  3 ++
 4 files changed, 112 insertions(+), 29 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 64ebcb6d235c..c98e9f7fa3d4 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -139,6 +139,47 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
+				   bool *scanphys)
+{
+	struct device_node *child;
+	int addr, rc = 0;
+
+	/* Loop over the child nodes and register a phy_device for each phy */
+	for_each_available_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
+			if (rc && rc != -ENODEV)
+				goto exit;
+
+			continue;
+		}
+
+		addr = of_mdio_parse_addr(&mdio->dev, child);
+		if (addr < 0) {
+			*scanphys = true;
+			continue;
+		}
+
+		if (of_mdiobus_child_is_phy(child))
+			rc = of_mdiobus_register_phy(mdio, child, addr);
+		else
+			rc = of_mdiobus_register_device(mdio, child, addr);
+
+		if (rc == -ENODEV)
+			dev_err(&mdio->dev,
+				"MDIO device at address %d is missing.\n",
+				addr);
+		else if (rc)
+			goto exit;
+	}
+
+	return 0;
+exit:
+	of_node_put(child);
+	return rc;
+}
+
 /**
  * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
  * @mdio: pointer to mii_bus structure
@@ -180,25 +221,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		return rc;
 
 	/* Loop over the child nodes and register a phy_device for each phy */
-	for_each_available_child_of_node(np, child) {
-		addr = of_mdio_parse_addr(&mdio->dev, child);
-		if (addr < 0) {
-			scanphys = true;
-			continue;
-		}
-
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
-
-		if (rc == -ENODEV)
-			dev_err(&mdio->dev,
-				"MDIO device at address %d is missing.\n",
-				addr);
-		else if (rc)
-			goto unregister;
-	}
+	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
+	if (rc)
+		goto unregister;
 
 	if (!scanphys)
 		return 0;
@@ -227,15 +252,16 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 				if (!rc)
 					break;
 				if (rc != -ENODEV)
-					goto unregister;
+					goto put_unregister;
 			}
 		}
 	}
 
 	return 0;
 
-unregister:
+put_unregister:
 	of_node_put(child);
+unregister:
 	mdiobus_unregister(mdio);
 	return rc;
 }
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 25dcaa49ab8b..05f2e8e01a03 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -455,19 +455,25 @@ EXPORT_SYMBOL(of_mdio_find_bus);
  * found, set the of_node pointer for the mdio device. This allows
  * auto-probed phy devices to be supplied with information passed in
  * via DT.
+ * If a PHY package is found, PHY is searched also there.
  */
-static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
-				    struct mdio_device *mdiodev)
+static int of_mdiobus_find_phy(struct device *dev, struct mdio_device *mdiodev,
+			       struct device_node *np)
 {
-	struct device *dev = &mdiodev->dev;
 	struct device_node *child;
 
-	if (dev->of_node || !bus->dev.of_node)
-		return;
-
-	for_each_available_child_of_node(bus->dev.of_node, child) {
+	for_each_available_child_of_node(np, child) {
 		int addr;
 
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			if (!of_mdiobus_find_phy(dev, mdiodev, child)) {
+				of_node_put(child);
+				return 0;
+			}
+
+			continue;
+		}
+
 		addr = of_mdio_parse_addr(dev, child);
 		if (addr < 0)
 			continue;
@@ -477,9 +483,22 @@ static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
 			/* The refcount on "child" is passed to the mdio
 			 * device. Do _not_ use of_node_put(child) here.
 			 */
-			return;
+			return 0;
 		}
 	}
+
+	return -ENODEV;
+}
+
+static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
+				    struct mdio_device *mdiodev)
+{
+	struct device *dev = &mdiodev->dev;
+
+	if (dev->of_node || !bus->dev.of_node)
+		return;
+
+	of_mdiobus_find_phy(dev, mdiodev, bus->dev.of_node);
 }
 #else /* !IS_ENABLED(CONFIG_OF_MDIO) */
 static inline void of_mdiobus_link_mdiodev(struct mii_bus *mdio,
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 823b25bb3e3e..f416f7434697 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3174,6 +3174,36 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static int of_phy_package(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct device_node *package_node;
+	u32 base_addr;
+	int ret;
+
+	if (!node)
+		return 0;
+
+	package_node = of_get_parent(node);
+	if (!package_node)
+		return 0;
+
+	if (!of_device_is_compatible(package_node, "ethernet-phy-package"))
+		return 0;
+
+	if (of_property_read_u32(package_node, "reg", &base_addr))
+		return -EINVAL;
+
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
+				    base_addr, 0);
+	if (ret)
+		return ret;
+
+	phydev->shared->np = package_node;
+
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3282,6 +3312,11 @@ static int phy_probe(struct device *dev)
 	if (phydrv->flags & PHY_IS_INTERNAL)
 		phydev->is_internal = true;
 
+	/* Parse DT to detect PHY package and join them */
+	err = of_phy_package(phydev);
+	if (err)
+		goto out;
+
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 342f750e8a30..80a4adaeb817 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -329,6 +329,7 @@ struct mdio_bus_stats {
  * struct phy_package_shared - Shared information in PHY packages
  * @base_addr: Base PHY address of PHY package used to combine PHYs
  *   in one package and for offset calculation of phy_package_read/write
+ * @np: Pointer to the Device Node if PHY package defined in DT
  * @refcnt: Number of PHYs connected to this shared data
  * @flags: Initialization of PHY package
  * @priv_size: Size of the shared private data @priv
@@ -340,6 +341,8 @@ struct mdio_bus_stats {
  */
 struct phy_package_shared {
 	int base_addr;
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
 	refcount_t refcnt;
 	unsigned long flags;
 	size_t priv_size;
-- 
2.40.1


