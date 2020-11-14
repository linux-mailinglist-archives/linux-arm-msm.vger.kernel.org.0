Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0302B2FB6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 19:30:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgKNSaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 13:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgKNSaS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 13:30:18 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8D5C0613D1;
        Sat, 14 Nov 2020 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=s2/BETzhhA+FGEyKIwtMzuW1T+rRFdj0w4J0RN+5mn8=; b=xK2Ld/dx9Xttpf01RguKcwqsHn
        9lgLlOlp8c/pz4HEKNaeCEPCRY7ArQrCnFnJiB4omAvXra/Dui5EidEIa088F2mcg4oViFdT4LIJa
        Z0BsxGw1vM1uO9a+k1ukME3Q7K39cnZf+5UvSYRAujavz8lymxtKxBtaHt7p5c4FRYH7Q0C3ANrEV
        IV9w0ACBhwzFD+SeZ0tm/OZBDPptqdXpI9dIzq66kNsrKM+1LrpzXQSmpFdcJf4awsXxQTeWcgxTy
        i4A5UkUbDajFzlbzsOjfYbeJD2QYuOj93ttbL8j6q98ENHH65uUffSTtVJ0fZC9Yrs9C/IiGP9yvx
        M3XTbx8g==;
Received: from [2601:1c0:6280:3f0::f32]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ke0JL-0000Sr-NL; Sat, 14 Nov 2020 18:30:08 +0000
Subject: Re: [PATCH] clk: qcom: camcc-sc7180: Use runtime PM ops instead of
 clk ones
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Taniya Das <tdas@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20201114174408.579047-1-sboyd@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <79da0ec7-425a-40e9-2101-b55568b3187c@infradead.org>
Date:   Sat, 14 Nov 2020 10:30:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201114174408.579047-1-sboyd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/14/20 9:44 AM, Stephen Boyd wrote:
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

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

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
> 


-- 
~Randy
