Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20CE932398E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 10:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234632AbhBXJfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 04:35:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234631AbhBXJfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 04:35:03 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F375C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:34:23 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id k22so853383pll.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hERhMRvWBEIM+6gZohPE726Y2h6nADizUX3tsZGV7rU=;
        b=hKpZ3ihPVzqKN4MvHhHW8L/XpWSSeQPcsQ50MFFvxRD4Uyu/9J6RcDsRTXDzYvfp/m
         sGMVWr/GEZmQfD01sxbKu2+NCx79upuVnkc3JQ1MENqCMHQ0+3/Sniav/gYAzE3Kt2Vq
         1LVXyULNVvvY0M3WpoNqCSvx392l3gRQxYRpcK/zptg7X9xlaD/h9uqyXY2XkDNoTHmq
         m0rZUert+CGMCMQqkxpryhRW0o9ru7LdeOV8Uf8v6EmZPHkQnw9R9LsdC8wij545rwBg
         49aLKiTyA1KcGZfbsnr2ij3hQTuWUjfK4Cwq3qp67fWoCM/iAw+hdeInpSzYR+fIL9tm
         AC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hERhMRvWBEIM+6gZohPE726Y2h6nADizUX3tsZGV7rU=;
        b=D/UgflL7W48fmY7LggEjLgihXDx3SaPUlhegXqLfYEvZMNfjiSZhC75mgAqgljJOl5
         w/NDZwpzrLhhw0urfdZR7uWvtI7LEEbvB/m+k/dFU/FgBusIEyFxYPd1yXPCQDwgQxpg
         uRBU5S6aY5lEVeTo6gZXhlZpOz/aQ/jQk8LjqNX6YjG2BOGbjjjPQWRKwcOdq34HiJM9
         WCTt2KRNksqGJyfD6611wzA54FJNa1DntO06HflYcYrF0PTM5ynlb8HMyepvu8v61BdS
         wzmXfKCfETXKNV/xacSYJQAhYuPx5vyugNOpTfTx7DKz3emrKZoax/00wGmxMm9269eQ
         z8DQ==
X-Gm-Message-State: AOAM530KRnGbehQw85KFiSD1Cxx9Xok9HJQ0ZnxcwUK/gyrJow4vhmlh
        K8ZfO4cnFs8ZcMp5bof5Z2n9
X-Google-Smtp-Source: ABdhPJxsjJqqn7JbRjldwgiUkyQwHqSSElOIqt+2rHGtncoaClj1OIRPGtIMFcvga4MisiNiO3Arsg==
X-Received: by 2002:a17:903:31d1:b029:de:8361:739b with SMTP id v17-20020a17090331d1b02900de8361739bmr31582246ple.85.1614159262797;
        Wed, 24 Feb 2021 01:34:22 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id b188sm1848101pfg.182.2021.02.24.01.34.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 01:34:22 -0800 (PST)
Date:   Wed, 24 Feb 2021 15:04:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        carl.yin@quectel.com, mpearson@lenovo.com, cchen50@lenovo.com,
        jwjiang@lenovo.com, ivan.zhang@quectel.com,
        naveen.kumar@quectel.com, ivan.mikhanchuk@quectel.com
Subject: Re: [PATCH v3 2/2] mhi: pci_generic: Introduce quectel EM1XXGR-L
 support
Message-ID: <20210224093418.GO27945@work>
References: <1613497948-26424-1-git-send-email-loic.poulain@linaro.org>
 <1613497948-26424-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613497948-26424-2-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 16, 2021 at 06:52:28PM +0100, Loic Poulain wrote:
> Add support for EM1XXGR-L modems, this modem series is based on SDX24
> qcom chip. The modem is mainly based on MBIM protocol for both the
> data and control path. The drivers for these channels (mhi-net-mbim and
> mhi_uci) are not yet part of the kernel but will be integrated by
> different series.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: Specify 256 elements for the hardware event rings
>  v3: increase hw event elements to 1024 (aligned with downstream)
> 
>  drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index c58bf96..42b3952 100644
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
> +	.timeout_ms = 8000,
> +	.num_channels = ARRAY_SIZE(mhi_quectel_em1xx_channels),
> +	.ch_cfg = mhi_quectel_em1xx_channels,
> +	.num_events = ARRAY_SIZE(mhi_quectel_em1xx_events),
> +	.event_cfg = mhi_quectel_em1xx_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
> +	.name = "quectel-em1xx",
> +	.edl = "quectel/prog_firehose_sdx24.mbn",
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
