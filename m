Return-Path: <linux-arm-msm+bounces-1159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9287F14C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 232841F24897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B061B286;
	Mon, 20 Nov 2023 13:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyHTT3wF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB2F194;
	Mon, 20 Nov 2023 05:51:20 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c83d37a492so54327121fa.3;
        Mon, 20 Nov 2023 05:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488278; x=1701093078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FX7V7trfh1DXAxYTuLbIm4MQGMj2UzdEIFOOsY5wQzg=;
        b=lyHTT3wFdsGJoTupp+QiKLHg+uOcbcxvHOSvnwxIvEgut1SJj/02QQxV2VPuWVtV2K
         MJ6XLk9rPtDX/w/nqHM3FCyQGzrj3VCw1d2Sihfypb3eq09M9jb65UVStXYs6tJFYlz3
         ZwiVPMOZfBhOIRcIMEhFEtIls8+SSVQGTnmpwL8iiRHvjeC+nENHdD96i9oHS5yLQpF0
         4mOlwGxAg+NKCwJqIxg3CWq2K/0smWcn7vLQLAbzvEKB2RB5ALaaGXxCW1sMmCjg47Sb
         F73UCLIxArDYw7scr3L3C4WzBGgGz59TUX7ZbkAEwA7cBJA/js0N8e9dOhZ6IQydnMhv
         WBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488278; x=1701093078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX7V7trfh1DXAxYTuLbIm4MQGMj2UzdEIFOOsY5wQzg=;
        b=TiBOW+Mkc5po0nuMI8RGIpECp9qXBpdoTrGVlAWHaQ0mujTK3P4bmXQLr+uuchOX5b
         hlL6BmTIk9t6heZaKl+A9DfSiz63hstDn3mK7P++2na8UuWAYSWykK4eXITlcZXDRUGy
         hIqAu87p0y0Hag1EeKLFe9fAyxiTEYnUrFiPOWFaAyDzJY9swNO4qQxZahLTBI6DcOMc
         OhQQTTwU/AYxGr+moVftNS0dBle733M+48N15xIOBSg/fdr+BIOXDfM6R5HMtw7PQyYm
         dS6LvxuuBDOa/3An8uuRQeyp3peGBhWVtXE+DY+KZWmmmqv6RvsqbpR2v82n62R//Rtj
         8fqw==
X-Gm-Message-State: AOJu0YwL23iZBH2xwOo9nxVBNuyzn/y617+FZwlHZ+ixejjUzRKVrg5o
	jlscb/Csn/3qHg23O2xNWig=
X-Google-Smtp-Source: AGHT+IF4ycEz6nEuh7H0LHPJzm7S6F42GA5GwMWhCXVp35tpWzh2Uz1UI71fbUqJe1Q0eWODeWR8WQ==
X-Received: by 2002:a2e:81d8:0:b0:2c6:f625:cc61 with SMTP id s24-20020a2e81d8000000b002c6f625cc61mr4805116ljg.31.1700488278078;
        Mon, 20 Nov 2023 05:51:18 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:17 -0800 (PST)
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
Subject: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY package in DT
Date: Mon, 20 Nov 2023 14:50:31 +0100
Message-Id: <20231120135041.15259-5-ansuelsmth@gmail.com>
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

Add initial support for PHY package in DT.

Make it easier to define PHY package and describe the global PHY
directly in DT by refereincing them by phandles instead of custom
functions in each PHY driver.

Each PHY in a package needs to be defined in a dedicated node in the
mdio node. This dedicated node needs to have the compatible set to
"ethernet-phy-package" and define "global-phys" and "#global-phy-cells"
respectively to a list of phandle to the global phy to define for the
PHY package and 0 for cells as the phandle won't take any args.

With this defined, the generic PHY probe will join each PHY in this
dedicated node to the package.

PHY driver MUST set the required global PHY count in
.phy_package_global_phy_num to correctly verify that DT define the
correct number of phandle to the required global PHY.

