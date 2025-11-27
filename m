Return-Path: <linux-arm-msm+bounces-83630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C918C8FA3B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 591D44E877C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 17:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FF12EB840;
	Thu, 27 Nov 2025 17:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iEhy3XIK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403402EF66E;
	Thu, 27 Nov 2025 17:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764263907; cv=none; b=NYKc3RyIQBFg65F414zuHqhUZfOFqkqbW/iqroTKRTAf2PiwmyBECEjFnNQmk7hyrgsDTjm4bF2VFMNp/tVjMfzxmS3MK6G0kS23VLeEvpaKQMRm5cUn9pCzvVJEiS0cJd8UWGLlIZOUyuJiCrVT6c1PArCMbgKXLsWltwoU/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764263907; c=relaxed/simple;
	bh=a6Ybtfayc8mv9+zn8QiCJbdfkmBAH6L++spD5asVE8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RlzP98CgguzxtgoOEklPzZbn/98zZnyB9rms31DOGTQCvJklsXfrsOrJ8xgA4MWjq+nRYL6zvb5cQApTDO46XS1a5VVZjEx93PcDwRIUT+ojyxzxkEqHdHGlxDNVqWw8F+KtlfMc4rNWUrFeijv5lWpV+kjxC3CcgeTyChbY+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iEhy3XIK; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B1A661A1DCC;
	Thu, 27 Nov 2025 17:18:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852DD60722;
	Thu, 27 Nov 2025 17:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2752102F2846;
	Thu, 27 Nov 2025 18:18:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764263900; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/yLwYx0BP/BT1LzcwuhEDJnYUeyhQIvuMWKGzNjzv8E=;
	b=iEhy3XIKMWCxYdgfyA0/8tHyC+PpgcrYyqhKVnxw+5UG+sPrSX9kwvphQPKkEA8hP1gims
	1/ZvnaeBvIibBtqQwXHcZSHeFTKXcIeWcXeysCyaawuF+4UwlDPQhKUcPFkY7zGLAF2Nv3
	LZ1mnjdbhNy/AcXQjVvQxGyB+MwQJwmur3ihv2nIhfL+vEMyOcPaR5GiyJDzly51QIOUKW
	bs73JeQbhL+kanUCBfjvV6JbGHYdqq2TzkA80UCzuwh+5qru3mSahwJbgRfbrUyPhyMTMY
	ijAf3V9C0BI9bmwm2Oc3Q/wfKt5wNJxkzkb4i9EFcQ9ZV5LviNVKfBPI3NVIlw==
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net-next v20 02/14] net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
Date: Thu, 27 Nov 2025 18:17:45 +0100
Message-ID: <20251127171800.171330-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
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
 |    |   | \_ pairs (4)
 |    |   \___ Medium (T == Twisted Copper Pairs)
 |    \_______ Baseband transmission
 \____________ Speed

 Other example :

10000 Base K X 4
           | | \_ lanes (4)
           | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
           \_____ Medium (K is backplane ethernet)

In the case of representing a physical port, only the medium and number
of pairs should be relevant. One exception would be 1000BaseX, which is
currently also used as a medium in what appears to be any of
1000BaseSX, 1000BaseCX and 1000BaseLX. This was reflected in the mediums
associated with the 1000BaseX linkmode.

These mediums are set in the net/ethtool/common.c lookup table that
maintains a list of all linkmodes with their number of pairs, medium,
encoding, speed and duplex.

One notable exception to this is 100M BaseT Ethernet. 100BaseTX is a
2-pairs protocol but it will also work on 4-pairs cables, so the lookup
table contains 2 sets of pair numbers, indicating the min number of pairs
for a protocol to work and the "nominal" number of pairs as well.

Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
.mediums bitfield with all appropriate mediums.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phy_caps.c |   8 ++
 include/linux/ethtool.h    |  25 +++-
 net/ethtool/common.c       | 260 +++++++++++++++++++++----------------
 3 files changed, 177 insertions(+), 116 deletions(-)

diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
index 3a05982b39bf..a0fa242723d7 100644
--- a/drivers/net/phy/phy_caps.c
+++ b/drivers/net/phy/phy_caps.c
@@ -80,6 +80,14 @@ int __init phy_caps_init(void)
 	/* Fill the caps array from net/ethtool/common.c */
 	for (i = 0; i < __ETHTOOL_LINK_MODE_MASK_NBITS; i++) {
 		linkmode = &link_mode_params[i];
+
+		/* Sanity check the linkmodes array for number of pairs */
+		if (linkmode->pairs < linkmode->min_pairs) {
+			pr_err("Pairs count must not be under min_pairs for linkmode %d\n",
+			       i);
+			return -EINVAL;
+		}
+
 		capa = speed_duplex_to_capa(linkmode->speed, linkmode->duplex);
 
 		if (capa < 0) {
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 5c9162193d26..37aede6af96f 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -216,13 +216,32 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
 void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
 
 struct link_mode_info {
-	int                             speed;
-	u8                              lanes;
-	u8                              duplex;
+	int	speed;
+	u8	lanes;
+	u8	min_pairs;
+	u8	pairs;
+	u8	duplex;
+	u16	mediums;
 };
 
 extern const struct link_mode_info link_mode_params[];
 
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
 /* declare a link mode bitmap */
 #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
 	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 369c05cf8163..8e8f11e412bf 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -285,12 +285,35 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_DR8_2		8
 #define __LINK_MODE_LANES_T1BRR		1
 
-#define __DEFINE_LINK_MODE_PARAMS(_speed, _type, _duplex)	\
+#define __DEFINE_LINK_MODE_PARAMS_PAIRS(_speed, _type, _min_pairs, _pairs, _duplex, _medium) \
 	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
 		.speed  = SPEED_ ## _speed, \
 		.lanes  = __LINK_MODE_LANES_ ## _type, \
-		.duplex	= __DUPLEX_ ## _duplex \
+		.min_pairs = _min_pairs, \
+		.pairs = _pairs, \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium) \
 	}
+
+#define __DEFINE_LINK_MODE_PARAMS(_speed, _type, _duplex, _medium)	\
+	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
+		.speed  = SPEED_ ## _speed, \
+		.lanes  = __LINK_MODE_LANES_ ## _type, \
+		.min_pairs = 0, \
+		.pairs = 0, \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium) \
+	}
+#define __DEFINE_LINK_MODE_PARAMS_MEDIUMS(_speed, _type, _duplex, _mediums)	\
+	[ETHTOOL_LINK_MODE(_speed, _type, _duplex)] = {		\
+		.speed  = SPEED_ ## _speed, \
+		.lanes  = __LINK_MODE_LANES_ ## _type, \
+		.min_pairs = 0, \
+		.pairs = 0, \
+		.duplex	= __DUPLEX_ ## _duplex, \
+		.mediums = (_mediums) \
+	}
+#define __MED(_medium)	(BIT(ETHTOOL_LINK_MEDIUM_BASE ## _medium))
 #define __DUPLEX_Half DUPLEX_HALF
 #define __DUPLEX_Full DUPLEX_FULL
 #define __DEFINE_SPECIAL_MODE_PARAMS(_mode) \
@@ -298,138 +321,149 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
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
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Full, T),
 	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
 	__DEFINE_SPECIAL_MODE_PARAMS(TP),
 	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
 	__DEFINE_SPECIAL_MODE_PARAMS(MII),
 	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
 	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
-	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10000, T, 4, 4, Full, T),
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
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(2500, T, 4, 4, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(5000, T, 4, 4, Full, T),
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
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T1, 1, 1, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T1, 1, 1, Full, T),
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
-	__DEFINE_LINK_MODE_PARAMS(1600000, CR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(1600000, KR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(1600000, DR8, Full),
-	__DEFINE_LINK_MODE_PARAMS(1600000, DR8_2, Full),
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
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T1L, 1, 1, Full, T),
+	__DEFINE_LINK_MODE_PARAMS(800000, CR8, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(800000, KR8, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR8, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, DR8_2, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(800000, SR8, Full, S),
+	__DEFINE_LINK_MODE_PARAMS(800000, VR8, Full, V),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T1S, 1, 1, Full, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T1S, 1, 1, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T1S_P2MP, 1, 1, Half, T),
+	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T1BRR, 1, 1, Full, T),
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
+	__DEFINE_LINK_MODE_PARAMS(1600000, CR8, Full, C),
+	__DEFINE_LINK_MODE_PARAMS(1600000, KR8, Full, K),
+	__DEFINE_LINK_MODE_PARAMS(1600000, DR8, Full, D),
+	__DEFINE_LINK_MODE_PARAMS(1600000, DR8_2, Full, D),
 };
 static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 EXPORT_SYMBOL_GPL(link_mode_params);
-- 
2.49.0


