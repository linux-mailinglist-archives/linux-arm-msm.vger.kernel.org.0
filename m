Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CC63B7977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 22:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbhF2UmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 16:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbhF2UmN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 16:42:13 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE44C061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:39:45 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t80so273017oie.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 13:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bHddO/QM0iBUUJG/eDz9WSZlY+Cpxj6WFmJHdChpqfY=;
        b=QzKS1B+4sCZxX3sEzYBETg4ur41+1DDZA4SRvGUR+KqZtSmJ0/puN4dXCrN91tlX6J
         XWjytLnndLI+1fGOwI4Efa3+d+UIt/POij/Y9NN9K3d0Q0G0V4Wls+F5rFtMo8EFwXF2
         /LStm9XkcuUDtB0ascRRr42Saa+hMdzypZj1ikLd/M3l8IQ06fMitokoWxsI7JzFs+fh
         ojtHZ2Du13Z/3F9ptzhtxFQBsR8AmhQznLG3tWBUU58+0JDLj+kPJ1gYZWIOXpWspt3C
         CrMkbC5l+92EzaduUYtm/QWYvZykGW3nJruueRBU439oyUoSj46hbgGe5LedCjQ/odKJ
         9XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHddO/QM0iBUUJG/eDz9WSZlY+Cpxj6WFmJHdChpqfY=;
        b=TX0Md0R3PL25+9WfYchlbbhq2BgGuyzpjQDQMN6+lHQK2VFLRypMJUXljqhUtvrk3p
         xXGKZZRg6KLjkVnoQbYuLLampvGWID4XEpwsVdO1h449gdnnWJxukD2dkUvn1jcrUrvH
         /AuUdpItRdbSb/H+xS53d/sK3x7b7oTOAUdQxNsICiwQe00+kTBSqZMLCzstk+BPWXon
         z+9k2vWUaqdOWJ52ywn4R6n5oaJNeAcVNPCug8tWtQCJL3o3awLKJAv5SD/RBZVVckwo
         qEDSJHWRwhxMSBR6DkzTwGGc24c9eIBY47N0kIElJ6Q5dCBr/R28kOSoURP4eUuQ/1Dp
         1hrA==
X-Gm-Message-State: AOAM532DyOmn+vxmFe45T2A1i1A/BFlwtlwrrsiEeCkrztSgYwpNmot+
        /zHOmnT+5muRDP1y6DXmrO/KwZZqbHDl+w==
X-Google-Smtp-Source: ABdhPJwa2ryFrYEPx6z/eErqyDWaKgfcou8UjBW0W+07JYnkCWiOaRRyeikE5ttSXSnOo9lrpVABSg==
X-Received: by 2002:a05:6808:683:: with SMTP id k3mr20175849oig.171.1624999184818;
        Tue, 29 Jun 2021 13:39:44 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x17sm2365229otp.48.2021.06.29.13.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 13:39:44 -0700 (PDT)
Date:   Tue, 29 Jun 2021 15:39:42 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: apcs-msm8916: Retrieve clock name from DT
Message-ID: <YNuFDvJcxJgr/Dz9@yoga>
References: <20210504052844.21096-1-shawn.guo@linaro.org>
 <20210504052844.21096-4-shawn.guo@linaro.org>
 <162484011476.3259633.10138087900669024498@swboyd.mtv.corp.google.com>
 <20210629133658.GB32336@dragon>
 <YNtC6YSt1r+hbhPV@yoga>
 <162499823407.3331010.7870226601450224516@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162499823407.3331010.7870226601450224516@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 29 Jun 15:23 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-06-29 08:57:29)
> > On Tue 29 Jun 08:36 CDT 2021, Shawn Guo wrote:
> > 
> > > On Sun, Jun 27, 2021 at 05:28:34PM -0700, Stephen Boyd wrote:
> > > > Quoting Shawn Guo (2021-05-03 22:28:42)
> > > > > Unlike MSM8916 which has only one APCS clock, MSM8939 gets three for
> > > > > Cluster0 (little cores), Cluster1 (big cores) and CCI (Cache Coherent
> > > > > Interconnect).  Instead of hard coding APCS (and A53PLL) clock name,
> > > > > retrieve the name from DT, so that multiple APCS clocks can be
> > > > > registered.
> > > > > 
> > > > > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > > > > ---
> > > > >  drivers/clk/qcom/a53-pll.c      | 5 ++++-
> > > > >  drivers/clk/qcom/apcs-msm8916.c | 5 ++++-
> > > > >  2 files changed, 8 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> > > > > index 8614b0b0e82c..964f5ab7d02f 100644
> > > > > --- a/drivers/clk/qcom/a53-pll.c
> > > > > +++ b/drivers/clk/qcom/a53-pll.c
> > > > > @@ -42,6 +42,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> > > > >         struct clk_pll *pll;
> > > > >         void __iomem *base;
> > > > >         struct clk_init_data init = { };
> > > > > +       const char *clk_name = NULL;
> > > > >         int ret;
> > > > >  
> > > > >         pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> > > > > @@ -66,7 +67,9 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
> > > > >         pll->status_bit = 16;
> > > > >         pll->freq_tbl = a53pll_freq;
> > > > >  
> > > > > -       init.name = "a53pll";
> > > > > +       of_property_read_string(pdev->dev.of_node, "clock-output-names",
> > > > > +                               &clk_name);
> > > > 
> > > > Please no? Is there any use for this? Why not just generate the name as
> > > > a53pll@<MMIO ADDRESS>?
> > > 
> > > There is no other use for this than getting different names.  I will do
> > > what you suggest here.  Thanks!
> > > 
> > 
> > I have exactly the same problem with my two DP PHYs (in
> > phy_dp_clks_register()), so I'm in favor of us setting some sort of
> > standard for this (not for anyone to rely on, but to avoid everyone
> > coming up with their own scheme).
> > 
> > But unfortunately I don't have easy access to the phy block's base
> > address in phy_dp_clks_register().
> 
> It really doesn't matter what name you use as it's basically only for
> debugging. The problem is uniqueness. I've wondered if leaving the name
> as NULL and then passing in a dev would be sufficient to generate a clk
> name at runtime. Basically dev_name() plus an incrementing global
> numberspace would probably work fine. Debugging would be annoying in
> that case, but maybe it wouldn't matter.

Something like "%s:link" and "%s:vco_div" based on dev_name() would be
quite nice in the case of DP. Probably more enjoyable to read than
dev_name():N and dev_name():N+1.

It comes with a cost of a few extra lines of code in each driver, but if
it's only a few drivers I don't think it warrants the extra logic in the
core.

Regards,
Bjorn
