Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB5D43059C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 01:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241143AbhJPXWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 19:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241153AbhJPXWB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 19:22:01 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A92EC061771
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 16:19:41 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id q129so18912690oib.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 Oct 2021 16:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wDjAefGLb2lOw8idPz5ucqkSP3ZyU/zUSty1Wp9XPMM=;
        b=r9Xy6FXEqAiBgNaJjVjnFZqmc7PidJm4GT4r27O2Oag+9JQdA7/L9+5RY3EM91k9df
         0A534Q6Qv/QLJZ3HLN8NuvxYEZ+GEk7fimq/hRZXYxeO3BT+R3JWqv9g000xO0w2aR5Q
         W4AItt7EDbnSHjMy0iSJfNPetaPYdXQUwniT9D+GVJgYInHharupb5t85gZFroJrw0pw
         mgrWc7lSlN2KKTjWh/UvFFpvSAgBiQ8cL6LNMdD/uyajwHFuRj4cngsyLO/QdkvRqwhn
         DU17k9HAQ2NeAi+ixXvmJdAFBS/XTozV2E1UEpICreqkAau3r9AKQiAGBLtZJL/o7hV4
         y/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wDjAefGLb2lOw8idPz5ucqkSP3ZyU/zUSty1Wp9XPMM=;
        b=N4O0q9O5c6Kfzt+68BUVF4fI7O77FWiJtjRiF4lZTTGRnY0Gb22h3gQu9YDoKFEAxK
         jKHq6euPMVGL/H0gsPAYOzMgDlWkGJN8ge3OLn7sgoS+bhJJm6hthhwDoZfE31Y1WR48
         fjx4OLpZEYCeYPuwTZc4ibAwFb891Eh+zEnDxr3D9DyKTIVEr76IdDuRRqiYIqjxBrzg
         kJC3HzwTkWOt9Fpo6XTw6q26h+7VZOA5GbNzhdsK3fOwPOsHyJHVkkr2LG8GoI2O0Dam
         SRKNZglCtYs3mXkSG7OOYRTsGq6Pmu1fnzbjw1WmKExoEEf+DfTRJWLanOrYaKdGUWwd
         GiHA==
X-Gm-Message-State: AOAM532jSL8hrTzIWi58SKcMAskc7fQJRkmU8a7g2pmVXP3uLyIjf1/s
        du5AJWGimW/E7X80iX8cdrdqpg==
X-Google-Smtp-Source: ABdhPJxtCND0BTUmCTZ+mr9Bm99wbUPWOxXgpgvUDiBSb+7R+hPKLm6MAHL/msTrlp4aSD88HERj1Q==
X-Received: by 2002:a05:6808:1489:: with SMTP id e9mr23663737oiw.36.1634426380893;
        Sat, 16 Oct 2021 16:19:40 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l8sm1430287otv.8.2021.10.16.16.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 16:19:40 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        abhinavk@codeaurora.org, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 2/2] phy: qcom: Introduce new eDP PHY driver
Date:   Sat, 16 Oct 2021 16:21:28 -0700
Message-Id: <20211016232128.2341395-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
References: <20211016232128.2341395-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Many recent Qualcomm platforms comes with native DP and eDP support.
This consists of a controller in the MDSS and a QMP-like PHY.

While similar to the well known QMP block, the eDP PHY only has TX lanes
and the programming sequences are slightly different. Rather than
continuing the trend of parameterize the QMP driver to pieces, this
introduces the support as a new driver.

The registration of link and pixel clocks are borrowed from the QMP
driver. The non-DP link frequencies are omitted for now.

The eDP PHY is very similar to the dedicated (non-USB) DP PHY, but only
the prior is supported for now.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Use QSERDES_V4 defines from the common QMP header
- Add "Embedded" and s/dp/edp/ as necessary in the clock graph drawing
- Replaced udelay() with usleep_range()
- Use of_clk_hw_onecell_get() instead of open coding my own equivalent
- Added "QMP" to the MODULE_DESCRIPTION
- Added MODULE_AUTHOR
- Made struct qcom_edp references const where possible

 drivers/phy/qualcomm/Kconfig        |  10 +
 drivers/phy/qualcomm/Makefile       |   1 +
 drivers/phy/qualcomm/phy-qcom-edp.c | 656 ++++++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.h |   1 +
 4 files changed, 668 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-edp.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 7f6fcb8ec5ba..5c98850f5a36 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -18,6 +18,16 @@ config PHY_QCOM_APQ8064_SATA
 	depends on OF
 	select GENERIC_PHY
 
