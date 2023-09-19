Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F3C7A6F81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 01:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233553AbjISXgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 19:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbjISXgO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 19:36:14 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58879C9;
        Tue, 19 Sep 2023 16:36:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: alarumbe)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id AA6BB6606FC2;
        Wed, 20 Sep 2023 00:36:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695166565;
        bh=wuJ2G4H+S/3Wn40HpO6XAHkvsEDX3w7Jzd1D167S56k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U9ee7Mzr5P4lNNM62jzMHuaHMuSw08XdCoWTAta8mQZGMPSfs26g1K3sQBNam3Ff4
         qmkNbzmVvaO+z3kVM/MmvZMS1udoLSPyeaKAZmh/5PBM8w2ek8zkxxFDXfltE1KuwQ
         QmnAf+kOxcUrqKA1Urza34/UDYMqPIIWU+Qw1kw6w4rFUabyJguPJ4S/vv52nb2ZPb
         xSO++1Q/a7v+AXetwF650J3K3hby/Os4+yPaKUamU5/tgPR5Fp3XVG5xcPPB9kehmh
         Dy+Hukr4NSw0lqkFYxBlOc68I7OYYOZ+mUX6sWCSBtD0/ubpND8UnT351gzwzc4Zgs
         F6Hv8coXVSteg==
From:   =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org,
        steven.price@arm.com
Cc:     adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, healych@amazon.com,
        kernel@collabora.com,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v6 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Date:   Wed, 20 Sep 2023 00:34:50 +0100
Message-ID: <20230919233556.1458793-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The drm-stats fdinfo tags made available to user space are drm-engine,
drm-cycles, drm-max-freq and drm-curfreq, one per job slot.

This deviates from standard practice in other DRM drivers, where a single
set of key:value pairs is provided for the whole render engine. However,
Panfrost has separate queues for fragment and vertex/tiler jobs, so a
decision was made to calculate bus cycles and workload times separately.

Maximum operating frequency is calculated at devfreq initialisation time.
Current frequency is made available to user space because nvtop uses it
when performing engine usage calculations.

It is important to bear in mind that both GPU cycle and kernel time numbers
provided are at best rough estimations, and always reported in excess from
the actual figure because of two reasons:
 - Excess time because of the delay between the end of a job processing,
   the subsequent job IRQ and the actual time of the sample.
 - Time spent in the engine queue waiting for the GPU to pick up the next
   job.

To avoid race conditions during enablement/disabling, a reference counting
mechanism was introduced, and a job flag that tells us whether a given job
increased the refcount. This is necessary, because user space can toggle
cycle counting through a debugfs file, and a given job might have been in
flight by the time cycle counting was disabled.

The main goal of the debugfs cycle counter knob is letting tools like nvtop
or IGT's gputop switch it at any time, to avoid power waste in case no
engine usage measuring is necessary.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/Makefile           |  2 +
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 20 ++++++++
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
 drivers/gpu/drm/panfrost/panfrost_device.c  |  2 +
 drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
 drivers/gpu/drm/panfrost/panfrost_drv.c     | 57 ++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c     | 41 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.h     |  4 ++
 drivers/gpu/drm/panfrost/panfrost_job.c     | 24 +++++++++
 drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
 12 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h

diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
index 7da2b3f02ed9..2c01c1e7523e 100644
--- a/drivers/gpu/drm/panfrost/Makefile
+++ b/drivers/gpu/drm/panfrost/Makefile
@@ -12,4 +12,6 @@ panfrost-y := \
 	panfrost_perfcnt.o \
 	panfrost_dump.o
 
+panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
+
 obj-$(CONFIG_DRM_PANFROST) += panfrost.o
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
new file mode 100644
index 000000000000..cc14eccba206
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright 2023 Collabora ltd. */
+
+#include <linux/debugfs.h>
+#include <linux/platform_device.h>
+#include <drm/drm_debugfs.h>
+#include <drm/drm_file.h>
+#include <drm/panfrost_drm.h>
+
+#include "panfrost_device.h"
+#include "panfrost_gpu.h"
+#include "panfrost_debugfs.h"
+
+void panfrost_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
+
+	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
new file mode 100644
index 000000000000..db1c158bcf2f
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2023 Collabora ltd.
+ */
+
+#ifndef PANFROST_DEBUGFS_H
+#define PANFROST_DEBUGFS_H
+
+#ifdef CONFIG_DEBUG_FS
+void panfrost_debugfs_init(struct drm_minor *minor);
+#endif
+
+#endif  /* PANFROST_DEBUGFS_H */
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 58dfb15a8757..28caffc689e2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -58,6 +58,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
 	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
 
 	panfrost_devfreq_update_utilization(pfdevfreq);
+	pfdevfreq->current_frequency = status->current_frequency;
 
 	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
 						   pfdevfreq->idle_time));
