Return-Path: <linux-arm-msm+bounces-19798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A88C4476
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 17:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F43281D71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 15:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6411657CAA;
	Mon, 13 May 2024 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMfEbpFh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390DA15E9B;
	Mon, 13 May 2024 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614921; cv=none; b=omW8gJTh6L8nV/Qm41XKOKH7Ii0Cb1I4kp9+aDxLLZdTAOIqVd0SlKSvkEelTaE5DaqhesK6PvDhtRnMAxVkpYQ+g7kGU09qTWxC1CqgXBZVzsvaA04kAGj/Tt6jZwdXeNh/Tq1JDq8FrARcXNNCXDndGiddwr3LjIFwUwRe6AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614921; c=relaxed/simple;
	bh=3vD1ZatVVNtCul1Ps1hwusFaMPVvSi5+kB5PvypqmL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qZhi7XpsBFPnu3+veRAHgZBo22BqQad5ZuSxQx2hUC49YuDM7Qi9D36OYdW9TKVDNPnTN1JvrjUUK22KgaCJM2bh6WaJeeLZaobgCFe1CHmutt0aD/v8O1uA/gTxG+lhoB9w9w/qbH9nIDLPrPqxzWabDOHoYzp46c+aNMXzXoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMfEbpFh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1CA9C113CC;
	Mon, 13 May 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715614920;
	bh=3vD1ZatVVNtCul1Ps1hwusFaMPVvSi5+kB5PvypqmL4=;
	h=From:To:Cc:Subject:Date:From;
	b=dMfEbpFhzKSVc6f1ygaLWHJdnNBA9pfNmDpAcr5txntirA+hZpcsw1WfUdw/fYKuX
	 4bg/0jRlDEth4U7weBKFO7HPsAoVV3J8r0Zow2+O4SIIWXb/nMQPbXuWj8kqeumZ9U
	 l4iVemAIInYx+2uXw+1m9F1HxzVO0+vnTBInqzEm6f+zWXMkMkhIYGOFUUktgXNi1e
	 g66FeA3xKFLV0I+pLUNCrcJLJFt40+TuEDsSP3KdvReSrACgJKcU4exK3njruWS+JR
	 n5EDmynI4YsQnG45rxIoxjJxVBCIbK+SvhTbyd1LGWM5xGTshZgh2lhYCgUOOS+nes
	 ugSQ1H5MdeiXw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	kabel@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	maxime.chevallier@bootlin.com,
	kory.maincent@bootlin.com,
	hayatake396@gmail.com,
	linux-arm-msm@vger.kernel.org,
	"Christophe Leroy" <christophe.leroy@csgroup.eu>,
	"Herve Codina" <herve.codina@bootlin.com>,
	"Florian Fainelli" <f.fainelli@gmail.com>,
	"Vladimir Oltean" <vladimir.oltean@nxp.com>,
	"Oleksij Rempel" <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	mwojtas@chromium.org,
	"Nathan Chancellor" <nathan@kernel.org>,
	"Antoine Tenart" <atenart@kernel.org>
Subject: [PATCH net-next] net: revert partially applied PHY topology series
Date: Mon, 13 May 2024 08:41:55 -0700
Message-ID: <20240513154156.104281-1-kuba@kernel.org>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series is causing issues with PHY drivers built as modules.
Since it was only partially applied and the merge window has
opened let's revert and try again for v6.11.

Revert 6916e461e793 ("net: phy: Introduce ethernet link topology representation")
Revert 0ec5ed6c130e ("net: sfp: pass the phy_device when disconnecting an sfp module's PHY")
Revert e75e4e074c44 ("net: phy: add helpers to handle sfp phy connect/disconnect")
Revert fdd353965b52 ("net: sfp: Add helper to return the SFP bus name")
Revert 841942bc6212 ("net: ethtool: Allow passing a phy index for some commands")

