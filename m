Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0697333F6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhCJNih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCJNiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:38:06 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584B1C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:38:06 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id ha17so877678pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HC9pwyL1fx8HwdqFz+hFGdHls+Maw2fu9ZyW9jdHeng=;
        b=KToaXrNVtSnB0b2dk6/hd/pqBu6YAOjHSr5rRC3didkeuruRgT3a3fwaGa5PMhSZDD
         haK7mBQlan/BMo3UE5OMwIuwCbH10KIng4PojBA6APgPKkF29mlUgSuwp1ggESb89xVV
         jC+sTahV0G+N8dNyhL1f4Zxt1QVeFVm9Xr7m93Sx2yI0kkCVaNK+twg5gJyaXHEpyqLd
         NfG/IcVoRuawFfvd+PxaeDmW00MMoMBnxLmsYi5y/E8OpbnSqp68T9Q+tBv6VpBPpZ6a
         XSkVbbC37/MiTTBuWHMsWTlmrh+DO05BHYMn+TLU7QRQGVVODTZcbRkB2nYAdOXRQRTV
         pGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HC9pwyL1fx8HwdqFz+hFGdHls+Maw2fu9ZyW9jdHeng=;
        b=X2cNS3E56tmXffG+gZ1KwsICH/YqGD/j9vnbhL4++cnv1SVB+clxfmZFxlMJKx9hab
         Xv21J/4bHrNfgP6FqRW5UZ37Dry1OKzYghFa3vTLf3eCvBWXK0QpHnK9zTqGSQPH6Fek
         rgv8mQ1Verua2w9KozYCnrpQ6INtQo5KY07JdQpKJtXVe+KXfmljP/gS0+z+NK5kh2Gm
         Hkjst+ZRx/HJBZ9fSrFzDKW9MGXvzr36PVqhGDeqmUkHKKL3XT7xTLeOtF59tdh8Rr5B
         S815MLPKbKC0bvpWjFbFCFnBVpHMGjQzmm8w7ERs/mFtn8qWVFS1IsM5N6WB34dRLdCx
         l9yA==
X-Gm-Message-State: AOAM530I1uMLaht3DmjrYU9VjouPZlhLIuANSUmapHr0FVK2zFZDCyaR
        ZZvjML8ki/r5KSnL7+gXh8OH
X-Google-Smtp-Source: ABdhPJxDcBFOwLuhgFvowCa+LY6CMWZfTwoBMiWtz8lVACv3q9UWtdSpQ+Pz7PyzXOTduC6SKz+sGQ==
X-Received: by 2002:a17:902:7782:b029:e3:2881:9eeb with SMTP id o2-20020a1709027782b02900e328819eebmr2818324pll.29.1615383485873;
        Wed, 10 Mar 2021 05:38:05 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id o13sm16955143pgv.40.2021.03.10.05.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:38:05 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:08:01 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 5/6] mhi: pci_generic: Use generic PCI power management
Message-ID: <20210310133801.GG30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-5-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-5-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:47PM +0100, Loic Poulain wrote:
> The PCI core can take care of proper PCI suspend/resume operations, but
> this is discarded when the driver saves PCI state by its own. This
> currently prevents the PCI core to enable PME (for modem initiated
> D3 exit) which is requested for proper runtime pm support.
> 
> This change deletes explicit PCI state-saving and state-set from
> suspend callback, letting the PCI doing the appropriate work.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: no change
>  v3: no change
> 
>  drivers/bus/mhi/pci_generic.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4685a83..4ab0aa8 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -544,9 +544,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	pci_set_drvdata(pdev, mhi_pdev);
>  
> -	/* Have stored pci confspace at hand for restore in sudden PCI error */
> +	/* Have stored pci confspace at hand for restore in sudden PCI error.
> +	 * cache the state locally and discard the PCI core one.
> +	 */
>  	pci_save_state(pdev);
>  	mhi_pdev->pci_state = pci_store_saved_state(pdev);
> +	pci_load_saved_state(pdev, NULL);
>  
>  	pci_enable_pcie_error_reporting(pdev);
>  
> @@ -717,10 +720,8 @@ static int  __maybe_unused mhi_pci_suspend(struct device *dev)
>  	/* Transition to M3 state */
>  	mhi_pm_suspend(mhi_cntrl);
>  
> -	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  	pci_wake_from_d3(pdev, true);
> -	pci_set_power_state(pdev, PCI_D3hot);
>  
>  	return 0;
>  }
> @@ -732,14 +733,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  	int err;
>  
> -	pci_set_power_state(pdev, PCI_D0);
> -	pci_restore_state(pdev);
> -	pci_set_master(pdev);
> -
>  	err = pci_enable_device(pdev);
>  	if (err)
>  		goto err_recovery;
>  
> +	pci_set_master(pdev);
> +	pci_wake_from_d3(pdev, false);
> +
>  	/* Exit M3, transition to M0 state */
>  	err = mhi_pm_resume(mhi_cntrl);
>  	if (err) {
> -- 
> 2.7.4
> 
