Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A23743B308F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 15:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhFXN5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 09:57:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:40160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229878AbhFXN5E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 09:57:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB679613ED;
        Thu, 24 Jun 2021 13:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624542884;
        bh=/32sOfqBuW6w8TkTPIKazjyLhk/Mx4cjOGiRx7iMCZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SNLBNwhXotcsEgqAmrxcWBMdtodq8S1RpUb2XkIyqnr8fWDk89EZWV0eCRjXqF46I
         dPTUp/92H3m37WqsCeJxjTOXa8Aefa9ch88BMAWEtjbJACQh0ZhvONiIDRXGpqXVEL
         ovALJxZ71neA+1TbKHgr1NE+rJIWDvZ5DnX1Q2bE=
Date:   Thu, 24 Jun 2021 15:54:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        ULRICH Thomas <thomas.ulrich@thalesgroup.com>
Subject: Re: [PATCH 8/8] bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to
 MHI
Message-ID: <YNSOopVLtRfRZODo@kroah.com>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-9-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621161616.77524-9-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 09:46:16PM +0530, Manivannan Sadhasivam wrote:
> From: ULRICH Thomas <thomas.ulrich@thalesgroup.com>
> 
> This patch adds VendorID/ProductID and MBIM Channel Definitions for
> M.2 Modem Card (PCIe Variant) to MHI PCI generic controller driver.
> 
> Cinterion MV31-W (by Thales)
> Additional information on such Modem Card (USB or PCIe variant) is
> available at:
> https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> 
> Signed-off-by: ULRICH Thomas <thomas.ulrich@thalesgroup.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Link: https://lore.kernel.org/r/PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM
> [mani: fixed the subject, whitespace, and added sideband_wake field]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 37 +++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index eb9263bd1bd8..1773cb3173bc 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -350,6 +350,40 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
>  	.sideband_wake = false
>  };
>  
> +static const struct mhi_channel_config mhi_mv31_channels[] = {
> +	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
> +	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
> +	/* MBIM Control Channel */
> +	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 64, 0),
> +	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 64, 0),
> +	/* MBIM Data Channel */
> +	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 512, 2),
> +	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
> +};
> +
> +static struct mhi_event_config mhi_mv31_events[] = {
> +	MHI_EVENT_CONFIG_CTRL(0, 256),
> +	MHI_EVENT_CONFIG_DATA(1, 256),
> +	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)

trailing ',' please.

> +};
> +
> +static const struct mhi_controller_config modem_mv31_config = {
> +	.max_channels = 128,
> +	.timeout_ms = 20000,
> +	.num_channels = ARRAY_SIZE(mhi_mv31_channels),
> +	.ch_cfg = mhi_mv31_channels,
> +	.num_events = ARRAY_SIZE(mhi_mv31_events),
> +	.event_cfg = mhi_mv31_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_mv31_info = {
> +	.name = "cinterion-mv31",
> +	.config = &modem_mv31_config,
> +	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
> +	.dma_data_width = 32

Trailing ',' please.

thanks,

greg k-h
