Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70C2432ED5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 15:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhCEOp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 09:45:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCEOpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 09:45:18 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE27C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 06:45:17 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id n9so559015pgi.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 06:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NNXSnYGuNcxWkQNks9vLPElRUoCD46+M7SpN/p6rV4E=;
        b=vILOXW/eoaYSbSzBKdtnHh6PlBs0PMkqKnb93vxjbJr8xQgQh8dnjYHI1xlz/LcLBM
         LKoRuLj3HYwYngSWheD0T/yHiEuRuHOe+Xk7v/PBGiTaugDk5a82TRAZLeuZ1yDSgCRs
         yZvn3nsNoQ4qi+YEu8P2QOf2yZdn2ieEZI4N0GA69omPx7FdWXtfPzgzp02WWgrfRQQR
         d+h9V4GisLEXUXSOMg0+of7x2Fsp701dBkB995agJBYg1ZN3vNPAap0a3FmT0iNoAsol
         DAYwEq6PMHh7DLjZjjdVJLYjKhN+yiuDpg8L1BFksPd+MCwyaMQC0eYR5gPZ/1h2C3eY
         SF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NNXSnYGuNcxWkQNks9vLPElRUoCD46+M7SpN/p6rV4E=;
        b=FZZtRL2+AGS13BcCim2b/W66n6A/OZEES39v8cAfmdykRG3x8qinFudWI5g23/ulpX
         6DI5tj0sjBUUXvTI8NtAwmAVNqCaWwL3XINvMfJ0sAMoUHLJaL4pqS5JnOe3kwvu8rAf
         jK6HuJvugQo27PIcQ/6bmo4yQdNM8gbDW4vmJfV0GPz/QnOI9CWEfrYRw2Cu166k7e5P
         3xk/ec9Vwp5ssUuYIIl8QLShn0kGJmmXJycT83q+WhEc7qeKjXLYZ+GmPp506zy5s/Yk
         zqgxAIHacMpT1pCeH/cL28BgMeL3crzH50ATKZPT1Z2L33RNTgBsilBELovimIRUkrKF
         A/fw==
X-Gm-Message-State: AOAM530e+XEbw3b2+2VFBnMBWo1OSJnF1GycWaTDiCGQij8aTv+yMyB7
        EQPzqKy2XUM+M731FKJe16XpRuJU9Phn
X-Google-Smtp-Source: ABdhPJxG1VJWD5miKjbX0i6SA3548URD0I4MHtPWcKwiKiDLDv40pxARbwRivYqyjQqzVRl8s47qIw==
X-Received: by 2002:a63:5945:: with SMTP id j5mr8704810pgm.41.1614955517391;
        Fri, 05 Mar 2021 06:45:17 -0800 (PST)
Received: from thinkpad ([2409:4072:499:950f:3acb:225f:ada0:687])
        by smtp.gmail.com with ESMTPSA id fr23sm2623441pjb.22.2021.03.05.06.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:45:16 -0800 (PST)
Date:   Fri, 5 Mar 2021 20:15:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/6] mhi: pci_generic: No-Op for device_wake operations
Message-ID: <20210305144512.GC2553@thinkpad>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
 <1614948478-2284-4-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614948478-2284-4-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 01:47:56PM +0100, Loic Poulain wrote:
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
