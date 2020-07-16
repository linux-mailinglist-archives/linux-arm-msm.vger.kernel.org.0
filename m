Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2926B221BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 07:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgGPFBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 01:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbgGPFBn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 01:01:43 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545E2C061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 22:01:43 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a24so3120894pfc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2020 22:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DSAaKrptW0hSfMnahm7VvrjxxzgGfl/z6gc2CsRWGXw=;
        b=hJu70o5OvnFdHYl4aqdgFheZ+ARGV2Eh+6ZSiwStS9OotKX/6gE5x0q/edibqi6Qw6
         Lp6RAyvUss6JX9rehMUiCtZ2T1enCcv9jXGJ80eAZZCNbYyveoa8IFYM6SagCSJUL2ze
         6lQ0Pk+juVcpVa1c68TTBYsOWDkbm3pZlrwWEM9ygI1DzowGcCN69XdJP1xMKQ+f1J1+
         mZUK2fyxxtUrA7zT1N1lhHFWEQNBa1tgNV2Yzno9VYIO1s0kLd13iH5xqqfgdbsoUq8l
         oqhDBbVblLOOZLLGyvgw0P39rqzJC1sL4oD0ntzajnyPmk3XBkWVzOtVkUN1uRWlaRVF
         lWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DSAaKrptW0hSfMnahm7VvrjxxzgGfl/z6gc2CsRWGXw=;
        b=V6mSu262ZCKTV9QaDGmSnhm9GUGKkhCz9Ds/uPn/zF4QM45GnbC/UXWULLiK1NDkOh
         bDi9uCXGPr23xQQBxi4BnVUlaRWADiMOZbq1XInMpgUjpOneA7sbiIHvmEHPb0bVdLX3
         c7N7EhiKlhjGc+lg4nAphvVLf2OCqHJqKADeveS87iaNJfa5Z52RYEi7fsY+hVvH/Qsx
         om1pb8rpGlPBwfqIa2/A8y7f6niF1vT/JCMfrqOoB1z4S+7EAglh1+sNbyXRYPXa3DFz
         fkqot8W1W4A2Rx7IXl4Fhea0d1mnAo7ZjeQBJF+07jcHH0fThfyWmDY23OlJXwIGQ+5+
         gs4A==
X-Gm-Message-State: AOAM532uThwI6FA7DmEFXYE3xwGlygktR6ldk3xjTxFssrr4IvNrw65t
        0aQpcP4+FQsibC4MhFBnpjnJ
X-Google-Smtp-Source: ABdhPJzXmjYlJQW7j8FrEDvPO8L70jQDhey55sVay9duzZnQanV/MyBs42ghG32BS4tm+wNudBCKrA==
X-Received: by 2002:a05:6a00:224f:: with SMTP id i15mr2264719pfu.241.1594875702529;
        Wed, 15 Jul 2020 22:01:42 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d89:fed1:8431:5b69:9df5:ad9f])
        by smtp.gmail.com with ESMTPSA id q66sm3616460pga.29.2020.07.15.22.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 22:01:41 -0700 (PDT)
Date:   Thu, 16 Jul 2020 10:31:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bbhatt@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 7/9] bus: mhi: core: Introduce debugfs entries and
 counters for MHI
Message-ID: <20200716050136.GD3271@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-8-git-send-email-bbhatt@codeaurora.org>
 <20200704154140.GG3066@Mani-XPS-13-9360>
 <e8ba3291253743bd9bc5405c3d94441f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8ba3291253743bd9bc5405c3d94441f@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 09, 2020 at 12:33:02PM -0700, bbhatt@codeaurora.org wrote:
