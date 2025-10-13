Return-Path: <linux-arm-msm+bounces-77019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F06DBBD38BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A4AC4F39A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B442E221F20;
	Mon, 13 Oct 2025 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mNfuKymH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8B274669
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 14:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760365954; cv=none; b=fbVLDmST/YyH1yQAf+Dc1IlpgsSmuHBAtsCr+BMVGRLMRoEb/iBMGZKo8zV7WXlYE6tYXonZ1lP4hs7l/76y/Py8TauGKn+wOet2jK/1p3Gqh2Wu+QfBLFPz5ucNKdB0sjuffCFZuAk5oJmS6swRSS3jE87zkfg9gqaOuhcDvYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760365954; c=relaxed/simple;
	bh=zxTv9y39HrjftvjjrnyNuAesDHv0Iy/Na3SdIwrBKLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXoBDg3nTv7Dz71NgQel8TsGWh7f3KPASWhGDxvwMidwn32G1ecU6ScDfcavVwI6vWrowtRQj80UnS1QcHpj2HuQjLGDFli/6ieVTlsB1wtLVSf+Ny7TaeM/Vk1He1wb9yRVUX+89oqPhxkYQ+sRklJcIXNiQMa7K3JQ6BwktKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mNfuKymH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A967AC0939E;
	Mon, 13 Oct 2025 14:32:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A0B606C6;
	Mon, 13 Oct 2025 14:32:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C789C102F226C;
	Mon, 13 Oct 2025 16:32:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760365949; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hoilUE0z6y6JH7ql80Yc6Cix1mWn1wM2yl2LMcLalfE=;
	b=mNfuKymHtoHPpusUbEc4fwzTyg08GEYfjXir7pnHqnH30iNRxrADZX+lNGofmNXDSLfrVU
	uPh6uvNmfbgmC2oH7YypYOYbF4/wR9LjBrTFQOHFz54WF5WDJNH9lCBcKOcdmpjWP7Y1ON
	6eBZsrzifEo5DtcmwSKhtYtjUwyOjVipEnU4a2HpEY4AoDh10jIzToIsG09Tob/6YgNxcf
	Wcj1anY3BEpCM2Bc1yS1ayVS6C/looMqWdA/yjGBHmhmgVyPo1kep6aOjErAB4HYTBtyJY
	KaLeXzbr+h16ZaCfLlhVioi3QKMVmjm+X92K2caDEPOGjXVyo+2D+o/A91/UGg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v14 03/16] net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
Date: Mon, 13 Oct 2025 16:31:29 +0200
Message-ID: <20251013143146.364919-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In an effort to have a better representation of Ethernet ports,
introduce enumeration values representing the various ethernet Mediums.

This is part of the 802.3 naming convention, for example :

1000 Base T 4
 |    |   | |
 |    |   | \_ lanes (4)
 |    |   \___ Medium (T == Twisted Copper Pairs)
 |    \_______ Baseband transmission
 \____________ Speed

 Other example :

10000 Base K X 4
           | | \_ lanes (4)
           | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
           \_____ Medium (K is backplane ethernet)

In the case of representing a physical port, only the medium and number
of lanes should be relevant. One exception would be 1000BaseX, which is
currently also used as a medium in what appears to be any of
1000BaseSX, 1000BaseCX and 1000BaseLX. This was reflected in the mediums
associated with the 1000BaseX linkmode.

These mediums are set in the net/ethtool/common.c lookup table that
maintains a list of all linkmodes with their number of lanes, medium,
encoding, speed and duplex.

One notable exception to this is 100M BaseT Ethernet. 100BaseTX is a
2-lanes protocol but it will also work on 4-lanes cables, so the lookup
table contains 2 sets of lane numbers, indicating the min number of lanes
for a protocol to work and the "nominal" number of lanes as well.

Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
.mediums bitfield with all appropriate mediums.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_caps.c   |   8 ++
 include/linux/ethtool.h      |  18 ++-
 include/uapi/linux/ethtool.h |  20 +++
 net/ethtool/common.c         | 265 +++++++++++++++++++++--------------
 4 files changed, 199 insertions(+), 112 deletions(-)

diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 23c808b59b6f..f3fbe5d127af 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -78,6 +78,14 @@ int __init phy_caps_init(void)
 	/* Fill the caps array from net/ethtool/common.c */
 	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
 		linkmode = &link_mode_params[i];
+
+		/* Sanity check the linkmodes array for number of lanes */
+		if (linkmode->lanes < linkmode->min_lanes) {
+			pr_err("Lanes count must not be under min_lanes for linkmode %d\n",
+			       i);
+			return -EINVAL;
+		}
+
 		capa = speed_duplex_to_capa(linkmode->speed, linkmode->duplex);
 
 		if (capa < 0) {
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c2d8b4ec62eb..183a4888b63f 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -216,13 +216,25 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
 void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
 
 struct link_mode_info {
-	int                             speed;
-	u8                              lanes;
-	u8                              duplex;
+	int	speed;
+	u8	min_lanes;
+	u8	lanes;
+	u8	duplex;
+	u16	mediums;
 };
 
 extern const struct link_mode_info link_mode_params[];
 
+extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
+
+static inline const char *phy_mediums(enum ethtool_link_medium medium)
+{
+	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
+		return "unknown";
+
+	return ethtool_link_medium_names[medium];
+}
+
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
index 8bd5ea5469d9..6ed235053aed 100644
--- a/include/uapi/linux/ethtool.h
+++ b/include/uapi/linux/ethtool.h
@@ -2587,4 +2587,24 @@ enum phy_upstream {
 	PHY_UPSTREAM_PHY,
 };
 
+enum ethtool_link_medium {
+	ETHTOOL_LINK_MEDIUM_BASET = 0,
+	ETHTOOL_LINK_MEDIUM_BASEK,
+	ETHTOOL_LINK_MEDIUM_BASES,
+	ETHTOOL_LINK_MEDIUM_BASEC,
+	ETHTOOL_LINK_MEDIUM_BASEL,
+	ETHTOOL_LINK_MEDIUM_BASED,
+	ETHTOOL_LINK_MEDIUM_BASEE,
+	ETHTOOL_LINK_MEDIUM_BASEF,
+	ETHTOOL_LINK_MEDIUM_BASEV,
+	ETHTOOL_LINK_MEDIUM_BASEMLD,
+	ETHTOOL_LINK_MEDIUM_NONE,
+
+	__ETHTOOL_LINK_MEDIUM_LAST,
+};
+
+#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
+				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
+
 #endif /* _UAPI_LINUX_ETHTOOL_H */
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 82d3df02164f..fd668f651d20 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -281,12 +281,32 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_DR8_2		8
 #define __LINK_MODE_LANES_T1BRR		1
 
-#define __DEFINE_LINK_MODE_PARAMS(_speed, _type, _duplex)	\
+#define __DEFINE_LINK_MODE_PARAMS_LANES(_speed, _type, _min_lanes, _lanes, _duplex, _medium) \
 	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
 		.speed  = SPEED_ ## _speed, \
+		.min_lanes  = _min_lanes, \
+		.lanes  = _lanes, \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium) \
+	}
+
+#define __DEFINE_LINK_MODE_PARAMS(_speed, _type, _duplex, _medium)	\
+	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
+		.speed  = SPEED_ ## _speed, \
+		.min_lanes  = __LINK_MODE_LANES_ ## _type, \
+		.lanes  = __LINK_MODE_LANES_ ## _type, \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium) \
+	}
+#define __DEFINE_LINK_MODE_PARAMS_MEDIUMS(_speed, _type, _duplex, _mediums)	\
+	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
+		.speed  = SPEED_ ## _speed, \
+		.min_lanes  = __LINK_MODE_LANES_ ## _type, \
 		.lanes  = __LINK_MODE_LANES_ ## _type, \
-		.duplex	= __DUPLEX_ ## _duplex \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = (_mediums) \
 	}
+#define __MED(_medium)	(BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium))
 #define __DUPLEX_Half DUPLEX_HALF
 #define __DUPLEX_Full DUPLEX_FULL
 #define __DEFINE_SPECIAL_MODE_PARAMS(_mode) \
@@ -294,138 +314,165 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 		.speed	= SPEED_UNKNOWN, \
 		.lanes	= 0, \
 		.duplex	= DUPLEX_UNKNOWN, \
