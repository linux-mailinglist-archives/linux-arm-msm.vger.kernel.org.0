Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF19A2941DA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 20:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732713AbgJTSE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 14:04:58 -0400
Received: from z5.mailgun.us ([104.130.96.5]:64429 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732754AbgJTSE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 14:04:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603217098; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4PfBiHxTjdA6BGRpnz6Ybt2ryzqDBYRJt8uSzawTCNs=; b=IMIz9yj6GXn8hSORjnhutEqcOVgBiKYfRypSFCzJG3Zaa0rcU9x9MevA66PdNpu23RNa9H2t
 j9AAG7MTGBiRbuQnT1X7WBv3jVeRXVd2MgyUkY05EjOpchBp0Y4cgdo9nVTZSphq7ovA09+6
 2FQoKoVzDch9UMaIkOUCjm+5d/M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f8f26b0ef891f1ee2a10ca8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Oct 2020 18:04:32
 GMT
Sender: ilina=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB8CAC433CB; Tue, 20 Oct 2020 18:04:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5EF6FC433FE;
        Tue, 20 Oct 2020 18:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5EF6FC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     rjw@rjwysocki.net, ulf.hansson@linaro.org, linux-pm@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v4 1/2] PM / domains: inform PM domain of a device's next wakeup
Date:   Tue, 20 Oct 2020 12:04:12 -0600
Message-Id: <20201020180413.32225-2-ilina@codeaurora.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020180413.32225-1-ilina@codeaurora.org>
References: <20201020180413.32225-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices may have a predictable interrupt pattern while executing
usecases. An example would be the VSYNC interrupt associated with
display devices. A 60 Hz display could cause a interrupt every 16 ms. If
the device were in a PM domain, the domain would need to be powered up
for device to resume and handle the interrupt.

Entering a domain idle state saves power, only if the residency of the
idle state is met. Without knowing the idle duration of the domain, the
governor would just choose the deepest idle state that matches the QoS
requirements. The domain might be powered off just as the device is
expecting to wake up. If devices could inform PM frameworks of their
next event, the parent PM domain's idle duration can be determined.

So let's add the pm_genpd_set_next_wake() API for the device to notify
PM domains of the impending wakeup. This information will be the domain
governor to determine the best idle state given the wakeup.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v4:
	- Use PM domain data to store next_wakeup
	- Drop runtime PM documentation
Changes in v3:
	- Fix unwanted change
Changes in v2:
	- Update documentation
	- Remove runtime PM enabled check
	- Update commit text
---
 drivers/base/power/domain.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  8 ++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 743268996336..34b90e77e0cd 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -408,6 +408,41 @@ int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state)
 }
 EXPORT_SYMBOL_GPL(dev_pm_genpd_set_performance_state);
 
+/**
+ * dev_pm_genpd_set_next_wakeup - Notify PM framework of an impending wakeup.
+ *
+ * @dev: Device to handle
+ * @next: impending interrupt/wakeup for the device
+ *
+ * Allow devices to inform of the next wakeup. But, if the domain were already
+ * powered off, we will not wakeup the domain to recompute it's idle duration.
+ */
+int dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
+{
+	struct generic_pm_domain *genpd;
+	struct generic_pm_domain_data *gpd_data;
+	int ret = -EINVAL;
+
+	genpd = dev_to_genpd_safe(dev);
+	if (!genpd)
+		return -ENODEV;
+
+	if (WARN_ON(!dev->power.subsys_data ||
+		    !dev->power.subsys_data->domain_data))
+		return ret;
+
+	genpd_lock(genpd);
+	gpd_data = to_gpd_data(dev->power.subsys_data->domain_data);
+	if (ktime_before(ktime_get(), next)) {
+		gpd_data->next_wakeup = next;
+		ret = 0;
+	}
+	genpd_unlock(genpd);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_genpd_set_next_wakeup);
+
 static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 {
 	unsigned int state_idx = genpd->state_idx;
@@ -1431,6 +1466,7 @@ static struct generic_pm_domain_data *genpd_alloc_dev_data(struct device *dev)
 	gpd_data->td.constraint_changed = true;
 	gpd_data->td.effective_constraint_ns = PM_QOS_RESUME_LATENCY_NO_CONSTRAINT_NS;
 	gpd_data->nb.notifier_call = genpd_dev_pm_qos_notifier;
+	gpd_data->next_wakeup = KTIME_MAX;
 
 	spin_lock_irq(&dev->power.lock);
 
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 1ad0ec481416..e00c77b1efd8 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -9,6 +9,7 @@
 #define _LINUX_PM_DOMAIN_H
 
 #include <linux/device.h>
+#include <linux/ktime.h>
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/err.h>
@@ -191,6 +192,7 @@ struct generic_pm_domain_data {
 	struct notifier_block *power_nb;
 	int cpu;
 	unsigned int performance_state;
+	ktime_t	next_wakeup;
 	void *data;
 };
 
@@ -217,6 +219,7 @@ int pm_genpd_remove(struct generic_pm_domain *genpd);
 int dev_pm_genpd_set_performance_state(struct device *dev, unsigned int state);
 int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
 int dev_pm_genpd_remove_notifier(struct device *dev);
+int dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next);
 
 extern struct dev_power_governor simple_qos_governor;
 extern struct dev_power_governor pm_domain_always_on_gov;
@@ -275,6 +278,11 @@ static inline int dev_pm_genpd_remove_notifier(struct device *dev)
 	return -ENOTSUPP;
 }
 
+static inline int dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next)
+{
+	return -ENOTSUPP;
+}
+
 #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
 #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