Link: https://lore.kernel.org/all/171242462917.4000.9759453824684907063.git-patchwork-notify@kernel.org/
Link: https://lore.kernel.org/all/20240507102822.2023826-1-maxime.chevallier@bootlin.com/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: andrew@lunn.ch
CC: hkallweit1@gmail.com
CC: linux@armlinux.org.uk
CC: kabel@kernel.org
CC: andersson@kernel.org
CC: konrad.dybcio@linaro.org
CC: maxime.chevallier@bootlin.com
CC: kory.maincent@bootlin.com
CC: hayatake396@gmail.com
CC: linux-arm-msm@vger.kernel.org
CC: "Russell King" <linux@armlinux.org.uk>
CC: "Christophe Leroy" <christophe.leroy@csgroup.eu>
CC: "Herve Codina" <herve.codina@bootlin.com>
CC: "Florian Fainelli" <f.fainelli@gmail.com>
CC: "Vladimir Oltean" <vladimir.oltean@nxp.com>
CC: "Marek Behún" <kabel@kernel.org>
CC: "Oleksij Rempel" <o.rempel@pengutronix.de>
CC: "Nicolò Veronese" <nicveronese@gmail.com>
CC: mwojtas@chromium.org
CC: "Nathan Chancellor" <nathan@kernel.org>
CC: "Antoine Tenart" <atenart@kernel.org>
---
 Documentation/networking/ethtool-netlink.rst |   7 --
 MAINTAINERS                                  |   2 -
 drivers/net/phy/Makefile                     |   2 +-
 drivers/net/phy/marvell-88x2222.c            |   2 -
 drivers/net/phy/marvell.c                    |   2 -
 drivers/net/phy/marvell10g.c                 |   2 -
 drivers/net/phy/phy_device.c                 |  55 ----------
 drivers/net/phy/phy_link_topology.c          | 105 -------------------
 drivers/net/phy/phylink.c                    |   3 +-
 drivers/net/phy/qcom/at803x.c                |   2 -
 drivers/net/phy/qcom/qca807x.c               |   2 -
 drivers/net/phy/sfp-bus.c                    |  15 +--
 include/linux/netdevice.h                    |   4 +-
 include/linux/phy.h                          |   6 --
 include/linux/phy_link_topology.h            |  72 -------------
 include/linux/phy_link_topology_core.h       |  25 -----
 include/linux/sfp.h                          |   8 +-
 include/uapi/linux/ethtool.h                 |  16 ---
 include/uapi/linux/ethtool_netlink.h         |   1 -
 net/core/dev.c                               |   9 --
 net/ethtool/netlink.c                        |  48 +--------
 net/ethtool/netlink.h                        |   5 -
 22 files changed, 8 insertions(+), 385 deletions(-)
 delete mode 100644 drivers/net/phy/phy_link_topology.c
 delete mode 100644 include/linux/phy_link_topology.h
 delete mode 100644 include/linux/phy_link_topology_core.h

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 8bc71f249448..160bfb0ae8ba 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -57,7 +57,6 @@ Structure of this header is
   ``ETHTOOL_A_HEADER_DEV_INDEX``  u32     device ifindex
   ``ETHTOOL_A_HEADER_DEV_NAME``   string  device name
   ``ETHTOOL_A_HEADER_FLAGS``      u32     flags common for all requests
-  ``ETHTOOL_A_HEADER_PHY_INDEX``  u32     phy device index
   ==============================  ======  =============================
 
 ``ETHTOOL_A_HEADER_DEV_INDEX`` and ``ETHTOOL_A_HEADER_DEV_NAME`` identify the
@@ -82,12 +81,6 @@ the behaviour is backward compatible, i.e. requests from old clients not aware
 of the flag should be interpreted the way the client expects. A client must
 not set flags it does not understand.
 
-``ETHTOOL_A_HEADER_PHY_INDEX`` identifies the Ethernet PHY the message relates to.
-As there are numerous commands that are related to PHY configuration, and because
-there may be more than one PHY on the link, the PHY index can be passed in the
-request for the commands that needs it. It is, however, not mandatory, and if it
-is not passed for commands that target a PHY, the net_device.phydev pointer
-is used.
 
 Bit sets
 ========
diff --git a/MAINTAINERS b/MAINTAINERS
index b81b2be60b77..7fbd52bc8710 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8021,8 +8021,6 @@ F:	include/linux/mii.h
 F:	include/linux/of_net.h
 F:	include/linux/phy.h
 F:	include/linux/phy_fixed.h
-F:	include/linux/phy_link_topology.h
-F:	include/linux/phy_link_topology_core.h
 F:	include/linux/phylib_stubs.h
 F:	include/linux/platform_data/mdio-bcm-unimac.h
 F:	include/linux/platform_data/mdio-gpio.h
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 1d8be374915f..202ed7f450da 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -2,7 +2,7 @@
 # Makefile for Linux PHY drivers
 
 libphy-y			:= phy.o phy-c45.o phy-core.o phy_device.o \
-				   linkmode.o phy_link_topology.o
+				   linkmode.o
 mdio-bus-y			+= mdio_bus.o mdio_device.o
 
 ifdef CONFIG_MDIO_DEVICE
diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index 0b777cdd7078..b88398e6872b 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -553,8 +553,6 @@ static const struct sfp_upstream_ops sfp_phy_ops = {
 	.link_down = mv2222_sfp_link_down,
 	.attach = phy_sfp_attach,
 	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
 };
 
 static int mv2222_probe(struct phy_device *phydev)
diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 9964bf3dea2f..b89fbffa6a93 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -3613,8 +3613,6 @@ static const struct sfp_upstream_ops m88e1510_sfp_ops = {
 	.module_remove = m88e1510_sfp_remove,
 	.attach = phy_sfp_attach,
 	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
 };
 
 static int m88e1510_probe(struct phy_device *phydev)
diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
index 6642eb642d4b..ad43e280930c 100644
--- a/drivers/net/phy/marvell10g.c
+++ b/drivers/net/phy/marvell10g.c
@@ -503,8 +503,6 @@ static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
 static const struct sfp_upstream_ops mv3310_sfp_ops = {
 	.attach = phy_sfp_attach,
 	.detach = phy_sfp_detach,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
 	.module_insert = mv3310_sfp_insert,
 };
 
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 616bd7ba46cb..6c6ec9475709 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -29,7 +29,6 @@
 #include <linux/phy.h>
 #include <linux/phylib_stubs.h>
 #include <linux/phy_led_triggers.h>
-#include <linux/phy_link_topology.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/property.h>
 #include <linux/rtnetlink.h>
@@ -277,14 +276,6 @@ static void phy_mdio_device_remove(struct mdio_device *mdiodev)
 
 static struct phy_driver genphy_driver;
 
-static struct phy_link_topology *phy_get_link_topology(struct phy_device *phydev)
-{
-	if (phydev->attached_dev)
-		return phydev->attached_dev->link_topo;
-
-	return NULL;
-}
-
 static LIST_HEAD(phy_fixup_list);
 static DEFINE_MUTEX(phy_fixup_lock);
 
@@ -1378,46 +1369,6 @@ phy_standalone_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(phy_standalone);
 
