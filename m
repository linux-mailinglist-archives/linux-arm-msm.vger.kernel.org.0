Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA2B476B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 08:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbhLPHgk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 02:36:40 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57486 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhLPHgk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 02:36:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F231661BF7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 07:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58398C36AE4;
        Thu, 16 Dec 2021 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639640199;
        bh=UePRP73Jx2HKB43iw9v8RZ6aV48R0z5Nc8P0e74+tAk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nqNOG9bXC1xKrH7kBq8D42evmf04eSII2Om+347SUxVL7VsLg3uYzth3xKcNWLKVb
         Xene87jdXRHRJWiNZw/IwCDdTNzyODyjP79TANdthAwh5MLhwSjrUBsei2I1LZl9CA
         lUa8DMYZdWvMt5Q+4RK5dI06NcPejEtoP9Kni62sDVLwSeZ2i98RZL54lhx68S+woV
         RsCYzK9yzoXi8Ha7rEr1UkxdfRVmj/2XQJKRDh+HOp2poq4lAsxUZcABlfWZSJHOdT
         vAXkhEMQoQH0K21ztuJ0UW9jgSknw3nCqZCBrM6EsPvvfi4M8BW+UFfCnmdyFHSbND
         QP4xdTxTMjcXQ==
Date:   Thu, 16 Dec 2021 13:06:28 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     linux-arm-msm@vger.kernel.org, mani@kernel.org,
        hemantk@codeaurora.org, aleksander@aleksander.es
Subject: Re: [PATCH v2] bus: mhi: pci_generic: Introduce Sierra EM919X support
Message-ID: <20211216073628.GD42608@thinkpad>
References: <20211123081541.648426-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123081541.648426-1-thomas.perrot@bootlin.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 23, 2021 at 09:15:41AM +0100, Thomas Perrot wrote:
> Add support for EM919X modems, this modem series is based on SDX55
> qcom chip.
> 
> It is mandatory to use the same ring for control+data and diag events.
> 
> Tested-by: Aleksander Morgado <aleksander@aleksander.es>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 43 +++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 59a4896a8030..076a951fd587 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -403,7 +403,50 @@ static const struct mhi_pci_dev_info mhi_mv31_info = {
>  	.dma_data_width = 32,
>  };
>  
> +static const struct mhi_channel_config mhi_sierra_em919x_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 256, 0),
> +	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 128, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 128, 0),
> +	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 512, 1),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 512, 2),
> +};
> +
> +static struct mhi_event_config modem_sierra_em919x_mhi_events[] = {
> +	/* first ring is control+data and DIAG ring */
> +	MHI_EVENT_CONFIG_CTRL(0, 2048),
> +	/* Hardware channels request dedicated hardware event rings */
> +	MHI_EVENT_CONFIG_HW_DATA(1, 2048, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
> +};
> +
> +static const struct mhi_controller_config modem_sierra_em919x_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 24000,
> +	.num_channels = ARRAY_SIZE(mhi_sierra_em919x_channels),
> +	.ch_cfg = mhi_sierra_em919x_channels,
> +	.num_events = ARRAY_SIZE(modem_sierra_em919x_mhi_events),
> +	.event_cfg = modem_sierra_em919x_mhi_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
> +	.name = "sierra-em919x",
> +	.config = &modem_sierra_em919x_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32,
> +	.sideband_wake = false,
> +};
> +
>  static const struct pci_device_id mhi_pci_id_table[] = {
> +	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
> +		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> -- 
> 2.31.1
> 
