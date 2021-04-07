Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F3B35647B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 08:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242755AbhDGGrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 02:47:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:53612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349258AbhDGGq5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 02:46:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A884613CE;
        Wed,  7 Apr 2021 06:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617778008;
        bh=q2gJoe3SBJsfyBFqWYPAgFT//ZxFTqmbSyDY6Pp5ZwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SEGkIcZvDWC+/oDAu12M0Drl5gKrwxVAu9G/PAhGvnFLQi/oarOAysLSKhZrZl3bf
         6sOic2KC16adDRK6lNl/b3IOP/Sq87B4EPukmuSAN8YQAEG+sfoVyKHniVBirnjO3o
         rwar9VX/Tes3eAduoJ+y8oQyIAhMclDLwQ/PGOebRV7HC2o6UhgRLJMdu9rUcqQxPz
         1kYcYBp8zcIDk3tEy/sXgQAsVZXC0733BbJJskevb2Cb3hBKRkeiUTsOAhI83uOsZ3
         WPdIYcXIKN1mQYAJVMrAonDz1lsPjvxfpD7otAEx7kgLSZLduQ30nl5erpvcbYFG7A
         GBi2Rjuax9E9Q==
Date:   Wed, 7 Apr 2021 12:16:41 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, cchen50@lenovo.com,
        mpearson@lenovo.com
Subject: Re: [PATCH] bus: mhi: pci_generic: Introduce Foxconn T99W175 support
Message-ID: <20210407064641.GH8675@work>
References: <20210407025029.2616-1-jarvis.w.jiang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407025029.2616-1-jarvis.w.jiang@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 06, 2021 at 07:50:29PM -0700, Jarvis Jiang wrote:
> Add support for T99W175 modems, this modem series is based on SDX55
> qcom chip. The modem is mainly based on MBIM protocol for both the
> data and control path.
> 

List the modems whose support is being added.

> This patch was tested with Ubuntu 20.04 X86_64 PC as host
> 
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>
> ---
>  drivers/bus/mhi/pci_generic.c | 58 +++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 5cf44bcfe040..3e396c65a758 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -260,6 +260,52 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
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
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(16, "QMI1", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(17, "QMI1", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(18, "IP_CTRL", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(19, "IP_CTRL", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 32, 0),
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
> @@ -269,6 +315,18 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
>  	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
>  		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab), /* T99W175 (sdx55) */
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b2), /* T99W175 (sdx55) */
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b3), /* T99W175 (sdx55) */
> +		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },

Please add a comment about these devices as you did below. Using T99W175 (sdx55)
for all is not sufficient.

Thanks,
Mani

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
