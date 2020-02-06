Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0423415454A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 14:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgBFNrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 08:47:20 -0500
Received: from foss.arm.com ([217.140.110.172]:58610 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727361AbgBFNrU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 08:47:20 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D3A131B;
        Thu,  6 Feb 2020 05:47:18 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.48])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3324C3F52E;
        Thu,  6 Feb 2020 05:47:04 -0800 (PST)
From:   lukasz.luba@arm.com
To:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Morten.Rasmussen@arm.com, Dietmar.Eggemann@arm.com,
        Chris.Redpath@arm.com, ionela.voinescu@arm.com,
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
        patrick.bellasi@matbug.net
Subject: [PATCH v2 1/4] PM / EM: add devices to Energy Model
Date:   Thu,  6 Feb 2020 13:46:37 +0000
Message-Id: <20200206134640.11367-2-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206134640.11367-1-lukasz.luba@arm.com>
References: <20200206134640.11367-1-lukasz.luba@arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Lukasz Luba <lukasz.luba@arm.com>

Add support of other devices into the Energy Model framework not only the
CPUs. Change the interface to be more unified which can handle other
devices as well.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 Documentation/power/energy-model.rst | 129 +++++----
 drivers/cpufreq/scmi-cpufreq.c       |  11 +-
 drivers/opp/of.c                     |   9 +-
 drivers/thermal/cpufreq_cooling.c    |  10 +-
 include/linux/energy_model.h         | 108 +++++---
 kernel/power/energy_model.c          | 399 +++++++++++++++++++++------
 kernel/sched/sched.h                 |   2 +-
 kernel/sched/topology.c              |   4 +-
 8 files changed, 469 insertions(+), 203 deletions(-)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index 90a345d57ae9..03ddb4dcd07e 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -1,15 +1,17 @@
-====================
-Energy Model of CPUs
-====================
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+Energy Model of devices
+=======================
 
 1. Overview
 -----------
 
 The Energy Model (EM) framework serves as an interface between drivers knowing
-the power consumed by CPUs at various performance levels, and the kernel
+the power consumed by devices at various performance levels, and the kernel
 subsystems willing to use that information to make energy-aware decisions.
 
-The source of the information about the power consumed by CPUs can vary greatly
+The source of the information about the power consumed by devices can vary greatly
 from one platform to another. These power costs can be estimated using
 devicetree data in some cases. In others, the firmware will know better.
 Alternatively, userspace might be best positioned. And so on. In order to avoid
@@ -26,7 +28,7 @@ framework, and interested clients reading the data from it::
        | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
        +---------------+  +-----------------+  +---------------+
                |                   | em_pd_energy()    |
-               |                   | em_cpu_get()      |
+               |  em_get_pd()      | em_cpu_get()      |
                +---------+         |         +---------+
                          |         |         |
                          v         v         v
@@ -47,12 +49,12 @@ framework, and interested clients reading the data from it::
         | Device Tree  |   |   Firmware    |  |      ?       |
         +--------------+   +---------------+  +--------------+
 
-The EM framework manages power cost tables per 'performance domain' in the
-system. A performance domain is a group of CPUs whose performance is scaled
-together. Performance domains generally have a 1-to-1 mapping with CPUFreq
-policies. All CPUs in a performance domain are required to have the same
-micro-architecture. CPUs in different performance domains can have different
-micro-architectures.
+In case of CPU devices the EM framework manages power cost tables per
+'performance domain' in the system. A performance domain is a group of CPUs
+whose performance is scaled together. Performance domains generally have a
+1-to-1 mapping with CPUFreq policies. All CPUs in a performance domain are
+required to have the same micro-architecture. CPUs in different performance
+domains can have different micro-architectures.
 
 
 2. Core APIs
@@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
 Drivers are expected to register performance domains into the EM framework by
 calling the following API::
 
-  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-			      struct em_data_callback *cb);
+  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+		struct em_data_callback *cb, cpumask_t *cpus);
 
-Drivers must specify the CPUs of the performance domains using the cpumask
+Drivers must specify the device pointer of the performance domains as first
 argument, and provide a callback function returning <frequency, power> tuples
-for each capacity state. The callback function provided by the driver is free
+for each performance state. The callback function provided by the driver is free
 to fetch data from any relevant location (DT, firmware, ...), and by any mean
-deemed necessary. See Section 3. for an example of driver implementing this
+deemed necessary. For other devices than CPUs the last argumant must be set to
+NULL. Only for CPUfreq drivers it is obligatory to specify the cpumask.
+See Section 3. for an example of driver implementing this
 callback, and kernel/power/energy_model.c for further documentation on this
 API.
 
@@ -85,13 +89,20 @@ API.
 2.3 Accessing performance domains
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+There is two API functions which provide the access to the energy model:
+em_cpu_get() which takes CPU id as an argument and em_get_pd() with device
+pointer as an argument. It depends on the subsystem which interface it is
+going to use, but in case of CPU devices both functions return the same
+performance domain.
+
 Subsystems interested in the energy model of a CPU can retrieve it using the
 em_cpu_get() API. The energy model tables are allocated once upon creation of
 the performance domains, and kept in memory untouched.
 
 The energy consumed by a performance domain can be estimated using the
 em_pd_energy() API. The estimation is performed assuming that the schedutil
