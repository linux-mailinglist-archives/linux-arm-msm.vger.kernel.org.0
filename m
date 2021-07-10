Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F9F3C32FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 07:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbhGJFUW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 01:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhGJFUV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 01:20:21 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04901C0613E8
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 22:17:36 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id j65so8967993oih.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 22:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l/AK4cFCkpdPaQEuLimUoJPLn9urUKT/MvatgQ4k6nU=;
        b=LF/9QPAObWQEXCY2LF9mWC8sAkwGKgi707gou9lTdt917sxoibuzpo50glpkjUlLJI
         GN554BrmXIRUsUjDXnaA1q5R5zoWG2JxzVWnZ2JiHgiy7j9dPAqPnyzlJB/Z/hinLoth
         22/HdfBzslj97LfZQ7XC0rLBPdh6Bc2b6AmNllLl80BprpmWT9G4lL/jh7xymW4IdWXB
         JFwFrGWScAfknv3DLJPc/7XdSh8M3jha+iZdIVxl3of34A3N/LTejw5qU1pueIJSfZ26
         EgDu2jBDVaY2mc2OhoINlCOnLmYqMEeEigpbSvycKvne5OlN2eArtlN8xSjco0GMqRCG
         Wy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l/AK4cFCkpdPaQEuLimUoJPLn9urUKT/MvatgQ4k6nU=;
        b=Qc0/y1rfITE9lUT6uQDYFrm9YHOsJBwhoRXq8HkNa/fPFFUwWWgaKsUNXp5ecgwvJN
         KoNRcuD6VJ0/3fj0/s/OVn7DtBDiPH/fWm6rBZxjbe2G5TTtUJxDBJSIi2JDP9zFHKs2
         SIUPJYXrVkxFzJfywt2a44Bq7NdquIg8C4FV75CDfhEZSgHJ//7pKLUTDFV2suK+7dpS
         A3SfnRsm4sLJe6dlP/H5eLpSk+Tyejx4g0zDKyFR0UQyvCkq3Hd5Jlf2TbaRDBUp5JeS
         Sf380zj10uqdOLNSiI086jva+QnzIqelDComE7u549s9iPMxtWQdSLg5aNA+NDg3GaKb
         c1QQ==
X-Gm-Message-State: AOAM532pOpkNGUSoOzVRcj6ebT58iIlUQlWMKKY/Ng2xxFWkP9UMSZYb
        qniqSup+BPdLzTLefRIUzvzZ/g==
X-Google-Smtp-Source: ABdhPJxDfXQp7GsJDicje9t4N5mfGorO2kNMjHZcqhSpTKOrTERHm7C9BNYQZB29Hl0vcrMnZJUD8Q==
X-Received: by 2002:a05:6808:68f:: with SMTP id k15mr1895527oig.58.1625894256291;
        Fri, 09 Jul 2021 22:17:36 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c25sm1639247otn.47.2021.07.09.22.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 22:17:35 -0700 (PDT)
Date:   Sat, 10 Jul 2021 00:17:33 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: a53pll/mux: Use unique clock name
Message-ID: <YOktbWmMKEw7g3+E@yoga>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
 <20210704024032.11559-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210704024032.11559-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 03 Jul 21:40 CDT 2021, Shawn Guo wrote:

> Different from MSM8916 which has only one a53pll/mux clock, MSM8939 gets
> three for Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache
> Coherent Interconnect).  That said, a53pll/mux clock needs to be named
> uniquely.  Append @unit-address of device node to the clock name, so
> that a53pll/mux will be named like below on MSM8939.
> 
>   a53pll@b016000
>   a53pll@b116000
>   a53pll@b1d0000
> 
>   a53mux@b1d1000
>   a53mux@b011000
>   a53mux@b111000
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/clk/qcom/a53-pll.c      | 8 +++++++-
>  drivers/clk/qcom/apcs-msm8916.c | 8 +++++++-
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index d6756bd777ce..96a118be912d 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -37,6 +37,7 @@ static const struct regmap_config a53pll_regmap_config = {
>  static int qcom_a53pll_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
>  	struct regmap *regmap;
>  	struct resource *res;
>  	struct clk_pll *pll;
> @@ -66,7 +67,12 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
>  	pll->status_bit = 16;
>  	pll->freq_tbl = a53pll_freq;
>  
> -	init.name = "a53pll";
> +	/* Use an unique name by appending @unit-address */
> +	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53pll%s",
> +				   strchrnul(np->full_name, '@'));

While the result is nice, this isn't...

Is your dev_name() reasonable? What about "%s:a53pll", dev_name(dev) ?

Regards,
Bjorn

> +	if (!init.name)
> +		return -ENOMEM;
> +
>  	init.parent_names = (const char *[]){ "xo" };
>  	init.num_parents = 1;
>  	init.ops = &clk_pll_sr2_ops;
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index d7ac6d6b15b6..89e0730810ac 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -46,6 +46,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device *parent = dev->parent;
> +	struct device_node *np = parent->of_node;
>  	struct clk_regmap_mux_div *a53cc;
>  	struct regmap *regmap;
>  	struct clk_init_data init = { };
> @@ -61,7 +62,12 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	if (!a53cc)
>  		return -ENOMEM;
>  
> -	init.name = "a53mux";
> +	/* Use an unique name by appending parent's @unit-address */
> +	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53mux%s",
> +				   strchrnul(np->full_name, '@'));
> +	if (!init.name)
> +		return -ENOMEM;
> +
>  	init.parent_data = pdata;
>  	init.num_parents = ARRAY_SIZE(pdata);
>  	init.ops = &clk_regmap_mux_div_ops;
> -- 
> 2.17.1
> 
