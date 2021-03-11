Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2920C336909
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhCKAk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:40:27 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:36569 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229578AbhCKAj6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:39:58 -0500
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 10 Mar 2021 16:39:57 -0800
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 0885F19F4; Wed, 10 Mar 2021 16:39:56 -0800 (PST)
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
Subject: [RFC PATCH v3 1/3] regmap-irq: Extend sub-irq to support non-fixed reg strides
Date:   Wed, 10 Mar 2021 16:39:52 -0800
Message-Id: <526562423eaa58b4075362083f561841f1d6956c.1615423027.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
In-Reply-To: <cover.1615423027.git.gurus@codeaurora.org>
References: <cover.1615423027.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm's MFD chips have a top level interrupt status register and
sub-irqs (peripherals).  When a bit in the main status register goes
high, it means that the peripheral corresponding to that bit has an
unserviced interrupt. If the bit is not set, this means that the
corresponding peripheral does not.

Commit a2d21848d9211d ("regmap: regmap-irq: Add main status register
support") introduced the sub-irq logic that is currently applied only
when reading status registers, but not for any other functions like acking
or masking. Extend the use of sub-irq to all other functions, with two
caveats regarding the specification of offsets:

- Each member of the sub_reg_offsets array should be of length 1
- The specified offsets should be the unequal strides for each sub-irq
  device.

In QCOM's case, all the *_base registers are to be configured to the
base addresses of the first sub-irq group, with offsets of each
subsequent group calculated as a difference from these addresses.

Continuing from the example mentioned in the cover letter:

	/*
	 * Address of MISC_INT_MASK		= 0x1011
	 * Address of TEMP_ALARM_INT_MASK	= 0x2011
	 * Address of GPIO01_INT_MASK		= 0x3011
	 *
	 * Calculate offsets as:
	 * offset_0 = 0x1011 - 0x1011 = 0       (to access MISC's
	 * 					 registers)
	 * offset_1 = 0x2011 - 0x1011 = 0x1000
	 * offset_2 = 0x3011 - 0x1011 = 0x2000
	 */

	static unsigned int sub_unit0_offsets[] = {0};
	static unsigned int sub_unit1_offsets[] = {0x1000};
	static unsigned int sub_unit2_offsets[] = {0x2000};

	static struct regmap_irq_sub_irq_map chip_sub_irq_offsets[] = {
		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
		REGMAP_IRQ_MAIN_REG_OFFSET(sub_unit0_offsets),
	};

	static struct regmap_irq_chip chip_irq_chip = {
	--------8<--------
	.not_fixed_stride = true,
	.mask_base	  = MISC_INT_MASK,
	.type_base	  = MISC_INT_TYPE,
	.ack_base	  = MISC_INT_ACK,
	.sub_reg_offsets  = chip_sub_irq_offsets,
	--------8<--------
	};

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 drivers/base/regmap/regmap-irq.c | 81 ++++++++++++++++++++++++++--------------
 include/linux/regmap.h           |  7 ++++
 2 files changed, 60 insertions(+), 28 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 19db764..e1d8fc9e 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -45,6 +45,27 @@ struct regmap_irq_chip_data {
 	bool clear_status:1;
 };
 
+static int sub_irq_reg(struct regmap_irq_chip_data *data,
+		       unsigned int base_reg, int i)
+{
+	const struct regmap_irq_chip *chip = data->chip;
+	struct regmap *map = data->map;
+	struct regmap_irq_sub_irq_map *subreg;
+	unsigned int offset;
+	int reg = 0;
+
+	if (!chip->sub_reg_offsets || !chip->not_fixed_stride) {
+		/* Assume linear mapping */
+		reg = base_reg + (i * map->reg_stride * data->irq_reg_stride);
+	} else {
+		subreg = &chip->sub_reg_offsets[i];
+		offset = subreg->offset[0];
+		reg = base_reg + offset;
+	}
+
+	return reg;
+}
+
 static inline const
 struct regmap_irq *irq_to_regmap_irq(struct regmap_irq_chip_data *data,
 				     int irq)
@@ -87,8 +108,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 	if (d->clear_status) {
 		for (i = 0; i < d->chip->num_regs; i++) {
-			reg = d->chip->status_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			reg = sub_irq_reg(d, d->chip->status_base, i);
 
 			ret = regmap_read(map, reg, &val);
 			if (ret)
@@ -108,8 +128,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		if (!d->chip->mask_base)
 			continue;
 
-		reg = d->chip->mask_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		reg = sub_irq_reg(d, d->chip->mask_base, i);
 		if (d->chip->mask_invert) {
 			ret = regmap_irq_update_bits(d, reg,
 					 d->mask_buf_def[i], ~d->mask_buf[i]);
@@ -136,8 +155,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			dev_err(d->map->dev, "Failed to sync masks in %x\n",
 				reg);
 
-		reg = d->chip->wake_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		reg = sub_irq_reg(d, d->chip->wake_base, i);
 		if (d->wake_buf) {
 			if (d->chip->wake_invert)
 				ret = regmap_irq_update_bits(d, reg,
@@ -161,8 +179,8 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		 * it'll be ignored in irq handler, then may introduce irq storm
 		 */
 		if (d->mask_buf[i] && (d->chip->ack_base || d->chip->use_ack)) {
-			reg = d->chip->ack_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			reg = sub_irq_reg(d, d->chip->ack_base, i);
+
 			/* some chips ack by write 0 */
 			if (d->chip->ack_invert)
 				ret = regmap_write(map, reg, ~d->mask_buf[i]);
@@ -187,8 +205,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		for (i = 0; i < d->chip->num_type_reg; i++) {
 			if (!d->type_buf_def[i])
 				continue;
-			reg = d->chip->type_base +
-				(i * map->reg_stride * d->type_reg_stride);
+			reg = sub_irq_reg(d, d->chip->type_base, i);
 			if (d->chip->type_invert)
 				ret = regmap_irq_update_bits(d, reg,
 					d->type_buf_def[i], ~d->type_buf[i]);
@@ -352,8 +369,15 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 		for (i = 0; i < subreg->num_regs; i++) {
 			unsigned int offset = subreg->offset[i];
 
-			ret = regmap_read(map, chip->status_base + offset,
-					  &data->status_buf[offset]);
+			if (chip->not_fixed_stride)
+				ret = regmap_read(map,
+						chip->status_base + offset,
+						&data->status_buf[b]);
+			else
+				ret = regmap_read(map,
+						chip->status_base + offset,
+						&data->status_buf[offset]);
+
 			if (ret)
 				break;
 		}
@@ -474,10 +498,9 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 
 	} else {
 		for (i = 0; i < data->chip->num_regs; i++) {
-			ret = regmap_read(map, chip->status_base +
-					  (i * map->reg_stride
-					   * data->irq_reg_stride),
-					  &data->status_buf[i]);
+			unsigned int reg = sub_irq_reg(data,
+					data->chip->status_base, i);
+			ret = regmap_read(map, reg, &data->status_buf[i]);
 
 			if (ret != 0) {
 				dev_err(map->dev,
@@ -499,8 +522,8 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 		data->status_buf[i] &= ~data->mask_buf[i];
 
 		if (data->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = chip->ack_base +
-				(i * map->reg_stride * data->irq_reg_stride);
+			reg = sub_irq_reg(data, data->chip->ack_base, i);
+
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
 						~data->status_buf[i]);
@@ -605,6 +628,12 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			return -EINVAL;
 	}
 
+	if (chip->not_fixed_stride) {
+		for (i = 0; i < chip->num_regs; i++)
+			if (chip->sub_reg_offsets[i].num_regs != 1)
+				return -EINVAL;
+	}
+
 	if (irq_base) {
 		irq_base = irq_alloc_descs(irq_base, 0, chip->num_irqs, 0);
 		if (irq_base < 0) {
@@ -700,8 +729,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		if (!chip->mask_base)
 			continue;
 
-		reg = chip->mask_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		reg = sub_irq_reg(d, d->chip->mask_base, i);
+
 		if (chip->mask_invert)
 			ret = regmap_irq_update_bits(d, reg,
 					 d->mask_buf[i], ~d->mask_buf[i]);
@@ -725,8 +754,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			continue;
 
 		/* Ack masked but set interrupts */
-		reg = chip->status_base +
-			(i * map->reg_stride * d->irq_reg_stride);
+		reg = sub_irq_reg(d, d->chip->status_base, i);
 		ret = regmap_read(map, reg, &d->status_buf[i]);
 		if (ret != 0) {
 			dev_err(map->dev, "Failed to read IRQ status: %d\n",
@@ -735,8 +763,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		}
 
 		if (d->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = chip->ack_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			reg = sub_irq_reg(d, d->chip->ack_base, i);
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
 					~(d->status_buf[i] & d->mask_buf[i]));
@@ -765,8 +792,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	if (d->wake_buf) {
 		for (i = 0; i < chip->num_regs; i++) {
 			d->wake_buf[i] = d->mask_buf_def[i];
-			reg = chip->wake_base +
-				(i * map->reg_stride * d->irq_reg_stride);
+			reg = sub_irq_reg(d, d->chip->wake_base, i);
 
 			if (chip->wake_invert)
 				ret = regmap_irq_update_bits(d, reg,
@@ -786,8 +812,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 
 	if (chip->num_type_reg && !chip->type_in_mask) {
 		for (i = 0; i < chip->num_type_reg; ++i) {
-			reg = chip->type_base +
-				(i * map->reg_stride * d->type_reg_stride);
+			reg = sub_irq_reg(d, d->chip->type_base, i);
 
 			ret = regmap_read(map, reg, &d->type_buf_def[i]);
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 2cc4ecd..18910bd 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1378,6 +1378,9 @@ struct regmap_irq_sub_irq_map {
  *		     status_base. Should contain num_regs arrays.
  *		     Can be provided for chips with more complex mapping than
  *		     1.st bit to 1.st sub-reg, 2.nd bit to 2.nd sub-reg, ...
+ *		     When used with not_fixed_stride, each one-element array
+ *		     member contains offset calculated as address from each
+ *		     peripheral to first peripheral.
  * @num_main_regs: Number of 'main status' irq registers for chips which have
  *		   main_status set.
  *
@@ -1404,6 +1407,9 @@ struct regmap_irq_sub_irq_map {
  * @clear_on_unmask: For chips with interrupts cleared on read: read the status
  *                   registers before unmasking interrupts to clear any bits
  *                   set when they were masked.
+ * @not_fixed_stride: Used when chip peripherals are not laid out with fixed
+ * 		      stride. Must be used with sub_reg_offsets containing the
+ * 		      offsets to each peripheral.
  * @runtime_pm:  Hold a runtime PM lock on the device when accessing it.
  *
  * @num_regs:    Number of registers in each control bank.
@@ -1450,6 +1456,7 @@ struct regmap_irq_chip {
 	bool type_invert:1;
 	bool type_in_mask:1;
 	bool clear_on_unmask:1;
+	bool not_fixed_stride:1;
 
 	int num_regs;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

