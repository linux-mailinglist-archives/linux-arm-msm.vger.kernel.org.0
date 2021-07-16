Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B3583CB6F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 13:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238468AbhGPLw2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 07:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238234AbhGPLw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 07:52:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FEC0C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:49:30 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id me13-20020a17090b17cdb0290173bac8b9c9so8727145pjb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VsSGhRGmgR0aRURUSRAT2I7f85rIEbHU6ArxttRtGAw=;
        b=bqXcj1g0kp9sOr9ItNJL4RDqjEYL+LoN+8oEU+f5MjR1w6PLwsKRpQyjVd2T26ObHq
         2fqBmGLOhgXxrRci8/yi4LezDDU6GkbokcMxsFD62P20vZ6yZ2Lvvwc0zpH8qp0bjx4f
         G14NQZWBoxiwgIilMpQWyZtg3kGXbqz91dSUbdVhSlL0JuSg90bLKcc939eziXNj4lp3
         PIPlNdzPsHI9600zsmYlrwvQJJT8ZTNtzcmqrPT6hIuiNezRhJ1fmQguiw91mNcj6qlf
         6jIJc7BjJi+Jky/pVkhL8HU6LbNDN5npaPeCACTTQ2HjCw9xmcYZecENhc0lMdFksNfO
         6lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VsSGhRGmgR0aRURUSRAT2I7f85rIEbHU6ArxttRtGAw=;
        b=cHUhAmisVRKriN45S1QaUPbBQigyf1hy8HWtiVtSmMwCqcqD574qhtQCuBNlkZn+PZ
         QrIP8YcG3ctV5Nl+SEmtc3TWdVYpyGXGOobnY2YBqA1DnAHv42ZjwXBZFJF3hl6Vb6my
         8tnddjO82YjDH2/5GMXGjE4VQTJHoIwaavpXsgMswjEsSD4LPCJxIbWxjeTMjZZkJfm1
         R+ARP+fMjglIdqc/Jekkx3YnO78WSPNJWRnUQQx+snxamB7fzDVKPfItmuB8gL4Vd6aD
         FOH/C7ZbWCbVT0IUDbIINGpDYou8DfkoHroo4e5ZQ1Tw9S3CnLYT2Olgb99eAhYiEakb
         jSnQ==
X-Gm-Message-State: AOAM532Lx3ElSgrzXLVh18cA3BS+A2GltQ+LSwoF3aBquoMiQmOF6MOo
        ibg9Rooiurhcj61Mfzc2fCCQ
X-Google-Smtp-Source: ABdhPJwgaMD1Wb7bOy68aKqGWrdcK6UwUyrmVIPHAJU2wFlizDGSvAdkOTZS6hLxFMuoBnhdwzyrew==
X-Received: by 2002:a17:902:d916:b029:11e:3249:4a17 with SMTP id c22-20020a170902d916b029011e32494a17mr7491498plz.0.1626436169841;
        Fri, 16 Jul 2021 04:49:29 -0700 (PDT)
Received: from workstation ([120.138.12.214])
        by smtp.gmail.com with ESMTPSA id b19sm8300332pjh.29.2021.07.16.04.49.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 04:49:29 -0700 (PDT)
Date:   Fri, 16 Jul 2021 17:19:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] bus: mhi: core: Add support for processing priority
 of event ring
Message-ID: <20210716114926.GH3323@workstation>
References: <1624641728-3886-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624641728-3886-1-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 10:22:08AM -0700, Bhaumik Bhatt wrote:
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Just curious, what are the event rings you are going to make as high
priority? If you are going to do that for existing controllers, please
submit a patch now itself.

Thanks,
Mani

> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
> v5:
> -Add controller changes and enable usage of event ring configuration priorities
> -Fix nitpick, use high instead of hi in kdoc
> 
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
> 
> 
>  drivers/bus/mhi/core/init.c           |  3 +-
>  drivers/bus/mhi/core/internal.h       |  2 +-
>  drivers/bus/mhi/core/main.c           | 19 ++++++++--
>  drivers/bus/mhi/pci_generic.c         | 66 +++++++++++++++++------------------
>  drivers/net/wireless/ath/ath11k/mhi.c |  4 +--
>  include/linux/mhi.h                   | 14 ++++++--
>  6 files changed, 65 insertions(+), 43 deletions(-)
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
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 31360a2..5886547 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -74,17 +74,17 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
> -	{					\
> -		.num_elements = el_count,	\
> -		.irq_moderation_ms = 0,		\
> -		.irq = (ev_ring) + 1,		\
> -		.priority = 1,			\
> -		.mode = MHI_DB_BRST_DISABLE,	\
> -		.data_type = MHI_ER_CTRL,	\
> -		.hardware_event = false,	\
> -		.client_managed = false,	\
> -		.offload_channel = false,	\
> +#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count)	\
> +	{						\
> +		.num_elements = el_count,		\
> +		.irq_moderation_ms = 0,			\
> +		.irq = (ev_ring) + 1,			\
> +		.priority = MHI_ER_PRIORITY_DEFAULT,	\
> +		.mode = MHI_DB_BRST_DISABLE,		\
> +		.data_type = MHI_ER_CTRL,		\
> +		.hardware_event = false,		\
> +		.client_managed = false,		\
> +		.offload_channel = false,		\
>  	}
>  
>  #define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -177,31 +177,31 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
> -	{					\
> -		.num_elements = el_count,	\
> -		.irq_moderation_ms = 5,		\
> -		.irq = (ev_ring) + 1,		\
> -		.priority = 1,			\
> -		.mode = MHI_DB_BRST_DISABLE,	\
> -		.data_type = MHI_ER_DATA,	\
> -		.hardware_event = false,	\
> -		.client_managed = false,	\
> -		.offload_channel = false,	\
> +#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count)	\
> +	{						\
> +		.num_elements = el_count,		\
> +		.irq_moderation_ms = 5,			\
> +		.irq = (ev_ring) + 1,			\
> +		.priority = MHI_ER_PRIORITY_DEFAULT,	\
> +		.mode = MHI_DB_BRST_DISABLE,		\
> +		.data_type = MHI_ER_DATA,		\
> +		.hardware_event = false,		\
> +		.client_managed = false,		\
> +		.offload_channel = false,		\
>  	}
>  
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
> -	{					\
> -		.num_elements = el_count,	\
> -		.irq_moderation_ms = 1,		\
> -		.irq = (ev_ring) + 1,		\
> -		.priority = 1,			\
> -		.mode = MHI_DB_BRST_DISABLE,	\
> -		.data_type = MHI_ER_DATA,	\
> -		.hardware_event = true,		\
> -		.client_managed = false,	\
> -		.offload_channel = false,	\
> -		.channel = ch_num,		\
> +	{						\
> +		.num_elements = el_count,		\
> +		.irq_moderation_ms = 1,			\
> +		.irq = (ev_ring) + 1,			\
> +		.priority = MHI_ER_PRIORITY_DEFAULT,	\
> +		.mode = MHI_DB_BRST_DISABLE,		\
> +		.data_type = MHI_ER_DATA,		\
> +		.hardware_event = true,			\
> +		.client_managed = false,		\
> +		.offload_channel = false,		\
> +		.channel = ch_num,			\
>  	}
>  
>  static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 27b394d..b7864fc 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -86,7 +86,7 @@ static struct mhi_event_config ath11k_mhi_events_qca6390[] = {
>  		.irq_moderation_ms = 1,
>  		.irq = 2,
>  		.mode = MHI_DB_BRST_DISABLE,
> -		.priority = 1,
> +		.priority = MHI_ER_PRIORITY_DEFAULT,
>  		.hardware_event = false,
>  		.client_managed = false,
>  		.offload_channel = false,
> @@ -179,7 +179,7 @@ static struct mhi_event_config ath11k_mhi_events_qcn9074[] = {
>  		.irq_moderation_ms = 1,
>  		.irq = 2,
>  		.mode = MHI_DB_BRST_DISABLE,
> -		.priority = 1,
> +		.priority = MHI_ER_PRIORITY_DEFAULT,
>  		.hardware_event = false,
>  		.client_managed = false,
>  		.offload_channel = false,
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 86cea52..3e92e85 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -198,6 +198,16 @@ enum mhi_er_data_type {
>  };
>  
>  /**
> + * enum mhi_er_priority - Event ring processing priority
> + * @MHI_ER_PRIORITY_DEFAULT: processed by regular tasklet
> + * @MHI_ER_PRIORITY_HI: processed by high priority tasklet
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
