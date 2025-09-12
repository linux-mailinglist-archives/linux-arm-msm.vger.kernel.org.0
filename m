Return-Path: <linux-arm-msm+bounces-73285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A25B54895
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 12:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AF1F3A6240
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198C028A3FA;
	Fri, 12 Sep 2025 10:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUgP7nkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01DC1F5851;
	Fri, 12 Sep 2025 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671305; cv=none; b=FQQ5a4Yg+cSBA3cG7xYhPS4RsW4F3XIaB32EdSP09Qh/4jHqwJWA6p0gPHob98BuMdQlpttiRxJPSh0vvpJnMhMkZtDzgJdDvSCxdwQIn0TpxLp8sE5frLv/m//xkinq3nu1vtvy1GfF6pmOdSr34QRvDNDpW93gqGQdGqXqQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671305; c=relaxed/simple;
	bh=SqhgbQ9AuAFKV54UmYB1i+nBhJGNv6JopjorByt9v0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmbClmNmWVG5uxQ6CpQ6psxBGXpb5DuUgj+6DTYs1WuG1A35T9Z/nJDW3p4FWsGT4SdXkf3mM2Sw8HgqY9ebXTFQ+UeEkQlPvNPEJ9WeTT/nGcsEKVvDxfSXJfSzjwK2sKFUEtLnSTX+0yTnkOieWrY0rycqzd7gSLkcdtMI04c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUgP7nkk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2B7C4CEF1;
	Fri, 12 Sep 2025 10:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757671304;
	bh=SqhgbQ9AuAFKV54UmYB1i+nBhJGNv6JopjorByt9v0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pUgP7nkkn60IqRGitZ6hPdhy+6tiHO0hqS8054QcNjFWRiVYq1bq5f3JL6iDmQnXM
	 +ExFU9MrXvWuQKwPtrhQMa7HGmUIVdZGXmDH1PIcol4LMP5+ykcxEghMjMkNHi0bM0
	 /vFqr6l+OyMZbRG7a9p2mIjRYiPyUPj0kU58dNdOv+OYDUQadeUS/3gRt2F3KF+Eef
	 OO22T2oBCL5WoA9QRHojGl7kL2CdAoCRMKpZk+jUJwjy63zUpjA4/8YqhK4/bRuNtm
	 76FswcJhdarbHqNhxRTwfPp89cPlaMsAE+r6/QmaC4PSlGL2s2ml0xNNHEiSxVpN+M
	 jNh3ckZ/pUPjQ==
Date: Fri, 12 Sep 2025 15:31:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v2] bus: mhi: host: Add uevent support in MHI driver
Message-ID: <25ikgu4ynqzmtl452b67aayp6jayybzxphz5vj4w4huphrcqb5@2ouj6dvyasqp>
References: <20250912-b4-uevent_vdev_next-20250911-v2-1-89440407bf7e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912-b4-uevent_vdev_next-20250911-v2-1-89440407bf7e@quicinc.com>

On Fri, Sep 12, 2025 at 10:29:16AM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Notify the MHI device's Execution Environment (EE) state via uevent,
> enabling applications to receive real-time updates and take appropriate
> actions based on the current state of MHI.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
> Notify the MHI device's Execution Environment (EE) state via uevent,
> enabling applications to receive real-time updates and take appropriate
> actions based on the current state.
> 
> Signed-off-by: 

Duplicate?

