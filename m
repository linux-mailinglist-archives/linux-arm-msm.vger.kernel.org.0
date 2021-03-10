Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27523333F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhCJNfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:35:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233341AbhCJNfB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:35:01 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDF7C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:01 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 16so4994898pgo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RjuXal4FxvZiYaPfNPCuSCMyg53iGIzlxKTk7b7TtPk=;
        b=ep9APR9WUSuPgEDP5sZm4TWGkx7VfQG1oTTQvcV/AiW9UWVMcIXQX9M9rACo/woqpS
         C9vmr1SyqaohCYUnEAlE3IzUiH51Sv5SNV9cpZeMk9g6rzykGwMyD1sHfNFwNCYXsgqy
         TmLD2GLtrBP1Z0GnD8GRK+YKQXLVTI0AHOXRpr9ZFy0DrZKemlaw1A5FNHTwDw67dJXS
         p8McUr8kE/tGdLUpSPoaL/xRQor0hH5Rrv5l1TI3jH9calQ0MUX3+cdx7knuZuwiy6dB
         UPMOSmZuFQznXsZqw1wuRAMtzYqU4KOfwzTHEF9GSlvApRMi2EjR6lw1YT/VI0hisw9R
         XkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RjuXal4FxvZiYaPfNPCuSCMyg53iGIzlxKTk7b7TtPk=;
        b=TTkYMTR5Rvv0SR0bUL/lBzRiA76kbw/bJqILAcjmxGiY61TR3YVhAyti4qUYj73yqE
         1CxVa+pbEHIvsKRz+eetpM5ljQwvtZR5xqlMsLYVcM8NoSJkhGP4hdQJw5wezQtglKlv
         ZWdXSKB38kO+n+H3sqJ8eHhYE3jGhyI3tAbfp6gXiQzzBbSGb7WQDN7y58fR8jpodI+9
         hwM72EcSqb+euWLRGcucYSYP5IcGQnPjpYEPMEBaUpKW0K1l2EO2znCIFP/D2ndFZ84/
         CCj/D6/Rmh2k9qTE0yfSUtjTGPoYTEaMdiBXJjzaNy6LHgnIN2PxDtnqQpqYwiGN5SXi
         Dw2w==
X-Gm-Message-State: AOAM530JOgvbpT5EKI9Q0RNCfb+6TKtcrSxQeqPgkn2fXA5gebe/bAjZ
        AJfjx6FLMgDy3d7MSZ19xpVX
X-Google-Smtp-Source: ABdhPJyv9ckzC1549Q0O64OXlWlMsXtNj9uLUu4sEKfmevYoPyacQBCnEFWHvV3GYwr4XoXacpF1rw==
X-Received: by 2002:a62:6413:0:b029:1f3:a5b4:d978 with SMTP id y19-20020a6264130000b02901f3a5b4d978mr2792324pfb.44.1615383301077;
        Wed, 10 Mar 2021 05:35:01 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id r2sm16173330pgv.50.2021.03.10.05.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:35:00 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:04:56 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/6] mhi: pci_generic: Parametrable element count for
 events
Message-ID: <20210310133456.GB30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:43PM +0100, Loic Poulain wrote:
> Not all hardwares need to use the same number of event ring elements.
> This change makes this parametrable.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: no change
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
