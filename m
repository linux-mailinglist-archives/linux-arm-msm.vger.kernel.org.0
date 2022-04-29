Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 016FD514F3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378337AbiD2P0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377916AbiD2P0W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:26:22 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0947AD4471
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:23:03 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id y76so15107621ybe.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZohBTUQ/LZbS+o8W/VtMK+1Flcbn9HfcCfSB3a36VjI=;
        b=BafF1IEZ4EDjsmtHXSsqVqrWZ8g2k5/kH6HfKliDsRHA43hy2G2+BtITONBujNnLl9
         pLCwWahreUD6kBQmDFxL/MzrUF0SJKzdT/cKllJHdTRWb5qoZklkD+LOMU/Puy0duaUM
         tv/CORBR7bOo+VfJBEVTa+rKyibTdw/wMAm9z9NPYT9FtqdEgYGun76+4YC3DHL6w+Qv
         ykVgZ7jE7iJiTDJpDE3DWRI2b/JThT+f6qMZa2+6nWbcBORWWE0j5suB4MoRBxf0kKra
         AdbtXHGo3Z5u/a2Gy8oPTmfyx52K719oDWDFhyg6pDvC5WfJAH1lGIzAr7xaacOafkSE
         /PSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZohBTUQ/LZbS+o8W/VtMK+1Flcbn9HfcCfSB3a36VjI=;
        b=dgnnEowFLmYGko9VXzrDby3/gxFcEZCO/Rqx87C1lSn3ptsaNarEyG4AVOgulkwf0L
         7LbCHovDqp5YvcGA1PgshdReLrLejDCo+7o1f60YfeaCEpxng86Z8mzPCfvTW1LmlPut
         7aB5OiYyItHDDqP9Vvv7HlecHSe1aSHLDsbJMjIBtxJ6xuO6Ej+SGVl3u+4mOaDgaW0r
         QNne5RHGMlU3dzqoPHGOq76uXJ+duiCBoM/MPhplDuXgSnTypBSbjISXTbKxheK8oeTC
         8ACPGFSgTgdCg1ecBCL9I2lv0mR55iAeO5qSLIolzvBE/4f1HZJmqWv/iIOSjPLmFnrG
         dBvQ==
X-Gm-Message-State: AOAM532zy9tz2/1+sX7prSrr7z6gyqWJ6bGDI4/+yHLdFwOiumbMnmzM
        o0FCAsd72N21ni7Zdb0/35j6TUNuD059g/es+UXxyA==
X-Google-Smtp-Source: ABdhPJxFUndINlvlcj6DuIlMnf+ph+4UTobF5BjRzTm793kkDfWoGguZCTA+VCrNsOiM/AOPBy7pN3PAUhJmbnr33f0=
X-Received: by 2002:a25:a1c6:0:b0:641:5ff5:9f93 with SMTP id
 a64-20020a25a1c6000000b006415ff59f93mr36532265ybi.49.1651245782234; Fri, 29
 Apr 2022 08:23:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220429120108.9396-1-ansuelsmth@gmail.com> <20220429120108.9396-4-ansuelsmth@gmail.com>
 <b7de49e0-c0cf-5062-8426-dcb54272d350@linaro.org> <626bff7e.1c69fb81.bdf89.4da7@mx.google.com>
In-Reply-To: <626bff7e.1c69fb81.bdf89.4da7@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 29 Apr 2022 18:22:50 +0300
Message-ID: <CAA8EJppzj13egBnNg=GkGV0_c_4SqZinek1Y3Byc7g2r95ff8g@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: qcom: clk-krait: add hw_parent check for div2_round_rate
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Apr 2022 at 18:08, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> On Fri, Apr 29, 2022 at 05:53:32PM +0300, Dmitry Baryshkov wrote:
> > On 29/04/2022 15:01, Ansuel Smith wrote:
> > > Check if hw_parent is present before calculating the round_rate to
> > > prevent kernel panic. On error -EINVAL is reported.
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> >
> > I see that other clock drivers do not perform this check. Which path leads
> > to this oops?
> >
>
> This comes from qsdk patches so I apologize in advance about this.

Ugh. If it comes from the code authored by somebody else, it'd be
better to note this (by using the From or Co-developed-by tags).
At the very least (if the author is unknown) you can mention the
origin of the patch (qsdk) in the commit message.

>
> Anyway I'm checking the code and krait-cc is the only user of
> krait_div2_clk_ops. That user have as parent only hfpll_something that
> is declared by gcc. Now hfpll can also be declared in dts with a
> dedicated driver so I wonder if the problem is there in the case when
> hfpll is declared in dts and is probed after krait-cc. This is not the
> case for ipq8064 but I wonder if qsdk have other krait based device that
> have a configuration with hfpll declared in dts.

On msm8974 (and maybe others) the hfpll should be driven by the
separate hfpll driver.

>
> In short you are right and in our current code the check is uselss and
> I'm positive about dropping this patch but I do wonder if downstream
> there is an actual use of this. Don't know how to proceed. Any hint?

I'd say, let's drop it for now unless Stephen or Bjorn tell us that
it's a valid check.

>
> > > ---
> > >   drivers/clk/qcom/clk-krait.c | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> > > index 90046428693c..6c367ad6506a 100644
> > > --- a/drivers/clk/qcom/clk-krait.c
> > > +++ b/drivers/clk/qcom/clk-krait.c
> > > @@ -84,7 +84,12 @@ EXPORT_SYMBOL_GPL(krait_mux_clk_ops);
> > >   static long krait_div2_round_rate(struct clk_hw *hw, unsigned long rate,
> > >                               unsigned long *parent_rate)
> > >   {
> > > -   *parent_rate = clk_hw_round_rate(clk_hw_get_parent(hw), rate * 2);
> > > +   struct clk_hw *hw_parent = clk_hw_get_parent(hw);
> > > +
> > > +   if (!hw_parent)
> > > +           return -EINVAL;
> > > +
> > > +   *parent_rate = clk_hw_round_rate(hw_parent, rate * 2);
> > >     return DIV_ROUND_UP(*parent_rate, 2);
> > >   }
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> --
>         Ansuel



-- 
With best wishes
Dmitry
