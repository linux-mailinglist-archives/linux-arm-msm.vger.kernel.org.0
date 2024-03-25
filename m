Return-Path: <linux-arm-msm+bounces-15088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6F88AEF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 19:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86E91C3E3DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A6C82C8E;
	Mon, 25 Mar 2024 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTnNRbZX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B2682877;
	Mon, 25 Mar 2024 18:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711392128; cv=none; b=mr7kbJYdOQ89C+eKI/XxP+lnQysKleq55T2Hj/fGdhCSzBiThso5wUgSMuoODalO8HSNDlYBA5twFC4IXF1eXpHlmFRJ/QvFpdWoe0+5f4MXW4aPe6RYVQIIHRMfbNaUNWy3G40RGjly5c2PYtxRQRO3fY2G15ExvMesBiJtlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711392128; c=relaxed/simple;
	bh=aTu2asIElaRdb4QxsCXZ4o7Pe1q68Vn7cE6WY+AADfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XZkvzKGWdIPeSemics0Q3SEFXRHvJHCN9eZsLxp+254SLcdCVBBItAar1dRsFSfAOwk4JA8pvsxwosr/OmKig74VlEYobc1rKhzMcMpW4Ja1nf7z9vHnScmCMzEO9UtgQujDxGWnon3amY8FiTIubJ0w4P48fInzEJcJ5v8snlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTnNRbZX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB1DC433C7;
	Mon, 25 Mar 2024 18:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711392127;
	bh=aTu2asIElaRdb4QxsCXZ4o7Pe1q68Vn7cE6WY+AADfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BTnNRbZXpM//sXknn99T57DSchl139kWCpTyUOweYei//kk0SVaTpeQG8UYPAvT7V
	 c8R0iXkrekkco5nzMVpKPoIYc9H5oI+sjniL0FSxfhB0nE5LnRKapGp6rn0qeZ975l
	 MKU4YTDTdiAU+5RU+2kkC+XOX77tb+mRf7FGaA366y4gU68AFLnjJ2k50GrMlKEj/E
	 IMxjCPOCJXza/wSsiUTM+PrGCwaQX0ygk7DS41O0E+GRnHxdPaJCGVhosCyK8Sip6Y
	 QCibWo4bRyyq6Zw8vIJSyQcXD8Xsw/dgB7hJf/Fz3pUn5VGHviVMWl7LKdgGRnUJW/
	 VFQI6/7yqblMg==
From: Stephen Boyd <sboyd@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 4/5] clk: Get runtime PM before walking tree during disable_unused
Date: Mon, 25 Mar 2024 11:41:58 -0700
Message-ID: <20240325184204.745706-5-sboyd@kernel.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240325184204.745706-1-sboyd@kernel.org>
References: <20240325184204.745706-1-sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Doug reported [1] the following hung task:

 INFO: task swapper/0:1 blocked for more than 122 seconds.
       Not tainted 5.15.149-21875-gf795ebc40eb8 #1
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 task:swapper/0       state:D stack:    0 pid:    1 ppid:     0 flags:0x00000008
 Call trace:
  __switch_to+0xf4/0x1f4
  __schedule+0x418/0xb80
  schedule+0x5c/0x10c
  rpm_resume+0xe0/0x52c
  rpm_resume+0x178/0x52c
  __pm_runtime_resume+0x58/0x98
  clk_pm_runtime_get+0x30/0xb0
  clk_disable_unused_subtree+0x58/0x208
  clk_disable_unused_subtree+0x38/0x208
  clk_disable_unused_subtree+0x38/0x208
  clk_disable_unused_subtree+0x38/0x208
  clk_disable_unused_subtree+0x38/0x208
  clk_disable_unused+0x4c/0xe4
  do_one_initcall+0xcc/0x2d8
  do_initcall_level+0xa4/0x148
  do_initcalls+0x5c/0x9c
  do_basic_setup+0x24/0x30
  kernel_init_freeable+0xec/0x164
  kernel_init+0x28/0x120
  ret_from_fork+0x10/0x20
 INFO: task kworker/u16:0:9 blocked for more than 122 seconds.
       Not tainted 5.15.149-21875-gf795ebc40eb8 #1
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 task:kworker/u16:0   state:D stack:    0 pid:    9 ppid:     2 flags:0x00000008
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  __switch_to+0xf4/0x1f4
  __schedule+0x418/0xb80
  schedule+0x5c/0x10c
  schedule_preempt_disabled+0x2c/0x48
  __mutex_lock+0x238/0x488
  __mutex_lock_slowpath+0x1c/0x28
  mutex_lock+0x50/0x74
  clk_prepare_lock+0x7c/0x9c
  clk_core_prepare_lock+0x20/0x44
  clk_prepare+0x24/0x30
  clk_bulk_prepare+0x40/0xb0
  mdss_runtime_resume+0x54/0x1c8
  pm_generic_runtime_resume+0x30/0x44
  __genpd_runtime_resume+0x68/0x7c
  genpd_runtime_resume+0x108/0x1f4
  __rpm_callback+0x84/0x144
  rpm_callback+0x30/0x88
  rpm_resume+0x1f4/0x52c
  rpm_resume+0x178/0x52c
  __pm_runtime_resume+0x58/0x98
  __device_attach+0xe0/0x170
  device_initial_probe+0x1c/0x28
  bus_probe_device+0x3c/0x9c
  device_add+0x644/0x814
  mipi_dsi_device_register_full+0xe4/0x170
  devm_mipi_dsi_device_register_full+0x28/0x70
  ti_sn_bridge_probe+0x1dc/0x2c0
  auxiliary_bus_probe+0x4c/0x94
  really_probe+0xcc/0x2c8
  __driver_probe_device+0xa8/0x130
  driver_probe_device+0x48/0x110
  __device_attach_driver+0xa4/0xcc
  bus_for_each_drv+0x8c/0xd8
  __device_attach+0xf8/0x170
  device_initial_probe+0x1c/0x28
  bus_probe_device+0x3c/0x9c
  deferred_probe_work_func+0x9c/0xd8
  process_one_work+0x148/0x518
  worker_thread+0x138/0x350
  kthread+0x138/0x1e0
  ret_from_fork+0x10/0x20

