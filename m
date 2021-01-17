Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9422C2F95C1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jan 2021 23:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730215AbhAQWJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jan 2021 17:09:23 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:43083 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730187AbhAQWJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jan 2021 17:09:22 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CFFAE1F54C;
        Sun, 17 Jan 2021 23:08:35 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v3 5/7] regulator: qcom-labibb: Implement short-circuit and over-current IRQs
Date:   Sun, 17 Jan 2021 23:08:28 +0100
Message-Id: <20210117220830.150948-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Short-Circuit Protection (SCP) and Over-Current Protection (OCP) are
very important for regulators like LAB and IBB, which are designed to
provide from very small to relatively big amounts of current to the
device (normally, a display).

Now that this regulator supports both voltage setting and current
limiting in this driver, to me it looked like being somehow essential
to provide support for SCP and OCP, for two reasons:
1. SCP is a drastic measure to prevent damaging "more" hardware in
   the worst situations, if any was damaged, preventing potentially
   drastic issues;
2. OCP is a great way to protect the hardware that we're powering
   through these regulators as if anything bad happens, the HW will
   draw more current than expected: in this case, the OCP interrupt
   will fire and the regulators will be immediately shut down,
   preventing hardware damage in many cases.

Both interrupts were successfully tested in a "sort-of" controlled
manner, with the following methodology:

Short-Circuit Protection (SCP):
1. Set LAB/IBB to 4.6/-1.4V, current limit 200mA/50mA;
2. Connect a 10 KOhm resistor to LAB/IBB by poking the right traces
   on a FxTec Pro1 smartphone for a very brief time (in short words,
   "just a rapid touch with flying wires");
3. The Short-Circuit protection trips: IRQ raises, regulators get
   cut. Recovery OK, test repeated without rebooting, OK.

Over-Current Protection (OCP):
1. Set LAB/IBB to the expected voltage to power up the display of
   a Sony Xperia XZ Premium smartphone (Sharp LS055D1SX04), set
   current limit to LAB 200mA, IBB 50mA (the values that this
   display unit needs are 200/800mA);
2. Boot the kernel: OCP fires. Recovery never happens because
   the selected current limit is too low, but that's expected.
   Test OK.

3. Set LAB/IBB to the expected current limits for XZ Premium
   (LAB 200mA, IBB 800mA), but lower than expected voltage,
   specifically LAB 5.4V, IBB -5.6V (instead of 5.6, -5.8V);
4. Boot the kernel: OCP fires. Recovery never happens because
   the selected voltage (still in the working range limits)
   is producing a current draw of more than 200mA on LAB.
   Test OK.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 518 +++++++++++++++++++++-
 1 file changed, 515 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 4d68b69b5a52..dbb4511c3c6d 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -17,8 +17,20 @@
 
 #define PMI8998_LAB_REG_BASE		0xde00
 #define PMI8998_IBB_REG_BASE		0xdc00
+#define PMI8998_IBB_LAB_REG_OFFSET	0x200
 
 #define REG_LABIBB_STATUS1		0x08
+ #define LABIBB_STATUS1_SC_BIT		BIT(6)
+ #define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
+
+#define REG_LABIBB_INT_SET_TYPE		0x11
+#define REG_LABIBB_INT_POLARITY_HIGH	0x12
+#define REG_LABIBB_INT_POLARITY_LOW	0x13
+#define REG_LABIBB_INT_LATCHED_CLR	0x14
+#define REG_LABIBB_INT_EN_SET		0x15
+#define REG_LABIBB_INT_EN_CLR		0x16
+ #define LABIBB_INT_VREG_OK		BIT(0)
+ #define LABIBB_INT_VREG_TYPE_LEVEL	0
 
 #define REG_LABIBB_VOLTAGE		0x41
  #define LABIBB_VOLTAGE_OVERRIDE_EN	BIT(7)
@@ -26,8 +38,7 @@
  #define IBB_VOLTAGE_SET_MASK		GENMASK(5, 0)
 
 #define REG_LABIBB_ENABLE_CTL		0x46
-#define LABIBB_STATUS1_VREG_OK_BIT	BIT(7)
-#define LABIBB_CONTROL_ENABLE		BIT(7)
+ #define LABIBB_CONTROL_ENABLE		BIT(7)
 
 #define REG_LABIBB_PD_CTL		0x47
  #define LAB_PD_CTL_MASK		GENMASK(1, 0)
