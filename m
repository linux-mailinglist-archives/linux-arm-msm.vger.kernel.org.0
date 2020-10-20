Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6271629452B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 00:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439102AbgJTWd4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 18:33:56 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:55334 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2439095AbgJTWdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 18:33:55 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 20 Oct 2020 15:33:55 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 20 Oct 2020 15:33:53 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id A00FA176C; Tue, 20 Oct 2020 15:33:53 -0700 (PDT)
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
Subject: [RFC PATCH RESEND v1 1/3] regmap-irq: Add support for peripheral offsets
Date:   Tue, 20 Oct 2020 15:33:41 -0700
Message-Id: <40581a58bd16442f03db1abea014ca1eedc94d3c.1603232320.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1603232320.git.gurus@codeaurora.org>
References: <cover.1603232320.git.gurus@codeaurora.org>
In-Reply-To: <cover.1603232320.git.gurus@codeaurora.org>
References: <cover.1603232320.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some MFD chips do not have the register space for their peripherals
mapped out with a fixed stride. Add peripheral address offsets to the
framework to support such address spaces.

In this new scheme, the regmap-irq client registering with the framework
shall have to define the *_base registers (e.g. status_base, mask_base,
type_base, etc.) as those of the very first peripheral in the chip, and
then specify address offsets of each subsequent peripheral so that their
corresponding *_base registers may be calculated by the framework. The
first element of the periph_offs array must be zero so that the first
peripherals' addresses may be accessed.