@@ -117,6 +118,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
+	unsigned long freq = ULONG_MAX;
 
 	if (pfdev->comp->num_supplies > 1) {
 		/*
@@ -172,6 +174,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		return ret;
 	}
 
+	/* Find the fastest defined rate  */
+	opp = dev_pm_opp_find_freq_floor(dev, &freq);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	pfdevfreq->fast_rate = freq;
+
 	dev_pm_opp_put(opp);
 
 	/*
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index 1514c1f9d91c..48dbe185f206 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -19,6 +19,9 @@ struct panfrost_devfreq {
 	struct devfreq_simple_ondemand_data gov_data;
 	bool opp_of_table_added;
 
+	unsigned long current_frequency;
+	unsigned long fast_rate;
+
 	ktime_t busy_time;
 	ktime_t idle_time;
 	ktime_t time_last_update;
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index fa1a086a862b..28f7046e1b1a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -207,6 +207,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 
 	spin_lock_init(&pfdev->as_lock);
 
+	spin_lock_init(&pfdev->cycle_counter.lock);
+
 	err = panfrost_clk_init(pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "clk init failed %d\n", err);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index b0126b9fbadc..1e85656dc2f7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -107,6 +107,7 @@ struct panfrost_device {
 	struct list_head scheduled_jobs;
 
 	struct panfrost_perfcnt *perfcnt;
+	atomic_t profile_mode;
 
 	struct mutex sched_lock;
 
@@ -121,6 +122,11 @@ struct panfrost_device {
 	struct shrinker shrinker;
 
 	struct panfrost_devfreq pfdevfreq;
+
+	struct {
+		atomic_t use_count;
+		spinlock_t lock;
+	} cycle_counter;
 };
 
 struct panfrost_mmu {
@@ -135,12 +141,19 @@ struct panfrost_mmu {
 	struct list_head list;
 };
 
+struct panfrost_engine_usage {
+	unsigned long long elapsed_ns[NUM_JOB_SLOTS];
+	unsigned long long cycles[NUM_JOB_SLOTS];
+};
+
 struct panfrost_file_priv {
 	struct panfrost_device *pfdev;
 
 	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
 
 	struct panfrost_mmu *mmu;
+
+	struct panfrost_engine_usage engine_usage;
 };
 
 static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index a2ab99698ca8..3c93a11deab1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -20,6 +20,7 @@
 #include "panfrost_job.h"
 #include "panfrost_gpu.h"
 #include "panfrost_perfcnt.h"
+#include "panfrost_debugfs.h"
 
 static bool unstable_ioctls;
 module_param_unsafe(unstable_ioctls, bool, 0600);
@@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
 	job->requirements = args->requirements;
 	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
 	job->mmu = file_priv->mmu;
+	job->engine_usage = &file_priv->engine_usage;
 
 	slot = panfrost_job_get_slot(job);
 
@@ -523,7 +525,55 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
+
+static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
+				     struct panfrost_file_priv *panfrost_priv,
+				     struct drm_printer *p)
+{
+	int i;
+
+	/*
+	 * IMPORTANT NOTE: drm-cycles and drm-engine measurements are not
+	 * accurate, as they only provide a rough estimation of the number of
+	 * GPU cycles and CPU time spent in a given context. This is due to two
+	 * different factors:
+	 * - Firstly, we must consider the time the CPU and then the kernel
+	 *   takes to process the GPU interrupt, which means additional time and
+	 *   GPU cycles will be added in excess to the real figure.
+	 * - Secondly, the pipelining done by the Job Manager (2 job slots per
+	 *   engine) implies there is no way to know exactly how much time each
+	 *   job spent on the GPU.
+	 */
+
+	static const char * const engine_names[] = {
+		"fragment", "vertex-tiler", "compute-only"
+	};
+
+	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
+		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
+			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
+		drm_printf(p, "drm-cycles-%s:\t%llu\n",
+			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
+		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
+			   engine_names[i], pfdev->pfdevfreq.fast_rate);
+		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
+			   engine_names[i], pfdev->pfdevfreq.current_frequency);
+	}
+}
+
+static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_device *dev = file->minor->dev;
+	struct panfrost_device *pfdev = dev->dev_private;
+
+	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
+}
+
+static const struct file_operations panfrost_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	DRM_GEM_FOPS,
+	.show_fdinfo = drm_show_fdinfo,
+};
 
 /*
  * Panfrost driver version:
@@ -535,6 +585,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
 	.open			= panfrost_open,
 	.postclose		= panfrost_postclose,
+	.show_fdinfo		= panfrost_show_fdinfo,
 	.ioctls			= panfrost_drm_driver_ioctls,
 	.num_ioctls		= ARRAY_SIZE(panfrost_drm_driver_ioctls),
 	.fops			= &panfrost_drm_driver_fops,
@@ -546,6 +597,10 @@ static const struct drm_driver panfrost_drm_driver = {
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
+
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init		= panfrost_debugfs_init,
+#endif
 };
 
 static int panfrost_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 2faa344d89ee..f0be7e19b13e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -73,6 +73,13 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
 	gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_MASK_ALL);
 
+	/*
+	 * All in-flight jobs should have released their cycle
+	 * counter references upon reset, but let us make sure
+	 */
+	if (drm_WARN_ON(pfdev->ddev, atomic_read(&pfdev->cycle_counter.use_count) != 0))
+		atomic_set(&pfdev->cycle_counter.use_count, 0);
+
 	return 0;
 }
 
