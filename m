Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8DA41B7C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 21:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242575AbhI1Txd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 15:53:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:60338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242563AbhI1TxZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 15:53:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68A296103E;
        Tue, 28 Sep 2021 19:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632858705;
        bh=SjDYQzWDjKOwjfImJL7iQfN9MdtQUXwvsFSbuo+RNqg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tk2uFeNnUAdeOGzco23aq+nTJTPINVhAQnzmLmGlreOqixJRkHyr+NHArROil6Z8R
         0KAth4gsGuQTM+ecpkRnfaJQJ4EYyn9AxSv6uNd836MjNfCg3Bq4GIq6XiHNF3w/OA
         A3dWadUlkcf/WYK1nr8hjrV5I4JtkBusooRyA0TZvHhIRMCU7n75TVAa8dZQSRrJNy
         T39hm6QLa4REe5kLsSj47UWvq+7xA34nBWFRH36Dup9MtS+JUzPJpbUEBWuRY4ItPA
         tT/VKjyJTSKX/Ae0AxT8TaroUn6vncSBoW+ApPv5opWfFO1nk6tjoKYytzrCZdn5HB
         9f9FGu3gwOkZg==
Received: by mail-ed1-f52.google.com with SMTP id v18so51859553edc.11;
        Tue, 28 Sep 2021 12:51:45 -0700 (PDT)
X-Gm-Message-State: AOAM532rWT+rmXtqHsRxgAYd0Vlef07iQjWZACfK/eVhESxWVM4yx5eF
        W1/QWPqQnUFyMjzqYBh77IZXuXisX/23TO0gow==
X-Google-Smtp-Source: ABdhPJyxRBVFyaU8SVKi4VHd95iYVErnmRqvpKwICUfcsGPsp7mvtI8rENxaMQAi3CXbEtJkGd9Jn01YS6EPf4mUqIo=
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr8817374ejb.320.1632858703968;
 Tue, 28 Sep 2021 12:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
 <YVLszZ7U7D91oIH2@gerhold.net> <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
 <YVNVj68WjBBXef3h@yoga>
In-Reply-To: <YVNVj68WjBBXef3h@yoga>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Sep 2021 14:51:32 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pLhWMeObzbq2xQVK3+vVLqd3L0BNGd=CCZmhVZM8dDw@mail.gmail.com>
Message-ID: <CAL_Jsq+pLhWMeObzbq2xQVK3+vVLqd3L0BNGd=CCZmhVZM8dDw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 12:49 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 28 Sep 12:34 CDT 2021, Rob Herring wrote:
>
> > On Tue, Sep 28, 2021 at 5:22 AM Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > On Mon, Sep 27, 2021 at 09:45:44PM -0700, Bjorn Andersson wrote:
> > > > In the olden days the Qualcomm shared memory (SMEM) region consisted of
> > > > multiple chunks of memory, so SMEM was described as a standalone node
> > > > with references to its various memory regions.
> > > >
> > > > But practically all modern Qualcomm platforms has a single reserved memory
> > > > region used for SMEM. So rather than having to use two nodes to describe
> > > > the one SMEM region, update the binding to allow the reserved-memory
> > > > region alone to describe SMEM.
> > > >
> > > > The olden format is preserved as valid, as this is widely used already.
> > > >
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
> > > >  1 file changed, 30 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > index f7e17713b3d8..4149cf2b66be 100644
> > > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > [...]
> > > > @@ -43,6 +55,20 @@ examples:
> > > >          #size-cells = <1>;
> > > >          ranges;
> > > >
> > > > +        smem@fa00000 {
> > >
> > > I think this is a good opportunity to make a decision which node name
> > > should be used here. :)
> >
> > reserved-memory node names are kind of a mess, so I haven't tried for
> > any standard... It needs to be solved globally.
> >
>
> I'd be happy to paint the shed any color you decide :)

I didn't ask for it to be painted. Unless it is for everyone, I don't
care unless there's some clear pattern used already.

> That said, the binding itself doesn't mandate any node name, so it's
> just the example here that would be "wrong" - and just as wrong as it
> currently is.

The example is right. The dts is wrong.

Perhaps we need a schema for 'any node name that doesn't match already
defined ones'.

> > > You use smem@ here but mentioned before that you think using the generic
> > > memory@ would be better [1]. And you use memory@ in PATCH 3/3:
> > >
> > > -               smem_mem: memory@86000000 {
> > > +               memory@86000000 {
> > > +                       compatible = "qcom,smem";
> > >                         reg = <0x0 0x86000000 0 0x200000>;
> > >                         no-map;
> > > +                       hwlocks = <&tcsr_mutex 3>;
> > >                 };
> > >
> > > However, if you would use memory@ as example in this DT schema,
> > > Rob's bot would complain with the same error that I mentioned earlier [2]:
> > >
> > > soc/qcom/qcom,smem.example.dt.yaml: memory@fa00000: 'device_type' is a required property
> > >         From schema: dtschema/schemas/memory.yaml
> > >
> > > We should either fix the error when using memory@ or start using some
> > > different node name (Stephen Boyd suggested shared-memory@ for example).
> > > Otherwise we'll just keep introducing more and more dtbs_check errors
> > > for the Qualcomm device trees.
> >
> > A different node name. A node name should only have 1 meaning and
> > 'memory' is already defined.
> >
> > The main issue here is what to name nodes with only a size and no address.
> >
>
> This particular node has both address and size (as does all of the other
> reserved-memory regions we use upstream today)...

I'm not talking about *just* QCom. If we define something here, it's
got to cover everyone.

In summary, you can't use 'memory' or anything other established,
standard node name.

Rob
