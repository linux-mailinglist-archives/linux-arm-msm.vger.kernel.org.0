Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C6A241D64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgHKPmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:47664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729041AbgHKPmJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5931A22E02;
        Tue, 11 Aug 2020 15:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160524;
        bh=2dtYAFvIXzlE8IJbj/8Y9D+YfRwjSvBfDUirFQOrAzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kxbg52TX4tPINiN9Na3z9UOc2DmuBBhdPU67m9e900Nhem8yuzXQcMwfYqPANnxta
         lu4egku0dn8CEvQb3b1HmSnc2xnvwDmuamn5fmsH025f9/zErkxE++bXf1MXXICULq
         zjjhTZrzCi+HpxEICz87ZnMvbrhasP0XMBfGpRww=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPa-004bnj-BS; Tue, 11 Aug 2020 17:42:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 30/33] mfd, spmi, regulator: fix some coding style issues at HiSilicon SPMI PMIC
Date:   Tue, 11 Aug 2020 17:41:56 +0200
Message-Id: <cb87f9f562f48db3a97fe122941adbde6a742023.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Checkpatch complains about some minor issues inside the
new mft/regulator/spmi drivers for HiSilicon 6421v600.

Address them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/mfd/hi6421-spmi-pmic.c           |  4 ++--
 drivers/regulator/hi6421v600-regulator.c | 28 ++++++++++++------------
 drivers/spmi/spmi.c                      |  5 ++++-
 include/linux/mfd/hi6421-spmi-pmic.h     |  3 ++-
 4 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/hi6421-spmi-pmic.c b/drivers/mfd/hi6421-spmi-pmic.c
