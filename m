Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70ED33B7350
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 15:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233999AbhF2Njk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbhF2Nje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 09:39:34 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B282C061768
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 06:37:06 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id e20so18550519pgg.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=28cl+bnywA6mqVAuFBWS4+DC1xuc9Ad1sU1g3enyY68=;
        b=tl9PRIOlLaANqKjBqj1YyHJxzRrO+cwrBt+A0Hs89S5FdinhSuCCFpirzfGtEypVD/
         X+4BF6To63r3yCHh20IBNtz/IEWoRwwpFn6v0akYlhLRy9jSeoHZOuRxMdyF31zvcf44
         c/ln02ptAqH1W5oR/aXqrJTzv706amVkWEPakHjEfn3Lv42yerEEi35z51kv1MVHI7Eu
         tx3bQ1UtvRhGXMt1vEYpIlIVCXnO8bfG8mmkVflfzMtdiXcVSOKs7diV7k/B7+9JN51L
         YOSxFgt4IIF0nwS87kY1TYCz/OPuzqAdhBG/NtqbPjN6TlWEpEPQEkxGbqc7qw2zUfri
         c7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=28cl+bnywA6mqVAuFBWS4+DC1xuc9Ad1sU1g3enyY68=;
        b=D0XOFEcq7Up0gfAHzLfIP6swNkNkDWkO/9ygBtFFEgaqEnKr5IQQkpwhiY6jG7Z1Q6
         0F9Vp8upFbUKUMvee8qZ6HFU7Z+/2lk5Q2hi0nJy3FNgGBpQyGH588AWytq7iTE9ZPBP
         UcNa2PYT7d2JUH5P8RDXQcNxJ46egySUfrUiikPFhRNcv+TNb0awNWoRJg/FVgj7dnT/
         lnsIfecuttYNMarONjx36/5QDhfIiYe30jqkTufzZupCijD4LbFFtjlNvl9d/pX1birp
         afd6xWM1q9uW9v8jNLjjRy1za1X364KTleRwvXqz8ykPrZWm+DK/EYmSQmNeUr0BD9PN
         K7Sg==
X-Gm-Message-State: AOAM531QeX3UbM8cf78RvACp1a+p/oA2JqHA2+6ug3Gq/Qx8NlK5fx98
        lLWnySIYOORtJCdTx/WYW1AApQ==
X-Google-Smtp-Source: ABdhPJwIBnAsS1nw+GVh0TDVAwqpGC1ylXLRdSOya/DS07KIGiWDdVqLV6Kimp10EWjeGl4hNnRAmA==
X-Received: by 2002:a62:d14b:0:b029:300:5e03:8e14 with SMTP id t11-20020a62d14b0000b02903005e038e14mr30288700pfl.21.1624973826085;
        Tue, 29 Jun 2021 06:37:06 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id w20sm20759021pff.90.2021.06.29.06.37.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 06:37:05 -0700 (PDT)
Date:   Tue, 29 Jun 2021 21:36:59 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
Message-ID: <20210629133658.GB32336@dragon>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-4-shawn.guo@linaro.org>
 <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 27, 2021 at 05:28:34PM -0700, Stephen Boyd wrote:
> Quoting Shawn Guo (2021-05-03 22:28:42)
> > Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
> > Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
> > Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
> > retrieve the name from DT, so that multiple APCS clocks can be
> > registered.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/clk/qcom/a53-pll.c      | 5 ++++-
> >  drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> > index 8614b0b0e82c..964f5ab7d02f 100644
> > --- a/drivers/clk/qcom/a53-pll.c
> > +++ b/drivers/clk/qcom/a53-pll.c
> > @@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> >         struct clk_pll *pll;
> >         void __iomem *base;
> >         struct clk_init_data init = { };
> > +       const char *clk_name = NULL;
> >         int ret;
> >  
> >         pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> > @@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> >         pll->status_bit = 16;
> >         pll->freq_tbl = a53pll_freq;
> >  
> > -       init.name = "a53pll";
> > +       of_property_read_string(pdev->dev.of_node, "clock-output-names",
> > +                               &clk_name);
> 
> Please no? Is there any use for this? Why not just generate the name as
> a53pll@<MMIO ADDRESS>?

There is no other use for this than getting different names.  I will do
what you suggest here.  Thanks!

Shawn

> 
> > +       init.name = clk_name ? clk_name : "a53pll";
> >         init.parent_names = (const char *[]){ "xo" };
> >         init.num_parents = 1;
> >         init.ops = &clk_pll_sr2_ops;
