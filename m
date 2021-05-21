Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6884238C60F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 13:56:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhEUL5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 07:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhEUL5V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 07:57:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E31E6100C;
        Fri, 21 May 2021 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621598159;
        bh=jDXUzd+uAeWo7BvYRyqav70ZgmYfajJqRkfkwy5cpeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nCneHFmzpWzHHPhdQCWU2otza53d0DVBL1eQsIJ6BOshmh3zeVCm8pIj9N5TsfHHN
         HFv+Ko1XCgMix3iSYhngh+CG3k/WgNryqr1kXepdGMYqt6x/sZrxKobawkEjh4rdeR
         XFTcFHEo675jXm0XHx82xfXywzACbn+bP0lpnfGs2UHw3FMm2AX661pd08jCa36fa/
         Qm7lDjvbSSGTzbaqCBYEgR53ZxrSTlIhRo12spWO6fVsCSjOnjlsWSSAMXr+Xm2XEb
         v2Rdk6gaMl5ttKDwHw+cAwm54jdIo3lZi8WDDyPtmJTcGA7CCas9dDjryRix3dtLWc
         AUwJWoWAr1BlQ==
Date:   Fri, 21 May 2021 17:25:51 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, loic.poulain@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com
Subject: Re: [PATCH v2] bus: mhi: pci_generic: T99W175: update channel name
 from AT to DUN
Message-ID: <20210521115551.GA70095@thinkpad>
References: <20210429014226.21017-1-jarvis.w.jiang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210429014226.21017-1-jarvis.w.jiang@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 28, 2021 at 06:42:26PM -0700, Jarvis Jiang wrote:
> According to MHI v1.1 specification, change the channel name of T99W175
> from "AT" to "DUN" (Dial-up networking) for both channel 32 and 33,
> so that the channels can be bound to the Qcom WWAN control driver, and
> device node such as /dev/wwan0p3AT will be generated, which is very useful
> for debugging modem
> 
> Fixes: aac426562f56 ("bus: mhi: pci_generic: Introduce Foxconn T99W175 support")
> Signed-off-by: Jarvis Jiang <jarvis.w.jiang@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> v2: Add: Fixes: aac426562f56
> 
>  drivers/bus/mhi/pci_generic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..8c7f6576e421 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -311,8 +311,8 @@ static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
>  	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 32, 1),
>  	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
>  	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> -	MHI_CHANNEL_CONFIG_UL(32, "AT", 32, 0),
> -	MHI_CHANNEL_CONFIG_DL(33, "AT", 32, 0),
> +	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
>  	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
>  	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
>  };
> -- 
> 2.25.1
> 
