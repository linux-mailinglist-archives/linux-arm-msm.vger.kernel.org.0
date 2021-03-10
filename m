Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A346C333F1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234308AbhCJN35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234213AbhCJN3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:29:38 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9923EC061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:29:38 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 18so12054273pfo.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XRmDUhp4HTrIlS6k+9mhT1AI9vqeFpX1fwPqd8M1lVQ=;
        b=seD0W0t7sZx41+bQkMZwFt27wPVyBnsHq1oh1YcXM3oBTqwoIvOysKQiuHhSfikoVw
         wbmI5p8LHAYrKbRui0Xc5ZMvGA6My1E/xBvh9xw84WbTSFWuC2QCl+aF8f1DuTtDbIys
         n+3ZH7ONUHECdWwiKRsXN/kfijAwpeJSaRmRhbgNlEENagQsVjgNDvkp+b4j2bDZKCua
         B+16XnO8Iu4HtdkcILfdFdOoUHZ4DR71dXarpH5jYfQm70obkw+D6sZDBgNeKGwWwuWS
         r77TkIQROb2C/urS4UxFZUMQr9VlBXVeboFighAE7wmMHthGDr5zeFLfl/bVbcWo1Ak3
         QxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XRmDUhp4HTrIlS6k+9mhT1AI9vqeFpX1fwPqd8M1lVQ=;
        b=kQjGBSNYu7mqbGyokA85DV2CEcm1xAnOP2CCkgk3XlVOV+KxGAbABYQnCXeHOKTVCc
         2Z1VF0poyxEh3mqHuQE3cloBZ1DycMffNsFnJ2W7TTaJKERNsJz1kqHecbYskzuPtbvG
         wNndqxf50aawY4C5tUbHKaLyqwQ3iz0mT9Ji3hLSG/3IK7djDFb6WS2mPEWyNFBSgklf
         oLAUgz+aNrfjKae87qztbiOW4aQXnkTvi5rmFZjjN1WlsqUHggn5MiRr3qrKOCMet8w8
         SQ6jXlYb/XjJ3mhwkzEJ1YPGQt2uEcTVwgR4AiF2B+a68LQSPV9O9LRkPH9G+ahJFtE6
         fv7w==
X-Gm-Message-State: AOAM531eMuUlsswrWrzm6mRuZojAaAGBc9of9iNUFtAs1q7zmxax7Jh5
        J8sllkpdzKMUSIDNSvVWGO7q
X-Google-Smtp-Source: ABdhPJx1Bow11o4JqeSq/0Q280CLsTpk/Vhvv3F7osrYWTURym7B+2HRitS16bOAq/3z1ecCeozRCA==
X-Received: by 2002:a65:5288:: with SMTP id y8mr2762460pgp.105.1615382977996;
        Wed, 10 Mar 2021 05:29:37 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id y19sm17947761pfo.0.2021.03.10.05.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:29:37 -0800 (PST)
Date:   Wed, 10 Mar 2021 18:59:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/6] mhi: pci_generic: No-Op for device_wake operations
Message-ID: <20210310132933.GA30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:46PM +0100, Loic Poulain wrote:
> The wake_db register presence is highly speculative and can fuze MHI
> devices. Indeed, currently the wake_db register address is defined at
> entry 127 of the 'Channel doorbell array', thus writing to this address
> is equivalent to ringing the doorbell for channel 127, causing trouble
> with some devics (e.g. SDX24 based modems) that get an unexpected
> channel 127 doorbell interrupt.
> 
> This change fixes that issue by setting wake get/put as no-op for
> pci_generic devices. The wake device sideband mechanism seems really
> specific to each device, and is AFAIK not defined by the MHI spec.
> 
> It also removes zeroing initialization of wake_db register during MMIO
> initialization, the register being set via wake_get/put accessors few
> cycles later during M0 transition.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: reword commit message
>  v3: no change
> 
>  drivers/bus/mhi/core/init.c   |  2 --
>  drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 2159dbc..32eb90f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -510,8 +510,6 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
>  
>  	/* Setup wake db */
>  	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
> -	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);

I'm okay with the change since this is not documented anywhere. And if this is
required for any cases, can be done in the controller driver later.

>  	mhi_cntrl->wake_set = false;
>  
>  	/* Setup channel db address for each channel in tre_ring */
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index c274e65..4685a83 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -312,6 +312,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	}
>  }
>  
> +static void mhi_pci_wake_get_nop(struct mhi_controller *mhi_cntrl, bool force)
> +{
> +	/* no-op */
> +}
> +
> +static void mhi_pci_wake_put_nop(struct mhi_controller *mhi_cntrl, bool override)
> +{
> +	/* no-op */
> +}
> +
> +static void mhi_pci_wake_toggle_nop(struct mhi_controller *mhi_cntrl)
> +{
> +	/* no-op */
> +}
> +
>  static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>  {
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> @@ -515,6 +530,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->status_cb = mhi_pci_status_cb;
>  	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>  	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
> +	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
> +	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
> +	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
>  
>  	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
>  	if (err)
> -- 
> 2.7.4
> 
