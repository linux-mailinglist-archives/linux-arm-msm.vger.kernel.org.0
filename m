Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C90C33690D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbhCKAk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:40:26 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:27978 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229584AbhCKAj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:39:58 -0500
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 10 Mar 2021 16:39:56 -0800
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id E82DD18EE; Wed, 10 Mar 2021 16:39:56 -0800 (PST)
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
Subject: [RFC PATCH v3 2/3] regmap-irq: Add support for POLARITY_HI and POLARITY_LO config regs
Date:   Wed, 10 Mar 2021 16:39:53 -0800
Message-Id: <4b77a308ccdabbe96ed68623bd6eead9510e1fc9.1615423027.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If an interrupt is already configured as either edge- or
level-triggered, setting the corresponding bit for it in the POLARITY_HI
register further configures it as rising-edge or level-high triggered
(as the case may be), while setting the same bit in POLARITY_LO further
configures it as falling-edge or level-low triggered.

Therefore, in QCOM's case, the type_*_val are all to be configured as
BIT() masks.

These two new configuration registers are QCOM-specific and hence, the
code is not generic in its current form. I'm looking for feedback on how
this may be made generic.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 67 ++++++++++++++++++++++++++++++++++++++++
 include/linux/regmap.h           |  4 +++
 2 files changed, 71 insertions(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index e1d8fc9e..cb13855 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -38,6 +38,8 @@ struct regmap_irq_chip_data {
 	unsigned int *wake_buf;
 	unsigned int *type_buf;
 	unsigned int *type_buf_def;
+	unsigned int *polarity_hi_buf;
+	unsigned int *polarity_lo_buf;
 
 	unsigned int irq_reg_stride;
 	unsigned int type_reg_stride;
@@ -215,6 +217,22 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			if (ret != 0)
 				dev_err(d->map->dev, "Failed to sync type in %x\n",
 					reg);
+
+			if (!d->chip->polarity_hi_base ||
+			    !d->chip->polarity_lo_base)
+				continue;
+
+			reg = sub_irq_reg(d, d->chip->polarity_hi_base, i);
+			ret = regmap_write(map, reg, d->polarity_hi_buf[i]);
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync polarity hi in %x\n",
+					reg);
+
+			reg = sub_irq_reg(d, d->chip->polarity_lo_base, i);
+			ret = regmap_write(map, reg, d->polarity_lo_buf[i]);
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync polarity lo in %x\n",
+					reg);
 		}
 	}
 
@@ -318,6 +336,41 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	default:
 		return -EINVAL;
 	}
+
+
+	if (d->chip->polarity_hi_base && d->chip->polarity_lo_base) {
+		switch (type) {
+		case IRQ_TYPE_EDGE_FALLING:
+			d->polarity_hi_buf[reg] &= ~t->type_falling_val;
+			d->polarity_lo_buf[reg] |= t->type_falling_val;
+			break;
+
+		case IRQ_TYPE_EDGE_RISING:
+			d->polarity_hi_buf[reg] |= t->type_rising_val;
+			d->polarity_lo_buf[reg] &= ~t->type_rising_val;
+			break;
+
+		case IRQ_TYPE_EDGE_BOTH:
+			d->polarity_hi_buf[reg] |= (t->type_falling_val |
+					t->type_rising_val);
+			d->polarity_lo_buf[reg] |= (t->type_falling_val |
+					t->type_rising_val);
+			break;
+
+		case IRQ_TYPE_LEVEL_HIGH:
+			d->polarity_hi_buf[reg] |= t->type_level_high_val;
+			d->polarity_lo_buf[reg] &= ~t->type_level_high_val;
+			break;
+
+		case IRQ_TYPE_LEVEL_LOW:
+			d->polarity_hi_buf[reg] &= ~t->type_level_low_val;
+			d->polarity_lo_buf[reg] |= t->type_level_low_val;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
@@ -691,6 +744,16 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			goto err_alloc;
 	}
 
+	d->polarity_hi_buf = kcalloc(chip->num_regs, sizeof(unsigned int),
+				     GFP_KERNEL);
+	if (!d->polarity_hi_buf)
+		goto err_alloc;
+
+	d->polarity_lo_buf = kcalloc(chip->num_regs, sizeof(unsigned int),
+				     GFP_KERNEL);
+	if (!d->polarity_lo_buf)
+		goto err_alloc;
+
 	d->irq_chip = regmap_irq_chip;
 	d->irq_chip.name = chip->name;
 	d->irq = irq;
@@ -857,6 +920,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	/* Should really dispose of the domain but... */
 err_alloc:
 	kfree(d->type_buf);
+	kfree(d->polarity_hi_buf);
+	kfree(d->polarity_lo_buf);
 	kfree(d->type_buf_def);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
@@ -927,6 +992,8 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 
 	irq_domain_remove(d->domain);
 	kfree(d->type_buf);
+	kfree(d->polarity_hi_buf);
+	kfree(d->polarity_lo_buf);
 	kfree(d->type_buf_def);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 18910bd..0f1329d 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1393,6 +1393,8 @@ struct regmap_irq_sub_irq_map {
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
  * @type_base:   Base address for irq type.  If zero unsupported.
+ * @polarity_hi_base: Base address for specifying edge- or level-high triggered
+ * @polarity_lo_base: Base address for specifying edge- or level-low triggered
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
  * @mask_invert: Inverted mask register: cleared bits are masked out.
@@ -1444,6 +1446,8 @@ struct regmap_irq_chip {
 	unsigned int ack_base;
 	unsigned int wake_base;
 	unsigned int type_base;
+	unsigned int polarity_hi_base;
+	unsigned int polarity_lo_base;
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
 	bool init_ack_masked:1;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