-/**
- * phy_sfp_connect_phy - Connect the SFP module's PHY to the upstream PHY
- * @upstream: pointer to the upstream phy device
- * @phy: pointer to the SFP module's phy device
- *
- * This helper allows keeping track of PHY devices on the link. It adds the
- * SFP module's phy to the phy namespace of the upstream phy
- */
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy)
-{
-	struct phy_device *phydev = upstream;
-	struct phy_link_topology *topo = phy_get_link_topology(phydev);
-
-	if (topo)
-		return phy_link_topo_add_phy(topo, phy, PHY_UPSTREAM_PHY, phydev);
-
-	return 0;
-}
-EXPORT_SYMBOL(phy_sfp_connect_phy);
-
-/**
- * phy_sfp_disconnect_phy - Disconnect the SFP module's PHY from the upstream PHY
- * @upstream: pointer to the upstream phy device
- * @phy: pointer to the SFP module's phy device
- *
- * This helper allows keeping track of PHY devices on the link. It removes the
- * SFP module's phy to the phy namespace of the upstream phy. As the module phy
- * will be destroyed, re-inserting the same module will add a new phy with a
- * new index.
- */
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy)
-{
-	struct phy_device *phydev = upstream;
-	struct phy_link_topology *topo = phy_get_link_topology(phydev);
-
-	if (topo)
-		phy_link_topo_del_phy(topo, phy);
-}
-EXPORT_SYMBOL(phy_sfp_disconnect_phy);
-
 /**
  * phy_sfp_attach - attach the SFP bus to the PHY upstream network device
  * @upstream: pointer to the phy device
@@ -1560,11 +1511,6 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 
 		if (phydev->sfp_bus_attached)
 			dev->sfp_bus = phydev->sfp_bus;
-
-		err = phy_link_topo_add_phy(dev->link_topo, phydev,
-					    PHY_UPSTREAM_MAC, dev);
-		if (err)
-			goto error;
 	}
 
 	/* Some Ethernet drivers try to connect to a PHY device before
@@ -1992,7 +1938,6 @@ void phy_detach(struct phy_device *phydev)
 	if (dev) {
 		phydev->attached_dev->phydev = NULL;
 		phydev->attached_dev = NULL;
-		phy_link_topo_del_phy(dev->link_topo, phydev);
 	}
 	phydev->phylink = NULL;
 
diff --git a/drivers/net/phy/phy_link_topology.c b/drivers/net/phy/phy_link_topology.c
deleted file mode 100644
index 985941c5c558..000000000000
--- a/drivers/net/phy/phy_link_topology.c
+++ /dev/null
@@ -1,105 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Infrastructure to handle all PHY devices connected to a given netdev,
- * either directly or indirectly attached.
- *
- * Copyright (c) 2023 Maxime Chevallier<maxime.chevallier@bootlin.com>
- */
-
-#include <linux/phy_link_topology.h>
-#include <linux/netdevice.h>
-#include <linux/phy.h>
-#include <linux/rtnetlink.h>
-#include <linux/xarray.h>
-
-struct phy_link_topology *phy_link_topo_create(struct net_device *dev)
-{
-	struct phy_link_topology *topo;
-
-	topo = kzalloc(sizeof(*topo), GFP_KERNEL);
-	if (!topo)
-		return ERR_PTR(-ENOMEM);
-
-	xa_init_flags(&topo->phys, XA_FLAGS_ALLOC1);
-	topo->next_phy_index = 1;
-
-	return topo;
-}
-
-void phy_link_topo_destroy(struct phy_link_topology *topo)
-{
-	if (!topo)
-		return;
-
-	xa_destroy(&topo->phys);
-	kfree(topo);
-}
-
-int phy_link_topo_add_phy(struct phy_link_topology *topo,
-			  struct phy_device *phy,
-			  enum phy_upstream upt, void *upstream)
-{
-	struct phy_device_node *pdn;
-	int ret;
-
-	pdn = kzalloc(sizeof(*pdn), GFP_KERNEL);
-	if (!pdn)
-		return -ENOMEM;
-
-	pdn->phy = phy;
-	switch (upt) {
-	case PHY_UPSTREAM_MAC:
-		pdn->upstream.netdev = (struct net_device *)upstream;
-		if (phy_on_sfp(phy))
-			pdn->parent_sfp_bus = pdn->upstream.netdev->sfp_bus;
-		break;
-	case PHY_UPSTREAM_PHY:
-		pdn->upstream.phydev = (struct phy_device *)upstream;
-		if (phy_on_sfp(phy))
-			pdn->parent_sfp_bus = pdn->upstream.phydev->sfp_bus;
-		break;
-	default:
-		ret = -EINVAL;
-		goto err;
-	}
-	pdn->upstream_type = upt;
-
-	/* Attempt to re-use a previously allocated phy_index */
-	if (phy->phyindex) {
-		ret = xa_insert(&topo->phys, phy->phyindex, pdn, GFP_KERNEL);
-
-		/* Errors could be either -ENOMEM or -EBUSY. If the phy has an
-		 * index, and there's another entry at the same index, this is
-		 * unexpected and we still error-out
-		 */
-		if (ret)
-			goto err;
-		return 0;
-	}
-
-	ret = xa_alloc_cyclic(&topo->phys, &phy->phyindex, pdn, xa_limit_32b,
-			      &topo->next_phy_index, GFP_KERNEL);
-	if (ret)
-		goto err;
-
-	return 0;
-
-err:
-	kfree(pdn);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(phy_link_topo_add_phy);
-
-void phy_link_topo_del_phy(struct phy_link_topology *topo,
-			   struct phy_device *phy)
-{
-	struct phy_device_node *pdn = xa_erase(&topo->phys, phy->phyindex);
-
-	/* We delete the PHY from the topology, however we don't re-set the
-	 * phy->phyindex field. If the PHY isn't gone, we can re-assign it the
-	 * same index next time it's added back to the topology
-	 */
-
-	kfree(pdn);
-}
-EXPORT_SYMBOL_GPL(phy_link_topo_del_phy);
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b7e5c669dc8e..994471fad833 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3411,8 +3411,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 	return ret;
 }
 
-static void phylink_sfp_disconnect_phy(void *upstream,
-				       struct phy_device *phydev)
+static void phylink_sfp_disconnect_phy(void *upstream)
 {
 	phylink_disconnect_phy(upstream);
 }
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 105602581a03..c8f83e5f78ab 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -770,8 +770,6 @@ static const struct sfp_upstream_ops at8031_sfp_ops = {
 	.attach = phy_sfp_attach,
 	.detach = phy_sfp_detach,
 	.module_insert = at8031_sfp_insert,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
 };
 
 static int at8031_parse_dt(struct phy_device *phydev)
diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 5eb0ab1cb70e..672c6929119a 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -699,8 +699,6 @@ static const struct sfp_upstream_ops qca807x_sfp_ops = {
 	.detach = phy_sfp_detach,
 	.module_insert = qca807x_sfp_insert,
 	.module_remove = qca807x_sfp_remove,
-	.connect_phy = phy_sfp_connect_phy,
-	.disconnect_phy = phy_sfp_disconnect_phy,
 };
 
 static int qca807x_probe(struct phy_device *phydev)
