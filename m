Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54DC23586A8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 16:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhDHOPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 10:15:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231817AbhDHOPW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 10:15:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A00D60FE6;
        Thu,  8 Apr 2021 14:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617891311;
        bh=pl3rh1t0geKwm8dx+akZbJndSulcUeNySWtXgm2mg+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Khumfqpp0H3OHPQ5UM1DQleARIfAzMP6JZbXHDb95iNcUnXTFx7kfvSuhSm6Pji2K
         rA4Dm8ivcCMaZqQUfZBhOgHI38J9RY/eo2jJga3kKJAWeplX79mFF0m4lY5Y6j8zVo
         qnfKvfgCqslKZB1vTB9o9uq2CmPhwB8HmmxkQedvpEcUpqiyXnrNq4QmaKm8RbnRxB
         ex4ubjP5lkkkJC79sHsweLXJxG7CfXyevEOVtDF4O61DIyFZz3cbwWfqrnPDnBc9Ay
         wis3QQj6DpxeiL24u6y9w9ZNFYj9Fx3gmmJM1PNWGK7ElJn8jeJptMkJbofWfJb6dJ
         Rgg1YwYfWwqwA==
Date:   Thu, 8 Apr 2021 19:45:05 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Subject: Re: [PATCH 1/2] [v2] bus: mhi: pci_generic: Introduce Foxconn
 T99W175 support
Message-ID: <20210408141505.GB32295@work>
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
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
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
