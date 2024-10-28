Return-Path: <linux-arm-msm+bounces-36212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1DA9B3B67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 361A7B21BD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A5B1E0B63;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqUGHS6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064041DFE00;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=mczAopYWxRndE4cq4hc2Z5nK252gqb8Xe2TEjx8rQPUWM45xtBhmRjztIk97uq8mE2FGQU9rj61o6D0lOd+unCxm6OBANq6rHtc8JHvE2tvZ8m96dfRX568rD2X2yIsDWusPkHwjPUHCZ2z3VrxUhLom9I99fsYEOJqFr1f5BS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=WZ360woTqlKwEAB+mCUzTvQfH/YCNcvh0ZZPLL1DHzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZSLRNhqGdUM83QJ0qfy+OP/Gew763rCSVUCZEwoELRaI+j49ZpbeQHyu85j2WYb4bH2ozW1nkOivERqbc2hze03XfD2/IIMw+Sug0b1yk8NFeBRyytGuiN8JZrimcSba2vvn/pkMk1VGL2vzlLBE9WiVymfafwBHhMph/XE1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqUGHS6E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8043CC4CEF4;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147127;
	bh=WZ360woTqlKwEAB+mCUzTvQfH/YCNcvh0ZZPLL1DHzM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sqUGHS6E9D8Cce/8hXHKu8q7oyPnEhsFn5fN7K8UA77yu5WXmV5O+RVLIPIBVvtrG
	 /VQXlHV65lqZwiOzaCWUsPnRuRhbpkulxNDZxfXm8TTbb+YsmcXHc3+FI4eF9ruYxH
	 wERKYB/bJUQaCJvWaAAnqw664G38jUFJzesLc1CpgFT1PGSvmNzhyJd+GlJ/0qDi/9
	 kCUO76Wt2VUXUVR2SnQmJ+3KDQ6px2n5Sr3sJacwvxzd+QmB+rroQiRja9OsZ7SIgj
	 AUCY9in5XYjjDs5apnpwiavreYnhb2Kshd6eXkWIOD5qGaR83qozoYULeX0xoybUnC
	 Vz2/vKKIu50tg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774BCD5B148;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:46 +0100
Subject: [PATCH v4 04/16] net: phy: Add helper for mapping RGMII link speed
 to clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-4-03618f10e3e2@oss.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1401;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=iiWKJLaFCOsjPP4V/Ba8wScxk46hL1tc6KzIcyhY4QE=;
 b=a9z6WZPW3ibl1mYkhy6D4vsb7agV8md+c5fFx8SXTmlOkpCCbcb7sjHXivuW60pMPXXVbH2zP
 XV8gFEKPCteCW8WxxpY3MGLFe2PzPTgI5RfsmjcupWRZm67wFrIF7WB
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The RGMII interface supports three data rates: 10/100 Mbps
and 1 Gbps. These speeds correspond to clock frequencies
of 2.5/25 MHz and 125 MHz, respectively.

Many Ethernet drivers, including glues in stmmac, follow
a similar pattern of converting RGMII speed to clock frequency.

To simplify code, define the helper rgmii_clock(speed)
to convert connection speed to clock frequency.

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..e28c971d7616 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,29 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
+/**
+ * rgmii_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
+ *
+ * Returns: clock rate or negative errno
+ */
+static inline long rgmii_clock(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return 2500000;
+	case SPEED_100:
+		return 25000000;
+	case SPEED_1000:
+		return 125000000;
+	default:
+		return -EINVAL;
+	}
+}
+
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 

-- 
2.46.0



