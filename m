Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F01E3500E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 15:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbhCaNE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 09:04:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235545AbhCaNE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 09:04:56 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93BBDC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 06:04:56 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id y2so7865302plg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 06:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y/W9j52bRCr34F2U4wtRCQZSzvkSWXnejRIXqaUQIjU=;
        b=TJ/3dyaU8Ll0AQIdrQeYIH9i/ZllA53/kLp25rJCKy68x3rs/fGVAZPXcFfip0dnUm
         93R3Rw63Qrmsny9GVkEcSfd4yux63lxs915vktqN45dJisJTUbLi/ktSwHamrfx7CZai
         n5Fdf9hJfR9/G3G70ICUARXlzFdJHqgN4VgTa9Mn7tpyMXXz+rRbJFLGTFNL62flWNeO
         M1GZ48NRdYY0y7ARgtLjgls7xOf1Ldvb3efRYhHr6omFe+jow2tStmVmYYadKWmE4NLO
         TaggZwIPRxfSGS+rDLur7P8PP+hmhubjaHUMVJ0/iJ8+h2rQ8EXniYgOVfoiDUoLlUau
         ckIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y/W9j52bRCr34F2U4wtRCQZSzvkSWXnejRIXqaUQIjU=;
        b=b909Z3W18JassefgE4ByUTRDks4L3d406NcNvahEkWMAubvxAaoTTg9LGYiOVEb9zJ
         ameHJ5Q7gSI7LZoaN+R/I+JQbzH1qHI4bIDpkCf0Sjh4xj7TQbNHrIaoOLbQQ26/7Wrz
         zo4jdsl3HfNzSY9jKmSQGqR+8t4R+91tBxJ0CI0IsYBes6v3DYx3JHVEgF1CwyI6/8GV
         rQLoyqaEaIE0YijauwIvSosidcQGd3dQWAwbvAFmRu66jE4sIjX4HXMECSKl+nTOJk9U
         OTtU3ixkw13Xevy1Og8pX8/cifDqHlcVqUc0+UGbTZAjgtAkgXOmkEHMSHI8JeTi7M3D
         FKXg==
X-Gm-Message-State: AOAM531FJEUIlN82ESSPa3mAt91nhIQm3UGtBqDndL93whJIz1+ufyzN
        +KCc7oRUC/ghgGQflYCsRcO1
X-Google-Smtp-Source: ABdhPJzfgUA7Zjbr70RsfGbELgXB1KoVfBYP3wj74cuoM90t+cKMJaJcT9+ADV9hS6SKMimCLM8tig==
X-Received: by 2002:a17:902:aa87:b029:e5:e1fc:be6 with SMTP id d7-20020a170902aa87b02900e5e1fc0be6mr3210942plr.4.1617195895785;
        Wed, 31 Mar 2021 06:04:55 -0700 (PDT)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id t22sm2308006pjw.54.2021.03.31.06.04.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 06:04:55 -0700 (PDT)
Date:   Wed, 31 Mar 2021 18:34:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 2/2] bus: mhi: core: Move to polling method to wait
 for MHI ready
Message-ID: <20210331130451.GJ15610@work>
References: <1617047583-12104-1-git-send-email-bbhatt@codeaurora.org>
 <1617047583-12104-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617047583-12104-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 12:53:03PM -0700, Bhaumik Bhatt wrote:
> In certain devices, it is likely that there is no incoming MHI
> interrupt for a transition to MHI READY state. One such example
> is the move from Pass Through to an SBL or AMSS execution
> environment. In order to facilitate faster bootup times as there
> is no need to wait until timeout_ms completes, MHI host can poll
> every 25 milliseconds to check if device has entered MHI READY
> until a maximum timeout of twice the timeout_ms is reached.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/pm.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 681960c..dcc7fe0 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -153,34 +153,32 @@ static void mhi_toggle_dev_wake(struct mhi_controller *mhi_cntrl)
>  /* Handle device ready state transition */
>  int mhi_ready_state_transition(struct mhi_controller *mhi_cntrl)
>  {
> -	void __iomem *base = mhi_cntrl->regs;
>  	struct mhi_event *mhi_event;
>  	enum mhi_pm_state cur_state;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	u32 reset = 1, ready = 0;
> +	u32 interval_us = 25000; /* poll register field every 25 milliseconds */
>  	int ret, i;
>  
> -	/* Wait for RESET to be cleared and READY bit to be set by the device */
> -	wait_event_timeout(mhi_cntrl->state_event,
> -			   MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state) ||
> -			   mhi_read_reg_field(mhi_cntrl, base, MHICTRL,
> -					      MHICTRL_RESET_MASK,
> -					      MHICTRL_RESET_SHIFT, &reset) ||
> -			   mhi_read_reg_field(mhi_cntrl, base, MHISTATUS,
> -					      MHISTATUS_READY_MASK,
> -					      MHISTATUS_READY_SHIFT, &ready) ||
> -			   (!reset && ready),
> -			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -
>  	/* Check if device entered error state */
>  	if (MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
>  		dev_err(dev, "Device link is not accessible\n");
>  		return -EIO;
>  	}
>  
> -	/* Timeout if device did not transition to ready state */
> -	if (reset || !ready) {
> -		dev_err(dev, "Device Ready timeout\n");
> +	/* Wait for RESET to be cleared and READY bit to be set by the device */
> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +				 interval_us);
> +	if (ret) {
> +		dev_err(dev, "Device failed to clear MHI Reset\n");
> +		return -ETIMEDOUT;

You should return the actual error code since there are couple of error
paths.

Thanks,
Mani

> +	}
> +
> +	ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHISTATUS,
> +				 MHISTATUS_READY_MASK, MHISTATUS_READY_SHIFT, 1,
> +				 interval_us);
> +	if (ret) {
> +		dev_err(dev, "Device failed to enter MHI Ready\n");
>  		return -ETIMEDOUT;
>  	}
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
