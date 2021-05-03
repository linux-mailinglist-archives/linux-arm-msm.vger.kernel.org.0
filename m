Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6DC371E0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 19:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhECRIv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 13:08:51 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:49177 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbhECRDO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 13:03:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620061339; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IHgBKszPDfI9boQsp7/GZvBwgpgeZ+KI0dR7l18CnEY=;
 b=kvtvcYf/sQJhNDA05tYpTh2WAVs5udfZsdgSX+a1DBPgiWUI8P9xIXuEMWd3GBdtOa3pCgF4
 i+8Gj66GSgdCuRzcn8YNLKPaA7IgqFwd3UfpQOQt+R3/p1UCU9q6h0g7fDoiO/0KzeOE6DPb
 Y8zwAm+w/w5PU0w0tpDHRHwM/38=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60902c748166b7eff7b9ed8d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 17:01:40
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5962EC28D92; Mon,  3 May 2021 17:01:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99167C25359;
        Mon,  3 May 2021 17:01:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 May 2021 10:01:37 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: core: Fix power down latency
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
References: <1620029090-8975-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <6a871b31f4f5c7ab8f12b75eed9861d3@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-03 01:04 AM, Loic Poulain wrote:
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
> Fixes: a6e2e3522f29 ("bus: mhi: core: Add support for PM state 
> transitions")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

>  drivers/bus/mhi/core/pm.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a3..704a5e2 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -465,23 +465,15 @@ static void mhi_pm_disable_transition(struct
> mhi_controller *mhi_cntrl)
> 
>  	/* Trigger MHI RESET so that the device will not access host memory 
> */
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

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
