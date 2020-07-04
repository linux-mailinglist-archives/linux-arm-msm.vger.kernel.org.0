Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E45214681
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 16:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDOrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 10:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgGDOrY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 10:47:24 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E572EC061794
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 07:47:23 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x3so9579576pfo.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p/55De6gGtaFwxFQIqPcNfatEGLg0t1eCobtBLAgNg4=;
        b=M7+j+auj6W0P6QiET/OM6aWLhlCgIAMiuV3Tk0omNfJDBKL5xdnu1jE1QQblptExQ2
         Sr7qSCVN/OyIBXtT5ZSDzaSqreLAHb57RpkcXYnpObmK5n4NgRiRAUCh8+e+ieLUyR7G
         pXq41vxVZP4ZOBTkZB1ENGjBDw/8AsgkTUbxEyUZgdH5q8CvI6OtHyTW6MCGv7J+KVxP
         ei1gSYLww1tMA1F5l6vJkziBRR2Bn3KcPDyykQjPIhZ8+jYWrUXnmTaWhz1jckncE0zK
         3uwaNTMvi60vel1giShy5RIw2tGoMiKKAWBJnlbzc3yhJwvfHeipI3+sH3FTBRp5SkHb
         b5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p/55De6gGtaFwxFQIqPcNfatEGLg0t1eCobtBLAgNg4=;
        b=Wfpxw8keBhj7OXqUHcpUmwcvI39jFq+COdtYj/Q1J5hEojU7cz4FQLhe6JYUMLBYgO
         zjaexMtkLA9b/1+op8GPX1+RBJgL/7NGXuPDLjzGnYQwLL81/HeT7yTfNc6NiiXXgwIv
         ivGXKAKj5+BWWKIgb6rC82U+QwJYC5uJFq7Ym65YbeyG0W84uA9TZfue8mlDMt6XnJOM
         iO0vd+I+B02I/uWbBbZKTHiyThnVTkfcDt6UbFRmbDieejYtIlxWgz6dIo9qYnEPyOiR
         mn9rQu3egbKrkraxdIwVIE1XLYbCbhkL8V6OyNW4MZc6rpjrkjTix/iVJukI1av0l7jA
         pxkg==
X-Gm-Message-State: AOAM530ATsiBQsabU12CcE+UhKDK3DCJpHwt8BmjzY09IQiY2I2Q/8T9
        p8c/TAx62LfvcISwXIQtlMJ/DNT2ug==
X-Google-Smtp-Source: ABdhPJwP/dv8Np1XlPSKXs0oR2M/7BaEapR8vP1S4nR79PyY2OHwL7cCfIF9S/EBer6mYXzCxqnSWg==
X-Received: by 2002:a63:7f17:: with SMTP id a23mr33029745pgd.3.1593874042017;
        Sat, 04 Jul 2020 07:47:22 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id n12sm14766200pgr.88.2020.07.04.07.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:47:20 -0700 (PDT)
Date:   Sat, 4 Jul 2020 20:17:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] bus: mhi: core: Use helper API to trigger a
 non-blocking host resume
Message-ID: <20200704144714.GC3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-4-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-4-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:36AM -0700, Bhaumik Bhatt wrote:
> Autonomous low power mode support requires the MHI host to resume from
> multiple places and post a wakeup source to exit system suspend. This
> needs to be done in a non-blocking manner. Introduce a helper API to
> trigger the host resume for data transfers and other non-blocking use
> cases while supporting implementation of autonomous low power modes.
> 

Why can't you use pm_wakeup_event() as done in __mhi_device_get_sync()?

Thanks,
Mani

> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/internal.h |  8 ++++++++
>  drivers/bus/mhi/core/main.c     | 21 +++++++--------------
>  drivers/bus/mhi/core/pm.c       |  6 ++----
>  3 files changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index bcfa7b6..cb32eaf 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -599,6 +599,14 @@ int mhi_queue_state_transition(struct mhi_controller *mhi_cntrl,
>  int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
>  		 enum mhi_cmd_type cmd);
>  
> +static inline void mhi_trigger_resume(struct mhi_controller *mhi_cntrl,
> +				      bool hard_wakeup)
> +{
> +	pm_wakeup_dev_event(&mhi_cntrl->mhi_dev->dev, 0, hard_wakeup);
> +	mhi_cntrl->runtime_get(mhi_cntrl);
> +	mhi_cntrl->runtime_put(mhi_cntrl);
> +}
> +
>  /* Register access methods */
>  void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg *db_cfg,
>  		     void __iomem *db_addr, dma_addr_t db_val);
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 1f622ce..8d6ec34 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -909,8 +909,7 @@ void mhi_ctrl_ev_task(unsigned long data)
>  		 * process it since we are probably in a suspended state,
>  		 * so trigger a resume.
>  		 */
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> +		mhi_trigger_resume(mhi_cntrl, false);
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
> +		mhi_trigger_resume(mhi_cntrl, false);
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
> +		mhi_trigger_resume(mhi_cntrl, false);
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
> +		mhi_trigger_resume(mhi_cntrl, false);
>  
>  	/* Toggle wake to exit out of M2 */
>  	mhi_cntrl->wake_toggle(mhi_cntrl);
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 661d704..5e3994e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1139,10 +1139,8 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>  
>  	mhi_dev->dev_wake--;
>  	read_lock_bh(&mhi_cntrl->pm_lock);
> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
> -		mhi_cntrl->runtime_get(mhi_cntrl);
> -		mhi_cntrl->runtime_put(mhi_cntrl);
> -	}
> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> +		mhi_trigger_resume(mhi_cntrl, false);
>  
>  	mhi_cntrl->wake_put(mhi_cntrl, false);
>  	read_unlock_bh(&mhi_cntrl->pm_lock);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
