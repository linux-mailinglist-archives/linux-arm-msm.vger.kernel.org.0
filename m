Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD86D35662D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 10:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238735AbhDGIOi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 04:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhDGIOh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 04:14:37 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40318C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 01:14:27 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id t140so12424118pgb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 01:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BmzcCDVAqWdeOHGTdP+Si71Pl+mIwVEO7S2RtXw2yh8=;
        b=ZXa/70lC/Tz6Wq00hlWkPlJh09WznA+DZULrOKGsd+woqR73vGealVPGy8/FmEUa8A
         DivL9r3Mklizi4xrFELxL6+/uUcH6CvpjvsAlrEOQoCeiagzKkE/twHLw5tfo4F5DRsb
         vQoIEoySW2fbpoV360wbwH4B8qrlQEvn0LhpEH0/gNRwdKDs/mC0+rjAPAdGtckZmled
         O5g4g8/sTeZ099/PCuqdYfhA/4yqxEi22jJH3GT3W4oto4Lj9yTHgHr0Bv6yonlpz8ia
         7+mYFY2YFPqNLC/7ndoa2VMijxYuftLXz/cqW2diflIfhC7/SnBj98U1sq7xHOkIV+/W
         7IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BmzcCDVAqWdeOHGTdP+Si71Pl+mIwVEO7S2RtXw2yh8=;
        b=P9mC78rin5Aco7SM6pQeea2WgeDLXTZ6I49dLyHgOk1esJefdBurgISSG3cGfCKvrO
         7w0GbnqxRxd6LQLFZsthlpLLJLMicZD6UG4Pp+tKbuy4jmQw18a87Iu1iw+GmxNndCKv
         9CfGHz4IyYw3khzeg8pnPji/nwIIkT1X5yE3AhDtiHbCCDpC81EmL1KbAcpfce5dKmcC
         1mjFilxHIAT/hucHsJ6FAdVcAElq9kTr7dxxHlly45BrjvcxlclcjjdF8bvTcGV4bexx
         Nq9LIV419xIQgsHyV01SympcbH6M5Vxaj0R4vYLKHTwrxiJxCLd9zj5tyl9ssul40ZzX
         ukCQ==
X-Gm-Message-State: AOAM533LBHjNJd7LZllCDAkxy2d8sd0nsg6/A++3YKBR6tk2lffh8Gr9
        7It8Cc7cF5G3hFqH97AqVr8oA4tS30mo
X-Google-Smtp-Source: ABdhPJwPcTdqBokCq9ZlC8KxGjvyig+l6pQOli43N6zrLD9GYXAs6MIF5LnNl3XWMqY1dL3MAWG6Dw==
X-Received: by 2002:aa7:940a:0:b029:1f1:5b58:24e5 with SMTP id x10-20020aa7940a0000b02901f15b5824e5mr1865037pfo.54.1617783266643;
        Wed, 07 Apr 2021 01:14:26 -0700 (PDT)
Received: from work ([103.77.37.180])
        by smtp.gmail.com with ESMTPSA id l6sm21066419pgf.35.2021.04.07.01.14.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 01:14:26 -0700 (PDT)
Date:   Wed, 7 Apr 2021 13:44:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: Implement PCI shutdown callback
Message-ID: <20210407081423.GN8675@work>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
