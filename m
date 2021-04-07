Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D0D356643
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235283AbhDGIQm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238552AbhDGIQl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:16:41 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9297BC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 01:16:32 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d124so3517976pfa.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+zhTHJVp375qdB0CCkdPgmDG3X2sID5KoMG+z8iRPFI=;
        b=KQpabxz7VVgnTyMcigYFdH13MrU1uTvJQZo1SI1cWHQ8t6/8GyFe/NHeYuKcwUmnW/
         06P8fvyyU/lAA/50PEVZGSYpZ640MidVex09V0WavbyJiE1Q76AMoSiGlzuODKor2Adl
         b9a/tDMO/2ty8xaA3A1apIpAWu8NwCh6xwk/a8gyPSE3C+jAqP8Zqxuy3sBxuR9UySVw
         6p74/9aIonjQ85G6sge8r3iHbcVghUORJmdcSCj1H3k8jbD/9dsZFGLlcebdTvN9Z/ud
         uTa/ilJCSLeFAbbJi9gcqObozVWzisYp+SS0Z5tfDxeDZIVb1rcukE2IAwDgqHQpbWxT
         aZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+zhTHJVp375qdB0CCkdPgmDG3X2sID5KoMG+z8iRPFI=;
        b=HX5IRdkplDYpoU/K3DhQ24253K8eEY2saV0VQ3dXJEfqo+HNflua5l1CnJAs1IDwoT
         42G9RTA9h1XJwn/EWHJBaIQs/iVpZMx9TTCJUQbzho5BuT/8jstHmApdIeHOp1ozwFwg
         RLbsyqqrJlEUnqH4Ma7mNpcSTB4cK2AEykNshIKyKZhm4ah2VTNOruYdNqRQ5lIV5fPf
         CP8AjKZm36gMm6BeNdJLkXK/P4TBDtec1umwLeQXl8AfnKvWfQ0ZaxirnrSCdGdAuSTQ
         LBiUN1EI/14r8AVj3NuXrTpHWZOYGRmB3C038y1q2x7ob5VIeuIvYfOTsUVgw20mw5JT
         qbJQ==
X-Gm-Message-State: AOAM5334jw7IQlsaaqfpcF5KW/uA4pn+pXR+sLUJayF8OYpIz1UM9JXm
        UVGpcUioNVWV4uz/cdUIoDu3
X-Google-Smtp-Source: ABdhPJyB8C23mc4WAuotVZDDVWK4zjD9yVRJbleruqFLgFv2fyprTi5keOo0JRSqajg8GU0LYNgxZw==
X-Received: by 2002:a65:63ce:: with SMTP id n14mr2189041pgv.279.1617783392049;
        Wed, 07 Apr 2021 01:16:32 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id y3sm3827179pfg.145.2021.04.07.01.16.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 01:16:31 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:46:29 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Implement PCI shutdown callback
Message-ID: <20210407081629.GO8675@work>
References: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 19, 2021 at 04:50:37PM +0100, Loic Poulain wrote:
> Deinit the device on shutdown to halt MHI/PCI operation on device
> side. This change fixes floating device state with some hosts that
> do not fully shutdown PCIe device when rebooting.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index cbd2224..b104ab8 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -532,6 +532,12 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	mhi_unregister_controller(mhi_cntrl);
>  }
>  
> +static void mhi_pci_shutdown(struct pci_dev *pdev)
> +{
> +	mhi_pci_remove(pdev);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +}
> +
>  static void mhi_pci_reset_prepare(struct pci_dev *pdev)
>  {
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> @@ -704,6 +710,7 @@ static struct pci_driver mhi_pci_driver = {
>  	.id_table	= mhi_pci_id_table,
>  	.probe		= mhi_pci_probe,
>  	.remove		= mhi_pci_remove,
> +	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
>  	.driver.pm	= &mhi_pci_pm_ops
>  };
> -- 
> 2.7.4
> 
