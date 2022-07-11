Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC2C2570375
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 14:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbiGKM4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 08:56:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiGKM4n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 08:56:43 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FA65508E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:56:39 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id g1so3695835qkl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDlFrz82XEV559hOxt/9KTdlawVN8UslB7cohDHmlKk=;
        b=UGSIMFUIAjpBDWVNaLdfMacUu/FNYeJA/ajTQGHLFVW1PsgSlI9Msf9I4lRCrO4oxg
         MlKNe8vitsaANDx5V1aZOKDe/FWJY7FMqnNo2WffF1BccvyuXYl0ljDiBtm2U7M6p3PY
         Uv6g75BblWi8jZL/vU86KL/R82HQqpyHViaSMpPHCBJFy1tw3ImPFZr6Yhur5MNRpgwx
         jFIln7OmJlAOp7lwI93AmGcIS24/HH1k+lh4t849Ktm3RgI36SgPSqrnNVX9MMJfU0MR
         buHhUDsCZt9JXZ/j0aPHgaVGgj6y5cleY3xopEwmEd7PinxpbD6BNU+IuP+rvRCK9SvE
         N2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDlFrz82XEV559hOxt/9KTdlawVN8UslB7cohDHmlKk=;
        b=L7c2mAOJ1oZLjG7ulxj2t5cUACOTBoVUp1f8YswBJnIXZEtlHTbVbdiKvagJpDhSkM
         GdNQ98frmgQ+CH9XsADIeEhNZlcutJzhTmsRo2SY7saD7I0bDQqdi4Dw2wY7ta0+owfL
         cKW57SnkCfvKhpHbDr+o++T/GnZ/HCF4O2NSbpOE4UFEEfCqYVdbZKHNWKX+nw+Kuw1q
         fXHigJA739xY0zeYR0AfGo323bYToGktm1rQokJ8omK971isYCPvn9ktIBsKItwtmZiZ
         DY4XpIjr5OL8DR0bD8hWhXpmy4m5h0anxr7t6XqGTP/xJM8hIUeyMAOOsWPf7FDbNCq0
         vgZw==
X-Gm-Message-State: AJIora+4Eni1U3Y7Am/h2YdMuhF0XGH7DoefUxi5WwD2cpXLQlb0Nh6n
        XkGZWycM4vVRRNDP3ygtPuQ1yiMiQUc3HkEaly7wNg==
X-Google-Smtp-Source: AGRyM1vyiLG3J4nejZR7X7psv05VMDKCUlQ7HErJz+5Ve+FWvo6yHgHVMzjp++8/sc8+P4BwkHsNGjkuwjt/BeRFF1Y=
X-Received: by 2002:a05:620a:288c:b0:6b3:9d1:dbf1 with SMTP id
 j12-20020a05620a288c00b006b309d1dbf1mr10943389qkp.593.1657544198360; Mon, 11
 Jul 2022 05:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220711104719.40939-1-robimarko@gmail.com> <20220711104719.40939-6-robimarko@gmail.com>
 <CAA8EJppAdwuXQsvvy9+hT_-mzke5xOaDcTSM5ewjS_cPk3Q+oA@mail.gmail.com> <CAOX2RU6FMyzGGpnLtzRy=szjBSE+wcvbs+6z6ChZ5Z6g4-9Baw@mail.gmail.com>
In-Reply-To: <CAOX2RU6FMyzGGpnLtzRy=szjBSE+wcvbs+6z6ChZ5Z6g4-9Baw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Jul 2022 15:56:27 +0300
Message-ID: <CAA8EJpr=_ezgyQcLhfuswtkoRCr+kxxwqkaTYHMxCJ1xm7_avw@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: qcom: apss-ipq-pll: add support for IPQ8074
To:     Robert Marko <robimarko@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org, sivaprak@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
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

On Mon, 11 Jul 2022 at 15:55, Robert Marko <robimarko@gmail.com> wrote:
>
> On Mon, 11 Jul 2022 at 14:51, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Mon, 11 Jul 2022 at 14:22, Robert Marko <robimarko@gmail.com> wrote:
> > >
> > > Add support for IPQ8074 since it uses the same PLL setup, however it does
> > > not require the Alpha PLL to be reconfigured.
> > >
> > > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > > ---
> > >  drivers/clk/qcom/apss-ipq-pll.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> > > index bef7899ad0d6..acfb3ec4f142 100644
> > > --- a/drivers/clk/qcom/apss-ipq-pll.c
> > > +++ b/drivers/clk/qcom/apss-ipq-pll.c
> > > @@ -55,6 +55,7 @@ static const struct regmap_config ipq_pll_regmap_config = {
> > >  static int apss_ipq_pll_probe(struct platform_device *pdev)
> > >  {
> > >         struct device *dev = &pdev->dev;
> > > +       struct device_node *node = dev->of_node;
> > >         struct regmap *regmap;
> > >         void __iomem *base;
> > >         int ret;
> > > @@ -67,7 +68,8 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
> > >         if (IS_ERR(regmap))
> > >                 return PTR_ERR(regmap);
> > >
> > > -       clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);
> > > +       if (of_device_is_compatible(node, "qcom,ipq6018-a53pll"))
> > > +               clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);
> >
> > I'd suggest having the 8074 config here too. It seems logical to me to
> > make sure that the pll is configured correctly.
>
> Hi,
>
> I have reworked the driver to use match data so it can be easily provided,
> However, I dont have it as the downstream QCA kernel does not
> reconfigure the PLL, unlike IPQ6018.
> I can probably read the registers from a running board and provide that?

Yes, please try that.

>
> Regards,
> Robert
> >
> > >
> > >         ret = devm_clk_register_regmap(dev, &ipq_pll.clkr);
> > >         if (ret)
> > > @@ -79,6 +81,7 @@ static int apss_ipq_pll_probe(struct platform_device *pdev)
> > >
> > >  static const struct of_device_id apss_ipq_pll_match_table[] = {
> > >         { .compatible = "qcom,ipq6018-a53pll" },
> > > +       { .compatible = "qcom,ipq8074-a53pll" },
> > >         { }
> > >  };
> > >  MODULE_DEVICE_TABLE(of, apss_ipq_pll_match_table);
> > > --
> > > 2.36.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
