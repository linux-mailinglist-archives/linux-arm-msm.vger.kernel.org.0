Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9230936E01B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 22:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240101AbhD1UKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 16:10:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:21207 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239847AbhD1UKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 16:10:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619640598; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=p89SAoyzwxCDxPEQDDBPo9LpbJQRJGGUarsHfOcJ8k0=;
 b=Q5M0yXm8MLlWNUOhdBHTv5sh2/YEnfXZKuT0eBaXBe6PkCAIx+P2Yij8rrtcZTOgvz8LQjqa
 1FMvYEYGX3BkNkQzvGZ/gfksYsB1dZEWus+S3rA4KYIPm2kfd4BELCeL9UAQUEVfpBjYeLlJ
 +AS4PdLwvzLqyS4mx0v0CNe4dmA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6089c109a817abd39a6157ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 20:09:45
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B464C433D3; Wed, 28 Apr 2021 20:09:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47067C4338A;
        Wed, 28 Apr 2021 20:09:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 13:09:44 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     mani@kernel.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Fix power down latency
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1619598574-11928-1-git-send-email-loic.poulain@linaro.org>
References: <1619598574-11928-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <57eb5579ca58e1e27a2022432d2ffc4c@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-28 01:29 AM, Loic Poulain wrote:
> On gracefull power-down/disable transition, a MHI reset is performed,
On _graceful_ power-down/disable transition, _when an_ MHI reset is 
performed,
> the MHI device then looses its context, including interrupt config.
the MHI device _loses_ its context, including interrupt configuration.
> However the current implementation is waiting for event(irq) driven
However, the current implementation is waiting for event(irq) driven
> state change to confirm reset has been completed, which never happens,
> and causes reset timeout, leading to unexpected high latency of the
> mhi_power_down procedure.
> 
> Fix that by moving to the recently introduced poll_reg_field method,
> waiting for the reset bit to be cleared, in the same way as the
> power_on procedure.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/pm.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index e2e59a3..9c61d3f 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -3,7 +3,6 @@
>   * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
>   *
>   */
> -
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/dma-direction.h>
> @@ -471,17 +470,11 @@ static void mhi_pm_disable_transition(struct
> mhi_controller *mhi_cntrl)
>  		dev_dbg(dev, "Triggering MHI Reset in device\n");
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
> 
> -		/* Wait for the reset bit to be cleared by the device */
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
