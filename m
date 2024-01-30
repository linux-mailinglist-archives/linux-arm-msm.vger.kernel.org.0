Return-Path: <linux-arm-msm+bounces-8966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE4841D85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 09:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BBCAB27A09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 08:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3625823E;
	Tue, 30 Jan 2024 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JzQ7mizS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BB6A32F;
	Tue, 30 Jan 2024 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602526; cv=none; b=maqGst9w6dqwHrWUD5pXcQhqDhcw6FCqAGbbTuThDRdPm+6KgqQ4OTbHWVQvSj6fIEgqy1tvgMK0c+1Y3F2uSqqXTkSgi02zTh+y+U5+uawMJ1tWXkI49KsAYCTDzgR6vix+wxEp80zZuZMafMzDPc3hq4FESE+J017hvlYzLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602526; c=relaxed/simple;
	bh=lnEDll30zZ0mG+3CCuXdEvtHmVf3wq1abiTNSTpry+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlY/4RqmBU3TOkK8CqODkIP7lWhbqwUSBRvYJM3ctGPCVx8vU5fZrIFe/my+yz4SDQe90sskCB9uyOsLiiuYNQoKMZEasNI7vz2wyAxEMzW3epuPu79pmJZR+rf/10kxAs3cE7FDP4vDqFhv4Eb9GpwXhjxeDKLhebpSN8q6Ni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JzQ7mizS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79804C433F1;
	Tue, 30 Jan 2024 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706602525;
	bh=lnEDll30zZ0mG+3CCuXdEvtHmVf3wq1abiTNSTpry+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JzQ7mizSEYCVZZ9BZMRYendq1JdnHYBFR/V2sYFaaJJG5jixflPC1qX0mAlzWaeM0
	 mCJ0vysMVECQ8U9PA/PRnDzda1vjVL49NeiDJ+2Lt7nQ/dKxb/IwBget5NwtSCG2sL
	 uhzWwgiNOhgyNJuwRt9RZgRyNKLB9OscMrKm+xxNWB9AO/hNhBsVlXPrJQ2gkj3jJw
	 tIRv5gr9YwsDbEzvqbXo1KgvME3CYvtaG9KBwK+/rtYaE4RALS55jb+mdLnhvUhg9H
	 wgXAY3O2cQZRIiQ55sPH3c5Sc0kQsWnt1Pr4gEQKt8s8hj5PsQYPNJiDlDtB4W02+n
	 kyLfBARCcrVXA==
Date: Tue, 30 Jan 2024 13:45:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
Message-ID: <20240130081519.GI32821@thinkpad>
References: <20240112180800.536733-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112180800.536733-1-quic_jhugo@quicinc.com>