mdio_bus.c and of_mdio.c is updated to now support and parse also
PHY package subnote that have the compatible "phy-package".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/of_mdio.c   | 60 ++++++++++++++++++++++-----------
 drivers/net/phy/mdio_bus.c   | 33 ++++++++++++++-----
 drivers/net/phy/phy_device.c | 64 ++++++++++++++++++++++++++++++++++++
 include/linux/phy.h          |  5 +++
 4 files changed, 135 insertions(+), 27 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 64ebcb6d235c..bb910651118f 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -139,6 +139,44 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
+				   bool *scanphys)
+{
+	struct device_node *child;
+	int addr, rc;
+
+	/* Loop over the child nodes and register a phy_device for each phy */
+	for_each_available_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "ethernet-phy-package")) {
+			rc = __of_mdiobus_parse_phys(mdio, child, scanphys);
+			if (rc && rc != -ENODEV)
+				return rc;
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
+			return rc;
+	}
+
+	return 0;
+}
+
 /**
  * __of_mdiobus_register - Register mii_bus and create PHYs from the device tree
  * @mdio: pointer to mii_bus structure
@@ -180,25 +218,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
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
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 25dcaa49ab8b..ecec20fd3fd3 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -455,19 +455,23 @@ EXPORT_SYMBOL(of_mdio_find_bus);
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
+			if (!of_mdiobus_find_phy(dev, mdiodev, child))
+				return 0;
+
+			continue;
+		}
+
 		addr = of_mdio_parse_addr(dev, child);
 		if (addr < 0)
 			continue;
@@ -477,9 +481,22 @@ static void of_mdiobus_link_mdiodev(struct mii_bus *bus,
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
index e016dbfb0d27..9ff76d84dca0 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3193,6 +3193,65 @@ static int of_phy_leds(struct phy_device *phydev)
 	return 0;
 }
 
+static int of_phy_package(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct of_phandle_args phy_phandle;
+	struct device_node *package_node;
+	int i, global_phys_num, ret;
+	int *global_phy_addrs;
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
+	ret = of_count_phandle_with_args(package_node, "global-phys", NULL);
+	if (ret < 0)
+		return 0;
+	global_phys_num = ret;
+
+	if (global_phys_num != phydev->drv->phy_package_global_phy_num)
+		return -EINVAL;
+
+	global_phy_addrs = kmalloc_array(global_phys_num, sizeof(*global_phy_addrs),
+					 GFP_KERNEL);
+	if (!global_phy_addrs)
+		return -ENOMEM;
+
+	for (i = 0; i < global_phys_num; i++) {
+		int addr;
+
+		ret = of_parse_phandle_with_args(package_node, "global-phys",
+						 NULL, i, &phy_phandle);
+		if (ret)
+			goto exit;
+
+		ret = of_property_read_u32(phy_phandle.np, "reg", &addr);
+		if (ret)
+			goto exit;
+
+		global_phy_addrs[i] = addr;
+	}
+
+	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phy_addrs,
+				    global_phys_num, 0);
+	if (ret)
+		goto exit;
+
+	phydev->shared->np = package_node;
+
+exit:
+	kfree(global_phy_addrs);
+
+	return ret;
+}
+
 /**
  * fwnode_mdio_find_device - Given a fwnode, find the mdio_device
  * @fwnode: pointer to the mdio_device's fwnode
@@ -3301,6 +3360,11 @@ static int phy_probe(struct device *dev)
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
index c2bb3f0b9dda..5bf90c49e5bd 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -339,6 +339,8 @@ struct mdio_bus_stats {
  * phy_package_leave().
  */
 struct phy_package_shared {
+	/* With PHY package defined in DT this points to the PHY package node */
+	struct device_node *np;
 	/* addrs list pointer */
 	/* note that this pointer is shared between different phydevs.
 	 * It is allocated and freed automatically by phy_package_join() and
@@ -888,6 +890,8 @@ struct phy_led {
  * @flags: A bitfield defining certain other features this PHY
  *   supports (like interrupts)
  * @driver_data: Static driver data
+ * @phy_package_global_phy_num: Num of the required global phy
+ *   for PHY package global configuration.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -905,6 +909,7 @@ struct phy_driver {
 	const unsigned long * const features;
 	u32 flags;
 	const void *driver_data;
+	unsigned int phy_package_global_phy_num;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


