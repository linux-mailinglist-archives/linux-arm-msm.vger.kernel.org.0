Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E57D95591ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 07:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiFXFXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 01:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbiFXFXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 01:23:16 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AD32BB1B
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 22:23:15 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id r138so1120706qke.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yl4RQmeDwLz9nkuUQqjK9sXArcf/+1jvTW/uw9Xfl2I=;
        b=bkxR24CXCbUYXMtPJhEeGzpL+GGnnHhwRTl1FXuAr+ldO/dbcDV/k8KRrMbd6ZfAbd
         GDcg4OQAsE5rXjhomUcmTXVWGdoNF3Tf9NHP0L8tgD+ZDDYqefTID3831mEpL8+XD1va
         T/+9LEkgjo5TTZwC433t2ms4t9zrdydkAKA6lWAJaAjSKKC3cEdLl8C0CZic3NXCKvF8
         reDN8I33Sp8q8I7HG1NeOwj2m9LlLl4Bir/VTd1VYrXgcq/6TDWM6zUWDmy92S93pByc
         XM2U7W2821hgJ7FpfKDHqHB4YB6xdQ8zRwMCKCLWJIYBftifCj48V4NVMGvwKWidyb0I
         UEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yl4RQmeDwLz9nkuUQqjK9sXArcf/+1jvTW/uw9Xfl2I=;
        b=4CsEs8Qw9VKre6d4oPrWyNj88c0cph0lzcrsGVnw/WOUPziP5fwOyAepSYW7TwPEZk
         289Jf8VnKVobb2yK8nqT27GbRQD6LintVOWxKCbmEJcxBrxsuBrDevAYCz/gV+gQJoEw
         vfryGVKu8sWk1amecXrzER4q1VNHHZPcC79YEK7pMgY3cULewnJ+miV2+PTxVfF1/zvu
         6f3H2QpzjNfsG+jFyj4z8Js06YZEbg2RUvhHtsj6kt3u529P3+i2ul4wYTWPF6ENA+KN
         tbm+2BSFAV4pgDtvJMdsxtD0m+5S2Xi44Cksv1nPDQ44eC0TPEvFxQOkqX7F+WpdOqZW
         gnkQ==
X-Gm-Message-State: AJIora/gs9hE1i2E9vH4cOi1AJ4Qheh3DER1Yq115BEBlVyUy1oYVFSF
        uTKO7WjAYXSYMNkDbp8B0G2lHivxpaa4dj8ZD34pBQ==
X-Google-Smtp-Source: AGRyM1s0WpY+/3CRy5hH1oeYzxu9eGU6p6MwlHU3YyOfOdzZLpNPxgroBPT004zE6BsNToAK5wTgottIKl4t+Boo6u8=
X-Received: by 2002:a05:620a:31a0:b0:6a7:549f:a788 with SMTP id
 bi32-20020a05620a31a000b006a7549fa788mr9288637qkb.203.1656048194761; Thu, 23
 Jun 2022 22:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org> <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
In-Reply-To: <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 24 Jun 2022 08:23:03 +0300
Message-ID: <CAA8EJpoYJx5KumZugdCSBwz4JXf6fJyKDMPqG3G1bVBdB+y5-Q@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last
 remaining entry
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Jun 2022 at 03:27, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
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
> >         .enable_mask = BIT(4),
> >         .hw.init = &(struct clk_init_data){
> >                 .name = "pll4_vote",
> > -               .parent_names = (const char *[]){ "pll4" },
> > +               .parent_data = &(const struct clk_parent_data){
> > +                       .fw_name = "pll4", .name = "pll4",
>
> Is there a DT binding update?

I will include it in v2.

-- 
With best wishes
Dmitry
