Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C31B3A4D3F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jun 2021 09:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFLHIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Jun 2021 03:08:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:48258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230229AbhFLHIr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Jun 2021 03:08:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0065C61248;
        Sat, 12 Jun 2021 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623481608;
        bh=X2YGd7IvwLs5/YhL39fN+g8Xt2AWO41M1z0301CaslM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VfXwA0O8UvREklELiTqek9VlzA8LWrHhKF36DShjyC+PA0B6UBrkCqE4kes7rWCZ3
         bM2Tt4M9yEY5jTwLCEmRpkhaP9MAd9weHhnJsrfES+MWE7oxURvBYV6dnHes+/XFmI
         S/9dSM/tY4DmwXtdCLy4XUTUM4lOopLmUbdz1/pc4kCM6CK01V8XjN5uWpzkgqfAVy
         xaip1+cJ4IUfCbzCxuLF87l+pzE80At+gMzfrl7E9ZtCXSfixOl2slRTLDrCRTXSFU
         29vs60iYhohvyyg2EHa85kXmTS+c9JLRHnsTqmNrYyTvTO1JCZlH6Z+pWPaq26n9AN
         1N95EITrq0yRQ==
Date:   Sat, 12 Jun 2021 12:36:38 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     hemantk@codeaurora.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci-generic: Add missing
 'pci_disable_pcie_error_reporting()' calls
Message-ID: <20210612070638.GC22149@thinkpad>
References: <f70c14701f4922d67e717633c91b6c481b59f298.1623445348.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f70c14701f4922d67e717633c91b6c481b59f298.1623445348.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 11, 2021 at 11:03:50PM +0200, Christophe JAILLET wrote:
> If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
> must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
> call
> 
> Add the missing call in the error handling path of the probe and in the
> remove function.
> 
> Fixes: b012ee6bfe2a ("mhi: pci_generic: Add PCI error handlers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..d84b74396c6a 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -665,7 +665,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
>  	if (err)
> -		return err;
> +		goto err_disable_reporting;
>  
>  	/* MHI bus does not power up the controller by default */
>  	err = mhi_prepare_for_power_up(mhi_cntrl);
> @@ -699,6 +699,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_unprepare_after_power_down(mhi_cntrl);
>  err_unregister:
>  	mhi_unregister_controller(mhi_cntrl);
> +err_disable_reporting:
> +	pci_disable_pcie_error_reporting(pdev);
>  
>  	return err;
>  }
> @@ -721,6 +723,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		pm_runtime_get_noresume(&pdev->dev);
>  
>  	mhi_unregister_controller(mhi_cntrl);
> +	pci_disable_pcie_error_reporting(pdev);
>  }
>  
>  static void mhi_pci_shutdown(struct pci_dev *pdev)
> -- 
> 2.30.2
> 