+		.mediums = BIT(ETHTOOL_LINK_MEDIUM_NONE), \
 	}
 
 const struct link_mode_info link_mode_params[] = {
-	__DEFINE_LINK_MODE_PARAMS(10, T, Half),
-	__DEFINE_LINK_MODE_PARAMS(10, T, Full),
-	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
-	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
-	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
-	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
+	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_LANES(10, T, 2, 4, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_LANES(100, T, 2, 4, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(1000, T, Half, T),
+	__DEFINE_LINK_MODE_PARAMS(1000, T, Full, T),
 	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
 	__DEFINE_SPECIAL_MODE_PARAMS(TP),
 	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
 	__DEFINE_SPECIAL_MODE_PARAMS(MII),
 	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
 	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
-	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
+	__DEFINE_LINK_MODE_PARAMS(10000, T, Full, T),
 	__DEFINE_SPECIAL_MODE_PARAMS(Pause),
 	__DEFINE_SPECIAL_MODE_PARAMS(Asym_Pause),
-	__DEFINE_LINK_MODE_PARAMS(2500, X, Full),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(2500, X, Full,
+					  __MED(C) | __MED(S) | __MED(L)),
 	__DEFINE_SPECIAL_MODE_PARAMS(Backplane),
-	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
+	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),
 	[ETHTOOL_LINK_MODE_10000baseR_FEC_BIT] = {
 		.speed	= SPEED_10000,
 		.lanes	= 1,
 		.duplex = DUPLEX_FULL,
 	},
-	__DEFINE_LINK_MODE_PARAMS(20000, MLD2, Full),
-	__DEFINE_LINK_MODE_PARAMS(20000, KR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(40000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(40000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(40000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(40000, LR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(56000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(56000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(56000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(56000, LR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(25000, CR, Full),
-	__DEFINE_LINK_MODE_PARAMS(25000, KR, Full),
-	__DEFINE_LINK_MODE_PARAMS(25000, SR, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, CR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, KR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, LR4_ER4, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, SR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(1000, X, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, CR, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, SR, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, LR, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, LRM, Full),
-	__DEFINE_LINK_MODE_PARAMS(10000, ER, Full),
-	__DEFINE_LINK_MODE_PARAMS(2500, T, Full),
-	__DEFINE_LINK_MODE_PARAMS(5000, T, Full),
+	__DEFINE_LINK_MODE_PARAMS(20000, MLD2, Full, MLD),
+	__DEFINE_LINK_MODE_PARAMS(20000, KR2, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(40000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(40000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(40000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(40000, LR4, Full, L),
+	__DEFINE_LINK_MODE_PARAMS(56000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(56000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(56000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(56000, LR4, Full, L),
+	__DEFINE_LINK_MODE_PARAMS(25000, CR, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(25000, KR, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(25000, SR, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(50000, CR2, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(50000, KR2, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(100000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(100000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(100000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(100000, LR4_ER4, Full,
+					  __MED(L) | __MED(E)),
+	__DEFINE_LINK_MODE_PARAMS(50000, SR2, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(1000, X, Full,
+					  __MED(C) | __MED(S) | __MED(L)),
+	__DEFINE_LINK_MODE_PARAMS(10000, CR, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(10000, SR, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(10000, LR, Full, L),
+	__DEFINE_LINK_MODE_PARAMS(10000, LRM, Full, L),
+	__DEFINE_LINK_MODE_PARAMS(10000, ER, Full, E),
+	__DEFINE_LINK_MODE_PARAMS(2500, T, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(5000, T, Full, T),
 	__DEFINE_SPECIAL_MODE_PARAMS(FEC_NONE),
 	__DEFINE_SPECIAL_MODE_PARAMS(FEC_RS),
 	__DEFINE_SPECIAL_MODE_PARAMS(FEC_BASER),
-	__DEFINE_LINK_MODE_PARAMS(50000, KR, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, SR, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, CR, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, LR_ER_FR, Full),
-	__DEFINE_LINK_MODE_PARAMS(50000, DR, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, KR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, SR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, CR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, LR2_ER2_FR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, DR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, LR4_ER4_FR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, DR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(100, T1, Full),
-	__DEFINE_LINK_MODE_PARAMS(1000, T1, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, KR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, SR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, LR8_ER8_FR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, DR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, CR8, Full),
+	__DEFINE_LINK_MODE_PARAMS(50000, KR, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(50000, SR, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(50000, CR, Full, C),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(50000, LR_ER_FR, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(50000, DR, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(100000, KR2, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(100000, SR2, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(100000, CR2, Full, C),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(100000, LR2_ER2_FR2, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(100000, DR2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(200000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(200000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(200000, LR4_ER4_FR4, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(200000, DR4, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(200000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(100, T1, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(1000, T1, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(400000, KR8, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(400000, SR8, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(400000, LR8_ER8_FR8, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(400000, DR8, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(400000, CR8, Full, C),
 	__DEFINE_SPECIAL_MODE_PARAMS(FEC_LLRS),
-	__DEFINE_LINK_MODE_PARAMS(100000, KR, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, SR, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, LR_ER_FR, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, DR, Full),
-	__DEFINE_LINK_MODE_PARAMS(100000, CR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, KR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, SR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, LR2_ER2_FR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, DR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, CR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, LR4_ER4_FR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, DR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(100, FX, Half),
-	__DEFINE_LINK_MODE_PARAMS(100, FX, Full),
-	__DEFINE_LINK_MODE_PARAMS(10, T1L, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, CR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, KR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, DR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, DR8_2, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, SR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, VR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(10, T1S, Full),
-	__DEFINE_LINK_MODE_PARAMS(10, T1S, Half),
-	__DEFINE_LINK_MODE_PARAMS(10, T1S_P2MP, Half),
-	__DEFINE_LINK_MODE_PARAMS(10, T1BRR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, CR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, KR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, DR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, DR_2, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, SR, Full),
-	__DEFINE_LINK_MODE_PARAMS(200000, VR, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, CR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, KR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, DR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, DR2_2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, SR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(400000, VR2, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, CR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, KR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, DR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, DR4_2, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, SR4, Full),
-	__DEFINE_LINK_MODE_PARAMS(800000, VR4, Full),
+	__DEFINE_LINK_MODE_PARAMS(100000, KR, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(100000, SR, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(100000, LR_ER_FR, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(100000, DR, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(100000, CR, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(200000, KR2, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(200000, SR2, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(200000, LR2_ER2_FR2, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(200000, DR2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(200000, CR2, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(400000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(400000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(400000, LR4_ER4_FR4, Full,
+					  __MED(L) | __MED(E) | __MED(F)),
+	__DEFINE_LINK_MODE_PARAMS(400000, DR4, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(400000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(100, FX, Half, F),
+	__DEFINE_LINK_MODE_PARAMS(100, FX, Full, F),
+	__DEFINE_LINK_MODE_PARAMS(10, T1L, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(800000, CR8, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(800000, KR8, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR8, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR8_2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, SR8, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(800000, VR8, Full, V),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S, Half, T),
+	__DEFINE_LINK_MODE_PARAMS(10, T1S_P2MP, Half, T),
+	__DEFINE_LINK_MODE_PARAMS(10, T1BRR, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(200000, CR, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(200000, KR, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(200000, DR, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(200000, DR_2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(200000, SR, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(200000, VR, Full, V),
+	__DEFINE_LINK_MODE_PARAMS(400000, CR2, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(400000, KR2, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(400000, DR2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(400000, DR2_2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(400000, SR2, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(400000, VR2, Full, V),
+	__DEFINE_LINK_MODE_PARAMS(800000, CR4, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(800000, KR4, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR4, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR4_2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, SR4, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(800000, VR4, Full, V),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 EXPORT_SYMBOL_GPL(link_mode_params);
 
+const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
+	[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
+	[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
+	[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
+	[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
+	[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
+	[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
+	[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
+	[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
+	[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
+	[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
+	[ETHTOOL_LINK_MEDIUM_NONE] = "None",
+};
+static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);
+EXPORT_SYMBOL_GPL(ethtool_link_medium_names);
+
 const char netif_msg_class_names[][ETH_GSTRING_LEN] = {
 	[NETIF_MSG_DRV_BIT]		= "drv",
 	[NETIF_MSG_PROBE_BIT]		= "probe",
-- 
2.49.0


