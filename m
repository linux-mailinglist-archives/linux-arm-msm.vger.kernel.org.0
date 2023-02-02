Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10BF4687EDA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbjBBNin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:38:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbjBBNii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:38:38 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701698E493
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:38:33 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1423874wms.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYq4wMK5S1ToRqdSUp6ntH/ifz+iAM/Bt7zCv5RvtcM=;
        b=eHYTVMwewQIgJLDgdmmQ39EuRBV6oOFmNs9rKUC8Hj0ekzPBkGdNoQYn6tkS5FUWYE
         32HawtIWDWayxQLK+QEw71fuuBpRE9oQRsOlv5DAP/zG3kW+WHcplS+X+kgORX2TjXUe
         VW/kOFXz65Ht37GBsQ34x/kstCKFiQGy7RMNiRS/xuSWHmZhKwZl1L3D63kyqHp2VGXs
         NLTiQTWrl/kJtjWoMtWEeY7t2E1TTou2AuuKv0xAuzU1WTluUCo0SvrAjybei4Xgk+wl
         MHVNoBWfBwawvRqAU7he5E9pT0wwoRuKQ2gJr8x2O18WR4Cgv473HWOtCSZN7HsLoEzJ
         SynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYq4wMK5S1ToRqdSUp6ntH/ifz+iAM/Bt7zCv5RvtcM=;
        b=bu0Aq1Zzutfl7TdHddAUcccysP+VNM2vz28No0LfjSDo+N23zmvSl1/f7vl+BhO4+3
         t9K8P4u6Z6uOPbmKIuGVFYxDVUfdFL1ZU+V+/J7Swi85gN4PsyGS1t0/a744VmiEWl+1
         shz15BW6YK2yuBQfNgP7sadpcGt3TO/Ta43OXmqeDQUhXKe9o/QOiGFym0N+t11wERSO
         vEwGVirkag0dquoQliqzNkTh3oyEn/XFKxSFPBe2sRzXCEUTMOuk2Pcgd6JfqsU+irYJ
         rHjkw0YFVL8EWx9czqquS6/R5FMhEDH8tB2Nz1sJVqSBeIhMlx5YUjq6YlAJTAo0MgSv
         7tUg==
X-Gm-Message-State: AO0yUKUpJ0wu9HMJbzcOQhjwJdUuMoUuIZgorQ1pgGhEppGSzZZxX/fV
        aD8aVrO2BcBmvPFoXYVA651NjQ==
X-Google-Smtp-Source: AK7set8KLjWbFuqx8VUDsCZQ29h3vaNWmOft7ynsWBxGW0E92Sj2X5vagOQKxHFeaa63il6TWvZfHQ==
X-Received: by 2002:a05:600c:b86:b0:3db:2dbb:d70e with SMTP id fl6-20020a05600c0b8600b003db2dbbd70emr6013790wmb.6.1675345111680;
        Thu, 02 Feb 2023 05:38:31 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b003daf7721bb3sm4672657wmq.12.2023.02.02.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:38:31 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v3 4/7] phy: qcom: Add QCOM SNPS eUSB2 repeater driver
Date:   Thu,  2 Feb 2023 15:38:13 +0200
Message-Id: <20230202133816.4026990-5-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202133816.4026990-1-abel.vesa@linaro.org>
References: <20230202133816.4026990-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM8550B contains a eUSB2 repeater used for making the eUSB2 from
SM8550 USB 2.0 compliant. This can be modelled SW-wise as a Phy.
So add a new phy driver for it.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 278 ++++++++++++++++++
 3 files changed, 288 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 27b5a2a3637d..a70631b04522 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -79,6 +79,15 @@ config PHY_QCOM_SNPS_EUSB2
 	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
 	  on Qualcomm SOCs.
 
