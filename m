Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F0B3AD884
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 09:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231834AbhFSHux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 03:50:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:39794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229466AbhFSHux (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 03:50:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2423460FEE;
        Sat, 19 Jun 2021 07:48:39 +0000 (UTC)
Date:   Sat, 19 Jun 2021 13:18:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v2] bus: mhi: core: Add support for processing priority
 of event ring
Message-ID: <20210619074836.GD4889@workstation>
References: <1624053903-24653-1-git-send-email-bbhatt@codeaurora.org>
 <1624053903-24653-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624053903-24653-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 18, 2021 at 03:05:03PM -0700, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Event ring priorities are currently set to 1 and are unused.
> Default processing priority for event rings is set to regular
> tasklet. Controllers can choose to use high priority tasklet
> scheduling for certain event rings critical for processing such
> as ones transporting control information if they wish to avoid
> system scheduling delays for those packets. In order to support
> these use cases, allow controllers to set event ring priority to
> high.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 3 +--
>  drivers/bus/mhi/core/main.c | 9 +++++++--
>  include/linux/mhi.h         | 2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377..4446760 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -673,8 +673,7 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  				&mhi_cntrl->mhi_chan[mhi_event->chan];
>  		}
>  
> -		/* Priority is fixed to 1 for now */
> -		mhi_event->priority = 1;
> +		mhi_event->priority = event_cfg->priority;
>  
>  		mhi_event->db_cfg.brstmode = event_cfg->mode;
>  		if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 8ac73f9..3775c77 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -454,10 +454,15 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  
>  		if (mhi_dev)
>  			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
> -	} else {
> -		tasklet_schedule(&mhi_event->task);
> +
> +		return IRQ_HANDLED;
>  	}
>  
> +	if (!mhi_event->priority)
> +		tasklet_hi_schedule(&mhi_event->task);
> +	else
> +		tasklet_schedule(&mhi_event->task);
> +
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 86cea52..bf23c21 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -250,7 +250,7 @@ struct mhi_channel_config {
>   * @irq_moderation_ms: Delay irq for additional events to be aggregated
>   * @irq: IRQ associated with this ring
>   * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
> - * @priority: Priority of this ring. Use 1 for now
> + * @priority: Processing priority of this ring. 0 is high and 1 is regular
>   * @mode: Doorbell mode
>   * @data_type: Type of data this ring will process
>   * @hardware_event: This ring is associated with hardware channels
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
