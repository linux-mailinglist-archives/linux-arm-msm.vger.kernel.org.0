Return-Path: <linux-arm-msm+bounces-2020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996417F90D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 02:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DB3D28149B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 01:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E9A4693;
	Sun, 26 Nov 2023 01:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOxbiLfX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B2AC6;
	Sat, 25 Nov 2023 17:54:03 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so22068735e9.3;
        Sat, 25 Nov 2023 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963642; x=1701568442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWLQMkrlzH8uAh1/aeykVtG6Cj0sp9oWOzhG1L+nwl8=;
        b=iOxbiLfXbgKwI6WiJTKZvQAvGvSjiEJSRuwsuY/NU3IAJH9qV5cpQWP0FgBFbURDFl
         fJebiUfyTmpd92DIuHMAUoGbAcJaRa0ag9+jVUf//LlLtMR56EO+pqlOufo/JkmBLD9L
         SVcZWnK0Us3FObV8uX3K/BCmaNMiXAi9jWeMPRI5VsqyxewAlEIV/ao+fGZKd+F3d3u7
         NJe9JDgpKajWrXQ+ZW5k00gAn2hwAoUtAGl1hODKGurs2gq03GtiswcrH2XtL9yARdmI
         MPud6ac4yT14nAaB8FrW+6Vtwiz16kskLfAhnYY12/OBWazLZoUstbDMdhp/X1cR8SUV
         O8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963642; x=1701568442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWLQMkrlzH8uAh1/aeykVtG6Cj0sp9oWOzhG1L+nwl8=;
        b=aj5NwJ1i6W94TIFthhNJR/mR7rKVykdQehdf53nkYcjEfDPfoIEOegolkCdJYL+mBA
         UNmfeImS2FD6wdSK87LkxGh3SNy1m3D/1h1FwSaE4P4xHLetUVbZqASCPeMVrl+pbY/M
         K3MOiuEN1y6mIl30sxh1Dy4xPNqoiuzqUGFvzbmpHWx5lqmGSNJMqF5+j070zG6mcZdj
         AdhBUDK3enezS5SW3IwDKih23tX4HlOoqSjUMJwUpdUnd+MpqnrsehHcJGxE28zvzwLy
         IMTUKVV9AtW+KSj6GNWciSejk5TU6YhEH3aLBb2oeQurp0N5PWzSpvy9dawH2bpGeUjM
         TSTg==
X-Gm-Message-State: AOJu0YxSkLmpSXWPdK7iVEcxjLGmQpHsNY2QWoFGfm9WnwlDwUgseyvC
	gL0IvS3FQUghxITaExS6hw4=
X-Google-Smtp-Source: AGHT+IEcckAuBNcC0Ke85fiFAafafB/RO9vnkp9nZX6M/r36E43auDyLmufI4S81wUY1Opqz36GTvA==
X-Received: by 2002:a05:600c:4f15:b0:40b:2977:3d7a with SMTP id l21-20020a05600c4f1500b0040b29773d7amr1927901wmq.31.1700963641850;
        Sat, 25 Nov 2023 17:54:01 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:54:01 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 7/8] net: phy: add Qualcom QCA807x driver
Date: Sun, 26 Nov 2023 02:53:45 +0100
Message-Id: <20231126015346.25208-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert Marko <robert.marko@sartura.hr>

This adds driver for the Qualcomm QCA8072 and QCA8075 PHY-s.

They are 2 or 5 port IEEE 802.3 clause 22 compliant 10BASE-Te,
100BASE-TX and 1000BASE-T PHY-s.

They feature 2 SerDes, one for PSGMII or QSGMII connection with
MAC, while second one is SGMII for connection to MAC or fiber.

Both models have a combo port that supports 1000BASE-X and
100BASE-FX fiber.

PHY package can be configured in 3 mode following this table:

              First Serdes mode       Second Serdes mode
Option 1      PSGMII for copper       Disabled
              ports 0-4
Option 2      PSGMII for copper       1000BASE-X / 100BASE-FX
              ports 0-4
Option 3      QSGMII for copper       SGMII for
              ports 0-3               copper port 4

Each PHY inside of QCA807x series has 4 digitally controlled
output only pins that natively drive LED-s.
But some vendors used these to driver generic LED-s controlled
by userspace, so lets enable registering each PHY as GPIO
controller and add driver for it.

These are commonly used in Qualcomm IPQ40xx, IPQ60xx and IPQ807x
boards.

Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/Kconfig   |   7 +
 drivers/net/phy/Makefile  |   1 +
 drivers/net/phy/qca807x.c | 947 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 955 insertions(+)
 create mode 100644 drivers/net/phy/qca807x.c

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 25cfc5ded1da..5ad85bd978a0 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -325,6 +325,13 @@ config AT803X_PHY
 	  Currently supports the AR8030, AR8031, AR8033, AR8035 and internal
 	  QCA8337(Internal qca8k PHY) model
 
+config QCA807X_PHY
+	tristate "Qualcomm QCA807x PHYs"
+	depends on OF_MDIO
+	help
+	  Currently supports the Qualcomm QCA8072, QCA8075 and the PSGMII
+	  control PHY.
+
 config QSEMI_PHY
 	tristate "Quality Semiconductor PHYs"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index f65e85c91fc1..a4da4f127b23 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -82,6 +82,7 @@ obj-$(CONFIG_NCN26000_PHY)	+= ncn26000.o
 obj-$(CONFIG_NXP_C45_TJA11XX_PHY)	+= nxp-c45-tja11xx.o
 obj-$(CONFIG_NXP_CBTX_PHY)	+= nxp-cbtx.o
 obj-$(CONFIG_NXP_TJA11XX_PHY)	+= nxp-tja11xx.o
