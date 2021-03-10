Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3707333F5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhCJNfk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:35:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbhCJNfT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:35:19 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E536C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:19 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id n10so11422396pgl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FQGKtekIi6sYtmtjN8yvwF6rkVG+6hUMZ3m0XPJk2dc=;
        b=EQgldQbaPJFIud5RkhkuXxHCJ5XKJkfs0UI+Dg3eMPDFFYaPyrgP8sRixRjvL2BV68
         /3JARt8Fk+CnUWSi6k1/V23D1+3+uW6ewx3RaLLzmVK4St6sfNOYphER6Le5fad+gDOM
         wzdY5ZiL6/nLlgU5Gttzr9ckQ6boc74J68T/8U5zdr5h3wQmDgcCxHEFbX9024OKIBtY
         9/0u52wq4GdGe5B+QVJCTXWhR1d7ES15u4F2KjpMnV2osKH2vSp92vwbwDLjbHR7YLrT
         66F8W/uJxouqoXrvnc/JhqELUkiS6TgIQbSu5l1qelXPdCsMRcdyiK4vnTeHacEcl+PN
         oCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FQGKtekIi6sYtmtjN8yvwF6rkVG+6hUMZ3m0XPJk2dc=;
        b=GK72YnmJH+AifhkIrbBTKsPdhTfBuo0EN61MNVaJo8hEAxBkFslysFPAeogmcLD0BH
         OD6bsJpaF5w6HP7WpgG56oDdV4hFJf5dJlu89SOpGhQe1sQRXDA50M5IcYqZtA4sBXzh
         otkuO/UZDt3cWqR4reM4lNGfy6ZZhTK10QaN+MAagrtvp0hj9npCNMB8If+78rnGCyTd
         fFdzp9qEEpM0R7JO60pWpgxzd4G5Ycl8328bQyvJyQ/Drc65GH2MSj5BqGRwXp5G3D2o
         ah0kWCz7kyniS6MExp/6VEwsSD8HZHb6UV6yUXqHenmU+jCbStp2Qu7PkM/h2YEvfSHl
         Tkpw==
X-Gm-Message-State: AOAM5323sgqLdtQU7oDLORA71C2G0RJo8QWZ8KgN6eXvxaEEOSIEIpxf
        W4vlLkEph1mP6Div9qMmhQpR5aKtrn9w6vs=
X-Google-Smtp-Source: ABdhPJxuyOh8ZVsVyg1McgnQ7HLw3G5k2GO+HvsTU5Erv/qOaCJXiftTqm0HPkok0fxNj6sYFx3fyA==
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id h22-20020a62b4160000b02901e4fb5a55bbmr2838436pfn.80.1615383318948;
        Wed, 10 Mar 2021 05:35:18 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id t187sm16217804pfb.91.2021.03.10.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:35:18 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:05:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] mhi: pci_generic: Introduce quectel EM1XXGR-L
 support
Message-ID: <20210310133514.GC30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:44PM +0100, Loic Poulain wrote:
> Add support for EM1XXGR-L modems, this modem series is based on SDX24
> qcom chip. The modem is mainly based on MBIM protocol for both the
> data and control path. The drivers for these channels (mhi-net-mbim and
> mhi_uci) are not yet part of the kernel but will be integrated by
> different series.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: update timeout_ms according real modem boot time
>  v3: no change
> 
>  drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index c58bf96..45d0cf2 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -114,6 +114,36 @@ struct mhi_pci_dev_info {
>  		.doorbell_mode_switch = true,		\
>  	}
>  
> +#define MHI_CHANNEL_CONFIG_UL_SBL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_TO_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_SBL),		\
> +		.pollcfg = 0,				\
> +		.doorbell = MHI_DB_BRST_DISABLE,	\
> +		.lpm_notify = false,			\
> +		.offload_channel = false,		\
> +		.doorbell_mode_switch = false,		\
> +	}						\
> +
> +#define MHI_CHANNEL_CONFIG_DL_SBL(ch_num, ch_name, el_count, ev_ring) \
> +	{						\
> +		.num = ch_num,				\
> +		.name = ch_name,			\
> +		.num_elements = el_count,		\
> +		.event_ring = ev_ring,			\
> +		.dir = DMA_FROM_DEVICE,			\
> +		.ee_mask = BIT(MHI_EE_SBL),		\
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
> @@ -182,9 +212,52 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
>  	.dma_data_width = 32
>  };
>  
> +static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_quectel_em1xx_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static struct mhi_controller_config modem_quectel_em1xx_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_quectel_em1xx_channels),
> +	.ch_cfg = mhi_quectel_em1xx_channels,
> +	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
> +	.event_cfg = mhi_quectel_em1xx_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
> +	.name = "quectel-em1xx",
> +	.edl = "qcom/prog_firehose_sdx24.mbn",
> +	.config = &modem_quectel_em1xx_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32
> +};
> +
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.7.4
> 
