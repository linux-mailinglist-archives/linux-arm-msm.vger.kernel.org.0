Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B845333F5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232984AbhCJNgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbhCJNgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:36:15 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7E8C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:36:15 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id v14so4500431pgq.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uiMm4wIjQXCaEe2IhMovjUnt7D4lsf/xrs0EWBySwE8=;
        b=WDAfMRRmRHOFsZbXiB/KGlo4Ioe5MdZ5RJKXuFppYBtlGvMBIXN6/bjKGg+L6cyyMD
         L8lngmbs5HJzTsZ8Tc+7nHQyIiUIWc9yOh7zmc6Ooa8p95pkQlC7kB5HJK77v1NODJVT
         PxtQR4neeWZ8zjVrlxuGahKZEPXetzW4Q+g9UcQqo8g9+T3/w/zuAW6HG3UvmX+GeTtH
         P2QfnYO2s4h31+GjDrqRez4CoFGJlJBQqcvYPQRjHqcsmLo6YW1kg0bybWxYctbWup4D
         b5uEqTlBoc7cwZF6SGd9/mGB1VDSwsOBj0uaGsKajMiK/0VcQ/7KXAE0cdrHoXl6svRG
         x91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uiMm4wIjQXCaEe2IhMovjUnt7D4lsf/xrs0EWBySwE8=;
        b=ItwgpD+sVhGrWGMJg0JCgWmK8CENCogSj+y8Jxs84aNCUdVVNl84VJb7YzrrT5fXG6
         2P9z7Xb2cIQE0P8EwZox/aSLFJCccPWBcwzKocFmvm0GBUiVgiYojWmRCCWddDQrPlnz
         Jsy2ZygPPK4grq1VzmbPu/ycD8WzZC9LBw931MdEdEXdsbiQeceuBweMT+rkUv6tog6l
         k3fbTdFiM82II3MpeEbYoxj6qckbpt81nuvuItAiHiw00Jv00awWkdMJXfy9ORnejpD/
         UZztOsfY7Gh0zoSpBB6Bc0U/zy3VhxQwk9s3uqOVeE51LByxstZh0niIKA+EBcFkBVUI
         Wq7Q==
X-Gm-Message-State: AOAM533lCGGg3Z3+BKkinlM/wkAyuxddlQiN1Gp/VOfmG6efZSm0b0OH
        X6KmiVJ6LDGHRq8UI1l1vwVxe+pUKS9lRVQ=
X-Google-Smtp-Source: ABdhPJz1UhAnh4q9J2FnlEq5w5Mjth8EnxZuqqxMvJhg7fDUnAlVDjLy6sOYL53KVAl8kdvZwF01Ww==
X-Received: by 2002:a63:4462:: with SMTP id t34mr2770062pgk.389.1615383374902;
        Wed, 10 Mar 2021 05:36:14 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id g7sm15493810pgb.10.2021.03.10.05.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:36:14 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:06:10 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/6] mhi: pci_generic: No-Op for device_wake operations
Message-ID: <20210310133610.GE30275@thinkpad>
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

Applied to mhi-next!

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