+obj-$(CONFIG_QCA807X_PHY)		+= qca807x.o
 obj-$(CONFIG_QSEMI_PHY)		+= qsemi.o
 obj-$(CONFIG_REALTEK_PHY)	+= realtek.o
 obj-$(CONFIG_RENESAS_PHY)	+= uPD60620.o
diff --git a/drivers/net/phy/qca807x.c b/drivers/net/phy/qca807x.c
new file mode 100644
index 000000000000..be039d6de1fb
--- /dev/null
+++ b/drivers/net/phy/qca807x.c
@@ -0,0 +1,947 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 Sartura Ltd.
+ *
+ * Author: Robert Marko <robert.marko@sartura.hr>
+ *         Christian Marangi <ansuelsmth@gmail.com>
+ *
+ * Qualcomm QCA8072 and QCA8075 PHY driver
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/bitfield.h>
+#include <linux/ethtool_netlink.h>
+#include <linux/gpio/driver.h>
+#include <linux/sfp.h>
+
+#include <dt-bindings/net/qcom-qca807x.h>
+
+#define PHY_ID_QCA8072		0x004dd0b2
+#define PHY_ID_QCA8075		0x004dd0b1
+
+/* Downshift */
+#define QCA807X_SMARTSPEED_EN			BIT(5)
+#define QCA807X_SMARTSPEED_RETRY_LIMIT_MASK	GENMASK(4, 2)
+#define QCA807X_SMARTSPEED_RETRY_LIMIT_DEFAULT	5
+#define QCA807X_SMARTSPEED_RETRY_LIMIT_MIN	2
+#define QCA807X_SMARTSPEED_RETRY_LIMIT_MAX	9
+
+/* Cable diagnostic test (CDT) */
+#define QCA807X_CDT						0x16
+#define QCA807X_CDT_ENABLE					BIT(15)
+#define QCA807X_CDT_ENABLE_INTER_PAIR_SHORT			BIT(13)
+#define QCA807X_CDT_STATUS					BIT(11)
+#define QCA807X_CDT_MMD3_STATUS					0x8064
+#define QCA807X_CDT_MDI0_STATUS_MASK				GENMASK(15, 12)
+#define QCA807X_CDT_MDI1_STATUS_MASK				GENMASK(11, 8)
+#define QCA807X_CDT_MDI2_STATUS_MASK				GENMASK(7, 4)
+#define QCA807X_CDT_MDI3_STATUS_MASK				GENMASK(3, 0)
+#define QCA807X_CDT_RESULTS_INVALID				0x0
+#define QCA807X_CDT_RESULTS_OK					0x1
+#define QCA807X_CDT_RESULTS_OPEN				0x2
+#define QCA807X_CDT_RESULTS_SAME_SHORT				0x3
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OK	0x4
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OK	0x8
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OK	0xc
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OPEN	0x6
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OPEN	0xa
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OPEN	0xe
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_SHORT	0x7
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_SHORT	0xb
+#define QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_SHORT	0xf
+#define QCA807X_CDT_RESULTS_BUSY				0x9
+#define QCA807X_CDT_MMD3_MDI0_LENGTH				0x8065
+#define QCA807X_CDT_MMD3_MDI1_LENGTH				0x8066
+#define QCA807X_CDT_MMD3_MDI2_LENGTH				0x8067
+#define QCA807X_CDT_MMD3_MDI3_LENGTH				0x8068
+#define QCA807X_CDT_SAME_SHORT_LENGTH_MASK			GENMASK(15, 8)
+#define QCA807X_CDT_CROSS_SHORT_LENGTH_MASK			GENMASK(7, 0)
+
+#define QCA807X_CHIP_CONFIGURATION				0x1f
+#define QCA807X_BT_BX_REG_SEL					BIT(15)
+#define QCA807X_BT_BX_REG_SEL_FIBER				0
+#define QCA807X_BT_BX_REG_SEL_COPPER				1
+#define QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK		GENMASK(3, 0)
+#define QCA807X_CHIP_CONFIGURATION_MODE_QSGMII_SGMII		4
+#define QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER		3
+#define QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_ALL_COPPER	0
+
+#define QCA807X_MEDIA_SELECT_STATUS				0x1a
+#define QCA807X_MEDIA_DETECTED_COPPER				BIT(5)
+#define QCA807X_MEDIA_DETECTED_1000_BASE_X			BIT(4)
+#define QCA807X_MEDIA_DETECTED_100_BASE_FX			BIT(3)
+
+#define QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION			0x807e
+#define QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN		BIT(0)
+
+#define QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH	0x801a
+#define QCA807X_CONTROL_DAC_MASK				GENMASK(2, 0)
+
+#define QCA807X_MMD7_LED_100N_1				0x8074
+#define QCA807X_MMD7_LED_100N_2				0x8075
+#define QCA807X_MMD7_LED_1000N_1			0x8076
+#define QCA807X_MMD7_LED_1000N_2			0x8077
+#define QCA807X_LED_TXACT_BLK_EN_2			BIT(10)
+#define QCA807X_LED_RXACT_BLK_EN_2			BIT(9)
+#define QCA807X_LED_GT_ON_EN_2				BIT(6)
+#define QCA807X_LED_HT_ON_EN_2				BIT(5)
+#define QCA807X_LED_BT_ON_EN_2				BIT(4)
+#define QCA807X_GPIO_FORCE_EN				BIT(15)
+#define QCA807X_GPIO_FORCE_MODE_MASK			GENMASK(14, 13)
+
+#define QCA807X_INTR_ENABLE				0x12
+#define QCA807X_INTR_STATUS				0x13
+#define QCA807X_INTR_ENABLE_AUTONEG_ERR			BIT(15)
+#define QCA807X_INTR_ENABLE_SPEED_CHANGED		BIT(14)
+#define QCA807X_INTR_ENABLE_DUPLEX_CHANGED		BIT(13)
+#define QCA807X_INTR_ENABLE_LINK_FAIL			BIT(11)
+#define QCA807X_INTR_ENABLE_LINK_SUCCESS		BIT(10)
+
+#define QCA807X_FUNCTION_CONTROL			0x10
+#define QCA807X_FC_MDI_CROSSOVER_MODE_MASK		GENMASK(6, 5)
+#define QCA807X_FC_MDI_CROSSOVER_AUTO			3
+#define QCA807X_FC_MDI_CROSSOVER_MANUAL_MDIX		1
+#define QCA807X_FC_MDI_CROSSOVER_MANUAL_MDI		0
+
+#define QCA807X_PHY_SPECIFIC_STATUS			0x11
+#define QCA807X_SS_SPEED_AND_DUPLEX_RESOLVED		BIT(11)
+#define QCA807X_SS_SPEED_MASK				GENMASK(15, 14)
+#define QCA807X_SS_SPEED_1000				2
+#define QCA807X_SS_SPEED_100				1
+#define QCA807X_SS_SPEED_10				0
+#define QCA807X_SS_DUPLEX				BIT(13)
+#define QCA807X_SS_MDIX					BIT(6)
+
+/* PQSGMII Analog PHY specific */
+#define PQSGMII_CTRL_REG				0x0
+#define PQSGMII_ANALOG_SW_RESET				BIT(6)
+#define PQSGMII_DRIVE_CONTROL_1				0xb
+#define PQSGMII_TX_DRIVER_MASK				GENMASK(7, 4)
+#define PQSGMII_TX_DRIVER_140MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x0)
+#define PQSGMII_TX_DRIVER_160MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x1)
+#define PQSGMII_TX_DRIVER_180MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x2)
+#define PQSGMII_TX_DRIVER_200MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x3)
+#define PQSGMII_TX_DRIVER_220MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x4)
+#define PQSGMII_TX_DRIVER_240MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x5)
+#define PQSGMII_TX_DRIVER_260MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x6)
+#define PQSGMII_TX_DRIVER_280MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x7)
+#define PQSGMII_TX_DRIVER_300MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x8)
+#define PQSGMII_TX_DRIVER_320MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0x9)
+#define PQSGMII_TX_DRIVER_400MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0xa)
+#define PQSGMII_TX_DRIVER_500MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0xb)
+#define PQSGMII_TX_DRIVER_600MV				FIELD_PREP(PQSGMII_TX_DRIVER_MASK, 0xc)
+#define PQSGMII_MODE_CTRL				0x6d
+#define PQSGMII_MODE_CTRL_AZ_WORKAROUND_MASK		BIT(0)
+#define PQSGMII_MMD3_SERDES_CONTROL			0x805a
+
+#define QCA807X_COMBO_ADDR_OFFSET			4
+#define QCA807X_PQSGMII_ADDR_OFFSET			5
+#define SERDES_RESET_SLEEP				100
+
+enum qca807x_global_phy {
+	QCA807X_COMBO_ADDR = 4,
+	QCA807X_PQSGMII_ADDR = 5,
+};
+
+struct qca807x_shared_priv {
+	unsigned int package_mode;
+	u32 tx_driver_strength;
+};
+
+struct qca807x_gpio_priv {
+	struct phy_device *phy;
+};
+
+static int qca807x_get_downshift(struct phy_device *phydev, u8 *data)
+{
+	int val, cnt, enable;
+
+	val = phy_read(phydev, MII_NWAYTEST);
+	if (val < 0)
+		return val;
+
+	enable = FIELD_GET(QCA807X_SMARTSPEED_EN, val);
+	cnt = FIELD_GET(QCA807X_SMARTSPEED_RETRY_LIMIT_MASK, val) + 2;
+
+	*data = enable ? cnt : DOWNSHIFT_DEV_DISABLE;
+
+	return 0;
+}
+
+static int qca807x_set_downshift(struct phy_device *phydev, u8 cnt)
+{
+	int ret, val;
+
+	if (cnt > QCA807X_SMARTSPEED_RETRY_LIMIT_MAX ||
+	    (cnt < QCA807X_SMARTSPEED_RETRY_LIMIT_MIN && cnt != DOWNSHIFT_DEV_DISABLE))
+		return -EINVAL;
+
+	if (!cnt) {
+		ret = phy_clear_bits(phydev, MII_NWAYTEST, QCA807X_SMARTSPEED_EN);
+	} else {
+		val = QCA807X_SMARTSPEED_EN;
+		val |= FIELD_PREP(QCA807X_SMARTSPEED_RETRY_LIMIT_MASK, cnt - 2);
+
+		phy_modify(phydev, MII_NWAYTEST,
+			   QCA807X_SMARTSPEED_EN |
+			   QCA807X_SMARTSPEED_RETRY_LIMIT_MASK,
+			   val);
+	}
+
+	ret = genphy_soft_reset(phydev);
+
+	return ret;
+}
+
+static int qca807x_get_tunable(struct phy_device *phydev,
+			       struct ethtool_tunable *tuna, void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return qca807x_get_downshift(phydev, data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int qca807x_set_tunable(struct phy_device *phydev,
+			       struct ethtool_tunable *tuna, const void *data)
+{
+	switch (tuna->id) {
+	case ETHTOOL_PHY_DOWNSHIFT:
+		return qca807x_set_downshift(phydev, *(const u8 *)data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static bool qca807x_distance_valid(int result)
+{
+	switch (result) {
+	case QCA807X_CDT_RESULTS_OPEN:
+	case QCA807X_CDT_RESULTS_SAME_SHORT:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
+		return true;
+	}
+	return false;
+}
+
+static int qca807x_report_length(struct phy_device *phydev,
+				 int pair, int result)
+{
+	int length;
+	int ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_PCS, QCA807X_CDT_MMD3_MDI0_LENGTH + pair);
+	if (ret < 0)
+		return ret;
+
+	switch (result) {
+	case ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT:
+		length = (FIELD_GET(QCA807X_CDT_SAME_SHORT_LENGTH_MASK, ret) * 800) / 10;
+		break;
+	case ETHTOOL_A_CABLE_RESULT_CODE_OPEN:
+	case ETHTOOL_A_CABLE_RESULT_CODE_CROSS_SHORT:
+		length = (FIELD_GET(QCA807X_CDT_CROSS_SHORT_LENGTH_MASK, ret) * 800) / 10;
+		break;
+	}
+
+	ethnl_cable_test_fault_length(phydev, pair, length);
+
+	return 0;
+}
+
+static int qca807x_cable_test_report_trans(int result)
+{
+	switch (result) {
+	case QCA807X_CDT_RESULTS_OK:
+		return ETHTOOL_A_CABLE_RESULT_CODE_OK;
+	case QCA807X_CDT_RESULTS_OPEN:
+		return ETHTOOL_A_CABLE_RESULT_CODE_OPEN;
+	case QCA807X_CDT_RESULTS_SAME_SHORT:
+		return ETHTOOL_A_CABLE_RESULT_CODE_SAME_SHORT;
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OK:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_OPEN:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI1_SAME_SHORT:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI2_SAME_SHORT:
+	case QCA807X_CDT_RESULTS_CROSS_SHORT_WITH_MDI3_SAME_SHORT:
+		return ETHTOOL_A_CABLE_RESULT_CODE_CROSS_SHORT;
+	default:
+		return ETHTOOL_A_CABLE_RESULT_CODE_UNSPEC;
+	}
+}
+
+static int qca807x_cable_test_report(struct phy_device *phydev)
+{
+	int pair0, pair1, pair2, pair3;
+	int ret;
+
+	ret = phy_read_mmd(phydev, MDIO_MMD_PCS, QCA807X_CDT_MMD3_STATUS);
+	if (ret < 0)
+		return ret;
+
+	pair0 = FIELD_GET(QCA807X_CDT_MDI0_STATUS_MASK, ret);
+	pair1 = FIELD_GET(QCA807X_CDT_MDI1_STATUS_MASK, ret);
+	pair2 = FIELD_GET(QCA807X_CDT_MDI2_STATUS_MASK, ret);
+	pair3 = FIELD_GET(QCA807X_CDT_MDI3_STATUS_MASK, ret);
+
+	ethnl_cable_test_result(phydev, ETHTOOL_A_CABLE_PAIR_A,
+				qca807x_cable_test_report_trans(pair0));
+	ethnl_cable_test_result(phydev, ETHTOOL_A_CABLE_PAIR_B,
+				qca807x_cable_test_report_trans(pair1));
+	ethnl_cable_test_result(phydev, ETHTOOL_A_CABLE_PAIR_C,
+				qca807x_cable_test_report_trans(pair2));
+	ethnl_cable_test_result(phydev, ETHTOOL_A_CABLE_PAIR_D,
+				qca807x_cable_test_report_trans(pair3));
+
+	if (qca807x_distance_valid(pair0))
+		qca807x_report_length(phydev, 0, qca807x_cable_test_report_trans(pair0));
+	if (qca807x_distance_valid(pair1))
+		qca807x_report_length(phydev, 1, qca807x_cable_test_report_trans(pair1));
+	if (qca807x_distance_valid(pair2))
+		qca807x_report_length(phydev, 2, qca807x_cable_test_report_trans(pair2));
+	if (qca807x_distance_valid(pair3))
+		qca807x_report_length(phydev, 3, qca807x_cable_test_report_trans(pair3));
+
+	return 0;
+}
+
+static int qca807x_cable_test_get_status(struct phy_device *phydev,
+					 bool *finished)
+{
+	int val;
+
+	*finished = false;
+
+	val = phy_read(phydev, QCA807X_CDT);
+	if (!((val & QCA807X_CDT_ENABLE) && (val & QCA807X_CDT_STATUS))) {
+		*finished = true;
+
+		return qca807x_cable_test_report(phydev);
+	}
+
+	return 0;
+}
+
+static int qca807x_cable_test_start(struct phy_device *phydev)
+{
+	int val, ret;
+
+	val = phy_read(phydev, QCA807X_CDT);
+	/* Enable inter-pair short check as well */
+	val &= ~QCA807X_CDT_ENABLE_INTER_PAIR_SHORT;
+	val |= QCA807X_CDT_ENABLE;
+	ret = phy_write(phydev, QCA807X_CDT, val);
+
+	return ret;
+}
+
+#ifdef CONFIG_GPIOLIB
+static int qca807x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int qca807x_gpio_get_reg(unsigned int offset)
+{
+	return QCA807X_MMD7_LED_100N_2 + (offset % 2) * 2;
+}
+
+static int qca807x_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
+	int val;
+
+	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
+
+	return FIELD_GET(QCA807X_GPIO_FORCE_MODE_MASK, val);
+}
+
+static void qca807x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct qca807x_gpio_priv *priv = gpiochip_get_data(gc);
+	int val;
+
+	val = phy_read_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset));
+	val &= ~QCA807X_GPIO_FORCE_MODE_MASK;
+	val |= QCA807X_GPIO_FORCE_EN;
+	val |= FIELD_PREP(QCA807X_GPIO_FORCE_MODE_MASK, value);
+
+	phy_write_mmd(priv->phy, MDIO_MMD_AN, qca807x_gpio_get_reg(offset), val);
+}
+
+static int qca807x_gpio_dir_out(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	qca807x_gpio_set(gc, offset, value);
+
+	return 0;
+}
+
+static int qca807x_gpio(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct qca807x_gpio_priv *priv;
+	struct gpio_chip *gc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phy = phydev;
+
+	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
+	if (!gc)
+		return -ENOMEM;
+
+	gc->label = dev_name(dev);
+	gc->base = -1;
+	gc->ngpio = 2;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->can_sleep = true;
+	gc->get_direction = qca807x_gpio_get_direction;
+	gc->direction_output = qca807x_gpio_dir_out;
+	gc->get = qca807x_gpio_get;
+	gc->set = qca807x_gpio_set;
+
+	return devm_gpiochip_add_data(dev, gc, priv);
+}
+#endif
+
+static int qca807x_read_copper_status(struct phy_device *phydev)
+{
+	int ss, err, old_link = phydev->link;
+
+	/* Update the link, but return if there was an error */
+	err = genphy_update_link(phydev);
+	if (err)
+		return err;
+
+	/* why bother the PHY if nothing can have changed */
+	if (phydev->autoneg == AUTONEG_ENABLE && old_link && phydev->link)
+		return 0;
+
+	phydev->speed = SPEED_UNKNOWN;
+	phydev->duplex = DUPLEX_UNKNOWN;
+	phydev->pause = 0;
+	phydev->asym_pause = 0;
+
+	err = genphy_read_lpa(phydev);
+	if (err < 0)
+		return err;
+
+	/* Read the QCA807x PHY-Specific Status register copper page,
+	 * which indicates the speed and duplex that the PHY is actually
+	 * using, irrespective of whether we are in autoneg mode or not.
+	 */
+	ss = phy_read(phydev, QCA807X_PHY_SPECIFIC_STATUS);
+	if (ss < 0)
+		return ss;
+
+	if (ss & QCA807X_SS_SPEED_AND_DUPLEX_RESOLVED) {
+		int sfc;
+
+		sfc = phy_read(phydev, QCA807X_FUNCTION_CONTROL);
+		if (sfc < 0)
+			return sfc;
+
+		switch (FIELD_GET(QCA807X_SS_SPEED_MASK, ss)) {
+		case QCA807X_SS_SPEED_10:
+			phydev->speed = SPEED_10;
+			break;
+		case QCA807X_SS_SPEED_100:
+			phydev->speed = SPEED_100;
+			break;
+		case QCA807X_SS_SPEED_1000:
+			phydev->speed = SPEED_1000;
+			break;
+		}
+		if (ss & QCA807X_SS_DUPLEX)
+			phydev->duplex = DUPLEX_FULL;
+		else
+			phydev->duplex = DUPLEX_HALF;
+
+		if (ss & QCA807X_SS_MDIX)
+			phydev->mdix = ETH_TP_MDI_X;
+		else
+			phydev->mdix = ETH_TP_MDI;
+
+		switch (FIELD_GET(QCA807X_FC_MDI_CROSSOVER_MODE_MASK, sfc)) {
+		case QCA807X_FC_MDI_CROSSOVER_MANUAL_MDI:
+			phydev->mdix_ctrl = ETH_TP_MDI;
+			break;
+		case QCA807X_FC_MDI_CROSSOVER_MANUAL_MDIX:
+			phydev->mdix_ctrl = ETH_TP_MDI_X;
+			break;
+		case QCA807X_FC_MDI_CROSSOVER_AUTO:
+			phydev->mdix_ctrl = ETH_TP_MDI_AUTO;
+			break;
+		}
+	}
+
+	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete)
+		phy_resolve_aneg_pause(phydev);
+
+	return 0;
+}
+
+static int qca807x_read_fiber_status(struct phy_device *phydev)
+{
+	int ss, err, lpa, old_link = phydev->link;
+
+	/* Update the link, but return if there was an error */
+	err = genphy_update_link(phydev);
+	if (err)
+		return err;
+
+	/* why bother the PHY if nothing can have changed */
+	if (phydev->autoneg == AUTONEG_ENABLE && old_link && phydev->link)
+		return 0;
+
+	phydev->speed = SPEED_UNKNOWN;
+	phydev->duplex = DUPLEX_UNKNOWN;
+	phydev->pause = 0;
+	phydev->asym_pause = 0;
+
+	if (phydev->autoneg == AUTONEG_ENABLE && phydev->autoneg_complete) {
+		lpa = phy_read(phydev, MII_LPA);
+		if (lpa < 0)
+			return lpa;
+
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
+				 phydev->lp_advertising, lpa & LPA_LPACK);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
+				 phydev->lp_advertising, lpa & LPA_1000XFULL);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Pause_BIT,
+				 phydev->lp_advertising, lpa & LPA_1000XPAUSE);
+		linkmode_mod_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT,
+				 phydev->lp_advertising,
+				 lpa & LPA_1000XPAUSE_ASYM);
+
+		phy_resolve_aneg_linkmode(phydev);
+	}
+
+	/* Read the QCA807x PHY-Specific Status register fiber page,
+	 * which indicates the speed and duplex that the PHY is actually
+	 * using, irrespective of whether we are in autoneg mode or not.
+	 */
+	ss = phy_read(phydev, QCA807X_PHY_SPECIFIC_STATUS);
+	if (ss < 0)
+		return ss;
+
+	if (ss & QCA807X_SS_SPEED_AND_DUPLEX_RESOLVED) {
+		switch (FIELD_GET(QCA807X_SS_SPEED_MASK, ss)) {
+		case QCA807X_SS_SPEED_100:
+			phydev->speed = SPEED_100;
+			break;
+		case QCA807X_SS_SPEED_1000:
+			phydev->speed = SPEED_1000;
+			break;
+		}
+
+		if (ss & QCA807X_SS_DUPLEX)
+			phydev->duplex = DUPLEX_FULL;
+		else
+			phydev->duplex = DUPLEX_HALF;
+	}
+
+	return 0;
+}
+
+static int qca807x_read_status(struct phy_device *phydev)
+{
+	if (linkmode_test_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported)) {
+		switch (phydev->port) {
+		case PORT_FIBRE:
+			return qca807x_read_fiber_status(phydev);
+		case PORT_TP:
+			return qca807x_read_copper_status(phydev);
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return qca807x_read_copper_status(phydev);
+}
+
+static int qca807x_config_intr(struct phy_device *phydev)
+{
+	int ret, val;
+
+	val = phy_read(phydev, QCA807X_INTR_ENABLE);
+
+	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
+		/* Check for combo port as it has fewer interrupts */
+		if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
+			val |= QCA807X_INTR_ENABLE_SPEED_CHANGED;
+			val |= QCA807X_INTR_ENABLE_LINK_FAIL;
+			val |= QCA807X_INTR_ENABLE_LINK_SUCCESS;
+		} else {
+			val |= QCA807X_INTR_ENABLE_AUTONEG_ERR;
+			val |= QCA807X_INTR_ENABLE_SPEED_CHANGED;
+			val |= QCA807X_INTR_ENABLE_DUPLEX_CHANGED;
+			val |= QCA807X_INTR_ENABLE_LINK_FAIL;
+			val |= QCA807X_INTR_ENABLE_LINK_SUCCESS;
+		}
+		ret = phy_write(phydev, QCA807X_INTR_ENABLE, val);
+	} else {
+		ret = phy_write(phydev, QCA807X_INTR_ENABLE, 0);
+	}
+
+	return ret;
+}
+
+static irqreturn_t qca807x_handle_interrupt(struct phy_device *phydev)
+{
+	int irq_status, int_enabled;
+
+	irq_status = phy_read(phydev, QCA807X_INTR_STATUS);
+	if (irq_status < 0) {
+		phy_error(phydev);
+		return IRQ_NONE;
+	}
+
+	/* Read the current enabled interrupts */
+	int_enabled = phy_read(phydev, QCA807X_INTR_ENABLE);
+	if (int_enabled < 0) {
+		phy_error(phydev);
+		return IRQ_NONE;
+	}
+
+	/* See if this was one of our enabled interrupts */
+	if (!(irq_status & int_enabled))
+		return IRQ_NONE;
+
+	phy_trigger_machine(phydev);
+
+	return IRQ_HANDLED;
+}
+
+static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
+{
+	struct phy_device *phydev = upstream;
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
+	phy_interface_t iface;
+	int ret;
+	DECLARE_PHY_INTERFACE_MASK(interfaces);
+
+	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
+	iface = sfp_select_interface(phydev->sfp_bus, support);
+
+	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
+
+	switch (iface) {
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_100BASEX:
+		/* Set PHY mode to PSGMII combo (1/4 copper + combo ports) mode */
+		ret = phy_modify(phydev,
+				 QCA807X_CHIP_CONFIGURATION,
+				 QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK,
+				 QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER);
+		/* Enable fiber mode autodection (1000Base-X or 100Base-FX) */
+		ret = phy_set_bits_mmd(phydev,
+				       MDIO_MMD_AN,
+				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION,
+				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN);
+		/* Select fiber page */
+		ret = phy_clear_bits(phydev,
+				     QCA807X_CHIP_CONFIGURATION,
+				     QCA807X_BT_BX_REG_SEL);
+
+		phydev->port = PORT_FIBRE;
+		break;
+	default:
+		dev_err(&phydev->mdio.dev, "Incompatible SFP module inserted\n");
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static void qca807x_sfp_remove(void *upstream)
+{
+	struct phy_device *phydev = upstream;
+
+	/* Select copper page */
+	phy_set_bits(phydev,
+		     QCA807X_CHIP_CONFIGURATION,
+		     QCA807X_BT_BX_REG_SEL);
+
+	phydev->port = PORT_TP;
+}
+
+static const struct sfp_upstream_ops qca807x_sfp_ops = {
+	.attach = phy_sfp_attach,
+	.detach = phy_sfp_detach,
+	.module_insert = qca807x_sfp_insert,
+	.module_remove = qca807x_sfp_remove,
+};
+
+static int qca807x_config(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	int control_dac, ret = 0;
+	u32 of_control_dac;
+
+	if (of_property_read_u32(node, "qcom,control-dac", &of_control_dac))
+		of_control_dac = QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS;
+
+	control_dac = phy_read_mmd(phydev, MDIO_MMD_AN,
+				   QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH);
+	control_dac &= ~QCA807X_CONTROL_DAC_MASK;
+	control_dac |= FIELD_PREP(QCA807X_CONTROL_DAC_MASK, of_control_dac);
+	ret = phy_write_mmd(phydev, MDIO_MMD_AN,
+			    QCA807X_MMD7_1000BASE_T_POWER_SAVE_PER_CABLE_LENGTH,
+			    control_dac);
+
+	return ret;
+}
+
+static int qca807x_probe(struct phy_device *phydev)
+{
+	struct device_node *node = phydev->mdio.dev.of_node;
+	struct phy_package_shared *shared = phydev->shared;
+	int ret = 0;
+
+	if (shared) {
+		struct qca807x_shared_priv *shared_priv = shared->priv;
+
+		/* Make sure PHY follow PHY package mode if enforced */
+		if (shared_priv &&
+		    shared_priv->package_mode != PHY_INTERFACE_MODE_NA &&
+		    phydev->interface != shared_priv->package_mode)
+			return -EINVAL;
+	}
+
+	if (IS_ENABLED(CONFIG_GPIOLIB)) {
+		if (of_find_property(node, "leds", NULL) &&
+		    of_find_property(node, "gpio-controller", NULL)) {
+			phydev_err(phydev, "Invalid property detected. LEDs and gpio-controller are mutually exclusive.");
+			return -EINVAL;
+		}
+
+		/* Do not register a GPIO controller unless flagged for it */
+		if (of_property_read_bool(node, "gpio-controller")) {
+			ret = qca807x_gpio(phydev);
+			if (ret)
+				return ret;
+		}
+	}
+
+	/* Attach SFP bus on combo port*/
+	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
+		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
+		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
+	}
+
+	return ret;
+}
+
+static int qca807x_phy_package_probe_once(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct qca807x_shared_priv *priv = shared->priv;
+	unsigned int tx_driver_strength = 0;
+	const char *package_mode_name;
+
+	of_property_read_u32(shared->np, "qcom,tx-driver-strength",
+			     &tx_driver_strength);
+	switch (tx_driver_strength) {
+	case 140:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_140MV;
+		break;
+	case 160:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_160MV;
+		break;
+	case 180:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_180MV;
+		break;
+	case 200:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_200MV;
+		break;
+	case 220:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_220MV;
+		break;
+	case 240:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_240MV;
+		break;
+	case 260:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_260MV;
+		break;
+	case 280:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_280MV;
+		break;
+	case 300:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_300MV;
+		break;
+	case 320:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_320MV;
+		break;
+	case 400:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_400MV;
+		break;
+	case 500:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_500MV;
+		break;
+	case 600:
+	default:
+		priv->tx_driver_strength = PQSGMII_TX_DRIVER_600MV;
+	}
+
+	priv->package_mode = PHY_INTERFACE_MODE_NA;
+	if (!of_property_read_string(shared->np, "qcom,package-mode",
+				     &package_mode_name)) {
+		if (!strcasecmp(package_mode_name,
+				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
+			priv->package_mode = PHY_INTERFACE_MODE_PSGMII;
+
+		if (!strcasecmp(package_mode_name,
+				phy_modes(PHY_INTERFACE_MODE_QSGMII)))
+			priv->package_mode = PHY_INTERFACE_MODE_QSGMII;
+	}
+
+	return 0;
+}
+
+static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct qca807x_shared_priv *priv = shared->priv;
+	int val, ret;
+
+	phy_lock_mdio_bus(phydev);
+
+	/* Set correct PHY package mode */
+	val = __phy_package_read(phydev, QCA807X_COMBO_ADDR,
+				 QCA807X_CHIP_CONFIGURATION);
+	val &= ~QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK;
+	if (priv->package_mode == PHY_INTERFACE_MODE_QSGMII)
+		val |= QCA807X_CHIP_CONFIGURATION_MODE_QSGMII_SGMII;
+	else
+		val |= QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_ALL_COPPER;
+	ret = __phy_package_write(phydev, QCA807X_COMBO_ADDR,
+				  QCA807X_CHIP_CONFIGURATION, val);
+	if (ret)
+		goto exit;
+
+	/* After mode change Serdes reset is required */
+	val = __phy_package_read(phydev, QCA807X_PQSGMII_ADDR,
+				 PQSGMII_CTRL_REG);
+	val &= ~PQSGMII_ANALOG_SW_RESET;
+	ret = __phy_package_write(phydev, QCA807X_PQSGMII_ADDR,
+				  PQSGMII_CTRL_REG, val);
+	if (ret)
+		goto exit;
+
+	msleep(SERDES_RESET_SLEEP);
+
+	val = __phy_package_read(phydev, QCA807X_PQSGMII_ADDR,
+				 PQSGMII_CTRL_REG);
+	val |= PQSGMII_ANALOG_SW_RESET;
+	ret = __phy_package_write(phydev, QCA807X_PQSGMII_ADDR,
+				  PQSGMII_CTRL_REG, val);
+	if (ret)
+		goto exit;
+
+	/* Workaround to enable AZ transmitting ability */
+	val = __phy_package_read_mmd(phydev, QCA807X_PQSGMII_ADDR,
+				     MDIO_MMD_PMAPMD, PQSGMII_MODE_CTRL);
+	val &= ~PQSGMII_MODE_CTRL_AZ_WORKAROUND_MASK;
+	ret = __phy_package_write_mmd(phydev, QCA807X_PQSGMII_ADDR,
+				      MDIO_MMD_PMAPMD, PQSGMII_MODE_CTRL, val);
+	if (ret)
+		goto exit;
+
+	/* Set PQSGMII TX AMP strength */
+	val = __phy_package_read(phydev, QCA807X_PQSGMII_ADDR,
+				 PQSGMII_DRIVE_CONTROL_1);
+	val &= ~PQSGMII_TX_DRIVER_MASK;
+	val |= FIELD_PREP(PQSGMII_TX_DRIVER_MASK, priv->tx_driver_strength);
+	ret = __phy_package_write(phydev, QCA807X_PQSGMII_ADDR,
+				  PQSGMII_DRIVE_CONTROL_1, val);
+	if (ret)
+		goto exit;
+
+	/* Prevent PSGMII going into hibernation via PSGMII self test */
+	val = __phy_package_read_mmd(phydev, QCA807X_COMBO_ADDR,
+				     MDIO_MMD_PCS, PQSGMII_MMD3_SERDES_CONTROL);
+	val &= ~BIT(1);
+	ret = __phy_package_write_mmd(phydev, QCA807X_COMBO_ADDR,
+				      MDIO_MMD_PCS, PQSGMII_MMD3_SERDES_CONTROL, val);
+
+exit:
+	phy_unlock_mdio_bus(phydev);
+
+	return ret;
+}
+
+static struct phy_driver qca807x_drivers[] = {
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_QCA8072),
+		.name           = "Qualcomm QCA8072",
+		.flags		= PHY_POLL_CABLE_TEST,
+		/* PHY_GBIT_FEATURES */
+		.probe		= qca807x_probe,
+		.config_init	= qca807x_config,
+		.read_status	= qca807x_read_status,
+		.config_intr	= qca807x_config_intr,
+		.handle_interrupt = qca807x_handle_interrupt,
+		.soft_reset	= genphy_soft_reset,
+		.get_tunable	= qca807x_get_tunable,
+		.set_tunable	= qca807x_set_tunable,
+		.resume		= genphy_resume,
+		.suspend	= genphy_suspend,
+		.cable_test_start	= qca807x_cable_test_start,
+		.cable_test_get_status	= qca807x_cable_test_get_status,
+	},
+	{
+		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
+		.name           = "Qualcomm QCA8075",
+		.flags		= PHY_POLL_CABLE_TEST,
+		/* PHY_GBIT_FEATURES */
+		.probe		= qca807x_probe,
+		.config_init	= qca807x_config,
+		.read_status	= qca807x_read_status,
+		.config_intr	= qca807x_config_intr,
+		.handle_interrupt = qca807x_handle_interrupt,
+		.soft_reset	= genphy_soft_reset,
+		.get_tunable	= qca807x_get_tunable,
+		.set_tunable	= qca807x_set_tunable,
+		.resume		= genphy_resume,
+		.suspend	= genphy_suspend,
+		.cable_test_start	= qca807x_cable_test_start,
+		.cable_test_get_status	= qca807x_cable_test_get_status,
+		/* PHY package define */
+		.phy_package_priv_data_size = sizeof(struct qca807x_shared_priv),
+		.phy_package_probe_once = qca807x_phy_package_probe_once,
+		.phy_package_config_init_once = qca807x_phy_package_config_init_once,
+	},
+};
+module_phy_driver(qca807x_drivers);
+
+static struct mdio_device_id __maybe_unused qca807x_tbl[] = {
+	{ PHY_ID_MATCH_EXACT(PHY_ID_QCA8072) },
+	{ PHY_ID_MATCH_EXACT(PHY_ID_QCA8075) },
+	{ }
+};
+
+MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Qualcomm QCA807x PHY driver");
+MODULE_DEVICE_TABLE(mdio, qca807x_tbl);
+MODULE_LICENSE("GPL");
-- 
2.40.1


