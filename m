Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DECA238CC5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 19:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232624AbhEURjL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 13:39:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238273AbhEURjL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 13:39:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476B6611AB;
        Fri, 21 May 2021 17:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621618668;
        bh=Pnku/X/HVYx7SW+LNkrVaiceNcDkgQAQ/XVQX7uC1iI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVLlJz3Yi9KZUihNkcNOuTRLhRitydgzlV0/mhPtwAIGbdqSc/O+bsp9zu5fGmLta
         7QbcfvBsg02PiMsEaIm0NsqwZB0cYH2lt1hOHESu1GRao/N1gYvmUHZ0O5Y6zPjlsA
         Ko05vXFD4FzJ36k8qRzPSWpMRSj+uHohzwAqgz9qSvivOXJDiNVzBPvmjd5bSCNDHK
         +bNYcN/SWhbZzxCumBiTTzdHCuMblenbnPh5l3/oOY2rXq/swysUGuUNtIhCHW8y2m
         dkbG/ExFk6ykeTgFzv5jBUJuV/4zv8EwA/qTQKE9xpWU3k14EJC5Fg8RjNHjtcdaOH
         Bz/C6Sfh7IB5A==
Date:   Fri, 21 May 2021 23:07:38 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Jarvis Jiang <jarvis.w.jiang@gmail.com>
Cc:     hemantk@codeaurora.org, loic.poulain@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        cchen50@lenovo.com, mpearson@lenovo.com
Subject: Re: [PATCH v2] bus: mhi: pci_generic: T99W175: update channel name
 from AT to DUN
Message-ID: <20210521173738.GQ70095@thinkpad>
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

Applied to mhi-fixes!

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