-CPUfreq governor is in use.
+CPUfreq governor is in use in case of CPU device. Currently this calculation is
+not provided for other type of devices.
 
 More details about the above APIs can be found in include/linux/energy_model.h.
 
@@ -106,42 +117,46 @@ EM framework::
 
   -> drivers/cpufreq/foo_cpufreq.c
 
-  01	static int est_power(unsigned long *mW, unsigned long *KHz, int cpu)
-  02	{
-  03		long freq, power;
-  04
-  05		/* Use the 'foo' protocol to ceil the frequency */
-  06		freq = foo_get_freq_ceil(cpu, *KHz);
-  07		if (freq < 0);
-  08			return freq;
-  09
-  10		/* Estimate the power cost for the CPU at the relevant freq. */
-  11		power = foo_estimate_power(cpu, freq);
-  12		if (power < 0);
-  13			return power;
-  14
-  15		/* Return the values to the EM framework */
-  16		*mW = power;
-  17		*KHz = freq;
-  18
-  19		return 0;
-  20	}
-  21
-  22	static int foo_cpufreq_init(struct cpufreq_policy *policy)
-  23	{
-  24		struct em_data_callback em_cb = EM_DATA_CB(est_power);
-  25		int nr_opp, ret;
-  26
-  27		/* Do the actual CPUFreq init work ... */
-  28		ret = do_foo_cpufreq_init(policy);
-  29		if (ret)
-  30			return ret;
-  31
-  32		/* Find the number of OPPs for this policy */
-  33		nr_opp = foo_get_nr_opp(policy);
-  34
-  35		/* And register the new performance domain */
-  36		em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
-  37
-  38	        return 0;
-  39	}
+  01	static int est_power(unsigned long *mW, unsigned long *KHz,
+  02			struct device *dev)
+  03	{
+  04		long freq, power;
+  05
+  06		/* Use the 'foo' protocol to ceil the frequency */
+  07		freq = foo_get_freq_ceil(dev, *KHz);
+  08		if (freq < 0);
+  09			return freq;
+  10
+  11		/* Estimate the power cost for the dev at the relevant freq. */
+  12		power = foo_estimate_power(dev, freq);
+  13		if (power < 0);
+  14			return power;
+  15
+  16		/* Return the values to the EM framework */
+  17		*mW = power;
+  18		*KHz = freq;
+  19
+  20		return 0;
+  21	}
+  22
+  23	static int foo_cpufreq_init(struct cpufreq_policy *policy)
+  24	{
+  25		struct em_data_callback em_cb = EM_DATA_CB(est_power);
+  26		struct device *cpu_dev;
+  27		int nr_opp, ret;
+  28
+  29		cpu_dev = get_cpu_device(cpumask_first(policy->cpus));
+  30
+  31     	/* Do the actual CPUFreq init work ... */
+  32     	ret = do_foo_cpufreq_init(policy);
+  33     	if (ret)
+  34     		return ret;
+  35
+  36     	/* Find the number of OPPs for this policy */
+  37     	nr_opp = foo_get_nr_opp(policy);
+  38
+  39     	/* And register the new performance domain */
+  40     	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
+  41
+  42	        return 0;
+  43	}
diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index 61623e2ff149..10172aa9ce3e 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -103,17 +103,12 @@ scmi_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask)
 }
 
 static int __maybe_unused
-scmi_get_cpu_power(unsigned long *power, unsigned long *KHz, int cpu)
+scmi_get_cpu_power(unsigned long *power, unsigned long *KHz,
+		   struct device *cpu_dev)
 {
-	struct device *cpu_dev = get_cpu_device(cpu);
 	unsigned long Hz;
 	int ret, domain;
 
-	if (!cpu_dev) {
-		pr_err("failed to get cpu%d device\n", cpu);
-		return -ENODEV;
-	}
-
 	domain = handle->perf_ops->device_domain_id(cpu_dev);
 	if (domain < 0)
 		return domain;
@@ -200,7 +195,7 @@ static int scmi_cpufreq_init(struct cpufreq_policy *policy)
 
 	policy->fast_switch_possible = true;
 
-	em_register_perf_domain(policy->cpus, nr_opp, &em_cb);
+	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, policy->cpus);
 
 	return 0;
 
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index 9cd8f0adacae..0efd6cf6d023 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -1047,9 +1047,8 @@ EXPORT_SYMBOL_GPL(dev_pm_opp_get_of_node);
  * calculation failed because of missing parameters, 0 otherwise.
  */
 static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
