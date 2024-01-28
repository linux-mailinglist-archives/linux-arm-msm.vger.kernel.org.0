Return-Path: <linux-arm-msm+bounces-8695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E678483F55B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 13:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DADF282711
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 12:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516C028DD7;
	Sun, 28 Jan 2024 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5imGBkm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346C23766;
	Sun, 28 Jan 2024 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706443507; cv=none; b=KgGLHV/bqaDEbGJDYdHXC+h4bV3pHZv9oAd2+4CqI26shAKJK8dQA4zLQmW4YP7hQ0EefbFPI0chh6x/fFisUwV4x51+eTCjmsLWBWSPdLVJhuFV1ICdwpJrHbz6hrpj60Qz9MMPBRJPbNJ7JaWirt86KZm8dUQnNVBH81UMtwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706443507; c=relaxed/simple;
	bh=i62KNABa07BZCIvcQzrBR0X71X45B/MxJwWM1yIw45I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibl+ZJu2HaxCae1J94c1eyBLALlX6cAfvRrgYTHN0hpzWb4gcpCVHTkXVWXoeTOaEMF9BFjYUaZ8ZjVkq7sy3nGbWA1gOiWx6AzCNv9YBpYSvWnlRV6C7yvZ6Kt4iK1FFyaeJf4uIxlKfrOyM8auGoFSL4FxtotiuoMPCO5+Y8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5imGBkm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ae6f4fd78so511867f8f.1;
        Sun, 28 Jan 2024 04:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706443503; x=1707048303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bhVH/J1XDJSBi+P+FNHYsxGxJQ9xaiQ/A2lu6c80/k=;
        b=T5imGBkmt1qKCX005iy6a9BGIH9TAvac2/kileCc7VClKjuiby/ONGdUcelh1OS/5s
         hdaGEDHQs429Z4xySj5ZVTrDXQb1xHNcQXgruG4WKE65I0K7QgCynVV1TJAdy3yDhUGb
         4JbnJAt27FhWeePrbLxsbR+OU9GMCa//mS8aX7KUyRlp8zFPwa9UNrVruucfOvebEp5z
         Y3u8gJVkxMgDenYfuE8oDD1a2T9+cqLNVj/Gl5ZmZqwqLIRPm0AEG0TRvUuGsg8oZig7
         2iNShTZ0zlmTj/1+bABkDlPIH0lTuPo+2+JRn/p4p263kOTYRJlqpWvLbNbtChK4Poxu
         smrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706443503; x=1707048303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bhVH/J1XDJSBi+P+FNHYsxGxJQ9xaiQ/A2lu6c80/k=;
        b=oYbYisDyLB5zLLngAtOC5jam3JYG+/yMTaeNVG/DPRj6E+nlBZpYbbdhpZxwYcdOt9
         9i9RGwGsEK//u/LqhKA7tj62y9btFHn5snqP3rFHdROIW6zn3e/8vMAo7aj/prFSzN1S
         R2MX2wOnpDQ3Wq/8C/tB6XhyXlf8m0VkKM70sn4XeH/j4eo8O4LJRcip0wCtlvAzk8Bf
         h4CKXfXSVHCKoC9/31jBU15mqSO4GTwkO8XiQl4p5B3jTgT920Jq7L7Aap7HoMs4OaVc
         zubUO/EDyC9DXNWwkPovjcg0htYriUkW0wQm25qC7T4WHpJvuImnDqLosGrn0/jAFUxb
         9DRg==
X-Gm-Message-State: AOJu0Yz/DaJ9rmll1n7tzkO7Q3+djLQlblSqcG0lNolzcW8/tVM3epZr
	h8opQdMdTg8Mt1Ifyw5NSftsBpeI1YYK2dsg8npwUBAehClR3eYYQV1nVYrc
X-Google-Smtp-Source: AGHT+IHhVNjLLyEHaJQkzZmH7nzKha6J7qDUz8VtpT8/Pbi0IJuoUqVWhli9zcXAE+RuXkBKqyo2zw==
X-Received: by 2002:a5d:67c8:0:b0:33a:e5a7:ebbd with SMTP id n8-20020a5d67c8000000b0033ae5a7ebbdmr1697914wrw.20.1706443502839;
        Sun, 28 Jan 2024 04:05:02 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id v1-20020a5d59c1000000b0033aeab6f75fsm1110034wry.79.2024.01.28.04.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 04:05:02 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [net-next PATCH v3 3/5] net: phy: qcom: deatch qca83xx PHY driver from at803x
