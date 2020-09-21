Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E172726DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgIUOWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUOWP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:22:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B59FC061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:22:14 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f18so9363476pfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/ohY59Nrzv3YAYVrDMNEQPT9fiAQtlDqe6Vd4AsAnGk=;
        b=EGpFj0wsfd10XLBz4lvZSW3gIw5P14kmGUYlwrjPqu/yikGsHpDM4p4IkcSTiDZFC8
         yGC2ZTg0QPIYqLdLVmc1Gc+NtL3THNO9JjZg27fPz527rliW6eXjbtukajoMlv0RyMD3
         JBom0snJLBsQQ/uXFoqJIEUjANRGIiX0yFMlzhUK2/DL9/whoQeJpT+OF2feFjVzPpcI
         170AkcYTTeqrPOOfAUzwaROi+NU9mZ2mwi/ss4sdHUcUGprdD1dZG0ZR+tCENmYnMzsI
         LZi+JLdtD/iZLz/FzgOYbUr1zXV4h9pVn5lcdET7WfUIV+xX2A+TMG1qiBXU+s1wLess
         3oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/ohY59Nrzv3YAYVrDMNEQPT9fiAQtlDqe6Vd4AsAnGk=;
        b=SfQxsvf8hRwUv5po/VsfrI1VhLOwaa8b27nuigcX4KWOrlOj8hJK4tr95laHZKr2tR
         o6huUjZWehEZqwXu0fgMzJ3f+mowz1IEXQfVEHGTbWOjk6rMr1Pem40WuS5wEfp+ac3S
         qN2QEVBe/m3Hb9fyhu5JeYoCyYBnjurQZA1PjYR5Kco6FDr5GUAdt7WJSqcIs6yEIoHy
         I4HCmeE1RhgMSe6Pr8Lqy8y5H4LZ/QaP9RpRXmdGxkHFh6qoUxsrtqroCzJIhUcYrYX0
         +mGu14cQtWxC5AGqNhX5YftbHN9EBqXfSLI7Ae8AsHMK2SDL8I/RTt5Vpkgs5fsr6h+U
         S3Fw==
X-Gm-Message-State: AOAM530mtJaBGWu2kOr0SfEWTp2a6lpmBCayRoPJPWKb+/fKP1cg3zfa
        hjJGXoQG4Cxjungh5DfBfygZ
X-Google-Smtp-Source: ABdhPJz/yNczF/PeHr7sdxASq/KEXfff+mIWSvqNYDtOgUZR1xpwyjlHMvU9QEiQ+KrqLD3TOSXCFg==
X-Received: by 2002:a17:902:8689:b029:d1:9bf7:230a with SMTP id g9-20020a1709028689b02900d19bf7230amr241721plo.22.1600698133785;
        Mon, 21 Sep 2020 07:22:13 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id l79sm12657659pfd.210.2020.09.21.07.22.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 07:22:13 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:52:07 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, clew@codeaurora.org
Subject: Re: [PATCH v2 1/2] bus: mhi: core: Allow shared IRQ for event rings
Message-ID: <20200921142207.GG3262@Mani-XPS-13-9360>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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