diff --git a/drivers/net/phy/sfp-bus.c b/drivers/net/phy/sfp-bus.c
index 37c85f1e6534..2f44fc51848f 100644
--- a/drivers/net/phy/sfp-bus.c
+++ b/drivers/net/phy/sfp-bus.c
@@ -487,7 +487,7 @@ static void sfp_unregister_bus(struct sfp_bus *bus)
 			bus->socket_ops->stop(bus->sfp);
 		bus->socket_ops->detach(bus->sfp);
 		if (bus->phydev && ops && ops->disconnect_phy)
-			ops->disconnect_phy(bus->upstream, bus->phydev);
+			ops->disconnect_phy(bus->upstream);
 	}
 	bus->registered = false;
 }
@@ -743,7 +743,7 @@ void sfp_remove_phy(struct sfp_bus *bus)
 	const struct sfp_upstream_ops *ops = sfp_get_upstream_ops(bus);
 
 	if (ops && ops->disconnect_phy)
-		ops->disconnect_phy(bus->upstream, bus->phydev);
+		ops->disconnect_phy(bus->upstream);
 	bus->phydev = NULL;
 }
 EXPORT_SYMBOL_GPL(sfp_remove_phy);
@@ -860,14 +860,3 @@ void sfp_unregister_socket(struct sfp_bus *bus)
 	sfp_bus_put(bus);
 }
 EXPORT_SYMBOL_GPL(sfp_unregister_socket);
