Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261953C3382
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 09:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231470AbhGJHhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 03:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbhGJHhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 03:37:45 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D0E1C0613E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 00:35:00 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so9561038pjs.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iynl3OeXRI21z/39nujP5vnmSQx6hJ+4+BEhv+0X4uw=;
        b=DW31LtAIJrZPDYhbwsY3bsU2q9Qym7WtZc5JhMpiI8o4lNCa6845d/kNKJcyLRaZU3
         ZqZ9J3ZQrOaHzgOXAJ2DYRXOeK6kM3659Ms3/E2q1eADTZ00an1u8MnATaExURzM0Y6F
         oZIx14GxoLkUowDapGpGPamQVhrepOPyM3fNXrYJtf9n+1ZF9XSyXtSpwcxQkCj+VCf1
         XwCbhkDt1bCipkezhOsbA6e7NnorC10ZM/lySmrVIvmNHk6LmhNCupYvalErRtotn2IR
         hdE5oL1nCcfrsI3LZXuOITxv+2jl8FBrB+5oxOaROyXIZo3M4tB0dO8tep4X4avaJ39s
         r8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iynl3OeXRI21z/39nujP5vnmSQx6hJ+4+BEhv+0X4uw=;
        b=kdUichnHzN6ouhEViMI/9/NkWrrSpxH3W7LHCtf2svGaeqUi7f+hJ/V+5ikasgSgYS
         Vix3DhOBIdQJSHPoPckNcox8W69IV7X3i40j2FLq4arbt8QnHiN6ppWX6nMs/6A4t8Cj
         1i94XoF/3QyOu4sZziNmj7vw/ZPQ36iELCDlrcBbSFB8bzG9oMNGwc55nAd5b6CULdYm
         28RICt3v+keUxnm84dqJnpEcWleQdz8T3Z7KUEk0PbFesbe2FBGQ26xenTQazgnqs9Ol
         XFZr1Di2kpXV7+B7/d1qca/JsgmA/Yyk+sXXNKfHQxSkPBcvQZCk+FT0b5a2C8WPu2pD
         iHRQ==
X-Gm-Message-State: AOAM532UNdKQLvcpZy6GQDQ2BZTvu+acfWmHjHMcjTRwQ4zBp5jmXmrx
        pCeo0yJEwFsavVWiadcyfJWhuw==
X-Google-Smtp-Source: ABdhPJx8PAr5ZkGw9W2QZH6I91NNx14iNZmxRo5HT34g/1spJSCl+PSMfWAEeI1ef6bUDsPNplfArw==
X-Received: by 2002:a17:90a:c283:: with SMTP id f3mr8311181pjt.138.1625902499861;
        Sat, 10 Jul 2021 00:34:59 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id n23sm7316974pjq.2.2021.07.10.00.34.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Jul 2021 00:34:59 -0700 (PDT)
Date:   Sat, 10 Jul 2021 15:34:53 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: a53pll/mux: Use unique clock name
Message-ID: <20210710073449.GC11342@dragon>
References: <20210704024032.11559-1-shawn.guo@linaro.org>
 <20210704024032.11559-3-shawn.guo@linaro.org>
 <YOktbWmMKEw7g3+E@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOktbWmMKEw7g3+E@yoga>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 10, 2021 at 12:17:33AM -0500, Bjorn Andersson wrote:
> On Sat 03 Jul 21:40 CDT 2021, Shawn Guo wrote:
> 
> > Different from MSM8916 which has only one a53pll/mux clock, MSM8939 gets
> > three for Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache
> > Coherent Interconnect).  That said, a53pll/mux clock needs to be named
> > uniquely.  Append @unit-address of device node to the clock name, so
> > that a53pll/mux will be named like below on MSM8939.
> > 
> >   a53pll@b016000
> >   a53pll@b116000
> >   a53pll@b1d0000
> > 
> >   a53mux@b1d1000
> >   a53mux@b011000
> >   a53mux@b111000
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/clk/qcom/a53-pll.c      | 8 +++++++-
> >  drivers/clk/qcom/apcs-msm8916.c | 8 +++++++-
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> > index d6756bd777ce..96a118be912d 100644
> > --- a/drivers/clk/qcom/a53-pll.c
> > +++ b/drivers/clk/qcom/a53-pll.c
> > @@ -37,6 +37,7 @@ static const struct regmap_config a53pll_regmap_config = {
> >  static int qcom_a53pll_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > +	struct device_node *np = dev->of_node;
> >  	struct regmap *regmap;
> >  	struct resource *res;
> >  	struct clk_pll *pll;
> > @@ -66,7 +67,12 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> >  	pll->status_bit = 16;
> >  	pll->freq_tbl = a53pll_freq;
> >  
> > -	init.name = "a53pll";
> > +	/* Use an unique name by appending @unit-address */
> > +	init.name = devm_kasprintf(dev, GFP_KERNEL, "a53pll%s",
> > +				   strchrnul(np->full_name, '@'));
> 
> While the result is nice, this isn't...
> 
> Is your dev_name() reasonable? What about "%s:a53pll", dev_name(dev) ?

dev_name() is somehow reasonable for a53pll.

  b016000.clock-controller:a53pll
  b116000.clock-controller:a53pll
  b1d0000.clock-controller:a53pll

But I prefer to the existing names, because I would like to use the same
naming schema for both a53pll and a53mux.  If using dev_name() on a53mux,
we will get the following which is less reasonable.

  qcom-apcs-msm8916-clk.1.auto:a53mux
  qcom-apcs-msm8916-clk.2.auto:a53mux
  qcom-apcs-msm8916-clk.3.auto:a53mux

Shawn

