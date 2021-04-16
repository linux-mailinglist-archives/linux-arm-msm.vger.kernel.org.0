Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C65363629C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 22:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243775AbhDPU6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 16:58:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23058 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243128AbhDPU63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 16:58:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618606683; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sQS/M0EvrY/S7JcXM9aRiP7PXvnj1/MBr4gPiio4Mgc=; b=fSceWkhXhD9U/YyulRhUBgDyepZ/d5zJN1UxQOxTlEWQFDWmCHmxldIvmvjepTup+4+afR65
 sHX3n01tuFMkApa1gXpE0E4IWWSulWL8fyh5N7dyQZSLJrUVkPgQhwvL4PLkek2yrskHRue7
 wCKpRztmuwIfO/X6SI6Y1ZqJqOE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6079fa42215b831afb2ccd26 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Apr 2021 20:57:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 13C7FC43461; Fri, 16 Apr 2021 20:57:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C0AAFC433C6;
        Fri, 16 Apr 2021 20:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C0AAFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org
Subject: [PATCH v5 2/7] drm/msm: add support to take dpu snapshot
Date:   Fri, 16 Apr 2021 13:57:20 -0700
Message-Id: <1618606645-19695-3-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the msm_disp_snapshot module which adds supports to dump dpu
registers and capture the drm atomic state which can be used in
case of error conditions.

changes in v5:
 - start storing disp_state in msm_kms instead of dpu_kms
 - get rid of MSM_DISP_SNAPSHOT_IN_* enum by simplifying the functions
 - move snprintf inside the snapshot core by using varargs
 - get rid of some stale code comments
 - allow snapshot module for non-DPU targets

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile                      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c      | 161 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h      | 153 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 179 ++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h               |   1 +
 drivers/gpu/drm/msm/dsi/dsi.c                     |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                |   1 +
 drivers/gpu/drm/msm/msm_drv.c                     |  27 +++-
 drivers/gpu/drm/msm/msm_drv.h                     |   1 +
 drivers/gpu/drm/msm/msm_kms.h                     |   3 +
 11 files changed, 529 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
 create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 610d630..65d86ce 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -77,6 +77,8 @@ msm-y := \
 	disp/dpu1/dpu_plane.o \
 	disp/dpu1/dpu_rm.o \
 	disp/dpu1/dpu_vbif.o \
