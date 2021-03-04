Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D2D32CD36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 07:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhCDG5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 01:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbhCDG5a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 01:57:30 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939F3C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 22:56:49 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id r5so18222723pfh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 22:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h2fZSgSbbuRf3w1cxcGcTdK99xpV68VkpJy/VFz8+JA=;
        b=bZ3nUljrz4E111yEGADBt+RKnupMHO38hm1euxT26aIN7m0QWEgwnwXyTA2C4g7543
         LRD/LCT5HyLR/ou7HZtVJPxlItAjEuIt+U33IFtbg66lMAQOptWwlViGXbUcTxshKeXQ
         U9pwHtApyLPlAgKuHl//S2iff6GXx85RPKgtFEO/IPHIy94uoV6bCpeCVu4axSjcDcax
         /6DdvT9sF9MvG+9PyepsOS6rB7lZe9/maSn9OPURHVHyOwD7lwAgUwvQLz8JN7pb5Ke1
         HEqvXgnPpyknO1VKmyKjWXTAkfy7AW7G6Lu5sOTko78zt7oyHBx5d76oi80aEoQRqBEn
         DMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h2fZSgSbbuRf3w1cxcGcTdK99xpV68VkpJy/VFz8+JA=;
        b=fzL+PFjzcMdNKxtexzkVoCzIN9i3LbB4HtKCPJzgTEAGlsnOir0OaWX+tNap56KrtB
         94EglKijexe9Hm89Vsv4acaWi6dDKBOlOifUqyYS30JpT6spnx7UXmQS7Tm0/2T81AaN
         TN31jQ9J4PuA8I7QdPTCBE9hf+HZeEfzVL2O8v+zsIhNwSa8xCGuHkiTBdpvo0Ku0a8b
         DM8DxZsXQyuAWBvIVTVitiIZ9XsWjaMJWJJtQYR9U4vV4JwSYzb1xzVVPCe7RLPxkYxR
         j329MyvTMSSuo3vVoK/pQrrGzD3KRB9gfx8/duvkeKvqiN5rIRZdBTmah22i0er+LFPK
         /6Gg==
X-Gm-Message-State: AOAM532WxROj3E3DAndwOukJb1EQer/8kbLlKJNau6uw5TBOOn4m05lP
        c0xTkYmQobrRrfUu4oyZUyNrBtJI+zfg
X-Google-Smtp-Source: ABdhPJxPzB2eChUImctZV6/XpehhW86A969/4DCwCBPqvc5NBSOZQD5hanRCrSJeKeIs8j2zny/QQQ==
X-Received: by 2002:a63:e1b:: with SMTP id d27mr2514337pgl.135.1614841008961;
        Wed, 03 Mar 2021 22:56:48 -0800 (PST)
Received: from thinkpad ([2409:4072:80b:705f:ce40:2a5f:bf1e:b205])
        by smtp.gmail.com with ESMTPSA id d124sm26750039pfa.149.2021.03.03.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 22:56:48 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:26:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/6] mhi: pci_generic: Use generic PCI power management
Message-ID: <20210304065643.GE3363@thinkpad>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
 <1614615911-18794-5-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614615911-18794-5-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 05:25:10PM +0100, Loic Poulain wrote:
> The PCI core can take care of proper PCI suspend/resume operations, but
> this is discarded when the driver saves PCI state by its own. This
> currently prevents the PCI core to enable PME (for modem initiated
> D3 exit) which is requested for proper runtime pm support.
> 
> This change deletes explicit PCI state-saving and state-set from
> suspend callback, letting the PCI doing the appropriate work.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 8423293..2a66f80 100644
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

Why do you need to load the state here?

Thanks,
Mani

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
