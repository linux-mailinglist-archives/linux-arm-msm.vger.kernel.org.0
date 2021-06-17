Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9163AAE42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 09:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhFQIBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 04:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhFQIBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 04:01:08 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B599C061760
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 00:58:59 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id u190so472417pgd.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNu6HaeL5nahbHeNWRpYtmzxyhbr1PCpcEAdU1n7Ml4=;
        b=WXMADGzfWuZUokmX7qH1Wt/igrX9l7ELcu1892oN6yx1WfV3yng9W+FZVtBPX4xS6p
         TNxTOX2rCVvXG843gFX0yqBYJ6qIFQX0uuBynqEZe+yf6thS/Cru9h/YwkVEj0b8g2Fv
         itDa97dNOXm+1GD8t9NEkk9ztFqPPUogTYxSG4lx+LHXn6uT09Fnk51+iQsurqjPvB0J
         nXSy8bkUVtN/tgezW5szoM1cW2GldgjU2I+rL3Jet7zIcnhth0ONbWIeioET3QXqJxpc
         UA4TQLPCb290UM5VkbgcAslILqZfiBx40YzBCiV2+H+KlnObzV2bHcxU1TFmrEyl+wbV
         Vuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNu6HaeL5nahbHeNWRpYtmzxyhbr1PCpcEAdU1n7Ml4=;
        b=OWcOVAN0Nnq8Schpifk5WCwPCxsOA05cQiJTtwHVoAfcVckEXfNxJdAx8Eq20L14vC
         8lyjAK3xLko3M6xhu0wNgQXBgsLOKKvSY0c4bCI7UgGm6XAXGyOS9Votq6wBrjWkvr5z
         EzNTd7kHE0d+djRyHm0bvoT7WK8rGR+e6yioFviOpsJT+HkU+z4LDxX6/dnd1U2yyxXP
         Fbc6y0CVEYLcCO6d636pUWEA4uryUNPiWFqf3TgQl/GcFrodyPiRMTQFGI/58llcWibF
         FN+crRgXKw8pRyCuTXOR/eaMDklidowXtHs6K9h+aq96B5eTIf89ah/kZFGlPH86nf3L
         Gi0A==
X-Gm-Message-State: AOAM533wfKq405YvZitz07S3z5PP1t0BEWFcjyl3p7nTUBgYxGT9KPsV
        WtmetQ6COLweqCLQNiYXav+Fxo+MNmterBAPIqaodg==
X-Google-Smtp-Source: ABdhPJzS968MwriJjtB8A4o5jf5U7wGm+srfciMOwtBfxiJR4VBaTGHofICzjBGjNv61Ss4Qaq23msGUlKDxn7Vu/EE=
X-Received: by 2002:a63:d47:: with SMTP id 7mr3778974pgn.339.1623916738949;
 Thu, 17 Jun 2021 00:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org> <780fd0b4-fffc-5afb-e546-86ba75bad9f9@somainline.org>
In-Reply-To: <780fd0b4-fffc-5afb-e546-86ba75bad9f9@somainline.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 17 Jun 2021 09:58:47 +0200
Message-ID: <CAG3jFytEYSpUB3nUO2JScqtUGQ_JYLmeA53FOLC6wKA3+ZZe5A@mail.gmail.com>
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Taniya Das <tdas@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Vinod Koul <vinod.koul@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Jun 2021 at 17:33, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
>
> On 16.06.2021 16:10, Robert Foss wrote:
> > These changes are ported from the downstream driver, and are used on SM8350
> > for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-rcg.h  | 4 ++++
> >  drivers/clk/qcom/clk-rcg2.c | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > index 99efcc7f8d88..a1f05281d950 100644
> > --- a/drivers/clk/qcom/clk-rcg.h
> > +++ b/drivers/clk/qcom/clk-rcg.h
> > @@ -149,6 +149,10 @@ struct clk_rcg2 {
> >       const struct freq_tbl   *freq_tbl;
> >       struct clk_regmap       clkr;
> >       u8                      cfg_off;
> > +     u8                      flags;
> > +#define FORCE_ENABLE_RCG     BIT(0)
> > +#define HW_CLK_CTRL_MODE     BIT(1)
> > +#define DFS_SUPPORT          BIT(2)
> >  };
> >
> >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> > index 42f13a2d1cc1..ed2c9b6659cc 100644
> > --- a/drivers/clk/qcom/clk-rcg2.c
> > +++ b/drivers/clk/qcom/clk-rcg2.c
> > @@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
> >       cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> >       if (rcg->mnd_width && f->n && (f->m != f->n))
> >               cfg |= CFG_MODE_DUAL_EDGE;
> > +     if (rcg->flags & HW_CLK_CTRL_MODE)
> > +             cfg |= CFG_HW_CLK_CTRL_MASK;
> > +
> >       return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
> >                                       mask, cfg);
> >  }
>
> What about code for handling other flags? If it's not a part of the series,
>
> I don't think it makes sense to define them. Or perhaps you sent the
>
> wrong revision?

I opted to add all of the flags just to document them existing, but
only introducing the ones that will immediately be used is the better
way to go.
