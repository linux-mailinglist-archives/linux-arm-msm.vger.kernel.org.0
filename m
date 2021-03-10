Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB04E333FE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 15:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCJOFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 09:05:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231272AbhCJOFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 09:05:01 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3D18C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:05:00 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id l7so12152945pfd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 06:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bMmn9tK2G3tNQK5+Bb15Q1LRKE3FMdZLlIAdd2bodSk=;
        b=Uw5VNNN8UHbeTBKeSy8Z8NS5sJtPCn0r8fYmJ9Mk7oog5Yt2hS89kqv3I8U5PImFoh
         +Th5zkhxTYFuTmvna7Bq4aNXG4+C/o+jSCbKh6CrE756AezWejrpP+OgHrkgJEggS2GS
         r5z4LSnUYcwId7ZuTTH4eCzQH4PJY78OoxTMtwz8LUplJjQN5puyR5cmL4TkPMERsFDe
         beE6bUOTbk3wpAs2HupMxxy0b1UtODR2zhUCL8xbXHRkTn5ShdDlYwg+jryUndMKmu7S
         JSAgMtX0bn9QKvemcGsnJ/4/7ZyxP0+WlaXoSkk4HiEpCvVwEd5eiahbjn7+x9DcnAtF
         rCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bMmn9tK2G3tNQK5+Bb15Q1LRKE3FMdZLlIAdd2bodSk=;
        b=T1gC5GPMYEzMK1CqRXyIZK94eKb3qnq7EdCiC0XfQ8vlg9YbI+sfgjHO6EF6n6li0G
         7dZ1yHwkjNlbvTCFuUn7HMiOG2fDvjQzPVlv4I2gJpIlr/EqgOID+neF0ow2kfS1YuB+
         9k5yLzdIW8oQX4D2uRNPodWGc0Uzz5yf6yono6YAFpTyeu54RRJw2swIT08TdG2gwc45
         n7cEjXQiHMwKQDFsBybQjmp7sXgdeOWJVKrrYXBIurZ3ybgut/jyOY7BK+MIc+HcJz3S
         vKK5ELkMXqPypovKzfdpt97oThsLDJ2ZRIYP+08tZ1rLL8tXck44rxDAhOZmh7gvIeFa
         SdyA==
X-Gm-Message-State: AOAM530V8kMPUxiSBWGLYifDRv7irzqbtKFFlCtqNFaugpPeDUsCLTTI
        NMEkc/99vJUU4MD1TOpi336K
X-Google-Smtp-Source: ABdhPJxz2oECrFEcow7Juaq8CaqWFW8+llY+ObxPt57GI9okMNNfCTPVqgiQDjS3c2HyCoTcFWFZSg==
X-Received: by 2002:a63:5c63:: with SMTP id n35mr2928225pgm.26.1615385100430;
        Wed, 10 Mar 2021 06:05:00 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id v18sm8566910pfn.117.2021.03.10.06.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 06:04:59 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:34:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com
Subject: Re: [PATCH v6 3/4] bus: mhi: core: Process execution environment
 changes serially
Message-ID: <20210310140454.GQ30275@thinkpad>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 03:23:04PM -0800, Bhaumik Bhatt wrote:
> In current design, whenever the BHI interrupt is fired, the
> execution environment is updated. This can cause race conditions
> and impede ongoing power up/down processing. For example, if a
> power down is in progress, MHI host updates to a local "disabled"
> execution environment. If a BHI interrupt fires later, that value
> gets replaced with one from the BHI EE register. This impacts the
> controller as it does not expect multiple RDDM execution
> environment change status callbacks as an example. Another issue
> would be that the device can enter mission mode and the execution
> environment is updated, while device creation for SBL channels is
> still going on due to slower PM state worker thread run, leading
> to multiple attempts at opening the same channel.
> 
> Ensure that EE changes are handled only from appropriate places
> and occur one after another and handle only PBL modes or RDDM EE
> changes as critical events directly from the interrupt handler.
> Simplify handling by waiting for SYS ERROR before handling RDDM.
> This also makes sure that we use the correct execution environment
> to notify the controller driver when the device resets to one of
> the PBL execution environments.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 40 +++++++++++++++++++++-------------------
>  drivers/bus/mhi/core/pm.c   |  7 ++++---
>  2 files changed, 25 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 7a2e98c..9715f51 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -430,7 +430,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	enum mhi_state state = MHI_STATE_MAX;
>  	enum mhi_pm_state pm_state = 0;
> -	enum mhi_ee_type ee = 0;
> +	enum mhi_ee_type ee = MHI_EE_MAX;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> @@ -439,8 +439,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> -	ee = mhi_cntrl->ee;
> -	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> +	ee = mhi_get_exec_env(mhi_cntrl);
>  	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
>  		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
>  		TO_MHI_STATE_STR(state));
> @@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	}
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
> -	 /* If device supports RDDM don't bother processing SYS error */
> -	if (mhi_cntrl->rddm_image) {
> -		/* host may be performing a device power down already */
> -		if (!mhi_is_active(mhi_cntrl))
> -			goto exit_intvec;
> +	if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
> +		goto exit_intvec;
>  
> -		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
> +	switch (ee) {
> +	case MHI_EE_RDDM:
> +		/* proceed if power down is not already in progress */
> +		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
> +			mhi_cntrl->ee = ee;
>  			wake_up_all(&mhi_cntrl->state_event);
>  		}
> -		goto exit_intvec;
> -	}
> -
> -	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
> +		break;
> +	case MHI_EE_PBL:
> +	case MHI_EE_EDL:
> +	case MHI_EE_PTHRU:
> +		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
> +		mhi_cntrl->ee = ee;
>  		wake_up_all(&mhi_cntrl->state_event);
> -
> -		/* For fatal errors, we let controller decide next step */
> -		if (MHI_IN_PBL(ee))
> -			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
> -		else
> -			mhi_pm_sys_err_handler(mhi_cntrl);
> +		mhi_pm_sys_err_handler(mhi_cntrl);
> +		break;
> +	default:
> +		wake_up_all(&mhi_cntrl->state_event);
> +		mhi_pm_sys_err_handler(mhi_cntrl);
> +		break;
>  	}
>  
>  exit_intvec:
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index c09ec13..c870fa8 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -377,21 +377,22 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	enum mhi_ee_type current_ee = mhi_cntrl->ee;
> +	enum mhi_ee_type ee = MHI_EE_MAX, current_ee = mhi_cntrl->ee;
>  	int i, ret;
>  
>  	dev_dbg(dev, "Processing Mission Mode transition\n");
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
> -		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> +		ee = mhi_get_exec_env(mhi_cntrl);
>  
> -	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
> +	if (!MHI_IN_MISSION_MODE(ee)) {
>  		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
>  		write_unlock_irq(&mhi_cntrl->pm_lock);
>  		wake_up_all(&mhi_cntrl->state_event);
>  		return -EIO;
>  	}
> +	mhi_cntrl->ee = ee;
>  	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
>  	wake_up_all(&mhi_cntrl->state_event);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
