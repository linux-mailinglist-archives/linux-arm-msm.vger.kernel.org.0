Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C28A3B3BED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 07:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhFYFJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 01:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhFYFJO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 01:09:14 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68031C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:06:53 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id f10so4142187plg.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sDBSHxpMJSy8nk14ftLNC6ka6M5l3hZIgvMObo4TxUY=;
        b=FAtP8fnEkwB5JO4QtXWzLe+zu3KU8PRys/0kvTyWzIUk2QRbbtoZsB4Vz/8NsUWWp/
         fMXMYq+oGmQ6A4gTc9qSkxwtYKP3WEeJyoO6qGvToVM0WoENaa2lQeImYsIoMpLAfc0h
         bBo00zHKttVCPycj8oVSSU3cdFDgmE+rJUbu+XduofiELPUH8odDf9PdkMIcmcCHWWCi
         QXFY+gp7VBMmXApifsDSgV1Q8f8nk6zA1wta1fafAh+uX9YQ+WYQvHQPPSngafYL/Clv
         DJOdbDzJdAdMTFqVyPCyA01Pt17T4RwGNBEbykeBNRWjV4yy1hN6MGcIrmbqIwVqKLzW
         lVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sDBSHxpMJSy8nk14ftLNC6ka6M5l3hZIgvMObo4TxUY=;
        b=tulDP9HKuSO5BxIfP3N3QLcWJU5dHkD3XO6yjZFH+pw9p3jud9mwDKU/MNDpucQ1MT
         RP7toRJKR8au8ZX/d4TV+38Rd+2XSlKmVOJxpSG9D/Gj1cFYbkjIVnmmX2wAciNLz+ya
         +qyHCLfEXBtYhdTJWdiNYQ7H3///8iyGqrPMiwRLef7wzdA05YUodT3L8xPJ6m6Qz9FV
         UCo1R+FU+T9tnFiEJr2+TsPrOr/h3HcfSkx2XoMdfK8HbgojR9PfPi/rD8bpR0pEkxHr
         br0gP7hlfTG3HhEFEf0AUk/XdSszt8AL2flILA6+83KFOF1hvLI7ATNBkB1i4XtdFoUZ
         yPxw==
X-Gm-Message-State: AOAM532mU5fA8EK2HINrSJFPs4TP/CjNIjothFE9EQBxkpIg9NlI0t8Z
        AEr9jJIDb02Wox4b4AYjMHhm
X-Google-Smtp-Source: ABdhPJxYgv/rEp1/VHEa6jG6NcQRVNeZGdvx4f372wEEFIpzUMROXXL8/NEKlBiuqJtGTHiDkW7hOw==
X-Received: by 2002:a17:902:6b82:b029:120:3404:ce99 with SMTP id p2-20020a1709026b82b02901203404ce99mr7319660plk.49.1624597612787;
        Thu, 24 Jun 2021 22:06:52 -0700 (PDT)
Received: from workstation ([120.138.13.204])
        by smtp.gmail.com with ESMTPSA id s12sm3956623pjz.37.2021.06.24.22.06.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Jun 2021 22:06:52 -0700 (PDT)
Date:   Fri, 25 Jun 2021 10:36:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] bus: mhi: core: Add support for processing priority
 of event ring
Message-ID: <20210625050649.GB4974@workstation>
References: <1624590379-12319-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624590379-12319-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 08:06:19PM -0700, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Event ring priorities are currently set to 1 and are unused.
> Default processing priority for event rings is set to regular
> tasklet. Controllers can choose to use high priority tasklet
> scheduling for certain event rings critical for processing such
> as ones transporting control information if they wish to avoid
> system scheduling delays for those packets. In order to support
> these use cases, allow controllers to set event ring priority to
> high. This patch only adds support and does not enable usage of
> these priorities.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Please add the controller driver changes in this patch itself.

Couple of nits below...

Thanks,
Mani