+config PHY_QCOM_EDP
+	tristate "Qualcomm eDP PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on OF
+	depends on COMMON_CLK
+	select GENERIC_PHY
+	help
+	  Enable this driver to support the Qualcomm eDP PHY found in various
+	  Qualcomm chipsets.
+
 config PHY_QCOM_IPQ4019_USB
 	tristate "Qualcomm IPQ4019 USB PHY driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 47acbd7daa3a..e9e3b1a4dbb0 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_ATH79_USB)		+= phy-ath79-usb.o
 obj-$(CONFIG_PHY_QCOM_APQ8064_SATA)	+= phy-qcom-apq8064-sata.o
+obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
new file mode 100644
index 000000000000..c61189131e18
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -0,0 +1,656 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2017, 2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include <dt-bindings/phy/phy.h>
+
+#include "phy-qcom-qmp.h"
+
+/* EDP_PHY registers */
+#define DP_PHY_CFG                              0x0010
+#define DP_PHY_CFG_1                            0x0014
+#define DP_PHY_PD_CTL                           0x001c
+#define DP_PHY_MODE                             0x0020
+
+#define DP_PHY_AUX_CFG0				0x0024
+#define DP_PHY_AUX_CFG1				0x0028
+#define DP_PHY_AUX_CFG2				0x002C
+#define DP_PHY_AUX_CFG3				0x0030
+#define DP_PHY_AUX_CFG4				0x0034
+#define DP_PHY_AUX_CFG5				0x0038
+#define DP_PHY_AUX_CFG6				0x003C
+#define DP_PHY_AUX_CFG7				0x0040
+#define DP_PHY_AUX_CFG8				0x0044
+#define DP_PHY_AUX_CFG9				0x0048
+
+#define DP_PHY_VCO_DIV                          0x0074
+#define DP_PHY_TX0_TX1_LANE_CTL                 0x007c
+#define DP_PHY_TX2_TX3_LANE_CTL                 0x00a0
+
+#define DP_PHY_STATUS                           0x00e0
+
+/* LANE_TXn registers */
+#define TXn_CLKBUF_ENABLE                       0x0000
+#define TXn_TX_EMP_POST1_LVL                    0x0004
+
+#define TXn_TX_DRV_LVL                          0x0014
+#define TXn_TX_DRV_LVL_OFFSET                   0x0018
+#define TXn_RESET_TSYNC_EN                      0x001c
+#define TXn_LDO_CONFIG                          0x0084
+#define TXn_TX_BAND                             0x0028
+
+#define TXn_RES_CODE_LANE_OFFSET_TX0            0x0044
+#define TXn_RES_CODE_LANE_OFFSET_TX1            0x0048
+
+#define TXn_TRANSCEIVER_BIAS_EN                 0x0054
+#define TXn_HIGHZ_DRVR_EN                       0x0058
+#define TXn_TX_POL_INV                          0x005c
+#define TXn_LANE_MODE_1                         0x0064
+
+#define TXn_TRAN_DRVR_EMP_EN                    0x0078
+
+struct qcom_edp {
+	struct device *dev;
+
+	struct phy *phy;
+
+	void __iomem *edp;
+	void __iomem *tx0;
+	void __iomem *tx1;
+	void __iomem *pll;
+
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
+
+	struct phy_configure_opts_dp dp_opts;
+
+	struct clk_bulk_data clks[2];
+	struct regulator_bulk_data supplies[2];
+};
+
+static int qcom_edp_phy_init(struct phy *phy)
+{
+	struct qcom_edp *edp = phy_get_drvdata(phy);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
+	if (ret)
+		goto out_disable_supplies;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+
+	writel(0x17, edp->pll + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
+
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
+	msleep(20);
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+
+	writel(0x00, edp->edp + DP_PHY_AUX_CFG0);
+	writel(0x13, edp->edp + DP_PHY_AUX_CFG1);
+	writel(0x24, edp->edp + DP_PHY_AUX_CFG2);
+	writel(0x00, edp->edp + DP_PHY_AUX_CFG3);
+	writel(0x0a, edp->edp + DP_PHY_AUX_CFG4);
+	writel(0x26, edp->edp + DP_PHY_AUX_CFG5);
+	writel(0x0a, edp->edp + DP_PHY_AUX_CFG6);
+	writel(0x03, edp->edp + DP_PHY_AUX_CFG7);
+	writel(0x37, edp->edp + DP_PHY_AUX_CFG8);
+	writel(0x03, edp->edp + DP_PHY_AUX_CFG9);
+
+	writel(0x1f, edp->edp + 0x58);
+
+	msleep(20);
+
+	return 0;
+
+out_disable_supplies:
+	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
+
+	return ret;
+}
+
+static int qcom_edp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct qcom_edp *edp = phy_get_drvdata(phy);
+
+	memcpy(&edp->dp_opts, dp_opts, sizeof(*dp_opts));
+
+	return 0;
+}
+
+static int qcom_edp_configure_ssc(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 step1;
+	u32 step2;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 8100:
+		step1 = 0x45;
+		step2 = 0x06;
+		break;
+	case 5400:
+		step1 = 0x5c;
+		step2 = 0x08;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + QSERDES_V4_COM_SSC_EN_CENTER);
+	writel(0x00, edp->pll + QSERDES_V4_COM_SSC_ADJ_PER1);
+	writel(0x36, edp->pll + QSERDES_V4_COM_SSC_PER1);
+	writel(0x01, edp->pll + QSERDES_V4_COM_SSC_PER2);
+	writel(step1, edp->pll + QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0);
+	writel(step2, edp->pll + QSERDES_V4_COM_SSC_STEP_SIZE2_MODE0);
+
+	return 0;
+}
+
+static int qcom_edp_configure_pll(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 hsclk_sel;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel = 0x5;
+		dec_start_mode0 = 0x69;
+		div_frac_start2_mode0 = 0x80;
+		div_frac_start3_mode0 = 0x07;
+		lock_cmp1_mode0 = 0x6f;
+		lock_cmp2_mode0 = 0x08;
+		break;
+	case 2700:
+		hsclk_sel = 0x3;
+		dec_start_mode0 = 0x69;
+		div_frac_start2_mode0 = 0x80;
+		div_frac_start3_mode0 = 0x07;
+		lock_cmp1_mode0 = 0x0f;
+		lock_cmp2_mode0 = 0x0e;
+		break;
+	case 5400:
+		hsclk_sel = 0x1;
+		dec_start_mode0 = 0x8c;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x0a;
+		lock_cmp1_mode0 = 0x1f;
+		lock_cmp2_mode0 = 0x1c;
+		break;
+	case 8100:
+		hsclk_sel = 0x0;
+		dec_start_mode0 = 0x69;
+		div_frac_start2_mode0 = 0x80;
+		div_frac_start3_mode0 = 0x07;
+		lock_cmp1_mode0 = 0x2f;
+		lock_cmp2_mode0 = 0x2a;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + QSERDES_V4_COM_SVS_MODE_CLK_SEL);
+	writel(0x0b, edp->pll + QSERDES_V4_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + QSERDES_V4_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + QSERDES_V4_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + QSERDES_V4_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + QSERDES_V4_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + QSERDES_V4_COM_HSCLK_SEL);
+	writel(0x0f, edp->pll + QSERDES_V4_COM_PLL_IVCO);
+	writel(0x08, edp->pll + QSERDES_V4_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + QSERDES_V4_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + QSERDES_V4_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + QSERDES_V4_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + QSERDES_V4_COM_DEC_START_MODE0);
+	writel(0x00, edp->pll + QSERDES_V4_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + QSERDES_V4_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + QSERDES_V4_COM_DIV_FRAC_START3_MODE0);
+	writel(0x02, edp->pll + QSERDES_V4_COM_CMN_CONFIG);
+	writel(0x3f, edp->pll + QSERDES_V4_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + QSERDES_V4_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + QSERDES_V4_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + QSERDES_V4_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + QSERDES_V4_COM_LOCK_CMP2_MODE0);
+
+	writel(0x0a, edp->pll + QSERDES_V4_COM_BG_TIMER);
+	writel(0x14, edp->pll + QSERDES_V4_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + QSERDES_V4_COM_VCO_TUNE_CTRL);
+	writel(0x17, edp->pll + QSERDES_V4_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x0f, edp->pll + QSERDES_V4_COM_CORE_CLK_EN);
+	writel(0xa0, edp->pll + QSERDES_V4_COM_VCO_TUNE1_MODE0);
+	writel(0x03, edp->pll + QSERDES_V4_COM_VCO_TUNE2_MODE0);
+
+	return 0;
+}
+
+static int qcom_edp_set_vco_div(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	unsigned long pixel_freq;
+	u32 vco_div;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		vco_div = 0x1;
+		pixel_freq = 1620000000UL / 2;
+		break;
+	case 2700:
+		vco_div = 0x1;
+		pixel_freq = 2700000000UL / 2;
+		break;
+	case 5400:
+		vco_div = 0x2;
+		pixel_freq = 5400000000UL / 4;
+		break;
+	case 8100:
+		vco_div = 0x0;
+		pixel_freq = 8100000000UL / 6;
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	writel(vco_div, edp->edp + DP_PHY_VCO_DIV);
+
+	clk_set_rate(edp->dp_link_hw.clk, dp_opts->link_rate * 100000);
+	clk_set_rate(edp->dp_pixel_hw.clk, pixel_freq);
+
+	return 0;
+}
+
+static int qcom_edp_phy_power_on(struct phy *phy)
+{
+	const struct qcom_edp *edp = phy_get_drvdata(phy);
+	int timeout;
+	int ret;
+	u32 val;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+	writel(0xfc, edp->edp + DP_PHY_MODE);
+
+	timeout = readl_poll_timeout(edp->pll + QSERDES_V4_COM_CMN_STATUS,
+				     val, val & BIT(7), 5, 200);
+	if (timeout)
+		return timeout;
+
+	writel(0x01, edp->tx0 + TXn_LDO_CONFIG);
+	writel(0x01, edp->tx1 + TXn_LDO_CONFIG);
+	writel(0x00, edp->tx0 + TXn_LANE_MODE_1);
+	writel(0x00, edp->tx1 + TXn_LANE_MODE_1);
+
+	ret = qcom_edp_configure_ssc(edp);
+	if (ret)
+		return ret;
+
+	ret = qcom_edp_configure_pll(edp);
+	if (ret)
+		return ret;
+
+	/* TX Lane configuration */
+	writel(0x05, edp->edp + DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, edp->edp + DP_PHY_TX2_TX3_LANE_CTL);
+
+	/* TX-0 register configuration */
+	writel(0x03, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
+	writel(0x0f, edp->tx0 + TXn_CLKBUF_ENABLE);
+	writel(0x03, edp->tx0 + TXn_RESET_TSYNC_EN);
+	writel(0x01, edp->tx0 + TXn_TRAN_DRVR_EMP_EN);
+	writel(0x04, edp->tx0 + TXn_TX_BAND);
+
+	/* TX-1 register configuration */
+	writel(0x03, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
+	writel(0x0f, edp->tx1 + TXn_CLKBUF_ENABLE);
+	writel(0x03, edp->tx1 + TXn_RESET_TSYNC_EN);
+	writel(0x01, edp->tx1 + TXn_TRAN_DRVR_EMP_EN);
+	writel(0x04, edp->tx1 + TXn_TX_BAND);
+
+	ret = qcom_edp_set_vco_div(edp);
+	if (ret)
+		return ret;
+
+	writel(0x01, edp->edp + DP_PHY_CFG);
+	writel(0x05, edp->edp + DP_PHY_CFG);
+	writel(0x01, edp->edp + DP_PHY_CFG);
+	writel(0x09, edp->edp + DP_PHY_CFG);
+
+	writel(0x20, edp->pll + QSERDES_V4_COM_RESETSM_CNTRL);
+
+	timeout = readl_poll_timeout(edp->pll + QSERDES_V4_COM_C_READY_STATUS,
+				     val, val & BIT(0), 500, 10000);
+	if (timeout)
+		return timeout;
+
+	writel(0x19, edp->edp + DP_PHY_CFG);
+	writel(0x1f, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+	writel(0x04, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+	writel(0x00, edp->tx0 + TXn_TX_POL_INV);
+	writel(0x1f, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+	writel(0x04, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+	writel(0x00, edp->tx1 + TXn_TX_POL_INV);
+	writel(0x10, edp->tx0 + TXn_TX_DRV_LVL_OFFSET);
+	writel(0x10, edp->tx1 + TXn_TX_DRV_LVL_OFFSET);
+	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x11, edp->tx0 + TXn_RES_CODE_LANE_OFFSET_TX1);
+	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX0);
+	writel(0x11, edp->tx1 + TXn_RES_CODE_LANE_OFFSET_TX1);
+
+	writel(0x10, edp->tx0 + TXn_TX_EMP_POST1_LVL);
+	writel(0x10, edp->tx1 + TXn_TX_EMP_POST1_LVL);
+	writel(0x1f, edp->tx0 + TXn_TX_DRV_LVL);
+	writel(0x1f, edp->tx1 + TXn_TX_DRV_LVL);
+
+	writel(0x4, edp->tx0 + TXn_HIGHZ_DRVR_EN);
+	writel(0x3, edp->tx0 + TXn_TRANSCEIVER_BIAS_EN);
+	writel(0x4, edp->tx1 + TXn_HIGHZ_DRVR_EN);
+	writel(0x0, edp->tx1 + TXn_TRANSCEIVER_BIAS_EN);
+	writel(0x3, edp->edp + DP_PHY_CFG_1);
+
+	writel(0x18, edp->edp + DP_PHY_CFG);
+	usleep_range(100, 1000);
+
+	writel(0x19, edp->edp + DP_PHY_CFG);
+
+	return readl_poll_timeout(edp->edp + DP_PHY_STATUS,
+				  val, val & BIT(1), 500, 10000);
+}
+
+static int qcom_edp_phy_power_off(struct phy *phy)
+{
+	const struct qcom_edp *edp = phy_get_drvdata(phy);
+
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, edp->edp + DP_PHY_PD_CTL);
+
+	return 0;
+}
+
+static int qcom_edp_phy_exit(struct phy *phy)
+{
+	struct qcom_edp *edp = phy_get_drvdata(phy);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
+	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
+
+	return 0;
+}
+
+static const struct phy_ops qcom_edp_ops = {
+	.init		= qcom_edp_phy_init,
+	.configure	= qcom_edp_phy_configure,
+	.power_on	= qcom_edp_phy_power_on,
+	.power_off	= qcom_edp_phy_power_off,
+	.exit		= qcom_edp_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+/*
+ * Embedded Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |        EDP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |  (EDP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |   edp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   edp_phy_pll_vco_div_clk  |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for EDP pixel clock
+ *
+ */
+static int qcom_edp_dp_pixel_clk_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+qcom_edp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qcom_edp *edp = container_of(hw, struct qcom_edp, dp_pixel_hw);
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	case 8100:
+		return 8100000000UL / 6;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qcom_edp_dp_pixel_clk_ops = {
+	.determine_rate = qcom_edp_dp_pixel_clk_determine_rate,
+	.recalc_rate = qcom_edp_dp_pixel_clk_recalc_rate,
+};
+
+static int qcom_edp_dp_link_clk_determine_rate(struct clk_hw *hw,
+					       struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+	case 810000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long
+qcom_edp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qcom_edp *edp = container_of(hw, struct qcom_edp, dp_link_hw);
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+	case 8100:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qcom_edp_dp_link_clk_ops = {
+	.determine_rate = qcom_edp_dp_link_clk_determine_rate,
+	.recalc_rate = qcom_edp_dp_link_clk_recalc_rate,
+};
+
+static int qcom_edp_clks_register(struct qcom_edp *edp, struct device_node *np)
+{
+	struct clk_hw_onecell_data *data;
+	struct clk_init_data init = { };
+	int ret;
+
+	data = devm_kzalloc(edp->dev, sizeof(data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	init.ops = &qcom_edp_dp_link_clk_ops;
+	init.name = "edp_phy_pll_link_clk";
+	edp->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(edp->dev, &edp->dp_link_hw);
+	if (ret)
+		return ret;
+
+	init.ops = &qcom_edp_dp_pixel_clk_ops;
+	init.name = "edp_phy_pll_vco_div_clk";
+	edp->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(edp->dev, &edp->dp_pixel_hw);
+	if (ret)
+		return ret;
+
+	data->hws[0] = &edp->dp_link_hw;
+	data->hws[1] = &edp->dp_pixel_hw;
+	data->num = 2;
+
+	return devm_of_clk_add_hw_provider(edp->dev, of_clk_hw_onecell_get, data);
+}
+
+static int qcom_edp_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy_provider;
+	struct device *dev = &pdev->dev;
+	struct qcom_edp *edp;
+	int ret;
+
+	edp = devm_kzalloc(dev, sizeof(*edp), GFP_KERNEL);
+	if (!edp)
+		return -ENOMEM;
+
+	edp->dev = dev;
+
+	edp->edp = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(edp->edp))
+		return PTR_ERR(edp->edp);
+
+	edp->tx0 = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(edp->tx0))
+		return PTR_ERR(edp->tx0);
+
+	edp->tx1 = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(edp->tx1))
+		return PTR_ERR(edp->tx1);
+
+	edp->pll = devm_platform_ioremap_resource(pdev, 3);
+	if (IS_ERR(edp->pll))
+		return PTR_ERR(edp->pll);
+
+	edp->clks[0].id = "aux";
+	edp->clks[1].id = "cfg_ahb";
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
+	if (ret)
+		return ret;
+
+	edp->supplies[0].supply = "vdda-phy";
+	edp->supplies[1].supply = "vdda-pll";
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
+	if (ret)
+		return ret;
+
+	ret = qcom_edp_clks_register(edp, pdev->dev.of_node);
+	if (ret)
+		return ret;
+
+	edp->phy = devm_phy_create(dev, pdev->dev.of_node, &qcom_edp_ops);
+	if (IS_ERR(edp->phy)) {
+		dev_err(dev, "failed to register phy\n");
+		return PTR_ERR(edp->phy);
+	}
+
+	phy_set_drvdata(edp->phy, edp);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id qcom_edp_phy_match_table[] = {
+	{ .compatible = "qcom,sc8180x-edp-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_edp_phy_match_table);
+
+static struct platform_driver qcom_edp_phy_driver = {
+	.probe		= qcom_edp_phy_probe,
+	.driver = {
+		.name	= "qcom-edp-phy",
+		.of_match_table = qcom_edp_phy_match_table,
+	},
+};
+
+module_platform_driver(qcom_edp_phy_driver);
+
+MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm eDP QMP PHY driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.h b/drivers/phy/qualcomm/phy-qcom-qmp.h
index bebeac2c091c..f09bbbac5542 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.h
@@ -549,6 +549,7 @@
 /* Only for QMP V4 PHY - QSERDES COM registers */
 #define QSERDES_V4_COM_BG_TIMER				0x00c
 #define QSERDES_V4_COM_SSC_EN_CENTER			0x010
+#define QSERDES_V4_COM_SSC_ADJ_PER1			0x014
 #define QSERDES_V4_COM_SSC_PER1				0x01c
 #define QSERDES_V4_COM_SSC_PER2				0x020
 #define QSERDES_V4_COM_SSC_STEP_SIZE1_MODE0		0x024
-- 
2.29.2

