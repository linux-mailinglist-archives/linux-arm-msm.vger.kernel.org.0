Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E463BF467
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 06:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhGHEFw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 00:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhGHEFv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 00:05:51 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4A0C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 21:03:09 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id o17-20020a9d76510000b02903eabfc221a9so4614240otl.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 21:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LI3mWvB8lqUFGvKYUXsvMTLD9MEpZDie47p/GO3vV7o=;
        b=dfDisRytYYc6d3VLj+BMhvLmtLfEklteHqskcBCPXxy4TdDU2KNo8oUc1tdtzSMU18
         0g8z9h1Yg6I82liAWNJOnBZzRLfXTOXCRNX71n521CkwN5feUYd/EjOeC26eHQ+UC79A
         KgZUVuk8RgQ7plPKn+DF+MTn8lAN28ZZSaXoOYqgANNQJmLshvBu8zNKSYUxnha0BPIk
         6XvJpq1mJT9ILgODnZ78ZhcxlhsCD/rgmwQym6Si+wDtXad0dXSIbzH+At23qZH0CrWr
         YI0853Z16xoA6bzhyaNSYUt9WGBg1PlfmjWvGpbJrIjsLtWMNiCQzsJNlpJ0p6/oCMOQ
         /G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LI3mWvB8lqUFGvKYUXsvMTLD9MEpZDie47p/GO3vV7o=;
        b=Eoql+TjkmGPsHlzU0+RP3G0WfEGjOgUI+SVXfJ5WFlpNw1Jc0+BVn5NPFm7Bgg9/IC
         ffDpi2m/9eO0UhHIrA/FYCNqdR1mI1ASTZU0bcjIoVjj9hBWd7E1Ib331VUM166S5KiT
         nEmc6zaR/xDn3L+r9CvnqvZIfn3GZJYfwHPU2JPK0z6FT88dt35hhGMcY9sWJnGBXkYL
         Cog2xOzZZ6GdtuDBUGzvfz+r7jYDTGaxO1m+Y60aZfCGM/UvJGNpG8TeWFbIbbMxRXYJ
         dvTQICamrGFHYBxcjatboERPjcbongRNesu8cCYh2RmGPerMTuJ2C+zJXoNh4y+O/Oj/
         sqTg==
X-Gm-Message-State: AOAM531Wv7zN0F0WGeBMf5OIXlwmwiwBqTthjKGfqCvG2/lt/KjwAzv+
        93uGaicpDzNO7uQnAyq1gK6ulQ==
X-Google-Smtp-Source: ABdhPJxhFdzn1V5BN2rsi6/9LciGzGQyVOAZEWx2F9EgznLWW75+n9cE4ygA1eiC1sIthtWvESEn2Q==
X-Received: by 2002:a05:6830:22d6:: with SMTP id q22mr21753964otc.40.1625716988743;
        Wed, 07 Jul 2021 21:03:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h3sm265711oti.34.2021.07.07.21.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:03:08 -0700 (PDT)
Date:   Wed, 7 Jul 2021 23:03:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator
 reference
Message-ID: <YOZ4+ptO+eQbmxal@yoga>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
 <20210708010839.692242-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708010839.692242-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 07 Jul 20:08 CDT 2021, Bryan O'Donoghue wrote:

> The current implementation omits the necessary mmcx supply, which means if
> you are running the code for this block and a prior clock driver, like say
> the videocc hasn't run, then a reset will be generated the first time we
> touch these registers.
> 
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

camcc isn't enabled in the upstream dts yet and I expect that we're
going to conclude on defining these GDSCs as subdomains of the cc's
power-domain in time for v5.15.

I don't mind if Stephen picks this to make sure the driver is
functional, but I will hold off on the dts change.

Regards,
Bjorn

> ---
>  drivers/clk/qcom/camcc-sm8250.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..c51112546bfc 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2212,6 +2212,7 @@ static struct gdsc bps_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ipe_0_gdsc = {
> @@ -2221,6 +2222,7 @@ static struct gdsc ipe_0_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc sbi_gdsc = {
> @@ -2230,6 +2232,7 @@ static struct gdsc sbi_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ife_0_gdsc = {
> @@ -2239,6 +2242,7 @@ static struct gdsc ife_0_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ife_1_gdsc = {
> @@ -2248,6 +2252,7 @@ static struct gdsc ife_1_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc titan_top_gdsc = {
> @@ -2257,6 +2262,7 @@ static struct gdsc titan_top_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *cam_cc_sm8250_clocks[] = {
> -- 
> 2.30.1
> 
