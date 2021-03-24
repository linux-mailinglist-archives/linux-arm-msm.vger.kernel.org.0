Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562223481E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 20:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237836AbhCXT3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 15:29:22 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:55796 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237667AbhCXT25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 15:28:57 -0400
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Mar 2021 12:28:56 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg01-sd.qualcomm.com with ESMTP; 24 Mar 2021 12:28:55 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id D2B7E1962; Wed, 24 Mar 2021 12:28:55 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Mark Brown <broonie@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Joe Perches <joe@perches.com>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v5 1/2] regmap-irq: Introduce virtual regs to handle more config regs
Date:   Wed, 24 Mar 2021 12:28:53 -0700
Message-Id: <a1787067004b0e11cb960319082764397469215a.1616613838.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
References: <cover.1616613838.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "virtual" registers support to handle any irq configuration
registers in addition to the ones the framework currently supports
(status, mask, unmask, wake, type and ack). These are non-standard
registers that further configure irq type on some devices, so enable the
framework to add a variable number of them.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 38 +++++++++++++++++++++++++++++++++++++-
 include/linux/regmap.h           |  5 +++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index e1d8fc9e..d1ade76 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -38,6 +38,7 @@ struct regmap_irq_chip_data {
 	unsigned int *wake_buf;
 	unsigned int *type_buf;
 	unsigned int *type_buf_def;
+	unsigned int **virt_buf;
 
 	unsigned int irq_reg_stride;
 	unsigned int type_reg_stride;
@@ -94,7 +95,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 {
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
 	struct regmap *map = d->map;
-	int i, ret;
+	int i, j, ret;
 	u32 reg;
 	u32 unmask_offset;
 	u32 val;
@@ -218,6 +219,20 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		}
 	}
 
+	if (d->chip->num_virt_regs) {
+		for (i = 0; i < d->chip->num_virt_regs; i++) {
+			for (j = 0; j < d->chip->num_regs; j++) {
+				reg = sub_irq_reg(d, d->chip->virt_reg_base[i],
+						  j);
+				ret = regmap_write(map, reg, d->virt_buf[i][j]);
+				if (ret != 0)
+					dev_err(d->map->dev,
+						"Failed to write virt 0x%x: %d\n",
+						reg, ret);
+			}
+		}
+	}
+
 	if (d->chip->runtime_pm)
 		pm_runtime_put(map->dev);
 
@@ -691,6 +706,24 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			goto err_alloc;
 	}
 
+	if (chip->num_virt_regs) {
+		/*
+		 * Create virt_buf[chip->num_extra_config_regs][chip->num_regs]
+		 */
+		d->virt_buf = kcalloc(chip->num_virt_regs, sizeof(*d->virt_buf),
+				      GFP_KERNEL);
+		if (!d->virt_buf)
+			goto err_alloc;
+
+		for (i = 0; i < chip->num_virt_regs; i++) {
+			d->virt_buf[i] = kcalloc(chip->num_regs,
+						 sizeof(unsigned int),
+						 GFP_KERNEL);
+			if (!d->virt_buf[i])
+				goto err_alloc;
+		}
+	}
+
 	d->irq_chip = regmap_irq_chip;
 	d->irq_chip.name = chip->name;
 	d->irq = irq;
@@ -863,6 +896,9 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	kfree(d->mask_buf);
 	kfree(d->status_buf);
 	kfree(d->status_reg_buf);
+	for (i = 0; i < chip->num_virt_regs; i++)
+		kfree(d->virt_buf[i]);
+	kfree(d->virt_buf);
 	kfree(d);
 	return ret;
 }
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 18910bd..97ec733 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1393,6 +1393,7 @@ struct regmap_irq_sub_irq_map {
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
  * @type_base:   Base address for irq type.  If zero unsupported.
+ * @virt_reg_base:   Base addresses for extra config regs.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
  * @mask_invert: Inverted mask register: cleared bits are masked out.
@@ -1417,6 +1418,8 @@ struct regmap_irq_sub_irq_map {
  *               assigned based on the index in the array of the interrupt.
  * @num_irqs:    Number of descriptors.
  * @num_type_reg:    Number of type registers.
+ * @num_virt_regs:   Number of non-standard irq configuration registers.
+ *		     If zero unsupported.
  * @type_reg_stride: Stride to use for chips where type registers are not
  *			contiguous.
  * @handle_pre_irq:  Driver specific callback to handle interrupt from device
@@ -1444,6 +1447,7 @@ struct regmap_irq_chip {
 	unsigned int ack_base;
 	unsigned int wake_base;
 	unsigned int type_base;
+	unsigned int *virt_reg_base;
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
 	bool init_ack_masked:1;
@@ -1464,6 +1468,7 @@ struct regmap_irq_chip {
 	int num_irqs;
 
 	int num_type_reg;
+	int num_virt_regs;
 	unsigned int type_reg_stride;
 
 	int (*handle_pre_irq)(void *irq_drv_data);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

