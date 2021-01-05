Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33DC2EB36B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 20:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbhAETUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 14:20:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbhAETUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 14:20:48 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F22C061798
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 11:20:07 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id i18so207686ooh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 11:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pApZtT3kUoc3iG8fxyNumTsrhIoA70XGH4vOpczgKSg=;
        b=GFG4+jX20prcNuncQrsCbCXaDE1/+gSTKbaKjfYpz+g0RCZIbl4pXANTxdKUdUTmHS
         lYnsCEF966ZB+WYWeLXJI5CTuI4zriBu1UQ4Xc02Zuuo6RUFjeJzXQazknR4gKhGe+fC
         3pPWITGRrA3Ktne+C44Q7JHlkdxng69Cw67wRXX3/ejaBneJgkyykaqaprrnUm7Tr54m
         0X3tzTP4wrhtMOt1hZFzo7MKIenhTCcdq+DUtEoXASuzsXgY4zHSi92BJ8HQdUhhbhjg
         chjSOgT7DKZBh+45Ve9DBTxsBmtYtM4IB7XZHzo3IM+dMAOuw43CyXk1+hD5ezrL2lpu
         dZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pApZtT3kUoc3iG8fxyNumTsrhIoA70XGH4vOpczgKSg=;
        b=W04uqB8aq7C197c6vcN04sZab1BL819tsYYrn6rrQGJcvLKTqjBNWT/lkbQONn/PmX
         pLN0p8HCb5npIZhDfkCXjOckPwIoBupLHc45qqTNILJBmR3+xlvIZqbAWSwbF0D2yc0F
         jSuolwtL7Kxvs2WY5+sOslVTxSgCHIp2RD2ScdJjFYmwmQXgLYHoXCWoQoruFy0jwXdC
         kVNz/iS9jbPdr55T5esLlzaXxpoNT7jeR/p93aEABWrgSTedrpvQeaF7+RGC/GsadTjd
         1Up8besc3vEjoWpeIVWEDSlBgkolCl8XhwikYFTtmlNDnhru7l9kmlXzxI0wowq2vrZ6
         ks9A==
X-Gm-Message-State: AOAM530GMI8+Mutm7+9BDZJK45kNJq5Hya2GUrPGAp7ajHKWAKVAtZ9d
        QstqZ6e97ydEU2S/sK6rUqPvX3P9YqQvUg==
X-Google-Smtp-Source: ABdhPJzXak7VMpj8lBTjdyUrKLPtv3rchrkXI4TeIrAZmIGtz8rHTtTrm8rWH9LxaRbq0cAhEmVtRA==
X-Received: by 2002:a05:6820:441:: with SMTP id p1mr408451oou.21.1609874406662;
        Tue, 05 Jan 2021 11:20:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g21sm23083otj.77.2021.01.05.11.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 11:20:05 -0800 (PST)
Date:   Tue, 5 Jan 2021 13:20:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Md Sadre Alam <mdalam@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH] mmc: sdhci-msm: Fix possible NULL pointer exception
Message-ID: <X/S75LlfnMWw+seh@builder.lan>
References: <1608626913-16675-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1608626913-16675-1-git-send-email-mdalam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Dec 02:48 CST 2020, Md Sadre Alam wrote:

> of_device_get_match_data returns NULL when no match.
> So add the NULL pointer check to avoid dereference.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 9c7927b..f20e424 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2235,6 +2235,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	 * the data associated with the version info.
>  	 */
>  	var_info = of_device_get_match_data(&pdev->dev);
> +	if (!var_info)

To get this you (the SDHCI driver developer) needs to add an entry in
sdhci_msm_dt_match[] without a .data specified.

> +		goto pltfm_free;

And this will cause sdhci_msm_probe() to return 0, giving no hint to
said developer that they screwed up. Given that this can only be caused
by a developer working on this driver you should provide feedback
suitable for such developer, e.g. by:

	if (WARN_ON(!var_info))
		return -EINVAL;

But given that this is only for the developer himself, I don't see that
this adds any value over just reading the callstack you get from the
panic when the next line dereferences var_info (NULL).

Regards,
Bjorn

>  
>  	msm_host->mci_removed = var_info->mci_removed;
>  	msm_host->restore_dll_config = var_info->restore_dll_config;
> -- 
> 2.7.4
> 