+	disp/msm_disp_snapshot.o \
+	disp/msm_disp_snapshot_util.o \
 	msm_atomic.o \
 	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4dfd8a2..0f9f0a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_CATALOG_H
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
new file mode 100644
index 0000000..70fd5a1
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "msm_disp_snapshot.h"
+
+#ifdef CONFIG_DEV_COREDUMP
+static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
+		size_t count, void *data, size_t datalen)
+{
+	struct drm_print_iterator iter;
+	struct drm_printer p;
+	struct msm_disp_state *disp_state;
+
+	disp_state = data;
+
+	iter.data = buffer;
+	iter.offset = 0;
+	iter.start = offset;
+	iter.remain = count;
+
+	p = drm_coredump_printer(&iter);
+
+	msm_disp_state_print(disp_state, &p);
+
+	return count - iter.remain;
+}
+
+static void disp_devcoredump_free(void *data)
+{
+	struct msm_disp_state *disp_state;
+
+	disp_state = data;
+
+	msm_disp_state_free(disp_state);
+
+	disp_state->coredump_pending = false;
+}
+#endif /* CONFIG_DEV_COREDUMP */
+
+static void _msm_disp_snapshot_work(struct kthread_work *work)
+{
+	struct msm_disp_state *disp_state = container_of(work, struct msm_disp_state, dump_work);
+	struct drm_printer p;
+
+	mutex_lock(&disp_state->mutex);
+
+	msm_disp_snapshot_capture_state(disp_state);
+
+	if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
+		p = drm_info_printer(disp_state->drm_dev->dev);
+		msm_disp_state_print(disp_state, &p);
+	}
+
+	/*
+	 * if devcoredump is not defined free the state immediately
+	 * otherwise it will be freed in the free handler.
+	 */
+#ifdef CONFIG_DEV_COREDUMP
+	dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0, GFP_KERNEL,
+			disp_devcoredump_read, disp_devcoredump_free);
+	disp_state->coredump_pending = true;
+#else
+	msm_disp_state_free(disp_state);
+#endif
+
+	mutex_unlock(&disp_state->mutex);
+}
+
+void msm_disp_snapshot_state(struct drm_device *drm_dev)
+{
+	struct msm_drm_private *priv;
+	struct msm_kms *kms;
+	struct msm_disp_state *disp_state;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	priv = drm_dev->dev_private;
+	kms = priv->kms;
+	disp_state = kms->disp_state;
+
+	if (!disp_state) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	/*
+	 * if there is a coredump pending return immediately till dump
+	 * if read by userspace or timeout happens
+	 */
+	if (disp_state->coredump_pending) {
+		DRM_DEBUG("coredump is pending read\n");
+		return;
+	}
+
+	kthread_queue_work(disp_state->dump_worker,
+			&disp_state->dump_work);
+}
+
+int msm_disp_snapshot_init(struct drm_device *drm_dev)
+{
+	struct msm_drm_private *priv;
+	struct msm_disp_state *disp_state;
+	struct msm_kms *kms;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	priv = drm_dev->dev_private;
+	kms = priv->kms;
+
+	disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct msm_disp_state), GFP_KERNEL);
+
+	mutex_init(&disp_state->mutex);
+
+	disp_state->dev = drm_dev->dev;
+	disp_state->drm_dev = drm_dev;
+
+	INIT_LIST_HEAD(&disp_state->blocks);
+
+	disp_state->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
+	if (IS_ERR(disp_state->dump_worker))
+		DRM_ERROR("failed to create disp state task\n");
+
+	kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
+
+	kms->disp_state = disp_state;
+
+	return 0;
+}
+
+void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
+{
+	struct msm_kms *kms;
+	struct msm_drm_private *priv;
+	struct msm_disp_state *disp_state;
+
+	if (!drm_dev) {
+		DRM_ERROR("invalid params\n");
+		return;
+	}
+
+	priv = drm_dev->dev_private;
+	kms = priv->kms;
+	disp_state = kms->disp_state;
+
+	if (disp_state->dump_worker)
+		kthread_destroy_worker(disp_state->dump_worker);
+
+	list_del(&disp_state->blocks);
+
+	mutex_destroy(&disp_state->mutex);
+}
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
new file mode 100644
index 0000000..11dfa57
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -0,0 +1,153 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef MSM_DISP_SNAPSHOT_H_
+#define MSM_DISP_SNAPSHOT_H_
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_device.h>
+#include "../../../drm_crtc_internal.h"
+#include <drm/drm_print.h>
+#include <drm/drm_atomic.h>
+#include <linux/debugfs.h>
+#include <linux/list.h>
+#include <linux/delay.h>
+#include <linux/spinlock.h>
+#include <linux/ktime.h>
+#include <linux/debugfs.h>
+#include <linux/uaccess.h>
+#include <linux/dma-buf.h>
+#include <linux/slab.h>
+#include <linux/list_sort.h>
+#include <linux/pm.h>
+#include <linux/pm_runtime.h>
+#include <linux/kthread.h>
+#include <linux/devcoredump.h>
+#include <stdarg.h>
+#include "msm_kms.h"
+
+#define MSM_DISP_SNAPSHOT_MAX_BLKS		10
+
+/* debug option to print the registers in logs */
+#define MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE 0
+
+/* print debug ranges in groups of 4 u32s */
+#define REG_DUMP_ALIGN		16
+
+/**
+ * struct msm_disp_state - structure to store current dpu state
+ * @dev: device pointer
+ * @drm_dev: drm device pointer
+ * @mutex: mutex to serialize access to serialze dumps, debugfs access
+ * @coredump_pending: coredump is pending read from userspace
+ * @atomic_state: atomic state duplicated at the time of the error
+ * @dump_worker: kworker thread which runs the dump work
+ * @dump_work: kwork which dumps the registers and drm state
+ * @timestamp: timestamp at which the coredump was captured
+ */
+struct msm_disp_state {
+	struct device *dev;
+	struct drm_device *drm_dev;
+	struct mutex mutex;
+
+	bool coredump_pending;
+
+	struct list_head blocks;
+
+	struct drm_atomic_state *atomic_state;
+
+	struct kthread_worker *dump_worker;
+	struct kthread_work dump_work;
+	ktime_t timestamp;
+};
+
+/**
+ * struct msm_disp_state_block - structure to store each hardware block state
+ * @name: name of the block
+ * @drm_dev: handle to the linked list head
+ * @size: size of the register space of this hardware block
+ * @state: array holding the register dump of this hardware block
+ * @base_addr: starting address of this hardware block's register space
+ */
+struct msm_disp_state_block {
+	char name[SZ_128];
+	struct list_head node;
+	unsigned int size;
+	u32 *state;
+	void __iomem *base_addr;
+};
+
+/**
+ * msm_disp_snapshot_init - initialize display snapshot
+ * @drm_dev:	drm device handle
+ *
+ * Returns:		0 or -ERROR
+ */
+int msm_disp_snapshot_init(struct drm_device *drm_dev);
+
+/**
+ * msm_disp_snapshot_destroy - destroy the display snapshot
+ * @drm_dev:    drm device handle
+ *
+ * Returns:	none
+ */
+void msm_disp_snapshot_destroy(struct drm_device *drm_dev);
+
+/**
+ * msm_disp_snapshot_state - trigger to dump the display snapshot
+ * @drm_dev:	handle to drm device
+
+ * Returns:	none
+ */
+void msm_disp_snapshot_state(struct drm_device *drm_dev);
+
+/**
+ * msm_disp_state_get - get the handle to msm_disp_state struct from the drm device
+ * @drm:	    handle to drm device
+
+ * Returns:	handle to the msm_disp_state struct
+ */
+struct msm_disp_state *msm_disp_state_get(struct drm_device *drm);
+
+/**
+ * msm_disp_state_print - print out the current dpu state
+ * @disp_state:	    handle to drm device
+ * @p:	    handle to drm printer
+ *
+ * Returns:	none
+ */
+void msm_disp_state_print(struct msm_disp_state *disp_state, struct drm_printer *p);
+
+/**
+ * msm_disp_snapshot_capture_state - utility to capture atomic state and hw registers
+ * @disp_state:	    handle to msm_disp_state struct
+
+ * Returns:	none
+ */
+void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state);
+
+/**
+ * msm_disp_state_free - free the memory after the coredump has been read
+ * @disp_state:	    handle to struct msm_disp_state
+
+ * Returns: none
+ */
+void msm_disp_state_free(struct msm_disp_state *disp_state);
+
+/**
+ * msm_disp_snapshot_add_block - add a hardware block with its register dump
+ * @disp_state:	    handle to struct msm_disp_state
+ * @name:           name of the hardware block
+ * @len:            size of the register space of the hardware block
+ * @base_addr:      starting address of the register space of the hardware block
+ * @fmt:            format in which the block names need to be printed
+ *
+ * Returns: none
+ */
+__printf(4, 5)
+void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
+		void __iomem *base_addr, const char *fmt, ...);
+
+#endif /* MSM_DISP_SNAPSHOT_H_ */
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
new file mode 100644
index 0000000..024ca49
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+
+#include "msm_disp_snapshot.h"
+
+static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *base_addr)
+{
+	u32 len_padded;
+	u32 num_rows;
+	u32 x0, x4, x8, xc;
+	void __iomem *addr;
+	u32 *dump_addr = NULL;
+	void __iomem *end_addr;
+	int i;
+
+	len_padded = aligned_len * REG_DUMP_ALIGN;
+	num_rows = aligned_len / REG_DUMP_ALIGN;
+
+	addr = base_addr;
+	end_addr = base_addr + aligned_len;
+
+	if (!(*reg))
+		*reg = kzalloc(len_padded, GFP_KERNEL);
+
+	if (*reg)
+		dump_addr = *reg;
+
+	for (i = 0; i < num_rows; i++) {
+		x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
+		x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
+		x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
+		xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
+
+		if (dump_addr) {
+			dump_addr[i * 4] = x0;
+			dump_addr[i * 4 + 1] = x4;
+			dump_addr[i * 4 + 2] = x8;
+			dump_addr[i * 4 + 3] = xc;
+		}
+
+		addr += REG_DUMP_ALIGN;
+	}
+}
+
+static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_addr,
+		struct drm_printer *p)
+{
+	int i;
+	u32 *dump_addr = NULL;
+	void __iomem *addr;
+	u32 num_rows;
+
+	addr = base_addr;
+	num_rows = len / REG_DUMP_ALIGN;
+
+	if (*reg)
+		dump_addr = *reg;
+
+	for (i = 0; i < num_rows; i++) {
+		drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
+				(unsigned long)(addr - base_addr),
+				dump_addr[i * 4], dump_addr[i * 4 + 1],
+				dump_addr[i * 4 + 2], dump_addr[i * 4 + 3]);
+		addr += REG_DUMP_ALIGN;
+	}
+}
+
+struct msm_disp_state *msm_disp_state_get(struct drm_device *drm)
+{
+	struct msm_drm_private *priv;
+	struct msm_kms *kms;
+
+	priv = drm->dev_private;
+	kms = priv->kms;
+
+	return kms->disp_state;
+}
+
+void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
+{
+	struct msm_disp_state_block *block, *tmp;
+
+	if (!p) {
+		DRM_ERROR("invalid drm printer\n");
+		return;
+	}
+
+	drm_printf(p, "---\n");
+
+	drm_printf(p, "module: " KBUILD_MODNAME "\n");
+	drm_printf(p, "dpu devcoredump\n");
+	drm_printf(p, "timestamp %lld\n", ktime_to_ns(state->timestamp));
+
+	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
+		drm_printf(p, "====================%s================\n", block->name);
+		msm_disp_state_print_regs(&block->state, block->size, block->base_addr, p);
+	}
+
+	drm_printf(p, "===================dpu drm state================\n");
+
+	if (state->atomic_state)
+		drm_atomic_print_new_state(state->atomic_state, p);
+}
+
+static void msm_disp_capture_atomic_state(struct msm_disp_state *disp_state)
+{
+	struct drm_device *ddev;
+	struct drm_modeset_acquire_ctx ctx;
+
+	disp_state->timestamp = ktime_get();
+
+	ddev = disp_state->drm_dev;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	while (drm_modeset_lock_all_ctx(ddev, &ctx) != 0)
+		drm_modeset_backoff(&ctx);
+
+	disp_state->atomic_state = drm_atomic_helper_duplicate_state(ddev,
+			&ctx);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
+{
+	struct msm_drm_private *priv;
+	struct drm_device *drm_dev;
+
+	drm_dev = disp_state->drm_dev;
+	priv = drm_dev->dev_private;
+
+	msm_disp_capture_atomic_state(disp_state);
+}
+
+void msm_disp_state_free(struct msm_disp_state *disp_state)
+{
+	struct msm_disp_state_block *block, *tmp;
+
+	if (disp_state->atomic_state) {
+		drm_atomic_state_put(disp_state->atomic_state);
+		disp_state->atomic_state = NULL;
+	}
+
+	list_for_each_entry_safe(block, tmp, &disp_state->blocks, node) {
+		list_del(&block->node);
+		kfree(block->state);
+		kfree(block);
+	}
+}
+
+void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
+		void __iomem *base_addr, const char *fmt, ...)
+{
+	struct msm_disp_state_block *new_blk;
+	struct va_format vaf;
+	va_list va;
+
+	new_blk = kzalloc(sizeof(struct msm_disp_state_block), GFP_KERNEL);
+
+	va_start(va, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &va;
+	snprintf(new_blk->name, sizeof(new_blk->name), "%pV", &vaf);
+
+	va_end(va);
+
+	INIT_LIST_HEAD(&new_blk->node);
+	new_blk->size = ALIGN(len, REG_DUMP_ALIGN);
+	new_blk->base_addr = base_addr;
+
+	msm_disp_state_dump_regs(&new_blk->state, new_blk->size, base_addr);
+	list_add(&new_blk->node, &disp_state->blocks);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6092ba1..4d39373 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -8,6 +8,7 @@
 
 #include "dp_panel.h"
 #include <sound/hdmi-codec.h>
+#include "disp/msm_disp_snapshot.h"
 
 struct msm_dp {
 	struct drm_device *drm_dev;
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 62704885..f68f34b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -266,3 +266,4 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	return ret;
 }
 
+
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 8a10e43..316e78d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -2487,3 +2487,4 @@ struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host)
 
 	return of_drm_find_bridge(msm_host->device_node);
 }