@@ -321,6 +328,40 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
 		 pfdev->features.shader_present, pfdev->features.l2_present);
 }
 
+void panfrost_cycle_counter_get(struct panfrost_device *pfdev)
+{
+	if (atomic_inc_not_zero(&pfdev->cycle_counter.use_count))
+		return;
+
+	spin_lock(&pfdev->cycle_counter.lock);
+	if (atomic_inc_return(&pfdev->cycle_counter.use_count) == 1)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_START);
+	spin_unlock(&pfdev->cycle_counter.lock);
+}
+
+void panfrost_cycle_counter_put(struct panfrost_device *pfdev)
+{
+	if (atomic_add_unless(&pfdev->cycle_counter.use_count, -1, 1))
+		return;
+
+	spin_lock(&pfdev->cycle_counter.lock);
+	if (atomic_dec_return(&pfdev->cycle_counter.use_count) == 0)
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_CYCLE_COUNT_STOP);
+	spin_unlock(&pfdev->cycle_counter.lock);
+}
+
+unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev)
+{
+	u32 hi, lo;
+
+	do {
+		hi = gpu_read(pfdev, GPU_CYCLE_COUNT_HI);
+		lo = gpu_read(pfdev, GPU_CYCLE_COUNT_LO);
+	} while (hi != gpu_read(pfdev, GPU_CYCLE_COUNT_HI));
+
+	return ((u64)hi << 32) | lo;
+}
+
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.h b/drivers/gpu/drm/panfrost/panfrost_gpu.h
index 468c51e7e46d..876fdad9f721 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.h
@@ -16,6 +16,10 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev);
 void panfrost_gpu_power_on(struct panfrost_device *pfdev);
 void panfrost_gpu_power_off(struct panfrost_device *pfdev);
 
+void panfrost_cycle_counter_get(struct panfrost_device *pfdev);
+void panfrost_cycle_counter_put(struct panfrost_device *pfdev);
+unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev);
+
 void panfrost_gpu_amlogic_quirk(struct panfrost_device *pfdev);
 
 #endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 033f5e684707..fb16de2d0420 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -159,6 +159,16 @@ panfrost_dequeue_job(struct panfrost_device *pfdev, int slot)
 	struct panfrost_job *job = pfdev->jobs[slot][0];
 
 	WARN_ON(!job);
+	if (job->is_profiled) {
+		if (job->engine_usage) {
+			job->engine_usage->elapsed_ns[slot] +=
+				ktime_to_ns(ktime_sub(ktime_get(), job->start_time));
+			job->engine_usage->cycles[slot] +=
+				panfrost_cycle_counter_read(pfdev) - job->start_cycles;
+		}
+		panfrost_cycle_counter_put(job->pfdev);
+	}
+
 	pfdev->jobs[slot][0] = pfdev->jobs[slot][1];
 	pfdev->jobs[slot][1] = NULL;
 
@@ -233,6 +243,13 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 	subslot = panfrost_enqueue_job(pfdev, js, job);
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
+		if (atomic_read(&pfdev->profile_mode)) {
+			panfrost_cycle_counter_get(pfdev);
+			job->is_profiled = true;
+			job->start_time = ktime_get();
+			job->start_cycles = panfrost_cycle_counter_read(pfdev);
+		}
+
 		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 		dev_dbg(pfdev->dev,
 			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
@@ -660,10 +677,14 @@ panfrost_reset(struct panfrost_device *pfdev,
 	 * stuck jobs. Let's make sure the PM counters stay balanced by
 	 * manually calling pm_runtime_put_noidle() and
 	 * panfrost_devfreq_record_idle() for each stuck job.
+	 * Let's also make sure the cycle counting register's refcnt is
+	 * kept balanced to prevent it from running forever
 	 */
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
+			if (pfdev->jobs[i][j]->is_profiled)
+				panfrost_cycle_counter_put(pfdev->jobs[i][j]->pfdev);
 			pm_runtime_put_noidle(pfdev->dev);
 			panfrost_devfreq_record_idle(&pfdev->pfdevfreq);
 		}
@@ -926,6 +947,9 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
 			}
 
 			job_write(pfdev, JS_COMMAND(i), cmd);
+
+			/* Jobs can outlive their file context */
+			job->engine_usage = NULL;
 		}
 	}
 	spin_unlock(&pfdev->js->job_lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 8becc1ba0eb9..17ff808dba07 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -32,6 +32,11 @@ struct panfrost_job {
 
 	/* Fence to be signaled by drm-sched once its done with the job */
 	struct dma_fence *render_done_fence;
+
+	struct panfrost_engine_usage *engine_usage;
+	bool is_profiled;
+	ktime_t start_time;
+	u64 start_cycles;
 };
 
 int panfrost_job_init(struct panfrost_device *pfdev);
-- 
2.42.0

