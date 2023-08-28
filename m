Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 628B178AEFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 13:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbjH1Lij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 07:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjH1LiU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 07:38:20 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E31F9
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 04:38:17 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso2956214276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693222696; x=1693827496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X/GcQDos7beFK8Cr8pyybDQsIb90MvDBQ7F0gE7uSTg=;
        b=t+y7VOvrfhe78N28JaKtOAKkHPLsu0IfQyka5RAfFYATUbKwuudLVhdSwKPEb3H8Lw
         PW8kVppM5FFqRHtKhOiEaPBaH81Vz0YHQZ7tfWJCl578+tSqAiA6tA+ntEkNPtxFdCDN
         Vy8VMnmY5S8ClorwFa57g7r6ravlzmJvsm7Q1czfcEiwkoFfXMpgb2Gr1Ul6qjIKJxD4
         hSKu1kxrsgglwBmpPc/EMr4hak2/pqSJK2V1noRujL18QZoxfYpRk2h3hSCvnUpyi/Sv
         Em7/khjjteAnGfPwcSpknD9Z1GOF/Jn0nni7I2BagYqACyrXQNbosuIBMkYKLvxgGZx7
         +Mzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693222696; x=1693827496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/GcQDos7beFK8Cr8pyybDQsIb90MvDBQ7F0gE7uSTg=;
        b=Zsyef4fY3g71EtsTKeVEcIo/KeonXTJ0eHbTbLwHfEaY0+AHQVhyAWWfSe2/p5W8mQ
         X8sVOaPT+0g8HSJh43j7Qb0osAVSkD4hDda1A5OpYy+coqDTMFt/sj0vNXNND3eIo1oA
         NSb7h7XdGeR8vXKG/tQ5JBjakk+LK3LQn3YfM93KeDEXldqZkVjkDyexXwxh55/rMvFc
         uqwRUbKMML/SScUtadcnwobBtv78m2dAb3TvhsA6XHcrM9cLhK+mCO5DprdIju3VMTcb
         FU39pyn5fE1vuXt6/WPT6vPOoa9qMLqmuTfDXKuJ9dzMvIIkawNj95SUfe/YhO4JZdPs
         TjWw==
X-Gm-Message-State: AOJu0YxbwRcWkGAYcXpvX1CQgN/mWo0Ah75yfESNzaH1G0lrPPz2cv76
        ZSa1skj8gesm2r0nrBBuuuzrhV/FnEebO3zwu8AV6g==
X-Google-Smtp-Source: AGHT+IGSI0QI0tI/WkUznWjFS0uzLKIYm0i0wZ8BZiHVTdJITFObmZ7zhr+id79WX+wWOU1SIhbptghNiVOrUezedCE=
X-Received: by 2002:a25:874c:0:b0:d5d:4df9:b6e2 with SMTP id
 e12-20020a25874c000000b00d5d4df9b6e2mr21819788ybn.46.1693222696379; Mon, 28
 Aug 2023 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-16-dmitry.baryshkov@linaro.org> <3b88827f-9cda-46b3-96ad-d10245afce1e@linaro.org>
In-Reply-To: <3b88827f-9cda-46b3-96ad-d10245afce1e@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 28 Aug 2023 14:38:04 +0300
Message-ID: <CAA8EJpp7GQ1DFcYwdS3-UG7CzRZT5KXXL78wgbYs46o72ZxLuw@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] ARM: dts: qcom: apq8064: add Krait clock controller
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 28 Aug 2023 at 13:54, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 27.08.2023 13:50, Dmitry Baryshkov wrote:
> > Add device node for the clock controller for the CPU cores and L2
> > clocks. It will be further used by the L2 and by the CPUfreq nodes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 26 ++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > index ba7d5ef8de17..a05e64bff07f 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> > @@ -213,6 +213,32 @@ sleep_clk: sleep_clk {
> >               };
> >       };
> >
> > +     kraitcc: clock-controller {
> > +             compatible = "qcom,krait-cc-v1";
> > +             clocks = <&gcc PLL9>,
> > +                      <&gcc PLL10>,
> > +                      <&gcc PLL16>,
> > +                      <&gcc PLL17>,
> > +                      <&gcc PLL12>,
> > +                      <&acc0>,
> > +                      <&acc1>,
> > +                      <&acc2>,
> > +                      <&acc3>,
> > +                      <&l2cc>;
> > +             clock-names = "hfpll0",
> > +                           "hfpll1",
> > +                           "hfpll2",
> > +                           "hfpll3",
> > +                           "hfpll_l2",
> > +                           "acpu0_aux",
> > +                           "acpu1_aux",
> > +                           "acpu2_aux",
> > +                           "acpu3_aux",
> > +                           "acpu_l2_aux";
> > +             #clock-cells = <1>;
> > +             #interconnect-cells = <1>;
> Doesn't only the L2 device register with icc?

True. I'll drop this



--
With best wishes
Dmitry