+
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e1104d2..92fe844 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2016-2018, 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -19,6 +19,7 @@
 #include <drm/drm_of.h>
 #include <drm/drm_vblank.h>
 
+#include "disp/msm_disp_snapshot.h"
 #include "msm_drv.h"
 #include "msm_debugfs.h"
 #include "msm_fence.h"
@@ -167,6 +168,24 @@ void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 	return _msm_ioremap(pdev, name, dbgname, true);
 }
 
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name)
+{
+	struct resource *res;
+
+	if (name)
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	else
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res) {
+		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
+				name);
+		return 0;
+	}
+
+	return resource_size(res);
+}
+
 void msm_writel(u32 data, void __iomem *addr)
 {
 	if (reglog)
@@ -278,6 +297,8 @@ static int msm_drm_uninit(struct device *dev)
 		msm_fbdev_free(ddev);
 #endif
 
+	msm_disp_snapshot_destroy(ddev);
+
 	drm_mode_config_cleanup(ddev);
 
 	pm_runtime_get_sync(dev);
@@ -550,6 +571,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
+	ret = msm_disp_snapshot_init(ddev);
+	if (ret)
+		DRM_DEV_ERROR(dev, "msm_disp_snapshot_init failed ret = %d\n", ret);
+
 	drm_mode_config_reset(ddev);
 
 #ifdef CONFIG_DRM_FBDEV_EMULATION
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2668941..ac206c1 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -450,6 +450,7 @@ void __iomem *msm_ioremap(struct platform_device *pdev, const char *name,
 		const char *dbgname);
 void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const char *name,
 		const char *dbgname);
+unsigned long msm_iomap_size(struct platform_device *pdev, const char *name);
 void msm_writel(u32 data, void __iomem *addr);
 u32 msm_readl(const void __iomem *addr);
 void msm_rmw(void __iomem *addr, u32 mask, u32 or);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index d8151a8..d84bfda 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -152,6 +152,9 @@ struct msm_kms {
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
 
+	/* handle to disp snapshot state */
+	struct msm_disp_state *disp_state;
+
 	/*
 	 * For async commit, where ->flush_commit() and later happens
 	 * from the crtc's pending_timer close to end of the frame:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

