Return-Path: <linux-arm-msm+bounces-34213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D7A99BC08
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 23:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08711F21A96
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 21:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5ED154C19;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tLkxWBVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DC14B96E;
	Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728854878; cv=none; b=nMgVuKi7vjvJHszhJSPC2YEWYCT3VhtF7pmyoozfLfCmOvx49UEjsT3ze8R/AGxQLqJfG0UZWG2wXUuE7My8t7JzrTzOPznfjrm9eLdh4likqtl4GCCz5wC0R4t0yXhDGbXMuHdL6WWV6llR0cIIhvCH2dcFtW1FrAKhQ8KOeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728854878; c=relaxed/simple;
	bh=Wjx/+DPDuCDJsKobMzavDna+uVZd2lzCV/OOFYYHJFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOgE/8nFYG4F/kc5rCzMfu9Tnwl7ysjJWjfg6jjGJVim/pULT0eAFl4iuXVjVEL6U98cxAi4JSTOseKsBt1JSfYZJEhvmSlr7Jo2snNLkgY/5PCHVFPaSVcJXsoMBVKvuvw4s7ORUt1cr+oRgz+pnFW05nAqMVNGuEuFNe2ulig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tLkxWBVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6994C4CED7;
	Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728854877;
	bh=Wjx/+DPDuCDJsKobMzavDna+uVZd2lzCV/OOFYYHJFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tLkxWBVumkpwGqjS8BsRDIpzK7R4Ds8pYNgzXlkS/hryGvcUC+PKdEY3llXmt2w28
	 fL2z99X+c7XPUpQlovPQVn3EofcwQ0ZDI7W2PJzI7DqUOmU6pGm1Q4ve8wiFkWDWgJ
	 H525mtkIUj3hbdHKjOv4AIj/9c9iHTziz6FHqL1ksUP5Cpm8GteGZ+nt/Aup+Y9mPp
	 +ErsOWEoNQ6lmRe4OHLNKAd8Bc2fzA+yWw11SZisVK/ZQmmXvtHRtNX4uXe8v+taPW
	 eppdNHvOsX3qaaY3b5GLCMOTBobMeEQgBqQLeMyPjLonEIqOTCmW/9mRESUHlZ4R8+
	 AmZ8SIXh0+3/w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2C2CF258E;
	Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:39 +0200
Subject: [PATCH v3 04/16] net: phy: Add helper for mapping RGMII link speed
 to clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=2138;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=DaDkzUPthYLXEW32SreKBO3MyQ9lanZalBFxpDCNQzE=;
 b=bo+RPMH3Mt3S1/zUl8ym396kld4wUMRFbTsLm5IgKWk0eKbfyTYScNWSGecqm9ZQqMjJk8ZEp
 qtga7k6oZDxDG2MG5OuboP6Z/O5hDkbWtDc3kFxhksvVJCx7PNcKAvX
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The helper rgmii_clock() implemented Russel's hint during stmmac
glue driver review:

  > We seem to have multiple cases of very similar logic in lots of stmmac
  > platform drivers, and I think it's about time we said no more to this.
  > So, what I think we should do is as follows:
  >
  > add the following helper - either in stmmac, or more generically
  > (phylib? - in which case its name will need changing.)
  >
  > static long stmmac_get_rgmii_clock(int speed)
  > {
  >        switch (speed) {
  >        case SPEED_10:
  >                return 2500000;
  >
  >        case SPEED_100:
  >                return 25000000;
  >
  >        case SPEED_1000:
  >                return 125000000;
  >
  >        default:
  >                return -ENVAL;
  >        }
  > }
  >
  > Then, this can become:
  >
  >        long tx_clk_rate;
  >
  >        ...
  >
  >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
  >        if (tx_clk_rate < 0) {
  >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
  >                return;
  >        }
  >
  >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..7f6d9e7533ce 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
+/**
+ * rgmii_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
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



