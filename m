Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559941D88CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 22:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgERUEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 16:04:14 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:56393 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727779AbgERUEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 16:04:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589832251; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/SUfSPUoqn6OnyjDAHMI6DuHAZBY/StGSsAcg7IZHw4=; b=e9tGY0Xhp33Pveq88RzIl8+n8eJGu2zK8rcT4TP7WFrOodbya22pXrVNi5l4FGHOrIGXLMwc
 2jqXmcvZbF9icPy8azNGP/8R1fBqeNqBvXk3WWqbwvkAAFCYoUrFv+2eKrrYJ1L8AwhRybQE
 FGaBd6nvdGVcrogqIJyv6KXHcbM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec2ea3b.7f006810e378-smtp-out-n02;
 Mon, 18 May 2020 20:04:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BCA0C433D2; Mon, 18 May 2020 20:04:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2F83DC44792;
        Mon, 18 May 2020 20:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2F83DC44792
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 5/7] bus: mhi: core: Introduce debugfs entries and counters for MHI
Date:   Mon, 18 May 2020 13:03:59 -0700
Message-Id: <1589832241-13867-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
References: <1589832241-13867-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce debugfs entries to show state, register, channel, and event
ring information. Add MHI state counters to keep track of the state
changes on the device. Also, allow the host to trigger a device reset,
issue bus or device votes, and change the MHI timeout to help in debug.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/Kconfig         |   8 +
 drivers/bus/mhi/core/Makefile   |   5 +-
 drivers/bus/mhi/core/debugfs.c  | 501 ++++++++++++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/init.c     |   7 +
 drivers/bus/mhi/core/internal.h |  24 ++
 drivers/bus/mhi/core/pm.c       |   4 +
 include/linux/mhi.h             |   4 +
 7 files changed, 550 insertions(+), 3 deletions(-)
 create mode 100644 drivers/bus/mhi/core/debugfs.c

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index a8bd9bd..6a217ff 100644
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
+	 Enable debugfs support for use with the MHI transport. Allows
+	 reading and/or modifying some values within the MHI controller
+	 for debug and test purposes.
diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 66e2700..460a548 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,2 @@
-obj-$(CONFIG_MHI_BUS) := mhi.o
-
-mhi-y := init.o main.o pm.o boot.o
+obj-$(CONFIG_MHI_BUS) := init.o main.o pm.o boot.o
+obj-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
new file mode 100644
index 0000000..b37de83
--- /dev/null
+++ b/drivers/bus/mhi/core/debugfs.c
@@ -0,0 +1,501 @@
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
+#include "internal.h"
+
+static int mhi_debugfs_states_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+
+	/* states */
+	seq_printf(m, "PM state:%s Device:%s MHI state:%s EE:%s wake:%s\n",
+		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
+		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
+		   mhi_cntrl->wake_set ? "true" : "false");
+
+	/* counters */
+	seq_printf(m, "M0:%u M2:%u M3:%u M3_Fast:%u", mhi_cntrl->M0,
+		   mhi_cntrl->M2, mhi_cntrl->M3, mhi_cntrl->M3_fast);
+
+	seq_printf(m, " device wake:%u pending packets:%u\n",
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
+			seq_printf(m, "Index:%d is an offload event ring\n", i);
+			continue;
+		}
+
+		seq_printf(m, "Index:%d intmod count:%lu time:%lu",
+			   i, (er_ctxt->intmod & EV_CTX_INTMODC_MASK) >>
+			   EV_CTX_INTMODC_SHIFT,
+			   (er_ctxt->intmod & EV_CTX_INTMODT_MASK) >>
+			   EV_CTX_INTMODT_SHIFT);
+
+		seq_printf(m, " base:0x%0llx len:0x%llx", er_ctxt->rbase,
+			   er_ctxt->rlen);
+
+		seq_printf(m,
+			   " rp:0x%llx wp:0x%llx local rp:0x%llx db:0x%llx\n",
+			   er_ctxt->rp, er_ctxt->wp, (u64)ring->rp,
+			   mhi_event->db_cfg.db_val);
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
+			   "%s(%u) state:0x%lx brstmode:0x%lx pollcfg:0x%lx",
+			   mhi_chan->name, mhi_chan->chan, (chan_ctxt->chcfg &
+			   CHAN_CTX_CHSTATE_MASK) >> CHAN_CTX_CHSTATE_SHIFT,
+			   (chan_ctxt->chcfg & CHAN_CTX_BRSTMODE_MASK) >>
+			   CHAN_CTX_BRSTMODE_SHIFT, (chan_ctxt->chcfg &
+			   CHAN_CTX_POLLCFG_MASK) >> CHAN_CTX_POLLCFG_SHIFT);
+
+		seq_printf(m, " type:0x%x event ring:%u", chan_ctxt->chtype,
+			   chan_ctxt->erindex);
+
+		seq_printf(m, " base:0x%llx len:0x%llx wp:0x%llx",
+			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
+
+		seq_printf(m, " local rp:0x%llx local wp:0x%llx db:0x%llx\n",
+			   (u64)ring->rp, (u64)ring->wp,
+			   mhi_chan->db_cfg.db_val);
+	}
+
+	return 0;
+}
+
+static int mhi_device_votes_show(struct device *dev, void *data)
+{
+	struct mhi_device *mhi_dev;
+
+	if (dev->bus != &mhi_bus_type)
+		return 0;
+
+	mhi_dev = to_mhi_device(dev);
+
+	seq_printf((struct seq_file *)data, "%s: device:%u, bus:%u\n",
+		   mhi_dev->name, atomic_read(&mhi_dev->dev_vote),
+		   atomic_read(&mhi_dev->bus_vote));
+
+	return 0;
+}
+
+static int mhi_debugfs_votes_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	device_for_each_child(mhi_cntrl->cntrl_dev, m, mhi_device_votes_show);
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
+	} debug_regs[] = {
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
+	seq_printf(m, "Host PM state:%s Device state:%s EE:%s\n",
+		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
+		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		   TO_MHI_EXEC_STR(mhi_cntrl->ee));
+
+	state = mhi_get_mhi_state(mhi_cntrl);
+	ee = mhi_get_exec_env(mhi_cntrl);
+	seq_printf(m, "Device EE:%s state:%s\n", TO_MHI_EXEC_STR(ee),
+		   TO_MHI_STATE_STR(state));
+
+	for (i = 0; debug_regs[i].name; i++) {
+		ret = mhi_read_reg(mhi_cntrl, debug_regs[i].base,
+				   debug_regs[i].offset, &val);
+		if (ret)
+			continue;
+
+		seq_printf(m, "%s:0x%x\n", debug_regs[i].name, val);
+	}
+
+	return 0;
+}
+
+static int mhi_debugfs_bus_vote_show(struct seq_file *m, void *d)
+{
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+
+	if (!mhi_is_active(mhi_cntrl)) {
+		seq_puts(m, "Device not ready\n");
+		return -ENODEV;
+	}
+
+	seq_printf(m, "Votes: %d\n%s\n", atomic_read(&mhi_dev->bus_vote),
+		   "Usage: echo get/put > bus_vote for vote/unvote");
+
+	return 0;
+}
+
+static ssize_t mhi_debugfs_bus_vote_write(struct file *file,
+					  const char __user *ubuf,
+					  size_t count, loff_t *ppos)
+{
+	struct seq_file	*m = file->private_data;
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	char buf[32];
+	int ret = -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "get", 3)) {
+		ret = mhi_device_get_sync(mhi_dev, MHI_VOTE_BUS);
+	} else if (!strncmp(buf, "put", 3)) {
+		mhi_device_put(mhi_dev, MHI_VOTE_BUS);
+		ret = 0;
+	}
+
+	return ret ? ret : count;
+}
+
+static int mhi_debugfs_device_vote_show(struct seq_file *m, void *d)
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
+		   "Votes: %d\n%s\n", atomic_read(&mhi_dev->dev_vote),
+		   "Usage: echo get/put > device_vote for vote/unvote");
+
+	return 0;
+}
+
+static ssize_t mhi_debugfs_device_vote_write(struct file *file,
+					     const char __user *ubuf,
+					     size_t count, loff_t *ppos)
+{
+	struct seq_file	*m = file->private_data;
+	struct mhi_controller *mhi_cntrl = m->private;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	char buf[32];
+	int ret = -EINVAL;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (!strncmp(buf, "get", 3)) {
+		ret = mhi_device_get_sync(mhi_dev, MHI_VOTE_DEVICE);
+	} else if (!strncmp(buf, "put", 3)) {
+		mhi_device_put(mhi_dev, MHI_VOTE_DEVICE);
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
+static int mhi_debugfs_trigger_reset(void *data, u64 val)
+{
+	struct mhi_controller *mhi_cntrl = data;
+	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
+	struct device *dev = &mhi_dev->dev;
+	enum mhi_pm_state cur_state;
+	int ret = -EIO;
+
+	if (!mhi_is_active(mhi_cntrl))
+		return -ENODEV;
+
+	if (!val)
+		return -EINVAL;
+
+	ret = mhi_device_get_sync(mhi_dev, MHI_VOTE_DEVICE);
+	if (ret) {
+		dev_err(dev, "Device did not enter M0 state, MHI:%s, PM:%s\n",
+			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+			to_mhi_pm_state_str(mhi_cntrl->pm_state));
+		return ret;
+	}
+
+	if (mhi_cntrl->rddm_image) {
+		ret = mhi_force_rddm_mode(mhi_cntrl);
+		goto exit_mhi_trigger_reset;
+	}
+
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_DETECT);
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	if (cur_state != MHI_PM_SYS_ERR_DETECT)
+		goto exit_mhi_trigger_reset;
+
+	mhi_pm_sys_err_handler(mhi_cntrl);
+	ret = 0;
+
+exit_mhi_trigger_reset:
+	mhi_device_put(mhi_dev, MHI_VOTE_DEVICE);
+
+	return ret;
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
+static int mhi_debugfs_votes_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_votes_show, inode->i_private);
+}
+
+static int mhi_debugfs_regdump_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_regdump_show, inode->i_private);
+}
+
+static int mhi_debugfs_bus_vote_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_bus_vote_show, inode->i_private);
+}
+
+static int mhi_debugfs_device_vote_open(struct inode *inode, struct file *fp)
+{
+	return single_open(fp, mhi_debugfs_device_vote_show, inode->i_private);
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
+static const struct file_operations debugfs_votes_fops = {
+	.open = mhi_debugfs_votes_open,
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
+static const struct file_operations debugfs_bus_vote_fops = {
+	.open = mhi_debugfs_bus_vote_open,
+	.write = mhi_debugfs_bus_vote_write,
+	.release = single_release,
+	.read = seq_read,
+};
+
+static const struct file_operations debugfs_device_vote_fops = {
+	.open = mhi_debugfs_device_vote_open,
+	.write = mhi_debugfs_device_vote_write,
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
+DEFINE_DEBUGFS_ATTRIBUTE(debugfs_reset_fops, NULL,
+			 mhi_debugfs_trigger_reset, "%llu\n");
+
+static struct dentry *mhi_debugfs_root;
+
+void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
+{
+	if (IS_ERR_OR_NULL(mhi_debugfs_root))
+		return;
+
+	mhi_cntrl->debugfs_dentry =
+			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
+					   mhi_debugfs_root);
+	if (IS_ERR_OR_NULL(mhi_cntrl->debugfs_dentry))
+		return;
+
+	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_states_fops);
+	debugfs_create_file("events", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_events_fops);
+	debugfs_create_file("channels", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_channels_fops);
+	debugfs_create_file("votes", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_votes_fops);
+	debugfs_create_file("regdump", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_regdump_fops);
+	debugfs_create_file("bus_vote", 0644, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_bus_vote_fops);
+	debugfs_create_file("device_vote", 0644, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_device_vote_fops);
+	debugfs_create_file("timeout_ms", 0644, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_timeout_ms_fops);
+	debugfs_create_file("reset", 0444, mhi_cntrl->debugfs_dentry,
+			    mhi_cntrl, &debugfs_reset_fops);
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
index 0d39779..83ad544 100644
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
 
@@ -1287,11 +1292,13 @@ struct bus_type mhi_bus_type = {
 
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
index 2f18be7..798aa483 100644
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
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 4c9812a..783e3d5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -256,6 +256,7 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
 		dev_err(dev, "Unable to transition to M0 state\n");
 		return -EIO;
 	}
+	mhi_cntrl->M0++;
 
 	/* Wake up the device */
 	read_lock_bh(&mhi_cntrl->pm_lock);
@@ -326,6 +327,8 @@ void mhi_pm_m1_transition(struct mhi_controller *mhi_cntrl)
 		mhi_cntrl->dev_state = MHI_STATE_M2;
 
 		write_unlock_irq(&mhi_cntrl->pm_lock);
+
+		mhi_cntrl->M2++;
 		wake_up_all(&mhi_cntrl->state_event);
 
 		/* If there are any pending resources, exit M2 immediately */
@@ -362,6 +365,7 @@ int mhi_pm_m3_transition(struct mhi_controller *mhi_cntrl)
 		return -EIO;
 	}
 
+	mhi_cntrl->M3++;
 	wake_up_all(&mhi_cntrl->state_event);
 
 	return 0;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 9b7bf28..026a624 100644
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
@@ -329,6 +330,7 @@ struct mhi_controller_config {
  * @dev_state: MHI device state
  * @dev_wake: Device wakeup count
  * @pending_pkts: Pending packets for the controller
+ * @M0, M2, M3, M3_fast: Counters to track number of device MHI state changes
  * @transition_list: List of MHI state transitions
  * @transition_lock: Lock for protecting MHI state transition list
  * @wlock: Lock for protecting device wakeup
@@ -367,6 +369,7 @@ struct mhi_controller_config {
 struct mhi_controller {
 	struct device *cntrl_dev;
 	struct mhi_device *mhi_dev;
+	struct dentry *debugfs_dentry;
 	void __iomem *regs;
 	void __iomem *bhi;
 	void __iomem *bhie;
@@ -408,6 +411,7 @@ struct mhi_controller {
 	enum mhi_state dev_state;
 	atomic_t dev_wake;
 	atomic_t pending_pkts;
+	u32 M0, M2, M3, M3_fast;
 	struct list_head transition_list;
 	spinlock_t transition_lock;
 	spinlock_t wlock;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
