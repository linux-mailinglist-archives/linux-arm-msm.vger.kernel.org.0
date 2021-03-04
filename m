Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E5532CCDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbhCDGdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235220AbhCDGcz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:32:55 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E93C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:32:15 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id x24so968295pfn.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fcQMurL8VsONup8P8jv3pZfnheoAJzhNORoUqe09IJA=;
        b=NpdExQf7h5VLhd8ViRHTqKiG08AWfn6RLnl778tnA9yEeQs9y9H6aN0gn6D3Z7+hwF
         PaPcG6OC9W19NHuX+u0OuJVkapcm5O46hnCzxHIwzHl9CW4k4gC3P7xHY1inNFB2gAay
         JeSTtnEGP8F2VK5twHcwtbi97ijc2c0lAawEASp2U+gvBQplrRcSNg0tH2VVhffLl+EE
         d7Nb/itdpBpAPzsJ8ryi3hBfeUOB6C3j8SuVuIfbZog2EYegq/OknBDRJorwqG/wufh1
         SSqEKAXK/ZjSyfLz/3fuepX5SrS9MP8Evfnawys9/6UgmljeSI9oH2gAosXHHWWK8Vdo
         o/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fcQMurL8VsONup8P8jv3pZfnheoAJzhNORoUqe09IJA=;
        b=RTGOhYlq9+ILlYzpUIVA4VnYnLeFUf1Zm6VB/8iedaOYgEQ5BjX7x9Me5KkbyFKjpL
         +pIUDkjSQy/BKMfKB6IX0+1UYZBo0uA+3+0aq0jk9IQIfF9bVs8okqJGGpNqghbD5Vyi
         JrYGWJw2pQ71JOxUCgLsjiXzIR1CTgzcfjEdHQyon5WTCixleAe/ttK05HvBo7vBAGiF
         ggW012zdQt7+d5HAr986rMsLLrFd9LcGdKmSvrRcovPzMKJuHTLa40ZW07xHOpJdxxti
         4s4c5MPweCF0lf7Mpldf6QF5WMmUnzF/lLPK97uBrGzTjgv0frbhDWoawLnIYV2KxPye
         rq+A==
X-Gm-Message-State: AOAM5334BWPhA+MYLZHljyCufpI3MNeyEdbIUsxx4UvIe+eYHTMWnhmN
        kM2cmd8rXBw6kq4tMab7RWME
X-Google-Smtp-Source: ABdhPJzFWEy50jWfhpRFMomtNhodfdtbgPRtewE2PXPBrNSunc+1c/ceQtL160Fh+kSFX1lkRfLHpA==
X-Received: by 2002:a62:5302:0:b029:1ee:c519:8cdd with SMTP id h2-20020a6253020000b02901eec5198cddmr2450002pfb.79.1614839534812;
        Wed, 03 Mar 2021 22:32:14 -0800 (PST)
Received: from thinkpad ([2409:4072:80b:705f:ce40:2a5f:bf1e:b205])
        by smtp.gmail.com with ESMTPSA id i23sm20147729pfo.194.2021.03.03.22.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:32:13 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:02:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] mhi: pci_generic: Introduce quectel EM1XXGR-L support
Message-ID: <20210304063208.GB3363@thinkpad>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-2-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614615911-18794-2-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 05:25:07PM +0100, Loic Poulain wrote:
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
>  drivers/bus/mhi/pci_generic.c | 73 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index c58bf96..00a0410 100644
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