On Fri, Jan 12, 2024 at 11:08:00AM -0700, Jeffrey Hugo wrote:
> When processing a SYSERR, if the device does not respond to the MHI_RESET
> from the host, the host will be stuck in a difficult to recover state.
> The host will remain in MHI_PM_SYS_ERR_PROCESS and not clean up the host
> channels.  Clients will not be notified of the SYSERR via the destruction
> of their channel devices, which means clients may think that the device is
> still up.  Subsequent SYSERR events such as a device fatal error will not
> be processed as the state machine cannot transition from PROCESS back to
> DETECT.  The only way to recover from this is to unload the mhi module
> (wipe the state machine state) or for the mhi controller to initiate
> SHUTDOWN.
> 
> This issue was discovered by stress testing soc_reset events on AIC100
> via the sysfs node.
> 
> soc_reset is processed entirely in hardware.  When the register write
> hits the endpoint hardware, it causes the soc to reset without firmware
> involvement.  In stress testing, there is a rare race where soc_reset N
> will cause the soc to reset and PBL to signal SYSERR (fatal error).  If
> soc_reset N+1 is triggered before PBL can process the MHI_RESET from the
> host, then the soc will reset again, and re-run PBL from the beginning.
> This will cause PBL to lose all state.  PBL will be waiting for the host
> to respond to the new syserr, but host will be stuck expecting the
> previous MHI_RESET to be processed.
> 
> Additionally, the AMSS EE firmware (QSM) was hacked to synthetically
> reproduce the issue by simulating a FW hang after the QSM issued a
> SYSERR.  In this case, soc_reset would not recover the device.
> 
> For this failure case, to recover the device, we need a state similar to
> PROCESS, but can transition to DETECT.  There is not a viable existing
> state to use.  POR has the needed transitions, but assumes the device is
> in a good state and could allow the host to attempt to use the device.
> Allowing PROCESS to transition to DETECT invites the possibility of
> parallel SYSERR processing which could get the host and device out of
> sync.
> 
> Thus, invent a new state - MHI_PM_SYS_ERR_FAIL
> 
> This essentially a holding state.  It allows us to clean up the host
> elements that are based on the old state of the device (channels), but
> does not allow us to directly advance back to an operational state.  It
> does allow the detection and processing of another SYSERR which may
> recover the device, or allows the controller to do a clean shutdown.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
> 
> v2:
> -Add additional details about issue discovery to commit text
> 
>  drivers/bus/mhi/host/init.c     |  1 +
>  drivers/bus/mhi/host/internal.h |  9 ++++++---
>  drivers/bus/mhi/host/pm.c       | 20 +++++++++++++++++---
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index 15c1740a2c88..cca2731bc98b 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -62,6 +62,7 @@ static const char * const mhi_pm_state_str[] = {
>  	[MHI_PM_STATE_FW_DL_ERR] = "Firmware Download Error",
>  	[MHI_PM_STATE_SYS_ERR_DETECT] = "SYS ERROR Detect",
>  	[MHI_PM_STATE_SYS_ERR_PROCESS] = "SYS ERROR Process",
> +	[MHI_PM_STATE_SYS_ERR_FAIL] = "SYS ERROR Failure",
>  	[MHI_PM_STATE_SHUTDOWN_PROCESS] = "SHUTDOWN Process",
>  	[MHI_PM_STATE_LD_ERR_FATAL_DETECT] = "Linkdown or Error Fatal Detect",
>  };
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index 2e139e76de4c..d2858236af52 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -88,6 +88,7 @@ enum mhi_pm_state {
>  	MHI_PM_STATE_FW_DL_ERR,
>  	MHI_PM_STATE_SYS_ERR_DETECT,
>  	MHI_PM_STATE_SYS_ERR_PROCESS,
> +	MHI_PM_STATE_SYS_ERR_FAIL,
>  	MHI_PM_STATE_SHUTDOWN_PROCESS,
>  	MHI_PM_STATE_LD_ERR_FATAL_DETECT,
>  	MHI_PM_STATE_MAX
> @@ -104,14 +105,16 @@ enum mhi_pm_state {
>  #define MHI_PM_FW_DL_ERR				BIT(7)
>  #define MHI_PM_SYS_ERR_DETECT				BIT(8)
>  #define MHI_PM_SYS_ERR_PROCESS				BIT(9)
> -#define MHI_PM_SHUTDOWN_PROCESS				BIT(10)
> +#define MHI_PM_SYS_ERR_FAIL				BIT(10)
> +#define MHI_PM_SHUTDOWN_PROCESS				BIT(11)
>  /* link not accessible */
> -#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(11)
> +#define MHI_PM_LD_ERR_FATAL_DETECT			BIT(12)
>  
>  #define MHI_REG_ACCESS_VALID(pm_state)			((pm_state & (MHI_PM_POR | MHI_PM_M0 | \
>  						MHI_PM_M2 | MHI_PM_M3_ENTER | MHI_PM_M3_EXIT | \
>  						MHI_PM_SYS_ERR_DETECT | MHI_PM_SYS_ERR_PROCESS | \
> -						MHI_PM_SHUTDOWN_PROCESS | MHI_PM_FW_DL_ERR)))
> +						MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |  \
> +						MHI_PM_FW_DL_ERR)))
>  #define MHI_PM_IN_ERROR_STATE(pm_state)			(pm_state >= MHI_PM_FW_DL_ERR)
>  #define MHI_PM_IN_FATAL_STATE(pm_state)			(pm_state == MHI_PM_LD_ERR_FATAL_DETECT)
>  #define MHI_DB_ACCESS_VALID(mhi_cntrl)			(mhi_cntrl->pm_state & mhi_cntrl->db_access)
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index 8a4362d75fc4..27f8a40f288c 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -36,7 +36,10 @@
>   *     M0 <--> M0
>   *     M0 -> FW_DL_ERR
>   *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
> - * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
> + * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS
> + *     SYS_ERR_PROCESS -> SYS_ERR_FAIL
> + *     SYS_ERR_FAIL -> SYS_ERR_DETECT
> + *     SYS_ERR_PROCESS --> POR
>   * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
>   *     SHUTDOWN_PROCESS -> DISABLE
>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
> @@ -93,7 +96,12 @@ static const struct mhi_pm_transitions dev_state_transitions[] = {
>  	},
>  	{
>  		MHI_PM_SYS_ERR_PROCESS,
> -		MHI_PM_POR | MHI_PM_SHUTDOWN_PROCESS |
> +		MHI_PM_POR | MHI_PM_SYS_ERR_FAIL | MHI_PM_SHUTDOWN_PROCESS |
> +		MHI_PM_LD_ERR_FATAL_DETECT
> +	},
> +	{
> +		MHI_PM_SYS_ERR_FAIL,
> +		MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>  		MHI_PM_LD_ERR_FATAL_DETECT
>  	},
>  	/* L2 States */
> @@ -624,7 +632,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
>  					!in_reset, timeout);
>  		if (!ret || in_reset) {
>  			dev_err(dev, "Device failed to exit MHI Reset state\n");
> -			goto exit_sys_error_transition;
> +			write_lock_irq(&mhi_cntrl->pm_lock);
> +			cur_state = mhi_tryset_pm_state(mhi_cntrl,
> +							MHI_PM_SYS_ERR_FAIL);
> +			write_unlock_irq(&mhi_cntrl->pm_lock);
> +			/* Shutdown may have occurred, otherwise cleanup now */
> +			if (cur_state != MHI_PM_SYS_ERR_FAIL)
> +				goto exit_sys_error_transition;
>  		}
>  
>  		/*
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