> ---
> v4:
> -Update fixed priority for all events to default to fix bug in v3
> -Supply changelog
> 
> v3:
> -Revert to enum approach
> -Use 0 as default and 1 as high in enum
> -Do not use config values for event rings
> 
> v2:
> -Use boolean approach for easy maintenance as controllers do not need updates
> 
>  drivers/bus/mhi/core/init.c     |  4 ++--
>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 19 ++++++++++++++++---
>  include/linux/mhi.h             | 14 ++++++++++++--
>  4 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index c81b377..23386b8 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -673,8 +673,8 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  				&mhi_cntrl->mhi_chan[mhi_event->chan];
>  		}
>  
> -		/* Priority is fixed to 1 for now */
> -		mhi_event->priority = 1;
> +		/* Priority is fixed to deafult for now */

default

> +		mhi_event->priority = MHI_ER_PRIORITY_DEFAULT;
>  
>  		mhi_event->db_cfg.brstmode = event_cfg->mode;
>  		if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 672052f..666e102 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -535,7 +535,7 @@ struct mhi_event {
>  	u32 intmod;
>  	u32 irq;
>  	int chan; /* this event ring is dedicated to a channel (optional) */
> -	u32 priority;
> +	enum mhi_er_priority priority;
>  	enum mhi_er_data_type data_type;
>  	struct mhi_ring ring;
>  	struct db_cfg db_cfg;
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 8ac73f9..bfc9776 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -425,10 +425,11 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  	}
>  }
>  
> -irqreturn_t mhi_irq_handler(int irq_number, void *dev)
> +irqreturn_t mhi_irq_handler(int irq_number, void *priv)
>  {
> -	struct mhi_event *mhi_event = dev;
> +	struct mhi_event *mhi_event = priv;
>  	struct mhi_controller *mhi_cntrl = mhi_event->mhi_cntrl;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	struct mhi_event_ctxt *er_ctxt =
>  		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
>  	struct mhi_ring *ev_ring = &mhi_event->ring;
> @@ -454,8 +455,20 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>  
>  		if (mhi_dev)
>  			mhi_notify(mhi_dev, MHI_CB_PENDING_DATA);
> -	} else {
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (mhi_event->priority) {
> +	case MHI_ER_PRIORITY_HI:
> +		tasklet_hi_schedule(&mhi_event->task);
> +		break;
> +	case MHI_ER_PRIORITY_DEFAULT:
>  		tasklet_schedule(&mhi_event->task);
> +		break;
> +	default:
> +		dev_err(dev, "Skip event of unknown priority\n");
> +		break;
>  	}
>  
>  	return IRQ_HANDLED;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 86cea52..62ddead 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -198,6 +198,16 @@ enum mhi_er_data_type {
>  };
>  
>  /**
> + * enum mhi_er_priority - Event ring processing priority
> + * @MHI_ER_PRIORITY_DEFAULT: processed by regular tasklet
> + * @MHI_ER_PRIORITY_HI: processed by hi-priority tasklet

s/hi/high

> + */
> +enum mhi_er_priority {
> +	MHI_ER_PRIORITY_DEFAULT,
> +	MHI_ER_PRIORITY_HI,
> +};
> +
> +/**
>   * enum mhi_db_brst_mode - Doorbell mode
>   * @MHI_DB_BRST_DISABLE: Burst mode disable
>   * @MHI_DB_BRST_ENABLE: Burst mode enable
> @@ -250,7 +260,7 @@ struct mhi_channel_config {
>   * @irq_moderation_ms: Delay irq for additional events to be aggregated
>   * @irq: IRQ associated with this ring
>   * @channel: Dedicated channel number. U32_MAX indicates a non-dedicated ring
> - * @priority: Priority of this ring. Use 1 for now
> + * @priority: Processing priority of this ring.
>   * @mode: Doorbell mode
>   * @data_type: Type of data this ring will process
>   * @hardware_event: This ring is associated with hardware channels
> @@ -262,7 +272,7 @@ struct mhi_event_config {
>  	u32 irq_moderation_ms;
>  	u32 irq;
>  	u32 channel;
> -	u32 priority;
> +	enum mhi_er_priority priority;
>  	enum mhi_db_brst_mode mode;
>  	enum mhi_er_data_type data_type;
>  	bool hardware_event;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
