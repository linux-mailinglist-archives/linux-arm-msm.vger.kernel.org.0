Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1692288EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389701AbgJIQck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388719AbgJIQcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:32:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF178C0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:32:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id y1so1171875plp.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mOTcy3+NA6WMt5XJNmj5tg+j6bcKEmODuGu9umfiTHs=;
        b=ksVkMwzvlP+IFARBE9t7y6xsrsrnd5cktvydnD1bDp7vEbHpw8tYNjp43xSW1/lKTL
         XFjQL7aZI6owEpa0TIyR9peHB5RguhWECJfs7dN51FBRPL+8+dBPdeGtKjHDRkiu0mc3
         3/yl7TP3rbuxokoz3gFdLUVYhihnFht7utQGUSes1xRJCDcOI1ErMvwiuKY6QJdGivzT
         ZGQHGyB7hFzNm4zsrH0MAgnZpJi+xbllfBQG0rdnDrr2w7cosamVfT7Jxc60QWt9RJdH
         rBukeat6C2BWcfNyQ0C1f8eJBUU3OCEzuS0GJyiA3M2D8oejOMP7VowuYRdkRjBjp5Wk
         EtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mOTcy3+NA6WMt5XJNmj5tg+j6bcKEmODuGu9umfiTHs=;
        b=TMGMx8FLdZ8ZSZv1Cvb+NfPZchMjer6ryQ1Q/PcwJ41F+/tXJv3HPj7hiVDsQZ/fvV
         FnYJctxNAh/RhOztJAwnSdzDd5xHVZpkYFLIGBuNnH/qPMO7jzwqeb3cQhkgtM7wj+Q/
         +8OorAHrS2zxjAVCB2/zlH31prMLDcgzlAicG4BzNCcIxvQnrHKrnoRruyWLXzHc7PxB
         PWJ8RZvmXgNsxRII5tFqHC7ZVkqjUInAUR0M+iW3itRsq2HtKnYyyxkIHFp5MeIuuey0
         Q7v3p1eaarbo1AUSh6lABJ+uGCvRjjegjnWJ9rQE/PX3ZBrLs3r5Wc+QRsz9zOd7Oarn
         BpRw==
X-Gm-Message-State: AOAM533nw4vUtBvuhzu82AUFCWuxQBSZf3xWH0NvC6q4I22Otjkk1AlR
        IY8tUY3dKWhIgZFThff+edSP
X-Google-Smtp-Source: ABdhPJykBh/o5E6yOVSdXZxLCcevQfXuIXwwvittlh8cm+/jOLYkFeF3Z7di9fDHVnZkQW+ELZtdWQ==
X-Received: by 2002:a17:902:a40e:b029:d3:c6fa:2650 with SMTP id p14-20020a170902a40eb02900d3c6fa2650mr12617454plq.29.1602261159147;
        Fri, 09 Oct 2020 09:32:39 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id q8sm6231603pfg.118.2020.10.09.09.32.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:32:38 -0700 (PDT)
Date:   Fri, 9 Oct 2020 22:02:31 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/10] bus: mhi: core: Move to SYS_ERROR regardless of
 RDDM capability
Message-ID: <20201009163231.GH4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-8-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-8-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:32PM -0700, Bhaumik Bhatt wrote:
> In some cases, the entry of device to RDDM execution environment
> can occur after a significant amount of time has elapsed after the
> SYS_ERROR state change event has arrived. This can result in scenarios
> where users of the MHI bus are unaware of the error state of the

Who are all the users of MHI bus? Client drivers?

> device. Hence, moving the MHI bus to a SYS_ERROR detected state will
> prevent further client activity and wait for the RDDM entry.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2cff5dd..1c8e332 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -376,6 +376,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	enum mhi_state state = MHI_STATE_MAX;
>  	enum mhi_pm_state pm_state = 0;
>  	enum mhi_ee_type ee = 0;
> +	bool handle_rddm = false;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> @@ -400,6 +401,17 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  	 /* If device supports RDDM don't bother processing SYS error */
>  	if (mhi_cntrl->rddm_image) {
>  		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
> +			/* prevent clients from queueing any more packets */
> +			write_lock_irq(&mhi_cntrl->pm_lock);
> +			pm_state = mhi_tryset_pm_state(mhi_cntrl,
> +						       MHI_PM_SYS_ERR_DETECT);

The condition above already moves MHI to MHI_PM_SYS_ERR_DETECT if the state
is MHI_STATE_SYS_ERR. Why are you doing it here again?

Thanks,
Mani

> +			if (pm_state == MHI_PM_SYS_ERR_DETECT)
> +				handle_rddm = true;
> +			write_unlock_irq(&mhi_cntrl->pm_lock);
> +		}
> +
> +		if (handle_rddm) {
> +			dev_err(dev, "RDDM event occurred!\n");
>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>  			wake_up_all(&mhi_cntrl->state_event);
>  		}
> @@ -733,19 +745,15 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  				break;
>  			case MHI_STATE_SYS_ERR:
>  			{
> -				enum mhi_pm_state new_state;
> -
> -				/* skip SYS_ERROR handling if RDDM supported */
> -				if (mhi_cntrl->ee == MHI_EE_RDDM ||
> -				    mhi_cntrl->rddm_image)
> -					break;
> +				enum mhi_pm_state state = MHI_PM_STATE_MAX;
>  
>  				dev_dbg(dev, "System error detected\n");
>  				write_lock_irq(&mhi_cntrl->pm_lock);
> -				new_state = mhi_tryset_pm_state(mhi_cntrl,
> +				if (mhi_cntrl->ee != MHI_EE_RDDM)
> +					state = mhi_tryset_pm_state(mhi_cntrl,
>  							MHI_PM_SYS_ERR_DETECT);
>  				write_unlock_irq(&mhi_cntrl->pm_lock);
> -				if (new_state == MHI_PM_SYS_ERR_DETECT)
> +				if (state == MHI_PM_SYS_ERR_DETECT)
>  					mhi_pm_sys_err_handler(mhi_cntrl);
>  				break;
>  			}
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