index 09cedfa1e4bb..d8b84d64041e 100644
--- a/drivers/mfd/hi6421-spmi-pmic.c
+++ b/drivers/mfd/hi6421-spmi-pmic.c
@@ -189,7 +189,7 @@ static struct irq_chip hi6421_spmi_pmu_irqchip = {
 };
 
 static int hi6421_spmi_irq_map(struct irq_domain *d, unsigned int virq,
-			irq_hw_number_t hw)
+			       irq_hw_number_t hw)
 {
 	struct hi6421_spmi_pmic *pmic = d->host_data;
 
@@ -350,7 +350,7 @@ static int hi6421_spmi_pmic_probe(struct spmi_device *pdev)
 	 * The logic below will rely that the pmic is already stored at
 	 * drvdata.
 	 */
-	dev_dbg(&pdev->dev, "SPMI-PMIC: adding childs for %pOF\n",
+	dev_dbg(&pdev->dev, "SPMI-PMIC: adding children for %pOF\n",
 		pdev->dev.of_node);
 	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
 				   hi6421v600_devs, ARRAY_SIZE(hi6421v600_devs),
diff --git a/drivers/regulator/hi6421v600-regulator.c b/drivers/regulator/hi6421v600-regulator.c
index 72f51594b5ff..c80dfac1e4c3 100644
--- a/drivers/regulator/hi6421v600-regulator.c
+++ b/drivers/regulator/hi6421v600-regulator.c
@@ -40,7 +40,7 @@
 #include <linux/spmi.h>
 
 #define rdev_dbg(rdev, fmt, arg...)	\
-		 pr_debug("%s: %s: " fmt, rdev->desc->name, __func__, ##arg)
+		 pr_debug("%s: %s: " fmt, (rdev)->desc->name, __func__, ##arg)
 
 struct hi6421v600_regulator {
 	struct regulator_desc rdesc;
@@ -105,7 +105,7 @@ static int hi6421_spmi_regulator_disable(struct regulator_dev *rdev)
 		 rdev->desc->enable_reg, rdev->desc->enable_mask);
 
 	hi6421_spmi_pmic_rmw(pmic, rdev->desc->enable_reg,
-		      rdev->desc->enable_mask, 0);
+			     rdev->desc->enable_mask, 0);
 
 	return 0;
 }
@@ -122,7 +122,7 @@ static int hi6421_spmi_regulator_get_voltage_sel(struct regulator_dev *rdev)
 	selector = (reg_val & rdev->desc->vsel_mask) >>	(ffs(rdev->desc->vsel_mask) - 1);
 
 	rdev_dbg(rdev,
-		"vsel_reg=0x%x, value=0x%x, entry=0x%x, voltage=%d mV\n",
+		 "vsel_reg=0x%x, value=0x%x, entry=0x%x, voltage=%d mV\n",
 		 rdev->desc->vsel_reg, reg_val, selector,
 		rdev->desc->ops->list_voltage(rdev, selector) / 1000);
 
@@ -144,7 +144,7 @@ static int hi6421_spmi_regulator_set_voltage_sel(struct regulator_dev *rdev,
 
 	/* set voltage selector */
 	rdev_dbg(rdev,
-		"vsel_reg=0x%x, mask=0x%x, value=0x%x, voltage=%d mV\n",
+		 "vsel_reg=0x%x, mask=0x%x, value=0x%x, voltage=%d mV\n",
 		 rdev->desc->vsel_reg, rdev->desc->vsel_mask, reg_val,
 		 rdev->desc->ops->list_voltage(rdev, selector) / 1000);
 
@@ -169,7 +169,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 		mode = REGULATOR_MODE_NORMAL;
 
 	rdev_dbg(rdev,
-		"enable_reg=0x%x, eco_mode_mask=0x%x, reg_val=0x%x, %s mode\n",
+		 "enable_reg=0x%x, eco_mode_mask=0x%x, reg_val=0x%x, %s mode\n",
 		 rdev->desc->enable_reg, sreg->eco_mode_mask, reg_val,
 		 mode == REGULATOR_MODE_IDLE ? "idle" : "normal");
 
@@ -177,7 +177,7 @@ static unsigned int hi6421_spmi_regulator_get_mode(struct regulator_dev *rdev)
 }
 
 static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
-				   unsigned int mode)
+					  unsigned int mode)
 {
 	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
 	struct hi6421_spmi_pmic *pmic = sreg->pmic;
@@ -204,9 +204,10 @@ static int hi6421_spmi_regulator_set_mode(struct regulator_dev *rdev,
 	return 0;
 }
 
-static unsigned int hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
-						    int input_uV, int output_uV,
-						    int load_uA)
+static unsigned int
+hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev *rdev,
+				       int input_uV, int output_uV,
+				       int load_uA)
 {
 	struct hi6421v600_regulator *sreg = rdev_get_drvdata(rdev);
 
@@ -220,7 +221,7 @@ static unsigned int hi6421_spmi_regulator_get_optimum_mode(struct regulator_dev
 }
 
 static int hi6421_spmi_dt_parse(struct platform_device *pdev,
-			 struct hi6421v600_regulator *sreg,
+				struct hi6421v600_regulator *sreg,
 			 struct regulator_desc *rdesc)
 {
 	struct device *dev = &pdev->dev;
@@ -256,7 +257,7 @@ static int hi6421_spmi_dt_parse(struct platform_device *pdev,
 		sreg->eco_uA = 0;
 	} else {
 		ret = of_property_read_u32(np, "eco-microamp",
-					&sreg->eco_uA);
+					   &sreg->eco_uA);
 		if (ret) {
 			dev_err(dev, "missing eco-microamp property\n");
 			return ret;
@@ -331,8 +332,8 @@ static struct regulator_ops hi6421_spmi_ldo_rops = {
  */
 
 static int hi6421_spmi_regulator_probe_ldo(struct platform_device *pdev,
-				    struct device_node *np,
-				    struct hi6421_spmi_pmic *pmic)
+					   struct device_node *np,
+					   struct hi6421_spmi_pmic *pmic)
 {
 	struct device *dev = &pdev->dev;
 	struct regulator_desc *rdesc;
@@ -404,7 +405,6 @@ static int hi6421_spmi_regulator_probe_ldo(struct platform_device *pdev,
 	return ret;
 }
 
-
 static int hi6421_spmi_regulator_probe(struct platform_device *pdev)
 {
 	struct device *pmic_dev = pdev->dev.parent;
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index fd3ff6079b15..253340e10dab 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -23,6 +23,7 @@ static DEFINE_IDA(ctrl_ida);
 static void spmi_dev_release(struct device *dev)
 {
 	struct spmi_device *sdev = to_spmi_device(dev);
+
 	kfree(sdev);
 }
 
@@ -33,6 +34,7 @@ static const struct device_type spmi_dev_type = {
 static void spmi_ctrl_release(struct device *dev)
 {
 	struct spmi_controller *ctrl = to_spmi_controller(dev);
+
 	ida_simple_remove(&ctrl_ida, ctrl->nr);
 	kfree(ctrl);
 }
@@ -487,7 +489,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 			continue;
 
 		sdev->dev.of_node = node;
-		sdev->usid = (u8) reg[0];
+		sdev->usid = (u8)reg[0];
 
 		err = spmi_device_add(sdev);
 		if (err) {
@@ -531,6 +533,7 @@ EXPORT_SYMBOL_GPL(spmi_controller_add);
 static int spmi_ctrl_remove_device(struct device *dev, void *data)
 {
 	struct spmi_device *spmidev = to_spmi_device(dev);
+
 	if (dev->type == &spmi_dev_type)
 		spmi_device_remove(spmidev);
 	return 0;
diff --git a/include/linux/mfd/hi6421-spmi-pmic.h b/include/linux/mfd/hi6421-spmi-pmic.h
index d12ad7484018..aeff96c4a37e 100644
--- a/include/linux/mfd/hi6421-spmi-pmic.h
+++ b/include/linux/mfd/hi6421-spmi-pmic.h
@@ -38,7 +38,8 @@ struct hi6421_spmi_pmic {
 	unsigned int				*irqs;
 	int					irqnum;
 	int					irqarray;
-	struct hi6421_spmi_irq_mask_info 	irq_mask_addr;
+
+	struct hi6421_spmi_irq_mask_info	irq_mask_addr;
 	struct hi6421_spmi_irq_info		irq_addr;
 };
 
-- 
2.26.2