Some MFD chips define two registers in addition to the IRQ type
registers: POLARITY_HI and POLARITY_LO, so add support to manage their
data as well as write to them.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 191 ++++++++++++++++++++++++++++++++-------
 include/linux/regmap.h           |   6 ++
 2 files changed, 163 insertions(+), 34 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index ad5c2de..dbf2c86 100644
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
@@ -87,8 +89,13 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 	if (d->clear_status) {
 		for (i = 0; i < d->chip->num_regs; i++) {
-			reg = d->chip->status_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			if (d->chip->periph_offs)
+				reg = d->chip->status_base +
+					d->chip->periph_offs[i];
+			else
+				reg = d->chip->status_base +
+					(i * map->reg_stride *
+					 d->irq_reg_stride);
 
 			ret = regmap_read(map, reg, &val);
 			if (ret)
@@ -108,8 +115,13 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		if (!d->chip->mask_base)
 			continue;
 
-		reg = d->chip->mask_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		if (d->chip->periph_offs)
+			reg = d->chip->mask_base +
+				d->chip->periph_offs[i];
+		else
+			reg = d->chip->mask_base +
+				(i * map->reg_stride * d->irq_reg_stride);
+
 		if (d->chip->mask_invert) {
 			ret = regmap_irq_update_bits(d, reg,
 					 d->mask_buf_def[i], ~d->mask_buf[i]);
@@ -136,8 +148,13 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			dev_err(d->map->dev, "Failed to sync masks in %x\n",
 				reg);
 
-		reg = d->chip->wake_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		if (d->chip->periph_offs)
+			reg = d->chip->wake_base +
+				d->chip->periph_offs[i];
+		else
+			reg = d->chip->wake_base +
+				(i * map->reg_stride * d->irq_reg_stride);
+
 		if (d->wake_buf) {
 			if (d->chip->wake_invert)
 				ret = regmap_irq_update_bits(d, reg,
@@ -161,8 +178,14 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		 * it'll be ignored in irq handler, then may introduce irq storm
 		 */
 		if (d->mask_buf[i] && (d->chip->ack_base || d->chip->use_ack)) {
-			reg = d->chip->ack_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			if (d->chip->periph_offs)
+				reg = d->chip->ack_base +
+					d->chip->periph_offs[i];
+			else
+				reg = d->chip->ack_base +
+					(i * map->reg_stride *
+					 d->irq_reg_stride);
+
 			/* some chips ack by write 0 */
 			if (d->chip->ack_invert)
 				ret = regmap_write(map, reg, ~d->mask_buf[i]);
@@ -187,8 +210,14 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		for (i = 0; i < d->chip->num_type_reg; i++) {
 			if (!d->type_buf_def[i])
 				continue;
-			reg = d->chip->type_base +
-				(i * map->reg_stride * d->type_reg_stride);
+			if (d->chip->periph_offs)
+				reg = d->chip->type_base +
+					d->chip->periph_offs[i];
+			else
+				reg = d->chip->type_base +
+					(i * map->reg_stride *
+					 d->type_reg_stride);
+
 			if (d->chip->type_invert)
 				ret = regmap_irq_update_bits(d, reg,
 					d->type_buf_def[i], ~d->type_buf[i]);
@@ -198,6 +227,25 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			if (ret != 0)
 				dev_err(d->map->dev, "Failed to sync type in %x\n",
 					reg);
+
+			if (!d->chip->periph_offs ||
+			    !d->chip->polarity_hi_base ||
+			    !d->chip->polarity_lo_base)
+				continue;
+
+			reg = d->chip->polarity_hi_base +
+				d->chip->periph_offs[i];
+			ret = regmap_write(map, reg, d->polarity_hi_buf[i]);
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync polarity hi in %x\n",
+					reg);
+
+			reg = d->chip->polarity_lo_base +
+				d->chip->periph_offs[i];
+			ret = regmap_write(map, reg, d->polarity_lo_buf[i]);
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync polarity lo in %x\n",
+					reg);
 		}
 	}
 
@@ -280,23 +328,49 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	switch (type) {
 	case IRQ_TYPE_EDGE_FALLING:
 		d->type_buf[reg] |= t->type_falling_val;
+		if (d->chip->periph_offs) {
+			d->polarity_hi_buf[reg] &= ~t->type_falling_val;
+			d->polarity_lo_buf[reg] |= t->type_falling_val;
+		}
 		break;
 
 	case IRQ_TYPE_EDGE_RISING:
 		d->type_buf[reg] |= t->type_rising_val;
+		if (d->chip->periph_offs) {
+			d->polarity_hi_buf[reg] |= t->type_rising_val;
+			d->polarity_lo_buf[reg] &= ~t->type_rising_val;
+		}
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
 		d->type_buf[reg] |= (t->type_falling_val |
 					t->type_rising_val);
+		if (d->chip->periph_offs) {
+			d->polarity_hi_buf[reg] |= (t->type_falling_val |
+					t->type_rising_val);
+			d->polarity_lo_buf[reg] |= (t->type_falling_val |
+					t->type_rising_val);
+		}
 		break;
 
 	case IRQ_TYPE_LEVEL_HIGH:
-		d->type_buf[reg] |= t->type_level_high_val;
+		if (!d->chip->periph_offs) {
+			d->type_buf[reg] |= t->type_level_high_val;
+		} else {
+			d->type_buf[reg] &= ~t->type_level_high_val;
+			d->polarity_hi_buf[reg] |= t->type_level_high_val;
+			d->polarity_lo_buf[reg] &= ~t->type_level_high_val;
+		}
 		break;
 
 	case IRQ_TYPE_LEVEL_LOW:
-		d->type_buf[reg] |= t->type_level_low_val;
+		if (!d->chip->periph_offs) {
+			d->type_buf[reg] |= t->type_level_low_val;
+		} else {
+			d->type_buf[reg] &= ~t->type_level_low_val;
+			d->polarity_hi_buf[reg] &= ~t->type_level_low_val;
+			d->polarity_lo_buf[reg] |= t->type_level_low_val;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -342,12 +416,10 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 	struct regmap_irq_sub_irq_map *subreg;
 	int i, ret = 0;
 
-	if (!chip->sub_reg_offsets) {
-		/* Assume linear mapping */
-		ret = regmap_read(map, chip->status_base +
-				  (b * map->reg_stride * data->irq_reg_stride),
-				   &data->status_buf[b]);
-	} else {
+	if (chip->periph_offs) {
+		ret = regmap_read(map, chip->status_base + chip->periph_offs[b],
+				&data->status_buf[b]);
+	} else if (chip->sub_reg_offsets) {
 		subreg = &chip->sub_reg_offsets[b];
 		for (i = 0; i < subreg->num_regs; i++) {
 			unsigned int offset = subreg->offset[i];
@@ -357,6 +429,11 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 			if (ret)
 				break;
 		}
+	} else {
+		/* Assume linear mapping */
+		ret = regmap_read(map, chip->status_base +
+				  (b * map->reg_stride * data->irq_reg_stride),
+				   &data->status_buf[b]);
 	}
 	return ret;
 }
@@ -474,10 +551,14 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 
 	} else {
 		for (i = 0; i < data->chip->num_regs; i++) {
-			ret = regmap_read(map, chip->status_base +
-					  (i * map->reg_stride
-					   * data->irq_reg_stride),
-					  &data->status_buf[i]);
+			if (chip->periph_offs)
+				reg = chip->status_base + chip->periph_offs[i];
+			else
+				reg = chip->status_base +
+					(i * map->reg_stride *
+					 data->irq_reg_stride);
+
+			ret = regmap_read(map, reg, &data->status_buf[i]);
 
 			if (ret != 0) {
 				dev_err(map->dev,
@@ -499,8 +580,13 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 		data->status_buf[i] &= ~data->mask_buf[i];
 
 		if (data->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = chip->ack_base +
-				(i * map->reg_stride * data->irq_reg_stride);
+			if (chip->periph_offs)
+				reg = chip->ack_base + chip->periph_offs[i];
+			else
+				reg = chip->ack_base +
+					(i * map->reg_stride *
+					 data->irq_reg_stride);
+
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
 						~data->status_buf[i]);
@@ -662,6 +748,18 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			goto err_alloc;
 	}
 
+	if (chip->periph_offs) {
+		d->polarity_hi_buf = kcalloc(chip->num_regs,
+					     sizeof(unsigned int), GFP_KERNEL);
+		if (!d->polarity_hi_buf)
+			goto err_alloc;
+
+		d->polarity_lo_buf = kcalloc(chip->num_regs,
+					     sizeof(unsigned int), GFP_KERNEL);
+		if (!d->polarity_lo_buf)
+			goto err_alloc;
+	}
+
 	d->irq_chip = regmap_irq_chip;
 	d->irq_chip.name = chip->name;
 	d->irq = irq;
@@ -700,8 +798,12 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		if (!chip->mask_base)
 			continue;
 
-		reg = chip->mask_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		if (chip->periph_offs)
+			reg = chip->mask_base + chip->periph_offs[i];
+		else
+			reg = chip->mask_base +
+				(i * map->reg_stride * d->irq_reg_stride);
+
 		if (chip->mask_invert)
 			ret = regmap_irq_update_bits(d, reg,
 					 d->mask_buf[i], ~d->mask_buf[i]);
@@ -725,8 +827,12 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			continue;
 
 		/* Ack masked but set interrupts */
-		reg = chip->status_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		if (chip->periph_offs)
+			reg = chip->status_base + chip->periph_offs[i];
+		else
+			reg = chip->status_base +
+				(i * map->reg_stride * d->irq_reg_stride);
+
 		ret = regmap_read(map, reg, &d->status_buf[i]);
 		if (ret != 0) {
 			dev_err(map->dev, "Failed to read IRQ status: %d\n",
@@ -735,8 +841,13 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		}
 
 		if (d->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = chip->ack_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			if (chip->periph_offs)
+				reg = chip->ack_base + chip->periph_offs[i];
+			else
+				reg = chip->ack_base +
+					(i * map->reg_stride *
+					 d->irq_reg_stride);
+
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
 					~(d->status_buf[i] & d->mask_buf[i]));
@@ -765,8 +876,12 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	if (d->wake_buf) {
 		for (i = 0; i < chip->num_regs; i++) {
 			d->wake_buf[i] = d->mask_buf_def[i];
-			reg = chip->wake_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			if (chip->periph_offs)
+				reg = chip->wake_base + chip->periph_offs[i];
+			else
+				reg = chip->wake_base +
+					(i * map->reg_stride *
+					 d->irq_reg_stride);
 
 			if (chip->wake_invert)
 				ret = regmap_irq_update_bits(d, reg,
@@ -786,8 +901,12 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 
 	if (chip->num_type_reg && !chip->type_in_mask) {
 		for (i = 0; i < chip->num_type_reg; ++i) {
-			reg = chip->type_base +
-				(i * map->reg_stride * d->type_reg_stride);
+			if (chip->periph_offs)
+				reg = chip->type_base + chip->periph_offs[i];
+			else
+				reg = chip->type_base +
+					(i * map->reg_stride *
+					 d->type_reg_stride);
 
 			ret = regmap_read(map, reg, &d->type_buf_def[i]);
 
@@ -833,6 +952,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	/* Should really dispose of the domain but... */
 err_alloc:
 	kfree(d->type_buf);
+	kfree(d->polarity_hi_buf);
+	kfree(d->polarity_lo_buf);
 	kfree(d->type_buf_def);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
@@ -903,6 +1024,8 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 
 	irq_domain_remove(d->domain);
 	kfree(d->type_buf);
+	kfree(d->polarity_hi_buf);
+	kfree(d->polarity_lo_buf);
 	kfree(d->type_buf_def);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index e7834d9..6fb1090 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1338,6 +1338,7 @@ struct regmap_irq_sub_irq_map {
  *		     status_base. Should contain num_regs arrays.
  *		     Can be provided for chips with more complex mapping than
  *		     1.st bit to 1.st sub-reg, 2.nd bit to 2.nd sub-reg, ...
+ * @periph_offs:    Array of addresses of peripherals, should be num_reg long.
  * @num_main_regs: Number of 'main status' irq registers for chips which have
  *		   main_status set.
  *
@@ -1350,6 +1351,8 @@ struct regmap_irq_sub_irq_map {
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
  * @type_base:   Base address for irq type.  If zero unsupported.
+ * @polarity_hi_base:   Base address for polarity high when periph_offs is used.
+ * @polarity_lo_base:   Base address for polarity low when periph_offs is used.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
  * @mask_invert: Inverted mask register: cleared bits are masked out.
@@ -1390,6 +1393,7 @@ struct regmap_irq_chip {
 	unsigned int main_status;
 	unsigned int num_main_status_bits;
 	struct regmap_irq_sub_irq_map *sub_reg_offsets;
+	unsigned int *periph_offs;
 	int num_main_regs;
 
 	unsigned int status_base;
@@ -1398,6 +1402,8 @@ struct regmap_irq_chip {
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