The first thread is walking the clk tree and calling
clk_pm_runtime_get() to power on devices required to read the clk
hardware via struct clk_ops::is_enabled(). This thread holds the clk
prepare_lock, and is trying to runtime PM resume a device, when it finds
that the device is in the process of resuming so the thread schedule()s
away waiting for the device to finish resuming before continuing. The
second thread is runtime PM resuming the same device, but the runtime
resume callback is calling clk_prepare(), trying to grab the
prepare_lock waiting on the first thread.

This is a classic ABBA deadlock. To properly fix the deadlock, we must
never runtime PM resume or suspend a device with the clk prepare_lock
held. Actually doing that is near impossible today because the global
prepare_lock would have to be dropped in the middle of the tree, the
device runtime PM resumed/suspended, and then the prepare_lock grabbed
again to ensure consistency of the clk tree topology. If anything
changes with the clk tree in the meantime, we've lost and will need to
start the operation all over again.

Luckily, most of the time we're simply incrementing or decrementing the
runtime PM count on an active device, so we don't have the chance to
schedule away with the prepare_lock held. Let's fix this immediate
problem that can be triggered more easily by simply booting on Qualcomm
sc7180.

Introduce a list of clk_core structures that have been registered, or
are in the process of being registered, that require runtime PM to
operate. Iterate this list and call clk_pm_runtime_get() on each of them
without holding the prepare_lock during clk_disable_unused(). This way
we can be certain that the runtime PM state of the devices will be
active and resumed so we can't schedule away while walking the clk tree
with the prepare_lock held. Similarly, call clk_pm_runtime_put() without
the prepare_lock held to properly drop the runtime PM reference. We
remove the calls to clk_pm_runtime_{get,put}() in this path because
they're superfluous now that we know the devices are runtime resumed.

Reported-by: Douglas Anderson <dianders@chromium.org>
Closes: https://lore.kernel.org/all/20220922084322.RFC.2.I375b6b9e0a0a5348962f004beb3dafee6a12dfbb@changeid/ [1]
Closes: https://issuetracker.google.com/328070191
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Fixes: 9a34b45397e5 ("clk: Add support for runtime PM")
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/clk.c | 117 +++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 105 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ee80b21f2824..c69de47afaba 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -37,6 +37,10 @@ static HLIST_HEAD(clk_root_list);
 static HLIST_HEAD(clk_orphan_list);
 static LIST_HEAD(clk_notifier_list);
 
