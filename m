Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA6E11DA2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2019 00:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731366AbfLLXqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 18:46:21 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44847 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731123AbfLLXqU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 18:46:20 -0500
Received: by mail-pf1-f195.google.com with SMTP id d199so317364pfd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2019 15:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eIHQNr9eba5L4XlIbOyWJRxI2gHfserq4iuA29IFaDM=;
        b=X8NY5D0iToa7JChnlhDAEszCIxTzy3LeWj/cfBf7BkV8CYiBtUDe0n81/4Gs32p8ai
         wl+gKwVYoOCPR/C1Q0o8ibrQett7r8j3amhvEjrlim8MYysj3YsObaDwTuD1EQeddqbc
         qfro0Tk+k3ZN4+MYsTiR5ECdbZGpWUBMB7A4VCGFV/Ku8wvYMmZGCmzWqxZ3z+ysaOc/
         ij/ms0WrKYveYecgTzJE4830I3L1LUDmFY5Dxq37WZ+KepfZW3h5LzWTp1iu8PiZ4W9a
         UuKaTJjjdUAFfirNmhXU7vnFVev0Jh9gYV4t2bRrHaLCTdKFfwXA6EXf63Sw4nbgSN9Q
         ejrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eIHQNr9eba5L4XlIbOyWJRxI2gHfserq4iuA29IFaDM=;
        b=nVqiikh4t2DYWwQ6gfnfibpJXxyI9+KF7XFQbbB0S9L80Q0vrSce6EWpD0Ia0H1PDD
         vrcjSub7VzmCRreatDor9/1WzMBZnZZM3MyCWub9E+DqiAc6xJt2myLS7WJZeIVxhOK6
         k7bYNpNVZhtv6nwKeuOTlJ1GNFO/QXsbkYGm0aZc7rUcDXklCridkvoS6ybYmNzlvGeD
         +YahY9pm7EHfv/k+IjBVRABUzGpX4FmuEkAr/eczNFCU+u7fnIFmCvksmi040dpCG7aV
         fs89heE/toqpMZFRlpByIAimJr30f2IBe9tPPR5Pqryov3IBQsgTGxXLXhtcl53Hxbpz
         LGVQ==
X-Gm-Message-State: APjAAAX4rfEm54E9eKF4rqENnvZqA7NZpQjgcBrNLUljMRTPDeKeeyzl
        X+IVc1XAdcpsQmCDr+CowOZdIQ==
X-Google-Smtp-Source: APXvYqyUAxx1/zJ6on6c1Dj9UNuN3zylY3ZgaoNYxmxea1rF+cz0ibCIgbQEAcmHbeEwobHtnzm+/Q==
X-Received: by 2002:a63:f814:: with SMTP id n20mr13440185pgh.318.1576194380117;
        Thu, 12 Dec 2019 15:46:20 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v16sm8442495pfn.77.2019.12.12.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:46:19 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:46:17 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, swboyd@chromium.org, stephan@gerhold.net,
        olof@lixom.net, Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] drivers: thermal: tsens: Work with old DTBs
Message-ID: <20191212234617.GS3143381@builder>
References: <cover.1576146898.git.amit.kucheria@linaro.org>
 <cea3317c5d793db312064d68b261ad420a4a81b1.1576146898.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea3317c5d793db312064d68b261ad420a4a81b1.1576146898.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Dec 02:38 PST 2019, Amit Kucheria wrote:

> In order for the old DTBs to continue working, the new interrupt code
> must not return an error if interrupts are not defined. Don't return an
> error in case of -ENXIO.
> 
> Fixes: 634e11d5b450a ("drivers: thermal: tsens: Add interrupt support")
> Suggested-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/thermal/qcom/tsens.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 015e7d2015985..0e7cf52369326 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -110,6 +110,9 @@ static int tsens_register(struct tsens_priv *priv)
>  	irq = platform_get_irq_byname(pdev, "uplow");
>  	if (irq < 0) {
>  		ret = irq;
> +		/* For old DTs with no IRQ defined */
> +		if (irq == -ENXIO)
> +			ret = 0;
>  		goto err_put_device;
>  	}
>  
> -- 
> 2.20.1
> 
