Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60BE65980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 16:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfGKO5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 10:57:35 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40808 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728736AbfGKO5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 10:57:34 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so3168088pla.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 07:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1/51w3laLLHPJ0Jx8O5jQMFKbvaBG/KhA0i4QusfUus=;
        b=NUlVnSN1ZMozKzTTGTTf+dnmZy+oc7h+fkpA9vhU47HxFHvlVDPSulkA1Se+YW0lul
         a2Hl+Y+UF18CpnIowTxwNNiel7ZRfnqqs8kywkv/NBUopy1XvcOOZJMB3iAT0EXbtseS
         VAzcoF4h8N7Q9r6KXfZdvxPjGp0UjEV+v3L3IgsHLIyiRi7CrwchE/rsxF593RlIxYHi
         3wiwOvkX6fhJh2rotOBUo9vVg2/Xyp0lUMABQezBmPnrFbCPGRndV2BOmlH/aWDp57+s
         gfmEyQlNCfGHDvidcClyVlOqb9FZMYOAicIGBfnKPPwvWhttN9JYVRiE24tySch7kg15
         oZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1/51w3laLLHPJ0Jx8O5jQMFKbvaBG/KhA0i4QusfUus=;
        b=hdlYYRDrNueX7D9+HmyiDyE5X54b3HLLnQoKEwFWntNVoylWJZo/pQztjSGXEWXIro
         /dlLuYN15FEHyfEr4GUA7TbvSOhJX6fWfPa4yRx+xNklnWNHvPqq8dwo52XUmrNx255r
         Ywkmsp3znORNuPpOJjMU0pXYV2SgxAHNuvvL9uXN5PhVWMpmZkLo53LYGxfhBRgnvI7q
         MdYTuHzlsjC7tSDr0UBcByStny4O3KHjkiihGL8emLd/8UbmmK3A2Z+u0y7HSnS/OW2b
         jgS2MOc6v/oXD3WWMo1uLeBBgsFYKfdsTgT8dwnpfSYDBmldxE/diuKWm9/grWcNY0Jv
         jdBQ==
X-Gm-Message-State: APjAAAVwYOl6JFp1JgQIrJ5uMnwxilXSdquT5hUmYHbPuAv6pr4nHEmF
        7BKETR2KdFhe3AnGo8g/94Q4qw==
X-Google-Smtp-Source: APXvYqz9ilITyyaY2+RDyr6nQhrALzPWqIjNUnMLGWpxZ53G74RZ+C2rjf+qUux7JInSF+mZPbR+/g==
X-Received: by 2002:a17:902:848b:: with SMTP id c11mr5083756plo.217.1562857053720;
        Thu, 11 Jul 2019 07:57:33 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x13sm6878242pfn.6.2019.07.11.07.57.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 07:57:33 -0700 (PDT)
Date:   Thu, 11 Jul 2019 07:58:38 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 05/14] clk: qcom: apcs-msm8916: get parent clock names
 from DT
Message-ID: <20190711145838.GF7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-6-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-6-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Allow accessing the parent clock names required for the driver
> operation by using the device tree node.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> For backwards compatibility leave previous values as default.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/clk/qcom/apcs-msm8916.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index a6c89a310b18..dd82eb1e5202 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -19,7 +19,7 @@
>  
>  static const u32 gpll0_a53cc_map[] = { 4, 5 };
>  
> -static const char * const gpll0_a53cc[] = {
> +static const char *gpll0_a53cc[] = {
>  	"gpll0_vote",
>  	"a53pll",
>  };
> @@ -50,6 +50,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	struct regmap *regmap;
>  	struct clk_init_data init = { };
>  	int ret = -ENODEV;
> +	const char *parents[2];
> +	int pll_index = 0;
>  
>  	regmap = dev_get_regmap(parent, NULL);
>  	if (!regmap) {
> @@ -61,6 +63,16 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	if (!a53cc)
>  		return -ENOMEM;
>  
> +	/* legacy bindings only defined the pll parent clock (index = 0) with no
> +	 * name; when both of the parents are specified in the bindings, the
> +	 * pll is the second one (index = 1).
> +	 */
> +	if (of_clk_parent_fill(parent->of_node, parents, 2) == 2) {
> +		gpll0_a53cc[0] = parents[0];
> +		gpll0_a53cc[1] = parents[1];
> +		pll_index = 1;
> +	}
> +
>  	init.name = "a53mux";
>  	init.parent_names = gpll0_a53cc;
>  	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> @@ -76,10 +88,11 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	a53cc->src_shift = 8;
>  	a53cc->parent_map = gpll0_a53cc_map;
>  
> -	a53cc->pclk = devm_clk_get(parent, NULL);
> +	a53cc->pclk = of_clk_get(parent->of_node, pll_index);
>  	if (IS_ERR(a53cc->pclk)) {
>  		ret = PTR_ERR(a53cc->pclk);
> -		dev_err(dev, "failed to get clk: %d\n", ret);
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(dev, "failed to get clk: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -87,6 +100,7 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  	ret = clk_notifier_register(a53cc->pclk, &a53cc->clk_nb);
>  	if (ret) {
>  		dev_err(dev, "failed to register clock notifier: %d\n", ret);
> +		clk_put(a53cc->pclk);
>  		return ret;
>  	}
>  
> @@ -109,6 +123,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  
>  err:
>  	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	clk_put(a53cc->pclk);
> +
>  	return ret;
>  }
>  
> @@ -117,6 +133,7 @@ static int qcom_apcs_msm8916_clk_remove(struct platform_device *pdev)
>  	struct clk_regmap_mux_div *a53cc = platform_get_drvdata(pdev);
>  
>  	clk_notifier_unregister(a53cc->pclk, &a53cc->clk_nb);
> +	clk_put(a53cc->pclk);
>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