Date: Sun, 28 Jan 2024 13:04:24 +0100
Message-ID: <20240128120451.31219-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240128120451.31219-1-ansuelsmth@gmail.com>
References: <20240128120451.31219-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deatch qca83xx PHY driver from at803x.

The QCA83xx PHYs implement specific function and doesn't use generic
at803x so it can be detached from the driver and moved to a dedicated
one.

Probe function and priv struct is reimplemented to allocate and use
only the qca83xx specific data. Unused data from at803x PHY driver
are dropped from at803x priv struct.

This is to make slimmer PHY drivers instead of including lots of bloat
that would never be used in specific SoC.

A new Kconfig flag QCA83XX_PHY is introduced to compile the new
introduced PHY driver.

As the Kconfig name starts with Qualcomm the same order is kept.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/qcom/Kconfig   |  11 +-
 drivers/net/phy/qcom/Makefile  |   1 +
 drivers/net/phy/qcom/at803x.c  | 235 ----------------------------
 drivers/net/phy/qcom/qca83xx.c | 275 +++++++++++++++++++++++++++++++++
 4 files changed, 284 insertions(+), 238 deletions(-)
 create mode 100644 drivers/net/phy/qcom/qca83xx.c

diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index fe47cc7c94d2..ba78bbe31857 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -3,9 +3,14 @@ config QCOM_NET_PHYLIB
 	tristate
 
 config AT803X_PHY
-	tristate "Qualcomm Atheros AR803X PHYs and QCA833x PHYs"
+	tristate "Qualcomm Atheros AR803X PHYs"
 	select QCOM_NET_PHYLIB
 	depends on REGULATOR
 	help
-	  Currently supports the AR8030, AR8031, AR8033, AR8035 and internal
-	  QCA8337(Internal qca8k PHY) model
+	  Currently supports the AR8030, AR8031, AR8033, AR8035 model
+
+config QCA83XX_PHY
+	tristate "Qualcomm Atheros QCA833x PHYs"
+	select QCOM_NET_PHYLIB
+	help
+	  Currently supports the internal QCA8337(Internal qca8k PHY) model
diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
index bfba2ed7db27..3d98e397e063 100644
--- a/drivers/net/phy/qcom/Makefile
+++ b/drivers/net/phy/qcom/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_QCOM_NET_PHYLIB)	+= qcom-phy-lib.o
 obj-$(CONFIG_AT803X_PHY)	+= at803x.o
+obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 8194618c0865..638babc50df1 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -102,17 +102,10 @@
 #define AT803X_PSSR				0x11	/*PHY-Specific Status Register*/
 #define AT803X_PSSR_MR_AN_COMPLETE		0x0200
 
-#define AT803X_DEBUG_REG_3C			0x3C
-
-#define AT803X_DEBUG_REG_GREEN			0x3D
-#define   AT803X_DEBUG_GATE_CLK_IN1000		BIT(6)
-
 #define AT803X_DEBUG_REG_1F			0x1F
 #define AT803X_DEBUG_PLL_ON			BIT(2)
 #define AT803X_DEBUG_RGMII_1V8			BIT(3)
 
