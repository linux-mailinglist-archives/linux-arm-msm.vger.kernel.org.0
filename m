Return-Path: <linux-arm-msm+bounces-2344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDED7FCCB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 03:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 991892832A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 02:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDAB1FCA;
	Wed, 29 Nov 2023 02:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hn1D2r3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E5519A4;
	Tue, 28 Nov 2023 18:12:35 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b34563987so2222685e9.1;
        Tue, 28 Nov 2023 18:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701223953; x=1701828753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxOCPrq9HJUtvQv60fTdnkRIiJmsRo50FabCLo6htL8=;
        b=hn1D2r3UQLLjWf1qeeV/Doayd3lm4JZHwhRNhOU9wR/FFAXoUxvoH65fQNUs8PzBLY
         F4WbPxSMJC+7byEnHMlw5vmJgGSSx88vjV2JPQRohwa96GnxZLTzqHA57bMmt+JI1xjM
         AjHSARJo3U6yq5XEUvFl5OjYhaQLZeKG8VigSJcABTvQZ9uVGgfwQz8dxLVGumAQFuGk
         rABPTsr9ohLzBeBujpNarK5ZT0b3mAo26suzzdCOKqsnzbTEeX1iJQc+weMKs3me3n02
         Nt6Ym9uZU3bPNUttGjY4F1sRuVaCBE+0KZu+DUESVhJ9rb9FgVYhMdNBmkQuYKBMP1mJ
         N0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701223953; x=1701828753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxOCPrq9HJUtvQv60fTdnkRIiJmsRo50FabCLo6htL8=;
        b=gSdM25Vu86JiViPWCxX7f6LEbj3t8tLvHdQcrSy/WXhyqZw1ri0esY2E3PZibJL8Ft
         ceW8aOoC273IAXfRKNIu57PED7jZBPv7xKWj1fgw0//9mrqcslOZjwTUlvWR4KWdDDR+
         S8b9M+O3A6n7iAqQDm6Su1tAsEmXB71csmaj7IPzASXmSGAaOiRwcX2jVqtQjG8Z2r/q
         +88iibBr04huumRY6czX/5BqexUMWFT8FubK5rb/Z2YWuLnviASnneJlb9ikxXcC0q3a
         tGcXN50GEBbP5C3mP8KCSFn2HvwoAhfCHPFEjV2fh2I8oMTDHvjZM1w8VdMVLmKhxcXG
         QtmQ==
X-Gm-Message-State: AOJu0YzcXK2OLjebiOB1eMnGqBLFsll8Rc8XV41SJlyVOoGocWGnvK3T
	62njkJrNpPGoxVBsEX6h0ho=
X-Google-Smtp-Source: AGHT+IHi2AAKkbvlg1dPnnaG/vbqs7nzOv7FFuI2j+j3l5JsRcCkve/+PRCJxeeYrFTSJ47sVWbTWw==
X-Received: by 2002:a05:600c:3c95:b0:40b:51c7:7ad7 with SMTP id bg21-20020a05600c3c9500b0040b51c77ad7mr661306wmb.18.1701223953484;
        Tue, 28 Nov 2023 18:12:33 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm321406wmq.39.2023.11.28.18.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 18:12:33 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH 05/14] net: phy: at803x: move qca83xx specific check in dedicated functions
Date: Wed, 29 Nov 2023 03:12:10 +0100
Message-Id: <20231129021219.20914-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231129021219.20914-1-ansuelsmth@gmail.com>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework qca83xx specific check to dedicated function to tidy things up
and drop useless phy_id check.

Also drop an useless link_change_notify for QCA8337 as it did nothing an
returned early.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/at803x.c | 68 ++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 3b7baa4bb637..9a590124d1fe 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -1633,27 +1633,26 @@ static int qca83xx_config_init(struct phy_device *phydev)
 		break;
 	}
 
+	/* Following original QCA sourcecode set port to prefer master */
+	phy_set_bits(phydev, MII_CTRL1000, CTL1000_PREFER_MASTER);
+
+	return 0;
+}
+
+static int qca8327_config_init(struct phy_device *phydev)
+{
 	/* QCA8327 require DAC amplitude adjustment for 100m set to +6%.
 	 * Disable on init and enable only with 100m speed following
 	 * qca original source code.
 	 */
-	if (phydev->drv->phy_id == QCA8327_A_PHY_ID ||
-	    phydev->drv->phy_id == QCA8327_B_PHY_ID)
-		at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
-				      QCA8327_DEBUG_MANU_CTRL_EN, 0);
+	at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
+			      QCA8327_DEBUG_MANU_CTRL_EN, 0);
 
