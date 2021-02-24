Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A61323989
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 10:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbhBXJdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 04:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234612AbhBXJc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 04:32:59 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC9DC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:32:16 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id h4so1053211pgf.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=My8eFxhWc6X9tPKtlR5S+4wYGnIUv/JVpJUKrcGYuBo=;
        b=qQEFFPVB9BnXHgpzOwOzXgb5EIEOPH62D5O8IaALQlJMOoS38u0TxTuvIQyOn90oU7
         KD+W4tYLTIIf4KVhWvcsTiwaHvk0Apd++kmssAKQew3ydFy++w8RmK7wFpsWuXp2BTLj
         uS72+i7efIRqfm1fhX65+naN8WGtzk1m0GoJ47ECXuQSc+7VEf7cnPnCxSV9e9a4psQb
         yNP8Hq2WF5i2LJc7WhPDuzdAeoC98imQaQRpdhNYfK7ys3ly1BOTAbhM9awVwsVnLmy/
         HwamZhpPnr143Ep5thgFz5oIfLpj/L3XN6+rg/rNSBVYcuFnts/FJ17u34bgNdrM75IO
         OlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=My8eFxhWc6X9tPKtlR5S+4wYGnIUv/JVpJUKrcGYuBo=;
        b=MM28papArvnhON4alOtdg8rJHDwRG1S2WT3w00p0FgY09LBGkp2K4KXVQCSXTUFlQq
         8O8c1VbdrlvfUZFZVpbO0wqLOzQ3L45y3I1uDzTQsttGCt5IPzDVVzyOKGOk7MIfxCFC
         cFEfgou2UrEexzPyne4p2DofwIu/AJjECJQIufrAFiFds6VDZe7PSyMp5CWEYncWh6rj
         VAgO0SpkB1Lc+6Pucec0Snjn/wK/pdE+xCud1aZH0uY0TRFP7muE/+mC8PppJ3OC5AZ2
         BqkT4AZrgCD+EPvJCcW87MJMFOuHpJg3xMghe5N9rRRd+U/lA5MadODEKoch2TmLqN6T
         gKmw==
X-Gm-Message-State: AOAM531eyD4+oIfVt1FLl6prBPxq6urPtOBbtuEfHcgWh5fwF0x3JHal
        2pcbRlNrlOatTUsh7pUszdeXeS4bDBES
X-Google-Smtp-Source: ABdhPJwJ+UPQ7LytX3OUGMWpKrF280UmJBL8RfAENZkWR3cJsYVXyQqFxBRsCero/rnlh9KNgazSdA==
X-Received: by 2002:a63:ff21:: with SMTP id k33mr15554412pgi.379.1614159135549;
        Wed, 24 Feb 2021 01:32:15 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id d16sm1593807pgb.12.2021.02.24.01.32.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 01:32:14 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:02:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        carl.yin@quectel.com, mpearson@lenovo.com, cchen50@lenovo.com,
        jwjiang@lenovo.com, ivan.zhang@quectel.com,
        naveen.kumar@quectel.com, ivan.mikhanchuk@quectel.com
Subject: Re: [PATCH v3 1/2] mhi: pci_generic: Parametrable element count for
 events
Message-ID: <20210224093210.GN27945@work>
References: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 06:52:27PM +0100, Loic Poulain wrote:
> Not all hardwares need to use the same number of event ring elements.
> This change makes this parametrable.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: add this change to the series
>  v3: no change
> 
>  drivers/bus/mhi/pci_generic.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 8187fcf..c58bf96 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -71,9 +71,9 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_CTRL(ev_ring)		\
> +#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
>  	{					\
> -		.num_elements = 64,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 0,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -114,9 +114,9 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = true,		\
>  	}
>  
> -#define MHI_EVENT_CONFIG_DATA(ev_ring)		\
> +#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
>  	{					\
> -		.num_elements = 128,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 5,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -127,9 +127,9 @@ struct mhi_pci_dev_info {
>  		.offload_channel = false,	\
>  	}
>  
> -#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
> +#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
>  	{					\
> -		.num_elements = 2048,		\
> +		.num_elements = el_count,	\
>  		.irq_moderation_ms = 1,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
> @@ -156,12 +156,12 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  
>  static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  	/* first ring is control+data ring */
> -	MHI_EVENT_CONFIG_CTRL(0),
> +	MHI_EVENT_CONFIG_CTRL(0, 64),
>  	/* DIAG dedicated event ring */
> -	MHI_EVENT_CONFIG_DATA(1),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
>  	/* Hardware channels request dedicated hardware event rings */
> -	MHI_EVENT_CONFIG_HW_DATA(2, 100),
> -	MHI_EVENT_CONFIG_HW_DATA(3, 101)
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
>  };
>  
>  static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
> -- 
> 2.7.4
> 
