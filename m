Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC513AD87F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 09:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhFSHrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 03:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhFSHq7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 03:46:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 416A26102A;
        Sat, 19 Jun 2021 07:44:46 +0000 (UTC)
Date:   Sat, 19 Jun 2021 13:14:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH] bus: mhi: core: Disable pre-emption for data events
 tasklet processing
Message-ID: <20210619074442.GC4889@workstation>
References: <1624054985-31365-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624054985-31365-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 03:23:05PM -0700, Bhaumik Bhatt wrote:
> With spin_lock_bh(), it is possible that a tasklet processing data
> events gets scheduled out if another higher priority tasklet is
> ready to run. While the tasklet is sleeping, it can hold the event
> ring spinlock and block another tasklet, for example, one processing
> an M0 state change event, from acquiring it. This can starve the
> core which blocks in an attempt to acquire the spinlock until it
> gets released. Fix this issue by disabling pre-emption on the core
> processing data events and allow it to run to completion such that
> other tasklets do not block for long periods.
> 

Are you sure?

IIUC, the tasklets priority is only used while trying to schedule the
next pending tasklet. But I don't think a high priority tasklet can
preempt the low priority one.

Please correct me if I'm wrong.

Thanks,
Mani

> Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 3775c77..02c8c09 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1036,11 +1036,12 @@ void mhi_ev_task(unsigned long data)
>  {
>  	struct mhi_event *mhi_event = (struct mhi_event *)data;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
> +	unsigned long flags;
>  
>  	/* process all pending events */
> -	spin_lock_bh(&mhi_event->lock);
> +	spin_lock_irqsave(&mhi_event->lock, flags);
>  	mhi_event->process_event(mhi_cntrl, mhi_event, U32_MAX);
> -	spin_unlock_bh(&mhi_event->lock);
> +	spin_unlock_irqrestore(&mhi_event->lock, flags);
>  }
>  
>  void mhi_ctrl_ev_task(unsigned long data)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
