Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CED22BDEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 08:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgGXGJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 02:09:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgGXGJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 02:09:31 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C1DC0619E4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 23:09:30 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n5so4670675pgf.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2020 23:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YbnhJr1ZXdw8/+/u0z/NWro24EdpEQ/HOYR3m6I8Pk0=;
        b=y/l3vTZDzZukD1ehUz4TjuhxmUc9Hz1xaT88SnLff7OVfdshpW33uM6165izR/pI7O
         4wgVEMDPFInxCHo93sD+vXjQX1cOtIdKy2GxvQSUU5hPXD2l0tlYjXxVVxg3keaDNGIp
         KkeoFH1HQ2ulEwqUWeMJ1LroSVPv0VcVZlUj8qRF9hL6Cu+0bISDFVAv563yXWXCmOmU
         oDXpRhDOxfpc/YP0pgMDfRNY7zO+K99gES5oHyTYB+CGPfEBAN4w9GX0Hw32jJaYh/Bq
         B9AneMyfQqeepYS+OgF8fAVz1/V+hd+RKF+cohd9gnS6FMSiZwlLsScVaGKJNWuVLjMa
         K5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YbnhJr1ZXdw8/+/u0z/NWro24EdpEQ/HOYR3m6I8Pk0=;
        b=j5WcVc8RsY7gXrW5m6HM59va/35ray0z/k+O8XDyA1W6lsOK0KSfO/iGO0wO2jFCct
         4n/kl76aFdz54t32By5keZ1UycbL/aKDqAMgB2BykvygOCjSycqRuf5jNcw4ZAyw7j7C
         I/cjMjs8Cz6Z/rlvMe5uEtHwRNH5P1LL8wa4Xux4D/vyM+PAxrCq3b5941OWrvza5Txf
         N6PDl2Q/VOpMVtt6kILg1L/dZaYFkEQK5Vs6bzot9Esc1syjV7Vl6tHqTVemwtxgZZ7T
         m4+aOc8z/wGszJ12RtfeOGOPI3gvAqJG3WJh+eJ0yux9w+wjxeH4eKbxAWXVRNmnyGN6
         h7+Q==
X-Gm-Message-State: AOAM5309yhw9YT5+oX4Nx9TKF93Oq+f3DMbcrFvc5Pea1CRctjq6EPS6
        oYmGiGXHqKIbiBk/UvP1Sw8ZY1t6uQ==
X-Google-Smtp-Source: ABdhPJxlxqkdicSDnkAX0JwOU75SaAaUtqueokYIaoCa2mKzoSGF7NCeCM48mNfgTu3HxwhLOP0p/A==
X-Received: by 2002:aa7:8d02:: with SMTP id j2mr7619687pfe.90.1595570969813;
        Thu, 23 Jul 2020 23:09:29 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6c9b:7816:d54:f58c:a790:e57b])
        by smtp.gmail.com with ESMTPSA id h131sm5074747pfe.138.2020.07.23.23.09.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 23:09:29 -0700 (PDT)
Date:   Fri, 24 Jul 2020 11:39:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] bus: mhi: core: Use helper API to trigger a
 non-blocking host resume
Message-ID: <20200724060922.GA19688@Mani-XPS-13-9360>
References: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
 <1595543802-17859-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595543802-17859-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 23, 2020 at 03:36:35PM -0700, Bhaumik Bhatt wrote:
> Autonomous low power mode support requires the MHI host to resume from
> multiple places and post a wakeup source to exit system suspend. This
> needs to be done in a non-blocking manner. Introduce a helper API to
> trigger the host resume for data transfers and other non-blocking use
> cases while supporting implementation of autonomous low power modes.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h |  7 +++++++
>  drivers/bus/mhi/core/main.c     | 21 +++++++--------------
>  drivers/bus/mhi/core/pm.c       | 13 ++++---------
>  3 files changed, 18 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index bcfa7b6..1bbd6e9 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -599,6 +599,13 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl);
>  int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  		 enum mhi_cmd_type cmd);
>  
> +static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl)
> +{
> +	pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
> +	mhi_cntrl->runtime_get(mhi_cntrl);
> +	mhi_cntrl->runtime_put(mhi_cntrl);
> +}
> +
>  /* Register access methods */
>  void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
>  		     void __iomem *db_addr, dma_addr_t db_val);
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1f622ce..79be18e 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -909,8 +909,7 @@ void mhi_ctrl_ev_task(unsigned long data)
>  		 * process it since we are probably in a suspended state,
>  		 * so trigger a resume.
>  		 */
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> +		mhi_trigger_resume(mhi_cntrl);
>  
>  		return;
>  	}
> @@ -971,10 +970,8 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  	}
>  
>  	/* we're in M3 or transitioning to M3 */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl);
>  
>  	/* Toggle wake to exit out of M2 */
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> @@ -1032,10 +1029,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  	}
>  
>  	/* we're in M3 or transitioning to M3 */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl);
>  
>  	/* Toggle wake to exit out of M2 */
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> @@ -1147,10 +1142,8 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, enum dma_data_direction dir,
>  	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>  
>  	/* we're in M3 or transitioning to M3 */
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl);
>  
>  	/* Toggle wake to exit out of M2 */
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 661d704..b227d41 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -824,11 +824,8 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
>  	/* Wake up the device */
>  	read_lock_bh(&mhi_cntrl->pm_lock);
>  	mhi_cntrl->wake_get(mhi_cntrl, true);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		pm_wakeup_event(&mhi_cntrl->mhi_dev->dev, 0);
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>  
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
> @@ -1139,10 +1136,8 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>  
>  	mhi_dev->dev_wake--;
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl);
>  
>  	mhi_cntrl->wake_put(mhi_cntrl, false);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
