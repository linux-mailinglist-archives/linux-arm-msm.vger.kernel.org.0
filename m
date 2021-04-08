Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6E63584F4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 15:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhDHNlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 09:41:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:44662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231601AbhDHNlE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 09:41:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C565F61130;
        Thu,  8 Apr 2021 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617889253;
        bh=mBcEqmAZVT1QKBoR39KtP/gJRWbC4lWPZgNcHR3Hji4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zvn+Gvx/SFx0tBBV+C6ixit/7p9/aW7DS4O1xoJscnKY2UngCUxqScLDHMFVLbhHw
         acpUpvxk3sQc8csEZ+g+ONgipgSN/lGRvMeKBc2ldp3ZwvwlI6oyYxRwobAdFsDM3e
         nL9mSpMRNVsZowQBvJ2hkyc0yAFerkWX5JGgRWRLJUL/QUijTKf1kVNFY3cqetwVYV
         m3Pe2ClTdFJavUdMf3TDRb9/PXhOQqZGxJQiEEhQggdoB2f+BKoxFD5vIbL3tcSy1b
         OymF+JjxDaYoYOt8XdwWWVs5dz3T6D1VJz1PE3FNjxPuoq4ab9KW0Zy3VNC128I7de
         CYQ0/gXih+voQ==
Date:   Thu, 8 Apr 2021 19:10:47 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Subject: Re: [PATCH 1/2] [v2] bus: mhi: pci_generic: Introduce Foxconn
 T99W175 support
Message-ID: <20210408134047.GA32295@work>
References: <20210408095524.3559-1-jarvis.w.jiang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408095524.3559-1-jarvis.w.jiang@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 08, 2021 at 02:55:24AM -0700, Jarvis Jiang wrote:
> Add support for T99W175 modems, this modem series is based on SDX55
> qcom chip. The modem is mainly based on MBIM protocol for both the
> data and control path.
> 
> This patch adds support for below modems:
> 
>  - T99W175(based on sdx55), Both for eSIM and Non-eSIM
>  - DW5930e(based on sdx55), With eSIM, It's also T99W175
>  - DW5930e(based on sdx55), Non-eSIM, It's also T99W175
> 
> This patch was tested with Ubuntu 20.04 X86_64 PC as host
> 

The subject should be as below,

[PATCH v2] bus: mhi: pci_generic: Introduce Foxconn T99W175 support

> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---

Also you need to add the changelog here.

>  drivers/bus/mhi/pci_generic.c | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 544853c67e02..c66fb73e47ad 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -269,6 +269,44 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
>  	.dma_data_width = 32
>  };
>  
> +static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_foxconn_sdx55_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 128),
> +	MHI_EVENT_CONFIG_DATA(1, 128),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
> +};
> +
> +static struct mhi_controller_config modem_foxconn_sdx55_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_foxconn_sdx55_channels),
> +	.ch_cfg = mhi_foxconn_sdx55_channels,
> +	.num_events = ARRAY_SIZE(mhi_foxconn_sdx55_events),
> +	.event_cfg = mhi_foxconn_sdx55_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
> +	.name = "foxconn-sdx55",
> +	.fw = "qcom/sdx55m/sbl1.mbn",
> +	.edl = "qcom/sdx55m/edl.mbn",
> +	.config = &modem_foxconn_sdx55_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32
> +};
> +
>  static const struct pci_device_id mhi_pci_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> @@ -280,6 +318,15 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
> +	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* DW5930e (sdx55), With eSIM, It's also T99W175 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b0),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
>  	{  }
>  };
>  MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
> -- 
> 2.25.1
> 
