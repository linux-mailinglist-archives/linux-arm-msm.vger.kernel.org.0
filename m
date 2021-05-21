Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897AF38C683
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbhEUMav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229457AbhEUMat (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:30:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BC14613DE;
        Fri, 21 May 2021 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621600167;
        bh=1Lfdc7GAV3wIBxxV4DShexmv90ecbDlZxrinOi/ZfJg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vj692XWhn9NligEBlV+0WnwpLuV187PB7cl9sFIMqiveikX9+AzK1iPT726pczDNQ
         HSR19wS4Ze3NjE+Z8I9yJH7NQewHRMwaIsR0Fmq5eWJxLZTdU9djhbdseoMat8kGrS
         kSNjBx+De0K3fU5BVZOiuWPcaexiZDgk4wye9qSW2SUh+YacVJw36Q7Sk+mJLpcQAB
         cY1V2Y2RTZyvgmjdNQsLSIzeI+HSUdq133aqIdcD5JPCUtasZHcXWZl5vYffZxF0dg
         s43MrkNruF4Y6AmsUjMbOa9uUM9NtjW6yj1x1Tv9zxay+9Frwsj6fquSvA/YqA9423
         SErTb2COM4+kQ==
Date:   Fri, 21 May 2021 17:59:20 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix power down latency
Message-ID: <20210521122920.GE70095@thinkpad>
References: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 10:04:50AM +0200, Loic Poulain wrote:
> On graceful power-down/disable transition, when an MHI reset is
> performed, the MHI device loses its context, including interrupt
> configuration. However, the current implementation is waiting for
> event(irq) driven state change to confirm reset has been completed,
> which never happens, and causes reset timeout, leading to unexpected
> high latency of the mhi_power_down procedure (up to 45 seconds).
> 
> Fix that by moving to the recently introduced poll_reg_field method,
> waiting for the reset bit to be cleared, in the same way as the
> power_on procedure.
> 
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state transitions")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a3..704a5e2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -465,23 +465,15 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
>  
>  	/* Trigger MHI RESET so that the device will not access host memory */
>  	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
> -		u32 in_reset = -1;
> -		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
> -
>  		dev_dbg(dev, "Triggering MHI Reset in device\n");
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  
>  		/* Wait for the reset bit to be cleared by the device */
> -		ret = wait_event_timeout(mhi_cntrl->state_event,
> -					 mhi_read_reg_field(mhi_cntrl,
> -							    mhi_cntrl->regs,
> -							    MHICTRL,
> -							    MHICTRL_RESET_MASK,
> -							    MHICTRL_RESET_SHIFT,
> -							    &in_reset) ||
> -					!in_reset, timeout);
> -		if (!ret || in_reset)
> -			dev_err(dev, "Device failed to exit MHI Reset state\n");
> +		ret = mhi_poll_reg_field(mhi_cntrl, mhi_cntrl->regs, MHICTRL,
> +				 MHICTRL_RESET_MASK, MHICTRL_RESET_SHIFT, 0,
> +				 25000);
> +		if (ret)
> +			dev_err(dev, "Device failed to clear MHI Reset\n");
>  
>  		/*
>  		 * Device will clear BHI_INTVEC as a part of RESET processing,
> -- 
> 2.7.4
> 
