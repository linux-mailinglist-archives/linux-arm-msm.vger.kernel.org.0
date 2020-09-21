Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03020272A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 17:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbgIUPk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 11:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgIUPk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 11:40:56 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EAB8C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 08:40:56 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x123so9575612pfc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jZ99iFfxzvKpZHylDsCAj6abQzoB9RXyCLfCxvwZg6k=;
        b=hOI6g64IctIUMHlqGYnTdodYOYwXX7UnNy8dQFYq1bYnIgDW5gh/NyesYwjCejEXvu
         r+GPa5YdxuIjLztvf/D5Z4QCsO4pBptO8u6ENx+VygT18gY/h7qlm8PGm599nx5ecDcm
         1v2jca9awMvk2dwUCw5pwnnZiV1ZEdcP+sP0cewHd0J8c1/4rB/02uJj9Mt2Muscrjfy
         n/NFikKA/K+u9mx7SDENqvwVAagbbuMrs43gnhtpnSSjjqwdLqcNj6eN3+KtadyVrmI/
         4AvfXdWRfg0hLiEQBriQXhmtPUl9hKAqBuF3ujnj2R2ypGLH1f4frHOio6c43zd3H+cc
         6Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jZ99iFfxzvKpZHylDsCAj6abQzoB9RXyCLfCxvwZg6k=;
        b=e+p7DERx8xKX5ek+jF5BjmZLIutft263TyUC8tWQ/h/k9mhx9QH7fXSxAOpPjQXEuz
         85n2/r1fD8a20LHIw5LNzoeSnEoetWQi85Z1ipQ7RpTgwn4UW0fq0qnkqrE34iCj0qKd
         YurOiABlDXg1q0HDj/VAxOzSp9VnRvxbB2nXuWgCbRQgEhMV+SWfxO0SjEilNuo5mxIR
         rbVCGrV+Dthj0pfZgipjQhHewcxcORmwTDsqIH7k3y0zSIEpihNE/8KTDyL20UldqVm6
         KOUzvAUZpuTf2K9GfoXjBvvyHRMMh/0cfVLZlLJAyB8Eo+CY3LaB8Rsbo9g5rfkQYxGa
         Z9JA==
X-Gm-Message-State: AOAM5305Uyv8U7F2xzamBY9MQ8rPzY898GOEmPj70yjw0Iqau+CYo5/z
        NvCWbc3113GgTDAXojH9vdov
X-Google-Smtp-Source: ABdhPJz9ON/EFYhAyfwGe4GnDer492KsDkj8lOUBFL5C0PBualPCSCVopxiZmG34vHpoQ0awydla2g==
X-Received: by 2002:aa7:8645:0:b029:13c:de96:6fde with SMTP id a5-20020aa786450000b029013cde966fdemr492471pfo.14.1600702855636;
        Mon, 21 Sep 2020 08:40:55 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id n12sm12670062pgk.20.2020.09.21.08.40.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 08:40:55 -0700 (PDT)
Date:   Mon, 21 Sep 2020 21:10:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, clew@codeaurora.org
Subject: Re: [PATCH v2 1/2] bus: mhi: core: Allow shared IRQ for event rings
Message-ID: <20200921154049.GJ3262@Mani-XPS-13-9360>
References: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600673819-1698-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 09:36:58AM +0200, Loic Poulain wrote:
> There is no requirement for using a dedicated IRQ per event ring.
> Some systems does not support multiple MSI vectors (e.g. intel
> without CONFIG_IRQ_REMAP), In that case the MHI controller can
> configure all the event rings to use the same interrupt (as fallback).
> 
> Allow this by removing the nr_irqs = ev_ring test and add extra check
> in the irq_setup function.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  v2: keep nr_irqs check early in init sequence
> 
>  drivers/bus/mhi/core/init.c | 7 +++++++
>  drivers/bus/mhi/core/pm.c   | 2 +-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 19ade8a..31961af 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -125,6 +125,13 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  		if (mhi_event->offload_ev)
>  			continue;
>  
> +		if (mhi_event->irq >= mhi_cntrl->nr_irqs) {
> +			dev_err(dev, "irq %d not available for event ring\n",
> +				mhi_event->irq);
> +			ret = -EINVAL;
> +			goto error_request;
> +		}
> +
>  		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>  				  mhi_irq_handler,
>  				  IRQF_SHARED | IRQF_NO_SUSPEND,
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index ce4d969..3de7b16 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -918,7 +918,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	dev_info(dev, "Requested to power ON\n");
>  
> -	if (mhi_cntrl->nr_irqs < mhi_cntrl->total_ev_rings)
> +	if (mhi_cntrl->nr_irqs < 1)
>  		return -EINVAL;
>  
>  	/* Supply default wake routines if not provided by controller driver */
> -- 
> 2.7.4
> 
