Return-Path: <linux-arm-msm+bounces-102879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OamLlOQ3GkmTAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:42:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDE3E7D88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 08:42:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28ACA3008E15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 06:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D9B39183F;
	Mon, 13 Apr 2026 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpxULcdE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A35389111;
	Mon, 13 Apr 2026 06:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062543; cv=none; b=M9ADB/gJaGwGACxI7BMTNSNdK5I6h6tsdLqe2kb1i4wBpC1GSHAKSckvRBRW+jbYUtiaPcPP1Fnz3tHcYY4oVzhrLIriPs8TdcFc0RatbgKG3pgnWcO603BYHtNJCEkJR0c6caFgu0PKpaU3iUby3j2vGrstIe9LvMpBtb9Qe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062543; c=relaxed/simple;
	bh=0lH0LC1aP3wRhPO0FuTozezUioK4pF5EefTJuQZXdfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wqem3731uZ5mjb6xq4upxvfUEyJ6cF9cIqixU7+LAgxXjbHQW+FKbQIyluevGgQcGnYe3C7dKYrvlf7+QrZvwxOiLxdRdLyndBi9Feae/cZbiA4kO41cRCh9EKQZUI3KMCteC8iFqSQAe9pvVg8I49VpoFTIgnHtPwM4TjLUV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpxULcdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C659C2BCB1;
	Mon, 13 Apr 2026 06:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776062543;
	bh=0lH0LC1aP3wRhPO0FuTozezUioK4pF5EefTJuQZXdfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpxULcdEiToYfFRqvbT6mNWWGFi0R1omTWyY+y04c4i1F1/RBISmmWQoWHmHQylT7
	 tTorexOMN0AMoTxm1p5zXi7mysDIVaRDKbvDSpcWk6zWUmgvXcUl2OpAbdY7BD/s+/
	 bjxELWe5Is3aTj3Ug29Iv8E7K4JS3VnEGRmo8h1JZox+CFuCqlyBKPPTDR9hR1qnsf
	 7wEK5Sr2R+HPBLWlJQXZyssoeTRknBZigsSQsZxI4JU1jNQpLhLK+FDFBkP0A3YSNT
	 3b2yZ5aOST+dhnDKWgZRIEXXgUh6VbjCLe3eChGP+XzcPMWAZXUD1c4hrNMBjw0pGt
	 TouuaQUItgGxA==
Date: Mon, 13 Apr 2026 12:12:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Richard Cochran <richardcochran@gmail.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v2 2/6] bus: mhi: host: Add support for non-posted TSC
 timesync feature
Message-ID: <rwyescvy4m64hffttma2ikpbtukyzm3oqmiapcd5h7i4evygwc@gq72yoedmnxp>
References: <20260411-tsc_timesync-v2-0-6f25f72987b3@oss.qualcomm.com>
 <20260411-tsc_timesync-v2-2-6f25f72987b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260411-tsc_timesync-v2-2-6f25f72987b3@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,vger.kernel.org,quicinc.com];
	TAGGED_FROM(0.00)[bounces-102879-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email]
