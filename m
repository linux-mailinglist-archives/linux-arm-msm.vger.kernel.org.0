Return-Path: <linux-arm-msm+bounces-66068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE4B0D938
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 089F11C23FB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315D2E9EC9;
	Tue, 22 Jul 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="djkUlB4r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC452E92BB;
	Tue, 22 Jul 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186603; cv=none; b=Sem7iSgavSJko4QUumGCw9nV6brxS/dhyEoL0z6euLnRXTcOW2Z2CO1s+QuF1WDGg9h5uCNaNsp+/prv/+Z1RsB6a85cdWPlm/dYFdECXeCS4sFZs0b//3EFeXHcqp5GrIkchilt29S459ZibaNWpGHRkWVM4XxM87KKEPIf/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186603; c=relaxed/simple;
	bh=8GIISQ747xStpcrAmgsrEm3PUzf7LjS8WrP3DawpFlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PikY0RtbG9Tkpe0tUcBEjP2Vk+gq4HSINYV38IhKxXyBPIOaY6fJceokKYtpe9OKpzQARutr6lrQk1AwTf6B1ri7H6okFwsvFiU83wkeps05AizM2zVKaVGUdPi+59LGhvv8ultbtcu7jGb68PDpbAbJhGW3U7WErpABSkzUflg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=djkUlB4r; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6355843A11;
	Tue, 22 Jul 2025 12:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753186593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X1SG6EZwUeidKkcS9Cw+ueu25J90gmUPbo4DL8leCwY=;
	b=djkUlB4r8oYzc3+gPwt074r7dBZuTxvn8Pty5jfnP0Mfm4+oqDfCsgSXhdzF0DW6lf+tKV
	IpieCItvU+38RELyCI7UIU2qepKToTmMq/NInNGIOBfBFSDZMaTAO+PlVlaSNwnZe8loVp
	WvDUjtKzK8hPQZtSpfkgzDTxzm2y7Xm5EAMBQtFjjo3SRbkrDqLf6nkCVVw9otJ/A0lOJg
	Zk9tyI/KmqboPMCuMB7V1yKfoooaIsJcbbQLaZtj8DT61yehl66f5gehiya9xHBEUKafFG
	HAUBjovFtighWOI+skhK/iBoE6b0LLf6hyjQGtChKfyAEt4+A6SFeDeagh+I6w==
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
Subject: [PATCH net-next v10 02/15] net: ethtool: common: Indicate that BaseT works on up to 4 lanes
Date: Tue, 22 Jul 2025 14:16:07 +0200
Message-ID: <20250722121623.609732-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgedtffelffelveeuleelgfejfeevvdejhfehgeefgfffvdefteegvedutefftdenucfkphepledtrdejiedriedvrddujedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdejiedriedvrddujedupdhhvghlohepfhgvughorhgrrddrpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhug
 idqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 net/ethtool/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ethtool/common.c b/net/ethtool/common.c
index 4f58648a27ad..57290fdb7193 100644
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