-#define MDIO_AZ_DEBUG				0x800D
-
 /* AT803x supports either the XTAL input pad, an internal PLL or the
  * DSP as clock reference for the clock output pad. The XTAL reference
  * is only used for 25 MHz output, all other frequencies need the PLL.
@@ -163,13 +156,7 @@
 
 #define QCA8081_PHY_ID				0x004dd101
 
-#define QCA8327_A_PHY_ID			0x004dd033
-#define QCA8327_B_PHY_ID			0x004dd034
-#define QCA8337_PHY_ID				0x004dd036
 #define QCA9561_PHY_ID				0x004dd042
-#define QCA8K_PHY_ID_MASK			0xffffffff
-
-#define QCA8K_DEVFLAGS_REVISION_MASK		GENMASK(2, 0)
 
 #define AT803X_PAGE_FIBER			0
 #define AT803X_PAGE_COPPER			1
@@ -379,12 +366,6 @@ MODULE_DESCRIPTION("Qualcomm Atheros AR803x and QCA808X PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
 
-static struct at803x_hw_stat qca83xx_hw_stats[] = {
-	{ "phy_idle_errors", 0xa, GENMASK(7, 0), PHY},
-	{ "phy_receive_errors", 0x15, GENMASK(15, 0), PHY},
-	{ "eee_wake_errors", 0x16, GENMASK(15, 0), MMD},
-};
-
 struct at803x_ss_mask {
 	u16 speed_mask;
 	u8 speed_shift;
@@ -400,7 +381,6 @@ struct at803x_priv {
 	bool is_1000basex;
 	struct regulator_dev *vddio_rdev;
 	struct regulator_dev *vddh_rdev;
-	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
 	int led_polarity_mode;
 };
 
@@ -564,53 +544,6 @@ static void at803x_get_wol(struct phy_device *phydev,
 		wol->wolopts |= WAKE_MAGIC;
 }
 
-static int qca83xx_get_sset_count(struct phy_device *phydev)
-{
-	return ARRAY_SIZE(qca83xx_hw_stats);
-}
-
-static void qca83xx_get_strings(struct phy_device *phydev, u8 *data)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++) {
-		strscpy(data + i * ETH_GSTRING_LEN,
-			qca83xx_hw_stats[i].string, ETH_GSTRING_LEN);
-	}
-}
-
-static u64 qca83xx_get_stat(struct phy_device *phydev, int i)
-{
-	struct at803x_hw_stat stat = qca83xx_hw_stats[i];
-	struct at803x_priv *priv = phydev->priv;
-	int val;
-	u64 ret;
-
-	if (stat.access_type == MMD)
-		val = phy_read_mmd(phydev, MDIO_MMD_PCS, stat.reg);
-	else
-		val = phy_read(phydev, stat.reg);
-
-	if (val < 0) {
-		ret = U64_MAX;
-	} else {
-		val = val & stat.mask;
-		priv->stats[i] += val;
-		ret = priv->stats[i];
-	}
-
-	return ret;
-}
-
-static void qca83xx_get_stats(struct phy_device *phydev,
-			      struct ethtool_stats *stats, u64 *data)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++)
-		data[i] = qca83xx_get_stat(phydev, i);
-}
-
 static int at803x_suspend(struct phy_device *phydev)
 {
 	int value;
@@ -1707,124 +1640,6 @@ static int at8035_probe(struct phy_device *phydev)
 	return at8035_parse_dt(phydev);
 }
 
-static int qca83xx_config_init(struct phy_device *phydev)
-{
-	u8 switch_revision;
-
-	switch_revision = phydev->dev_flags & QCA8K_DEVFLAGS_REVISION_MASK;
-
-	switch (switch_revision) {
-	case 1:
-		/* For 100M waveform */
-		at803x_debug_reg_write(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL, 0x02ea);
-		/* Turn on Gigabit clock */
-		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_GREEN, 0x68a0);
-		break;
-
-	case 2:
-		phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0x0);
-		fallthrough;
-	case 4:
-		phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_AZ_DEBUG, 0x803f);
-		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_GREEN, 0x6860);
-		at803x_debug_reg_write(phydev, AT803X_DEBUG_SYSTEM_CTRL_MODE, 0x2c46);
-		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_3C, 0x6000);
-		break;
-	}
-
-	/* Following original QCA sourcecode set port to prefer master */
-	phy_set_bits(phydev, MII_CTRL1000, CTL1000_PREFER_MASTER);
-
-	return 0;
-}
-
-static int qca8327_config_init(struct phy_device *phydev)
-{
-	/* QCA8327 require DAC amplitude adjustment for 100m set to +6%.
-	 * Disable on init and enable only with 100m speed following
-	 * qca original source code.
-	 */
-	at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
-			      QCA8327_DEBUG_MANU_CTRL_EN, 0);
-
-	return qca83xx_config_init(phydev);
-}
-
-static void qca83xx_link_change_notify(struct phy_device *phydev)
-{
-	/* Set DAC Amplitude adjustment to +6% for 100m on link running */
-	if (phydev->state == PHY_RUNNING) {
-		if (phydev->speed == SPEED_100)
-			at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
-					      QCA8327_DEBUG_MANU_CTRL_EN,
-					      QCA8327_DEBUG_MANU_CTRL_EN);
-	} else {
-		/* Reset DAC Amplitude adjustment */
-		at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
-				      QCA8327_DEBUG_MANU_CTRL_EN, 0);
-	}
-}
-
-static int qca83xx_resume(struct phy_device *phydev)
-{
-	int ret, val;
-
-	/* Skip reset if not suspended */
-	if (!phydev->suspended)
-		return 0;
-
-	/* Reinit the port, reset values set by suspend */
-	qca83xx_config_init(phydev);
-
-	/* Reset the port on port resume */
-	phy_set_bits(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE);
-
-	/* On resume from suspend the switch execute a reset and
-	 * restart auto-negotiation. Wait for reset to complete.
-	 */
-	ret = phy_read_poll_timeout(phydev, MII_BMCR, val, !(val & BMCR_RESET),
-				    50000, 600000, true);
-	if (ret)
-		return ret;
-
-	usleep_range(1000, 2000);
-
-	return 0;
-}
-
-static int qca83xx_suspend(struct phy_device *phydev)
-{
-	at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_GREEN,
-			      AT803X_DEBUG_GATE_CLK_IN1000, 0);
-
-	at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_HIB_CTRL,
-			      AT803X_DEBUG_HIB_CTRL_EN_ANY_CHANGE |
-			      AT803X_DEBUG_HIB_CTRL_SEL_RST_80U, 0);
-
-	return 0;
-}
-
-static int qca8337_suspend(struct phy_device *phydev)
-{
-	/* Only QCA8337 support actual suspend. */
-	genphy_suspend(phydev);
-
-	return qca83xx_suspend(phydev);
-}
-
-static int qca8327_suspend(struct phy_device *phydev)
-{
-	u16 mask = 0;
-
-	/* QCA8327 cause port unreliability when phy suspend
-	 * is set.
-	 */
-	mask |= ~(BMCR_SPEED1000 | BMCR_FULLDPLX);
-	phy_modify(phydev, MII_BMCR, mask, 0);
-
-	return qca83xx_suspend(phydev);
-}
-
 static int qca808x_phy_fast_retrain_config(struct phy_device *phydev)
 {
 	int ret;
@@ -2598,53 +2413,6 @@ static struct phy_driver at803x_driver[] = {
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
-}, {
-	/* QCA8337 */
-	.phy_id			= QCA8337_PHY_ID,
-	.phy_id_mask		= QCA8K_PHY_ID_MASK,
-	.name			= "Qualcomm Atheros 8337 internal PHY",
-	/* PHY_GBIT_FEATURES */
-	.probe			= at803x_probe,
-	.flags			= PHY_IS_INTERNAL,
-	.config_init		= qca83xx_config_init,
-	.soft_reset		= genphy_soft_reset,
-	.get_sset_count		= qca83xx_get_sset_count,
-	.get_strings		= qca83xx_get_strings,
-	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca8337_suspend,
-	.resume			= qca83xx_resume,
-}, {
-	/* QCA8327-A from switch QCA8327-AL1A */
-	.phy_id			= QCA8327_A_PHY_ID,
-	.phy_id_mask		= QCA8K_PHY_ID_MASK,
-	.name			= "Qualcomm Atheros 8327-A internal PHY",
-	/* PHY_GBIT_FEATURES */
-	.link_change_notify	= qca83xx_link_change_notify,
-	.probe			= at803x_probe,
-	.flags			= PHY_IS_INTERNAL,
-	.config_init		= qca8327_config_init,
-	.soft_reset		= genphy_soft_reset,
-	.get_sset_count		= qca83xx_get_sset_count,
-	.get_strings		= qca83xx_get_strings,
-	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca8327_suspend,
-	.resume			= qca83xx_resume,
-}, {
-	/* QCA8327-B from switch QCA8327-BL1A */
-	.phy_id			= QCA8327_B_PHY_ID,
-	.phy_id_mask		= QCA8K_PHY_ID_MASK,
-	.name			= "Qualcomm Atheros 8327-B internal PHY",
-	/* PHY_GBIT_FEATURES */
-	.link_change_notify	= qca83xx_link_change_notify,
-	.probe			= at803x_probe,
-	.flags			= PHY_IS_INTERNAL,
-	.config_init		= qca8327_config_init,
-	.soft_reset		= genphy_soft_reset,
-	.get_sset_count		= qca83xx_get_sset_count,
-	.get_strings		= qca83xx_get_strings,
-	.get_stats		= qca83xx_get_stats,
-	.suspend		= qca8327_suspend,
-	.resume			= qca83xx_resume,
 }, {
 	/* Qualcomm QCA8081 */
 	PHY_ID_MATCH_EXACT(QCA8081_PHY_ID),
@@ -2683,9 +2451,6 @@ static struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
-	{ PHY_ID_MATCH_EXACT(QCA8337_PHY_ID) },
-	{ PHY_ID_MATCH_EXACT(QCA8327_A_PHY_ID) },
-	{ PHY_ID_MATCH_EXACT(QCA8327_B_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA8081_PHY_ID) },
 	{ }
diff --git a/drivers/net/phy/qcom/qca83xx.c b/drivers/net/phy/qcom/qca83xx.c
new file mode 100644
index 000000000000..5d083ef0250e
--- /dev/null
+++ b/drivers/net/phy/qcom/qca83xx.c
@@ -0,0 +1,275 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/phy.h>
+#include <linux/module.h>
+
+#include "qcom.h"
+
+#define AT803X_DEBUG_REG_3C			0x3C
+
+#define AT803X_DEBUG_REG_GREEN			0x3D
+#define   AT803X_DEBUG_GATE_CLK_IN1000		BIT(6)
+
+#define MDIO_AZ_DEBUG				0x800D
+
+#define QCA8327_A_PHY_ID			0x004dd033
+#define QCA8327_B_PHY_ID			0x004dd034
+#define QCA8337_PHY_ID				0x004dd036
+#define QCA8K_PHY_ID_MASK			0xffffffff
+
+#define QCA8K_DEVFLAGS_REVISION_MASK		GENMASK(2, 0)
+
+static struct at803x_hw_stat qca83xx_hw_stats[] = {
+	{ "phy_idle_errors", 0xa, GENMASK(7, 0), PHY},
+	{ "phy_receive_errors", 0x15, GENMASK(15, 0), PHY},
+	{ "eee_wake_errors", 0x16, GENMASK(15, 0), MMD},
+};
+
+struct qca83xx_priv {
+	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
+};
+
+MODULE_DESCRIPTION("Qualcomm Atheros QCA83XX PHY driver");
+MODULE_AUTHOR("Matus Ujhelyi");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+static int qca83xx_get_sset_count(struct phy_device *phydev)
+{
+	return ARRAY_SIZE(qca83xx_hw_stats);
+}
+
+static void qca83xx_get_strings(struct phy_device *phydev, u8 *data)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++) {
+		strscpy(data + i * ETH_GSTRING_LEN,
+			qca83xx_hw_stats[i].string, ETH_GSTRING_LEN);
+	}
+}
+
+static u64 qca83xx_get_stat(struct phy_device *phydev, int i)
+{
+	struct at803x_hw_stat stat = qca83xx_hw_stats[i];
+	struct qca83xx_priv *priv = phydev->priv;
+	int val;
+	u64 ret;
+
+	if (stat.access_type == MMD)
+		val = phy_read_mmd(phydev, MDIO_MMD_PCS, stat.reg);
+	else
+		val = phy_read(phydev, stat.reg);
+
+	if (val < 0) {
+		ret = U64_MAX;
+	} else {
+		val = val & stat.mask;
+		priv->stats[i] += val;
+		ret = priv->stats[i];
+	}
+
+	return ret;
+}
+
+static void qca83xx_get_stats(struct phy_device *phydev,
+			      struct ethtool_stats *stats, u64 *data)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(qca83xx_hw_stats); i++)
+		data[i] = qca83xx_get_stat(phydev, i);
+}
+
+static int qca83xx_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct qca83xx_priv *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
+static int qca83xx_config_init(struct phy_device *phydev)
+{
+	u8 switch_revision;
+
+	switch_revision = phydev->dev_flags & QCA8K_DEVFLAGS_REVISION_MASK;
+
+	switch (switch_revision) {
+	case 1:
+		/* For 100M waveform */
+		at803x_debug_reg_write(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL, 0x02ea);
+		/* Turn on Gigabit clock */
+		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_GREEN, 0x68a0);
+		break;
+
+	case 2:
+		phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0x0);
+		fallthrough;
+	case 4:
+		phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_AZ_DEBUG, 0x803f);
+		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_GREEN, 0x6860);
+		at803x_debug_reg_write(phydev, AT803X_DEBUG_SYSTEM_CTRL_MODE, 0x2c46);
+		at803x_debug_reg_write(phydev, AT803X_DEBUG_REG_3C, 0x6000);
+		break;
+	}
+
+	/* Following original QCA sourcecode set port to prefer master */
+	phy_set_bits(phydev, MII_CTRL1000, CTL1000_PREFER_MASTER);
+
+	return 0;
+}
+
+static int qca8327_config_init(struct phy_device *phydev)
+{
+	/* QCA8327 require DAC amplitude adjustment for 100m set to +6%.
+	 * Disable on init and enable only with 100m speed following
+	 * qca original source code.
+	 */
+	at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
+			      QCA8327_DEBUG_MANU_CTRL_EN, 0);
+
+	return qca83xx_config_init(phydev);
+}
+
+static void qca83xx_link_change_notify(struct phy_device *phydev)
+{
+	/* Set DAC Amplitude adjustment to +6% for 100m on link running */
+	if (phydev->state == PHY_RUNNING) {
+		if (phydev->speed == SPEED_100)
+			at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
+					      QCA8327_DEBUG_MANU_CTRL_EN,
+					      QCA8327_DEBUG_MANU_CTRL_EN);
+	} else {
+		/* Reset DAC Amplitude adjustment */
+		at803x_debug_reg_mask(phydev, AT803X_DEBUG_ANALOG_TEST_CTRL,
+				      QCA8327_DEBUG_MANU_CTRL_EN, 0);
+	}
+}
+
+static int qca83xx_resume(struct phy_device *phydev)
+{
+	int ret, val;
+
+	/* Skip reset if not suspended */
+	if (!phydev->suspended)
+		return 0;
+
+	/* Reinit the port, reset values set by suspend */
+	qca83xx_config_init(phydev);
+
+	/* Reset the port on port resume */
+	phy_set_bits(phydev, MII_BMCR, BMCR_RESET | BMCR_ANENABLE);
+
+	/* On resume from suspend the switch execute a reset and
+	 * restart auto-negotiation. Wait for reset to complete.
+	 */
+	ret = phy_read_poll_timeout(phydev, MII_BMCR, val, !(val & BMCR_RESET),
+				    50000, 600000, true);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+static int qca83xx_suspend(struct phy_device *phydev)
+{
+	at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_GREEN,
+			      AT803X_DEBUG_GATE_CLK_IN1000, 0);
+
+	at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_HIB_CTRL,
+			      AT803X_DEBUG_HIB_CTRL_EN_ANY_CHANGE |
+			      AT803X_DEBUG_HIB_CTRL_SEL_RST_80U, 0);
+
+	return 0;
+}
+
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
+static struct phy_driver qca83xx_driver[] = {
+{
+	/* QCA8337 */
+	.phy_id			= QCA8337_PHY_ID,
+	.phy_id_mask		= QCA8K_PHY_ID_MASK,
+	.name			= "Qualcomm Atheros 8337 internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.probe			= qca83xx_probe,
+	.flags			= PHY_IS_INTERNAL,
+	.config_init		= qca83xx_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_sset_count		= qca83xx_get_sset_count,
+	.get_strings		= qca83xx_get_strings,
+	.get_stats		= qca83xx_get_stats,
+	.suspend		= qca8337_suspend,
+	.resume			= qca83xx_resume,
+}, {
+	/* QCA8327-A from switch QCA8327-AL1A */
+	.phy_id			= QCA8327_A_PHY_ID,
+	.phy_id_mask		= QCA8K_PHY_ID_MASK,
+	.name			= "Qualcomm Atheros 8327-A internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.link_change_notify	= qca83xx_link_change_notify,
+	.probe			= qca83xx_probe,
+	.flags			= PHY_IS_INTERNAL,
+	.config_init		= qca8327_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_sset_count		= qca83xx_get_sset_count,
+	.get_strings		= qca83xx_get_strings,
+	.get_stats		= qca83xx_get_stats,
+	.suspend		= qca8327_suspend,
+	.resume			= qca83xx_resume,
+}, {
+	/* QCA8327-B from switch QCA8327-BL1A */
+	.phy_id			= QCA8327_B_PHY_ID,
+	.phy_id_mask		= QCA8K_PHY_ID_MASK,
+	.name			= "Qualcomm Atheros 8327-B internal PHY",
+	/* PHY_GBIT_FEATURES */
+	.link_change_notify	= qca83xx_link_change_notify,
+	.probe			= qca83xx_probe,
+	.flags			= PHY_IS_INTERNAL,
+	.config_init		= qca8327_config_init,
+	.soft_reset		= genphy_soft_reset,
+	.get_sset_count		= qca83xx_get_sset_count,
+	.get_strings		= qca83xx_get_strings,
+	.get_stats		= qca83xx_get_stats,
+	.suspend		= qca8327_suspend,
+	.resume			= qca83xx_resume,
+}, };
+
+module_phy_driver(qca83xx_driver);
+
+static struct mdio_device_id __maybe_unused qca83xx_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(QCA8337_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(QCA8327_A_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(QCA8327_B_PHY_ID) },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(mdio, qca83xx_tbl);
-- 
2.43.0


