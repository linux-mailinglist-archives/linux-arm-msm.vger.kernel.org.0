Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A7432ED66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 15:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhCEOqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 09:46:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhCEOqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 09:46:04 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD05C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 06:46:04 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id j12so2157082pfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 06:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KwD1KPHWZ5w4I6VpjCdxI8VQ0yGbJCtMJPqengFSvc4=;
        b=M7rVDNIMwN5uV9egOoUVPb6YJZr+xy6b4NsE/BRsWTOPSDLvtD4c3x7dFvZF691S8G
         nCEUw9Lga4eA27ZtzaJSVnf3pJ/AHVnIE3PWf+fWGqc6KdpVPAQzrWOCoMW0aAz+pgnN
         hJSRHkwYnJNxvljMv6ylCmaLZCO8c0NJsKE0n5e+mfu4znz4dq8QFIeL22mb5+LyHz7o
         oCmAIzEJjRFqqRUyxnA03N4MdsSQ3sGRF/BXMmcHHzR8ilUDILE/YgvKtknotktq9wMh
         qLK/LoQsEjU/MhWZaCtY6PTwRSyClEGpAM0s9ls/dH6vkmfPuB8V55jAvyC3nwhtbShK
         +qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KwD1KPHWZ5w4I6VpjCdxI8VQ0yGbJCtMJPqengFSvc4=;
        b=evNAwaFB2pe3Urb0b8bMvaerVIiKMshqE/9pSwxqIcmlvaaK7GVmGK0r66GKHFDObF
         Rpe7I34jOb6MafTyTP6j1wYTpbOZpycmZQ6Et04k1GADQ/8F7VoH17zF9zHNvZniyePJ
         ffvrGPyHK65axWTItGbe+HyYTdc5vcIbMLlTu5qdEgCmuspdN7xKNTpgH3DyrWWMG+xd
         2UUayutK/WXTDQK+tGtKrYl+5J0MgP+yASjrAFkvm7dL9ylRM8cEKY6RoilHW7GsoQ1l
         dKi6dSooUzBVQWw4Fn+GIR0+Yc2Vfoppuv3bAxrb20yjMYtBtLapyBd4XpvOZsBkZEDT
         tA2g==
X-Gm-Message-State: AOAM53343TYeh/ae9uptqsVZdyNZ6l/5b8o5Wqz1p0DCkFqemwB4xCJP
        8sI8Qs1zHpRXKYBDioMI9y1H
X-Google-Smtp-Source: ABdhPJwNr1+3L/GpQYrXUVq1UdRuIxjzKFjUzTmsI61uPsmHLydHg/m/kzvms8Nz7tTvru8OIG5m8g==
X-Received: by 2002:a63:654:: with SMTP id 81mr5935633pgg.312.1614955563566;
        Fri, 05 Mar 2021 06:46:03 -0800 (PST)
Received: from thinkpad ([2409:4072:499:950f:3acb:225f:ada0:687])
        by smtp.gmail.com with ESMTPSA id d1sm2604063pjc.24.2021.03.05.06.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:46:03 -0800 (PST)
Date:   Fri, 5 Mar 2021 20:15:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 5/6] mhi: pci_generic: Use generic PCI power management
Message-ID: <20210305144558.GD2553@thinkpad>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
 <1614948478-2284-5-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614948478-2284-5-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 01:47:57PM +0100, Loic Poulain wrote:
> The PCI core can take care of proper PCI suspend/resume operations, but
> this is discarded when the driver saves PCI state by its own. This
> currently prevents the PCI core to enable PME (for modem initiated
> D3 exit) which is requested for proper runtime pm support.
> 
> This change deletes explicit PCI state-saving and state-set from
> suspend callback, letting the PCI doing the appropriate work.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  v2: no change
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
