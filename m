Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBEA72BC75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbjFLJaW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbjFLJ3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:29:41 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2ABFE5F
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:30 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f7fc9014fdso29580515e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561869; x=1689153869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2Q9u8nL2MctzBi0bIbdVww9XI393qnIbj9hxLOi3Yc=;
        b=YqGBg5XuLWiS2RlwLB4NV3xSgXE2hRiq7NBwm5OyzaaQVK/mXNE/YlJV9ZLPByWU+q
         Moji+ZB5Oh3Cqv+PfmZuxiftwIlrvkg+W4pSbH/PxJNtcYqGF+RMhekQFoyv5kVBnB4Q
         zxfhwYb4mK7qpypVJCU9fBcwx0kQfiLBz5aW1lAbDLYg+jCZdFHNUFdn0CMG6AxXT1SP
         zj0AnDbdscKe6kVJ4Jiz7RGtj0Me9ClkFbRa3to9uKd/Ju2K4ZyEl7eCcGG6R5i/g32R
         jOPHZtO9SW34Sfy7+Z6gx30m9o/UqHRqoMW3HoX08cuMr5kVGgLO5TCJxWJ7iJGm2rj8
         BAng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561869; x=1689153869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2Q9u8nL2MctzBi0bIbdVww9XI393qnIbj9hxLOi3Yc=;
        b=lePiGCZByvzUonu3uTLnTwNu3bQYNuuCNNcrtDyvYDJCq4x7Xs38FCdOFGgvrLpNxv
         mmKPIf4hfPzUbPgwwWLSqksNfb+E3e8hDhVfN/PVomK0JcKiB8eHt4/8POrU0GsiRBWX
         c9ynksx/Qk62gXz1AyLLdh/eNDtAfOUIB5Eupqg8SZluvL6ITqhlVkO1AubTqKG/+T/j
         OmuVD/Swy8nPRFTxqk574onSF06GeKSfmOJkjlKOPWeTKCIy0xg2RFiyd4fnL2C4JqJU
         BhRQtGwfKjdOG+hl6aVCZLC3iXd1NgVuoLx8ubcw1uz4smdCtXqhTyAcC+LfdcaJlk7y
         RAew==
X-Gm-Message-State: AC+VfDyKpq6ZZJi4VamF6UW4YcEgEs3ZWUIBJPj8MBgB2JWDcKrD5Wml
        wIy99Bab5dekQaHP/4SPpCbPNA==
X-Google-Smtp-Source: ACHHUZ4G35Z4OZRWGqxy6YPjTtJQL9p2CbJKOb0iN7gMv2ixQZx0nAD3OFQFqaa+nNxj3yAE8mbgkA==
X-Received: by 2002:a05:600c:aca:b0:3f7:fa21:f66 with SMTP id c10-20020a05600c0aca00b003f7fa210f66mr6133978wmr.26.1686561869424;
        Mon, 12 Jun 2023 02:24:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:24:28 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 03/26] phy: qcom: add the SGMII SerDes PHY driver
Date:   Mon, 12 Jun 2023 11:23:32 +0200
Message-Id: <20230612092355.87937-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement support for the SGMII/SerDes PHY present on various Qualcomm
platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/phy/qualcomm/Kconfig              |   9 +
 drivers/phy/qualcomm/Makefile             |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 446 ++++++++++++++++++++++
 3 files changed, 456 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 67a45d95250d..97ca5952e34e 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -188,3 +188,12 @@ config PHY_QCOM_IPQ806X_USB
 	  This option enables support for the Synopsis PHYs present inside the
 	  Qualcomm USB3.0 DWC3 controller on ipq806x SoC. This driver supports
 	  both HS and SS PHY controllers.
+
+config PHY_QCOM_SGMII_ETH
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on HAS_IOMEM
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on various
+	  Qualcomm chipsets.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 5fb33628566b..b030858e0f8d 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -21,3 +21,4 @@ obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
 obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
