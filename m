Return-Path: <linux-arm-msm+bounces-102885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLVvIXuk3GkEUgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:08:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D03E8D44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 10:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D599B3016D22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB4B3A5444;
	Mon, 13 Apr 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sm5T3nu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4702439A06A;
	Mon, 13 Apr 2026 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067625; cv=none; b=lufrYJw0zyLg7lvdM/A1pbgw9fCFDQB4In1WN0jaIkQHK1sC1MYsbzDarSymGrUwuBuPFMDGL/2NsS4Q3yzxy7wQPIJ84pEPTE6fz5h62I0P0fj6WXxIitIpoz7W7UxMdj3LaaG45lm59ua/GKrx/sOpc96+AwmHjBRAehKXyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067625; c=relaxed/simple;
	bh=zv+tp+wMF5FrcveyN+fqjDGtPExnhSz3lEw/gXQ9aBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTYPpID62W0dM78TG/A0I0dnDSZrI5qno2+F+DTQtfXeuWvkqPazPkZ6K7gYjYDVPZ3DB4hTtJtfcvzzxKTer5NTc/3+U67Cg2GNNnp2dsDDPqQYRMpo3U12lBHlkYnZhY4k+mlgt+3saz47wF/YdKdah/ubIU0PyQ5mQXGvRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sm5T3nu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB367C2BCB3;
	Mon, 13 Apr 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776067624;
	bh=zv+tp+wMF5FrcveyN+fqjDGtPExnhSz3lEw/gXQ9aBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sm5T3nu0p/FZTTjCpW70IwYesneHicMNsIVfbEdgE22IgIp88hvX7qR3SiFX/h/VB
	 9Di2ZckzTRfqJkCYJ/gbSEPIn6SyitEDVBVsBIU34a4G1AUZOw+gq3a7yhY4dDK5wJ
	 A7Y6oObz4N6Ya9fZJzLWBnexK1bBrwDOv6BOPWfpukb7OoAaqH4ibazWer8MpPI0CG
	 5ZUA30nUamRSeAzk3coAMmMClB1FVv/ghfHMCBJNVqjoQCw0y/RrAoEDahiCP88d85
	 gnnD+PqLHpMxPF56sz8X9Mu1xGZEai65VlfHYCI2kolF1vopbXwkDnE3CoBxA6s46F
	 byE1s1/hhgs+Q==
Date: Mon, 13 Apr 2026 13:36:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Imran Shaik <imran.shaik@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/6] bus: mhi: host: mhi_phc: Add support for PHC over
 MHI
Message-ID: <xfjk7dkcgz6qbzzmtelqjxtcus7xtmvnk72bkyqpeb5iie7suu@cqffi4bd27pu>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
 <20260411-tsc_timesync-v2-6-6f25f72987b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260411-tsc_timesync-v2-6-6f25f72987b3@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-102885-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 176D03E8D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 01:42:06PM +0530, Krishna Chaitanya Chundru wrote:
> From: Imran Shaik <imran.shaik@oss.qualcomm.com>
> 
> This patch introduces the MHI PHC (PTP Hardware Clock) driver, which
> registers a PTP (Precision Time Protocol) clock and communicates with
> the MHI core to get the device side timestamps. These timestamps are
> then exposed to the PTP subsystem, enabling precise time synchronization
> between the host and the device.
> 
> The following diagram illustrates the architecture and data flow:
> 
>  +-------------+    +--------------------+    +--------------+
>  |Userspace App|<-->|Kernel PTP framework|<-->|MHI PHC Driver|
>  +-------------+    +--------------------+    +--------------+
>                                                      |
>                                                      v
>  +-------------------------------+         +-----------------+
>  | MHI Device (Timestamp source) |<------->| MHI Core Driver |
>  +-------------------------------+         +-----------------+
> 
> - User space applications use the standard Linux PTP interface.
> - The PTP subsystem routes IOCTLs to the MHI PHC driver.
> - The MHI PHC driver communicates with the MHI core to fetch timestamps.
> - The MHI core interacts with the device to retrieve accurate time data.

As mentioned in cover letter, this is misleading.

> 
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/Kconfig       |   8 ++
>  drivers/bus/mhi/host/Makefile      |   1 +
>  drivers/bus/mhi/host/mhi_phc.c     | 150 +++++++++++++++++++++++++++++++++++++
>  drivers/bus/mhi/host/mhi_phc.h     |  28 +++++++
>  drivers/bus/mhi/host/pci_generic.c |  23 ++++++
>  5 files changed, 210 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/Kconfig b/drivers/bus/mhi/host/Kconfig
> index da5cd0c9fc620ab595e742c422f1a22a2a84c7b9..b4eabf3e5c56907de93232f02962040e979c3110 100644
> --- a/drivers/bus/mhi/host/Kconfig
> +++ b/drivers/bus/mhi/host/Kconfig
> @@ -29,3 +29,11 @@ config MHI_BUS_PCI_GENERIC
>  	  This driver provides MHI PCI controller driver for devices such as
>  	  Qualcomm SDX55 based PCIe modems.
>  
> +config MHI_BUS_PHC
> +	bool "MHI PHC driver"

