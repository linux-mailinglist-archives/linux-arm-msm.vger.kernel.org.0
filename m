Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 876FA14E4BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:19:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbgA3VTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:19:21 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37491 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbgA3VTV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:19:21 -0500
Received: by mail-ua1-f68.google.com with SMTP id h32so1751609uah.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tKb9L35tQcyRyNMGKuAJ6Ea5QSPI1QLK9JjZ13bjSck=;
        b=XucHTUJGVqo+dvrOVctD99spVTAWc6/H5Ie5rc4c68sI8IZEdOO3i5dcSPJG7jTxwY
         yYLYXQG/Yetkj67ZkEKuFz/saEg5P6jcccVihpjXHkMTowW/qlFnfCP9iRao5tWTSGR6
         76NU6QGK2oEpbP+jc2q8UeV0uStilfnAYz9Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tKb9L35tQcyRyNMGKuAJ6Ea5QSPI1QLK9JjZ13bjSck=;
        b=cT9rfPE0YA+JyE1wfJS49NhPisSkauCKVjF68TIb/ESZ8jC7z9154hTdpuaMOE3f+N
         kUuzZFrooJGoj4Frf9T36D8VNEvk2pv9s50ZIfhiYz7f+GCh+pUVAj0fUBb8VQUADCcL
         8unCJoC1miFcRAOUU7fGYjs8/WyIlpif1Mta7cm5Aa6zRq3+ATqA5RHHKf8PNd6DrSV1
         rpXtV+PbZ98WhwkT2mR1VWZHXmNCnrYqhtinTwL8niJL8qCDrE2X+hi+hJf43nC88EwC
         uS5LKtSotAt3MpQLgFEi1v1EMt4V4Tv5+lQ5W3Vm3smkYRvoHdAJx2EBI9vK+O2G43bt
         UZYA==
X-Gm-Message-State: APjAAAXNqqOyEJJXzxZhQ0iSbs9wT+jK24p1tBlyxgi5yjDHvTuFKihT
        McWe7MpZT5mTr1KU8lWa0om4aqCUulU=
X-Google-Smtp-Source: APXvYqyy1KAPGWsNgkc1V4klrQv5jWFor+40/Ehq1m5m68rwVQc9OmH5fcxJCuPNsggLarNKAe+wtg==
X-Received: by 2002:ab0:21cb:: with SMTP id u11mr3877253uan.16.1580419159309;
        Thu, 30 Jan 2020 13:19:19 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id o36sm1522547uao.15.2020.01.30.13.19.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 13:19:18 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id 7so3025255vsr.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:19:18 -0800 (PST)
X-Received: by 2002:a67:fa1a:: with SMTP id i26mr4644896vsq.169.1580419157458;
 Thu, 30 Jan 2020 13:19:17 -0800 (PST)
MIME-Version: 1.0
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
 <20200129005152.2A3ED205F4@mail.kernel.org>
In-Reply-To: <20200129005152.2A3ED205F4@mail.kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Jan 2020 13:19:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WKDC-58Muq4-TWLZ3V20eQURm7cELMik1FfjcKBnpr7w@mail.gmail.com>
Message-ID: <CAD=FV=WKDC-58Muq4-TWLZ3V20eQURm7cELMik1FfjcKBnpr7w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] clk: qcom: Fix sc7180 dispcc parent data
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jan 28, 2020 at 4:51 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-01-24 14:42:20)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> > index 30c1e25d3edb..380eca3f847d 100644
> > --- a/drivers/clk/qcom/dispcc-sc7180.c
> > +++ b/drivers/clk/qcom/dispcc-sc7180.c
> > @@ -76,40 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
> >
> >  static const struct parent_map disp_cc_parent_map_0[] = {
> >         { P_BI_TCXO, 0 },
> > -       { P_CORE_BI_PLL_TEST_SE, 7 },
> >  };
> >
> >  static const struct clk_parent_data disp_cc_parent_data_0[] = {
> > -       { .fw_name = "bi_tcxo" },
> > -       { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +       { .fw_name = "xo" },
>
> If we can make the binding match the code here and keep saying "bi_tcxo"
> then that is preferred. That way we don't have to see bi_tcxo changing
> and qcom folks are happy to keep the weird name. The name in the binding
> is really up to the binding writer.

v3 is now out and it still says "bi_tcxo" and generally uses the
"internal" name.  The big exception is msm8998's gpucc.  It seems like
a whole bunch of work has been done to move that over to more "purist"
(AKA logical) names and I didn't want to undo that work.  If we should
move msm8998 to match everyone else then hopefully someone can do it
as a followup patch?


> >  };
> >
> >  static const struct parent_map disp_cc_parent_map_1[] = {
> >         { P_BI_TCXO, 0 },
> >         { P_DP_PHY_PLL_LINK_CLK, 1 },
> >         { P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> > -       { P_CORE_BI_PLL_TEST_SE, 7 },
> >  };
> [...]
> > @@ -203,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
> >         .clkr.hw.init = &(struct clk_init_data){
> >                 .name = "disp_cc_mdss_dp_aux_clk_src",
> >                 .parent_data = disp_cc_parent_data_0,
> > -               .num_parents = 2,
> > +               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
>
> Can you split this ARRAY_SIZE() stuff to another patch? That will keep
> focus on what's relevant here without distracting from the patch
> contents. I know that parent array size is changing, but I don't want it
> to be changing this line too.

It has been done.

-Doug
