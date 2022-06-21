Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAF74553854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343787AbiFURAl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352018AbiFURAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:00:39 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82C5125593
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:00:38 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id r138so16621qke.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZkEO4M7jOV59qCHyyw5pNgv0UuC6b2G1AI1tuCyDlaA=;
        b=mtqPOXuTZWFBF/kLU/7R0s5qGBDSwlgvLQm89SWh4DiOT4vVRtUaktsNZNEQsqdPXS
         nFL+k25MASc3viAKtDqEP7RsrFIXvMrYiYNARgfLvRQ8Ww8cW0RIGBV3JXeI83/RBYXb
         T8PJCIFKrybguxPsRoFcEMdw2zr+zq7vCX/D2bLyXQKUUSn3YWgs73AbKCi6vRYEr3n1
         H67vQf//aTcgLNHiynKjJ4ugnVs9kZb3UrGB8X8darfnUOveKkkKgoS5LNAiTah4NTwM
         ROhQmRup2OFQ/YUZV92iHqFDsdaFJgrcFMRu4gZrgFwWP40AXHC18/0Loiw1GECUbhlx
         tSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZkEO4M7jOV59qCHyyw5pNgv0UuC6b2G1AI1tuCyDlaA=;
        b=ljut+qPHW/6FUE+W1GRW6CaJun24do/rLNzKGlnKG5sQGoMWpOab1UeD40/PnB3CkZ
         DhUI6Y85pYW+XSPXiwUuIxmbhcD7OyunlUJQ2MARJyHbd04oEko2hkgPB4SQNrYb8tgO
         ECc4RMeEOqfH7RQozYjrrFu9NygAFAmojshpYBkvZRK6zFvRTLTByych6Rwq6i4knin7
         qzUZABX+R5qsxc3vg+QcGuMopcP6Tce2JijmdLha94dLD5DfZlsjX074HtdG0hSEH+Ya
         PNniH+kOT1qvw/MaDKKJ4ksyyqkfy/updIwaPWMh4lZfZryueOS88chlfSLdLmlC8emQ
         nnJA==
X-Gm-Message-State: AJIora/UcIUZYcZASub0QMCzPFxAjIzKarPDyj/+zHmCuhcGsjQzhmFb
        WVuCkM1DIFivPBgtaHd3GcF88jATuqbv3ZuPzCdY7A==
X-Google-Smtp-Source: AGRyM1tpUHhHSSiROE4fi9M7Q5m/N0ialxxH/8ZL4M59Dvo2uPLFsi/GJ1HYDg5pqxD333cgmrK3tCvG/1IBvP73I2M=
X-Received: by 2002:a05:620a:2a0e:b0:6a7:8346:1601 with SMTP id
 o14-20020a05620a2a0e00b006a783461601mr20504725qkp.593.1655830837507; Tue, 21
 Jun 2022 10:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org> <62b1e1ea.1c69fb81.aafda.3244@mx.google.com>
In-Reply-To: <62b1e1ea.1c69fb81.aafda.3244@mx.google.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Jun 2022 20:00:26 +0300
Message-ID: <CAA8EJprEhHXSz2f2Estn-3Xih9W=S0qTMg950aXfEFQgoYuVXg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Jun 2022 at 18:21, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Tue, Jun 21, 2022 at 12:51:50AM +0300, Dmitry Baryshkov wrote:
> > Use parent_data for the last remaining entry (pll4). This clock is
> > provided by the lcc device.
> >
> > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > index 718de17a1e60..6447f3e81b55 100644
> > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> >       .enable_mask = BIT(4),
> >       .hw.init = &(struct clk_init_data){
> >               .name = "pll4_vote",
> > -             .parent_names = (const char *[]){ "pll4" },
> > +             .parent_data = &(const struct clk_parent_data){
> > +                     .fw_name = "pll4", .name = "pll4",
> > +             },
> >               .num_parents = 1,
> >               .ops = &clk_pll_vote_ops,
> >       },
> > --
> > 2.35.1
> >
>
> Hi my intention was finding a way to directly reference the hw clk from
> the lcc driver instead of using fw_name/name parent data. Wonder if that
> would be a better solution... Seems wrong to me to eventually add also
> the pll4 clk in the dts to correctly use the fw_name definition (when
> that will be fixed in the ipq8064 dtsi)

Please don't. They are two separate hardware pieces, two separate
drivers. Please don't invent anything fancy. Let the OF clk code
handle it.
Yes, this will result in "pll4" clock being referenced in DT. We
already have binding for that, <&lcc PLL4>.

-- 
With best wishes
Dmitry
