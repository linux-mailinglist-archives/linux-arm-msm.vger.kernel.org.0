Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E27288EA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389662AbgJIQUA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389518AbgJIQT7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:19:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1299C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:19:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h6so7566458pgk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=U/u6IHdRQ/psB0Xv6HRzOplGyp4wP5YucQVH0WzAC3M=;
        b=I0+xez+8iYF8/Sopnaip3crOdzZHVQlHo62cgIHTppg1ennRqHwC/zF9ddKvbJOjj8
         vpVnFs8S8wEYI06b7KXAGemrB8oU6AF3EY5YqDhv+5PdUnbWqu+OqLa7ytQGyGe7Yk/w
         NlMwiv9KrectxTEUIDwTDmqooYDxEPOMEcuu5t64Taph7VAp9GjstAYctaySg1Myc86p
         MSkbOaSQOJkJ8mM2YDz7WYor/BgS9o7Detf/EAVrRRJgqiGwTPzQI3hFyrpd6URVAu+k
         hBVpfO3/N2PE2aLy/rgVP7uZDoX7NYgSk1N41D47tyFcPiUQYoCD3jj+OFeUROPV9lSN
         09Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=U/u6IHdRQ/psB0Xv6HRzOplGyp4wP5YucQVH0WzAC3M=;
        b=rg+cNvZNYQT0+iu7f22pLYbXJXkGDwY8UzSiQsCW+NjabwUdqrSxpfuibwzPVMQJMU
         qdUoojPpsJJLMRJRvMOf6Vk3lp4K3SMmMdLDW0SwQqSyEdb3bUAd0q/kVv6WRwImfKlh
         FuHiropW3rCQ0Nb3i3xQjjaBkrSwtAaKPItqJaIIqVgiyB7lq0HOpYRmCns7dzvoYrea
         QjlgPU4EXc5ju9ZQgdmeXWkSRulIU7kxOkri1y4HeCSqOISNN8Jbe2ir9EfvJHyEvJyt
         Gp/pehSumpJmSB57XC+MR14tjkLniH4FLCZAYzliy9DmfLQGLtkS57JyAT2qQnArvMyY
         VWFg==
X-Gm-Message-State: AOAM5301AjFhZEnJ71k3KdjpdwDa6PTCpQ1NWf+4xBrskslO1EtUP7N1
        CS4GYPyJpKPdA1Xy3EW8bV04
X-Google-Smtp-Source: ABdhPJyx//guo21NTcW8LEsh3wY15TneKjjvXe7IJNasC3G3AUEr2e/EtDeZJ1UKoW2KCoNo3VVy9w==
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr5961491pje.64.1602260398972;
        Fri, 09 Oct 2020 09:19:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id j6sm11032328pfi.129.2020.10.09.09.19.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:19:58 -0700 (PDT)
Date:   Fri, 9 Oct 2020 21:49:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/10] bus: mhi: core: Improve shutdown handling after
 link down detection
Message-ID: <20201009161950.GG4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-7-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:31PM -0700, Bhaumik Bhatt wrote:
> If MHI were to attempt a device shutdown following an assumption

MHI host? And is this really an assumption or it is definite that the
link is inaccessible. Please clarify!

> that the device is inaccessible, the host currently moves to a state
> where device register accesses are allowed when they should not be.
> This would end up allowing accesses to the device register space when
> the link is inaccessible and can result in bus errors observed on the
> host. Improve shutdown handling to prevent these outcomes and do not
> move the MHI PM state to a register accessible state after device is
> assumed to be inaccessible.
>

Apparently you are introducing a new device transition state but your
commit description doesn't state that :/

Thanks,
Mani
 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c     |  1 +
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/pm.c       | 18 +++++++++++++-----
>  3 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 9ae4c19..fa33dde 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -37,6 +37,7 @@ const char * const dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
> +	[DEV_ST_TRANSITION_FATAL] = "FATAL SHUTDOWN",
>  };
>  
>  const char * const mhi_state_str[MHI_STATE_MAX] = {
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 7989269..f3b9e5a 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -388,6 +388,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_MISSION_MODE,
>  	DEV_ST_TRANSITION_SYS_ERR,
>  	DEV_ST_TRANSITION_DISABLE,
> +	DEV_ST_TRANSITION_FATAL,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 3462d82..bce1f62 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -37,9 +37,10 @@
>   *     M0 -> FW_DL_ERR
>   *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
>   * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
> - * L2: SHUTDOWN_PROCESS -> DISABLE
> + * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
> + *     SHUTDOWN_PROCESS -> DISABLE
>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
> - *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
> + *     LD_ERR_FATAL_DETECT -> DISABLE
>   */
>  static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L0 States */
> @@ -72,7 +73,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	{
>  		MHI_PM_M3,
>  		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
> -		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
> +		MHI_PM_LD_ERR_FATAL_DETECT
>  	},
>  	{
>  		MHI_PM_M3_EXIT,
> @@ -103,7 +104,7 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>  	/* L3 States */
>  	{
>  		MHI_PM_LD_ERR_FATAL_DETECT,
> -		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
> +		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
>  	},
>  };
>  
> @@ -670,6 +671,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_disable_transition
>  				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
>  			break;
> +		case DEV_ST_TRANSITION_FATAL:
> +			mhi_pm_disable_transition
> +				(mhi_cntrl, MHI_PM_LD_ERR_FATAL_DETECT);
> +			break;
>  		default:
>  			break;
>  		}
> @@ -1039,6 +1044,7 @@ EXPORT_SYMBOL_GPL(mhi_async_power_up);
>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  {
>  	enum mhi_pm_state cur_state;
> +	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  
>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
> @@ -1053,9 +1059,11 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
> +		else
> +			next_state = DEV_ST_TRANSITION_FATAL;
>  	}
>  
> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +	mhi_queue_state_transition(mhi_cntrl, next_state);
>  
>  	/* Wait for shutdown to complete */
>  	flush_work(&mhi_cntrl->st_worker);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
