Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DFC3564DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 09:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346269AbhDGHPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 03:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346238AbhDGHPr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 03:15:47 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8BBC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 00:15:38 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t23so6058705pjy.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HcXxAecxZJWgTB8Z/E3RJacsXBgggVz8QMe+LzFyUS0=;
        b=ZApWx83qPfBxL/ZRhlSNJRro0hyeK5Ji2vcn1g3VT9rEwaLIKMkMYwKWgwWCIhQPVP
         bZjFCMqVjeNhbtR1RZIhp491whOCSTT+usoCJV1HwZU9N39+MYdMJPW9xGYsbRXtkZ0D
         lqBYM6V5GbhenGJeHUkbFRIR1Hf6oloMFlnvtGL28y271HqFiweCzx+mp41cppq8g5ss
         uQfbLCmBB1kvpHdhL48rBP1lDisnngQ1tMO+0byqD0QcefoetuM876a8W2L+FOXhqWeT
         Hoc9XbqR4mDZnEdcveFn7t8zfgLKEKUywxBmj7HOUnI8rekkznnp3mRMYzkjH1U1mkg6
         OT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HcXxAecxZJWgTB8Z/E3RJacsXBgggVz8QMe+LzFyUS0=;
        b=UbarohfThw3z8Gk5YTiKLvJNob/HYEKAdOXoUo190mRPbm5EazG9M/UHIPHjvF7DPi
         53BFQPN38LYyfWxlPOkS53+0zzBqpnLu5t4OqJX9fNDr53KUDEdXP1piXEKxAFLh62vC
         joBtQ0pmwL+lF5jOKLdlTAy1gb8wR8iA6Edy00VEBoZNrKZpCxI20kYRTe8wi5+QCijT
         BmJ8HJzZ3UjjHnEpEyT3m5U5OgDJgOgida/r1zTRk68FE/s82kQFW62sdkqbcwuiCgR9
         KTS3FKc8XxDRM+Ud46ER9dHKCh92EpXsg4p7XtdOmeS07LnmS+XTww1UyZt59TTfTzMD
         YPkw==
X-Gm-Message-State: AOAM531Pt1B/bPs7mInPuFaAEo1pqFGGjMPAxbR29Ou9q3kfNx/yM3ZM
        qVaBdkOfgMOZpejaydv2k/BKt7HY/PatZYVjjZ87oilfa14geQ==
X-Google-Smtp-Source: ABdhPJxWpDailtmSoVH0CcjAFJ04hgtyj1Mwb4ujlBZEjrBHI0zljG5WVgpbIz/UT09W3kDOw4zHrS7FQbIKKcT4IdY=
X-Received: by 2002:a17:90a:fe90:: with SMTP id co16mr2017666pjb.231.1617779738456;
 Wed, 07 Apr 2021 00:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1616169037-7969-1-git-send-email-loic.poulain@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 7 Apr 2021 09:23:45 +0200
Message-ID: <CAMZdPi89X+BgUVT3Sx4r+NHM7zy7Mz8n3E6+g5=UyobEnmzs0Q@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Implement PCI shutdown callback
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani, Hemant

On Fri, 19 Mar 2021 at 16:42, Loic Poulain <loic.poulain@linaro.org> wrote:
>
> Deinit the device on shutdown to halt MHI/PCI operation on device
> side. This change fixes floating device state with some hosts that
> do not fully shutdown PCIe device when rebooting.

Any comments on this change?

>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index cbd2224..b104ab8 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -532,6 +532,12 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>         mhi_unregister_controller(mhi_cntrl);
>  }
>
> +static void mhi_pci_shutdown(struct pci_dev *pdev)
> +{
> +       mhi_pci_remove(pdev);
> +       pci_set_power_state(pdev, PCI_D3hot);
> +}
> +
>  static void mhi_pci_reset_prepare(struct pci_dev *pdev)
>  {
>         struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> @@ -704,6 +710,7 @@ static struct pci_driver mhi_pci_driver = {
>         .id_table       = mhi_pci_id_table,
>         .probe          = mhi_pci_probe,
>         .remove         = mhi_pci_remove,
> +       .shutdown       = mhi_pci_shutdown,
>         .err_handler    = &mhi_pci_err_handler,
>         .driver.pm      = &mhi_pci_pm_ops
>  };
> --
> 2.7.4
>