+config PHY_QCOM_EUSB2_REPEATER
+	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
+	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  on Qualcomm SOCs.
+
 config PHY_QCOM_USB_HS
 	tristate "Qualcomm USB HS PHY module"
 	depends on USB_ULPI_BUS
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 3ee118f4dfc7..7dcba9537b69 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_PHY_QCOM_QMP)		+= \
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
+obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
new file mode 100644
index 000000000000..f7f822f2973f
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+
+/* eUSB2 status registers */
+#define EUSB2_RPTR_STATUS		0x08
+#define	RPTR_OK				BIT(7)
+
+/* eUSB2 control registers */
+#define EUSB2_EN_CTL1			0x46
+#define EUSB2_RPTR_EN			BIT(7)
+
+#define PHY_HOST_MODE			BIT(0)
+#define EUSB2_FORCE_EN_5		0xE8
+#define F_CLK_19P2M_EN			BIT(6)
+#define F_CLK_19P2M_EN_SHIFT		6
+
+#define EUSB2_FORCE_VAL_5		0xED
+#define V_CLK_19P2M_EN			BIT(6)
+#define V_CLK_19P2M_EN_SHIFT		6
+
+#define EUSB2_TUNE_IUSB2		0x51
+#define EUSB2_TUNE_SQUELCH_U		0x54
+#define EUSB2_TUNE_USB2_PREEM		0x57
+
+#define QCOM_EUSB2_REPEATER_INIT_CFG(o, v)	\
+	{					\
+		.offset = o,			\
+		.val = v,			\
+	}
+
+enum repeater_mode {
+	REPEATER_HOST_MODE,
+	REPEATER_PERIPH_MODE,
+};
+
+struct eusb2_repeater_init_tbl {
+	unsigned int offset;
+	unsigned int val;
+};
+
+struct eusb2_repeater_cfg {
+	const struct eusb2_repeater_init_tbl *init_tbl;
+	int init_tbl_num;
+	/* regulators to be requested */
+	const char * const *vreg_list;
+	int num_vregs;
+};
+
+struct eusb2_repeater {
+	struct device *dev;
+	struct regmap *regmap;
+	struct phy *phy;
+	struct regulator_bulk_data *vregs;
+	const struct eusb2_repeater_cfg *cfg;
+	u16 base;
+	enum phy_mode mode;
+};
+
+static const char * const pm8550b_vreg_l[] = {
+	"vdd18", "vdd3",
+};
+
+static const struct eusb2_repeater_init_tbl pm8550b_init_tbl[] = {
+	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_IUSB2, 0x8),
+	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_SQUELCH_U, 0x3),
+	QCOM_EUSB2_REPEATER_INIT_CFG(EUSB2_TUNE_USB2_PREEM, 0x5),
+};
+
+static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
+	.init_tbl	= pm8550b_init_tbl,
+	.init_tbl_num	= ARRAY_SIZE(pm8550b_init_tbl),
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
+static int eusb2_repeater_init_vregs(struct eusb2_repeater *rptr)
+{
+	int num = rptr->cfg->num_vregs;
+	struct device *dev = rptr->dev;
+	int i;
+
+	rptr->vregs = devm_kcalloc(dev, num, sizeof(*rptr->vregs), GFP_KERNEL);
+	if (!rptr->vregs)
+		return -ENOMEM;
+
+	for (i = 0; i < num; i++)
+		rptr->vregs[i].supply = rptr->cfg->vreg_list[i];
+
+	return devm_regulator_bulk_get(dev, num, rptr->vregs);
+}
+
+static int eusb2_repeater_init(struct phy *phy)
+{
+	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+	const struct eusb2_repeater_init_tbl *init_tbl = rptr->cfg->init_tbl;
+	int num = rptr->cfg->init_tbl_num;
+	int ret = 0;
+	u32 val;
+	int i;
+
+	ret = regulator_bulk_enable(rptr->cfg->num_vregs, rptr->vregs);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(rptr->regmap, rptr->base + EUSB2_EN_CTL1,
+				EUSB2_RPTR_EN, EUSB2_RPTR_EN);
+
+	for (i = 0; i < num; i++)
+		regmap_update_bits(rptr->regmap,
+					rptr->base + init_tbl[i].offset,
+					init_tbl[i].val, init_tbl[i].val);
+
+	ret = regmap_read_poll_timeout(rptr->regmap,
+					rptr->base + EUSB2_RPTR_STATUS, val,
+					val & RPTR_OK, 10, 5);
+	if (ret)
+		dev_err(rptr->dev, "initialization timed-out\n");
+
+	return ret;
+}
+
+static int eusb2_repeater_set_mode(struct phy *phy,
+					enum phy_mode mode, int submode)
+{
+	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+		/*
+		 * CM.Lx is prohibited when repeater is already into Lx state as
+		 * per eUSB 1.2 Spec. Below implement software workaround until
+		 * PHY and controller is fixing seen observation.
+		 */
+		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_EN_5,
+				F_CLK_19P2M_EN, F_CLK_19P2M_EN);
+		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_VAL_5,
+				V_CLK_19P2M_EN, V_CLK_19P2M_EN);
+		break;
+	case PHY_MODE_USB_DEVICE:
+		/*
+		 * In device mode clear host mode related workaround as there
+		 * is no repeater reset available, and enable/disable of
+		 * repeater doesn't clear previous value due to shared
+		 * regulators (say host <-> device mode switch).
+		 */
+		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_EN_5,
+				F_CLK_19P2M_EN, 0);
+		regmap_update_bits(rptr->regmap, rptr->base + EUSB2_FORCE_VAL_5,
+				V_CLK_19P2M_EN, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int eusb2_repeater_exit(struct phy *phy)
+{
+	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
+
+	return regulator_bulk_disable(rptr->cfg->num_vregs, rptr->vregs);
+}
+
+
+static const struct phy_ops eusb2_repeater_ops = {
+	.init		= eusb2_repeater_init,
+	.exit		= eusb2_repeater_exit,
+	.set_mode	= eusb2_repeater_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int eusb2_repeater_probe(struct platform_device *pdev)
+{
+	struct eusb2_repeater *rptr;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct device_node *np;
+	u32 res;
+	int ret;
+
+	np = of_node_get(dev->of_node);
+
+	rptr = devm_kzalloc(dev, sizeof(*rptr), GFP_KERNEL);
+	if (!rptr)
+		goto err_node_put;
+
+	rptr->dev = dev;
+	dev_set_drvdata(dev, rptr);
+
+	rptr->cfg = of_device_get_match_data(dev);
+	if (!rptr->cfg)
+		goto err_node_put;
+
+	rptr->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!rptr->regmap)
+		goto err_node_put;
+
+	ret = of_property_read_u32(np, "reg", &res);
+	if (ret < 0)
+		goto err_node_put;
+
+	rptr->base = res;
+
+	ret = eusb2_repeater_init_vregs(rptr);
+	if (ret < 0) {
+		dev_err(dev, "unable to get supplies\n");
+		goto err_node_put;
+	}
+
+	rptr->phy = devm_phy_create(dev, np, &eusb2_repeater_ops);
+	if (IS_ERR(rptr->phy)) {
+		ret = PTR_ERR(rptr->phy);
+		dev_err(dev, "failed to create PHY: %d\n", ret);
+		goto err_node_put;
+	}
+
+	phy_set_drvdata(rptr->phy, rptr);
+
+	of_node_put(np);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	dev_info(dev, "Registered Qcom-eUSB2 repeater\n");
+
+	return 0;
+
+err_node_put:
+	of_node_put(np);
+	return ret;
+}
+
+static int eusb2_repeater_remove(struct platform_device *pdev)
+{
+	struct eusb2_repeater *rptr = platform_get_drvdata(pdev);
+
+	if (!rptr)
+		return 0;
+
+	eusb2_repeater_exit(rptr->phy);
+	return 0;
+}
+
+
+static const struct of_device_id eusb2_repeater_of_match_table[] = {
+	{
+		.compatible = "qcom,pm8550b-eusb2-repeater",
+		.data = &pm8550b_eusb2_cfg,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, eusb2_repeater_of_match_table);
+
+static struct platform_driver eusb2_repeater_driver = {
+	.probe		= eusb2_repeater_probe,
+	.remove		= eusb2_repeater_remove,
+	.driver = {
+		.name	= "qcom-eusb2-repeater",
+		.of_match_table = eusb2_repeater_of_match_table,
+	},
+};
+
+module_platform_driver(eusb2_repeater_driver);
+
+MODULE_DESCRIPTION("Qualcomm PMIC eUSB2 Repeater driver");
+MODULE_LICENSE("GPL v2");
-- 
2.34.1

