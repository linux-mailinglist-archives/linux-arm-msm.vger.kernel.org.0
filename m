Return-Path: <linux-arm-msm+bounces-72831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7FFB50121
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5B9A1642D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E86353342;
	Tue,  9 Sep 2025 15:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fB+eiZKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9ED352FF0;
	Tue,  9 Sep 2025 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757431640; cv=none; b=gPqzs/bw4z8B0IRUC9a+vpyik5e4YJMJd88a5PwZ3dXQa2TFMDhDSrMVkBM1UyGrZz6qhg35TezlEH7+zla5Zpvq1Apiysuw2efvUXVlSjt/P99fRevXS1N3MFUuB0I557LZ4XDRGwGmF/Bfn5czXyYJN/KvwuLIxBwv2/8cqkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757431640; c=relaxed/simple;
	bh=8GIISQ747xStpcrAmgsrEm3PUzf7LjS8WrP3DawpFlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPW7QkUuKCOEHfOIVgD2pMRH6liVVi7OMVuYMK4pF1y2v/fuofYURgF9zqSRvYqcz1VDUd8RPnZr/9HAcjcE00yikWzZuDwciC0O+tz2b65npfiHT0TCUbo3/p+z5lFpxntnonZKHBwEilSdyMjnUoTzhqJNywwMHSaZQhBX018=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fB+eiZKH; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7979DC6B394;
	Tue,  9 Sep 2025 15:27:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F01D60630;
	Tue,  9 Sep 2025 15:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F185A102F29EC;
	Tue,  9 Sep 2025 17:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757431636; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X1SG6EZwUeidKkcS9Cw+ueu25J90gmUPbo4DL8leCwY=;
	b=fB+eiZKHPolvzi13mJFfOgpFgeFd1Yny8ECJuMOjtqkABHsw3dkvmuDnPIa3OXUhq1xb/l
	xSS50T4rfyFiFInmOyCOwM3VSaXEQehjEeiqIZfKONZx6NcUlY9iGNScpRtji9BlPYWoBG
	cPNmQ/BfeyiDc0Gin3PejqBiWBZ1tkedx8K2qkrNqHPppXyOGDgOMPh6xV+bW8qlCLuzZX
	xKZKbNnj7csGWH6mBYujlt3j/bRZbS2qkTdnvEQjTQnpla7E6aWqxTmKsY8sucsRJocwlV
	zamRsrDvNhVT/Qa5zd4Iu3F+DGFC7o7xmVKWFbXNEQd5g/997iLc/dmFJhOyIg==
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
Subject: [PATCH net-next v12 02/18] net: ethtool: common: Indicate that BaseT works on up to 4 lanes
Date: Tue,  9 Sep 2025 17:25:58 +0200
Message-ID: <20250909152617.119554-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

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


