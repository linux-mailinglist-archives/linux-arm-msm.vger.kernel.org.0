Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D39042CE01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhJMWbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhJMWbi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:31:38 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90FE3C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:29:34 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id x1so1389978ilv.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OY4wh6K2kU7kqMpK4BZCniIPbYmqqNX4rlahd8l7v4E=;
        b=elq+Q7s4KSDpzisIJv+0MSqWSdqxPXNSDHsnElL0iwkoHaPNlEQPny2CHlbiapRFX1
         gNEtgQ4DDIyNZb3c+0lV1Yxb4OY/3mJZow1HFMuLkkMH4Lno5ic00Fpn19OYvLBXhNkM
         jEIGBhn+g6SivYmDqY/X6RT1REcUn7OtrLqdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OY4wh6K2kU7kqMpK4BZCniIPbYmqqNX4rlahd8l7v4E=;
        b=lWOO6I8QnbiL/NekYxgRP6NsZxWg/o/wN5cyj+4ZrlLPS0U6MfNUsBwDLK9xpoLIRa
         jhJljUdHR97gtzH7ikoXrd/FSMb0NXbaWHehChfNsHiVlemBN8BCXcMItkiopBkQNtSK
         tjyHyGA8rtH7MzG32i9ahB5gD3bHToD+AH6wNtgx3yk2f6/qvQRqhNIzJwz0EU2XJMeL
         l9f2dKYW3sutbiZ1PRjsL19O/I2RpuAijmI36gGFRIJ3QZeLcX3YIFSE9Th7mKz6EWvD
         RXoqC5QXuWtYFZRYv4DTWOGnRStcGMNMeO4p+2GpWvYaoV5i4PMF3QalkTt0LJ2rUt5l
         yMpw==
X-Gm-Message-State: AOAM53382/zBdnORrdPBJ4nKymin3g7I7+Zuq/F1AtZb2rwHbdhHxaEP
        lJOfIHiNyiVAIWJEk9WvDwvM+A==
X-Google-Smtp-Source: ABdhPJy2C+y60uiLv08IuP1CSHCd9BY7jeaLK79w1fTxOycK+1lt+th0+Hv+x2PRiNmACpnuxUCm8Q==
X-Received: by 2002:a92:d2c5:: with SMTP id w5mr1421788ilg.38.1634164173894;
        Wed, 13 Oct 2021 15:29:33 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id 188sm371625ioa.22.2021.10.13.15.29.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:29:33 -0700 (PDT)
Subject: Re: [RFC PATCH 04/17] net: ipa: Establish ipa_dma interface
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-5-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <054bb6cf-bc20-97fc-3a29-e67836b602ce@ieee.org>
Date:   Wed, 13 Oct 2021 17:29:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-5-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:07 PM, Sireesh Kodali wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Establish callback-based interface to abstract GSI and BAM DMA differences.
> Interface is based on prototypes from ipa_dma.h (old gsi.h). Callbacks
> are stored in struct ipa_dma (old struct gsi) and assigned in gsi_init.

This is interesting and seems to have been fairly easy to abstract
this way.  The patch is actually pretty straightforward, much more
so than I would have expected.  I think I'll have more to say about
how to separate GSI from BAM in the future, but not today.

					-Alex

> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   drivers/net/ipa/gsi.c          |  30 ++++++--
>   drivers/net/ipa/ipa_dma.h      | 133 ++++++++++++++++++++++-----------
>   drivers/net/ipa/ipa_endpoint.c |  28 +++----
>   drivers/net/ipa/ipa_main.c     |  18 ++---
>   drivers/net/ipa/ipa_power.c    |   4 +-
>   drivers/net/ipa/ipa_trans.c    |   2 +-
>   6 files changed, 138 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
> index 74ae0d07f859..39d9ca620a9f 100644
> --- a/drivers/net/ipa/gsi.c
> +++ b/drivers/net/ipa/gsi.c
> @@ -99,6 +99,10 @@
>   
>   #define GSI_ISR_MAX_ITER		50	/* Detect interrupt storms */
>   
> +static u32 gsi_channel_tre_max(struct ipa_dma *gsi, u32 channel_id);
> +static u32 gsi_channel_trans_tre_max(struct ipa_dma *gsi, u32 channel_id);
> +static void gsi_exit(struct ipa_dma *gsi);
> +
>   /* An entry in an event ring */
>   struct gsi_event {
>   	__le64 xfer_ptr;
> @@ -869,7 +873,7 @@ static int __gsi_channel_start(struct ipa_channel *channel, bool resume)
>   }
>   
>   /* Start an allocated GSI channel */
> -int gsi_channel_start(struct ipa_dma *gsi, u32 channel_id)
> +static int gsi_channel_start(struct ipa_dma *gsi, u32 channel_id)
>   {
>   	struct ipa_channel *channel = &gsi->channel[channel_id];
>   	int ret;
> @@ -924,7 +928,7 @@ static int __gsi_channel_stop(struct ipa_channel *channel, bool suspend)
>   }
>   
>   /* Stop a started channel */
> -int gsi_channel_stop(struct ipa_dma *gsi, u32 channel_id)
> +static int gsi_channel_stop(struct ipa_dma *gsi, u32 channel_id)
>   {
>   	struct ipa_channel *channel = &gsi->channel[channel_id];
>   	int ret;
> @@ -941,7 +945,7 @@ int gsi_channel_stop(struct ipa_dma *gsi, u32 channel_id)
>   }
>   
>   /* Reset and reconfigure a channel, (possibly) enabling the doorbell engine */
> -void gsi_channel_reset(struct ipa_dma *gsi, u32 channel_id, bool doorbell)
> +static void gsi_channel_reset(struct ipa_dma *gsi, u32 channel_id, bool doorbell)
>   {
>   	struct ipa_channel *channel = &gsi->channel[channel_id];
>   
> @@ -1931,7 +1935,7 @@ int gsi_setup(struct ipa_dma *gsi)
>   }
>   
>   /* Inverse of gsi_setup() */
> -void gsi_teardown(struct ipa_dma *gsi)
> +static void gsi_teardown(struct ipa_dma *gsi)
>   {
>   	gsi_channel_teardown(gsi);
>   	gsi_irq_teardown(gsi);
> @@ -2194,6 +2198,18 @@ int gsi_init(struct ipa_dma *gsi, struct platform_device *pdev,
>   
>   	gsi->dev = dev;
>   	gsi->version = version;
> +	gsi->setup = gsi_setup;
> +	gsi->teardown = gsi_teardown;
> +	gsi->exit = gsi_exit;
> +	gsi->suspend = gsi_suspend;
> +	gsi->resume = gsi_resume;
> +	gsi->channel_tre_max = gsi_channel_tre_max;
> +	gsi->channel_trans_tre_max = gsi_channel_trans_tre_max;
> +	gsi->channel_start = gsi_channel_start;
> +	gsi->channel_stop = gsi_channel_stop;
> +	gsi->channel_reset = gsi_channel_reset;
> +	gsi->channel_suspend = gsi_channel_suspend;
> +	gsi->channel_resume = gsi_channel_resume;
>   
>   	/* GSI uses NAPI on all channels.  Create a dummy network device
>   	 * for the channel NAPI contexts to be associated with.
> @@ -2250,7 +2266,7 @@ int gsi_init(struct ipa_dma *gsi, struct platform_device *pdev,
>   }
>   
>   /* Inverse of gsi_init() */
> -void gsi_exit(struct ipa_dma *gsi)
> +static void gsi_exit(struct ipa_dma *gsi)
>   {
>   	mutex_destroy(&gsi->mutex);
>   	gsi_channel_exit(gsi);
> @@ -2277,7 +2293,7 @@ void gsi_exit(struct ipa_dma *gsi)
>    * substantially reduce pool memory requirements.  The number we
>    * reduce it by matches the number added in ipa_trans_pool_init().
>    */
> -u32 gsi_channel_tre_max(struct ipa_dma *gsi, u32 channel_id)
> +static u32 gsi_channel_tre_max(struct ipa_dma *gsi, u32 channel_id)
>   {
>   	struct ipa_channel *channel = &gsi->channel[channel_id];
>   
> @@ -2286,7 +2302,7 @@ u32 gsi_channel_tre_max(struct ipa_dma *gsi, u32 channel_id)
>   }
>   
>   /* Returns the maximum number of TREs in a single transaction for a channel */
> -u32 gsi_channel_trans_tre_max(struct ipa_dma *gsi, u32 channel_id)
> +static u32 gsi_channel_trans_tre_max(struct ipa_dma *gsi, u32 channel_id)
>   {
>   	struct ipa_channel *channel = &gsi->channel[channel_id];
>   
> diff --git a/drivers/net/ipa/ipa_dma.h b/drivers/net/ipa/ipa_dma.h
> index d053929ca3e3..1a23e6ac5785 100644
> --- a/drivers/net/ipa/ipa_dma.h
> +++ b/drivers/net/ipa/ipa_dma.h
> @@ -163,64 +163,96 @@ struct ipa_dma {
>   	struct completion completion;	/* for global EE commands */
>   	int result;			/* Negative errno (generic commands) */
>   	struct mutex mutex;		/* protects commands, programming */
> +
> +	int (*setup)(struct ipa_dma *dma_subsys);
> +	void (*teardown)(struct ipa_dma *dma_subsys);
> +	void (*exit)(struct ipa_dma *dma_subsys);
> +	void (*suspend)(struct ipa_dma *dma_subsys);
> +	void (*resume)(struct ipa_dma *dma_subsys);
> +	u32 (*channel_tre_max)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	u32 (*channel_trans_tre_max)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	int (*channel_start)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	int (*channel_stop)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	void (*channel_reset)(struct ipa_dma *dma_subsys, u32 channel_id, bool doorbell);
> +	int (*channel_suspend)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	int (*channel_resume)(struct ipa_dma *dma_subsys, u32 channel_id);
> +	void (*trans_commit)(struct ipa_trans *trans, bool ring_db);
>   };
>   
>   /**
> - * gsi_setup() - Set up the GSI subsystem
> - * @gsi:	Address of GSI structure embedded in an IPA structure
> + * ipa_dma_setup() - Set up the DMA subsystem
> + * @dma_subsys:	Address of ipa_dma structure embedded in an IPA structure
>    *
>    * Return:	0 if successful, or a negative error code
>    *
> - * Performs initialization that must wait until the GSI hardware is
> + * Performs initialization that must wait until the GSI/BAM hardware is
>    * ready (including firmware loaded).
>    */
> -int gsi_setup(struct ipa_dma *dma_subsys);
> +static inline int ipa_dma_setup(struct ipa_dma *dma_subsys)
> +{
> +	return dma_subsys->setup(dma_subsys);
> +}
>   
>   /**
> - * gsi_teardown() - Tear down GSI subsystem
> - * @gsi:	GSI address previously passed to a successful gsi_setup() call
> + * ipa_dma_teardown() - Tear down DMA subsystem
> + * @dma_subsys:	ipa_dma address previously passed to a successful ipa_dma_setup() call
>    */
> -void gsi_teardown(struct ipa_dma *dma_subsys);
> +static inline void ipa_dma_teardown(struct ipa_dma *dma_subsys)
> +{
> +	dma_subsys->teardown(dma_subsys);
> +}
>   
>   /**
> - * gsi_channel_tre_max() - Channel maximum number of in-flight TREs
> - * @gsi:	GSI pointer
> + * ipa_channel_tre_max() - Channel maximum number of in-flight TREs
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel whose limit is to be returned
>    *
>    * Return:	 The maximum number of TREs oustanding on the channel
>    */
> -u32 gsi_channel_tre_max(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline u32 ipa_channel_tre_max(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_tre_max(dma_subsys, channel_id);
> +}
>   
>   /**
> - * gsi_channel_trans_tre_max() - Maximum TREs in a single transaction
> - * @gsi:	GSI pointer
> + * ipa_channel_trans_tre_max() - Maximum TREs in a single transaction
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel whose limit is to be returned
>    *
>    * Return:	 The maximum TRE count per transaction on the channel
>    */
> -u32 gsi_channel_trans_tre_max(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline u32 ipa_channel_trans_tre_max(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_trans_tre_max(dma_subsys, channel_id);
> +}
>   
>   /**
> - * gsi_channel_start() - Start an allocated GSI channel
> - * @gsi:	GSI pointer
> + * ipa_channel_start() - Start an allocated DMA channel
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel to start
>    *
>    * Return:	0 if successful, or a negative error code
>    */
> -int gsi_channel_start(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline int ipa_channel_start(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_start(dma_subsys, channel_id);
> +}
>   
>   /**
> - * gsi_channel_stop() - Stop a started GSI channel
> - * @gsi:	GSI pointer returned by gsi_setup()
> + * ipa_channel_stop() - Stop a started DMA channel
> + * @dma_subsys:	pointer to ipa_dma structure returned by ipa_dma_setup()
>    * @channel_id:	Channel to stop
>    *
>    * Return:	0 if successful, or a negative error code
>    */
> -int gsi_channel_stop(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline int ipa_channel_stop(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_stop(dma_subsys, channel_id);
> +}
>   
>   /**
> - * gsi_channel_reset() - Reset an allocated GSI channel
> - * @gsi:	GSI pointer
> + * ipa_channel_reset() - Reset an allocated DMA channel
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel to be reset
>    * @doorbell:	Whether to (possibly) enable the doorbell engine
>    *
> @@ -230,41 +262,49 @@ int gsi_channel_stop(struct ipa_dma *dma_subsys, u32 channel_id);
>    * GSI hardware relinquishes ownership of all pending receive buffer
>    * transactions and they will complete with their cancelled flag set.
>    */
> -void gsi_channel_reset(struct ipa_dma *dma_subsys, u32 channel_id, bool doorbell);
> +static inline void ipa_channel_reset(struct ipa_dma *dma_subsys, u32 channel_id, bool doorbell)
> +{
> +	 dma_subsys->channel_reset(dma_subsys, channel_id, doorbell);
> +}
>   
> -/**
> - * gsi_suspend() - Prepare the GSI subsystem for suspend
> - * @gsi:	GSI pointer
> - */
> -void gsi_suspend(struct ipa_dma *dma_subsys);
>   
>   /**
> - * gsi_resume() - Resume the GSI subsystem following suspend
> - * @gsi:	GSI pointer
> - */
> -void gsi_resume(struct ipa_dma *dma_subsys);
> -
> -/**
> - * gsi_channel_suspend() - Suspend a GSI channel
> - * @gsi:	GSI pointer
> + * ipa_channel_suspend() - Suspend a DMA channel
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel to suspend
>    *
>    * For IPA v4.0+, suspend is implemented by stopping the channel.
>    */
> -int gsi_channel_suspend(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline int ipa_channel_suspend(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_suspend(dma_subsys, channel_id);
> +}
>   
>   /**
> - * gsi_channel_resume() - Resume a suspended GSI channel
> - * @gsi:	GSI pointer
> + * ipa_channel_resume() - Resume a suspended DMA channel
> + * @dma_subsys:	pointer to ipa_dma structure
>    * @channel_id:	Channel to resume
>    *
>    * For IPA v4.0+, the stopped channel is started again.
>    */
> -int gsi_channel_resume(struct ipa_dma *dma_subsys, u32 channel_id);
> +static inline int ipa_channel_resume(struct ipa_dma *dma_subsys, u32 channel_id)
> +{
> +	return dma_subsys->channel_resume(dma_subsys, channel_id);
> +}
> +
> +static inline void ipa_dma_suspend(struct ipa_dma *dma_subsys)
> +{
> +	return dma_subsys->suspend(dma_subsys);
> +}
> +
> +static inline void ipa_dma_resume(struct ipa_dma *dma_subsys)
> +{
> +	return dma_subsys->resume(dma_subsys);
> +}
>   
>   /**
> - * gsi_init() - Initialize the GSI subsystem
> - * @gsi:	Address of GSI structure embedded in an IPA structure
> + * ipa_dma_init() - Initialize the GSI subsystem
> + * @dma_subsys:	Address of ipa_dma structure embedded in an IPA structure
>    * @pdev:	IPA platform device
>    * @version:	IPA hardware version (implies GSI version)
>    * @count:	Number of entries in the configuration data array
> @@ -275,14 +315,19 @@ int gsi_channel_resume(struct ipa_dma *dma_subsys, u32 channel_id);
>    * Early stage initialization of the GSI subsystem, performing tasks
>    * that can be done before the GSI hardware is ready to use.
>    */
> +
>   int gsi_init(struct ipa_dma *dma_subsys, struct platform_device *pdev,
>   	     enum ipa_version version, u32 count,
>   	     const struct ipa_gsi_endpoint_data *data);
>   
>   /**
> - * gsi_exit() - Exit the GSI subsystem
> - * @gsi:	GSI address previously passed to a successful gsi_init() call
> + * ipa_dma_exit() - Exit the DMA subsystem
> + * @dma_subsys:	ipa_dma address previously passed to a successful gsi_init() call
>    */
> -void gsi_exit(struct ipa_dma *dma_subsys);
> +static inline void ipa_dma_exit(struct ipa_dma *dma_subsys)
> +{
> +	if (dma_subsys)
> +		dma_subsys->exit(dma_subsys);
> +}
>   
>   #endif /* _GSI_H_ */
> diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
> index 90d6880e8a25..dbef549c4537 100644
> --- a/drivers/net/ipa/ipa_endpoint.c
> +++ b/drivers/net/ipa/ipa_endpoint.c
> @@ -1091,7 +1091,7 @@ static void ipa_endpoint_replenish(struct ipa_endpoint *endpoint, bool add_one)
>   	 * try replenishing again if our backlog is *all* available TREs.
>   	 */
>   	gsi = &endpoint->ipa->dma_subsys;
> -	if (backlog == gsi_channel_tre_max(gsi, endpoint->channel_id))
> +	if (backlog == ipa_channel_tre_max(gsi, endpoint->channel_id))
>   		schedule_delayed_work(&endpoint->replenish_work,
>   				      msecs_to_jiffies(1));
>   }
> @@ -1107,7 +1107,7 @@ static void ipa_endpoint_replenish_enable(struct ipa_endpoint *endpoint)
>   		atomic_add(saved, &endpoint->replenish_backlog);
>   
>   	/* Start replenishing if hardware currently has no buffers */
> -	max_backlog = gsi_channel_tre_max(gsi, endpoint->channel_id);
> +	max_backlog = ipa_channel_tre_max(gsi, endpoint->channel_id);
>   	if (atomic_read(&endpoint->replenish_backlog) == max_backlog)
>   		ipa_endpoint_replenish(endpoint, false);
>   }
> @@ -1432,13 +1432,13 @@ static int ipa_endpoint_reset_rx_aggr(struct ipa_endpoint *endpoint)
>   	 * active.  We'll re-enable the doorbell (if appropriate) when
>   	 * we reset again below.
>   	 */
> -	gsi_channel_reset(gsi, endpoint->channel_id, false);
> +	ipa_channel_reset(gsi, endpoint->channel_id, false);
>   
>   	/* Make sure the channel isn't suspended */
>   	suspended = ipa_endpoint_program_suspend(endpoint, false);
>   
>   	/* Start channel and do a 1 byte read */
> -	ret = gsi_channel_start(gsi, endpoint->channel_id);
> +	ret = ipa_channel_start(gsi, endpoint->channel_id);
>   	if (ret)
>   		goto out_suspend_again;
>   
> @@ -1461,7 +1461,7 @@ static int ipa_endpoint_reset_rx_aggr(struct ipa_endpoint *endpoint)
>   
>   	gsi_trans_read_byte_done(gsi, endpoint->channel_id);
>   
> -	ret = gsi_channel_stop(gsi, endpoint->channel_id);
> +	ret = ipa_channel_stop(gsi, endpoint->channel_id);
>   	if (ret)
>   		goto out_suspend_again;
>   
> @@ -1470,14 +1470,14 @@ static int ipa_endpoint_reset_rx_aggr(struct ipa_endpoint *endpoint)
>   	 * complete the channel reset sequence.  Finish by suspending the
>   	 * channel again (if necessary).
>   	 */
> -	gsi_channel_reset(gsi, endpoint->channel_id, true);
> +	ipa_channel_reset(gsi, endpoint->channel_id, true);
>   
>   	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);
>   
>   	goto out_suspend_again;
>   
>   err_endpoint_stop:
> -	(void)gsi_channel_stop(gsi, endpoint->channel_id);
> +	(void)ipa_channel_stop(gsi, endpoint->channel_id);
>   out_suspend_again:
>   	if (suspended)
>   		(void)ipa_endpoint_program_suspend(endpoint, true);
> @@ -1504,7 +1504,7 @@ static void ipa_endpoint_reset(struct ipa_endpoint *endpoint)
>   	if (special && ipa_endpoint_aggr_active(endpoint))
>   		ret = ipa_endpoint_reset_rx_aggr(endpoint);
>   	else
> -		gsi_channel_reset(&ipa->dma_subsys, channel_id, true);
> +		ipa_channel_reset(&ipa->dma_subsys, channel_id, true);
>   
>   	if (ret)
>   		dev_err(&ipa->pdev->dev,
> @@ -1537,7 +1537,7 @@ int ipa_endpoint_enable_one(struct ipa_endpoint *endpoint)
>   	struct ipa_dma *gsi = &ipa->dma_subsys;
>   	int ret;
>   
> -	ret = gsi_channel_start(gsi, endpoint->channel_id);
> +	ret = ipa_channel_start(gsi, endpoint->channel_id);
>   	if (ret) {
>   		dev_err(&ipa->pdev->dev,
>   			"error %d starting %cX channel %u for endpoint %u\n",
> @@ -1576,7 +1576,7 @@ void ipa_endpoint_disable_one(struct ipa_endpoint *endpoint)
>   	}
>   
>   	/* Note that if stop fails, the channel's state is not well-defined */
> -	ret = gsi_channel_stop(gsi, endpoint->channel_id);
> +	ret = ipa_channel_stop(gsi, endpoint->channel_id);
>   	if (ret)
>   		dev_err(&ipa->pdev->dev,
>   			"error %d attempting to stop endpoint %u\n", ret,
> @@ -1598,7 +1598,7 @@ void ipa_endpoint_suspend_one(struct ipa_endpoint *endpoint)
>   		(void)ipa_endpoint_program_suspend(endpoint, true);
>   	}
>   
> -	ret = gsi_channel_suspend(gsi, endpoint->channel_id);
> +	ret = ipa_channel_suspend(gsi, endpoint->channel_id);
>   	if (ret)
>   		dev_err(dev, "error %d suspending channel %u\n", ret,
>   			endpoint->channel_id);
> @@ -1617,7 +1617,7 @@ void ipa_endpoint_resume_one(struct ipa_endpoint *endpoint)
>   	if (!endpoint->toward_ipa)
>   		(void)ipa_endpoint_program_suspend(endpoint, false);
>   
> -	ret = gsi_channel_resume(gsi, endpoint->channel_id);
> +	ret = ipa_channel_resume(gsi, endpoint->channel_id);
>   	if (ret)
>   		dev_err(dev, "error %d resuming channel %u\n", ret,
>   			endpoint->channel_id);
> @@ -1660,14 +1660,14 @@ static void ipa_endpoint_setup_one(struct ipa_endpoint *endpoint)
>   	if (endpoint->ee_id != GSI_EE_AP)
>   		return;
>   
> -	endpoint->trans_tre_max = gsi_channel_trans_tre_max(gsi, channel_id);
> +	endpoint->trans_tre_max = ipa_channel_trans_tre_max(gsi, channel_id);
>   	if (!endpoint->toward_ipa) {
>   		/* RX transactions require a single TRE, so the maximum
>   		 * backlog is the same as the maximum outstanding TREs.
>   		 */
>   		endpoint->replenish_enabled = false;
>   		atomic_set(&endpoint->replenish_saved,
> -			   gsi_channel_tre_max(gsi, endpoint->channel_id));
> +			   ipa_channel_tre_max(gsi, endpoint->channel_id));
>   		atomic_set(&endpoint->replenish_backlog, 0);
>   		INIT_DELAYED_WORK(&endpoint->replenish_work,
>   				  ipa_endpoint_replenish_work);
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 026f5555fa7d..6ab691ff1faf 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -98,13 +98,13 @@ int ipa_setup(struct ipa *ipa)
>   	struct device *dev = &ipa->pdev->dev;
>   	int ret;
>   
> -	ret = gsi_setup(&ipa->dma_subsys);
> +	ret = ipa_dma_setup(&ipa->dma_subsys);
>   	if (ret)
>   		return ret;
>   
>   	ret = ipa_power_setup(ipa);
>   	if (ret)
> -		goto err_gsi_teardown;
> +		goto err_dma_teardown;
>   
>   	ipa_endpoint_setup(ipa);
>   
> @@ -153,8 +153,8 @@ int ipa_setup(struct ipa *ipa)
>   err_endpoint_teardown:
>   	ipa_endpoint_teardown(ipa);
>   	ipa_power_teardown(ipa);
> -err_gsi_teardown:
> -	gsi_teardown(&ipa->dma_subsys);
> +err_dma_teardown:
> +	ipa_dma_teardown(&ipa->dma_subsys);
>   
>   	return ret;
>   }
> @@ -179,7 +179,7 @@ static void ipa_teardown(struct ipa *ipa)
>   	ipa_endpoint_disable_one(command_endpoint);
>   	ipa_endpoint_teardown(ipa);
>   	ipa_power_teardown(ipa);
> -	gsi_teardown(&ipa->dma_subsys);
> +	ipa_dma_teardown(&ipa->dma_subsys);
>   }
>   
>   /* Configure bus access behavior for IPA components */
> @@ -726,7 +726,7 @@ static int ipa_probe(struct platform_device *pdev)
>   					    data->endpoint_data);
>   	if (!ipa->filter_map) {
>   		ret = -EINVAL;
> -		goto err_gsi_exit;
> +		goto err_dma_exit;
>   	}
>   
>   	ret = ipa_table_init(ipa);
> @@ -780,8 +780,8 @@ static int ipa_probe(struct platform_device *pdev)
>   	ipa_table_exit(ipa);
>   err_endpoint_exit:
>   	ipa_endpoint_exit(ipa);
> -err_gsi_exit:
> -	gsi_exit(&ipa->dma_subsys);
> +err_dma_exit:
> +	ipa_dma_exit(&ipa->dma_subsys);
>   err_mem_exit:
>   	ipa_mem_exit(ipa);
>   err_reg_exit:
> @@ -824,7 +824,7 @@ static int ipa_remove(struct platform_device *pdev)
>   	ipa_modem_exit(ipa);
>   	ipa_table_exit(ipa);
>   	ipa_endpoint_exit(ipa);
> -	gsi_exit(&ipa->dma_subsys);
> +	ipa_dma_exit(&ipa->dma_subsys);
>   	ipa_mem_exit(ipa);
>   	ipa_reg_exit(ipa);
>   	kfree(ipa);
> diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
> index b1c6c0fcb654..096cfb8ae9a5 100644
> --- a/drivers/net/ipa/ipa_power.c
> +++ b/drivers/net/ipa/ipa_power.c
> @@ -243,7 +243,7 @@ static int ipa_runtime_suspend(struct device *dev)
>   	if (ipa->setup_complete) {
>   		__clear_bit(IPA_POWER_FLAG_RESUMED, ipa->power->flags);
>   		ipa_endpoint_suspend(ipa);
> -		gsi_suspend(&ipa->gsi);
> +		ipa_dma_suspend(&ipa->dma_subsys);
>   	}
>   
>   	return ipa_power_disable(ipa);
> @@ -260,7 +260,7 @@ static int ipa_runtime_resume(struct device *dev)
>   
>   	/* Endpoints aren't usable until setup is complete */
>   	if (ipa->setup_complete) {
> -		gsi_resume(&ipa->gsi);
> +		ipa_dma_resume(&ipa->dma_subsys);
>   		ipa_endpoint_resume(ipa);
>   	}
>   
> diff --git a/drivers/net/ipa/ipa_trans.c b/drivers/net/ipa/ipa_trans.c
> index b87936b18770..22755f3ce3da 100644
> --- a/drivers/net/ipa/ipa_trans.c
> +++ b/drivers/net/ipa/ipa_trans.c
> @@ -747,7 +747,7 @@ int ipa_channel_trans_init(struct ipa_dma *gsi, u32 channel_id)
>   	 * for transactions (including transaction structures) based on
>   	 * this maximum number.
>   	 */
> -	tre_max = gsi_channel_tre_max(channel->dma_subsys, channel_id);
> +	tre_max = ipa_channel_tre_max(channel->dma_subsys, channel_id);
>   
>   	/* Transactions are allocated one at a time. */
>   	ret = ipa_trans_pool_init(&trans_info->pool, sizeof(struct ipa_trans),
> 

