Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4BA01687B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 20:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbgBUTsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 14:48:16 -0500
Received: from foss.arm.com ([217.140.110.172]:46994 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgBUTsQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 14:48:16 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFFC6FEC;
        Fri, 21 Feb 2020 11:48:15 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.243])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 35F9F3F703;
        Fri, 21 Feb 2020 11:48:04 -0800 (PST)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Morten.Rasmussen@arm.com, Dietmar.Eggemann@arm.com,
        javi.merino@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, lukasz.luba@arm.com,
        patrick.bellasi@matbug.net, orjan.eide@arm.com
Subject: [PATCH v3 2/4] OPP: change parameter to device pointer in dev_pm_opp_of_register_em()
Date:   Fri, 21 Feb 2020 19:47:29 +0000
Message-Id: <20200221194731.13814-3-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200221194731.13814-1-lukasz.luba@arm.com>
References: <20200221194731.13814-1-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop the CPU specific interface with cpumask and switch to struct device.
The Energy Model framework supports both: CPUs and devfreq devices. The new
interface provides easy way to create a Energy Model (EM), which then might
be used in i.e. thermal subsystem.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 drivers/cpufreq/cpufreq-dt.c           |  2 +-
 drivers/cpufreq/imx6q-cpufreq.c        |  2 +-
 drivers/cpufreq/mediatek-cpufreq.c     |  2 +-
 drivers/cpufreq/omap-cpufreq.c         |  2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      |  2 +-
 drivers/cpufreq/scpi-cpufreq.c         |  2 +-
 drivers/cpufreq/vexpress-spc-cpufreq.c |  2 +-
 drivers/opp/of.c                       | 40 ++++++++++++++------------
 include/linux/pm_opp.h                 | 14 +++++++--
 9 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-dt.c b/drivers/cpufreq/cpufreq-dt.c
index d2b5f062a07b..bb5d43f8b775 100644
--- a/drivers/cpufreq/cpufreq-dt.c
+++ b/drivers/cpufreq/cpufreq-dt.c
@@ -275,7 +275,7 @@ static int cpufreq_init(struct cpufreq_policy *policy)
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
 
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
 
 	return 0;
 
diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 1fcbbd53a48a..af1f51f6f2b8 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -193,7 +193,7 @@ static int imx6q_cpufreq_init(struct cpufreq_policy *policy)
 	policy->clk = clks[ARM].clk;
 	cpufreq_generic_init(policy, freq_table, transition_latency);
 	policy->suspend_freq = max_freq;
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
 
 	return 0;
 }
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 0c98dd08273d..7d1212c9b7c8 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -448,7 +448,7 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
 
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(info->cpu_dev, policy->cpus);
 
 	return 0;
 }
diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 8d14b42a8c6f..3694bb030df3 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -131,7 +131,7 @@ static int omap_cpu_init(struct cpufreq_policy *policy)
 
 	/* FIXME: what's the actual transition time? */
 	cpufreq_generic_init(policy, freq_table, 300 * 1000);
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(mpu_dev, policy->cpus);
 
 	return 0;
 }
diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index fc92a8842e25..0a04b6f03b9a 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -238,7 +238,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		goto error;
 	}
 
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
 
 	policy->fast_switch_possible = true;
 
diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index 20d1f85d5f5a..b0f5388b8854 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -167,7 +167,7 @@ static int scpi_cpufreq_init(struct cpufreq_policy *policy)
 
 	policy->fast_switch_possible = false;
 
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
 
 	return 0;
 
diff --git a/drivers/cpufreq/vexpress-spc-cpufreq.c b/drivers/cpufreq/vexpress-spc-cpufreq.c
index 83c85d3d67e3..4e8b1dee7c9a 100644
--- a/drivers/cpufreq/vexpress-spc-cpufreq.c
+++ b/drivers/cpufreq/vexpress-spc-cpufreq.c
@@ -450,7 +450,7 @@ static int ve_spc_cpufreq_init(struct cpufreq_policy *policy)
 	policy->freq_table = freq_table[cur_cluster];
 	policy->cpuinfo.transition_latency = 1000000; /* 1 ms */
 
