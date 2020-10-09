Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DAC288F1E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 18:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389855AbgJIQo7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 12:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388745AbgJIQo4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 12:44:56 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C72C0613D5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2020 09:44:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id e10so7344282pfj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2020 09:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cWs84SqTxwa8ama3NQBlgQfKzF7xkpWKH/ORsqiAAHY=;
        b=sBWxx2zxyXVDDqj7LQLC91NP4WZl2IijlnU1VqBHhEjONCt/4nRxelQ1SQKqfKfC4C
         SbNgzoUZMhd6kDzmFUk0FmaJPEcxF5BKg3A7JwRp0ImKTICk/5wqJCA+8ApTFJxXApIJ
         tHcxrL4RZT0/mVh4T6zIIBp4DyzH47aRcw7kriY37FvEziXScgPcnzvJCBAzKVbkYzZh
         UW82OrJ01LFM9U5e5Cu0A3z96WxEC6ElBI5T7Gq5CTIuOwonfD+o1sjv733jewFrP2MN
         dPCTFEeAvwPPxLyKfGYMtnT0DmTNW4f5NJUt4t8lq1sRoe/oseOc+6RJOK6PF6XU6T2y
         f7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cWs84SqTxwa8ama3NQBlgQfKzF7xkpWKH/ORsqiAAHY=;
        b=IQ/l0egI/W+eYzhQzFru/KxGwH+VgzLrEOSVyYk8WvEsMDc7B87uomefBnBS1wMg+/
         F+DVCes4agEK5NtQ/4Qgt4Mv76SSjeU60kC0yt39+nVwTKv4WhT7v46msutDBCP6C5Wt
         BvjTiRLbAjc81i1n+0ICMZUSLx2q4NzfO6+KXgEySo8h2ItBI1wO91x9G9pAqhRvPaok
         qqjOwrH96LxCrY/TyoajuDOYkMq230skCT7CtKWnyvrDFbtxWzFvlwqZrbpuxRLahji0
         ZA7REZfeDW4I3ZtK2joQWp7HaYz+tAa4vH/Z7b7TvtG7rvQAxtES9DRY8jybcYf6zmUC
         zGCA==
X-Gm-Message-State: AOAM5321kq0p+yTz/s/HEQ2DEKGAGCW/NI6QtRxZbCZu+OyxT+AQQcqW
        kNmCP8sXewrRb9J9tokMIIcRFJmoktEb
X-Google-Smtp-Source: ABdhPJztuoTLhqk/VCU2llwb2528WLSTViLzuMxU+lq9dIW2o4A7mCnwb/KC1X1moSIrnKipELTC1A==
X-Received: by 2002:a62:1d57:0:b029:152:47a7:e04b with SMTP id d84-20020a621d570000b029015247a7e04bmr13233945pfd.48.1602261893875;
        Fri, 09 Oct 2020 09:44:53 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6292:5a21:d5ff:f3e8:fcf2:ccc7])
        by smtp.gmail.com with ESMTPSA id z21sm11602246pfr.43.2020.10.09.09.44.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:44:53 -0700 (PDT)
Date:   Fri, 9 Oct 2020 22:14:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 09/10] bus: mhi: core: Move to an error state on
 mission mode failure
Message-ID: <20201009164445.GJ4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-10-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600480955-16827-10-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 07:02:34PM -0700, Bhaumik Bhatt wrote:
> If the host receives a mission mode event and by the time it can get
> to processing it, the register accesses fail implying a connectivity
> error, MHI should move to an error state. This helps avoid longer wait
> times from a synchronous power up perspective and accurately reflects
> the MHI execution environment and power management states.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index bce1f62..16c04ab 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -384,10 +384,14 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
>  		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> -	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
> -	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
> +	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
> +		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
> +		write_unlock_irq(&mhi_cntrl->pm_lock);
> +		wake_up_all(&mhi_cntrl->state_event);
>  		return -EIO;
> +	}
> +	write_unlock_irq(&mhi_cntrl->pm_lock);
>  
>  	wake_up_all(&mhi_cntrl->state_event);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
