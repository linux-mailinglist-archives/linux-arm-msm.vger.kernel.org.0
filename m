Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7761B3B7609
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 17:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233953AbhF2QAA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 12:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhF2P77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 11:59:59 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EE5C061760
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:57:32 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w127so26784166oig.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 08:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hj/XUjWbzTW7RStndYxpSKqLyu9uKSKAbDqkypsguQ4=;
        b=l/WRjXuvuJNNRElCjnA7o2qUgHbhd7H0bm3NElGnIOOPTAykkU4ro1O66pPoRbQ2DN
         Ml0MO/Vr7UFddGTCwqUNQCSw9+JvfF+Qv5u6EpE+m6tXSlOkcikwPEWszIGeZvXPeNeK
         72zhJ7xYbC52crinVmipYiPQQHxpWG9GuPiDSdlWbMYiIhFutkBLo8j12nscrGnLY2Ok
         u+EHFHfRtiKr1mBYUMxOruASSalRhsr8C0YrKtZuClEloTVn1icvILoT4UNKos5zMB89
         I/AZzusRarFwxMNVePxq97ZuPTYJ14wJazh/0OrQyLRJkQ3dWqkjCzh0ws2ioSvrIAUD
         aUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hj/XUjWbzTW7RStndYxpSKqLyu9uKSKAbDqkypsguQ4=;
        b=XQpXwc84zQFpaWVVdNeFnHEmfwVW2LjXpFhGASLUKgiSbRNTrwsuYOPCzdfwMhj7ut
         pCF0XxOQNgFyudwClOPv2+3k5JyBTCC3UR53Umy1m979qsz77/I3vsWafuign3I+iBie
         oSYWlL2NYWRGHCc6aK9xhcjrk5s9qECgHlKxgbWJD2wYj9Clol8lM4BuACRM3HTBUzcs
         JW/bGQspgS9rBuC9i5Tf1vlTY5OJBWEnH+PbOTrlkDZh8LLW3L33om6knH0ZhPgHHyJS
         R2kAVmEpWzF1NzsdwK8du4QWh0W7A5F+bcp/rtQnO387ZzyFlgNvJ22AF4oCzWIdcvYG
         1WBA==
X-Gm-Message-State: AOAM530mZrq/q3x/6Ci3UODZ1pqTCY16JhlxJaJOH5UvG56FulG5oCOd
        2vVm3RM+C4UjjVeu4iqu7Itj7Q==
X-Google-Smtp-Source: ABdhPJw0n+3tKh6we1aP3+vNEQELk+n84iD7vZ06rs2Wf0rwdTzIDbeVysTjICcvzP90wRVvC8Vo6g==
X-Received: by 2002:aca:6743:: with SMTP id b3mr22322535oiy.8.1624982251692;
        Tue, 29 Jun 2021 08:57:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j30sm3647035otc.43.2021.06.29.08.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 08:57:31 -0700 (PDT)
Date:   Tue, 29 Jun 2021 10:57:29 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
Message-ID: <YNtC6YSt1r+hbhPV@yoga>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-4-shawn.guo@linaro.org>
 <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com>
 <20210629133658.GB32336@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629133658.GB32336@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 08:36 CDT 2021, Shawn Guo wrote:

> On Sun, Jun 27, 2021 at 05:28:34PM -0700, Stephen Boyd wrote:
> > Quoting Shawn Guo (2021-05-03 22:28:42)
> > > Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
> > > Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
> > > Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
> > > retrieve the name from DT, so that multiple APCS clocks can be
> > > registered.
> > > 
> > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > ---
> > >  drivers/clk/qcom/a53-pll.c      | 5 ++++-
> > >  drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
> > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> > > index 8614b0b0e82c..964f5ab7d02f 100644
> > > --- a/drivers/clk/qcom/a53-pll.c
> > > +++ b/drivers/clk/qcom/a53-pll.c
> > > @@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> > >         struct clk_pll *pll;
> > >         void __iomem *base;
> > >         struct clk_init_data init = { };
> > > +       const char *clk_name = NULL;
> > >         int ret;
> > >  
> > >         pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> > > @@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> > >         pll->status_bit = 16;
> > >         pll->freq_tbl = a53pll_freq;
> > >  
> > > -       init.name = "a53pll";
> > > +       of_property_read_string(pdev->dev.of_node, "clock-output-names",
> > > +                               &clk_name);
> > 
> > Please no? Is there any use for this? Why not just generate the name as
> > a53pll@<MMIO ADDRESS>?
> 
> There is no other use for this than getting different names.  I will do
> what you suggest here.  Thanks!
> 

I have exactly the same problem with my two DP PHYs (in
phy_dp_clks_register()), so I'm in favor of us setting some sort of
standard for this (not for anyone to rely on, but to avoid everyone
coming up with their own scheme).

But unfortunately I don't have easy access to the phy block's base
address in phy_dp_clks_register().

Regards,
Bjorn

> Shawn
> 
> > 
> > > +       init.name = clk_name ? clk_name : "a53pll";
> > >         init.parent_names = (const char *[]){ "xo" };
> > >         init.num_parents = 1;
> > >         init.ops = &clk_pll_sr2_ops;
