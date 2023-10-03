Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55B5D7B6AA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 15:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232145AbjJCNgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 09:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235865AbjJCNg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 09:36:26 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A38ECE
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 06:36:23 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-59c268676a9so11488607b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696340182; x=1696944982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IRR3rv2KDWXmsB0Ix3ijU7n/jybq/13X5CydsHsyIcU=;
        b=vqagwEwMD1LKeRPBe0/2Zv9u6la+KK0MjdGhxmbSuYFfSncfJ0kV+q+hv2q0zwWSGr
         hA+mc5QNdDMqoXb3drq9zalG0i+LvRaoMz/3v0Dom+vnJBo/Xn7Ovtui7/FJOAuX3o8c
         tYI/Jwn7W46EHZZYjrpCdOMluZiKiQr7YDeDxiqRv4n/4hnuxScVF+xR9OJSy5b8wbSO
         nQBH0fQ1SrQgWpYBKwLnouAFoSOmEtto5UdyO5qVCsLZFWuAFeaYH3EkzgHDSBEG3gsH
         TR3Crc5XdTVL1BL8Ka3YnKaMsd1tAsprojV6zYQcJnLcgaqFMJq85ksQhK3tndYgEXZo
         XHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696340182; x=1696944982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRR3rv2KDWXmsB0Ix3ijU7n/jybq/13X5CydsHsyIcU=;
        b=Vkubm4r66roUrmUDR79BsUlNXvFSlgTIvQumJLPsaKNfEy4i3I6thLRr0UrATU+Uoh
         LSSAzsVYeXGIpz9VUd6BvgAxVqOH2z1QHWN+HX7DtTHOyAfo1uiPhlI61vGRzBHY0u16
         YA4+tR3/eEAIgMsd3D11msLGXclS0OWwO65uxKtfThRPWeYb6B1PVNaaAn9dJRz4yEKv
         Y0ydhviRFEK5sfb+I9lwDURhwEY3/ft6M3z/5tPds9O42pH+x9x5I8/NQXybj170ZLA1
         FuMebjsF4SmdgDFQ/+7JAMPHJAq1bi8RAty1GxAY763PYKEyEbkMyeYDz2RRB2TcNE0b
         n5qA==
X-Gm-Message-State: AOJu0YzuyRW8erZ0k8POyObY7pqrBBm01MJB9YEIIxvk4PHrXQHGPw3u
        UcmvBWb8nVoYa85EhUQeFSuDyz4gl/O50o7gonfsgw==
X-Google-Smtp-Source: AGHT+IG6YMLVfihSCcX3qLX7ge5fFIGHKpnjN5f2nZxD04+vvfmGOZWNVnWdqRL4QhQ9K3xPrTMKY1PYBCFY7JRW808=
X-Received: by 2002:a0d:d891:0:b0:58f:a19f:2b79 with SMTP id
 a139-20020a0dd891000000b0058fa19f2b79mr16157767ywe.9.1696340182327; Tue, 03
 Oct 2023 06:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-6-dmitry.baryshkov@linaro.org> <493aff10d698c9ca5bdbeae45250f5fe.sboyd@kernel.org>
 <7312633f-3b53-43a1-b6e3-010513c2a1e2@linaro.org> <ZRwQvP_GbvwvLAn8@gerhold.net>
In-Reply-To: <ZRwQvP_GbvwvLAn8@gerhold.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 3 Oct 2023 16:36:11 +0300
Message-ID: <CAA8EJpr9WH+MQdOJQ5yockg9TsUnDcenGbs=dq4Nt0SSBaK=0A@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] interconnect: icc-clk: add support for scaling
 using OPP
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
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

On Tue, 3 Oct 2023 at 16:02, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Tue, Oct 03, 2023 at 11:30:28AM +0300, Dmitry Baryshkov wrote:
> > On 28/08/2023 21:09, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2023-08-27 04:50:15)
> > > > diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
> > > > index d787f2ea36d9..45ffb068979d 100644
> > > > --- a/drivers/interconnect/icc-clk.c
> > > > +++ b/drivers/interconnect/icc-clk.c
> > > > @@ -25,12 +28,16 @@ struct icc_clk_provider {
> > > >   static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
> > > >   {
> > > >          struct icc_clk_node *qn = src->data;
> > > > +       unsigned long rate = icc_units_to_bps(src->peak_bw);
> > > >          int ret;
> > > >          if (!qn || !qn->clk)
> > > >                  return 0;
> > > > -       if (!src->peak_bw) {
> > > > +       if (qn->opp)
> > > > +               return dev_pm_opp_set_rate(qn->dev, rate);
> > >
> > > Just curious how does lockdep do with this? Doesn't OPP call into
> > > interconnect code, so lockdep will complain about ABBA?
> >
> > Unfortunately it does. It seems, the icc-clk is not a proper way to go here.
> > I will take a look at reusing set_required_opps for this case.
> >
>
> Could you elaborate a bit which locks exactly cause trouble here?
> I'm probably missing something here.
>
> From a quick look at the OPP code I don't see a global lock taken there
> for the entire OPP switch sequence, so I'm not sure how this could cause
> an ABBA deadlock.

For example:

[    7.680041] Chain exists of:
[    7.680041]   icc_bw_lock --> regulator_ww_class_acquire --> fs_reclaim
[    7.680041]
[    7.687955]  Possible unsafe locking scenario:
[    7.687955]
[    7.699039]        CPU0                    CPU1
[    7.704752]        ----                    ----
[    7.709266]   lock(fs_reclaim);
[    7.713779]                                lock(regulator_ww_class_acquire);
[    7.716919]                                lock(fs_reclaim);
[    7.724204]   lock(icc_bw_lock);

-- 
With best wishes
Dmitry