@@ -56,6 +67,11 @@
 #define LAB_ENABLE_TIME			(LABIBB_OFF_ON_DELAY * 2)
 #define IBB_ENABLE_TIME			(LABIBB_OFF_ON_DELAY * 10)
 #define LABIBB_POLL_ENABLED_TIME	1000
+#define OCP_RECOVERY_INTERVAL_MS	500
+#define SC_RECOVERY_INTERVAL_MS		250
+#define LABIBB_MAX_OCP_COUNT		4
+#define LABIBB_MAX_SC_COUNT		3
+#define LABIBB_MAX_FATAL_COUNT		2
 
 struct labibb_current_limits {
 	u32				uA_min;
@@ -69,10 +85,17 @@ struct labibb_regulator {
 	struct regmap			*regmap;
 	struct regulator_dev		*rdev;
 	struct labibb_current_limits	uA_limits;
+	struct delayed_work		ocp_recovery_work;
+	struct delayed_work		sc_recovery_work;
 	u16				base;
 	u8				type;
 	u8				dischg_sel;
 	u8				soft_start_sel;
+	int				sc_irq;
+	int				sc_count;
+	int				ocp_irq;
+	int				ocp_irq_count;
+	int				fatal_count;
 };
 
 struct labibb_regulator_data {
@@ -82,6 +105,450 @@ struct labibb_regulator_data {
 	const struct regulator_desc	*desc;
 };
 
+static int qcom_labibb_ocp_hw_enable(struct regulator_dev *rdev)
+{
+	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
+	int ret;
+
+	/* Clear irq latch status to avoid spurious event */
+	ret = regmap_update_bits(rdev->regmap,
+				 vreg->base + REG_LABIBB_INT_LATCHED_CLR,
+				 LABIBB_INT_VREG_OK, 1);
+	if (ret)
+		return ret;
+
+	/* Enable OCP HW interrupt */
+	return regmap_update_bits(rdev->regmap,
+				  vreg->base + REG_LABIBB_INT_EN_SET,
+				  LABIBB_INT_VREG_OK, 1);
+}
+
+static int qcom_labibb_ocp_hw_disable(struct regulator_dev *rdev)
+{
+	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
+
+	return regmap_update_bits(rdev->regmap,
+				  vreg->base + REG_LABIBB_INT_EN_CLR,
+				  LABIBB_INT_VREG_OK, 1);
+}
+
+/**
+ * qcom_labibb_check_ocp_status - Check the Over-Current Protection status
+ * @vreg: Main driver structure
+ *
+ * This function checks the STATUS1 register for the VREG_OK bit: if it is
+ * set, then there is no Over-Current event.
+ *
+ * Returns: Zero if there is no over-current, 1 if in over-current or
+ *          negative number for error
+ */
+static int qcom_labibb_check_ocp_status(struct labibb_regulator *vreg)
+{
+	u32 cur_status;
+	int ret;
+
+	ret = regmap_read(vreg->rdev->regmap, vreg->base + REG_LABIBB_STATUS1,
+			  &cur_status);
+	if (ret)
+		return ret;
+
+	return !(cur_status & LABIBB_STATUS1_VREG_OK_BIT);
+}
+
+/**
+ * qcom_labibb_ocp_recovery_worker - Handle OCP event
+ * @work: OCP work structure
+ *
+ * This is the worker function to handle the Over Current Protection
+ * hardware event; This will check if the hardware is still
+ * signaling an over-current condition and will eventually stop
+ * the regulator if such condition is still signaled after
+ * LABIBB_MAX_OCP_COUNT times.
+ *
+ * If the driver that is consuming the regulator did not take action
+ * for the OCP condition, or the hardware did not stabilize, a cut
+ * of the LAB and IBB regulators will be forced (regulators will be
+ * disabled).
+ *
+ * As last, if the writes to shut down the LAB/IBB regulators fail
+ * for more than LABIBB_MAX_FATAL_COUNT, then a kernel panic will be
+ * triggered, as a last resort to protect the hardware from burning;
+ * this, however, is expected to never happen, but this is kept to
+ * try to further ensure that we protect the hardware at all costs.
+ */
+static void qcom_labibb_ocp_recovery_worker(struct work_struct *work)
+{
+	struct labibb_regulator *vreg;
+	const struct regulator_ops *ops;
+	int ret;
+
+	vreg = container_of(work, struct labibb_regulator,
+			    ocp_recovery_work.work);
+	ops = vreg->rdev->desc->ops;
+
+	if (vreg->ocp_irq_count >= LABIBB_MAX_OCP_COUNT) {
+		/*
+		 * If we tried to disable the regulator multiple times but
+		 * we kept failing, there's only one last hope to save our
+		 * hardware from the death: raise a kernel bug, reboot and
+		 * hope that the bootloader kindly saves us. This, though
+		 * is done only as paranoid checking, because failing the
+		 * regmap write to disable the vreg is almost impossible,
+		 * since we got here after multiple regmap R/W.
+		 */
+		BUG_ON(vreg->fatal_count > LABIBB_MAX_FATAL_COUNT);
+		dev_err(&vreg->rdev->dev, "LABIBB: CRITICAL: Disabling regulator\n");
+
+		/* Disable the regulator immediately to avoid damage */
+		ret = ops->disable(vreg->rdev);
+		if (ret) {
+			vreg->fatal_count++;
+			goto reschedule;
+		}
+		enable_irq(vreg->ocp_irq);
+		vreg->fatal_count = 0;
+		return;
+	}
+
+	ret = qcom_labibb_check_ocp_status(vreg);
+	if (ret != 0) {
+		vreg->ocp_irq_count++;
+		goto reschedule;
+	}
+
+	ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
+	if (ret) {
+		/* We cannot trust it without OCP enabled. */
+		dev_err(vreg->dev, "Cannot enable OCP IRQ\n");
+		vreg->ocp_irq_count++;
+		goto reschedule;
+	}
+
+	enable_irq(vreg->ocp_irq);
+	/* Everything went fine: reset the OCP count! */
+	vreg->ocp_irq_count = 0;
+	return;
+
+reschedule:
+	mod_delayed_work(system_wq, &vreg->ocp_recovery_work,
+			 msecs_to_jiffies(OCP_RECOVERY_INTERVAL_MS));
+}
+
+/**
+ * qcom_labibb_ocp_isr - Interrupt routine for OverCurrent Protection
+ * @irq:  Interrupt number
+ * @chip: Main driver structure
+ *
+ * Over Current Protection (OCP) will signal to the client driver
+ * that an over-current event has happened and then will schedule
+ * a recovery worker.
+ *
+ * Disabling and eventually re-enabling the regulator is expected
+ * to be done by the driver, as some hardware may be triggering an
+ * over-current condition only at first initialization or it may
+ * be expected only for a very brief amount of time, after which
+ * the attached hardware may be expected to stabilize its current
+ * draw.
+ *
+ * Returns: IRQ_HANDLED for success or IRQ_NONE for failure.
+ */
+static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
+{
+	struct labibb_regulator *vreg = chip;
+	const struct regulator_ops *ops = vreg->rdev->desc->ops;
+	int ret;
+
+	/* If the regulator is not enabled, this is a fake event */
+	if (!ops->is_enabled(vreg->rdev))
+		return 0;
+
+	/* If we tried to recover for too many times it's not getting better */
+	if (vreg->ocp_irq_count > LABIBB_MAX_OCP_COUNT)
+		return IRQ_NONE;
+
+	/*
+	 * If we (unlikely) can't read this register, to prevent hardware
+	 * damage at all costs, we assume that the overcurrent event was
+	 * real; Moreover, if the status register is not signaling OCP,
+	 * it was a spurious event, so it's all ok.
+	 */
+	ret = qcom_labibb_check_ocp_status(vreg);
+	if (ret == 0) {
+		vreg->ocp_irq_count = 0;
+		goto end;
+	}
+	vreg->ocp_irq_count++;
+
+	/*
+	 * Disable the interrupt temporarily, or it will fire continuously;
+	 * we will re-enable it in the recovery worker function.
+	 */
+	disable_irq(irq);
+
+	/* Warn the user for overcurrent */
+	dev_warn(vreg->dev, "Over-Current interrupt fired!\n");
+
+	/* Disable the interrupt to avoid hogging */
+	ret = qcom_labibb_ocp_hw_disable(vreg->rdev);
+	if (ret)
+		goto end;
+
+	/* Signal overcurrent event to drivers */
+	regulator_notifier_call_chain(vreg->rdev,
+				      REGULATOR_EVENT_OVER_CURRENT, NULL);
+
+end:
+	/* Schedule the recovery work */
+	schedule_delayed_work(&vreg->ocp_recovery_work,
+			      msecs_to_jiffies(OCP_RECOVERY_INTERVAL_MS));
+	if (ret)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
+{
+	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
+	char *ocp_irq_name;
+	u32 irq_flags = IRQF_ONESHOT;
+	int irq_trig_low, ret;
+
+	/* If there is no OCP interrupt, there's nothing to set */
+	if (vreg->ocp_irq <= 0)
+		return -EINVAL;
+
+	ocp_irq_name = devm_kasprintf(vreg->dev, GFP_KERNEL, "%s-over-current",
+				      vreg->desc.name);
+	if (!ocp_irq_name)
+		return -ENOMEM;
+
+	/* IRQ polarities - LAB: trigger-low, IBB: trigger-high */
+	switch (vreg->type) {
+	case QCOM_LAB_TYPE:
+		irq_flags |= IRQF_TRIGGER_LOW;
+		irq_trig_low = 1;
+		break;
+	case QCOM_IBB_TYPE:
+		irq_flags |= IRQF_TRIGGER_HIGH;
+		irq_trig_low = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Activate OCP HW level interrupt */
+	ret = regmap_update_bits(rdev->regmap,
+				 vreg->base + REG_LABIBB_INT_SET_TYPE,
+				 LABIBB_INT_VREG_OK,
+				 LABIBB_INT_VREG_TYPE_LEVEL);
+	if (ret)
+		return ret;
+
+	/* Set OCP interrupt polarity */
+	ret = regmap_update_bits(rdev->regmap,
+				 vreg->base + REG_LABIBB_INT_POLARITY_HIGH,
+				 LABIBB_INT_VREG_OK, !irq_trig_low);
+	if (ret)
+		return ret;
+	ret = regmap_update_bits(rdev->regmap,
+				 vreg->base + REG_LABIBB_INT_POLARITY_LOW,
+				 LABIBB_INT_VREG_OK, irq_trig_low);
+	if (ret)
+		return ret;
+
+	ret = qcom_labibb_ocp_hw_enable(rdev);
+	if (ret)
+		return ret;
+
+	return devm_request_threaded_irq(vreg->dev, vreg->ocp_irq, NULL,
+					 qcom_labibb_ocp_isr, irq_flags,
+					 ocp_irq_name, vreg);
+}
+
+/**
+ * qcom_labibb_check_sc_status - Check the Short Circuit Protection status
+ * @vreg: Main driver structure
+ *
+ * This function checks the STATUS1 register on both LAB and IBB regulators
+ * for the ShortCircuit bit: if it is set on *any* of them, then we have
+ * experienced a short-circuit event.
+ *
+ * Returns: Zero if there is no short-circuit, 1 if in short-circuit or
+ *          negative number for error
+ */
+static int qcom_labibb_check_sc_status(struct labibb_regulator *vreg)
+{
+	u32 ibb_status, ibb_reg, lab_status, lab_reg;
+	int ret;
+
+	/* We have to work on both regulators due to PBS... */
+	lab_reg = ibb_reg = vreg->base + REG_LABIBB_STATUS1;
+	if (vreg->type == QCOM_LAB_TYPE)
+		ibb_reg -= PMI8998_IBB_LAB_REG_OFFSET;
+	else
+		lab_reg += PMI8998_IBB_LAB_REG_OFFSET;
+
+	ret = regmap_read(vreg->rdev->regmap, lab_reg, &lab_status);
+	if (ret)
+		return ret;
+	ret = regmap_read(vreg->rdev->regmap, ibb_reg, &ibb_status);
+	if (ret)
+		return ret;
+
+	return !!(lab_status & LABIBB_STATUS1_SC_BIT) ||
+	       !!(ibb_status & LABIBB_STATUS1_SC_BIT);
+}
+
+/**
+ * qcom_labibb_sc_recovery_worker - Handle Short Circuit event
+ * @work: SC work structure
+ *
+ * This is the worker function to handle the Short Circuit Protection
+ * hardware event; This will check if the hardware is still
+ * signaling a short-circuit condition and will eventually never
+ * re-enable the regulator if such condition is still signaled after
+ * LABIBB_MAX_SC_COUNT times.
+ *
+ * If the driver that is consuming the regulator did not take action
+ * for the SC condition, or the hardware did not stabilize, this
+ * worker will stop rescheduling, leaving the regulators disabled
+ * as already done by the Portable Batch System (PBS).
+ *
+ * Returns: IRQ_HANDLED for success or IRQ_NONE for failure.
+ */
+static void qcom_labibb_sc_recovery_worker(struct work_struct *work)
+{
+	struct labibb_regulator *vreg;
+	const struct regulator_ops *ops;
+	u32 lab_reg, ibb_reg, lab_val, ibb_val, val;
+	bool pbs_cut = false;
+	int i, sc, ret;
+
+	vreg = container_of(work, struct labibb_regulator,
+			    sc_recovery_work.work);
+	ops = vreg->rdev->desc->ops;
+
+	/*
+	 * If we tried to check the regulator status multiple times but we
+	 * kept failing, then just bail out, as the Portable Batch System
+	 * (PBS) will disable the vregs for us, preventing hardware damage.
+	 */
+	if (vreg->fatal_count > LABIBB_MAX_FATAL_COUNT)
+		return;
+
+	/* Too many short-circuit events. Throw in the towel. */
+	if (vreg->sc_count > LABIBB_MAX_SC_COUNT)
+		return;
+
+	/*
+	 * The Portable Batch System (PBS) automatically disables LAB
+	 * and IBB when a short-circuit event is detected, so we have to
+	 * check and work on both of them at the same time.
+	 */
+	lab_reg = ibb_reg = vreg->base + REG_LABIBB_ENABLE_CTL;
+	if (vreg->type == QCOM_LAB_TYPE)
+		ibb_reg -= PMI8998_IBB_LAB_REG_OFFSET;
+	else
+		lab_reg += PMI8998_IBB_LAB_REG_OFFSET;
+
+	sc = qcom_labibb_check_sc_status(vreg);
+	if (sc)
+		goto reschedule;
+
+	for (i = 0; i < LABIBB_MAX_SC_COUNT; i++) {
+		ret = regmap_read(vreg->regmap, lab_reg, &lab_val);
+		if (ret) {
+			vreg->fatal_count++;
+			goto reschedule;
+		}
+
+		ret = regmap_read(vreg->regmap, ibb_reg, &ibb_val);
+		if (ret) {
+			vreg->fatal_count++;
+			goto reschedule;
+		}
+		val = lab_val & ibb_val;
+
+		if (!(val & LABIBB_CONTROL_ENABLE)) {
+			pbs_cut = true;
+			break;
+		}
+		usleep_range(5000, 6000);
+	}
+	if (pbs_cut)
+		goto reschedule;
+
+
+	/*
+	 * If we have reached this point, we either have successfully
+	 * recovered from the SC condition or we had a spurious SC IRQ,
+	 * which means that we can re-enable the regulators, if they
+	 * have ever been disabled by the PBS.
+	 */
+	ret = ops->enable(vreg->rdev);
+	if (ret)
+		goto reschedule;
+
+	/* Everything went fine: reset the OCP count! */
+	vreg->sc_count = 0;
+	enable_irq(vreg->sc_irq);
+	return;
+
+reschedule:
+	/*
+	 * Now that we have done basic handling of the short-circuit,
+	 * reschedule this worker in the regular system workqueue, as
+	 * taking action is not truly urgent anymore.
+	 */
+	vreg->sc_count++;
+	mod_delayed_work(system_wq, &vreg->sc_recovery_work,
+			 msecs_to_jiffies(SC_RECOVERY_INTERVAL_MS));
+}
+
+/**
+ * qcom_labibb_sc_isr - Interrupt routine for Short Circuit Protection
+ * @irq:  Interrupt number
+ * @chip: Main driver structure
+ *
+ * Short Circuit Protection (SCP) will signal to the client driver
+ * that a regulation-out event has happened and then will schedule
+ * a recovery worker.
+ *
+ * The LAB and IBB regulators will be automatically disabled by the
+ * Portable Batch System (PBS) and they will be enabled again by
+ * the worker function if the hardware stops signaling the short
+ * circuit event.
+ *
+ * Returns: IRQ_HANDLED for success or IRQ_NONE for failure.
+ */
+static irqreturn_t qcom_labibb_sc_isr(int irq, void *chip)
+{
+	struct labibb_regulator *vreg = chip;
+
+	if (vreg->sc_count > LABIBB_MAX_SC_COUNT)
+		return IRQ_NONE;
+
+	/* Warn the user for short circuit */
+	dev_warn(vreg->dev, "Short-Circuit interrupt fired!\n");
+
+	/*
+	 * Disable the interrupt temporarily, or it will fire continuously;
+	 * we will re-enable it in the recovery worker function.
+	 */
+	disable_irq(irq);
+
+	/* Signal out of regulation event to drivers */
+	regulator_notifier_call_chain(vreg->rdev,
+				      REGULATOR_EVENT_REGULATION_OUT, NULL);
+
+	/* Schedule the short-circuit handling as high-priority work */
+	mod_delayed_work(system_highpri_wq, &vreg->sc_recovery_work,
+			 msecs_to_jiffies(SC_RECOVERY_INTERVAL_MS));
+	return IRQ_HANDLED;
+}
+
+
 static int qcom_labibb_set_current_limit(struct regulator_dev *rdev,
 					 int min_uA, int max_uA)
 {
@@ -210,6 +677,7 @@ static const struct regulator_ops qcom_labibb_ops = {
 	.set_current_limit	= qcom_labibb_set_current_limit,
 	.get_current_limit	= qcom_labibb_get_current_limit,
 	.set_soft_start		= qcom_labibb_set_soft_start,
+	.set_over_current_protection = qcom_labibb_set_ocp,
 };
 
 static const struct regulator_desc pmi8998_lab_desc = {
@@ -287,7 +755,7 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 	struct labibb_regulator *vreg;
 	struct device *dev = &pdev->dev;
 	struct regulator_config cfg = {};
-
+	struct device_node *reg_node;
 	const struct of_device_id *match;
 	const struct labibb_regulator_data *reg_data;
 	struct regmap *reg_regmap;
@@ -305,6 +773,8 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	for (reg_data = match->data; reg_data->name; reg_data++) {
+		char *sc_irq_name;
+		int irq = 0;
 
 		/* Validate if the type of regulator is indeed
 		 * what's mentioned in DT.
@@ -327,10 +797,44 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 		if (!vreg)
 			return -ENOMEM;
 
+		sc_irq_name = devm_kasprintf(dev, GFP_KERNEL,
+					     "%s-short-circuit",
+					     reg_data->name);
+		if (!sc_irq_name)
+			return -ENOMEM;
+
+		reg_node = of_get_child_by_name(pdev->dev.of_node,
+						reg_data->name);
+		if (!reg_node)
+			return -EINVAL;
+
+		/* The Short Circuit interrupt is critical */
+		irq = of_irq_get_byname(reg_node, "sc-err");
+		if (irq <= 0) {
+			if (irq == 0)
+				irq = -EINVAL;
+
+			return dev_err_probe(vreg->dev, irq,
+					     "Short-circuit irq not found.\n");
+		}
+		vreg->sc_irq = irq;
+
+		/* OverCurrent Protection IRQ is optional */
+		irq = of_irq_get_byname(reg_node, "ocp");
+		vreg->ocp_irq = irq;
+		vreg->ocp_irq_count = 0;
+		of_node_put(reg_node);
+
 		vreg->regmap = reg_regmap;
 		vreg->dev = dev;
 		vreg->base = reg_data->base;
 		vreg->type = reg_data->type;
+		INIT_DELAYED_WORK(&vreg->sc_recovery_work,
+				  qcom_labibb_sc_recovery_worker);
+
+		if (vreg->ocp_irq > 0)
+			INIT_DELAYED_WORK(&vreg->ocp_recovery_work,
+					  qcom_labibb_ocp_recovery_worker);
 
 		switch (vreg->type) {
 		case QCOM_LAB_TYPE:
@@ -365,6 +869,14 @@ static int qcom_labibb_regulator_probe(struct platform_device *pdev)
 					reg_data->name, ret);
 			return PTR_ERR(vreg->rdev);
 		}
+
+		ret = devm_request_threaded_irq(vreg->dev, vreg->sc_irq, NULL,
+						qcom_labibb_sc_isr,
+						IRQF_ONESHOT |
+						IRQF_TRIGGER_RISING,
+						sc_irq_name, vreg);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.29.2

