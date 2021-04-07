Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4303566EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhDGIft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhDGIft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:35:49 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD8EC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 01:35:39 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h25so12511383pgm.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 01:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dzCOHV/pBsb5dumAb39MWSkmOx545Ewa/F9FlkYBzeY=;
        b=AmzkmjvptH9SU9l/XlfB/UF4GFTV316uO/kIcB0PZ3BRcKfT1Eoy6PRvnQaKU/7r1G
         TsLkd/dbiIRBPXyRxISDU8xyygBqhPi+Se8LX/cNUtEofbKA47FU8S1BXxphgl4GC4dS
         7NlLmvU/U3N30oLlx5cWrfrLOWeIboBpgO9Do3zQkr3gtob++wOeVeSMMudP+rG2CvhT
         9zen8MLK7uK3RTgMW+tuHsjw+i9VyAmEMKVUG+JNVbzcnYkLxzJiSTLL5LwxlSb24Yk5
         coJV79U6GmsHTDu2n+trkgHG5eWy9Yvdd9leVPB7v45m1qkByfX6ShqpQ6GlOoxTRKFx
         5CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dzCOHV/pBsb5dumAb39MWSkmOx545Ewa/F9FlkYBzeY=;
        b=KR6Y5QxzE+97n7Z5ljQyWJb0JPBSfdLi6JRzjSUVwe5sgPSvBJUo4hWGK8S/0gkhcM
         ZmhNJ9AyUOqzOOaQ4vl/Z9+rH7PkdxiyYwTZ8AEV7D1SZpSH921oS2mKL+D1MRGseDI7
         55OB6BfttWbhr01aHAYAnUGDvQnm4xykidllc0HvgY78BvHXxJ87dxePaUfW/Wt5e5UU
         Zt9r62Cxdgh5lmCkO8wa5GcGN1YHVTao2k4Qqdkr8ZOK9FDMCFrZeeluahT8uhsKQja0
         l1KG/6Hm/4WSsTNdmhgOk4I95ANv4wKVi3WkshhI4GmlqpY2IsXMm5Q0rAsirUPAHMD1
         7iBQ==
X-Gm-Message-State: AOAM532F111WrrrycZ7NdTb1jf7eHOIunspBu0pl2VhYObtX+qp5SUoo
        wlz3jSM8ohPp7uK8llUPaiGq/MPRRXAR
X-Google-Smtp-Source: ABdhPJweTdw8sSbPg/gTZN+6PjE+QIn11CWB6Pez6lVQL7/g1Og/6/AwfCU7OTWL3PglggIdzVREgg==
X-Received: by 2002:a62:1c86:0:b029:205:5428:41eb with SMTP id c128-20020a621c860000b0290205542841ebmr1933433pfc.33.1617784538649;
        Wed, 07 Apr 2021 01:35:38 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id m4sm20152653pgu.4.2021.04.07.01.35.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 01:35:38 -0700 (PDT)
Date:   Wed, 7 Apr 2021 14:05:35 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] mhi: pci_generic: Add FIREHOSE channels
Message-ID: <20210407083535.GQ8675@work>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
