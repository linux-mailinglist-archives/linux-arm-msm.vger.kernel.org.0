Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8DB21A7D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 21:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgGITdK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 15:33:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:24201 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbgGITdI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 15:33:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594323186; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Y+5xxbr8kPL+7eAd9XkmWoVGLzy9u4wtG7spfdbd5zg=;
 b=GP8UmmmIjFjIEmalWHwOVJRqUrSGM0zDeEjSJoe2Qx6BOQnwBjuuitiPsK0ms32sxk7/566L
 R9FZYDGSJvmZfv/ZkpzZ0nv96+29SBkpXo/ZtU6El7KCQikPaz8wx8bx/+LWOGB15xM0FacL
 v6F6mZ1cfTDK/MPvyGhmtwLL+hs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f0770eff97e988aab3851b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 19:33:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B948C433CA; Thu,  9 Jul 2020 19:33:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 352E4C433C6;
        Thu,  9 Jul 2020 19:33:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 09 Jul 2020 12:33:02 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 7/9] bus: mhi: core: Introduce debugfs entries and
 counters for MHI
In-Reply-To: <20200704154140.GG3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-8-git-send-email-bbhatt@codeaurora.org>
 <20200704154140.GG3066@Mani-XPS-13-9360>
Message-ID: <e8ba3291253743bd9bc5405c3d94441f@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-04 08:41, Manivannan Sadhasivam wrote:
> On Mon, Jun 29, 2020 at 09:39:40AM -0700, Bhaumik Bhatt wrote:
>> Introduce debugfs entries to show state, register, channel, and event
>> ring information. Add MHI state counters to keep track of the state
>> changes on the device. Also, allow the host to trigger a device reset,
>> issue votes, and change the MHI timeout to help in debug.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/Kconfig         |   8 +
>>  drivers/bus/mhi/core/Makefile   |   5 +-
>>  drivers/bus/mhi/core/debugfs.c  | 444 
>> ++++++++++++++++++++++++++++++++++++++++
>>  drivers/bus/mhi/core/init.c     |   7 +
>>  drivers/bus/mhi/core/internal.h |  24 +++
>>  drivers/bus/mhi/core/pm.c       |   4 +
>>  include/linux/mhi.h             |   4 +
>>  7 files changed, 493 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/bus/mhi/core/debugfs.c
>> 
>> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
>> index a8bd9bd..6a217ff 100644
>> --- a/drivers/bus/mhi/Kconfig
>> +++ b/drivers/bus/mhi/Kconfig
>> @@ -12,3 +12,11 @@ config MHI_BUS
>>  	 communication protocol used by the host processors to control
>>  	 and communicate with modem devices over a high speed peripheral
>>  	 bus or shared memory.
>> +
>> +config MHI_BUS_DEBUG
>> +	bool "Debugfs support for the MHI bus"
>> +	depends on MHI_BUS && DEBUG_FS
>> +	help
>> +	 Enable debugfs support for use with the MHI transport. Allows
>> +	 reading and/or modifying some values within the MHI controller
>> +	 for debug and test purposes.
>> diff --git a/drivers/bus/mhi/core/Makefile 
>> b/drivers/bus/mhi/core/Makefile
>> index 66e2700..460a548 100644
>> --- a/drivers/bus/mhi/core/Makefile
>> +++ b/drivers/bus/mhi/core/Makefile
>> @@ -1,3 +1,2 @@
>> -obj-$(CONFIG_MHI_BUS) := mhi.o
>> -
>> -mhi-y := init.o main.o pm.o boot.o
>> +obj-$(CONFIG_MHI_BUS) := init.o main.o pm.o boot.o
>> +obj-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>> diff --git a/drivers/bus/mhi/core/debugfs.c 
>> b/drivers/bus/mhi/core/debugfs.c
>> new file mode 100644
>> index 0000000..266cbf0
>> --- /dev/null
>> +++ b/drivers/bus/mhi/core/debugfs.c
>> @@ -0,0 +1,444 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>> + *
>> + */
>> +
>> +#include <linux/debugfs.h>
>> +#include <linux/device.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/list.h>
>> +#include <linux/mhi.h>
>> +#include "internal.h"
>> +
>> +static int mhi_debugfs_states_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +
>> +	/* states */
>> +	seq_printf(m, "PM state:%s Device:%s MHI state:%s EE:%s wake:%s\n",
>> +		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
>> +		   mhi_is_active(mhi_cntrl) ? "Active" : "Inactive",
>> +		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
>> +		   TO_MHI_EXEC_STR(mhi_cntrl->ee),
>> +		   mhi_cntrl->wake_set ? "true" : "false");
> 
> Nit: Always use a space after ":".
> 
Sure.
>> +
>> +	/* counters */
>> +	seq_printf(m, "M0:%u M2:%u M3:%u M3_Fast:%u", mhi_cntrl->M0,
>> +		   mhi_cntrl->M2, mhi_cntrl->M3, mhi_cntrl->M3_fast);
>> +
>> +	seq_printf(m, " device wake:%u pending packets:%u\n",
>> +		   atomic_read(&mhi_cntrl->dev_wake),
>> +		   atomic_read(&mhi_cntrl->pending_pkts));
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_debugfs_events_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	struct mhi_event *mhi_event;
>> +	struct mhi_event_ctxt *er_ctxt;
>> +	int i;
>> +
>> +	if (!mhi_is_active(mhi_cntrl)) {
>> +		seq_puts(m, "Device not ready\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	er_ctxt = mhi_cntrl->mhi_ctxt->er_ctxt;
>> +	mhi_event = mhi_cntrl->mhi_event;
>> +	for (i = 0; i < mhi_cntrl->total_ev_rings;
>> +						i++, er_ctxt++, mhi_event++) {
>> +		struct mhi_ring *ring = &mhi_event->ring;
>> +
>> +		if (mhi_event->offload_ev) {
>> +			seq_printf(m, "Index:%d is an offload event ring\n", i);
>> +			continue;
>> +		}
>> +
>> +		seq_printf(m, "Index:%d intmod count:%lu time:%lu",
>> +			   i, (er_ctxt->intmod & EV_CTX_INTMODC_MASK) >>
>> +			   EV_CTX_INTMODC_SHIFT,
>> +			   (er_ctxt->intmod & EV_CTX_INTMODT_MASK) >>
>> +			   EV_CTX_INTMODT_SHIFT);
>> +
>> +		seq_printf(m, " base:0x%0llx len:0x%llx", er_ctxt->rbase,
>> +			   er_ctxt->rlen);
>> +
>> +		seq_printf(m,
>> +			   " rp:0x%llx wp:0x%llx local rp:0x%llx db:0x%llx\n",
>> +			   er_ctxt->rp, er_ctxt->wp, (u64)ring->rp,
>> +			   mhi_event->db_cfg.db_val);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	struct mhi_chan *mhi_chan;
>> +	struct mhi_chan_ctxt *chan_ctxt;
>> +	int i;
>> +
>> +	if (!mhi_is_active(mhi_cntrl)) {
>> +		seq_puts(m, "Device not ready\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	mhi_chan = mhi_cntrl->mhi_chan;
>> +	chan_ctxt = mhi_cntrl->mhi_ctxt->chan_ctxt;
>> +	for (i = 0; i < mhi_cntrl->max_chan; i++, chan_ctxt++, mhi_chan++) {
>> +		struct mhi_ring *ring = &mhi_chan->tre_ring;
>> +
>> +		if (mhi_chan->offload_ch) {
>> +			seq_printf(m, "%s(%u) is an offload channel\n",
>> +				   mhi_chan->name, mhi_chan->chan);
>> +			continue;
>> +		}
>> +
>> +		if (!mhi_chan->mhi_dev)
>> +			continue;
>> +
>> +		seq_printf(m,
>> +			   "%s(%u) state:0x%lx brstmode:0x%lx pollcfg:0x%lx",
>> +			   mhi_chan->name, mhi_chan->chan, (chan_ctxt->chcfg &
>> +			   CHAN_CTX_CHSTATE_MASK) >> CHAN_CTX_CHSTATE_SHIFT,
>> +			   (chan_ctxt->chcfg & CHAN_CTX_BRSTMODE_MASK) >>
>> +			   CHAN_CTX_BRSTMODE_SHIFT, (chan_ctxt->chcfg &
>> +			   CHAN_CTX_POLLCFG_MASK) >> CHAN_CTX_POLLCFG_SHIFT);
>> +
>> +		seq_printf(m, " type:0x%x event ring:%u", chan_ctxt->chtype,
>> +			   chan_ctxt->erindex);
>> +
>> +		seq_printf(m, " base:0x%llx len:0x%llx wp:0x%llx",
>> +			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
>> +
>> +		seq_printf(m, " local rp:0x%llx local wp:0x%llx db:0x%llx\n",
>> +			   (u64)ring->rp, (u64)ring->wp,
>> +			   mhi_chan->db_cfg.db_val);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_device_votes_show(struct device *dev, void *data)
>> +{
>> +	struct mhi_device *mhi_dev;
>> +
>> +	if (dev->bus != &mhi_bus_type)
>> +		return 0;
>> +
>> +	mhi_dev = to_mhi_device(dev);
>> +
>> +	seq_printf((struct seq_file *)data, "%s: %u\n",
>> +		   mhi_dev->name, mhi_dev->dev_wake);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_debugfs_votes_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +
>> +	if (!mhi_is_active(mhi_cntrl)) {
>> +		seq_puts(m, "Device not ready\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	device_for_each_child(mhi_cntrl->cntrl_dev, m, 
>> mhi_device_votes_show);
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_debugfs_regdump_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	enum mhi_state state;
>> +	enum mhi_ee_type ee;
>> +	int i, ret = -EIO;
>> +	u32 val;
>> +	void __iomem *mhi_base = mhi_cntrl->regs;
>> +	void __iomem *bhi_base = mhi_cntrl->bhi;
>> +	void __iomem *bhie_base = mhi_cntrl->bhie;
>> +	void __iomem *wake_db = mhi_cntrl->wake_db;
>> +	struct {
>> +		const char *name;
>> +		int offset;
>> +		void __iomem *base;
>> +	} debug_regs[] = {
>> +		{ "MHI_CTRL", MHICTRL, mhi_base},
>> +		{ "MHI_STATUS", MHISTATUS, mhi_base},
>> +		{ "MHI_WAKE_DB", 0, wake_db},
>> +		{ "BHI_EXECENV", BHI_EXECENV, bhi_base},
>> +		{ "BHI_STATUS", BHI_STATUS, bhi_base},
>> +		{ "BHI_ERRCODE", BHI_ERRCODE, bhi_base},
>> +		{ "BHI_ERRDBG1", BHI_ERRDBG1, bhi_base},
>> +		{ "BHI_ERRDBG2", BHI_ERRDBG2, bhi_base},
>> +		{ "BHI_ERRDBG3", BHI_ERRDBG3, bhi_base},
>> +		{ "BHIE_TXVEC_DB", BHIE_TXVECDB_OFFS, bhie_base},
>> +		{ "BHIE_TXVEC_STATUS", BHIE_TXVECSTATUS_OFFS, bhie_base},
>> +		{ "BHIE_RXVEC_DB", BHIE_RXVECDB_OFFS, bhie_base},
>> +		{ "BHIE_RXVEC_STATUS", BHIE_RXVECSTATUS_OFFS, bhie_base},
>> +		{ NULL },
>> +	};
>> +
>> +	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
>> +		return ret;
>> +
>> +	seq_printf(m, "Host PM state:%s Device state:%s EE:%s\n",
>> +		   to_mhi_pm_state_str(mhi_cntrl->pm_state),
>> +		   TO_MHI_STATE_STR(mhi_cntrl->dev_state),
>> +		   TO_MHI_EXEC_STR(mhi_cntrl->ee));
>> +
>> +	state = mhi_get_mhi_state(mhi_cntrl);
>> +	ee = mhi_get_exec_env(mhi_cntrl);
>> +	seq_printf(m, "Device EE:%s state:%s\n", TO_MHI_EXEC_STR(ee),
>> +		   TO_MHI_STATE_STR(state));
>> +
>> +	for (i = 0; debug_regs[i].name; i++) {
>> +		if (!debug_regs[i].base)
>> +			continue;
>> +		ret = mhi_read_reg(mhi_cntrl, debug_regs[i].base,
>> +				   debug_regs[i].offset, &val);
>> +		if (ret)
>> +			continue;
>> +
>> +		seq_printf(m, "%s:0x%x\n", debug_regs[i].name, val);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int mhi_debugfs_device_vote_show(struct seq_file *m, void *d)
>> +{
> 
> The term 'vote' is confusing here. Can you come up with something which 
> portrays
> device power mode here?
> 
I was hoping vote would be appropriate as we would like to "vote" for 
the device to be
in active state by doing a "get" on it. If a vote is present, it would 
mean that the
device is in its active/M0 power state which can be seen on the "states" 
debugfs entry.

Let me know what you think. I will consult Hemant on this as well once 
more.
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
>> +
>> +	if (!mhi_is_active(mhi_cntrl)) {
>> +		seq_puts(m, "Device not ready\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	seq_printf(m,
>> +		   "Votes: %d\n%s\n", mhi_dev->dev_wake,
>> +		   "Usage: echo get/put > device_vote for vote/unvote");
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t mhi_debugfs_device_vote_write(struct file *file,
>> +					     const char __user *ubuf,
>> +					     size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file	*m = file->private_data;
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
>> +	char buf[32];
>> +	int ret = -EINVAL;
>> +
>> +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, 
>> count)))
>> +		return -EFAULT;
>> +
>> +	if (!strncmp(buf, "get", 3)) {
> 
> Hmm, but the buffer size is 32?
> 
Yes, I referred to some other driver while writing this and buffer size 
was chosen
to be more than enough for comparison purpose. Any other way to handle 
this?
>> +		ret = mhi_device_get_sync(mhi_dev);
>> +	} else if (!strncmp(buf, "put", 3)) {
>> +		mhi_device_put(mhi_dev);
>> +		ret = 0;
>> +	}
>> +
>> +	return ret ? ret : count;
>> +}
>> +
>> +static int mhi_debugfs_timeout_ms_show(struct seq_file *m, void *d)
>> +{
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +
>> +	seq_printf(m, "%u ms\n", mhi_cntrl->timeout_ms);
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t mhi_debugfs_timeout_ms_write(struct file *file,
>> +					    const char __user *ubuf,
>> +					    size_t count, loff_t *ppos)
>> +{
>> +	struct seq_file	*m = file->private_data;
>> +	struct mhi_controller *mhi_cntrl = m->private;
>> +	u32 timeout_ms;
>> +
>> +	if (kstrtou32_from_user(ubuf, count, 0, &timeout_ms))
>> +		return -EINVAL;
>> +
>> +	mhi_cntrl->timeout_ms = timeout_ms;
>> +
>> +	return count;
>> +}
>> +
>> +static int mhi_debugfs_trigger_reset(void *data, u64 val)
> 
> Triggering reset on host or device?
> 
Device. Will update the function and file name approprirately.
>> +{
>> +	struct mhi_controller *mhi_cntrl = data;
>> +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
>> +	struct device *dev = &mhi_dev->dev;
>> +	enum mhi_pm_state cur_state;
>> +	int ret = -EIO;
>> +
>> +	if (!mhi_is_active(mhi_cntrl))
>> +		return -ENODEV;
>> +
>> +	if (!val)
>> +		return -EINVAL;
>> +
>> +	ret = mhi_device_get_sync(mhi_dev);
>> +	if (ret) {
>> +		dev_err(dev, "Device did not enter M0 state, MHI:%s, PM:%s\n",
>> +			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
>> +			to_mhi_pm_state_str(mhi_cntrl->pm_state));
>> +		return ret;
>> +	}
>> +
>> +	if (mhi_cntrl->rddm_image) {
>> +		ret = mhi_force_rddm_mode(mhi_cntrl);
>> +		goto exit_mhi_trigger_reset;
>> +	}
>> +
>> +	write_lock_irq(&mhi_cntrl->pm_lock);
>> +	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_DETECT);
> 
> Looks like in host but how does this resets it?
> 
This is the bus internally moving the PM state to "sys error detect" 
state so we can
check if our state machine allows this move and force a sys error to the 
device.
>> +	write_unlock_irq(&mhi_cntrl->pm_lock);
>> +
>> +	if (cur_state != MHI_PM_SYS_ERR_DETECT)
>> +		goto exit_mhi_trigger_reset;
> 
> So this condition is also a success? PS: you're not setting ret here.
> 
Thanks for pointing out. It is not a success condition and should return 
-EPERM.
I will fix it.
>> +
>> +	mhi_pm_sys_err_handler(mhi_cntrl);
>> +	ret = 0;
>> +
>> +exit_mhi_trigger_reset:
>> +	mhi_device_put(mhi_dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int mhi_debugfs_states_open(struct inode *inode, struct file 
>> *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_states_show, inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_events_open(struct inode *inode, struct file 
>> *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_events_show, inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_channels_open(struct inode *inode, struct file 
>> *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_channels_show, inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_votes_open(struct inode *inode, struct file 
>> *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_votes_show, inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_regdump_open(struct inode *inode, struct file 
>> *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_regdump_show, inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_device_vote_open(struct inode *inode, struct 
>> file *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_device_vote_show, 
>> inode->i_private);
>> +}
>> +
>> +static int mhi_debugfs_timeout_ms_open(struct inode *inode, struct 
>> file *fp)
>> +{
>> +	return single_open(fp, mhi_debugfs_timeout_ms_show, 
>> inode->i_private);
>> +}
>> +
>> +static const struct file_operations debugfs_states_fops = {
>> +	.open = mhi_debugfs_states_open,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_events_fops = {
>> +	.open = mhi_debugfs_events_open,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_channels_fops = {
>> +	.open = mhi_debugfs_channels_open,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_votes_fops = {
>> +	.open = mhi_debugfs_votes_open,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_regdump_fops = {
>> +	.open = mhi_debugfs_regdump_open,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_device_vote_fops = {
>> +	.open = mhi_debugfs_device_vote_open,
>> +	.write = mhi_debugfs_device_vote_write,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +static const struct file_operations debugfs_timeout_ms_fops = {
>> +	.open = mhi_debugfs_timeout_ms_open,
>> +	.write = mhi_debugfs_timeout_ms_write,
>> +	.release = single_release,
>> +	.read = seq_read,
>> +};
>> +
>> +DEFINE_DEBUGFS_ATTRIBUTE(debugfs_reset_fops, NULL,
>> +			 mhi_debugfs_trigger_reset, "%llu\n");
>> +
>> +static struct dentry *mhi_debugfs_root;
>> +
>> +void mhi_create_debugfs(struct mhi_controller *mhi_cntrl)
>> +{
>> +	mhi_cntrl->debugfs_dentry =
>> +			debugfs_create_dir(dev_name(mhi_cntrl->cntrl_dev),
>> +					   mhi_debugfs_root);
>> +
>> +	debugfs_create_file("states", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_states_fops);
>> +	debugfs_create_file("events", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_events_fops);
>> +	debugfs_create_file("channels", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_channels_fops);
>> +	debugfs_create_file("votes", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_votes_fops);
>> +	debugfs_create_file("regdump", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_regdump_fops);
>> +	debugfs_create_file("device_vote", 0644, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_device_vote_fops);
>> +	debugfs_create_file("timeout_ms", 0644, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_timeout_ms_fops);
>> +	debugfs_create_file("reset", 0444, mhi_cntrl->debugfs_dentry,
>> +			    mhi_cntrl, &debugfs_reset_fops);
>> +}
>> +
>> +void mhi_destroy_debugfs(struct mhi_controller *mhi_cntrl)
>> +{
>> +	debugfs_remove_recursive(mhi_cntrl->debugfs_dentry);
>> +	mhi_cntrl->debugfs_dentry = NULL;
>> +}
>> +
>> +void mhi_debugfs_init(void)
>> +{
>> +	mhi_debugfs_root = debugfs_create_dir(mhi_bus_type.name, NULL);
>> +}
>> +
>> +void mhi_debugfs_exit(void)
>> +{
>> +	debugfs_remove_recursive(mhi_debugfs_root);
>> +}
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index e2011ec..d2c0f6e 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -4,6 +4,7 @@
>>   *
>>   */
>> 
>> +#include <linux/debugfs.h>
>>  #include <linux/device.h>
>>  #include <linux/dma-direction.h>
>>  #include <linux/dma-mapping.h>
>> @@ -915,6 +916,8 @@ int mhi_register_controller(struct mhi_controller 
>> *mhi_cntrl,
>> 
>>  	mhi_cntrl->mhi_dev = mhi_dev;
>> 
>> +	mhi_create_debugfs(mhi_cntrl);
>> +
>>  	return 0;
>> 
>>  error_add_dev:
>> @@ -937,6 +940,8 @@ void mhi_unregister_controller(struct 
>> mhi_controller *mhi_cntrl)
>>  	struct mhi_chan *mhi_chan = mhi_cntrl->mhi_chan;
>>  	unsigned int i;
>> 
>> +	mhi_destroy_debugfs(mhi_cntrl);
>> +
>>  	kfree(mhi_cntrl->mhi_cmd);
>>  	kfree(mhi_cntrl->mhi_event);
>> 
>> @@ -1284,11 +1289,13 @@ struct bus_type mhi_bus_type = {
>> 
>>  static int __init mhi_init(void)
>>  {
>> +	mhi_debugfs_init();
>>  	return bus_register(&mhi_bus_type);
>>  }
>> 
>>  static void __exit mhi_exit(void)
>>  {
>> +	mhi_debugfs_exit();
>>  	bus_unregister(&mhi_bus_type);
>>  }
>> 
>> diff --git a/drivers/bus/mhi/core/internal.h 
>> b/drivers/bus/mhi/core/internal.h
>> index 997c6e9..368c442 100644
>> --- a/drivers/bus/mhi/core/internal.h
>> +++ b/drivers/bus/mhi/core/internal.h
>> @@ -570,6 +570,30 @@ struct mhi_chan {
>>  /* Default MHI timeout */
>>  #define MHI_TIMEOUT_MS (1000)
>> 
>> +/* debugfs related functions */
>> +#ifdef CONFIG_MHI_BUS_DEBUG
>> +void mhi_create_debugfs(struct mhi_controller *mhi_cntrl);
>> +void mhi_destroy_debugfs(struct mhi_controller *mhi_cntrl);
>> +void mhi_debugfs_init(void);
>> +void mhi_debugfs_exit(void);
>> +#else
>> +static inline void mhi_create_debugfs(struct mhi_controller 
>> *mhi_cntrl)
>> +{
>> +}
>> +
>> +static inline void mhi_destroy_debugfs(struct mhi_controller 
>> *mhi_cntrl)
>> +{
>> +}
>> +
>> +static inline void mhi_debugfs_init(void)
>> +{
>> +}
>> +
>> +static inline void mhi_debugfs_exit(void)
>> +{
>> +}
>> +#endif
>> +
>>  struct mhi_device *mhi_alloc_device(struct mhi_controller 
>> *mhi_cntrl);
>> 
>>  int mhi_destroy_device(struct device *dev, void *data);
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 74c5cb1..c80d3553 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -256,6 +256,7 @@ int mhi_pm_m0_transition(struct mhi_controller 
>> *mhi_cntrl)
>>  		dev_err(dev, "Unable to transition to M0 state\n");
>>  		return -EIO;
>>  	}
>> +	mhi_cntrl->M0++;
> 
> This change shouldn't be part of this patch.
> 
> Thanks,
> Mani
> 
I remember you said this last time as well but I've introduced counters 
and
used them in the same patch. It is mentioned in the commit subject and 
text.
If you still have concerns, please let me know.

Thanks,
Bhaumik
>> 
>>  	/* Wake up the device */
>>  	read_lock_bh(&mhi_cntrl->pm_lock);
>> @@ -326,6 +327,8 @@ void mhi_pm_m1_transition(struct mhi_controller 
>> *mhi_cntrl)
>>  		mhi_cntrl->dev_state = MHI_STATE_M2;
>> 
>>  		write_unlock_irq(&mhi_cntrl->pm_lock);
>> +
>> +		mhi_cntrl->M2++;
>>  		wake_up_all(&mhi_cntrl->state_event);
>> 
>>  		/* If there are any pending resources, exit M2 immediately */
>> @@ -362,6 +365,7 @@ int mhi_pm_m3_transition(struct mhi_controller 
>> *mhi_cntrl)
>>  		return -EIO;
>>  	}
>> 
>> +	mhi_cntrl->M3++;
>>  	wake_up_all(&mhi_cntrl->state_event);
>> 
>>  	return 0;
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 7ed785e..b1e8b4f 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -288,6 +288,7 @@ struct mhi_controller_config {
>>   * @cntrl_dev: Pointer to the struct device of physical bus acting as 
>> the MHI
>>   *            controller (required)
>>   * @mhi_dev: MHI device instance for the controller
>> + * @debugfs_dentry: MHI controller debugfs directory
>>   * @regs: Base address of MHI MMIO register space (required)
>>   * @bhi: Points to base of MHI BHI register space
>>   * @bhie: Points to base of MHI BHIe register space
>> @@ -326,6 +327,7 @@ struct mhi_controller_config {
>>   * @dev_state: MHI device state
>>   * @dev_wake: Device wakeup count
>>   * @pending_pkts: Pending packets for the controller
>> + * @M0, M2, M3, M3_fast: Counters to track number of device MHI state 
>> changes
>>   * @transition_list: List of MHI state transitions
>>   * @transition_lock: Lock for protecting MHI state transition list
>>   * @wlock: Lock for protecting device wakeup
>> @@ -364,6 +366,7 @@ struct mhi_controller_config {
>>  struct mhi_controller {
>>  	struct device *cntrl_dev;
>>  	struct mhi_device *mhi_dev;
>> +	struct dentry *debugfs_dentry;
>>  	void __iomem *regs;
>>  	void __iomem *bhi;
>>  	void __iomem *bhie;
>> @@ -405,6 +408,7 @@ struct mhi_controller {
>>  	enum mhi_state dev_state;
>>  	atomic_t dev_wake;
>>  	atomic_t pending_pkts;
>> +	u32 M0, M2, M3, M3_fast;
>>  	struct list_head transition_list;
>>  	spinlock_t transition_lock;
>>  	spinlock_t wlock;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
