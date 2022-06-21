Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B445E553883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jun 2022 19:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351651AbiFURGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 13:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351511AbiFURGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 13:06:37 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699482CDD0;
        Tue, 21 Jun 2022 10:06:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l126-20020a1c2584000000b0039c1a10507fso7591951wml.1;
        Tue, 21 Jun 2022 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:in-reply-to;
        bh=kL1xmF8MzptYucsvbSDQVEMnzHwS+6yNnQZLyzxJ0zg=;
        b=KCtYoA8OEGK/jkif8oEfXjD5yFxLY8T9X1Y10JKYTPjDMzJ2GMyv0FSzS5I7HP44eC
         KSxm6Lgu6v75Pr8j4NBMkyx5WHAUGDQDIzTTnkS3EcfMtgdfpc49YW7zjmMG0IBTCxrX
         7eIMMhQbqY5Q/ArLe/6oLFpCleacYUudLxtoKmlKaz5qzSkUnrRWivhZYW5xqETX6f4w
         nFthURC9jsGLzArFUYu5IPQNCn0+naU4PSXzS2G1FX9rXFgEl0o8jIVPTSBQtUAVDyi0
         /+siHW/22Ts43kOPAEYgyYRL7U/9CvJFsS+YkvJtaqTo7OwduNhXz+b6TyDqwJxbem96
         wlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=kL1xmF8MzptYucsvbSDQVEMnzHwS+6yNnQZLyzxJ0zg=;
        b=bbgoZITcGv5Vm1D55eaXVHLjAoP5a/dJoklJflFR95x/fFVKLbtH/xAz3KcwzArpXv
         RcRI6JOr7TSQoGZoJsArSDU221C3ddlnCFLfjYevN/4lib7uA1G7ZtwKXDJQeFuvNC2N
         /dupGSTOq2Z0qcWHQU+68c2R/mA5aMof+6OT3rKQY0p2BjJMIGV3r2AnLxMwrDeKsCPg
         YL8EQMdtro23hVwexsqrhPEhjIUPW48ba+LR02K2i5hKDn21cC52tFfl24xHfimWfGyu
         E30Xw5Y7dUlFLZcF7eA/zv8/BH58t36eAohkmIruOKvvP/DdnXrB+GDRDKO9xsfsyo8q
         nZbg==
X-Gm-Message-State: AJIora/+RochKIwEBxNrQMDStdQporAY0CG5w+I/nxeLH/Um7gWn0Z8P
        ZWI9TiBasa98E429hOkLDHSUfmDjZns=
X-Google-Smtp-Source: AGRyM1tRi//LEktuHzMUAYzj5gzqiQ0It4XKK8u0lvmIdrXUyjtnfzqzAT2MziYifNkYXw/cbaa3fw==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id r14-20020a05600c35ce00b0039c7dc2aec0mr31619491wmq.33.1655831193733;
        Tue, 21 Jun 2022 10:06:33 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c4f0700b00397342e3830sm34188107wmq.0.2022.06.21.10.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 10:06:33 -0700 (PDT)
Message-ID: <62b1fa99.1c69fb81.503a1.c28c@mx.google.com>
X-Google-Original-Message-ID: <YrH6lyJZEV/Bd+i4@Ansuel-xps.>
Date:   Tue, 21 Jun 2022 19:06:31 +0200
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org>
 <62b1e1ea.1c69fb81.aafda.3244@mx.google.com>
 <CAA8EJprEhHXSz2f2Estn-3Xih9W=S0qTMg950aXfEFQgoYuVXg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprEhHXSz2f2Estn-3Xih9W=S0qTMg950aXfEFQgoYuVXg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 21, 2022 at 08:00:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, 21 Jun 2022 at 18:21, Christian Marangi <ansuelsmth@gmail.com> wrote:
> >
> > On Tue, Jun 21, 2022 at 12:51:50AM +0300, Dmitry Baryshkov wrote:
> > > Use parent_data for the last remaining entry (pll4). This clock is
> > > provided by the lcc device.
> > >
> > > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to parent_data")
> > > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
> > > index 718de17a1e60..6447f3e81b55 100644
> > > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote = {
> > >       .enable_mask = BIT(4),
> > >       .hw.init = &(struct clk_init_data){
> > >               .name = "pll4_vote",
> > > -             .parent_names = (const char *[]){ "pll4" },
> > > +             .parent_data = &(const struct clk_parent_data){
> > > +                     .fw_name = "pll4", .name = "pll4",
> > > +             },
> > >               .num_parents = 1,
> > >               .ops = &clk_pll_vote_ops,
> > >       },
> > > --
> > > 2.35.1
> > >
> >
> > Hi my intention was finding a way to directly reference the hw clk from
> > the lcc driver instead of using fw_name/name parent data. Wonder if that
> > would be a better solution... Seems wrong to me to eventually add also
> > the pll4 clk in the dts to correctly use the fw_name definition (when
> > that will be fixed in the ipq8064 dtsi)
> 
> Please don't. They are two separate hardware pieces, two separate
> drivers. Please don't invent anything fancy. Let the OF clk code
> handle it.
> Yes, this will result in "pll4" clock being referenced in DT. We
> already have binding for that, <&lcc PLL4>.
>

Oh ok. Thanks for the clarification, no problem for me. Just another clk to
add to the gcc node in the dtsi.

> -- 
> With best wishes
> Dmitry

-- 
	Ansuel
