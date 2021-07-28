Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B893D9661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 22:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhG1UHw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 16:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhG1UHw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 16:07:52 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D425C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 13:07:50 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id t128so5290687oig.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 13:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=97hQfQK7XavPSltv9pN4yF2y5jNc7cIdloHZZGHQCvY=;
        b=Z7jTTKBFGpWIxboKqwgJRsOZp1J+aWDmjni8p5+XEVDRVJmY29+ni5XltyAcjXJrPd
         VKRiyGY2cxhdfvhTRdTJXxMi8S4rhnmsf7fgxGaIh3UvIFWi4IDtUyJAop5wHOt23ZWF
         4DS/rBN4kxsmc5k3UIkqOFWLnzdGHlERYnLb/rN8QlBNhMpET6iELjrDWctsQitUPXGL
         2sckHJR93BoAb3Tm7MNt5hGZ34d1TvqTBveiQqtTZfbncswKMzJrgB6ult5Anul6wbBt
         IngUJZkLp/kFIdNqQ4EVmz2DH5drGaBqdJBFNlZL/yfplvskUs3XOZoFU1YNCvGzVSnO
         EDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=97hQfQK7XavPSltv9pN4yF2y5jNc7cIdloHZZGHQCvY=;
        b=qGO0nYDv3ZRrzNW+M79AUapkItXygEDuuAeDw+yqnEe1jWpNYWyjFAcgLXhATLpePL
         89X+iBZOtgnM/8KgfbJz3up1Ugx4fRJgBNg+zBKdE4zD2lEbM6TEXwGfwRbPCURAs5l5
         Jyos5OeboNjEiL4e8ICIJaNTh2t1lSSRgoSVW+cHWhVMozg/P/KokKhil81T/s1lA7Hx
         Y37PLqV9Eeg1qZadcGjE/OOH1IjvnKjiopADr4bj2HqUy+Uo5cS1oAniqrIgxBeHJKAu
         Hldfx7XeBAnTwewogVE6adHtCBncJLvmAQmZyY5R0fiHwqSd42Tf+3HFUtHeHejQi6/Z
         a59w==
X-Gm-Message-State: AOAM532PF3+WkeWkh9zocsN67tgzQE4WNKsDWZCqd/MI7nNtwHk7SNqo
        otQrWMxMfYK9g2QyasRQ7gGQJw==
X-Google-Smtp-Source: ABdhPJwD7U8+qAvbZ4kuKnlj7p/+LPIrjaNSnetymU4fcJ2ltcIGDeO08kf0oVPEIdx8JqShaVs4sA==
X-Received: by 2002:aca:1e12:: with SMTP id m18mr7648287oic.95.1627502869900;
        Wed, 28 Jul 2021 13:07:49 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n1sm182047otk.34.2021.07.28.13.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 13:07:49 -0700 (PDT)
Date:   Wed, 28 Jul 2021 13:05:59 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/5] PM: clk: add devm_pm_clk_create helper
Message-ID: <YQG4pz/z2nBNA+tJ@ripper>
References: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
 <20210728142445.774158-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728142445.774158-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Jul 07:24 PDT 2021, Dmitry Baryshkov wrote:

> Add devm_pm_clk_create helper, devres-enabled version of the
> pm_clk_create(), which will call pm_clk_destroy at the correct time.
> 

As with path 1, please describe why this is a good thing. (I definitely
think it is, but I've been part of the discussion leading up to this
patch)

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/base/power/clock_ops.c | 17 +++++++++++++++++
>  include/linux/pm_clock.h       |  5 +++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
> index 0251f3e6e61d..4110c19c08dc 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -519,6 +519,23 @@ void pm_clk_destroy(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(pm_clk_destroy);
>  
> +static void pm_clk_destroy_action(void *data)
> +{
> +	pm_clk_destroy(data);
> +}
> +

As this is an addition to the API, it deserves some kerneldoc.

Regards,
Bjorn

> +int devm_pm_clk_create(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_clk_create);
> +
>  /**
>   * pm_clk_suspend - Disable clocks in a device's PM clock list.
>   * @dev: Device to disable the clocks for.
> diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
> index 8ddc7860e131..ada3a0ab10bf 100644
> --- a/include/linux/pm_clock.h
> +++ b/include/linux/pm_clock.h
> @@ -47,6 +47,7 @@ extern void pm_clk_remove(struct device *dev, const char *con_id);
>  extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
>  extern int pm_clk_suspend(struct device *dev);
>  extern int pm_clk_resume(struct device *dev);
> +extern int devm_pm_clk_create(struct device *dev);
>  #else
>  static inline bool pm_clk_no_clocks(struct device *dev)
>  {
> @@ -83,6 +84,10 @@ static inline void pm_clk_remove(struct device *dev, const char *con_id)
>  static inline void pm_clk_remove_clk(struct device *dev, struct clk *clk)
>  {
>  }
> +static inline int devm_pm_clk_create(struct device *dev)
> +{
> +	return -EINVAL;
> +}
>  #endif
>  
>  #ifdef CONFIG_HAVE_CLK
> -- 
> 2.30.2
> 
