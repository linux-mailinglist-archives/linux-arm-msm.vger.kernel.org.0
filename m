Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E322E78BA25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Aug 2023 23:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjH1VTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Aug 2023 17:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbjH1VSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Aug 2023 17:18:36 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E4BC0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 14:18:33 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5925e580f12so43829217b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Aug 2023 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693257512; x=1693862312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FliVY615SEVhU7q/mzsk+r1Q2msZnK6cJIUPdMDRRUs=;
        b=cWLcHR4sSxaF1+1qqYC7UpzV+E6ieIqJHvwuenssIkM9Cr5x/uMmdwIfA8+hieDITg
         vNNwvwOmUiXrG3+RScTdFFGfqHsTg8WNN95/fVmfljca/dI4cx2sjdZ+Q4J1nHu4NrE1
         IGaW7B1NP+cloCZ/rmvXq+BXrJuQXa38/NWp/fqRgu5BfH+uruV7I1hK2Ne3MXEYVv3A
         z1pl5VZDhzFOhn4m6Q2A189RCqhln0mRnqTZr8YhExbWfF2PoHSOxNZ4FkBVZzRuriYY
         nTPOjnVHooNRKkrIxZmX0eYc5Gr9i41/0BI9DIilI7+k9vDZibgphNkWF1R/iv+n5Nxx
         AYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693257512; x=1693862312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FliVY615SEVhU7q/mzsk+r1Q2msZnK6cJIUPdMDRRUs=;
        b=N/n3F+lFjkQXC7xayCDom3Yv0f4RrO1oR6Tg66/7IEe0XaS31KfsueFpavYkYAdHVR
         NxCICMj6CDOe/uBh0i/Oc/3plbOx8gEfyqJimEMHu4rjp8wJUYjbwPWUEIb5PEGEcd6+
         BeT3dqek3o82vrqjSGvRPcfZpOWkQRcc7kO1ZsbpGQoGD/olC4je+iHCpQjame2UPZqe
         KUNiTys7P7xv9lcObHJa+zEcs7+uEUMDIAnS7RGBgqeUYwGGu+As4mNgAVh6ErvohBkV
         SdJ1yTa8WogC88BriOeubLQ5enZTUQaE+voldZrRgpTKE0oZVDEDWJ3Vcg7xqf2y67Tf
         Wxcg==
X-Gm-Message-State: AOJu0YwYlWp7YZC7BvdDcV39leFMrTswy6sb5sVdvcbDGoXQhTcapaTM
        2MxFdqEI5vLHvXGHQUp9FoSQGySxZunCztDWdZgdrg==
X-Google-Smtp-Source: AGHT+IGVY3Grt8v+TneGy63uFk333inJDlkXAPH94m3V0xoeYPtYcffqLrh79udacodPiOlKofhL6KWSVF8Dj92OMHg=
X-Received: by 2002:a25:da0c:0:b0:d74:6163:db8c with SMTP id
 n12-20020a25da0c000000b00d746163db8cmr28524846ybf.41.1693257512343; Mon, 28
 Aug 2023 14:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
 <20230827115033.935089-6-dmitry.baryshkov@linaro.org> <493aff10d698c9ca5bdbeae45250f5fe.sboyd@kernel.org>
In-Reply-To: <493aff10d698c9ca5bdbeae45250f5fe.sboyd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 00:18:21 +0300
Message-ID: <CAA8EJppBT2hOUfGkzj273pcniE2-Q4dn8aA9Of11X1JmkAbOiA@mail.gmail.com>
Subject: Re: [PATCH v4 05/23] interconnect: icc-clk: add support for scaling
 using OPP
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
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
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
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

On Mon, 28 Aug 2023 at 21:10, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-08-27 04:50:15)
> > diff --git a/drivers/interconnect/icc-clk.c b/drivers/interconnect/icc-clk.c
> > index d787f2ea36d9..45ffb068979d 100644
> > --- a/drivers/interconnect/icc-clk.c
> > +++ b/drivers/interconnect/icc-clk.c
> > @@ -25,12 +28,16 @@ struct icc_clk_provider {
> >  static int icc_clk_set(struct icc_node *src, struct icc_node *dst)
> >  {
> >         struct icc_clk_node *qn = src->data;
> > +       unsigned long rate = icc_units_to_bps(src->peak_bw);
> >         int ret;
> >
> >         if (!qn || !qn->clk)
> >                 return 0;
> >
> > -       if (!src->peak_bw) {
> > +       if (qn->opp)
> > +               return dev_pm_opp_set_rate(qn->dev, rate);
>
> Just curious how does lockdep do with this? Doesn't OPP call into
> interconnect code, so lockdep will complain about ABBA?

Interesting question. I should check it.

-- 
With best wishes
Dmitry
