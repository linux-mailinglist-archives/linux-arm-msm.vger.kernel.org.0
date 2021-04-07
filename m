Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0763C356708
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349643AbhDGIlu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349655AbhDGIlk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:41:40 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73838C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 01:41:26 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ha17so9398976pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YdtV9ZMij3QboEzN7EM4Mmjjywo+yTzHcnfNsDC9q68=;
        b=gTWspM9hl/Y8jkVtVI/2ldMb98VWNB6bHstdde4ETM4odaWTvmVJ1ElFdDNI5oqd8m
         P1DEt5UKwEA4XFHDgg33HuOVKFnP2bIFSFcpHVTJOOBWMRZY5Md43TeWYGrtla8BjMSk
         V1UkiwizgKqvgJ1HnH6v9TRY0cBM3tA8H4JsVYltisTMmabudLXVZYqhdniGKwtURWrd
         LtQHxJYh7DcQ4WFclD6Tz/o5yGfkSYhZoF1Hj9Q4m5yUelSBQloPnW7QxLSX1U4V0Y+J
         GEIc9v7nTgCWXJz1nmvcm7c9SUXYhMt8ZNmdxzDecfywM5OD1sYie0NTRaz4cjdrs3f5
         nC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YdtV9ZMij3QboEzN7EM4Mmjjywo+yTzHcnfNsDC9q68=;
        b=cObc7+v5QzxBKuVRehmsgiYMRCSXMO8y40ZvRvRXU0JwWha3JuHanUQmjHH472LA10
         p0orSxaI8s5RHp3l67dzThAURixrhfON7ASEQoPPTkHcr1XPq+b3sNg7DmJR/043XC58
         95RJC94F64Q3MS1e+r8KOysmKRA9ocCoV6Mf+RtJKVgRU+R3Eb40KuCxlQBURvtD8ZTi
         So/vPx8Gm2PXDwxalhNF/OgTa5/pY8uqWBh9OJ0d8lXBZb0R6OPGEp2D27eKdKnxhFuE
         TkoeONNFplvQ0kUliOjsM4Pu+YgfoZpc+dNAtOQmzVALGBsMFjwtq6OoEVql6KO6l2rL
         4Rhw==
X-Gm-Message-State: AOAM532ChnfUUeHjSzuJlegIGGBSGFbsNvguqVBDtDgwGpPI+xU1fuQG
        Y1V9yfr9F5xuK2D7OAldiRMu
X-Google-Smtp-Source: ABdhPJyhYVqJk6OUNHP/oCqlIEuC9rlviX04CyOiy5WGqx3L2o7MHMEqCAfQWttpVQOnIFv0y+w/SQ==
X-Received: by 2002:a17:902:8306:b029:e6:125c:1a3a with SMTP id bd6-20020a1709028306b02900e6125c1a3amr2145518plb.65.1617784885830;
        Wed, 07 Apr 2021 01:41:25 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id x3sm20244397pfn.181.2021.04.07.01.41.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 01:41:25 -0700 (PDT)
Date:   Wed, 7 Apr 2021 14:11:22 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: Add FIREHOSE channels
Message-ID: <20210407084122.GR8675@work>
References: <1617784860-32439-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617784860-32439-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 07, 2021 at 10:41:00AM +0200, Loic Poulain wrote:
> When device enters flash programmer context (FP), it exposes firehose
> protocol through the EDL dedicated channels.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 544853c..fda3e88d 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -145,6 +145,36 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = false,		\
>  	}
>  
> +#define MHI_CHANNEL_CONFIG_UL_FP(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_TO_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_FP),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}						\
> +
> +#define MHI_CHANNEL_CONFIG_DL_FP(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_FP),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}
> +
>  #define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
>  	{					\
>  		.num_elements = el_count,	\
> @@ -181,6 +211,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
>  	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
>  	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
>  };
> @@ -241,6 +273,9 @@ static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	/* The EDL firmware is a flash-programmer exposing firehose protocol */
> +	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> -- 
> 2.7.4
> 