Why not tristate?

> +	depends on MHI_BUS_PCI_GENERIC

No, this generic TSC driver cannot depend on a controller driver. It should
purely act as a library.

> +	help
> +	  This driver provides Precision Time Protocol (PTP) clock and
> +	  communicates with MHI PCI driver to get the device side timestamp,
> +	  which enables precise time synchronization between the host and
> +	  the device.
> diff --git a/drivers/bus/mhi/host/Makefile b/drivers/bus/mhi/host/Makefile
> index 859c2f38451c669b3d3014c374b2b957c99a1cfe..5ba244fe7d596834ea535797efd3428963ba0ed0 100644
> --- a/drivers/bus/mhi/host/Makefile
> +++ b/drivers/bus/mhi/host/Makefile
> @@ -4,3 +4,4 @@ mhi-$(CONFIG_MHI_BUS_DEBUG) += debugfs.o
>  
>  obj-$(CONFIG_MHI_BUS_PCI_GENERIC) += mhi_pci_generic.o
>  mhi_pci_generic-y += pci_generic.o
> +mhi_pci_generic-$(CONFIG_MHI_BUS_PHC) += mhi_phc.o
> diff --git a/drivers/bus/mhi/host/mhi_phc.c b/drivers/bus/mhi/host/mhi_phc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..fa04eb7f6025fa281d86c0a45b5f7d3e61f5ce12
> --- /dev/null
> +++ b/drivers/bus/mhi/host/mhi_phc.c
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.

2026

> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>

Are these headers really needed?

> +#include <linux/mhi.h>
> +#include <linux/ptp_clock_kernel.h>
> +#include "mhi_phc.h"
> +
> +#define NSEC 1000000000ULL

Use existing NSEC_PER_SEC

> +
> +/**
> + * struct mhi_phc_dev - MHI PHC device
> + * @ptp_clock: associated PTP clock
> + * @ptp_clock_info: PTP clock information
> + * @mhi_dev: associated mhi device object
> + * @lock: spinlock

What spinlock? and what is it used for?

> + * @enabled: Flag to track the state of the MHI device
> + */
> +struct mhi_phc_dev {
> +	struct ptp_clock *ptp_clock;
> +	struct ptp_clock_info  ptp_clock_info;

Use single space.

> +	struct mhi_device *mhi_dev;
> +	spinlock_t lock;
> +	bool enabled;
> +};
> +
> +static int qcom_ptp_gettimex64(struct ptp_clock_info *ptp, struct timespec64 *ts,
> +			       struct ptp_system_timestamp *sts)
> +{
> +	struct mhi_phc_dev *phc_dev = container_of(ptp, struct mhi_phc_dev, ptp_clock_info);
> +	struct mhi_timesync_info time;
> +	ktime_t ktime_cur;
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);

Why spinlock ant not mutex, especially when mhi_get_remote_tsc_time_sync()
performs MMIO reads 4 times with ASPM enabled?

I also doubt that you really need lock here.

> +	if (!phc_dev->enabled) {

I don't see a a value of this check. If the intention is to prevent PHC from
being disabled when gettimex64() callback is executing, then kernel POSIX clock
layer already provides that guarantee for you. You don't need to reinvent the
wheel again. 

> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	ret = mhi_get_remote_tsc_time_sync(phc_dev->mhi_dev, &time);
> +	if (ret)
> +		goto err;
> +
> +	ktime_cur = time.t_dev_hi * NSEC + time.t_dev_lo;
> +	*ts = ktime_to_timespec64(ktime_cur);
> +
> +	dev_dbg(&phc_dev->mhi_dev->dev, "TSC time stamps sec:%u nsec:%u current:%lld\n",
> +		time.t_dev_hi, time.t_dev_lo, ktime_cur);

Move to tracepoint.

> +
> +	/* Update pre and post timestamps for PTP_SYS_OFFSET_EXTENDED*/
> +	if (sts != NULL) {

if (sts)

> +		sts->pre_ts = ktime_to_timespec64(time.t_host_pre);
> +		sts->post_ts = ktime_to_timespec64(time.t_host_post);
> +		dev_dbg(&phc_dev->mhi_dev->dev, "pre:%lld post:%lld\n",
> +			time.t_host_pre, time.t_host_post);
> +	}
> +
> +err:
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return ret;
> +}
> +
> +int mhi_phc_start(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +	unsigned long flags;
> +
> +	if (!phc_dev) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");

Can this really happen? Even so, I wouldn't add an error print for this cosmetic
check.

> +		return -ENODEV;
> +	}
> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);
> +	phc_dev->enabled = true;
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return 0;
> +}
> +
> +int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +	unsigned long flags;
> +
> +	if (!phc_dev) {
> +		dev_err(&mhi_cntrl->mhi_dev->dev, "Driver data is NULL\n");
> +		return -ENODEV;
> +	}

Same here.

