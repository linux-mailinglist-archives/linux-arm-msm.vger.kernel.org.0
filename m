Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2B949C25F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 04:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235579AbiAZD6Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 22:58:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237411AbiAZD6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 22:58:23 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD51C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:58:23 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id s9so35159434oib.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/tnCcebPOvPrwQgbil6irE/V+y+y7OuGvQd7vSI/roE=;
        b=fLzd9DH7F0C7ViAvSxISbp9jtxNdX8Nq87nItwzEl/wyfYXr6vp6k0ZXm8PLDPEVss
         3pM4tqMPpTDiGOa5rea4fqSZWatb//ozCCOHuBbYrBkjrC1PXLD6Pl3tQGM9+loG96xX
         mr1pgUMOtvg7L/6u4r3MtNJj8IQBgsxx0Ve5/enkqnlKcghSNQKXmx8gZAXFxJ24kCwg
         BxsH8Phk/DLLBc8fNXN1kyPfOIxJWsZm5+7rolqfQ+XKcphXI/Ggvio3BjHtXOBxfV3s
         VJdoUh+DJXInYaFl05+dDOKmkppIJfqYTGaDjWGys6/9rOB2LUKwuemg9wl5ZKmdhMEX
         KOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/tnCcebPOvPrwQgbil6irE/V+y+y7OuGvQd7vSI/roE=;
        b=f/5QKd+KWWYkVeQvnaaETxSgKNOBM+bsDGjMP620uptU9r+CoVHdIHs8Nbm75YWFN2
         bhzNjqkHEySQGuMl3E4QGpoltOHwH+Z9/hw0hpX4NuNiUjUtcprGX7PAO+YvJTiK0jFC
         Bj8IIFTSzy1Rj4PaolbvnhfrJErkStLTpDTItf7KAJilyaqNSgYvwsADNEHUizRVFZtU
         pS776HLIHc3Q6/wENHQTcpzcWAzbOC0fWyv8fIcI+XPKh1BGamFErU41depYGrlXWDU2
         7nQMtGBddI28dwRrvQ5/3RReSD/jK3aQwuqsuo53gtxLgigrRRGrsTLGFToPSzrJS3GL
         rjLg==
X-Gm-Message-State: AOAM530ur7MZxLvRpHWHjLXKyJKWhVhqYpEDmisq5oKirBwk+APitlJu
        3Vkrm0n/eYj3ueQmZ9UXyZoSuw==
X-Google-Smtp-Source: ABdhPJwNVdqu6BVIKfzkmj60M9FPR9ZIF414nFiZzY6EOXZqw6kfMfypK2pMzmasZQ7akB2RvZSlCw==
X-Received: by 2002:a05:6808:bc8:: with SMTP id o8mr2617139oik.16.1643169502784;
        Tue, 25 Jan 2022 19:58:22 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id q14sm8103396otg.77.2022.01.25.19.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 19:58:22 -0800 (PST)
Date:   Tue, 25 Jan 2022 21:58:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     daniel.lezcano@linaro.org, rafael@kernel.org,
        herbert@gondor.apana.org.au, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update email address
Message-ID: <YfDG3AYkpb8+wICN@builder.lan>
References: <20220107145154.458779-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107145154.458779-1-thara.gopinath@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 07 Jan 08:51 CST 2022, Thara Gopinath wrote:

> Update my email address in the MAINTAINERS file as  the current
> one will stop functioning in a while.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb18ce7168aa..afcdd7588822 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15751,7 +15751,7 @@ F:	Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
>  F:	drivers/cpufreq/qcom-cpufreq-nvmem.c
>  
>  QUALCOMM CRYPTO DRIVERS
> -M:	Thara Gopinath <thara.gopinath@linaro.org>
> +M:	Thara Gopinath <thara.gopinath@gmail.com>
>  L:	linux-crypto@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> @@ -15868,7 +15868,7 @@ F:	include/linux/if_rmnet.h
>  
>  QUALCOMM TSENS THERMAL DRIVER
>  M:	Amit Kucheria <amitk@kernel.org>
> -M:	Thara Gopinath <thara.gopinath@linaro.org>
> +M:	Thara Gopinath <thara.gopinath@gmail.com>
>  L:	linux-pm@vger.kernel.org
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.25.1
> 
