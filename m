Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1F31CED38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 08:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgELGsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 02:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725889AbgELGr7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 02:47:59 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AD3C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:47:59 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n11so5716135pgl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 23:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xStF/LvgirIKlsQkZu5T5XjT/8+nmfTv4uL0HxiDbUg=;
        b=TpxuWsEBxYJVZ6z1OiykUfvfvt2F8hshe2JE8BF2NMN7ZSwR5WDiMle2Ym6wnIo0Av
         0Fehon1Ff6cS4G0Yj5jr9dVcdHFs5P7mYru9FjjMhoOBbfqm3kaH3EyeYvx6/kGtuytg
         l+AuAMI8TMb+vb2rVHYGFvL7QOiSCJ31pWWgJReKy5BAO6euEZzLxl9Zx++Pt5gjEuM0
         l/ehikOu2Ic8YTX1yo+ljGQlr8BycPqnPgYCYvPx7ybj8WZKqth265hwPaDdt55+4Z1L
         QJpFumikb7y+mGGsAefzLEH0KSqX7UONONBQJGj3DH7VsWo2qlp6OXBa3GIr+ZmaP0r4
         7+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xStF/LvgirIKlsQkZu5T5XjT/8+nmfTv4uL0HxiDbUg=;
        b=bTH0kkH2Vh1GeN7OIYltJ5YVf+nkgRkK99gQWcBcngrihRzVbcZTh6aJKqkDpZi7Aa
         Yq4iTZCYJ3tq7EmnTeqpTQ5klDuEbb1J2f0HoIYa39rRxEk5U9RdR2IO/ayebCVpjEq8
         CV+rqbvIoHvCYjjXKst3wXQ5MzWRAipx19REPDz3DJCqPu6jTR8MUujKRneIYyfs/SXC
         5XsVX0AoNjih5knNZl4QtB3CGOxWJffxOcG7UYvzDqSAdjf8fyzc14ZWfNdDNoBu0DZG
         4Ytd8lxmfnVyrpFEsIPyiT78PK8O6C3YGk2IgJaYgI+njBxJk97Xdl4lX0//JRSWxAMf
         YPrA==
X-Gm-Message-State: AOAM530UNAq4IzE7Yiy6neWgLh+7QjWzZ+tv76ypHUKj6hMQ9x5y8+c3
        FupBDKcTn702Zo/7OnSYp6xZ
X-Google-Smtp-Source: ABdhPJyvA/QCz/3nwd9RhJfuGISeb+4IzqsUvXUDJavBywVLWxQ2L4Ke5f0zGkqBy8CZZVKkxxmqew==
X-Received: by 2002:a63:5812:: with SMTP id m18mr3060403pgb.407.1589266079225;
        Mon, 11 May 2020 23:47:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
        by smtp.gmail.com with ESMTPSA id a136sm11269599pfa.99.2020.05.11.23.47.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 23:47:58 -0700 (PDT)
Date:   Tue, 12 May 2020 12:17:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
Subject: Re: [PATCH v1 2/5] bus: mhi: core: Handle disable transitions in
 state worker
Message-ID: <20200512064752.GD4928@Mani-XPS-13-9360>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-3-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589248989-23824-3-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 11, 2020 at 07:03:06PM -0700, Hemant Kumar wrote:
> Mission mode transition is handled by state worker thread but
> power off is not. There is a possibility while mission mode
> transition is in progress which calls MHI client driver probe,
> power off is issued by MHI controller. This results into client
> driver probe and remove running in parallel and causes use after
> free situation. By queuing disable transition work when mission
> mode is in progress prevents the race condition.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c     |  1 +
>  drivers/bus/mhi/core/internal.h |  1 +
>  drivers/bus/mhi/core/pm.c       | 11 ++++++++++-
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 3a853c5..12207cc 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -35,6 +35,7 @@
>  	[DEV_ST_TRANSITION_SBL] = "SBL",
>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
> +	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>  };
>  
>  const char * const mhi_state_str[MHI_STATE_MAX] = {
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index f01283b..b1f640b 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -387,6 +387,7 @@ enum dev_st_transition {
>  	DEV_ST_TRANSITION_SBL,
>  	DEV_ST_TRANSITION_MISSION_MODE,
>  	DEV_ST_TRANSITION_SYS_ERR,
> +	DEV_ST_TRANSITION_DISABLE,
>  	DEV_ST_TRANSITION_MAX,
>  };
>  
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index d9964d4..345f197 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -657,6 +657,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>  			mhi_pm_disable_transition
>  				(mhi_cntrl, MHI_PM_SYS_ERR_PROCESS);
>  			break;
> +		case DEV_ST_TRANSITION_DISABLE:
> +			mhi_pm_disable_transition
> +				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
> +			break;
>  		default:
>  			break;
>  		}
> @@ -1011,7 +1015,12 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
>  	}
> -	mhi_pm_disable_transition(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
> +
> +	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
> +
> +	/* Wait for shutdown to complete */
> +	flush_work(&mhi_cntrl->st_worker);
> +
>  	mhi_deinit_free_irq(mhi_cntrl);
>  
>  	if (!mhi_cntrl->pre_init) {
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
