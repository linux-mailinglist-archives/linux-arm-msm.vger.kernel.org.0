Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA9C476B65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 09:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234685AbhLPIFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 03:05:33 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:37212 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbhLPIFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 03:05:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7DDB7B822F4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Dec 2021 08:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785CBC36AE4;
        Thu, 16 Dec 2021 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639641931;
        bh=ESRUWuWhBbpvl5vnO26EVxsCpqlcgpgAFhpXn4BdMIk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mCUMmgFQXPT+gi2udurhPJES+MbB20xCr4h7Im5PEQI7EYgdKtaPldKOvj62P4QOA
         k4RYI0Uk4gK8arVGCKBuka/3HP/MQmeTggrQj9QugZlgMKqX/vf+MkSeVHHbVYPzAV
         SfQ8WSvajNTtq7E2pu/snU5SuxEKNMTYN8AW4SUbZHLJHft+9C5JYzH6Hwv53xJ9UU
         CamsvsgJ7j7siOGQey8506R5UWbMg1s7ZcuWLFhJpFsSI58SyAGsKqYLvmuHo4b8+E
         YPbhD8TT4eD/dg/ulFRh3LtoRZ42I+xQjDUMMGZkx3nii4NwSPwBIFcbko9olBJxaW
         Pde+fDRJYMq4w==
Date:   Thu, 16 Dec 2021 13:35:25 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        aleksander@aleksander.es
Subject: Re: [PATCH v2] bus: mhi: pci_generic: Introduce Sierra EM919X support
Message-ID: <20211216080525.GE42608@thinkpad>
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

Applied to mhi-next!

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
