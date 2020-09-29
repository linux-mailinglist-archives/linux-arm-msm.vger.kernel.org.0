Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189C127D518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728289AbgI2Rx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgI2Rx3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:29 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BE4C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:28 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 7so4450293pgm.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mMw/Ksp0P1U2sI/VwrzNDLr3GW08so3zHnsJ9YYxsqo=;
        b=ssk+wxRZVnQuQM8n2Ur1vZKXTHKh5s+Bz5nKSfA/rAFAll5Mo5vZ5ZtNnRZAhvoyoK
         x8B75e1RhIxhj+KVUjKxlh7dR2S+qaZTPW4tVAV/Qle1Pw38lSMYNsdAY74S1OmbSOTp
         9z6pIgHq4vG5QzqD77UKwjbS6N5WRmD+2HJ7otAbr6uFU1DUD0uAun6g2xFf+Sk3ubeP
         htup98+1kJvGyzZhaZXcujWBFN/91KgEqmPFUQVdi7gn6TkLjrytSg0sDzPIbWdfouje
         N1J/U1BSlVhHF0VI57sVZEy/UMzX2nQpbg9lDtZG++Q0nYKj2pUpwa89a+P4z5af9gu2
         KUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mMw/Ksp0P1U2sI/VwrzNDLr3GW08so3zHnsJ9YYxsqo=;
        b=kaqVmaUcCRNSO1MRZ0lHCuAa00APFUvGeEhBIqVtlw4VluvBTX1XcogXuF6Gt5CALG
         WlPCmlK3grdxDnC0Ph8UPbQr/p6rUNHYgnvfToQNcyJUP1ARfWOPx8lc6thCQowVeCp+
         8egUcYORJ5Kt2+KyZc3XpDbtweAJt1DXSATMkty+qERsR455nnu2wtcEgZ2Sq4zkZ/li
         Z4IF4fVt8vgprZW+s/l3TrruaKkQ3VDWbXFJKFYMGlhsskjukJFp8q55bboTXUMK+L4A
         rD7Oh0pEV+yrvQqtSchoHAZsskaGZ0QvPUQbTq2xrGBlsPhz6aNme/z597bTMFZluGJf
         e3kQ==
X-Gm-Message-State: AOAM531tuCbDBMJqlDNhtJRNJdJBM07MSJDWigWoj5cROTo+qeKO2V6a
        YOSSy3yly2v5gV5/FpP8fpgE
X-Google-Smtp-Source: ABdhPJxya+Ot8zrBH9bZRPAncbD/qiSrsosEN4R5ql9aIAgtgVyt90xKi5zdpHhsBtnXluIaw4zDCw==
X-Received: by 2002:a17:902:be09:b029:d2:83ee:dc2b with SMTP id r9-20020a170902be09b02900d283eedc2bmr5912782pls.20.1601402008289;
        Tue, 29 Sep 2020 10:53:28 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 14/19] bus: mhi: core: Introduce debugfs entries for MHI
Date:   Tue, 29 Sep 2020 23:22:13 +0530
Message-Id: <20200929175218.8178-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Introduce debugfs entries to show state, register, channel, device,
and event rings information. Allow the host to dump registers,
issue device wake, and change the MHI timeout to help in debug.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/Kconfig         |   8 +
 drivers/bus/mhi/core/Makefile   |   1 +
 drivers/bus/mhi/core/debugfs.c  | 410 ++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c     |   7 +
 drivers/bus/mhi/core/internal.h |  24 ++
 include/linux/mhi.h             |   2 +
 6 files changed, 452 insertions(+)
 create mode 100644 drivers/bus/mhi/core/debugfs.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index 6677cccd61f3..e841c1097fb4 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -12,3 +12,11 @@ config MHI_BUS
 	  communication protocol used by the host processors to control
 	  and communicate with modem devices over a high speed peripheral
 	  bus or shared memory.
+
+config MHI_BUS_DEBUG
+	bool "Debugfs support for the MHI bus"
+	depends on MHI_BUS && DEBUG_FS
+	help
+	  Enable debugfs support for use with the MHI transport. Allows
+	  reading and/or modifying some values within the MHI controller
+	  for debug and test purposes.
diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 66e2700c9032..12c57ab3724c 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_MHI_BUS) := mhi.o
 
 mhi-y := init.o main.o pm.o boot.o
+mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
new file mode 100644
index 000000000000..f50d73054db4
--- /dev/null
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -0,0 +1,410 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/mhi.h>
+#include <linux/module.h>
+#include "internal.h"
+
+static int mhi_debugfs_states_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+
+	/* states */
+	seq_printf(m, "PM state: %s Device: %s MHI state: %s EE: %s wake: %s\n",
+		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
+		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
+		   mhi_cntrl->wake_set ? "true" : "false");
+
+	/* counters */
+	seq_printf(m, "M0: %u M2: %u M3: %u", mhi_cntrl->M0, mhi_cntrl->M2,
+		   mhi_cntrl->M3);
+
+	seq_printf(m, " device wake: %u pending packets: %u\n",
+		   atomic_read(&mhi_cntrl->dev_wake),
+		   atomic_read(&mhi_cntrl->pending_pkts));
+
+	return 0;
+}
+
+static int mhi_debugfs_events_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_event *mhi_event;
+	struct mhi_event_ctxt *er_ctxt;
+	int i;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings;
+						i++, er_ctxt++, mhi_event++) {
+		struct mhi_ring *ring = &mhi_event->ring;
+
+		if (mhi_event->offload_ev) {
+			seq_printf(m, "Index: %d is an offload event ring\n",
+				   i);
+			continue;
+		}
+
+		seq_printf(m, "Index: %d intmod count: %lu time: %lu",
+			   i, (er_ctxt->intmod & EV_CTX_INTMODC_MASK) >>
+			   EV_CTX_INTMODC_SHIFT,
+			   (er_ctxt->intmod & EV_CTX_INTMODT_MASK) >>
+			   EV_CTX_INTMODT_SHIFT);
+
+		seq_printf(m, " base: 0x%0llx len: 0x%llx", er_ctxt->rbase,
+			   er_ctxt->rlen);
+
+		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
+			   er_ctxt->wp);
+
+		seq_printf(m, " local rp: 0x%pK db: 0x%pad\n", ring->rp,
+			   &mhi_event->db_cfg.db_val);
+	}
+
+	return 0;
+}
+
+static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_chan *mhi_chan;
+	struct mhi_chan_ctxt *chan_ctxt;
+	int i;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	chan_ctxt = mhi_cntrl->mhi_ctxt->chan_ctxt;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, chan_ctxt++, mhi_chan++) {
+		struct mhi_ring *ring = &mhi_chan->tre_ring;
+
+		if (mhi_chan->offload_ch) {
+			seq_printf(m, "%s(%u) is an offload channel\n",
+				   mhi_chan->name, mhi_chan->chan);
+			continue;
+		}
+
+		if (!mhi_chan->mhi_dev)
+			continue;
+
+		seq_printf(m,
+			   "%s(%u) state: 0x%lx brstmode: 0x%lx pollcfg: 0x%lx",
+			   mhi_chan->name, mhi_chan->chan, (chan_ctxt->chcfg &
+			   CHAN_CTX_CHSTATE_MASK) >> CHAN_CTX_CHSTATE_SHIFT,
+			   (chan_ctxt->chcfg & CHAN_CTX_BRSTMODE_MASK) >>
+			   CHAN_CTX_BRSTMODE_SHIFT, (chan_ctxt->chcfg &
+			   CHAN_CTX_POLLCFG_MASK) >> CHAN_CTX_POLLCFG_SHIFT);
+
+		seq_printf(m, " type: 0x%x event ring: %u", chan_ctxt->chtype,
+			   chan_ctxt->erindex);
+
+		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
+			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
+
+		seq_printf(m, " local rp: 0x%pK local wp: 0x%pK db: 0x%pad\n",
+			   ring->rp, ring->wp,
+			   &mhi_chan->db_cfg.db_val);
+	}
+
+	return 0;
+}
+
+static int mhi_device_info_show(struct device *dev, void *data)
+{
+	struct mhi_device *mhi_dev;
+
+	if (dev->bus != &mhi_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_device(dev);
+
+	seq_printf((struct seq_file *)data, "%s: type: %s dev_wake: %u",
+		   mhi_dev->name, mhi_dev->dev_type ? "Controller" : "Transfer",
+		   mhi_dev->dev_wake);
+
+	/* for transfer device types only */
+	if (mhi_dev->dev_type == MHI_DEVICE_XFER)
+		seq_printf((struct seq_file *)data, " channels: %u(UL)/%u(DL)",
+			   mhi_dev->ul_chan_id, mhi_dev->dl_chan_id);
+
+	seq_puts((struct seq_file *)data, "\n");
+
+	return 0;
+}
+
+static int mhi_debugfs_devices_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	device_for_each_child(mhi_cntrl->cntrl_dev, m, mhi_device_info_show);
+
+	return 0;
+}
+
+static int mhi_debugfs_regdump_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+	enum mhi_state state;
+	enum mhi_ee_type ee;
+	int i, ret = -EIO;
+	u32 val;
+	void __iomem *mhi_base = mhi_cntrl->regs;
+	void __iomem *bhi_base = mhi_cntrl->bhi;
+	void __iomem *bhie_base = mhi_cntrl->bhie;
+	void __iomem *wake_db = mhi_cntrl->wake_db;
+	struct {
+		const char *name;
+		int offset;
+		void __iomem *base;
+	} regs[] = {
+		{ "MHI_REGLEN", MHIREGLEN, mhi_base},
+		{ "MHI_VER", MHIVER, mhi_base},
+		{ "MHI_CFG", MHICFG, mhi_base},
+		{ "MHI_CTRL", MHICTRL, mhi_base},
+		{ "MHI_STATUS", MHISTATUS, mhi_base},
+		{ "MHI_WAKE_DB", 0, wake_db},
+		{ "BHI_EXECENV", BHI_EXECENV, bhi_base},
+		{ "BHI_STATUS", BHI_STATUS, bhi_base},
+		{ "BHI_ERRCODE", BHI_ERRCODE, bhi_base},
+		{ "BHI_ERRDBG1", BHI_ERRDBG1, bhi_base},
+		{ "BHI_ERRDBG2", BHI_ERRDBG2, bhi_base},
+		{ "BHI_ERRDBG3", BHI_ERRDBG3, bhi_base},
+		{ "BHIE_TXVEC_DB", BHIE_TXVECDB_OFFS, bhie_base},
+		{ "BHIE_TXVEC_STATUS", BHIE_TXVECSTATUS_OFFS, bhie_base},
+		{ "BHIE_RXVEC_DB", BHIE_RXVECDB_OFFS, bhie_base},
+		{ "BHIE_RXVEC_STATUS", BHIE_RXVECSTATUS_OFFS, bhie_base},
+		{ NULL },
+	};
+
+	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
+		return ret;
+
+	seq_printf(m, "Host PM state: %s Device state: %s EE: %s\n",
+		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   TO_MHI_EXEC_STR(mhi_cntrl->ee));
+
+	state = mhi_get_mhi_state(mhi_cntrl);
+	ee = mhi_get_exec_env(mhi_cntrl);
+	seq_printf(m, "Device EE: %s state: %s\n", TO_MHI_EXEC_STR(ee),
+		   TO_MHI_STATE_STR(state));
+
+	for (i = 0; regs[i].name; i++) {
+		if (!regs[i].base)
+			continue;
+		ret = mhi_read_reg(mhi_cntrl, regs[i].base, regs[i].offset,
+				   &val);
+		if (ret)
+			continue;
+
+		seq_printf(m, "%s: 0x%x\n", regs[i].name, val);
+	}
+
+	return 0;
+}
+
+static int mhi_debugfs_device_wake_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	seq_printf(m,
+		   "Wake count: %d\n%s\n", mhi_dev->dev_wake,
+		   "Usage: echo get/put > device_wake to vote/unvote for M0");
+
+	return 0;
+}
+
+static ssize_t mhi_debugfs_device_wake_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t count, loff_t *ppos)
+{
+	struct seq_file	*m = file->private_data;
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	char buf[16];
+	int ret = -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "get", 3)) {
+		ret = mhi_device_get_sync(mhi_dev);
+	} else if (!strncmp(buf, "put", 3)) {
+		mhi_device_put(mhi_dev);
+		ret = 0;
+	}
+
+	return ret ? ret : count;
+}
+
+static int mhi_debugfs_timeout_ms_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+
+	seq_printf(m, "%u ms\n", mhi_cntrl->timeout_ms);
+
+	return 0;
+}
+
+static ssize_t mhi_debugfs_timeout_ms_write(struct file *file,
+					    const char __user *ubuf,
+					    size_t count, loff_t *ppos)
+{
+	struct seq_file	*m = file->private_data;
+	struct mhi_controller *mhi_cntrl = m->private;
+	u32 timeout_ms;
+
+	if (kstrtou32_from_user(ubuf, count, 0, &timeout_ms))
+		return -EINVAL;
+
+	mhi_cntrl->timeout_ms = timeout_ms;
+
+	return count;
+}
+
+static int mhi_debugfs_states_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_states_show, inode->i_private);
+}
+
+static int mhi_debugfs_events_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_events_show, inode->i_private);
+}
+
+static int mhi_debugfs_channels_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_channels_show, inode->i_private);
+}
+
+static int mhi_debugfs_devices_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_devices_show, inode->i_private);
+}
+
+static int mhi_debugfs_regdump_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_regdump_show, inode->i_private);
+}
+
+static int mhi_debugfs_device_wake_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_device_wake_show, inode->i_private);
+}
+
+static int mhi_debugfs_timeout_ms_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_timeout_ms_show, inode->i_private);
+}
+
+static const struct file_operations debugfs_states_fops = {
+	.open = mhi_debugfs_states_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_events_fops = {
+	.open = mhi_debugfs_events_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_channels_fops = {
+	.open = mhi_debugfs_channels_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_devices_fops = {
+	.open = mhi_debugfs_devices_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_regdump_fops = {
+	.open = mhi_debugfs_regdump_open,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_device_wake_fops = {
+	.open = mhi_debugfs_device_wake_open,
+	.write = mhi_debugfs_device_wake_write,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_timeout_ms_fops = {
+	.open = mhi_debugfs_timeout_ms_open,
+	.write = mhi_debugfs_timeout_ms_write,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static struct dentry *mhi_debugfs_root;
+
+void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
+{
+	mhi_cntrl->debugfs_dentry =
+			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
+					   mhi_debugfs_root);
+
+	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_states_fops);
+	debugfs_create_file("events", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_events_fops);
+	debugfs_create_file("channels", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_channels_fops);
+	debugfs_create_file("devices", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_devices_fops);
+	debugfs_create_file("regdump", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_regdump_fops);
+	debugfs_create_file("device_wake", 0644, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_device_wake_fops);
+	debugfs_create_file("timeout_ms", 0644, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_timeout_ms_fops);
+}
+
+void mhi_destroy_debugfs(struct mhi_controller *mhi_cntrl)
+{
+	debugfs_remove_recursive(mhi_cntrl->debugfs_dentry);
+	mhi_cntrl->debugfs_dentry = NULL;
+}
+
+void mhi_debugfs_init(void)
+{
+	mhi_debugfs_root = debugfs_create_dir(mhi_bus_type.name, NULL);
+}
+
+void mhi_debugfs_exit(void)
+{
+	debugfs_remove_recursive(mhi_debugfs_root);
+}
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index d23293876be8..61e5885a331a 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -4,6 +4,7 @@
  *
  */
 
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -915,6 +916,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	mhi_cntrl->mhi_dev = mhi_dev;
 
+	mhi_create_debugfs(mhi_cntrl);
+
 	return 0;
 
 error_add_dev:
@@ -937,6 +940,8 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
 	unsigned int i;
 
+	mhi_destroy_debugfs(mhi_cntrl);
+
 	kfree(mhi_cntrl->mhi_cmd);
 	kfree(mhi_cntrl->mhi_event);
 
@@ -1300,11 +1305,13 @@ struct bus_type mhi_bus_type = {
 
 static int __init mhi_init(void)
 {
+	mhi_debugfs_init();
 	return bus_register(&mhi_bus_type);
 }
 
 static void __exit mhi_exit(void)
 {
+	mhi_debugfs_exit();
 	bus_unregister(&mhi_bus_type);
 }
 
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 5a81a428c4aa..7989269ddd96 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -570,6 +570,30 @@ struct mhi_chan {
 /* Default MHI timeout */
 #define MHI_TIMEOUT_MS (1000)
 
+/* debugfs related functions */
+#ifdef CONFIG_MHI_BUS_DEBUG
+void mhi_create_debugfs(struct mhi_controller *mhi_cntrl);
+void mhi_destroy_debugfs(struct mhi_controller *mhi_cntrl);
+void mhi_debugfs_init(void);
+void mhi_debugfs_exit(void);
+#else
+static inline void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
+{
+}
+
+static inline void mhi_destroy_debugfs(struct mhi_controller *mhi_cntrl)
+{
+}
+
+static inline void mhi_debugfs_init(void)
+{
+}
+
+static inline void mhi_debugfs_exit(void)
+{
+}
+#endif
+
 struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl);
 
 int mhi_destroy_device(struct device *dev, void *data);
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 008b8f6fa9ff..fb45a0ff9aa3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -291,6 +291,7 @@ struct mhi_controller_config {
  * @cntrl_dev: Pointer to the struct device of physical bus acting as the MHI
  *            controller (required)
  * @mhi_dev: MHI device instance for the controller
+ * @debugfs_dentry: MHI controller debugfs directory
  * @regs: Base address of MHI MMIO register space (required)
  * @bhi: Points to base of MHI BHI register space
  * @bhie: Points to base of MHI BHIe register space
@@ -370,6 +371,7 @@ struct mhi_controller_config {
 struct mhi_controller {
 	struct device *cntrl_dev;
 	struct mhi_device *mhi_dev;
+	struct dentry *debugfs_dentry;
 	void __iomem *regs;
 	void __iomem *bhi;
 	void __iomem *bhie;
-- 
2.17.1

