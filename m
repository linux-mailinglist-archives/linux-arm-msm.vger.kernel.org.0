Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E9B3B308A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 15:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhFXNz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 09:55:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXNzz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 09:55:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F24C613ED;
        Thu, 24 Jun 2021 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624542815;
        bh=WuGclsAxOiYq/aCZOLJGuJCShfXRC5h/rYQlt1bwn4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=te5oQlEds6nbZ9Wx4nJf7eOu16XxBbeYfAPYhWrk2+DAEKH5GXaZMZLPV06iazGf8
         GbOPmnJVpIRMtZk8wFbTR2itW7WXPWLnCLiTO6NYKnVwalPeOYbGAXVpJcqh99F3Kr
         xGHoV++Utns99LPkffOYzd+u/ZTYS7n8U9uWmROw=
Date:   Thu, 24 Jun 2021 15:53:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH 6/8] bus: mhi: core: Add support for processing priority
 of event ring
Message-ID: <YNSOXaWt3YX3yDQC@kroah.com>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-7-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621161616.77524-7-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 09:46:14PM +0530, Manivannan Sadhasivam wrote:
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
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link: https://lore.kernel.org/r/1624053903-24653-2-git-send-email-bbhatt@codeaurora.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 3 +--
>  drivers/bus/mhi/core/main.c | 9 +++++++--
>  include/linux/mhi.h         | 2 +-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377fca8f..444676034bf0 100644
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
> index 8ac73f9e92a6..3775c77dec63 100644
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
> index 86cea5256e3c..bf23c213429c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -250,7 +250,7 @@ struct mhi_channel_config {
>   * @irq_moderation_ms: Delay irq for additional events to be aggregated
>   * @irq: IRQ associated with this ring
>   * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
> - * @priority: Priority of this ring. Use 1 for now
> + * @priority: Processing priority of this ring. 0 is high and 1 is regular

Why is 0 high and 1 low?  Does that feel backwards?

Shouldn't this be a boolean, or if not, an enumerated type so that
people can read the code over time?

thanks,

greg k-h
