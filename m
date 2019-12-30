Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DF212D104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 15:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbfL3Ooa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 09:44:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46147 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfL3Ooa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 09:44:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so31068521ljc.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iP0q67cVa7joTIBbxM/rB2PXgLYhwll7Ud0Qeuw7uE4=;
        b=cZDkTeTBaAAlRRZrP1XLtXSbuzbscAVY8zmWFyVTHUO5xJzFNqhSGbfNaVWsCH1AuX
         4rT40nwkm1sYOV87tQsTVNYOpKm/XQgnTfubKy97NWJGHyYGyJ+cykHyuBuzwg1e4vI+
         dP2uBSyDD85o+XaR8nCem4voDrHfRNDwol6CbGAaupD5x1CDQNr/ejTTClgbNp+xnOmR
         2Bybqk0ajXhcvXbxyM51KKuqO7Pq9KUok4Z20H1s3n3ChONQsVe8t0SEdohf+xd9LlR9
         TwQyqLl/Nqa3iyclS4fQCNrW5jt9RzhUB79qF7nkaemxrQzWOlFc+6vmMc74MtPky/iM
         eUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iP0q67cVa7joTIBbxM/rB2PXgLYhwll7Ud0Qeuw7uE4=;
        b=EkHWtCLdHI8Q6SJOpTIdYEuAu0SPiHUBIOO5ojEXzO6ok+CRugG4WSmC31+uGRofTc
         y+I5R8Di2X+EOy23wxq9GSj/xbL+6v4z4U4IvLJnrlTLAZG10MBQPTk0/byAz8iIcD5E
         dHsE/YAq1sOHpX67yOYmaG0usekqleSMu+vroQy+rZpSOkCnUbiS2+Zxoo59CIQGddrx
         YDj++Ftjm7sGjiHLIHMlr2l1Dc8w5YyGt6RR+jymvLaRy/e32SCvDn77GYFG9t30v9mI
         w7bT60jU/0SHULpbICDo4A/XwHVsC6+4NXtyYC4Pd9pyIseoaGiiNAM4j6P0s/8Dw+eK
         snXQ==
X-Gm-Message-State: APjAAAXxlfIMrmgaOZP0rt5bJ0rpUo8+HU5fzhm6PAn8+Iykf1znYP1+
        S7DxwQD7kjmZGaZ7bhYoM8xoOg==
X-Google-Smtp-Source: APXvYqzBs/tiWnncxKxVYy6elFVnD48Lxju0cyn1aR3gEPXIkZtrCY33Ut1F1NTu0L4H0jjmnQTcwg==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr39630757ljg.88.1577717067493;
        Mon, 30 Dec 2019 06:44:27 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-210.NA.cust.bahnhof.se. [158.174.22.210])
        by smtp.gmail.com with ESMTPSA id a21sm18744931lfg.44.2019.12.30.06.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 06:44:26 -0800 (PST)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lina Iyer <ilina@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 12/15] cpuidle: psci: Support CPU hotplug for the hierarchical model
Date:   Mon, 30 Dec 2019 15:43:59 +0100
Message-Id: <20191230144402.30195-13-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230144402.30195-1-ulf.hansson@linaro.org>
References: <20191230144402.30195-1-ulf.hansson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the hierarchical CPU topology is used and when a CPU is put offline,
that CPU prevents its PM domain from being powered off, which is because
genpd observes the corresponding attached device as being active from a
runtime PM point of view. Furthermore, any potential master PM domains are
also prevented from being powered off.

To address this limitation, let's add add a new CPU hotplug state
(CPUHP_AP_CPU_PM_STARTING) and register up/down callbacks for it, which
allows us to deal with runtime PM accordingly.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---

Changes in v5:
	- Make CPUHP function/variable initdata.

---
 drivers/cpuidle/cpuidle-psci.c | 45 +++++++++++++++++++++++++++++++++-
 include/linux/cpuhotplug.h     |  1 +
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 6e7804e697ed..9d779be27071 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/cpuhotplug.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
 #include <linux/cpu_pm.h>
@@ -31,6 +32,7 @@ struct psci_cpuidle_data {
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct psci_cpuidle_data, psci_cpuidle_data);
 static DEFINE_PER_CPU(u32, domain_state);
+static bool psci_cpuidle_use_cpuhp __initdata;
 
 static inline void psci_set_domain_state(u32 state)
 {
@@ -72,6 +74,44 @@ static int psci_enter_domain_idle_state(struct cpuidle_device *dev,
 	return ret;
 }
 
+static int psci_idle_cpuhp_up(unsigned int cpu)
+{
+	struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
+
+	if (pd_dev)
+		pm_runtime_get_sync(pd_dev);
+
+	return 0;
+}
+
+static int psci_idle_cpuhp_down(unsigned int cpu)
+{
+	struct device *pd_dev = __this_cpu_read(psci_cpuidle_data.dev);
+
+	if (pd_dev) {
+		pm_runtime_put_sync(pd_dev);
+		/* Clear domain state to start fresh at next online. */
+		psci_set_domain_state(0);
+	}
+
+	return 0;
+}
+
+static void __init psci_idle_init_cpuhp(void)
+{
+	int err;
+
+	if (!psci_cpuidle_use_cpuhp)
+		return;
+
+	err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
+					"cpuidle/psci:online",
+					psci_idle_cpuhp_up,
+					psci_idle_cpuhp_down);
+	if (err)
+		pr_warn("Failed %d while setup cpuhp state\n", err);
+}
+
 static int psci_enter_idle_state(struct cpuidle_device *dev,
 				struct cpuidle_driver *drv, int idx)
 {
@@ -166,9 +206,11 @@ static int __init psci_dt_cpu_init_idle(struct cpuidle_driver *drv,
 		 * selection of a shared state for the domain, assumes the
 		 * domain states are all deeper states.
 		 */
-		if (data->dev)
+		if (data->dev) {
 			drv->states[state_count - 1].enter =
 				psci_enter_domain_idle_state;
+			psci_cpuidle_use_cpuhp = true;
+		}
 	}
 
 	/* Idle states parsed correctly, store them in the per-cpu struct. */
@@ -289,6 +331,7 @@ static int __init psci_idle_init(void)
 			goto out_fail;
 	}
 
+	psci_idle_init_cpuhp();
 	return 0;
 
 out_fail:
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index e51ee772b9f5..01f04ed6ad92 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -95,6 +95,7 @@ enum cpuhp_state {
 	CPUHP_AP_OFFLINE,
 	CPUHP_AP_SCHED_STARTING,
 	CPUHP_AP_RCUTREE_DYING,
+	CPUHP_AP_CPU_PM_STARTING,
 	CPUHP_AP_IRQ_GIC_STARTING,
 	CPUHP_AP_IRQ_HIP04_STARTING,
 	CPUHP_AP_IRQ_ARMADA_XP_STARTING,
-- 
2.17.1

