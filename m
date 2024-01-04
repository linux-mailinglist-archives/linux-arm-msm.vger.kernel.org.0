Return-Path: <linux-arm-msm+bounces-6445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEAC824092
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 12:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778451F24BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jan 2024 11:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D6021101;
	Thu,  4 Jan 2024 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvCjxrHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D52135A;
	Thu,  4 Jan 2024 11:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B88C433C8;
	Thu,  4 Jan 2024 11:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704367591;
	bh=QgAaEp8kHBnWsT1QlJu6rUVoInCmNydb051PHLvhbAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvCjxrHwsx/y5571iVsShbdByBm7X0ownCGZS5WtFGZNdsMcxfb15+VIdZ2ONIxSu
	 ZLFwblPLUm62Q3DO2BeWYL0drdOVWPqPppE/8kVkAxpWk7+xvi//ShLtQc8rw7tXmw
	 GG/DHY2G445sGjNhEvLC0RSnJEyRXY3G/c7zhGQxmB2nGCvtUwrTEnemRyL4Bq1row
	 PORdPVpQVWWWCfwRAdWwKdyZ8kWiI+mCPiYHHg/PzdTR8Kl+yG2WMzuPWOAhe2R6TA
	 I3enmPWKXaz6jTuIyrRH7Km8KIQrPuEXB6NW6LyHn6LAz47LUSNP3FrXGRtOUbF8mg
	 5hh9tKyWLwfgA==
Date: Thu, 4 Jan 2024 16:56:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
Message-ID: <20240104112625.GD3031@thinkpad>
References: <20231208221353.1560177-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231208221353.1560177-1-quic_jhugo@quicinc.com>

On Fri, Dec 08, 2023 at 03:13:53PM -0700, Jeffrey Hugo wrote:
> When processing a SYSERR, if the device does not respond to the MHI_RESET
> from the host, the host will be stuck in a difficult to recover state.

Under what scenario this can happen? Is the device not honoring MHI_RESET state
or crashed completely?

- Mani

> The host will remain in MHI_PM_SYS_ERR_PROCESS and not clean up the host
> channels.  Clients will not be notified of the SYSERR via the destruction
> of their channel devices, which means clients may think that the device is
> still up.  Subsequent SYSERR events such as a device fatal error will not
> be processed as the state machine cannot transition from PROCESS back to
> DETECT.  The only way to recover from this is to unload the mhi module
> (wipe the state machine state) or for the mhi controller to initiate
> SHUTDOWN.
> 
> In this failure case, to recover the device, we need a state similar to
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
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>  drivers/bus/mhi/host/init.c     |  1 +
>  drivers/bus/mhi/host/internal.h |  9 ++++++---
>  drivers/bus/mhi/host/pm.c       | 20 +++++++++++++++++---
>  3 files changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index e2c2f510b04f..d3f919277cf9 100644
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
> index 30ac415a3000..4b6deea17bcd 100644
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
> index a2f2feef1476..d0d033ce9984 100644
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
> @@ -629,7 +637,13 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
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

