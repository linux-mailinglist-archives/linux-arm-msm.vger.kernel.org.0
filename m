Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D3F333D56
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhCJNJC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:09:02 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:46251 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231867AbhCJNIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:08:50 -0500
Received: by mail-lj1-f174.google.com with SMTP id p15so25457118ljc.13;
        Wed, 10 Mar 2021 05:08:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2R5SQOXl+81o/HVe7ST4zeA7oYfmTQlnb+S05mEfKws=;
        b=CoRIALoKCqXehFkjnFdwCWcyW/iiNQGjM4KOJ6vtiusGTbKCST88ZkiyHqQRUQrbqq
         /d8cAbk2+8vMy31RrxxP4Zy3dfrQGxs/CoygV+6EnP8ve7FqnDdFHW7AruV1K0RDrirK
         NgbJ/qmjNRe3svcNZQwNMjhcTA1641Kyc+WLPMdRBrvydijjAyOdBuNJVn8OCu1G9KLn
         3LV6WQxT49vQoy6W76OO0EKxRR35VucN6AM+Zh13+m3/a5EWKKjK4nxkxNBcCXJW2f+N
         hyZHHxaiakH+/7Wqjmpa0QEZ4J9WGgSw7YMVy3gWHWTeOlAI4+Gb6WO9KUOlhiSipIZH
         TBNQ==
X-Gm-Message-State: AOAM531O3HwJ4Hx7LUdnAZAP3T/jlwCYWO3OT7LXv8XBQVOQShsXeiJl
        lG1ttEODGeNdirT39gTMEK8=
X-Google-Smtp-Source: ABdhPJwfiLB/fzhxozbXiWCsJ4FuCjwL+DVLfO2CphZaT01jOeMrJ0jJw06KS5O2XJvO8Vka/1/rSQ==
X-Received: by 2002:a2e:5c7:: with SMTP id 190mr1829681ljf.164.1615381728351;
        Wed, 10 Mar 2021 05:08:48 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id h23sm2876870lfm.299.2021.03.10.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:08:47 -0800 (PST)
Date:   Wed, 10 Mar 2021 15:08:41 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH v2 3/7] regulator: IRQ based event/error notification
 helpers
Message-ID: <fedce3c9ea25bb56d9357d8fe4122592e022cf3f.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615367099.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Provide helper function for IC's implementing regulator notifications
when an IRQ fires. The helper also works for IRQs which can not be acked.
Helper can be set to disable the IRQ at handler and then re-enabling it
on delayed work later. The helper also adds regulator_get_error_flags()
errors in cache for the duration of IRQ disabling.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/Makefile       |   2 +-
 drivers/regulator/core.c         |  24 +-
 drivers/regulator/irq_helpers.c  | 428 +++++++++++++++++++++++++++++++
 include/linux/regulator/driver.h | 135 ++++++++++
 4 files changed, 585 insertions(+), 4 deletions(-)
 create mode 100644 drivers/regulator/irq_helpers.c

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 44d2f8bf4b74..e25f1c2d6c9b 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -4,7 +4,7 @@
 #
 
 
-obj-$(CONFIG_REGULATOR) += core.o dummy.o fixed-helper.o helpers.o devres.o
+obj-$(CONFIG_REGULATOR) += core.o dummy.o fixed-helper.o helpers.o devres.o irq_helpers.o
 obj-$(CONFIG_OF) += of_regulator.o
 obj-$(CONFIG_REGULATOR_FIXED_VOLTAGE) += fixed.o
 obj-$(CONFIG_REGULATOR_VIRTUAL_CONSUMER) += virtual.o
diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 16114aea099a..fabc83288e1b 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4388,20 +4388,37 @@ unsigned int regulator_get_mode(struct regulator *regulator)
 }
 EXPORT_SYMBOL_GPL(regulator_get_mode);
 
