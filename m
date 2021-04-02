Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16276352527
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 03:33:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhDBBdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 21:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbhDBBdL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 21:33:11 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709B0C0613E6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 18:33:09 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id g8so1956361qvx.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rmXvhNS1+k323Z8LSQfd1I6F5jgkUSmL4z9mFbMJoIY=;
        b=I/yfNAl6CtevwhHcv0+2/PMR9YurFE4VdSxzuYrNmg7OlwG3b2Oe3Y3brGd6i+ELae
         5AaswauxpJFKPxosVmCt1cuc3TErmeD3/PVap8thC0eFyggPSSNqw89Ck+mHyAWSTe2+
         OKCtY7F9KQabXhwbx/c6zO8LC5/JA/PAsAvIugVPOTpZT+xadCNkijlDhPBLA1CWuJWE
         I5JMFkFavvr5zPb2N+w6jtPjk0Mmy+2YKGZyryCOqGVwXrgy9d16Vy75HcD9BceRUnSr
         4JrZg2DrPZZU/zgqm26zPO1X9LVTfvj0WLsKozernJEh6uMh0O0aF46ceF41LXVYVi9/
         RoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rmXvhNS1+k323Z8LSQfd1I6F5jgkUSmL4z9mFbMJoIY=;
        b=RjZOw76/XsMNuTyi4nQc8ptF+kCpHxESPZ5eg0CBCq/9PmZ9/w3/7zL0xq7QDAZc3X
         tudNj++tqqLuLEzqnqbxRJ5B9voqqLXfRMO4pXW87MeB8KBpD2eCPfeWAblPETMIdqx+
         FfQX1h7/q1YAHY906dibrSEWvdsncB1PFK3pVdgTtIO59FWGmVRJg8rpB4w+5PcvyFNB
         UeCnq6nQfVidibHakEXgYTir/2SW4fKe7bh/ikIxI+STAJQMKVCF4IS0krM+0XzaMrOh
         1Uqz6p+azJtuPqoWKlhbl7sTVeWSxz6jmQPgnwsH1qPN+HPTfR96Ve9rGhuBbYS8/jZH
         ZLBw==
X-Gm-Message-State: AOAM532PYlHgTARQLZhBb2um/uwze2XjSIBGY7z2WP/n4V9Cfr2Thvaw
        Muzb6b8GuuyELU2cLCegKqktm2gosnESo/ZL3IMtvw==
X-Google-Smtp-Source: ABdhPJxPlxM1dj9OM9yqlSH9CS7Z0w+siAIis+SuuU3q5Y2Vd9+fA9cI4yyOEQsn8S7nlSuNEtROCjaNGSJFBLa2TVQ=
X-Received: by 2002:ad4:4e23:: with SMTP id dm3mr11015107qvb.4.1617327187201;
 Thu, 01 Apr 2021 18:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
 <20210325111144.2852594-14-dmitry.baryshkov@linaro.org> <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
In-Reply-To: <21bc5248-57b8-243d-300f-1bc39162c37f@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 2 Apr 2021 04:32:56 +0300
Message-ID: <CAA8EJppZvGs8SO5=ooL+pOHc9xopCXmmxHq8zNdLN5RVdgNCxQ@mail.gmail.com>
Subject: Re: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported
 clock sources
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On Fri, 2 Apr 2021 at 04:23, Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Dmitry,
>
> On 3/25/2021 4:41 PM, Dmitry Baryshkov wrote:
> > video_pll0_out_even/_odd are not supported neither in the upstream nor
> > in the downstream kernels, so drop those clock sources.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/videocc-sdm845.c | 8 +-------
> >   1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
> > index 5d6a7724a194..7153f044504f 100644
> > --- a/drivers/clk/qcom/videocc-sdm845.c
> > +++ b/drivers/clk/qcom/videocc-sdm845.c
> > @@ -21,24 +21,18 @@
> >   enum {
> >       P_BI_TCXO,
> >       P_CORE_BI_PLL_TEST_SE,
> > -     P_VIDEO_PLL0_OUT_EVEN,
> >       P_VIDEO_PLL0_OUT_MAIN,
> > -     P_VIDEO_PLL0_OUT_ODD,
> >   };
> >
> >   static const struct parent_map video_cc_parent_map_0[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_VIDEO_PLL0_OUT_MAIN, 1 },
> > -     { P_VIDEO_PLL0_OUT_EVEN, 2 },
> > -     { P_VIDEO_PLL0_OUT_ODD, 3 },
>
> These are supported from the design, please do not remove them. It is
> just that in SW currently it is not being used.
> But SW can decide to use them as they want. As said earlier these are
> defined in the HW plans and thus do not want them to be updated manually
> to create a mismatch.

I see your point here. I'll drop these patches and refresh the
parent_data conversion patches.

>
> >       { P_CORE_BI_PLL_TEST_SE, 4 },
> >   };
> >
> >   static const char * const video_cc_parent_names_0[] = {
> >       "bi_tcxo",
> >       "video_pll0",
> > -     "video_pll0_out_even",
> > -     "video_pll0_out_odd",
> >       "core_bi_pll_test_se",
> >   };
> >
> > @@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "video_cc_venus_clk_src",
> >               .parent_names = video_cc_parent_names_0,
> > -             .num_parents = 5,
> > +             .num_parents = 3,
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> >
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
> --



-- 
With best wishes
Dmitry