-	dev_pm_opp_of_register_em(policy->cpus);
+	dev_pm_opp_of_register_em(cpu_dev, policy->cpus);
 
 	if (is_bL_switching_enabled())
 		per_cpu(cpu_last_req_freq, policy->cpu) =
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 0efd6cf6d023..5eb43453b0ee 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1036,18 +1036,18 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_of_node);
 
 /*
  * Callback function provided to the Energy Model framework upon registration.
- * This computes the power estimated by @CPU at @kHz if it is the frequency
+ * This computes the power estimated by @dev at @kHz if it is the frequency
  * of an existing OPP, or at the frequency of the first OPP above @kHz otherwise
  * (see dev_pm_opp_find_freq_ceil()). This function updates @kHz to the ceiled
  * frequency and @mW to the associated power. The power is estimated as
- * P = C * V^2 * f with C being the CPU's capacitance and V and f respectively
- * the voltage and frequency of the OPP.
+ * P = C * V^2 * f with C being the device's capacitance and V and f
+ * respectively the voltage and frequency of the OPP.
  *
- * Returns -ENODEV if the CPU device cannot be found, -EINVAL if the power
- * calculation failed because of missing parameters, 0 otherwise.
+ * Returns -EINVAL if the power calculation failed because of missing
+ * parameters, 0 otherwise.
  */
-static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
-					 struct device *cpu_dev)
+static int __maybe_unused _get_power(unsigned long *mW, unsigned long *kHz,
+				     struct device *dev)
 {
 	struct dev_pm_opp *opp;
 	struct device_node *np;
@@ -1056,7 +1056,7 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
 	u64 tmp;
 	int ret;
 
-	np = of_node_get(cpu_dev->of_node);
+	np = of_node_get(dev->of_node);
 	if (!np)
 		return -EINVAL;
 
@@ -1066,7 +1066,7 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
 		return -EINVAL;
 
 	Hz = *kHz * 1000;
-	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &Hz);
+	opp = dev_pm_opp_find_freq_ceil(dev, &Hz);
 	if (IS_ERR(opp))
 		return -EINVAL;
 
@@ -1086,28 +1086,30 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
 
 /**
  * dev_pm_opp_of_register_em() - Attempt to register an Energy Model
- * @cpus	: CPUs for which an Energy Model has to be registered
+ * @dev		: Device for which an Energy Model has to be registered
+ * @cpus	: CPUs for which an Energy Model has to be registered. For
+ *		other type of devices it should be set to NULL.
  *
  * This checks whether the "dynamic-power-coefficient" devicetree property has
  * been specified, and tries to register an Energy Model with it if it has.
+ * Having this property means the voltages are known for OPPs and the EM
+ * might be calculated.
  */
-void dev_pm_opp_of_register_em(struct cpumask *cpus)
+void dev_pm_opp_of_register_em(struct device *dev, struct cpumask *cpus)
 {
-	struct em_data_callback em_cb = EM_DATA_CB(_get_cpu_power);
-	int ret, nr_opp, cpu = cpumask_first(cpus);
-	struct device *cpu_dev;
+	struct em_data_callback em_cb = EM_DATA_CB(_get_power);
 	struct device_node *np;
+	int ret, nr_opp;
 	u32 cap;
 
-	cpu_dev = get_cpu_device(cpu);
-	if (!cpu_dev)
+	if (!dev)
 		return;
 
-	nr_opp = dev_pm_opp_get_opp_count(cpu_dev);
+	nr_opp = dev_pm_opp_get_opp_count(dev);
 	if (nr_opp <= 0)
 		return;
 
-	np = of_node_get(cpu_dev->of_node);
+	np = of_node_get(dev->of_node);
 	if (!np)
 		return;
 
@@ -1123,6 +1125,6 @@ void dev_pm_opp_of_register_em(struct cpumask *cpus)
 	if (ret || !cap)
 		return;
 
-	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, cpus);
+	em_register_perf_domain(dev, nr_opp, &em_cb, cpus);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_register_em);
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 747861816f4f..65099de79d0c 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_OPP_H__
 #define __LINUX_OPP_H__
 
+#include <linux/energy_model.h>
 #include <linux/err.h>
 #include <linux/notifier.h>
 
@@ -360,7 +361,11 @@ int dev_pm_opp_of_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpuma
 struct device_node *dev_pm_opp_of_get_opp_desc_node(struct device *dev);
 struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp);
 int of_get_required_opp_performance_state(struct device_node *np, int index);
-void dev_pm_opp_of_register_em(struct cpumask *cpus);
+void dev_pm_opp_of_register_em(struct device *dev, struct cpumask *cpus);
+static inline void dev_pm_opp_of_unregister_em(struct device *dev)
+{
+	em_unregister_perf_domain(dev);
+}
 #else
 static inline int dev_pm_opp_of_add_table(struct device *dev)
 {
@@ -400,7 +405,12 @@ static inline struct device_node *dev_pm_opp_get_of_node(struct dev_pm_opp *opp)
 	return NULL;
 }
 
-static inline void dev_pm_opp_of_register_em(struct cpumask *cpus)
+static inline void dev_pm_opp_of_register_em(struct device *dev,
+					     struct cpumask *cpus)
+{
+}
+
+static inline void dev_pm_opp_of_unregister_em(struct device *dev)
 {
 }
 
-- 
2.17.1