X-Rspamd-Queue-Id: 37EDE3E7D88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 01:42:02PM +0530, Krishna Chaitanya Chundru wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Implement non-posted time synchronization as described in section 5.1.1
> of the MHI v1.2 specification. The host disables low-power link states
> to minimize latency, reads the local time, issues a MMIO read to the
> device's TIME register.
> 
> Add support for initializing this feature and export a function to be
> used by the drivers which does the time synchronization.
> 
> MHI reads the device time registers in the MMIO address space pointed to
> by the capability register after disabling all low power modes and keeping
> MHI in M0. Before and after MHI reads, the local time is captured
> and shared for processing.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/common.h        |  4 +++
>  drivers/bus/mhi/host/init.c     | 28 ++++++++++++++++
>  drivers/bus/mhi/host/internal.h |  9 +++++
>  drivers/bus/mhi/host/main.c     | 74 +++++++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h             | 37 +++++++++++++++++++++
>  5 files changed, 152 insertions(+)
> 
> diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> index 4c316f3d5a68beb01f15cf575b03747096fdcf2c..64f9b2b94387a112bb6b5e20c634c3ba8d6bc78e 100644
> --- a/drivers/bus/mhi/common.h
> +++ b/drivers/bus/mhi/common.h
> @@ -118,6 +118,10 @@
>  #define CAP_CAPID_MASK			GENMASK(31, 24)
>  #define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
>  
> +/* MHI TSC Timesync */
> +#define TSC_TIMESYNC_TIME_LOW_OFFSET	(0x8)
> +#define TSC_TIMESYNC_TIME_HIGH_OFFSET	(0xC)
> +
>  /* Command Ring Element macros */
>  /* No operation command */
>  #define MHI_TRE_CMD_NOOP_PTR		0
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index c2162aa04e810e45ccfbedd20aaa62f892420d31..eb720f671726d919646cbc450cd54bda655a1060 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -498,6 +498,30 @@ static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32 capability)
>  	return 0;
>  }
>  
> +static int mhi_init_tsc_timesync(struct mhi_controller *mhi_cntrl)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct mhi_timesync *mhi_tsc_tsync;
> +	u32 time_offset;
> +	int ret;
> +
> +	time_offset = mhi_find_capability(mhi_cntrl, MHI_CAP_ID_TSC_TIME_SYNC);
> +	if (!time_offset)
> +		return -ENXIO;
> +
> +	mhi_tsc_tsync = devm_kzalloc(dev, sizeof(*mhi_tsc_tsync), GFP_KERNEL);
> +	if (!mhi_tsc_tsync)
> +		return -ENOMEM;
> +
> +	mhi_cntrl->tsc_timesync = mhi_tsc_tsync;
> +	mutex_init(&mhi_tsc_tsync->ts_mutex);
> +
> +	/* save time_offset for obtaining time via MMIO register reads */
> +	mhi_tsc_tsync->time_reg = mhi_cntrl->regs + time_offset;
> +
> +	return 0;
> +}

Move all the function definitions from MHI core code to mhi_phc.c.

> +
>  int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  {
>  	u32 val;
> @@ -635,6 +659,10 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  		return ret;
>  	}
>  
> +	ret = mhi_init_tsc_timesync(mhi_cntrl);
> +	if (ret)
> +		dev_dbg(dev, "TSC Time synchronization init failure\n");

And just keep this call in the MHI core.

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 7b0ee5e3a12dd585064169b7b884750bf4d8c8db..a0e729e7a1198c1b82c70b6bfe3bc2ee24331229 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -15,6 +15,15 @@ extern const struct bus_type mhi_bus_type;
>  #define MHI_SOC_RESET_REQ_OFFSET			0xb0
>  #define MHI_SOC_RESET_REQ				BIT(0)
>  
> +/*
> + * With ASPM enabled, the link may enter a low power state, requiring
> + * a wake-up sequence. Use a short burst of back-to-back reads to
> + * transition the link to the active state. Based on testing,
> + * 4 iterations are necessary to ensure reliable wake-up without
> + * excess latency.
> + */
> +#define MHI_NUM_BACK_TO_BACK_READS			4
> +
>  struct mhi_ctxt {
>  	struct mhi_event_ctxt *er_ctxt;
>  	struct mhi_chan_ctxt *chan_ctxt;
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 53c0ffe300702bcc3caa8fd9ea8086203c75b186..b7a727b1a5d1f20b570c62707a991ec5b85bfec7 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1626,3 +1626,77 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
> +
> +static int mhi_get_remote_time(struct mhi_controller *mhi_cntrl, struct mhi_timesync *mhi_tsync,
> +			       struct mhi_timesync_info *time)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	int ret, i;
> +
> +	if (!mhi_tsync && !mhi_tsync->time_reg) {
> +		dev_err(dev, "Time sync is not supported\n");
> +		return -EINVAL;

-EOPNOTSUPP

> +	}
> +
> +	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))) {
> +		dev_err(dev, "MHI is not in active state, pm_state:%s\n",
> +			to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +		return -EIO;
> +	}
> +
> +	/* bring to M0 state */
> +	ret = mhi_device_get_sync(mhi_cntrl->mhi_dev);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&mhi_tsync->ts_mutex);
> +	mhi_cntrl->runtime_get(mhi_cntrl);
> +
> +	/*
> +	 * time critical code to fetch device time, delay between these two steps
> +	 * should be deterministic as possible.
> +	 */
> +	preempt_disable();
> +	local_irq_disable();
> +
> +	time->t_host_pre = ktime_get_real();
> +
> +	/*
> +	 * To ensure the PCIe link is in L0 when ASPM is enabled, perform series
> +	 * of back-to-back reads. This is necessary because the link may be in a
> +	 * low-power state (e.g., L1 or L1ss), and need to be forced it to
> +	 * transition to L0.
> +	 */

