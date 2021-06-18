Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E52943AC47D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 09:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhFRHFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 03:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhFRHFh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 03:05:37 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1EB8C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 00:03:27 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id t8so2301790pfe.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YHUNoxdGHn4gGZipI5lJSpd5Y8QcYMlV/w2gq+m6IgQ=;
        b=Dc+Q3L8+z1VbGpvqKsIkQsw0gG0Clvgjh4/fjJa/le3hjr3xQCpO7/2zo6zXqGzWO9
         raza3LkR+w4vMv/zoaA8AiAshCisDRAktr7NuERGfRmGcUXT/LUoo48rNqIQ5SUUjQ27
         9lsi07RjmxpQwcVdkglyJjAGcZMgrbi7tc66BVZLBD6XM9m90jMvFliYQhqQjDfa4nhM
         TEm3kGPEzRvDqcaK6+U88pNvdZzPWsIyvOO3IGtEBKevu7kc8W6Me0d8+tmD4pYhW0ry
         g3VaZNKbqWse8xNPMAzMUZ3tW0mzN+NIdK2dPj6Ia4dPxFWOlILMFKCnWPZkL6QId+uj
         x2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YHUNoxdGHn4gGZipI5lJSpd5Y8QcYMlV/w2gq+m6IgQ=;
        b=BoWrnJ8HtcGY651+y+6yqjqeaWSNGqxpMPuteUcyouoAW6UAyE7Gh704FcNxfjWxpS
         weI2Pv0+Ss/qgkT3N5pEfJvAGxt/bglLiRnL4oNv036beVK+UEkn5kBCivU1YTBFIoX6
         +MYXRnV+4crutqsXTCcZcqkzVCilRJELe25u1qeEjbycoeSh6YR1/l2lbNRIIz/8VM8d
         dIp6R8b1zVCE5wfttym2koW2GtNQCeLgVHLeNt06W+RoagfRaOu0eSUeSzkhoqOMTsi6
         Tu05ocCbzzvObTPKXse6reoHYpzx9byq/ynOK08qzGJ78PH+czgbcVuUYnC6FnL7bM1S
         6VNg==
X-Gm-Message-State: AOAM531da9NcfLAuRTmMaSgb/r6oXVxekOq/ZTgx0ZR7CEjNle0Yfx6J
        0j/1fbi21PZnDFLUwbH4Drhp
X-Google-Smtp-Source: ABdhPJwEF9c9WuD4IG74uLxbVxs0Q+NuvVKOwn3iSWRzUCL/gOb8CkjtG4cn2G69glGyAAHIWtviTQ==
X-Received: by 2002:a63:4241:: with SMTP id p62mr8949611pga.264.1623999807429;
        Fri, 18 Jun 2021 00:03:27 -0700 (PDT)
Received: from workstation ([120.138.13.11])
        by smtp.gmail.com with ESMTPSA id g6sm7358552pfq.110.2021.06.18.00.03.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Jun 2021 00:03:26 -0700 (PDT)
Date:   Fri, 18 Jun 2021 12:33:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 1/4] bus: mhi: core: Add support for processing
 priority of event ring
Message-ID: <20210618070322.GO3682@workstation>
References: <1623965435-30224-1-git-send-email-bbhatt@codeaurora.org>
 <1623965435-30224-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623965435-30224-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 17, 2021 at 02:30:32PM -0700, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Event ring priorities are currently set to 1 and are unused.
> Default processing priority for event rings is set to regular
> tasklet. Controllers can choose to use high priority tasklet
> scheduling for certain event rings critical for processing such
> as ones transporting control information if they wish to avoid
> with system scheduling delays for those packets. In order to
> support these use cases, allow controllers to set event ring
> priority to high. This patch only adds support and does not
> enable usage of these priorities.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 19 ++++++++++++++++---
>  include/linux/mhi.h             | 14 ++++++++++++--
>  3 files changed, 29 insertions(+), 6 deletions(-)
> 
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

Instead of using enum for priorities, can we just make use of the
existing "priority" field? Since the existing controllers set it to "1",
can we use "0" as the high priority?

This way we don't need to change the controller drivers.

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

This could be,

	/* Use high priority tasklet for high priority event ring */
	if (!mhi_event->priority)
		tasklet_hi_schedule(&mhi_event->task);
	else
		tasklet_schedule(&mhi_event->task);

Thanks,
Mani

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
> index 86cea52..25ee312 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -198,6 +198,16 @@ enum mhi_er_data_type {
>  };
>  
>  /**
> + * enum mhi_er_priority - Event ring processing priority
> + * @MHI_ER_PRIORITY_HI: processed by hi-priority tasklet
> + * @MHI_ER_PRIORITY_DEFAULT: processed by regular tasklet
> + */
> +enum mhi_er_priority {
> +	MHI_ER_PRIORITY_HI,
> +	MHI_ER_PRIORITY_DEFAULT,
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