> On 2020-07-04 08:41, Manivannan Sadhasivam wrote:
> > On Mon, Jun 29, 2020 at 09:39:40AM -0700, Bhaumik Bhatt wrote:
> > > Introduce debugfs entries to show state, register, channel, and event
> > > ring information. Add MHI state counters to keep track of the state
> > > changes on the device. Also, allow the host to trigger a device reset,
> > > issue votes, and change the MHI timeout to help in debug.
> > > 
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/Kconfig         |   8 +
> > >  drivers/bus/mhi/core/Makefile   |   5 +-
> > >  drivers/bus/mhi/core/debugfs.c  | 444
> > > ++++++++++++++++++++++++++++++++++++++++
> > >  drivers/bus/mhi/core/init.c     |   7 +
> > >  drivers/bus/mhi/core/internal.h |  24 +++
> > >  drivers/bus/mhi/core/pm.c       |   4 +
> > >  include/linux/mhi.h             |   4 +
> > >  7 files changed, 493 insertions(+), 3 deletions(-)
> > >  create mode 100644 drivers/bus/mhi/core/debugfs.c
> > > 
> > > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > > index a8bd9bd..6a217ff 100644
> > > --- a/drivers/bus/mhi/Kconfig
> > > +++ b/drivers/bus/mhi/Kconfig
> > > @@ -12,3 +12,11 @@ config MHI_BUS
> > >  	 communication protocol used by the host processors to control
> > >  	 and communicate with modem devices over a high speed peripheral
> > >  	 bus or shared memory.
> > > +
> > > +config MHI_BUS_DEBUG
> > > +	bool "Debugfs support for the MHI bus"
> > > +	depends on MHI_BUS && DEBUG_FS
> > > +	help
> > > +	 Enable debugfs support for use with the MHI transport. Allows
> > > +	 reading and/or modifying some values within the MHI controller
> > > +	 for debug and test purposes.
> > > diff --git a/drivers/bus/mhi/core/Makefile
> > > b/drivers/bus/mhi/core/Makefile
> > > index 66e2700..460a548 100644
> > > --- a/drivers/bus/mhi/core/Makefile
> > > +++ b/drivers/bus/mhi/core/Makefile
> > > @@ -1,3 +1,2 @@
> > > -obj-$(CONFIG_MHI_BUS) := mhi.o
> > > -
> > > -mhi-y := init.o main.o pm.o boot.o
> > > +obj-$(CONFIG_MHI_BUS) := init.o main.o pm.o boot.o
> > > +obj-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
> > > diff --git a/drivers/bus/mhi/core/debugfs.c
> > > b/drivers/bus/mhi/core/debugfs.c
> > > new file mode 100644
> > > index 0000000..266cbf0
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/core/debugfs.c
> > > @@ -0,0 +1,444 @@
> > > +static int mhi_debugfs_device_vote_show(struct seq_file *m, void *d)
> > > +{

[...]

> > 
> > The term 'vote' is confusing here. Can you come up with something which
> > portrays
> > device power mode here?
> > 
> I was hoping vote would be appropriate as we would like to "vote" for the
> device to be
> in active state by doing a "get" on it. If a vote is present, it would mean
> that the
> device is in its active/M0 power state which can be seen on the "states"
> debugfs entry.
> 
> Let me know what you think. I will consult Hemant on this as well once more.

If you want to go with the term 'vote', then please add a prefix like power.
This makes it more explicit. Simply saying 'device vote' doesn't mean power
state.

> > > +	struct mhi_controller *mhi_cntrl = m->private;
> > > +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> > > +
> > > +	if (!mhi_is_active(mhi_cntrl)) {
> > > +		seq_puts(m, "Device not ready\n");
> > > +		return -ENODEV;
> > > +	}
> > > +
> > > +	seq_printf(m,
> > > +		   "Votes: %d\n%s\n", mhi_dev->dev_wake,
> > > +		   "Usage: echo get/put > device_vote for vote/unvote");
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static ssize_t mhi_debugfs_device_vote_write(struct file *file,
> > > +					     const char __user *ubuf,
> > > +					     size_t count, loff_t *ppos)
> > > +{
> > > +	struct seq_file	*m = file->private_data;
> > > +	struct mhi_controller *mhi_cntrl = m->private;
> > > +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> > > +	char buf[32];
> > > +	int ret = -EINVAL;
> > > +
> > > +	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1,
> > > count)))
> > > +		return -EFAULT;
> > > +
> > > +	if (!strncmp(buf, "get", 3)) {
> > 
> > Hmm, but the buffer size is 32?
> > 
> Yes, I referred to some other driver while writing this and buffer size was
> chosen
> to be more than enough for comparison purpose. Any other way to handle this?

AFAIK the requirement for the src buffer is to be 16byte aligned so that the
load and store won't cross the cache boundary. So just use 16 in that case.

> > > +		ret = mhi_device_get_sync(mhi_dev);
> > > +	} else if (!strncmp(buf, "put", 3)) {
> > > +		mhi_device_put(mhi_dev);
> > > +		ret = 0;
> > > +	}
> > > +
> > > +	return ret ? ret : count;
> > > +}
> > > +
> > > +static int mhi_debugfs_timeout_ms_show(struct seq_file *m, void *d)
> > > +{
> > > +	struct mhi_controller *mhi_cntrl = m->private;
> > > +
> > > +	seq_printf(m, "%u ms\n", mhi_cntrl->timeout_ms);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static ssize_t mhi_debugfs_timeout_ms_write(struct file *file,
> > > +					    const char __user *ubuf,
> > > +					    size_t count, loff_t *ppos)
> > > +{
> > > +	struct seq_file	*m = file->private_data;
> > > +	struct mhi_controller *mhi_cntrl = m->private;
> > > +	u32 timeout_ms;
> > > +
> > > +	if (kstrtou32_from_user(ubuf, count, 0, &timeout_ms))
> > > +		return -EINVAL;
> > > +
> > > +	mhi_cntrl->timeout_ms = timeout_ms;
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static int mhi_debugfs_trigger_reset(void *data, u64 val)
> > 
> > Triggering reset on host or device?
> > 
> Device. Will update the function and file name approprirately.
> > > +{
> > > +	struct mhi_controller *mhi_cntrl = data;
> > > +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> > > +	struct device *dev = &mhi_dev->dev;
> > > +	enum mhi_pm_state cur_state;
> > > +	int ret = -EIO;
> > > +
> > > +	if (!mhi_is_active(mhi_cntrl))
> > > +		return -ENODEV;
> > > +
> > > +	if (!val)
> > > +		return -EINVAL;
> > > +
> > > +	ret = mhi_device_get_sync(mhi_dev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Device did not enter M0 state, MHI:%s, PM:%s\n",
> > > +			TO_MHI_STATE_STR(mhi_cntrl->dev_state),
> > > +			to_mhi_pm_state_str(mhi_cntrl->pm_state));
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (mhi_cntrl->rddm_image) {
> > > +		ret = mhi_force_rddm_mode(mhi_cntrl);
> > > +		goto exit_mhi_trigger_reset;
> > > +	}
> > > +
> > > +	write_lock_irq(&mhi_cntrl->pm_lock);
> > > +	cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_SYS_ERR_DETECT);
> > 
> > Looks like in host but how does this resets it?
> > 
> This is the bus internally moving the PM state to "sys error detect" state
> so we can
> check if our state machine allows this move and force a sys error to the
> device.

But how does this reset the client device? I don't find anything related to this
in the MHI spec available to me.

> > > +	write_unlock_irq(&mhi_cntrl->pm_lock);
> > > +
> > > +	if (cur_state != MHI_PM_SYS_ERR_DETECT)
> > > +		goto exit_mhi_trigger_reset;
> > 
> > So this condition is also a success? PS: you're not setting ret here.
> > 
> Thanks for pointing out. It is not a success condition and should return
> -EPERM.
> I will fix it.

[...]

> > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > index 74c5cb1..c80d3553 100644
> > > --- a/drivers/bus/mhi/core/pm.c
> > > +++ b/drivers/bus/mhi/core/pm.c
> > > @@ -256,6 +256,7 @@ int mhi_pm_m0_transition(struct mhi_controller
> > > *mhi_cntrl)
> > >  		dev_err(dev, "Unable to transition to M0 state\n");
> > >  		return -EIO;
> > >  	}
> > > +	mhi_cntrl->M0++;
> > 
> > This change shouldn't be part of this patch.
> > 
> > Thanks,
> > Mani
> > 
> I remember you said this last time as well but I've introduced counters and
> used them in the same patch. It is mentioned in the commit subject and text.
> If you still have concerns, please let me know.

But still these two are separate functionalities. So please split into two
patches.

Thanks,
Mani

> 
> Thanks,
> Bhaumik
> > > 
> > >  	/* Wake up the device */
> > >  	read_lock_bh(&mhi_cntrl->pm_lock);
> > > @@ -326,6 +327,8 @@ void mhi_pm_m1_transition(struct mhi_controller
> > > *mhi_cntrl)
> > >  		mhi_cntrl->dev_state = MHI_STATE_M2;
> > > 
> > >  		write_unlock_irq(&mhi_cntrl->pm_lock);
> > > +
> > > +		mhi_cntrl->M2++;
> > >  		wake_up_all(&mhi_cntrl->state_event);
> > > 
> > >  		/* If there are any pending resources, exit M2 immediately */
> > > @@ -362,6 +365,7 @@ int mhi_pm_m3_transition(struct mhi_controller
> > > *mhi_cntrl)
> > >  		return -EIO;
> > >  	}
> > > 
> > > +	mhi_cntrl->M3++;
> > >  	wake_up_all(&mhi_cntrl->state_event);
> > > 
> > >  	return 0;
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index 7ed785e..b1e8b4f 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -288,6 +288,7 @@ struct mhi_controller_config {
> > >   * @cntrl_dev: Pointer to the struct device of physical bus acting
> > > as the MHI
> > >   *            controller (required)
> > >   * @mhi_dev: MHI device instance for the controller
> > > + * @debugfs_dentry: MHI controller debugfs directory
> > >   * @regs: Base address of MHI MMIO register space (required)
> > >   * @bhi: Points to base of MHI BHI register space
> > >   * @bhie: Points to base of MHI BHIe register space
> > > @@ -326,6 +327,7 @@ struct mhi_controller_config {
> > >   * @dev_state: MHI device state
> > >   * @dev_wake: Device wakeup count
> > >   * @pending_pkts: Pending packets for the controller
> > > + * @M0, M2, M3, M3_fast: Counters to track number of device MHI
> > > state changes
> > >   * @transition_list: List of MHI state transitions
> > >   * @transition_lock: Lock for protecting MHI state transition list
> > >   * @wlock: Lock for protecting device wakeup
> > > @@ -364,6 +366,7 @@ struct mhi_controller_config {
> > >  struct mhi_controller {
> > >  	struct device *cntrl_dev;
> > >  	struct mhi_device *mhi_dev;
> > > +	struct dentry *debugfs_dentry;
> > >  	void __iomem *regs;
> > >  	void __iomem *bhi;
> > >  	void __iomem *bhie;
> > > @@ -405,6 +408,7 @@ struct mhi_controller {
> > >  	enum mhi_state dev_state;
> > >  	atomic_t dev_wake;
> > >  	atomic_t pending_pkts;
> > > +	u32 M0, M2, M3, M3_fast;
> > >  	struct list_head transition_list;
> > >  	spinlock_t transition_lock;
> > >  	spinlock_t wlock;
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