-
-const char *sfp_get_name(struct sfp_bus *bus)
-{
-	ASSERT_RTNL();
-
-	if (bus->sfp_dev)
-		return dev_name(bus->sfp_dev);
-
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(sfp_get_name);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index cf261fb89d73..d20c6c99eb88 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -40,6 +40,7 @@
 #include <net/dcbnl.h>
 #endif
 #include <net/netprio_cgroup.h>
+
 #include <linux/netdev_features.h>
 #include <linux/neighbour.h>
 #include <uapi/linux/netdevice.h>
@@ -51,7 +52,6 @@
 #include <net/net_trackers.h>
 #include <net/net_debug.h>
 #include <net/dropreason-core.h>
-#include <linux/phy_link_topology_core.h>
 
 struct netpoll_info;
 struct device;
@@ -1975,7 +1975,6 @@ enum netdev_reg_state {
  *	@fcoe_ddp_xid:	Max exchange id for FCoE LRO by ddp
  *
  *	@priomap:	XXX: need comments on this one
- *	@link_topo:	Physical link topology tracking attached PHYs
  *	@phydev:	Physical device may attach itself
  *			for hardware timestamping
  *	@sfp_bus:	attached &struct sfp_bus structure.
@@ -2368,7 +2367,6 @@ struct net_device {
 #if IS_ENABLED(CONFIG_CGROUP_NET_PRIO)
 	struct netprio_map __rcu *priomap;
 #endif
-	struct phy_link_topology	*link_topo;
 	struct phy_device	*phydev;
 	struct sfp_bus		*sfp_bus;
 	struct lock_class_key	*qdisc_tx_busylock;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3ddfe7fe781a..e6e83304558e 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -550,9 +550,6 @@ struct macsec_ops;
  * @drv: Pointer to the driver for this PHY instance
  * @devlink: Create a link between phy dev and mac dev, if the external phy
  *           used by current mac interface is managed by another mac interface.
- * @phyindex: Unique id across the phy's parent tree of phys to address the PHY
- *	      from userspace, similar to ifindex. A zero index means the PHY
- *	      wasn't assigned an id yet.
  * @phy_id: UID for this device found during discovery
  * @c45_ids: 802.3-c45 Device Identifiers if is_c45.
  * @is_c45:  Set to true if this PHY uses clause 45 addressing.
@@ -653,7 +650,6 @@ struct phy_device {
 
 	struct device_link *devlink;
 
-	u32 phyindex;
 	u32 phy_id;
 
 	struct phy_c45_device_ids c45_ids;
@@ -1758,8 +1754,6 @@ int phy_suspend(struct phy_device *phydev);
 int phy_resume(struct phy_device *phydev);
 int __phy_resume(struct phy_device *phydev);
 int phy_loopback(struct phy_device *phydev, bool enable);
-int phy_sfp_connect_phy(void *upstream, struct phy_device *phy);
-void phy_sfp_disconnect_phy(void *upstream, struct phy_device *phy);
 void phy_sfp_attach(void *upstream, struct sfp_bus *bus);
 void phy_sfp_detach(void *upstream, struct sfp_bus *bus);
 int phy_sfp_probe(struct phy_device *phydev,
diff --git a/include/linux/phy_link_topology.h b/include/linux/phy_link_topology.h
deleted file mode 100644
index 6b79feb607e7..000000000000
--- a/include/linux/phy_link_topology.h
+++ /dev/null
@@ -1,72 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * PHY device list allow maintaining a list of PHY devices that are
- * part of a netdevice's link topology. PHYs can for example be chained,
- * as is the case when using a PHY that exposes an SFP module, on which an
- * SFP transceiver that embeds a PHY is connected.
- *
- * This list can then be used by userspace to leverage individual PHY
- * capabilities.
- */
-#ifndef __PHY_LINK_TOPOLOGY_H
-#define __PHY_LINK_TOPOLOGY_H
-
-#include <linux/ethtool.h>
-#include <linux/phy_link_topology_core.h>
-
-struct xarray;
-struct phy_device;
-struct net_device;
-struct sfp_bus;
-
-struct phy_device_node {
-	enum phy_upstream upstream_type;
-
-	union {
-		struct net_device	*netdev;
-		struct phy_device	*phydev;
-	} upstream;
-
-	struct sfp_bus *parent_sfp_bus;
-
-	struct phy_device *phy;
-};
-
-struct phy_link_topology {
-	struct xarray phys;
-	u32 next_phy_index;
-};
-
-static inline struct phy_device *
-phy_link_topo_get_phy(struct phy_link_topology *topo, u32 phyindex)
-{
-	struct phy_device_node *pdn = xa_load(&topo->phys, phyindex);
-
-	if (pdn)
-		return pdn->phy;
-
-	return NULL;
-}
-
-#if IS_REACHABLE(CONFIG_PHYLIB)
-int phy_link_topo_add_phy(struct phy_link_topology *topo,
-			  struct phy_device *phy,
-			  enum phy_upstream upt, void *upstream);
-
-void phy_link_topo_del_phy(struct phy_link_topology *lt, struct phy_device *phy);
-
-#else
-static inline int phy_link_topo_add_phy(struct phy_link_topology *topo,
-					struct phy_device *phy,
-					enum phy_upstream upt, void *upstream)
-{
-	return 0;
-}
-
-static inline void phy_link_topo_del_phy(struct phy_link_topology *topo,
-					 struct phy_device *phy)
-{
-}
-#endif
-
-#endif /* __PHY_LINK_TOPOLOGY_H */
diff --git a/include/linux/phy_link_topology_core.h b/include/linux/phy_link_topology_core.h
deleted file mode 100644
index 0a6479055745..000000000000
--- a/include/linux/phy_link_topology_core.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __PHY_LINK_TOPOLOGY_CORE_H
-#define __PHY_LINK_TOPOLOGY_CORE_H
-
-struct phy_link_topology;
-
-#if IS_REACHABLE(CONFIG_PHYLIB)
-
-struct phy_link_topology *phy_link_topo_create(struct net_device *dev);
-void phy_link_topo_destroy(struct phy_link_topology *topo);
-
-#else
-
-static inline struct phy_link_topology *phy_link_topo_create(struct net_device *dev)
-{
-	return NULL;
-}
-
-static inline void phy_link_topo_destroy(struct phy_link_topology *topo)
-{
-}
-
-#endif
-
-#endif /* __PHY_LINK_TOPOLOGY_CORE_H */
diff --git a/include/linux/sfp.h b/include/linux/sfp.h
index 5ebc57f78c95..a45da7eef9a2 100644
--- a/include/linux/sfp.h
+++ b/include/linux/sfp.h
@@ -544,7 +544,7 @@ struct sfp_upstream_ops {
 	void (*link_down)(void *priv);
 	void (*link_up)(void *priv);
 	int (*connect_phy)(void *priv, struct phy_device *);
-	void (*disconnect_phy)(void *priv, struct phy_device *);
+	void (*disconnect_phy)(void *priv);
 };
 
 #if IS_ENABLED(CONFIG_SFP)
@@ -570,7 +570,6 @@ struct sfp_bus *sfp_bus_find_fwnode(const struct fwnode_handle *fwnode);
 int sfp_bus_add_upstream(struct sfp_bus *bus, void *upstream,
 			 const struct sfp_upstream_ops *ops);
 void sfp_bus_del_upstream(struct sfp_bus *bus);
-const char *sfp_get_name(struct sfp_bus *bus);
 #else
 static inline int sfp_parse_port(struct sfp_bus *bus,
 				 const struct sfp_eeprom_id *id,
@@ -649,11 +648,6 @@ static inline int sfp_bus_add_upstream(struct sfp_bus *bus, void *upstream,
 static inline void sfp_bus_del_upstream(struct sfp_bus *bus)
 {
 }
-
-static inline const char *sfp_get_name(struct sfp_bus *bus)
-{
-	return NULL;
-}
 #endif
 
 #endif
diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index 041e09c3515d..8733a3117902 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -2323,20 +2323,4 @@ struct ethtool_link_settings {
 	 * __u32 map_lp_advertising[link_mode_masks_nwords];
 	 */
 };
-
-/**
- * enum phy_upstream - Represents the upstream component a given PHY device
- * is connected to, as in what is on the other end of the MII bus. Most PHYs
- * will be attached to an Ethernet MAC controller, but in some cases, there's
- * an intermediate PHY used as a media-converter, which will driver another
- * MII interface as its output.
- * @PHY_UPSTREAM_MAC: Upstream component is a MAC (a switch port,
- *		      or ethernet controller)
- * @PHY_UPSTREAM_PHY: Upstream component is a PHY (likely a media converter)
- */
-enum phy_upstream {
-	PHY_UPSTREAM_MAC,
-	PHY_UPSTREAM_PHY,
-};
-
 #endif /* _UAPI_LINUX_ETHTOOL_H */
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index f17dbe54bf5e..b49b804b9495 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -132,7 +132,6 @@ enum {
 	ETHTOOL_A_HEADER_DEV_INDEX,		/* u32 */
 	ETHTOOL_A_HEADER_DEV_NAME,		/* string */
 	ETHTOOL_A_HEADER_FLAGS,			/* u32 - ETHTOOL_FLAG_* */
-	ETHTOOL_A_HEADER_PHY_INDEX,		/* u32 */
 
 	/* add new constants above here */
 	__ETHTOOL_A_HEADER_CNT,
diff --git a/net/core/dev.c b/net/core/dev.c
index d2ce91a334c1..e1bb6d7856d9 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -158,7 +158,6 @@
 #include <net/page_pool/types.h>
 #include <net/page_pool/helpers.h>
 #include <net/rps.h>
-#include <linux/phy_link_topology_core.h>
 
 #include "dev.h"
 #include "net-sysfs.h"
@@ -10998,12 +10997,6 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
 #ifdef CONFIG_NET_SCHED
 	hash_init(dev->qdisc_hash);
 #endif
-	dev->link_topo = phy_link_topo_create(dev);
-	if (IS_ERR(dev->link_topo)) {
-		dev->link_topo = NULL;
-		goto free_all;
-	}
-
 	dev->priv_flags = IFF_XMIT_DST_RELEASE | IFF_XMIT_DST_RELEASE_PERM;
 	setup(dev);
 
@@ -11092,8 +11085,6 @@ void free_netdev(struct net_device *dev)
 	free_percpu(dev->xdp_bulkq);
 	dev->xdp_bulkq = NULL;
 
-	phy_link_topo_destroy(dev->link_topo);
-
 	/*  Compatibility with error handling in drivers */
 	if (dev->reg_state == NETREG_UNINITIALIZED ||
 	    dev->reg_state == NETREG_DUMMY) {
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 563e94e0cbd8..bd04f28d5cf4 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -4,7 +4,6 @@
 #include <linux/ethtool_netlink.h>
 #include <linux/pm_runtime.h>
 #include "netlink.h"
-#include <linux/phy_link_topology.h>
 
 static struct genl_family ethtool_genl_family;
 
@@ -31,24 +30,6 @@ const struct nla_policy ethnl_header_policy_stats[] = {
 							  ETHTOOL_FLAGS_STATS),
 };
 
-const struct nla_policy ethnl_header_policy_phy[] = {
-	[ETHTOOL_A_HEADER_DEV_INDEX]	= { .type = NLA_U32 },
-	[ETHTOOL_A_HEADER_DEV_NAME]	= { .type = NLA_NUL_STRING,
-					    .len = ALTIFNAMSIZ - 1 },
-	[ETHTOOL_A_HEADER_FLAGS]	= NLA_POLICY_MASK(NLA_U32,
-							  ETHTOOL_FLAGS_BASIC),
-	[ETHTOOL_A_HEADER_PHY_INDEX]		= NLA_POLICY_MIN(NLA_U32, 1),
-};
-
-const struct nla_policy ethnl_header_policy_phy_stats[] = {
-	[ETHTOOL_A_HEADER_DEV_INDEX]	= { .type = NLA_U32 },
-	[ETHTOOL_A_HEADER_DEV_NAME]	= { .type = NLA_NUL_STRING,
-					    .len = ALTIFNAMSIZ - 1 },
-	[ETHTOOL_A_HEADER_FLAGS]	= NLA_POLICY_MASK(NLA_U32,
-							  ETHTOOL_FLAGS_STATS),
-	[ETHTOOL_A_HEADER_PHY_INDEX]		= NLA_POLICY_MIN(NLA_U32, 1),
-};
-
 int ethnl_ops_begin(struct net_device *dev)
 {
 	int ret;
@@ -108,9 +89,8 @@ int ethnl_parse_header_dev_get(struct ethnl_req_info *req_info,
 			       const struct nlattr *header, struct net *net,
 			       struct netlink_ext_ack *extack, bool require_dev)
 {
-	struct nlattr *tb[ARRAY_SIZE(ethnl_header_policy_phy)];
+	struct nlattr *tb[ARRAY_SIZE(ethnl_header_policy)];
 	const struct nlattr *devname_attr;
-	struct phy_device *phydev = NULL;
 	struct net_device *dev = NULL;
 	u32 flags = 0;
 	int ret;
@@ -124,7 +104,7 @@ int ethnl_parse_header_dev_get(struct ethnl_req_info *req_info,
 	/* No validation here, command policy should have a nested policy set
 	 * for the header, therefore validation should have already been done.
 	 */
-	ret = nla_parse_nested(tb, ARRAY_SIZE(ethnl_header_policy_phy) - 1, header,
+	ret = nla_parse_nested(tb, ARRAY_SIZE(ethnl_header_policy) - 1, header,
 			       NULL, extack);
 	if (ret < 0)
 		return ret;
@@ -165,30 +145,6 @@ int ethnl_parse_header_dev_get(struct ethnl_req_info *req_info,
 		return -EINVAL;
 	}
 
-	if (dev) {
-		if (tb[ETHTOOL_A_HEADER_PHY_INDEX]) {
-			struct nlattr *phy_id;
-
-			phy_id = tb[ETHTOOL_A_HEADER_PHY_INDEX];
-			phydev = phy_link_topo_get_phy(dev->link_topo,
-						       nla_get_u32(phy_id));
-			if (!phydev) {
-				NL_SET_BAD_ATTR(extack, phy_id);
-				return -ENODEV;
-			}
-		} else {
-			/* If we need a PHY but no phy index is specified, fallback
-			 * to dev->phydev
-			 */
-			phydev = dev->phydev;
-		}
-	} else if (tb[ETHTOOL_A_HEADER_PHY_INDEX]) {
-		NL_SET_ERR_MSG_ATTR(extack, header,
-				    "can't target a PHY without a netdev");
-		return -EINVAL;
-	}
-
-	req_info->phydev = phydev;
 	req_info->dev = dev;
 	req_info->flags = flags;
 	return 0;
diff --git a/net/ethtool/netlink.h b/net/ethtool/netlink.h
index d57a890b5d9e..9a333a8d04c1 100644
--- a/net/ethtool/netlink.h
+++ b/net/ethtool/netlink.h
@@ -250,7 +250,6 @@ static inline unsigned int ethnl_reply_header_size(void)
  * @dev:   network device the request is for (may be null)
  * @dev_tracker: refcount tracker for @dev reference
  * @flags: request flags common for all request types
- * @phydev: phy_device connected to @dev this request is for (may be null)
  *
  * This is a common base for request specific structures holding data from
  * parsed userspace request. These always embed struct ethnl_req_info at
@@ -260,7 +259,6 @@ struct ethnl_req_info {
 	struct net_device	*dev;
 	netdevice_tracker	dev_tracker;
 	u32			flags;
-	struct phy_device	*phydev;
 };
 
 static inline void ethnl_parse_header_dev_put(struct ethnl_req_info *req_info)
@@ -397,12 +395,9 @@ extern const struct ethnl_request_ops ethnl_rss_request_ops;
 extern const struct ethnl_request_ops ethnl_plca_cfg_request_ops;
 extern const struct ethnl_request_ops ethnl_plca_status_request_ops;
 extern const struct ethnl_request_ops ethnl_mm_request_ops;
-extern const struct ethnl_request_ops ethnl_phy_request_ops;
 
 extern const struct nla_policy ethnl_header_policy[ETHTOOL_A_HEADER_FLAGS + 1];
 extern const struct nla_policy ethnl_header_policy_stats[ETHTOOL_A_HEADER_FLAGS + 1];
-extern const struct nla_policy ethnl_header_policy_phy[ETHTOOL_A_HEADER_PHY_INDEX + 1];
-extern const struct nla_policy ethnl_header_policy_phy_stats[ETHTOOL_A_HEADER_PHY_INDEX + 1];
 extern const struct nla_policy ethnl_strset_get_policy[ETHTOOL_A_STRSET_COUNTS_ONLY + 1];
 extern const struct nla_policy ethnl_linkinfo_get_policy[ETHTOOL_A_LINKINFO_HEADER + 1];
 extern const struct nla_policy ethnl_linkinfo_set_policy[ETHTOOL_A_LINKINFO_TP_MDIX_CTRL + 1];
-- 
2.45.0


