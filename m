Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA6142BC391
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 05:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727204AbgKVEVQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 23:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbgKVEVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 23:21:16 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25BDC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 20:21:15 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id s11so2360516oov.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 20:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OYohcQP098ylvBYISkee6mm40H7Iz7E4qk9gVli2edU=;
        b=gF+/WXrZzx5XpcYakXWPQ+oU06Gsa9hIFUAfMhzRCPUZ/HZf2820Zlqj7eNff86FqI
         hN09KUnDQoPTAs+wXn5+UigHnS5hcwLx2UHakXmaxutidYRb0CnSjn+AQSd93ce5YlV5
         ZbCDDf2mlyD5ZD/9x/vVn0p3Eu7+ihJmEGc8BIBH1uCHo8XCIXneFRh+Ci0CxJmZALeV
         shqdS6J65s66jtL5u7N2LqYveWlA212pSus56NW2L68dxChLmcOq1HH9GzpPvgFCzlX3
         WDUt4GZzYsi7dLPCkc0JrJs1L3UwqW828DM98e/O7GTr/A+Vc29Oo2ix16JbBWoUMVOw
         7PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OYohcQP098ylvBYISkee6mm40H7Iz7E4qk9gVli2edU=;
        b=JRVRBfatbMZawTAAvQpCpK3EkJdIpG0aia9vySvSl+GtJlWAtUGKlrOnp+qxoS8LhX
         SUXCk17vnY7ljE2jA8td2mhHd8qwKbQsXVnytweV7JFLQKZcyOmkK4YU+8/QVTdep7JF
         d8qlVoQFxN8vR7LagJcj5uaOY8SscanmYTuV4SCMc0RQZSRnKAlV9iH/pCk5aebAny0D
         lpJgFbMwcYt8DKpolcwR4wAb6Z53BOVfNmuUYH0OnuxxYfr/lsPDw2/p7+fDs9gRbAZt
         ZhuxyACV3Dletv9koPAiyfCmiBz8zY1nzkeHb2bLu09MYJ8Tu3A6XT5kLOBQtn9mOLrs
         UglA==
X-Gm-Message-State: AOAM5313hKCz6cj85FBNyE4YrMOvKpqNgH6uMMIkSVtyoSons6YZ607Y
        TESnyX4YT2G132chUoUiwA1H/g==
X-Google-Smtp-Source: ABdhPJyw+lA5KBgYAes6cikhFdSosDtOcl6zRLvK1AJiOWPdXkJeWMvILDdxySvNLQKwzZhq/81C6g==
X-Received: by 2002:a4a:5857:: with SMTP id f84mr18792335oob.34.1606018875244;
        Sat, 21 Nov 2020 20:21:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q132sm4794180oia.46.2020.11.21.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 20:21:14 -0800 (PST)
Date:   Sat, 21 Nov 2020 22:21:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Taniya Das <tdas@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] clk: qcom: camcc-sc7180: Use runtime PM ops instead of
 clk ones
Message-ID: <20201122042112.GF95182@builder.lan>
References: <20201114174408.579047-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114174408.579047-1-sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 14 Nov 11:44 CST 2020, Stephen Boyd wrote:

> Let's call pm_runtime_get() here instead of calling the PM clk APIs
> directly. This avoids a compilation problem on CONFIG_PM=n where the
> pm_clk_runtime_{resume,suspend}() functions don't exist and covers the
> intent, i.e. enable the clks for this device so we can program PLL
> settings.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/camcc-sc7180.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index f51bf5b6decc..dbac5651ab85 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -1669,16 +1669,14 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  		goto disable_pm_runtime;
>  	}
>  
> -	ret = pm_clk_runtime_resume(&pdev->dev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "pm runtime resume failed\n");
> +	ret = pm_runtime_get(&pdev->dev);
> +	if (ret)
>  		goto destroy_pm_clk;
> -	}
>  
>  	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
>  	if (IS_ERR(regmap)) {
>  		ret = PTR_ERR(regmap);
> -		pm_clk_runtime_suspend(&pdev->dev);
> +		pm_runtime_put(&pdev->dev);
>  		goto destroy_pm_clk;
>  	}
>  
> @@ -1688,9 +1686,7 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>  
>  	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
> -
> -	pm_clk_runtime_suspend(&pdev->dev);
> -
> +	pm_runtime_put(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
>  		goto destroy_pm_clk;
> -- 
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
> 