You should be doing these back-to-back reads only if ASPM is enabled. You can
check that using pcie_aspm_enabled(). Also, see if you can hide this call inside
pci_generic driver to make mhi_phc truly transport agnostic.

> +	for (i = 0; i < MHI_NUM_BACK_TO_BACK_READS; i++) {
> +		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> +				   TSC_TIMESYNC_TIME_LOW_OFFSET, &time->t_dev_lo);
> +
> +		ret = mhi_read_reg(mhi_cntrl, mhi_tsync->time_reg,
> +				   TSC_TIMESYNC_TIME_HIGH_OFFSET, &time->t_dev_hi);
> +	}
> +
> +	time->t_host_post = ktime_get_real();
> +
> +	local_irq_enable();
> +	preempt_enable();
> +
> +	mhi_cntrl->runtime_put(mhi_cntrl);
> +
> +	mhi_device_put(mhi_cntrl->mhi_dev);
> +
> +	return 0;
> +}
> +
> +int mhi_get_remote_tsc_time_sync(struct mhi_device *mhi_dev, struct mhi_timesync_info *time)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_timesync *mhi_tsc_tsync = mhi_cntrl->tsc_timesync;
> +	int ret;
> +
> +	ret = mhi_get_remote_time(mhi_cntrl, mhi_tsc_tsync, time);
> +	if (ret)
> +		dev_err(&mhi_dev->dev, "Failed to get TSC Time Sync value:%d\n", ret);

What is the difference between 'TSC' and 'Time Sync'?

Nit: Space after 'value:'

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mhi_get_remote_tsc_time_sync);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 88ccb3e14f481d6b85c2a314eb74ba960c2d4c81..f39c8ca7c251954f2d83c1227d206b600b88c75f 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -286,6 +286,30 @@ struct mhi_controller_config {
>  	bool m2_no_db;
>  };
>  
> +/**
> + * struct mhi_timesync - MHI time synchronization structure
> + * @time_reg: Points to address of Timesync register
> + * @ts_mutex: Mutex for synchronization
> + */
> +struct mhi_timesync {
> +	void __iomem *time_reg;
> +	struct mutex ts_mutex;
> +};
> +
> +/**
> + * struct mhi_timesync_info - MHI time sync info structure
> + * @t_host_pre: Pre host soc time
> + * @t_host_post: Post host soc time

Get rid of 'soc', it provides no value.

> + * @t_dev_lo: Mhi device time of lower dword
> + * @t_dev_hi: Mhi device time of higher dword

s/Mhi/MHI

> + */
> +struct mhi_timesync_info {
> +	ktime_t t_host_pre;
> +	ktime_t t_host_post;
> +	u32 t_dev_lo;
> +	u32 t_dev_hi;
> +};
> +
>  /**
>   * struct mhi_controller - Master MHI controller structure
>   * @name: Device name of the MHI controller
> @@ -323,6 +347,7 @@ struct mhi_controller_config {
>   * @mhi_event: MHI event ring configurations table
>   * @mhi_cmd: MHI command ring configurations table
>   * @mhi_ctxt: MHI device context, shared memory between host and device
> + * @tsc_timesync: MHI TSC timesync
>   * @pm_mutex: Mutex for suspend/resume operation
>   * @pm_lock: Lock for protecting MHI power management state
>   * @timeout_ms: Timeout in ms for state transitions
> @@ -401,6 +426,8 @@ struct mhi_controller {
>  	struct mhi_cmd *mhi_cmd;
>  	struct mhi_ctxt *mhi_ctxt;
>  
> +	struct mhi_timesync *tsc_timesync;
> +
>  	struct mutex pm_mutex;
>  	rwlock_t pm_lock;
>  	u32 timeout_ms;
> @@ -795,4 +822,14 @@ bool mhi_queue_is_full(struct mhi_device *mhi_dev, enum dma_data_direction dir);
>   */
>  int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_offset);
>  
> +/**
> + * mhi_get_remote_tsc_time_sync - get external soc time relative to local soc

Same comment as above

- Mani

-- 
மணிவண்ணன் சதாசிவம்

