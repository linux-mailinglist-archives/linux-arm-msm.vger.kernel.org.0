Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A677459183
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 16:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbhKVPmq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 10:42:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:37466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231697AbhKVPmq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 10:42:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A1E7B60234;
        Mon, 22 Nov 2021 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637595580;
        bh=Ilz9bjYlrxzgeeYl0UqrRBCk2xBGgbszL59GdE3XFhI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IoaZxSFSTTjflyvzlRTBXGEmv2assQU1s4m5G0FaSrIacr229k7susprzcKg2K2cb
         EA0ddiUtTHLKaYJaxmvID+wCmSQbWUH+XDf+pOnkKJH357hsGlqgIoy9KN3gDkGg0w
         AFdnxvxhnEGCvPJitSUyR2jNCpoRobr6iqVZX1aIsiO4LL+vUrWx1zBWc18BNYTbhB
         vrRSsT5hN4EAk87XZ7DruooUgb9oRYyNvYD6gBKiDaODqWJoO9+80SdC+kAWkmFE3m
         x5yzpE7llGKHuL/HPRHFpkh7MghM/buI7ZObK43XPsUbxA7wydm3cdgKdfk9fNGW/y
         bACEyI63IivDw==
Date:   Mon, 22 Nov 2021 21:09:22 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     linux-arm-msm@vger.kernel.org, mani@kernel.org,
        hemantk@codeaurora.org, aleksander@aleksander.es
Subject: Re: [PATCH] bus: mhi: pci_generic: Introduce Sierra EM919X support
Message-ID: <20211122153922.GB83834@thinkpad>
References: <20211122111135.3272126-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122111135.3272126-1-thomas.perrot@bootlin.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 12:11:35PM +0100, Thomas Perrot wrote:
> Add support for EM919X modems, this modem series is based on SDX55
> qcom chip.
> 
> Tested-by: Aleksander Morgado <aleksander@aleksander.es>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
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

DIAG generally uses a dedicated event ring.

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

I think you can just split control+data and diag events as like other modems.
If there is a requirement, please mention in commit description.

Rest LGTM.

Thanks,
Mani