> ---
> Usage:
> 
> Enabling 16 virtual fucntions for SRIOV device QDU100 once device reached
> mission mode from systemd service file
> 
> SUBSYSTEM=="mhi", ENV{EXEC_ENV}=="MISSION MODE", SUBSYSTEMS=="pci", ATTRS{device}=="0x0601",ATTR{../sriov_numvfs}="16"
> ---
> 
> ---
> Changes in v2:
> - Fix memory leak in uevent notifier.
> - Link to v1: https://lore.kernel.org/r/20250822-uevent_vdev_next-20250821-v1-1-9ed3a8162194@quicinc.com
> ---
> 
> ---
>  drivers/bus/mhi/host/internal.h |  1 +
>  drivers/bus/mhi/host/main.c     |  1 +
>  drivers/bus/mhi/host/pm.c       | 29 +++++++++++++++++++++++++++++
>  3 files changed, 31 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 034be33565b78eff9bdefd93faa4f3ce93825bad..d455f0bf00133775fa23882a727782275640e43b 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -403,6 +403,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>  				struct mhi_event *mhi_event, u32 event_quota);
>  int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  			     struct mhi_event *mhi_event, u32 event_quota);
> +void mhi_uevent_notify(struct mhi_controller *mhi_cntrl, enum mhi_ee_type ee);
>  
>  /* ISR handlers */
>  irqreturn_t mhi_irq_handler(int irq_number, void *dev);
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 52bef663e182de157e50f64c1764a52545c70865..8615512743199a59a58c3756d9cc3407079cee7e 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -512,6 +512,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>  			mhi_cntrl->ee = ee;
> +			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
>  			wake_up_all(&mhi_cntrl->state_event);
>  		}
>  		break;
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 33d92bf2fc3ed48db5f7fe80e4f0ef9fe2d2f2ab..331f65921a979adce60a32fb62e2c9b712f21c87 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -418,6 +418,7 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  	device_for_each_child(&mhi_cntrl->mhi_dev->dev, &current_ee,
>  			      mhi_destroy_device);
>  	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_MISSION_MODE);
> +	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
>  
>  	/* Force MHI to be in M0 state before continuing */
>  	ret = __mhi_device_get_sync(mhi_cntrl);
> @@ -631,6 +632,8 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  	/* Wake up threads waiting for state transition */
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> +	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
> +
>  	if (MHI_REG_ACCESS_VALID(prev_state)) {
>  		/*
>  		 * If the device is in PBL or SBL, it will only respond to
> @@ -829,6 +832,8 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_create_devices(mhi_cntrl);
>  			if (mhi_cntrl->fbc_download)
>  				mhi_download_amss_image(mhi_cntrl);
> +
> +			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
>  			break;
>  		case DEV_ST_TRANSITION_MISSION_MODE:
>  			mhi_pm_mission_mode_transition(mhi_cntrl);
> @@ -838,6 +843,7 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_cntrl->ee = MHI_EE_FP;
>  			write_unlock_irq(&mhi_cntrl->pm_lock);
>  			mhi_create_devices(mhi_cntrl);
> +			mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
>  			break;
>  		case DEV_ST_TRANSITION_READY:
>  			mhi_ready_state_transition(mhi_cntrl);
> @@ -1240,6 +1246,8 @@ static void __mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> +	mhi_uevent_notify(mhi_cntrl, mhi_cntrl->ee);
> +
>  	if (destroy_device)
>  		mhi_queue_state_transition(mhi_cntrl,
>  					   DEV_ST_TRANSITION_DISABLE_DESTROY_DEVICE);
> @@ -1338,3 +1346,24 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  }
>  EXPORT_SYMBOL_GPL(mhi_device_put);
> +
> +void mhi_uevent_notify(struct mhi_controller *mhi_cntrl, enum mhi_ee_type ee)
> +{
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	char *buf[2];
> +	int ret;
> +
> +	buf[0] = kasprintf(GFP_KERNEL, "EXEC_ENV=%s", TO_MHI_EXEC_STR(ee));
> +	buf[1] = NULL;
> +
> +	if (!buf[0]) {
> +		dev_dbg(dev, "Failed to allocate memory for uevent");
> +		return;
> +	}
> +
> +	ret = kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, buf);
> +	if (ret)
> +		dev_err(dev, "Failed to send %s uevent\n", TO_MHI_EXEC_STR(ee));
> +
> +	 kfree(buf[0]);

Weird indentation. I'll fix it and also drop the redundant debug log while
applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

