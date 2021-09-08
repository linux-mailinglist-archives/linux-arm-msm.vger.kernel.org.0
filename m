Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC918403B82
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 16:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351890AbhIHOaF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 10:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233240AbhIHOaF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 10:30:05 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B89FC061575;
        Wed,  8 Sep 2021 07:28:57 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a10so2445231qka.12;
        Wed, 08 Sep 2021 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9JsbZFov3ICA1qL8d4cvHPqqFkw1nktPj+U8ihCKcfQ=;
        b=SMbyDKS0tyCPh3sRgkXSo8sy9lxXBeGPl4CSVFaL53so0tMM65EaAGcsprznttdtJ7
         DI+acugQs/siaaFdiwgu/yOt8+EVQ6iuCoabLnNvlQ+9riCa10ZwsnRUH+aB0SDAMZ+H
         c3RV5hMf8WgTTxNnG+fO7Poxr24lQl83hN3PbhUeHSPCPnDM4YsRpB1qgyRd6UUcEzt8
         xS2dG11Dh0INd96NgYDK1ZxyexMpKawTxRIcNp4NK3IuBflG1aj6v5dOW0Trsz1wzl74
         Y3Cyc6KsZdJ3bBJoWXVMfFYlFrr9NXg9xR4eBClJMiTu7pG7nBI4ilU7YANFYYCkXnv1
         Yv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9JsbZFov3ICA1qL8d4cvHPqqFkw1nktPj+U8ihCKcfQ=;
        b=O6K4/1K807C+/zm0KDbaFh+e4aUSh1kZLwdlFodpJ16TQzONHZzKWEtPWPMoIclEJ8
         tRtEYoZx3HkXaH3QZoP/CuUgiNDiviYxHnwsp3VKbmn0VIzDmHUww5mtbVANe0xitHyD
         4eLDAcBEX3ZCUwRQf6FusarhrG2vndubFOmHbNxbiunU3J04XGXMmcSnWfVzz3Rv23FX
         kOVbQKK9zjfbEZaNfamJ9NjsAVe21+Uhggmxkn4HErcDAY3t8jPz6aNKvNL23nN/28EG
         hXEGy68A1qCc+4wW1Q3MyoSKNsQEXAEGqHObBAYGImZ9NRhFiP5ZqEvUsTOp9PoFiMwJ
         KEsg==
X-Gm-Message-State: AOAM531XkRzYHHvyXFqhYajLJohJR1klkCy2yDkjMd/SmJ9v+x08Uc/k
        +mA0yS9G0h2U7sm0cjrmeq/p16kvNo2tovtzq1kumx/8rzpS4w==
X-Google-Smtp-Source: ABdhPJz7DVVpEboPjVkrCCtYZ1ubOXFqCKGb1qXMKbaXxuakwVKRtFqGap9yg+mofcTF7Y6L54OxbWlV1fP5g9RzsTg=
X-Received: by 2002:a37:bfc6:: with SMTP id p189mr3874345qkf.33.1631111336296;
 Wed, 08 Sep 2021 07:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210518175153.3176764-1-robimarko@gmail.com> <162483884998.3259633.3733659727822681631@swboyd.mtv.corp.google.com>
In-Reply-To: <162483884998.3259633.3733659727822681631@swboyd.mtv.corp.google.com>
From:   Robert Marko <robimarko@gmail.com>
Date:   Wed, 8 Sep 2021 16:28:45 +0200
Message-ID: <CAOX2RU7=z0BAyUSm8zNi9tbC98tMhe5fREh-=PKscV+aPyq1sg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: ipq8074: fix PCI-E clock oops
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        sivaprak@codeaurora.org, speriaka@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Jun 2021 at 02:07, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Robert Marko (2021-05-18 10:51:53)
> > Fix PCI-E clock related kernel oops that are causes by missing
> > parent_names.
> >
> > Without the use of parent_names kernel will panic on
> > clk_core_get_parent_by_index() due to a NULL pointer.
> >
> > Without this earlycon is needed to even catch the OOPS as it will reset
> > the board before serial is initialized.
>
> Can you share the oops message here in the commit text?
>
> >
> > Fixes: f0cfcf1ade20 ("clk: qcom: ipq8074: Add missing clocks for pcie")
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/clk/qcom/gcc-ipq8074.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> > index 0c619ed35c82..8d8b1717a203 100644
> > --- a/drivers/clk/qcom/gcc-ipq8074.c
> > +++ b/drivers/clk/qcom/gcc-ipq8074.c
> > @@ -4357,8 +4357,7 @@ static struct clk_rcg2 pcie0_rchng_clk_src = {
> >         .parent_map = gcc_xo_gpll0_map,
> >         .clkr.hw.init = &(struct clk_init_data){
> >                 .name = "pcie0_rchng_clk_src",
> > -               .parent_hws = (const struct clk_hw *[]) {
> > -                               &gpll0.clkr.hw },
> > +               .parent_names = gcc_xo_gpll0,
>
> This seems to imply that we need to have two parents but we didn't
> realize that was the case. Ouch! Please use a struct clk_parent_data
> array and then use the firmware name for XO and the clk_hw pointer for
> gpll0.
>
> >                 .num_parents = 2,
> >                 .ops = &clk_rcg2_ops,
> >         },
> > @@ -4372,8 +4371,8 @@ static struct clk_branch gcc_pcie0_rchng_clk = {
> >                 .enable_mask = BIT(1),
> >                 .hw.init = &(struct clk_init_data){
> >                         .name = "gcc_pcie0_rchng_clk",
> > -                       .parent_hws = (const struct clk_hw *[]){
> > -                               &pcie0_rchng_clk_src.clkr.hw,
> > +                       .parent_names = (const char *[]){
> > +                               "pcie0_rchng_clk_src",
> >                         },
> >                         .num_parents = 1,
> >                         .flags = CLK_SET_RATE_PARENT,
> > @@ -4390,8 +4389,8 @@ static struct clk_branch gcc_pcie0_axi_s_bridge_clk = {
> >                 .enable_mask = BIT(0),
> >                 .hw.init = &(struct clk_init_data){
> >                         .name = "gcc_pcie0_axi_s_bridge_clk",
> > -                       .parent_hws = (const struct clk_hw *[]){
> > -                               &pcie0_axi_clk_src.clkr.hw,
> > +                       .parent_names = (const char *[]){
> > +                               "pcie0_axi_clk_src"
>
> These two hunks can be dropped.

Hi Stephen, sorry for the really late reply.
Essentially it looks this is not necessary in the newer kernels,
I tested again with 5.14 and newer and I don't have a panic anymore.
I was hitting the issue with 5.10 kernel.

Regards,
Robert