-	/* Following original QCA sourcecode set port to prefer master */
-	phy_set_bits(phydev, MII_CTRL1000, CTL1000_PREFER_MASTER);
-
-	return 0;
+	return qca83xx_config_init(phydev);
 }
 
 static void qca83xx_link_change_notify(struct phy_device *phydev)
 {
-	/* QCA8337 doesn't require DAC Amplitude adjustement */
-	if (phydev->drv->phy_id == QCA8337_PHY_ID)
-		return;
-
 	/* Set DAC Amplitude adjustment to +6% for 100m on link running */
 	if (phydev->state == PHY_RUNNING) {
 		if (phydev->speed == SPEED_100)
@@ -1696,19 +1695,6 @@ static int qca83xx_resume(struct phy_device *phydev)
 
 static int qca83xx_suspend(struct phy_device *phydev)
 {
-	u16 mask = 0;
-
-	/* Only QCA8337 support actual suspend.
-	 * QCA8327 cause port unreliability when phy suspend
-	 * is set.
-	 */
-	if (phydev->drv->phy_id == QCA8337_PHY_ID) {
-		genphy_suspend(phydev);
-	} else {
-		mask |= ~(BMCR_SPEED1000 | BMCR_FULLDPLX);
-		phy_modify(phydev, MII_BMCR, mask, 0);
-	}
-
 	at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_GREEN,
 			      AT803X_DEBUG_GATE_CLK_IN1000, 0);
 
@@ -1719,6 +1705,27 @@ static int qca83xx_suspend(struct phy_device *phydev)
 	return 0;
 }
 
+static int qca8337_suspend(struct phy_device *phydev)
+{
+	/* Only QCA8337 support actual suspend. */
+	genphy_suspend(phydev);
+
+	return qca83xx_suspend(phydev);
+}
+
+static int qca8327_suspend(struct phy_device *phydev)
+{
+	u16 mask = 0;
+
+	/* QCA8327 cause port unreliability when phy suspend
+	 * is set.
+	 */
+	mask |= ~(BMCR_SPEED1000 | BMCR_FULLDPLX);
+	phy_modify(phydev, MII_BMCR, mask, 0);
+
+	return qca83xx_suspend(phydev);
+}
+
 static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
 {
 	int ret;
@@ -2180,7 +2187,6 @@ static struct phy_driver at803x_driver[] = {
 	.phy_id_mask		= QCA8K_PHY_ID_MASK,
 	.name			= "Qualcomm Atheros 8337 internal PHY",
 	/* PHY_GBIT_FEATURES */
-	.link_change_notify	= qca83xx_link_change_notify,
 	.probe			= qca83xx_probe,
 	.flags			= PHY_IS_INTERNAL,
 	.config_init		= qca83xx_config_init,
@@ -2188,7 +2194,7 @@ static struct phy_driver at803x_driver[] = {
 	.get_sset_count		= qca83xx_get_sset_count,
 	.get_strings		= qca83xx_get_strings,
 	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca83xx_suspend,
+	.suspend		= qca8337_suspend,
 	.resume			= qca83xx_resume,
 }, {
 	/* QCA8327-A from switch QCA8327-AL1A */
@@ -2199,12 +2205,12 @@ static struct phy_driver at803x_driver[] = {
 	.link_change_notify	= qca83xx_link_change_notify,
 	.probe			= qca83xx_probe,
 	.flags			= PHY_IS_INTERNAL,
-	.config_init		= qca83xx_config_init,
+	.config_init		= qca8327_config_init,
 	.soft_reset		= genphy_soft_reset,
 	.get_sset_count		= qca83xx_get_sset_count,
 	.get_strings		= qca83xx_get_strings,
 	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca83xx_suspend,
+	.suspend		= qca8327_suspend,
 	.resume			= qca83xx_resume,
 }, {
 	/* QCA8327-B from switch QCA8327-BL1A */
@@ -2215,12 +2221,12 @@ static struct phy_driver at803x_driver[] = {
 	.link_change_notify	= qca83xx_link_change_notify,
 	.probe			= qca83xx_probe,
 	.flags			= PHY_IS_INTERNAL,
-	.config_init		= qca83xx_config_init,
+	.config_init		= qca8327_config_init,
 	.soft_reset		= genphy_soft_reset,
 	.get_sset_count		= qca83xx_get_sset_count,
 	.get_strings		= qca83xx_get_strings,
 	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca83xx_suspend,
+	.suspend		= qca8327_suspend,
 	.resume			= qca83xx_resume,
 }, {
 	/* Qualcomm QCA8081 */
-- 
2.40.1


