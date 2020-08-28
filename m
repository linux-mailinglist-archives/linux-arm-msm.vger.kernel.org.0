Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038802553F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 07:09:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgH1FJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 01:09:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgH1FJk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 01:09:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2932C061232
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 22:09:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id g6so1461pjl.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 22:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M4xpwJ3VfAAdK51sDF+C1DZUS1S/ZC/8+tu65yMzW6Q=;
        b=K2gzEaccXAzpM1PQKdX7+cdYjofnz8Ui+aHuJMoA3db3qIRpYO7uXsRRS2oeRd1+Kg
         tyDH5wJu5u4A79RbPTcSy7CaDVTjECOl6uhJUMAfizV8VWLo56q3Bq7RpYLRWrNh9Vu6
         k+/CVMNXc0GddYXwBt3TybTzrKC2/i8rzDXyn5SS5VnXbShluYzlb5nm+obLPEKGpRly
         kne1v0GyDwyIen+xVKM1xW5Savv5e/jTs99enzM9JIoY/jtBEIK4U4YMAyR24sDrdk4O
         0TRxYJ84UcYwYsShEdMcbphU+/6shloh+B05VrYkfgdJURWwli/5ZQYnq87LI5HTnSgf
         J1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M4xpwJ3VfAAdK51sDF+C1DZUS1S/ZC/8+tu65yMzW6Q=;
        b=qYqgkV1yvmcfi+gXp0eyV4bsFlxJewjMlOp6hKkezUqrL3WgGO+Jcw00QC68bjP+rm
         9jcqaT0l6uwcmW8pZTiUZ9iP1z/hLIptJ74NXneo4ZKTnAfb/sPlgHPJkHCQcaHqC8x7
         J70z+yhHW9MYAUY+E0IGVywtpqATMjIbsZ3F/6NIzarqAB3X4PVW/zu92glK2GfKjkeE
         HilnC4+JvjlT7ufuFP9poyYLq2uhwTlkuu+sA5ka6T8YdvlWw4cHqZpfVOvaDVpc7RWW
         E2gjq1Gr7ZmzMZAUvVmf/xAjMq4TzBtlzwL+UrA0ECLGTrTYb7SHhvgTaFXrh+/j00m2
         ZgKA==
X-Gm-Message-State: AOAM532TzqhIlTDs68R+2IxXtRJ2UnqYJr39hm6nyFvR9SFHKzT7MNIu
        yN+XOPkEwx7ejC9zODnpBpxk4w==
X-Google-Smtp-Source: ABdhPJzXqVArIpytkRgvLkDrGcAXVpRBlXTIjtihwJUwu3AipIuRUMld0qG+k2M8oycHe8nx80H3jQ==
X-Received: by 2002:a17:90a:4314:: with SMTP id q20mr131480pjg.49.1598591378247;
        Thu, 27 Aug 2020 22:09:38 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id n17sm101436pgg.6.2020.08.27.22.09.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 22:09:37 -0700 (PDT)
Date:   Fri, 28 Aug 2020 10:39:35 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, arnd@arndb.de,
        naresh.kamboju@linaro.org, vbadigan@codeaurora.org,
        rnayak@codeaurora.org, Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhci-msm: When dev_pm_opp_of_add_table() returns 0
 it's not an error
Message-ID: <20200828050935.m32njmxdrgbudw4r@vireshk-i7>
References: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827083330.1.I669bb4dc3d92bd04e9a695f97904797dc8241b79@changeid>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27-08-20, 08:33, Douglas Anderson wrote:
> The commit d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call
> dev_pm_opp_of_remove_table()") works fine in the case where there is
> no OPP table.  However, if there is an OPP table then
> dev_pm_opp_of_add_table() will return 0.  Since 0 != -ENODEV then the
> "if (ret != -ENODEV)" will evaluate to true and we'll fall into the
> error case.  Oops.
> 
> Let's fix this.
> 
> Fixes: d05a7238fe1c ("mmc: sdhci-msm: Unconditionally call dev_pm_opp_of_remove_table()")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/mmc/host/sdhci-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index b7e47107a31a..55101dba42bd 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2284,7 +2284,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	/* OPP table is optional */
>  	ret = dev_pm_opp_of_add_table(&pdev->dev);
> -	if (ret != -ENODEV) {
> +	if (ret && ret != -ENODEV) {
>  		dev_err(&pdev->dev, "Invalid OPP table in Device tree\n");
>  		goto opp_cleanup;
>  	}

Wow!

How many bugs did I introduce with a simple patch :(

@Ulf, since this is material for 5.10 I was planning to resend the
original patch itself with all the things fixed. Will you be able to
rebase your tree? Or do you want to apply fixes separately ?

-- 
viresh
