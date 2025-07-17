Return-Path: <linux-arm-msm+bounces-65402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24CB086B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 09:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A88B83B5353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 07:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDF325A2C9;
	Thu, 17 Jul 2025 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="M81MQu7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB824A079;
	Thu, 17 Jul 2025 07:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737432; cv=none; b=tmzBpWx9jsxMBPkWWp6fXfj+IGpBL+zneygFqD6rbrhQJs3HSw0o2fqQkpIg5Y9SLcxsuuAyvq7Q171ea5wjDnMH+j13XJtmV9opdbBOtNqbvBPZgjX9CQvwBQr4q5Os1SYUlZBpVINWCKyS5ABBr9pzvpVU33y6M2ChLYhFqeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737432; c=relaxed/simple;
	bh=ltrxwznUbbtI7Bm8ZQW/o25BKTHwqTpEjVogwiPh6XE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f0Iva+a1gGuhYL/c/3kScvRZz9IYZ7C5xVEUGR3DwDAegj06tOlv9gLIaebNX/jGlwwejuBb4bYOpqIFMEkhFMa5JWtlTF6kganDEx/HjTor68deuQMYrKJkDo/UFJPFDr/Zd0KqlwkW2S69Kt68BMwAs8uccXsMq+zzS1aOk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=M81MQu7w; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47485443E9;
	Thu, 17 Jul 2025 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752737428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=elEq4TGB1p/+toB2wqJm07o1LyqtL0pBFF4yduOZLOk=;
	b=M81MQu7wFyylQYqe5mYGiMJCvvRMlen0fACiCKbwOQTNgK6ilQqYVm4eANB5NQX9VGtoCl
	nA/ddoJ0ShZhL7mWAj317EW284opuT0XT0Zxb2g3wfcI2XK80g0dHNxjaPb7UTMaDKjdup
	UUI3rwLyHiZmoDFpnL3kLW7B+xXHQfZt5PZ+c5m47ITfAZb892q7yPfvFuf1102etivWdL
	84bdCfjBP6Y0KzJbhfwR/oVQMzy4MrCIqLwnpuRs0IzAfDipJ1ooXRO3P4DXaPxXcssutO
	5HZKUDIw96S2uWNuQy6XNuYU22GD3k177UgqiBX5Mvl8ps1b0REwHD443hYjiw==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v9 02/15] net: ethtool: common: Indicate that BaseT works on up to 4 lanes
Date: Thu, 17 Jul 2025 09:30:06 +0200
Message-ID: <20250717073020.154010-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

The way BaseT modes (Ethernet over twisted copper pairs) are represented
in the kernel are through the following modes :

  ETHTOOL_LINK_MODE_10baseT_Half
  ETHTOOL_LINK_MODE_10baseT_Full
  ETHTOOL_LINK_MODE_100baseT_Half
  ETHTOOL_LINK_MODE_100baseT_Full
  ETHTOOL_LINK_MODE_1000baseT_Half
  ETHTOOL_LINK_MODE_1000baseT_Full
  ETHTOOL_LINK_MODE_2500baseT_Full
  ETHTOOL_LINK_MODE_5000baseT_Full
  ETHTOOL_LINK_MODE_10000baseT_Full
  ETHTOOL_LINK_MODE_100baseT1_Full
  ETHTOOL_LINK_MODE_1000baseT1_Full
  ETHTOOL_LINK_MODE_10baseT1L_Full
  ETHTOOL_LINK_MODE_10baseT1S_Full
  ETHTOOL_LINK_MODE_10baseT1S_Half
  ETHTOOL_LINK_MODE_10baseT1S_P2MP_Half
  ETHTOOL_LINK_MODE_10baseT1BRR_Full

The baseT1* modes explicitly specify that they work on a single,
unshielded twister copper pair.

However, the other modes do not state the number of pairs that are used
to carry the link. 10 and 100BaseT use 2 twisted copper pairs, while
1GBaseT and higher use 4 pairs.

although 10 and 100BaseT use 2 pairs, they can work on a Cat3/4/5+
cables that contain 4 pairs.

Change the number of pairs associated to BaseT modes to indicate the
allowable number of pairs for BaseT. Further commits will then refine
the minimum number of pairs required for the linkmode to work.

BaseT1 modes aren't affected by this commit.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 459cf25e763e..56467532a19a 100644
--- a/net/ethtool/common.c
+++ b/net/ethtool/common.c
@@ -267,7 +267,7 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
 #define __LINK_MODE_LANES_LR8_ER8_FR8	8
 #define __LINK_MODE_LANES_LRM		1
 #define __LINK_MODE_LANES_MLD2		2
-#define __LINK_MODE_LANES_T		1
+#define __LINK_MODE_LANES_T		4
 #define __LINK_MODE_LANES_T1		1
 #define __LINK_MODE_LANES_X		1
 #define __LINK_MODE_LANES_FX		1
-- 
2.49.0