> +
> +	spin_lock_irqsave(&phc_dev->lock, flags);
> +	phc_dev->enabled = false;
> +	spin_unlock_irqrestore(&phc_dev->lock, flags);
> +
> +	return 0;

Getting rid of the check and 'phc_dev->enabled' flag means, I see no point in
mhi_phc_{start/stop}() functions.

> +}
> +
> +static struct ptp_clock_info qcom_ptp_clock_info = {
> +	.owner    = THIS_MODULE,
> +	.gettimex64 =  qcom_ptp_gettimex64,
> +};
> +
> +int mhi_phc_init(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> +	struct mhi_phc_dev *phc_dev;
> +	int ret;
> +
> +	phc_dev = devm_kzalloc(&mhi_dev->dev, sizeof(*phc_dev), GFP_KERNEL);
> +	if (!phc_dev)
> +		return -ENOMEM;
> +
> +	phc_dev->mhi_dev = mhi_dev;
> +
> +	phc_dev->ptp_clock_info = qcom_ptp_clock_info;
> +	strscpy(phc_dev->ptp_clock_info.name, mhi_dev->name, PTP_CLOCK_NAME_LEN);
> +
> +	spin_lock_init(&phc_dev->lock);
> +
> +	phc_dev->ptp_clock = ptp_clock_register(&phc_dev->ptp_clock_info, &mhi_dev->dev);
> +	if (IS_ERR(phc_dev->ptp_clock)) {
> +		ret = PTR_ERR(phc_dev->ptp_clock);
> +		dev_err(&mhi_dev->dev, "Failed to register PTP clock\n");
> +		phc_dev->ptp_clock = NULL;
> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&mhi_dev->dev, phc_dev);
> +
> +	dev_dbg(&mhi_dev->dev, "probed MHI PHC dev: %s\n", mhi_dev->name);

Drop this spam.

> +	return 0;
> +};
> +
> +void mhi_phc_exit(struct mhi_controller *mhi_cntrl)
> +{
> +	struct mhi_phc_dev *phc_dev = dev_get_drvdata(&mhi_cntrl->mhi_dev->dev);
> +
> +	if (!phc_dev)
> +		return;
> +
> +	/* disable the node */

Remove this comment.

> +	ptp_clock_unregister(phc_dev->ptp_clock);
> +	phc_dev->enabled = false;
> +}
> diff --git a/drivers/bus/mhi/host/mhi_phc.h b/drivers/bus/mhi/host/mhi_phc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6b0866bc768ba5a8ac3e4c40a99aa2050db1389
> --- /dev/null
> +++ b/drivers/bus/mhi/host/mhi_phc.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025, Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifdef CONFIG_MHI_BUS_PHC

#if IS_ENABLED()

> +int mhi_phc_init(struct mhi_controller *mhi_cntrl);
> +int mhi_phc_start(struct mhi_controller *mhi_cntrl);
> +int mhi_phc_stop(struct mhi_controller *mhi_cntrl);
> +void mhi_phc_exit(struct mhi_controller *mhi_cntrl);
> +#else
> +static inline int mhi_phc_init(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline int mhi_phc_start(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline int mhi_phc_stop(struct mhi_controller *mhi_cntrl)
> +{
> +	return 0;
> +}
> +
> +static inline void mhi_phc_exit(struct mhi_controller *mhi_cntrl) {}
> +#endif
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index b1122c7224bdd469406d96af6d3df342040e1002..6cba5cecd1adb40396bba30c9b2a551898dce871 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -16,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
> +#include "mhi_phc.h"
>  
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
>  
> @@ -1044,6 +1045,7 @@ struct mhi_pci_device {
>  	struct timer_list health_check_timer;
>  	unsigned long status;
>  	bool reset_on_remove;
> +	bool mhi_phc_init_done;
>  };
>  
>  #ifdef readq
> @@ -1084,6 +1086,7 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  			      enum mhi_callback cb)
>  {
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  
>  	/* Nothing to do for now */
>  	switch (cb) {
> @@ -1091,9 +1094,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	case MHI_CB_SYS_ERROR:
>  		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
>  		pm_runtime_forbid(&pdev->dev);
> +		/* Stop PHC */
> +		if (mhi_cntrl->tsc_timesync)
> +			mhi_phc_stop(mhi_cntrl);
>  		break;
>  	case MHI_CB_EE_MISSION_MODE:
>  		pm_runtime_allow(&pdev->dev);
> +		/* Start PHC */
> +		if (mhi_cntrl->tsc_timesync) {
> +			if (!mhi_pdev->mhi_phc_init_done) {
> +				mhi_phc_init(mhi_cntrl);
> +				mhi_pdev->mhi_phc_init_done = true;
> +			}

This looks weird. Since MISSION_MODE can happen multiple times when the device
is attached, shouldn't you be doing mhi_phc_init() multiple times with the
corresponding mhi_phc_exit() during MHI_CB_SYS_ERROR?

Right now, you call mhi_phc_init() during MISSION_MODE and mhi_phc_exit()
during mhi_pci_remove(). What is the point of keeping /dev/ptpX if the firmware
is crashed?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