-					 int cpu)
+					 struct device *cpu_dev)
 {
-	struct device *cpu_dev;
 	struct dev_pm_opp *opp;
 	struct device_node *np;
 	unsigned long mV, Hz;
@@ -1057,10 +1056,6 @@ static int __maybe_unused _get_cpu_power(unsigned long *mW, unsigned long *kHz,
 	u64 tmp;
 	int ret;
 
-	cpu_dev = get_cpu_device(cpu);
-	if (!cpu_dev)
-		return -ENODEV;
-
 	np = of_node_get(cpu_dev->of_node);
 	if (!np)
 		return -EINVAL;
@@ -1128,6 +1123,6 @@ void dev_pm_opp_of_register_em(struct cpumask *cpus)
 	if (ret || !cap)
 		return;
 
-	em_register_perf_domain(cpus, nr_opp, &em_cb);
+	em_register_perf_domain(cpu_dev, nr_opp, &em_cb, cpus);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_of_register_em);
diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index fe83d7a210d4..fcf2dab1b3b8 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -333,18 +333,18 @@ static inline bool em_is_sane(struct cpufreq_cooling_device *cpufreq_cdev,
 		return false;
 
 	policy = cpufreq_cdev->policy;
-	if (!cpumask_equal(policy->related_cpus, to_cpumask(em->cpus))) {
+	if (!cpumask_equal(policy->related_cpus, em_span_cpus(em))) {
 		pr_err("The span of pd %*pbl is misaligned with cpufreq policy %*pbl\n",
-			cpumask_pr_args(to_cpumask(em->cpus)),
+			cpumask_pr_args(em_span_cpus(em)),
 			cpumask_pr_args(policy->related_cpus));
 		return false;
 	}
 
 	nr_levels = cpufreq_cdev->max_level + 1;
-	if (em->nr_cap_states != nr_levels) {
+	if (em->nr_perf_states != nr_levels) {
 		pr_err("The number of cap states in pd %*pbl (%u) doesn't match the number of cooling levels (%u)\n",
-			cpumask_pr_args(to_cpumask(em->cpus)),
-			em->nr_cap_states, nr_levels);
+			cpumask_pr_args(em_span_cpus(em)),
+			em->nr_perf_states, nr_levels);
 		return false;
 	}
 
diff --git a/include/linux/energy_model.h b/include/linux/energy_model.h
index d249b88a4d5a..6f5fd42538c5 100644
--- a/include/linux/energy_model.h
+++ b/include/linux/energy_model.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_ENERGY_MODEL_H
 #define _LINUX_ENERGY_MODEL_H
 #include <linux/cpumask.h>
+#include <linux/device.h>
 #include <linux/jump_label.h>
 #include <linux/kobject.h>
 #include <linux/rcupdate.h>
@@ -10,13 +11,15 @@
 #include <linux/types.h>
 
 /**
- * em_cap_state - Capacity state of a performance domain
- * @frequency:	The CPU frequency in KHz, for consistency with CPUFreq
- * @power:	The power consumed by 1 CPU at this level, in milli-watts
+ * em_perf_state - Performance state of a performance domain
+ * @frequency:	The frequency in KHz, for consistency with CPUFreq
+ * @power:	The power consumed at this level, in milli-watts (by 1 CPU or
+		by a registered device). It can be a total power: static and
+		dynamic.
  * @cost:	The cost coefficient associated with this level, used during
  *		energy calculation. Equal to: power * max_frequency / frequency
  */
-struct em_cap_state {
+struct em_perf_state {
 	unsigned long frequency;
 	unsigned long power;
 	unsigned long cost;
@@ -24,51 +27,65 @@ struct em_cap_state {
 
 /**
  * em_perf_domain - Performance domain
- * @table:		List of capacity states, in ascending order
- * @nr_cap_states:	Number of capacity states
- * @cpus:		Cpumask covering the CPUs of the domain
+ * @table:		List of performance states, in ascending order
+ * @nr_perf_states:	Number of performance states
+ * @priv:		In case of EM for CPU device it is a Cpumask
+ *			covering the CPUs of the domain
  *
- * A "performance domain" represents a group of CPUs whose performance is
- * scaled together. All CPUs of a performance domain must have the same
- * micro-architecture. Performance domains often have a 1-to-1 mapping with
- * CPUFreq policies.
+ * In case of CPU device, a "performance domain" represents a group of CPUs
+ * whose performance is scaled together. All CPUs of a performance domain
+ * must have the same micro-architecture. Performance domains often have
+ * a 1-to-1 mapping with CPUFreq policies.
+ * In case of other devices the 'priv' field is unused.
  */
 struct em_perf_domain {
-	struct em_cap_state *table;
-	int nr_cap_states;
-	unsigned long cpus[0];
+	struct em_perf_state *table;
+	int nr_perf_states;
+	void *priv;
 };
 
+#define em_span_cpus(em) ((struct cpumask *)(em)->priv)
+
 #ifdef CONFIG_ENERGY_MODEL
-#define EM_CPU_MAX_POWER 0xFFFF
+#define EM_MAX_POWER 0xFFFF
 
 struct em_data_callback {
 	/**
-	 * active_power() - Provide power at the next capacity state of a CPU
-	 * @power	: Active power at the capacity state in mW (modified)
-	 * @freq	: Frequency at the capacity state in kHz (modified)
-	 * @cpu		: CPU for which we do this operation
+	 * active_power() - Provide power at the next performance state of a
+	 *		    device
+	 * @power	: Active power at the performance state in mW (modified)
+	 * @freq	: Frequency at the performance state in kHz (modified)
+	 * @dev		: Device for which we do this operation (can be a CPU)
 	 *
-	 * active_power() must find the lowest capacity state of 'cpu' above
+	 * active_power() must find the lowest performance state of 'dev' above
 	 * 'freq' and update 'power' and 'freq' to the matching active power
 	 * and frequency.
 	 *
-	 * The power is the one of a single CPU in the domain, expressed in
-	 * milli-watts. It is expected to fit in the [0, EM_CPU_MAX_POWER]
-	 * range.
+	 * In case of CPUs, the power is the one of a single CPU in the domain,
+	 * expressed in milli-watts. It is expected to fit in the
+	 * [0, EM_MAX_POWER] range.
 	 *
 	 * Return 0 on success.
 	 */
-	int (*active_power)(unsigned long *power, unsigned long *freq, int cpu);
+	int (*active_power)(unsigned long *power, unsigned long *freq,
+			    struct device *dev);
 };
 #define EM_DATA_CB(_active_power_cb) { .active_power = &_active_power_cb }
 
 struct em_perf_domain *em_cpu_get(int cpu);
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb);
+struct em_perf_domain *em_get_pd(struct device *dev);
+int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+			struct em_data_callback *cb, cpumask_t *span);
+void em_unregister_perf_domain(struct device *dev);
+
+static inline bool _is_cpu_em(struct em_perf_domain *pd)
+{
+	return pd->priv ? true : false;
+}
 
 /**
- * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
+ * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf.
+			domain
  * @pd		: performance domain for which energy has to be estimated
  * @max_util	: highest utilization among CPUs of the domain
  * @sum_util	: sum of the utilization of all CPUs in the domain
@@ -80,24 +97,28 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 				unsigned long max_util, unsigned long sum_util)
 {
 	unsigned long freq, scale_cpu;
-	struct em_cap_state *cs;
+	struct em_perf_state *cs;
 	int i, cpu;
 
+	/* Currently it does not support other devices than CPUs */
+	if (unlikely(!_is_cpu_em(pd)))
+		return 0;
+
 	/*
 	 * In order to predict the capacity state, map the utilization of the
 	 * most utilized CPU of the performance domain to a requested frequency,
 	 * like schedutil.
 	 */
-	cpu = cpumask_first(to_cpumask(pd->cpus));
+	cpu = cpumask_first(em_span_cpus(pd));
 	scale_cpu = arch_scale_cpu_capacity(cpu);
-	cs = &pd->table[pd->nr_cap_states - 1];
+	cs = &pd->table[pd->nr_perf_states - 1];
 	freq = map_util_freq(max_util, cs->frequency, scale_cpu);
 
 	/*
 	 * Find the lowest capacity state of the Energy Model above the
 	 * requested frequency.
 	 */
-	for (i = 0; i < pd->nr_cap_states; i++) {
+	for (i = 0; i < pd->nr_perf_states; i++) {
 		cs = &pd->table[i];
 		if (cs->frequency >= freq)
 			break;
@@ -133,7 +154,7 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 	 *   cpu_nrg = ------------------------ * ---------          (3)
 	 *                    cs->freq            scale_cpu
 	 *
-	 * The first term is static, and is stored in the em_cap_state struct
+	 * The first term is static, and is stored in the em_perf_state struct
 	 * as 'cs->cost'.
 	 *
 	 * Since all CPUs of the domain have the same micro-architecture, they
@@ -149,35 +170,44 @@ static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 }
 
 /**
- * em_pd_nr_cap_states() - Get the number of capacity states of a perf. domain
+ * em_pd_nr_perf_states() - Get the number of performance states of a
+		performance domain
  * @pd		: performance domain for which this must be done
  *
- * Return: the number of capacity states in the performance domain table
+ * Return: the number of performance states in the performance domain table
  */
-static inline int em_pd_nr_cap_states(struct em_perf_domain *pd)
+static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
-	return pd->nr_cap_states;
+	return pd->nr_perf_states;
 }
 
 #else
 struct em_data_callback {};
 #define EM_DATA_CB(_active_power_cb) { }
 
-static inline int em_register_perf_domain(cpumask_t *span,
-			unsigned int nr_states, struct em_data_callback *cb)
+static inline int em_register_perf_domain(struct device *dev,
+			unsigned int nr_states,	struct em_data_callback *cb,
+			cpumask_t *span)
 {
 	return -EINVAL;
 }
+static inline void em_unregister_perf_domain(struct device *dev)
+{
+}
 static inline struct em_perf_domain *em_cpu_get(int cpu)
 {
 	return NULL;
 }
+static inline struct em_perf_domain *em_get_pd(struct device *dev)
+{
+	return NULL;
+}
 static inline unsigned long em_pd_energy(struct em_perf_domain *pd,
 			unsigned long max_util, unsigned long sum_util)
 {
 	return 0;
 }
-static inline int em_pd_nr_cap_states(struct em_perf_domain *pd)
+static inline int em_pd_nr_perf_states(struct em_perf_domain *pd)
 {
 	return 0;
 }
diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index 0a9326f5f421..2d3735369967 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -2,8 +2,9 @@
 /*
  * Energy Model of CPUs
  *
- * Copyright (c) 2018, Arm ltd.
+ * Copyright (c) 2018-2020, Arm ltd.
  * Written by: Quentin Perret, Arm ltd.
+ * Improvements provided by: Lukasz Luba, Arm ltd.
  */
 
 #define pr_fmt(fmt) "energy_model: " fmt
@@ -12,22 +13,44 @@
 #include <linux/cpumask.h>
 #include <linux/debugfs.h>
 #include <linux/energy_model.h>
+#include <linux/idr.h>
 #include <linux/sched/topology.h>
 #include <linux/slab.h>
 
-/* Mapping of each CPU to the performance domain to which it belongs. */
-static DEFINE_PER_CPU(struct em_perf_domain *, em_data);
+/**
+ * em_device - Performance domain wrapper for device
+ * @em_pd:		Performance domain which carries the energy model
+ * @dev:		Device for which this performance domain is set
+ * @id:			Id of this performance domain
+ * @em_dev_list:	List entry to connect all the devices perf. domains
+ * @debug_dir:		Optional debug directory
+ *
+ * Internal structure. It contains a "performance domain" and the corresponding
+ * device.
+ */
+struct em_device {
+	struct em_perf_domain *em_pd;
+	struct device *dev;
+	int id;
+	struct list_head em_dev_list;
+#ifdef CONFIG_DEBUG_FS
+	struct dentry *debug_dir;
+#endif
+};
 
+static DEFINE_IDA(em_dev_ida);
 /*
  * Mutex serializing the registrations of performance domains and letting
  * callbacks defined by drivers sleep.
  */
 static DEFINE_MUTEX(em_pd_mutex);
+/* List of devices' energy model, protected by 'em_pd_mutex' */
+static LIST_HEAD(em_pd_dev_list);
 
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *rootdir;
 
-static void em_debug_create_cs(struct em_cap_state *cs, struct dentry *pd)
+static void em_debug_create_cs(struct em_perf_state *cs, struct dentry *pd)
 {
 	struct dentry *d;
 	char name[24];
@@ -43,28 +66,72 @@ static void em_debug_create_cs(struct em_cap_state *cs, struct dentry *pd)
 
 static int em_debug_cpus_show(struct seq_file *s, void *unused)
 {
-	seq_printf(s, "%*pbl\n", cpumask_pr_args(to_cpumask(s->private)));
+	struct em_perf_domain *em_pd = s->private;
+	struct cpumask *mask = em_span_cpus(em_pd);
+
+	seq_printf(s, "%*pbl\n", cpumask_pr_args(mask));
 
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
 
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu)
+static int em_debug_dev_show(struct seq_file *s, void *unused)
+{
+	struct em_device *em_dev = s->private;
+	const char *domain_name;
+
+	domain_name = dev_name(em_dev->dev);
+	if (!domain_name)
+		domain_name = "unknown";
+
+	seq_printf(s, "%s\n", domain_name);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(em_debug_dev);
+
+static int em_debug_type_show(struct seq_file *s, void *unused)
+{
+	struct em_perf_domain *em_pd = s->private;
+
+	if (_is_cpu_em(em_pd))
+		seq_puts(s, "EM cpufreq device\n");
+	else
+		seq_puts(s, "EM devfreq device\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(em_debug_type);
+
+static void em_debug_create_pd(struct em_device *em_dev)
 {
+	struct em_perf_domain *em_pd = em_dev->em_pd;
 	struct dentry *d;
 	char name[8];
 	int i;
 
-	snprintf(name, sizeof(name), "pd%d", cpu);
+	snprintf(name, sizeof(name), "pd%d", em_dev->id);
 
 	/* Create the directory of the performance domain */
 	d = debugfs_create_dir(name, rootdir);
 
-	debugfs_create_file("cpus", 0444, d, pd->cpus, &em_debug_cpus_fops);
+	if (_is_cpu_em(em_pd))
+		debugfs_create_file("cpus", 0444, d, em_pd,
+				    &em_debug_cpus_fops);
+	else
+		debugfs_create_file("dev_name", 0444, d, em_dev,
+				    &em_debug_dev_fops);
+
+	debugfs_create_file("type", 0444, d, em_pd, &em_debug_type_fops);
 
-	/* Create a sub-directory for each capacity state */
-	for (i = 0; i < pd->nr_cap_states; i++)
-		em_debug_create_cs(&pd->table[i], d);
+	/* Create a sub-directory for each performance state */
+	for (i = 0; i < em_pd->nr_perf_states; i++)
+		em_debug_create_cs(&em_pd->table[i], d);
+}
+
+static void em_debug_remove_pd(struct em_device *em_dev)
+{
+	debugfs_remove_recursive(em_dev->debug_dir);
 }
 
 static int __init em_debug_init(void)
@@ -76,48 +143,49 @@ static int __init em_debug_init(void)
 }
 core_initcall(em_debug_init);
 #else /* CONFIG_DEBUG_FS */
-static void em_debug_create_pd(struct em_perf_domain *pd, int cpu) {}
+static void em_debug_create_pd(struct em_device *em_dev) {}
+static void em_debug_remove_pd(struct em_device *em_dev) {}
 #endif
-static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
-						struct em_data_callback *cb)
+
+static bool _is_cpu_device(struct device *dev)
+{
+	return (dev->bus == &cpu_subsys);
+}
+
+static int em_create_perf_table(struct device *dev, struct em_perf_domain *pd,
+		int nr_states, struct em_data_callback *cb)
 {
 	unsigned long opp_eff, prev_opp_eff = ULONG_MAX;
 	unsigned long power, freq, prev_freq = 0;
-	int i, ret, cpu = cpumask_first(span);
-	struct em_cap_state *table;
-	struct em_perf_domain *pd;
+	struct em_perf_state *table;
+	int i, ret;
 	u64 fmax;
 
-	if (!cb->active_power)
-		return NULL;
-
-	pd = kzalloc(sizeof(*pd) + cpumask_size(), GFP_KERNEL);
-	if (!pd)
-		return NULL;
-
 	table = kcalloc(nr_states, sizeof(*table), GFP_KERNEL);
 	if (!table)
-		goto free_pd;
+		return -ENOMEM;
 
-	/* Build the list of capacity states for this performance domain */
+	/* Build the list of performance states for this performance domain */
 	for (i = 0, freq = 0; i < nr_states; i++, freq++) {
 		/*
 		 * active_power() is a driver callback which ceils 'freq' to
-		 * lowest capacity state of 'cpu' above 'freq' and updates
+		 * lowest performance state of 'dev' above 'freq' and updates
 		 * 'power' and 'freq' accordingly.
 		 */
-		ret = cb->active_power(&power, &freq, cpu);
+		ret = cb->active_power(&power, &freq, dev);
 		if (ret) {
-			pr_err("pd%d: invalid cap. state: %d\n", cpu, ret);
+			dev_err(dev, "energy_model: invalid perf. state: %d\n",
+				ret);
 			goto free_cs_table;
 		}
 
 		/*
 		 * We expect the driver callback to increase the frequency for
-		 * higher capacity states.
+		 * higher performance states.
 		 */
 		if (freq <= prev_freq) {
-			pr_err("pd%d: non-increasing freq: %lu\n", cpu, freq);
+			dev_err(dev, "energy_model: non-increasing freq: %lu\n",
+				freq);
 			goto free_cs_table;
 		}
 
@@ -125,8 +193,9 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 * The power returned by active_state() is expected to be
 		 * positive, in milli-watts and to fit into 16 bits.
 		 */
-		if (!power || power > EM_CPU_MAX_POWER) {
-			pr_err("pd%d: invalid power: %lu\n", cpu, power);
+		if (!power || power > EM_MAX_POWER) {
+			dev_err(dev, "energy_model: invalid power: %lu\n",
+				power);
 			goto free_cs_table;
 		}
 
@@ -141,12 +210,12 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 		 */
 		opp_eff = freq / power;
 		if (opp_eff >= prev_opp_eff)
-			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_cap_state %d >= em_cap_state%d\n",
-					cpu, i, i - 1);
+			dev_warn(dev, "energy_model: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
+					i, i - 1);
 		prev_opp_eff = opp_eff;
 	}
 
-	/* Compute the cost of each capacity_state. */
+	/* Compute the cost of each performance_state. */
 	fmax = (u64) table[nr_states - 1].frequency;
 	for (i = 0; i < nr_states; i++) {
 		table[i].cost = div64_u64(fmax * table[i].power,
@@ -154,39 +223,135 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
 	}
 
 	pd->table = table;
-	pd->nr_cap_states = nr_states;
-	cpumask_copy(to_cpumask(pd->cpus), span);
-
-	em_debug_create_pd(pd, cpu);
+	pd->nr_perf_states = nr_states;
 
-	return pd;
+	return 0;
 
 free_cs_table:
 	kfree(table);
-free_pd:
-	kfree(pd);
+	return -EINVAL;
+}
+
+static struct em_perf_domain *em_create_pd(struct device *dev, int nr_states,
+						struct em_data_callback *cb)
+{
+	struct em_perf_domain *pd;
+	int ret;
+
+	pd = kzalloc(sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return NULL;
+
+	ret = em_create_perf_table(dev, pd, nr_states, cb);
+	if (ret) {
+		kfree(pd);
+		return NULL;
+	}
+
+	return pd;
+}
+
+static bool em_cpus_pd_exist(cpumask_t *span)
+{
+	struct em_device *em_dev;
+
+	/* The em_pd_mutex should be held already. */
+	if (list_empty(&em_pd_dev_list))
+		return 0;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
+		if (!_is_cpu_em(em_dev->em_pd))
+			continue;
+
+		if (cpumask_equal(span, em_span_cpus(em_dev->em_pd)))
+			return 1;
+	}
+
+	return 0;
+}
+
+static void em_destroy_pd(struct em_perf_domain *em_pd)
+{
+	kfree(em_pd->table);
+	kfree(em_pd);
+}
+
+/**
+ * em_get_pd() - Return the performance domain for a device
+ * @dev : Device to find the performance domain for
+ *
+ * Returns the performance domain to which 'dev' belongs, or NULL if it doesn't
+ * exist.
+ */
+struct em_perf_domain *em_get_pd(struct device *dev)
+{
+	struct em_device *em_dev;
 
+	if (IS_ERR_OR_NULL(dev))
+		return NULL;
+
+	if (_is_cpu_device(dev))
+		return em_cpu_get(dev->id);
+
+	mutex_lock(&em_pd_mutex);
+
+	if (list_empty(&em_pd_dev_list))
+		goto unlock;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
+		if (em_dev->dev == dev) {
+			mutex_unlock(&em_pd_mutex);
+			return em_dev->em_pd;
+		}
+	}
+
+unlock:
+	mutex_unlock(&em_pd_mutex);
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(em_get_pd);
 
 /**
  * em_cpu_get() - Return the performance domain for a CPU
  * @cpu : CPU to find the performance domain for
  *
- * Return: the performance domain to which 'cpu' belongs, or NULL if it doesn't
+ * Returns the performance domain to which 'cpu' belongs, or NULL if it doesn't
  * exist.
  */
 struct em_perf_domain *em_cpu_get(int cpu)
 {
-	return READ_ONCE(per_cpu(em_data, cpu));
+	struct em_device *em_dev;
+
+	mutex_lock(&em_pd_mutex);
+
+	if (list_empty(&em_pd_dev_list))
+		goto unlock;
+
+	list_for_each_entry(em_dev, &em_pd_dev_list, em_dev_list) {
+		if (!_is_cpu_em(em_dev->em_pd))
+			continue;
+
+		if (cpumask_test_cpu(cpu, em_span_cpus(em_dev->em_pd))) {
+			mutex_unlock(&em_pd_mutex);
+			return em_dev->em_pd;
+		}
+	}
+
+unlock:
+	mutex_unlock(&em_pd_mutex);
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(em_cpu_get);
 
 /**
- * em_register_perf_domain() - Register the Energy Model of a performance domain
- * @span	: Mask of CPUs in the performance domain
- * @nr_states	: Number of capacity states to register
+ * em_register_perf_domain() - Register the Energy Model (EM) of a performance
+ *		domain for the device
+ * @dev		: Device for which the EM is to register
+ * @nr_states	: Number of performance states to register
  * @cb		: Callback functions providing the data of the Energy Model
+ * @cpus	: Pointer to cpumask_t, which in case of a CPU device is
+ *		obligatory. It can be taken from i.e. 'policy->cpus'. For other
+ *		type of devices this should be set to NULL.
  *
  * Create Energy Model tables for a performance domain using the callbacks
  * defined in cb.
@@ -196,63 +361,129 @@ EXPORT_SYMBOL_GPL(em_cpu_get);
  *
  * Return 0 on success
  */
-int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
-						struct em_data_callback *cb)
+int em_register_perf_domain(struct device *dev, unsigned int nr_states,
+			struct em_data_callback *cb, cpumask_t *cpus)
 {
 	unsigned long cap, prev_cap = 0;
 	struct em_perf_domain *pd;
-	int cpu, ret = 0;
+	struct em_device *em_dev;
+	cpumask_t *span = NULL;
+	int cpu, ret;
 
-	if (!span || !nr_states || !cb)
+	if (!dev || !nr_states || !cb || !cb->active_power)
 		return -EINVAL;
 
-	/*
-	 * Use a mutex to serialize the registration of performance domains and
-	 * let the driver-defined callback functions sleep.
-	 */
 	mutex_lock(&em_pd_mutex);
 
-	for_each_cpu(cpu, span) {
-		/* Make sure we don't register again an existing domain. */
-		if (READ_ONCE(per_cpu(em_data, cpu))) {
-			ret = -EEXIST;
-			goto unlock;
+	if (_is_cpu_device(dev)) {
+		if (!cpus) {
+			mutex_unlock(&em_pd_mutex);
+			dev_err(dev, "energy_model: invalid CPU mask\n");
+			return -EINVAL;
 		}
 
-		/*
-		 * All CPUs of a domain must have the same micro-architecture
-		 * since they all share the same table.
-		 */
-		cap = arch_scale_cpu_capacity(cpu);
-		if (prev_cap && prev_cap != cap) {
-			pr_err("CPUs of %*pbl must have the same capacity\n",
-							cpumask_pr_args(span));
-			ret = -EINVAL;
-			goto unlock;
+		/* Make sure we don't register domain for existing CPUs */
+		if (em_cpus_pd_exist(cpus)) {
+			mutex_unlock(&em_pd_mutex);
+			return -EEXIST;
+		}
+
+		span = kzalloc(cpumask_size(), GFP_KERNEL);
+		if (!span) {
+			mutex_unlock(&em_pd_mutex);
+			return -ENOMEM;
+		}
+
+		cpumask_copy(span, cpus);
+
+		for_each_cpu(cpu, span) {
+			/*
+			 * All CPUs of a domain must have the same
+			 * micro-architecture since they all share the same
+			 * table.
+			 */
+			cap = arch_scale_cpu_capacity(cpu);
+			if (prev_cap && prev_cap != cap) {
+				pr_err("CPUs of %*pbl must have the same capacity\n",
+					cpumask_pr_args(span));
+				ret = -EINVAL;
+				goto free_cpumask;
+			}
+			prev_cap = cap;
 		}
-		prev_cap = cap;
 	}
 
-	/* Create the performance domain and add it to the Energy Model. */
-	pd = em_create_pd(span, nr_states, cb);
+	pd = em_create_pd(dev, nr_states, cb);
 	if (!pd) {
 		ret = -EINVAL;
-		goto unlock;
+		goto free_cpumask;
 	}
 
-	for_each_cpu(cpu, span) {
-		/*
-		 * The per-cpu array can be read concurrently from em_cpu_get().
-		 * The barrier enforces the ordering needed to make sure readers
-		 * can only access well formed em_perf_domain structs.
-		 */
-		smp_store_release(per_cpu_ptr(&em_data, cpu), pd);
+	if (_is_cpu_device(dev))
+		pd->priv = span;
+
+	em_dev = kzalloc(sizeof(struct em_device), GFP_KERNEL);
+	if (!em_dev) {
+		ret = -ENOMEM;
+		goto free_pd;
 	}
 
-	pr_debug("Created perf domain %*pbl\n", cpumask_pr_args(span));
-unlock:
+	em_dev->id = ida_simple_get(&em_dev_ida, 0, 0, GFP_KERNEL);
+	if (em_dev->id < 0) {
+		ret = em_dev->id;
+		goto free_em_dev;
+	}
+
+	em_dev->em_pd = pd;
+	em_dev->dev = dev;
+
+	list_add(&em_dev->em_dev_list, &em_pd_dev_list);
+
+	em_debug_create_pd(em_dev);
+	pr_debug("Created perf domain pd%d\n", em_dev->id);
+
 	mutex_unlock(&em_pd_mutex);
+	return 0;
+
+free_em_dev:
+	kfree(em_dev);
+free_pd:
+	kfree(pd);
+free_cpumask:
+	kfree(span);
 
+	mutex_unlock(&em_pd_mutex);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(em_register_perf_domain);
+
+void em_unregister_perf_domain(struct device *dev)
+{
+	struct em_device *em_dev, *tmp;
+
+	if (IS_ERR_OR_NULL(dev))
+		return;
+
+	/* We don't support freeing CPU structures in hotplug */
+	if (_is_cpu_device(dev))
+		return;
+
+	mutex_lock(&em_pd_mutex);
+
+	list_for_each_entry_safe(em_dev, tmp, &em_pd_dev_list, em_dev_list) {
+		if (em_dev->dev != dev)
+			continue;
+
+		list_del(&em_dev->em_dev_list);
+
+		em_debug_remove_pd(em_dev);
+
+		ida_simple_remove(&em_dev_ida, em_dev->id);
+
+		em_destroy_pd(em_dev->em_pd);
+		kfree(em_dev);
+	}
+
+	mutex_unlock(&em_pd_mutex);
+}
+EXPORT_SYMBOL_GPL(em_unregister_perf_domain);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 0844e81964e5..b98211d44cc7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2441,7 +2441,7 @@ unsigned long scale_irq_capacity(unsigned long util, unsigned long irq, unsigned
 
 #if defined(CONFIG_ENERGY_MODEL) && defined(CONFIG_CPU_FREQ_GOV_SCHEDUTIL)
 
-#define perf_domain_span(pd) (to_cpumask(((pd)->em_pd->cpus)))
+#define perf_domain_span(pd) ((struct cpumask *)(pd)->em_pd->priv)
 
 DECLARE_STATIC_KEY_FALSE(sched_energy_present);
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index dfb64c08a407..adc47222e23c 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -285,7 +285,7 @@ static void perf_domain_debug(const struct cpumask *cpu_map,
 		printk(KERN_CONT " pd%d:{ cpus=%*pbl nr_cstate=%d }",
 				cpumask_first(perf_domain_span(pd)),
 				cpumask_pr_args(perf_domain_span(pd)),
-				em_pd_nr_cap_states(pd->em_pd));
+				em_pd_nr_perf_states(pd->em_pd));
 		pd = pd->next;
 	}
 
@@ -390,7 +390,7 @@ static bool build_perf_domains(const struct cpumask *cpu_map)
 		 * complexity check.
 		 */
 		nr_pd++;
-		nr_cs += em_pd_nr_cap_states(pd->em_pd);
+		nr_cs += em_pd_nr_perf_states(pd->em_pd);
 	}
 
 	/* Bail out if the Energy Model complexity is too high. */
-- 
2.17.1