new file mode 100644
index 000000000000..c9f0324a987c
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -0,0 +1,446 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define QSERDES_QMP_PLL					0x0
+#define QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0		(QSERDES_QMP_PLL + 0x1ac)
+#define QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0		(QSERDES_QMP_PLL + 0x1b0)
+#define QSERDES_COM_BIN_VCOCAL_HSCLK_SEL		(QSERDES_QMP_PLL + 0x1bc)
+#define QSERDES_COM_CORE_CLK_EN				(QSERDES_QMP_PLL + 0x174)
+#define QSERDES_COM_CORECLK_DIV_MODE0			(QSERDES_QMP_PLL + 0x168)
+#define QSERDES_COM_CP_CTRL_MODE0			(QSERDES_QMP_PLL + 0x74)
+#define QSERDES_COM_DEC_START_MODE0			(QSERDES_QMP_PLL + 0xbc)
+#define QSERDES_COM_DIV_FRAC_START1_MODE0		(QSERDES_QMP_PLL + 0xcc)
+#define QSERDES_COM_DIV_FRAC_START2_MODE0		(QSERDES_QMP_PLL + 0xd0)
+#define QSERDES_COM_DIV_FRAC_START3_MODE0		(QSERDES_QMP_PLL + 0xd4)
+#define QSERDES_COM_HSCLK_HS_SWITCH_SEL			(QSERDES_QMP_PLL + 0x15c)
+#define QSERDES_COM_HSCLK_SEL				(QSERDES_QMP_PLL + 0x158)
+#define QSERDES_COM_LOCK_CMP1_MODE0			(QSERDES_QMP_PLL + 0xac)
+#define QSERDES_COM_LOCK_CMP2_MODE0			(QSERDES_QMP_PLL + 0xb0)
+#define QSERDES_COM_PLL_CCTRL_MODE0			(QSERDES_QMP_PLL + 0x84)
+#define QSERDES_COM_PLL_IVCO				(QSERDES_QMP_PLL + 0x58)
+#define QSERDES_COM_PLL_RCTRL_MODE0			(QSERDES_QMP_PLL + 0x7c)
+#define QSERDES_COM_SYSCLK_EN_SEL			(QSERDES_QMP_PLL + 0x94)
+#define QSERDES_COM_VCO_TUNE1_MODE0			(QSERDES_QMP_PLL + 0x110)
+#define QSERDES_COM_VCO_TUNE2_MODE0			(QSERDES_QMP_PLL + 0x114)
+#define QSERDES_COM_VCO_TUNE_INITVAL2			(QSERDES_QMP_PLL + 0x124)
+#define QSERDES_COM_C_READY_STATUS			(QSERDES_QMP_PLL + 0x178)
+#define QSERDES_COM_CMN_STATUS				(QSERDES_QMP_PLL + 0x140)
+
+#define QSERDES_RX					0x600
+#define QSERDES_RX_UCDR_FO_GAIN				(QSERDES_RX + 0x8)
+#define QSERDES_RX_UCDR_SO_GAIN				(QSERDES_RX + 0x14)
+#define QSERDES_RX_UCDR_FASTLOCK_FO_GAIN		(QSERDES_RX + 0x30)
+#define QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE	(QSERDES_RX + 0x34)
+#define QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW		(QSERDES_RX + 0x3c)
+#define QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH		(QSERDES_RX + 0x40)
+#define QSERDES_RX_UCDR_PI_CONTROLS			(QSERDES_RX + 0x44)
+#define QSERDES_RX_UCDR_PI_CTRL2			(QSERDES_RX + 0x48)
+#define QSERDES_RX_RX_TERM_BW				(QSERDES_RX + 0x80)
+#define QSERDES_RX_VGA_CAL_CNTRL2			(QSERDES_RX + 0xd8)
+#define QSERDES_RX_GM_CAL				(QSERDES_RX + 0xdc)
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1		(QSERDES_RX + 0xe8)
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2		(QSERDES_RX + 0xec)
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3		(QSERDES_RX + 0xf0)
+#define QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4		(QSERDES_RX + 0xf4)
+#define QSERDES_RX_RX_IDAC_TSETTLE_LOW			(QSERDES_RX + 0xf8)
+#define QSERDES_RX_RX_IDAC_TSETTLE_HIGH			(QSERDES_RX + 0xfc)
+#define QSERDES_RX_RX_IDAC_MEASURE_TIME			(QSERDES_RX + 0x100)
+#define QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1		(QSERDES_RX + 0x110)
+#define QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2		(QSERDES_RX + 0x114)
+#define QSERDES_RX_SIGDET_CNTRL				(QSERDES_RX + 0x11c)
+#define QSERDES_RX_SIGDET_DEGLITCH_CNTRL		(QSERDES_RX + 0x124)
+#define QSERDES_RX_RX_BAND				(QSERDES_RX + 0x128)
+#define QSERDES_RX_RX_MODE_00_LOW			(QSERDES_RX + 0x15c)
+#define QSERDES_RX_RX_MODE_00_HIGH			(QSERDES_RX + 0x160)
+#define QSERDES_RX_RX_MODE_00_HIGH2			(QSERDES_RX + 0x164)
+#define QSERDES_RX_RX_MODE_00_HIGH3			(QSERDES_RX + 0x168)
+#define QSERDES_RX_RX_MODE_00_HIGH4			(QSERDES_RX + 0x16c)
+#define QSERDES_RX_RX_MODE_01_LOW			(QSERDES_RX + 0x170)
+#define QSERDES_RX_RX_MODE_01_HIGH			(QSERDES_RX + 0x174)
+#define QSERDES_RX_RX_MODE_01_HIGH2			(QSERDES_RX + 0x178)
+#define QSERDES_RX_RX_MODE_01_HIGH3			(QSERDES_RX + 0x17c)
+#define QSERDES_RX_RX_MODE_01_HIGH4			(QSERDES_RX + 0x180)
+#define QSERDES_RX_RX_MODE_10_LOW			(QSERDES_RX + 0x184)
+#define QSERDES_RX_RX_MODE_10_HIGH			(QSERDES_RX + 0x188)
+#define QSERDES_RX_RX_MODE_10_HIGH2			(QSERDES_RX + 0x18c)
+#define QSERDES_RX_RX_MODE_10_HIGH3			(QSERDES_RX + 0x190)
+#define QSERDES_RX_RX_MODE_10_HIGH4			(QSERDES_RX + 0x194)
+#define QSERDES_RX_DCC_CTRL1				(QSERDES_RX + 0x1a8)
+
+#define QSERDES_TX					0x400
+#define QSERDES_TX_TX_BAND				(QSERDES_TX + 0x24)
+#define QSERDES_TX_SLEW_CNTL				(QSERDES_TX + 0x28)
+#define QSERDES_TX_RES_CODE_LANE_OFFSET_TX		(QSERDES_TX + 0x3c)
+#define QSERDES_TX_RES_CODE_LANE_OFFSET_RX		(QSERDES_TX + 0x40)
+#define QSERDES_TX_LANE_MODE_1				(QSERDES_TX + 0x84)
+#define QSERDES_TX_LANE_MODE_3				(QSERDES_TX + 0x8c)
+#define QSERDES_TX_RCV_DETECT_LVL_2			(QSERDES_TX + 0xa4)
+#define QSERDES_TX_TRAN_DRVR_EMP_EN			(QSERDES_TX + 0xc0)
+
+#define QSERDES_PCS					0xC00
+#define QSERDES_PCS_PHY_START				(QSERDES_PCS + 0x0)
+#define QSERDES_PCS_POWER_DOWN_CONTROL			(QSERDES_PCS + 0x4)
+#define QSERDES_PCS_SW_RESET				(QSERDES_PCS + 0x8)
+#define QSERDES_PCS_LINE_RESET_TIME			(QSERDES_PCS + 0xc)
+#define QSERDES_PCS_TX_LARGE_AMP_DRV_LVL		(QSERDES_PCS + 0x20)
+#define QSERDES_PCS_TX_SMALL_AMP_DRV_LVL		(QSERDES_PCS + 0x28)
+#define QSERDES_PCS_TX_MID_TERM_CTRL1			(QSERDES_PCS + 0xd8)
+#define QSERDES_PCS_TX_MID_TERM_CTRL2			(QSERDES_PCS + 0xdc)
+#define QSERDES_PCS_SGMII_MISC_CTRL8			(QSERDES_PCS + 0x118)
+#define QSERDES_PCS_PCS_READY_STATUS			(QSERDES_PCS + 0x94)
+
+#define QSERDES_COM_C_READY				BIT(0)
+#define QSERDES_PCS_READY				BIT(0)
+#define QSERDES_PCS_SGMIIPHY_READY			BIT(7)
+#define QSERDES_COM_C_PLL_LOCKED			BIT(1)
+
+struct qcom_dwmac_sgmii_phy_data {
+	struct regmap *regmap;
+	int speed;
+};
+
+static void qcom_dwmac_sgmii_phy_init_1g(struct regmap *regmap)
+{
+	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
+	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
+
+	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
+	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
+	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
+	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
+	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
+	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x0A);
+	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x1A);
+	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x82);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x55);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x55);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x03);
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0x24);
+
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
+	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x04);
+	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
+	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x0A);
+	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xB9);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1E);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
+
+	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x05);
+	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
+	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
+	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x09);
+	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
+	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
+	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
+	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
+
+	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
+	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
+	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x04);
+	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
+	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
+	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
+	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
+	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x05);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
+	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
+
+	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
+	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
+	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
+	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
+	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x0C);
+	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
+
+	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
+}
+
+static void qcom_dwmac_sgmii_phy_init_2p5g(struct regmap *regmap)
+{
+	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x01);
+	regmap_write(regmap, QSERDES_PCS_POWER_DOWN_CONTROL, 0x01);
+
+	regmap_write(regmap, QSERDES_COM_PLL_IVCO, 0x0F);
+	regmap_write(regmap, QSERDES_COM_CP_CTRL_MODE0, 0x06);
+	regmap_write(regmap, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
+	regmap_write(regmap, QSERDES_COM_PLL_CCTRL_MODE0, 0x36);
+	regmap_write(regmap, QSERDES_COM_SYSCLK_EN_SEL, 0x1A);
+	regmap_write(regmap, QSERDES_COM_LOCK_CMP1_MODE0, 0x1A);
+	regmap_write(regmap, QSERDES_COM_LOCK_CMP2_MODE0, 0x41);
+	regmap_write(regmap, QSERDES_COM_DEC_START_MODE0, 0x7A);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START2_MODE0, 0x20);
+	regmap_write(regmap, QSERDES_COM_DIV_FRAC_START3_MODE0, 0x01);
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE1_MODE0, 0xA1);
+
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE2_MODE0, 0x02);
+	regmap_write(regmap, QSERDES_COM_VCO_TUNE_INITVAL2, 0x00);
+	regmap_write(regmap, QSERDES_COM_HSCLK_SEL, 0x03);
+	regmap_write(regmap, QSERDES_COM_HSCLK_HS_SWITCH_SEL, 0x00);
+	regmap_write(regmap, QSERDES_COM_CORECLK_DIV_MODE0, 0x05);
+	regmap_write(regmap, QSERDES_COM_CORE_CLK_EN, 0x00);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xCD);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x1C);
+	regmap_write(regmap, QSERDES_COM_BIN_VCOCAL_HSCLK_SEL, 0x11);
+
+	regmap_write(regmap, QSERDES_TX_TX_BAND, 0x04);
+	regmap_write(regmap, QSERDES_TX_SLEW_CNTL, 0x0A);
+	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_TX, 0x09);
+	regmap_write(regmap, QSERDES_TX_RES_CODE_LANE_OFFSET_RX, 0x02);
+	regmap_write(regmap, QSERDES_TX_LANE_MODE_1, 0x05);
+	regmap_write(regmap, QSERDES_TX_LANE_MODE_3, 0x00);
+	regmap_write(regmap, QSERDES_TX_RCV_DETECT_LVL_2, 0x12);
+	regmap_write(regmap, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x0C);
+
+	regmap_write(regmap, QSERDES_RX_UCDR_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX_UCDR_SO_GAIN, 0x06);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_FO_GAIN, 0x0A);
+	regmap_write(regmap, QSERDES_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7F);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_LOW, 0x00);
+	regmap_write(regmap, QSERDES_RX_UCDR_FASTLOCK_COUNT_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX_UCDR_PI_CONTROLS, 0x81);
+	regmap_write(regmap, QSERDES_RX_UCDR_PI_CTRL2, 0x80);
+	regmap_write(regmap, QSERDES_RX_RX_TERM_BW, 0x00);
+	regmap_write(regmap, QSERDES_RX_VGA_CAL_CNTRL2, 0x08);
+	regmap_write(regmap, QSERDES_RX_GM_CAL, 0x0F);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL1, 0x04);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL3, 0x4A);
+	regmap_write(regmap, QSERDES_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0A);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_LOW, 0x80);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_TSETTLE_HIGH, 0x01);
+	regmap_write(regmap, QSERDES_RX_RX_IDAC_MEASURE_TIME, 0x20);
+	regmap_write(regmap, QSERDES_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x17);
+	regmap_write(regmap, QSERDES_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x00);
+	regmap_write(regmap, QSERDES_RX_SIGDET_CNTRL, 0x0F);
+	regmap_write(regmap, QSERDES_RX_SIGDET_DEGLITCH_CNTRL, 0x1E);
+	regmap_write(regmap, QSERDES_RX_RX_BAND, 0x18);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_LOW, 0x18);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH3, 0x0C);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_00_HIGH4, 0xB8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH3, 0x09);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_01_HIGH4, 0xB1);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_LOW, 0xE0);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH2, 0xC8);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH3, 0x3B);
+	regmap_write(regmap, QSERDES_RX_RX_MODE_10_HIGH4, 0xB7);
+	regmap_write(regmap, QSERDES_RX_DCC_CTRL1, 0x0C);
+
+	regmap_write(regmap, QSERDES_PCS_LINE_RESET_TIME, 0x0C);
+	regmap_write(regmap, QSERDES_PCS_TX_LARGE_AMP_DRV_LVL, 0x1F);
+	regmap_write(regmap, QSERDES_PCS_TX_SMALL_AMP_DRV_LVL, 0x03);
+	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL1, 0x83);
+	regmap_write(regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(regmap, QSERDES_PCS_SGMII_MISC_CTRL8, 0x8C);
+	regmap_write(regmap, QSERDES_PCS_SW_RESET, 0x00);
+
+	regmap_write(regmap, QSERDES_PCS_PHY_START, 0x01);
+}
+
+static inline int
+qcom_dwmac_sgmii_phy_poll_status(struct regmap *regmap, unsigned int reg,
+				 unsigned int bit)
+{
+	unsigned int val;
+
+	return regmap_read_poll_timeout(regmap, reg, val,
+					val & bit, 1500, 750000);
+}
+
+static int qcom_dwmac_sgmii_phy_init(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+
+	switch (data->speed) {
+	case SPEED_10:
+	case SPEED_100:
+	case SPEED_1000:
+		qcom_dwmac_sgmii_phy_init_1g(data->regmap);
+		break;
+	case SPEED_2500:
+		qcom_dwmac_sgmii_phy_init_2p5g(data->regmap);
+		break;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+					     QSERDES_COM_C_READY_STATUS,
+					     QSERDES_COM_C_READY)) {
+		dev_err(dev, "QSERDES_COM_C_READY_STATUS timedout");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+					     QSERDES_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS_READY)) {
+		dev_err(dev, "PCS_READY timedout");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+					     QSERDES_PCS_PCS_READY_STATUS,
+					     QSERDES_PCS_SGMIIPHY_READY)) {
+		dev_err(dev, "SGMIIPHY_READY timedout");
+		return -ETIMEDOUT;
+	}
+
+	if (qcom_dwmac_sgmii_phy_poll_status(data->regmap,
+					     QSERDES_COM_CMN_STATUS,
+					     QSERDES_COM_C_PLL_LOCKED)) {
+		dev_err(dev, "PLL Lock Status timedout");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_exit(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+
+	regmap_write(data->regmap, QSERDES_PCS_TX_MID_TERM_CTRL2, 0x08);
+	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x01);
+	udelay(100);
+	regmap_write(data->regmap, QSERDES_PCS_SW_RESET, 0x00);
+	regmap_write(data->regmap, QSERDES_PCS_PHY_START, 0x01);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_set_speed(struct phy *phy, int speed)
+{
+	struct qcom_dwmac_sgmii_phy_data *data = phy_get_drvdata(phy);
+
+	if (speed != data->speed)
+		data->speed = speed;
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_calibrate(struct phy *phy)
+{
+	return qcom_dwmac_sgmii_phy_init(phy);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_ops = {
+	.init		= qcom_dwmac_sgmii_phy_init,
+	.exit		= qcom_dwmac_sgmii_phy_exit,
+	.set_speed	= qcom_dwmac_sgmii_phy_set_speed,
+	.calibrate	= qcom_dwmac_sgmii_phy_calibrate,
+	.owner		= THIS_MODULE,
+};
+
+static const struct regmap_config qcom_dwmac_sgmii_phy_regmap_cfg = {
+	.reg_bits		= 32,
+	.val_bits		= 32,
+	.reg_stride		= 4,
+	.use_relaxed_mmio	= true,
+	.disable_locking	= true,
+};
+
+static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_data *data;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct clk *refclk;
+	void __iomem *base;
+	struct phy *phy;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	data->regmap = devm_regmap_init_mmio(dev, base,
+					     &qcom_dwmac_sgmii_phy_regmap_cfg);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	refclk = devm_clk_get_enabled(dev, "sgmi_ref");
+	if (IS_ERR(refclk))
+		return PTR_ERR(refclk);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return PTR_ERR(provider);
+
+	phy_set_drvdata(phy, data);
+	platform_set_drvdata(pdev, data);
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
+	{ .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_probe,
+	.driver = {
+		.name	= "qcom-dwmac-sgmii-phy",
+		.of_match_table	= qcom_dwmac_sgmii_phy_of_match,
+	}
+};
+
+module_platform_driver(qcom_dwmac_sgmii_phy_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