+/* List of registered clks that use runtime PM */
+static HLIST_HEAD(clk_rpm_list);
+static DEFINE_MUTEX(clk_rpm_list_lock);
+
 static const struct hlist_head *all_lists[] = {
 	&clk_root_list,
 	&clk_orphan_list,
@@ -59,6 +63,7 @@ struct clk_core {
 	struct clk_hw		*hw;
 	struct module		*owner;
 	struct device		*dev;
+	struct hlist_node	rpm_node;
 	struct device_node	*of_node;
 	struct clk_core		*parent;
 	struct clk_parent_map	*parents;
@@ -122,6 +127,89 @@ static void clk_pm_runtime_put(struct clk_core *core)
 	pm_runtime_put_sync(core->dev);
 }
 
+/**
+ * clk_pm_runtime_get_all() - Runtime "get" all clk provider devices
+ *
+ * Call clk_pm_runtime_get() on all runtime PM enabled clks in the clk tree so
+ * that disabling unused clks avoids a deadlock where a device is runtime PM
+ * resuming/suspending and the runtime PM callback is trying to grab the
+ * prepare_lock for something like clk_prepare_enable() while
+ * clk_disable_unused_subtree() holds the prepare_lock and is trying to runtime
+ * PM resume/suspend the device as well.
+ *
+ * Context: Acquires the 'clk_rpm_list_lock' and returns with the lock held on
+ * success. Otherwise the lock is released on failure.
+ *
+ * Return: 0 on success, negative errno otherwise.
+ */
+static int clk_pm_runtime_get_all(void)
+{
+	int ret;
+	struct clk_core *core, *failed;
+
+	/*
+	 * Grab the list lock to prevent any new clks from being registered
+	 * or unregistered until clk_pm_runtime_put_all().
+	 */
+	mutex_lock(&clk_rpm_list_lock);
+
+	/*
+	 * Runtime PM "get" all the devices that are needed for the clks
+	 * currently registered. Do this without holding the prepare_lock, to
+	 * avoid the deadlock.
+	 */
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
+		ret = clk_pm_runtime_get(core);
+		if (ret) {
+			failed = core;
+			pr_err("clk: Failed to runtime PM get '%s' for clk '%s'\n",
+			       dev_name(failed->dev), failed->name);
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node) {
+		if (core == failed)
+			break;
+
+		clk_pm_runtime_put(core);
+	}
+	mutex_unlock(&clk_rpm_list_lock);
+
+	return ret;
+}
+
+/**
+ * clk_pm_runtime_put_all() - Runtime "put" all clk provider devices
+ *
+ * Put the runtime PM references taken in clk_pm_runtime_get_all() and release
+ * the 'clk_rpm_list_lock'.
+ */
+static void clk_pm_runtime_put_all(void)
+{
+	struct clk_core *core;
+
+	hlist_for_each_entry(core, &clk_rpm_list, rpm_node)
+		clk_pm_runtime_put(core);
+	mutex_unlock(&clk_rpm_list_lock);
+}
+
+static void clk_core_rpm_init(struct clk_core *core)
+{
+	struct device *dev = core->dev;
+
+	if (dev && pm_runtime_enabled(dev)) {
+		core->rpm_enabled = true;
+
+		mutex_lock(&clk_rpm_list_lock);
+		hlist_add_head(&core->rpm_node, &clk_rpm_list);
+		mutex_unlock(&clk_rpm_list_lock);
+	}
+}
+
 /***           locking             ***/
 static void clk_prepare_lock(void)
 {
@@ -1359,9 +1447,6 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	if (core->flags & CLK_IGNORE_UNUSED)
 		return;
 
-	if (clk_pm_runtime_get(core))
-		return;
-
 	if (clk_core_is_prepared(core)) {
 		trace_clk_unprepare(core);
 		if (core->ops->unprepare_unused)
@@ -1370,8 +1455,6 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 			core->ops->unprepare(core->hw);
 		trace_clk_unprepare_complete(core);
 	}
-
-	clk_pm_runtime_put(core);
 }
 
 static void __init clk_disable_unused_subtree(struct clk_core *core)
@@ -1387,9 +1470,6 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
 
-	if (clk_pm_runtime_get(core))
-		goto unprepare_out;
-
 	flags = clk_enable_lock();
 
 	if (core->enable_count)
@@ -1414,8 +1494,6 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 
 unlock_out:
 	clk_enable_unlock(flags);
-	clk_pm_runtime_put(core);
-unprepare_out:
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_disable_unprepare(core->parent);
 }
@@ -1431,6 +1509,7 @@ __setup("clk_ignore_unused", clk_ignore_unused_setup);
 static int __init clk_disable_unused(void)
 {
 	struct clk_core *core;
+	int ret;
 
 	if (clk_ignore_unused) {
 		pr_warn("clk: Not disabling unused clocks\n");
@@ -1439,6 +1518,13 @@ static int __init clk_disable_unused(void)
 
 	pr_info("clk: Disabling unused clocks\n");
 
+	ret = clk_pm_runtime_get_all();
+	if (ret)
+		return ret;
+	/*
+	 * Grab the prepare lock to keep the clk topology stable while iterating
+	 * over clks.
+	 */
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
@@ -1455,6 +1541,8 @@ static int __init clk_disable_unused(void)
 
 	clk_prepare_unlock();
 
+	clk_pm_runtime_put_all();
+
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
@@ -4192,6 +4280,12 @@ static void __clk_release(struct kref *ref)
 {
 	struct clk_core *core = container_of(ref, struct clk_core, ref);
 
+	if (core->rpm_enabled) {
+		mutex_lock(&clk_rpm_list_lock);
+		hlist_del(&core->rpm_node);
+		mutex_unlock(&clk_rpm_list_lock);
+	}
+
 	clk_core_free_parent_map(core);
 	kfree_const(core->name);
 	kfree(core);
@@ -4231,9 +4325,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	}
 	core->ops = init->ops;
 
-	if (dev && pm_runtime_enabled(dev))
-		core->rpm_enabled = true;
 	core->dev = dev;
+	clk_core_rpm_init(core);
 	core->of_node = np;
 	if (dev && dev->driver)
 		core->owner = dev->driver->owner;
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git