+static int rdev_get_cached_err_flags(struct regulator_dev *rdev)
+{
+	int ret = 0;
+
+	if (rdev->use_cached_err) {
+		spin_lock(&rdev->err_lock);
+		ret = rdev->cached_err;
+		spin_unlock(&rdev->err_lock);
+	}
+	return ret;
+}
+
 static int _regulator_get_error_flags(struct regulator_dev *rdev,
 					unsigned int *flags)
 {
-	int ret;
+	int ret, tmpret;
 
 	regulator_lock(rdev);
 
+	ret = rdev_get_cached_err_flags(rdev);
+
 	/* sanity check */
-	if (!rdev->desc->ops->get_error_flags) {
+	if (rdev->desc->ops->get_error_flags) {
+		tmpret = rdev->desc->ops->get_error_flags(rdev, flags);
+		if (tmpret > 0)
+			ret |= tmpret;
+	} else if (!rdev->use_cached_err) {
 		ret = -EINVAL;
 		goto out;
 	}
 
-	ret = rdev->desc->ops->get_error_flags(rdev, flags);
 out:
 	regulator_unlock(rdev);
 	return ret;
@@ -5236,6 +5253,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
 		goto rinse;
 	}
 	device_initialize(&rdev->dev);
+	spin_lock_init(&rdev->err_lock);
 
 	/*
 	 * Duplicate the config so the driver could override it after
diff --git a/drivers/regulator/irq_helpers.c b/drivers/regulator/irq_helpers.c
new file mode 100644
index 000000000000..29b7a7541f69
--- /dev/null
+++ b/drivers/regulator/irq_helpers.c
@@ -0,0 +1,428 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 ROHM Semiconductors
+ * regulator IRQ based event notification helpers
+ *
+ * Logic has been partially adapted from qcom-labibb driver.
+ *
+ * Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/of_irq.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/regulator/driver.h>
+
+struct regulator_irq {
+	struct regulator_irq_data rdata;
+	struct regulator_irq_desc desc;
+	int irq;
+	int retry_cnt;
+	struct delayed_work isr_work;
+};
+
+/*
+ * Should only be called from threaded handler to prevent potential deadlock
+ */
+static void rdev_flag_err(struct regulator_dev *rdev, int err)
+{
+	spin_lock(&rdev->err_lock);
+	rdev->cached_err |= err;
+	spin_unlock(&rdev->err_lock);
+}
+
+static void rdev_clear_err(struct regulator_dev *rdev, int err)
+{
+	spin_lock(&rdev->err_lock);
+	rdev->cached_err &= ~err;
+	spin_unlock(&rdev->err_lock);
+}
+
+static void regulator_notifier_isr_work(struct work_struct *work)
+{
+	struct regulator_irq *h;
+	struct regulator_irq_desc *d;
+	struct regulator_irq_data *rid;
+	int ret = 0;
+	int tmo, i;
+	int num_rdevs;
+
+	h = container_of(work, struct regulator_irq,
+			    isr_work.work);
+
+
+	d = &h->desc;
+	rid = &h->rdata;
+	num_rdevs = rid->num_states;
+
+reread:
+	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
+		if (d->die)
+			ret = d->die(rid);
+		else
+			BUG();
+
+		/*
+		 * If the 'last resort' IC recovery failed we will have
+		 * nothing else left to do...
+		 */
+		BUG_ON(ret);
+
+		/*
+		 * If h->die() was implemented we assume recovery has been
+		 * attempted (probably regulator was shut down)
+		 * and we just enable IRQ and bail-out.
+		 */
+		goto enable_out;
+	}
+	if (d->renable) {
+		ret = d->renable(rid);
+
+		if (ret == REGULATOR_FAILED_RETRY) {
+			h->retry_cnt++;
+			if (!d->reread_ms)
+				goto reread;
+			/*
+			 * driver indicated problem is still on - let's not enable IRQ
+			 * but just wait a little more
+			 */
+			tmo = d->reread_ms;
+			goto reschedule;
+		}
+
+		if (ret) {
+			/*
+			 * IC status reading succeeded. update error info
+			 * just in case the renable changed it.
+			 */
+			for (i = 0; i < num_rdevs; i++) {
+				struct regulator_err_state *stat;
+				struct regulator_dev *rdev;
+
+				stat = &rid->states[i];
+				rdev = stat->rdev;
+				rdev_clear_err(rdev, (~stat->errors) &
+						      stat->possible_errs);
+			}
+			h->retry_cnt++;
+			/*
+			 * The IC indicated problem is still ON - no point in
+			 * re-enabling the IRQ. Retry later.
+			 */
+			tmo = d->irq_off_ms;
+			goto reschedule;
+		}
+	}
+
+	/*
+	 * Either IC reported problem cleared or no status checker was provided.
+	 * If problems are gone - good. If not - then the IRQ will fire again
+	 * and we'll have new nice loop. In any case we should clear error flags
+	 * here and re-enable IRQs.
+	 */
+	for (i = 0; i < num_rdevs; i++) {
+		struct regulator_err_state *stat;
+		struct regulator_dev *rdev;
+
+		stat = &rid->states[i];
+		rdev = stat->rdev;
+		rdev_clear_err(rdev, stat->possible_errs);
+	}
+
+	/*
+	 * Things have been seemingly successful => zero retry-counter.
+	 */
+	h->retry_cnt = 0;
+
+enable_out:
+	enable_irq(h->irq);
+
+	return;
+
+reschedule:
+	if (!d->high_prio)
+		mod_delayed_work(system_wq, &h->isr_work,
+				 msecs_to_jiffies(tmo));
+	else
+		mod_delayed_work(system_highpri_wq, &h->isr_work,
+				 msecs_to_jiffies(tmo));
+}
+
+static irqreturn_t regulator_notifier_isr(int irq, void *data)
+{
+	struct regulator_irq *h = data;
+	struct regulator_irq_desc *d;
+	struct regulator_irq_data *rid;
+	unsigned long rdev_map = 0;
+	int num_rdevs;
+	int ret, i, j;
+
+	d = &h->desc;
+	rid = &h->rdata;
+	num_rdevs = rid->num_states;
+
+	if (d->fatal_cnt)
+		h->retry_cnt++;
+
+	/*
+	 * we spare few cycles by not clearing statuses prior this call.
+	 * The IC driver must initialize the status buffers for rdevs
+	 * which it indicates having active events via rdev_map.
+	 *
+	 * Maybe we should just to be on a safer side(?)
+	 */
+	ret = d->map_event(irq, rid, &rdev_map);
+
+	/*
+	 * If status reading fails (which is unlikely) we don't ack/disable
+	 * IRQ but just increase fail count and retry when IRQ fires again.
+	 * If retry_count exceeds given safety limit we call IC specific die
+	 * handler which can try disabling regulator(s).
+	 *
+	 * If no die handler is given we will just bug() as a last resort.
+	 *
+	 * We could try disabling all associated rdevs - but we might shoot
+	 * ourself in the head and leave problematic regulator enabled. So
+	 * if IC has no die-handler populated we just assume the regulator
+	 * can't be disabled.
+	 */
+	if (unlikely(ret == REGULATOR_FAILED_RETRY))
+		goto fail_out;
+
+	h->retry_cnt = 0;
+	/*
+	 * Let's not disable IRQ if there was no status bits for us. We'd
+	 * better leave spurious IRQ handling to genirq
+	 */
+	if (ret || !rdev_map)
+		return IRQ_NONE;
+
+	/*
+	 * Some events are bogus if regulator is disabled. Skip such events
+	 * if all relevant regulators are disabled
+	 */
+	if (d->skip_off) {
+		int skip = 1;
+
+		for_each_set_bit(i, &rdev_map, num_rdevs) {
+			struct regulator_dev *rdev;
+			const struct regulator_ops *ops;
+
+			rdev = rid->states[i].rdev;
+			ops = rdev->desc->ops;
+
+			/*
+			 * If any of the flagged regulators is enabled we do
+			 * handle this
+			 */
+			if (ops->is_enabled(rdev)) {
+				skip = 0;
+				break;
+			}
+		}
+		if (skip)
+			return IRQ_NONE;
+	}
+
+	/* Disable IRQ if HW keeps line asserted */
+	if (d->irq_off_ms)
+		disable_irq_nosync(irq);
+
+	/*
+	 * IRQ seems to be for us. Let's fire correct notifiers / store error
+	 * flags
+	 */
+	for_each_set_bit(i, &rdev_map, num_rdevs) {
+		struct regulator_err_state *stat;
+		int len;
+		struct regulator_dev *rdev;
+
+		stat = &rid->states[i];
+		len = sizeof(stat->notifs);
+
+		rdev = stat->rdev;
+		for_each_set_bit(j, &stat->notifs, 8 * len)
+			regulator_notifier_call_chain(rdev, 1 << (j - 1), NULL);
+
+		rdev_flag_err(rdev, stat->errors);
+	}
+
+	if (d->irq_off_ms) {
+		if (!d->high_prio)
+			schedule_delayed_work(&h->isr_work,
+					      msecs_to_jiffies(d->irq_off_ms));
+		else
+			mod_delayed_work(system_highpri_wq,
+					 &h->isr_work,
+					 msecs_to_jiffies(d->irq_off_ms));
+	}
+
+	return IRQ_HANDLED;
+
+fail_out:
+	if (d->fatal_cnt && h->retry_cnt > d->fatal_cnt) {
+		if (d->die)
+			ret = d->die(rid);
+
+		/*
+		 * If die() failed or was not implemented just BUG() as last
+		 * attemt to save HW.
+		 */
+		BUG_ON(ret);
+	}
+	return IRQ_NONE;
+}
+
+static int init_rdev_state(struct device *dev, struct regulator_irq *h,
+			   struct regulator_dev **rdev, int common_err,
+			   int *rdev_err, int rdev_amount)
+{
+	int i;
+
+	h->rdata.states = devm_kzalloc(dev, sizeof(*h->rdata.states) *
+				       rdev_amount, GFP_KERNEL);
+	if (!h->rdata.states)
+		return -ENOMEM;
+
+	h->rdata.num_states = rdev_amount;
+	h->rdata.data = h->desc.data;
+
+	for (i = 0; i < rdev_amount; i++) {
+		h->rdata.states[i].possible_errs = common_err;
+		if (rdev_err)
+			h->rdata.states[i].possible_errs |= *rdev_err++;
+		h->rdata.states[i].rdev = *rdev++;
+	}
+
+	return 0;
+}
+
+static void init_rdev_errors(struct regulator_irq *h)
+{
+	int i;
+
+	for (i = 0; i < h->rdata.num_states; i++) {
+		if (h->rdata.states[i].possible_errs)
+			/* Can we trust writing this boolean is atomic? */
+			h->rdata.states[i].rdev->use_cached_err = true;
+	}
+}
+
+/**
+ * regulator_irq_helper - register IRQ based regulator event/error notifier
+ *
+ * @dev:		device to which lifetime the helper's lifetime is
+ *			bound.
+ * @d:			IRQ helper descriptor.
+ * @irq:		IRQ used to inform events/errors to be notified.
+ * @irq_flags:		Extra IRQ flags to be OR's with the default IRQF_ONESHOT
+ *			when requesting the (threaded) irq.
+ * @common_errs:	Errors which can be flagged by this IRQ for all rdevs.
+ *			When IRQ is re-enabled these errors will be cleared
+ *			from all associated regulators
+ * @per_rdev_errs:	Optional error flag array describing errors specific
+ *			for only some of the regulators. These errors will be
+ *			or'ed with common erros. If this is given the array
+ *			should contain rdev_amount flags. Can be set to NULL
+ *			if there is no regulator specific error flags for this
+ *			IRQ.
+ * @rdev:		Array of regulators associated with this IRQ.
+ * @rdev_amount:	Amount of regulators associated wit this IRQ.
+ */
+void *regulator_irq_helper(struct device *dev,
+			    const struct regulator_irq_desc *d, int irq,
+			    int irq_flags, int common_errs, int *per_rdev_errs,
+			    struct regulator_dev **rdev, int rdev_amount)
+{
+	struct regulator_irq *h;
+	int ret;
+
+	if (!rdev_amount || !d || !d->map_event || !h->desc.name)
+		return ERR_PTR(-EINVAL);
+
+	if (irq <= 0) {
+		dev_err(dev, "No IRQ\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
+	if (!h)
+		return ERR_PTR(-ENOMEM);
+
+	h->irq = irq;
+	h->desc = *d;
+
+	ret = init_rdev_state(dev, h, rdev, common_errs, per_rdev_errs,
+			      rdev_amount);
+	if (ret)
+		return ERR_PTR(ret);
+
+	init_rdev_errors(h);
+
+	if (h->desc.irq_off_ms)
+		INIT_DELAYED_WORK(&h->isr_work, regulator_notifier_isr_work);
+
+	ret = request_threaded_irq(h->irq, NULL, regulator_notifier_isr,
+				   IRQF_ONESHOT | irq_flags, h->desc.name, h);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return h;
+}
+EXPORT_SYMBOL_GPL(regulator_irq_helper);
+
+/**
+ * regulator_irq_helper_cancel - drop IRQ based regulator event/error notifier
+ *
+ * @handle:		Pointer to handle returned by a successful call to
+ *			regulator_irq_helper(). Will be NULLed upon return.
+ *
+ * The associated IRQ is released and work is cancelled when the function
+ * returns.
+ */
+void regulator_irq_helper_cancel(void **handle)
+{
+	if (handle && *handle) {
+		struct regulator_irq *h = *handle;
+
+		free_irq(h->irq, h);
+		if (h->desc.irq_off_ms)
+			cancel_delayed_work_sync(&h->isr_work);
+
+		h = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(regulator_irq_helper_cancel);
+
+static void regulator_irq_helper_drop(struct device *dev, void *res)
+{
+	regulator_irq_helper_cancel(res);
+}
+
+void *devm_regulator_irq_helper(struct device *dev,
+				 const struct regulator_irq_desc *d, int irq,
+				 int irq_flags, int common_errs,
+				 int *per_rdev_errs,
+				 struct regulator_dev **rdev, int rdev_amount)
+{
+	void **ptr;
+
+	ptr = devres_alloc(regulator_irq_helper_drop, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	*ptr = regulator_irq_helper(dev, d, irq, irq_flags, common_errs,
+				    per_rdev_errs, rdev, rdev_amount);
+
+	if (IS_ERR(*ptr))
+		devres_free(ptr);
+	else
+		devres_add(dev, ptr);
+
+	return *ptr;
+}
+EXPORT_SYMBOL_GPL(devm_regulator_irq_helper);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index d7c77ee370f3..ff0c492786fd 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -409,6 +409,128 @@ struct regulator_config {
 	struct gpio_desc *ena_gpiod;
 };
 
+/**
+ * struct regulator_err_state - regulator error/notification status
+ *
+ * @rdev:		Regulator which status the struct indicates.
+ * @notifs:		Events which have occurred on regulator.
+ * @errors:		Errors which are active on regulator.
+ * @possible_errs:	Errors which can be signaled (by given IRQ).
+ */
+struct regulator_err_state {
+	struct regulator_dev *rdev;
+	unsigned long notifs;
+	unsigned long errors;
+	int possible_errs;
+};
+
+/**
+ * struct regulator_irq_data - regulator error/notification status date
+ *
+ * @states:	Status structs for each of the associated regulators.
+ * @num_states:	Amount of associated regulators.
+ * @data:	Driver data pointer given at regulator_irq_desc.
+ * @opaque:	Value storage for IC driver. Core does not update this. ICs
+ *		may want to store status register value here at map_event and
+ *		compare contents at renable to see if new problems have been
+ *		added to status. If that is the case it may be desirable to
+ *		return REGULATOR_ERROR_CLEARED and not REGULATOR_ERROR_ON to
+ *		allow IRQ fire again and to generate notifications also for
+ *		the new issues.
+ *
+ * This structure is passed to map_event and renable for reporting reulator
+ * status to core.
+ */
+struct regulator_irq_data {
+	struct regulator_err_state *states;
+	int num_states;
+	void *data;
+	long opaque;
+};
+
+/**
+ * struct regulator_irq_desc - notification sender for IRQ based events.
+ *
+ * @name:	The visible name for the IRQ
+ * @fatal_cnt:	If this IRQ is used to signal HW damaging condition it may be
+ *		best to shut-down regulator(s) or reboot the SOC if error
+ *		handling is repeteadly failing. If fatal_cnt is given the IRQ
+ *		handling is aborted if it fails for fatal_cnt times and die()
+ *		callback (if populated) or BUG() is called to try to prevent
+ *		further damage.
+ * @reread_ms:	The time which is waited before attempting to re-read status
+ *		at the worker if IC reading fails. Immediate re-read is done
+ *		if time is not specified.
+ * @irq_off_ms:	The time which IRQ is kept disabled before re-evaluating the
+ *		status for devices which keep IRQ disabled for duration of the
+ *		error. If this is not given the IRQ is left enabled and renable
+ *		is not called.
+ * @skip_off:	If set to true the IRQ handler will attempt to check if any of
+ *		the associated regulators are enabled prior to taking other
+ *		actions. If no regulators are enabled and this is set to true
+ *		a spurious IRQ is assumed and IRQ_NONE is returned.
+ * @high_prio:	Boolean to indicate that high priority WQ should be used.
+ * @data:	Driver private data pointer which will be passed as such to
+ *		the renable, map_event and die callbacks in regulator_irq_data.
+ * @die:	Protection callback. If IC status reading or recovery actions
+ *		fail fatal_cnt times this callback or BUG() is called. This
+ *		callback should implement final protection attempt like
+ *		disabling the regulator. If protection succeeded this may
+ *		return 0. If anything else is returned the core assumes final
+ *		protection failed and calls BUG() as a last resort.
+ * @map_event:	Driver callback to map IRQ status into regulator devices with
+ *		events / errors. NOTE: callback MUST initialize both the
+ *		errors and notifs for all rdevs which it signals having
+ *		active events as core does not clean the map data.
+ *		REGULATOR_FAILED_RETRY can be returned to indicate that the
+ *		status reading from IC failed. If this is repeated for
+ *		fatal_cnt times the core will call die() callback or BUG()
+ *		as a last resort to protect the HW.
+ * @renable:	Optional callback to check status (if HW supports that) before
+ *		re-enabling IRQ. If implemented this should clear the error
+ *		flags so that errors fetched by regulator_get_error_flags()
+ *		are updated. If callback is not impelemted then errors are
+ *		assumed to be cleared and IRQ is re-enabled.
+ *		REGULATOR_FAILED_RETRY can be returned to
+ *		indicate that the status reading from IC failed. If this is
+ *		repeated for 'fatal_cnt' times the core will call die()
+ *		callback or BUG() as a last resort to protect the HW.
+ *		Returning zero indicates that the problem in HW has been solved
+ *		and IRQ will be re-enabled. Returning REGULATOR_ERROR_ON
+ *		indicates the error condition is still active and keeps IRQ
+ *		disabled. Please note that returning REGULATOR_ERROR_ON does
+ *		not retrigger evaluating what events are active or resending
+ *		notifications. If this is needed you probably want to return
+ *		zero and allow IRQ to retrigger causing events to be
+ *		re-evaluated and re-sent.
+ *
+ * This structure is used for registering regulator IRQ notification helper.
+ */
+struct regulator_irq_desc {
+	const char *name;
+	int irq_flags;
+	int fatal_cnt;
+	int reread_ms;
+	int irq_off_ms;
+	bool skip_off;
+	bool high_prio;
+	void *data;
+
+	int (*die)(struct regulator_irq_data *rid);
+	int (*map_event)(int irq, struct regulator_irq_data *rid,
+			  unsigned long *dev_mask);
+	int (*renable)(struct regulator_irq_data *rid);
+};
+
+/*
+ * Return values for regulator IRQ helpers.
+ */
+enum {
+	REGULATOR_ERROR_CLEARED,
+	REGULATOR_FAILED_RETRY,
+	REGULATOR_ERROR_ON,
+};
+
 /*
  * struct coupling_desc
  *
@@ -473,6 +595,9 @@ struct regulator_dev {
 
 	/* time when this regulator was disabled last time */
 	unsigned long last_off_jiffy;
+	int cached_err;
+	bool use_cached_err;
+	spinlock_t err_lock;
 };
 
 struct regulator_dev *
@@ -487,6 +612,16 @@ void devm_regulator_unregister(struct device *dev, struct regulator_dev *rdev);
 
 int regulator_notifier_call_chain(struct regulator_dev *rdev,
 				  unsigned long event, void *data);
+void *devm_regulator_irq_helper(struct device *dev,
+				const struct regulator_irq_desc *d, int irq,
+				int irq_flags, int common_errs,
+				int *per_rdev_errs, struct regulator_dev **rdev,
+				int rdev_amount);
+void *regulator_irq_helper(struct device *dev,
+			   const struct regulator_irq_desc *d, int irq,
+			   int irq_flags, int common_errs, int *per_rdev_errs,
+			   struct regulator_dev **rdev, int rdev_amount);
+void regulator_irq_helper_cancel(void **handle);
 
 void *rdev_get_drvdata(struct regulator_dev *rdev);
 struct device *rdev_get_dev(struct regulator_dev *rdev);
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
