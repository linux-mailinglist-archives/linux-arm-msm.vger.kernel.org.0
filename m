Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD0F41B9E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 00:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243015AbhI1WIe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 18:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242981AbhI1WIe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 18:08:34 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3904C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 15:06:54 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id y201so365797oie.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=effDV9d5OmNZrGxqUk8CTE8A/T/EuPuDDVYR8FNgEWs=;
        b=GVgM+nTmQ6QV3mkHwerkjmCVPFjCuhYNJDSHq+HtUS/F6QXGGPzOwrllVC7bQhSahx
         mRIuwE3gSs3CiI/LyuCtHzuAnDd7Z39xeQHCQSW1xXbqW0NoJ9z0nTHTS1DR773wEAac
         rDy6JhftuOid5NmknNq+yoIYWCZVfISrsCeiKh70NYOK/sy48zfPumNfSHm7iZHPyVWI
         JX2DxSDse7/L6J8LCp0jWWLJG5GmqodrD5iKY43djCy/T6ukXyB4+PBr3PQuCc+FJHrn
         UCACOOdqqePDEln7m/T9oZRFzP9CVc3vsLFYGnRDlWy2GwD2gvrcXyvyFeCk0B76Buoj
         mowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=effDV9d5OmNZrGxqUk8CTE8A/T/EuPuDDVYR8FNgEWs=;
        b=D9aqLQTK2cD9nT+TNOgS/XusERRmgBoReTdbYizY/Nw631lGt5ySYJPH4PV02rgRgJ
         9lhv1NYwffPw33XKjiyQY8a2GtYtmT0eVL9Zhy6DUVnt+JM3abhtbSFFg0aZgjBQ3XT9
         Ilol94OPXwc6J521MIZGHE+ngG2zGsMHxfwEBNDVovR1nPpTPlnqMcjMeKTFCKWuBHyw
         yrBQlY3J/N66gKUOlE+yByU86IvyLd21ofjS/U7GwQuLaTN9JHaABPCgbSFF890akB8f
         DmjKM04qFNY0W+E6QFM0L3lF6U+3hnQwZGIb65BmaBsi0H3hV55heUzj6mS5ZukR7F8x
         xrRQ==
X-Gm-Message-State: AOAM532nbDvjBv+WfQ0Sq/4L3Pw6MaGI6g8i2r/YLutL7errwoRQWTgR
        wpvSQDS/6CwXqXAB20jscipdWIObCT5Q0g==
X-Google-Smtp-Source: ABdhPJzdy8rmbIC41Eu3O5T5PBIiLcjLW+4W8uW3AewciBlIgGdKG2BGfC2z0QapA5TW34hFez55BA==
X-Received: by 2002:aca:6283:: with SMTP id w125mr5509711oib.133.1632866813979;
        Tue, 28 Sep 2021 15:06:53 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h5sm76192oti.58.2021.09.28.15.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 15:06:53 -0700 (PDT)
Date:   Tue, 28 Sep 2021 17:06:51 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
Message-ID: <YVOR+/xfdRUwGt5D@builder.lan>
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
 <YVLszZ7U7D91oIH2@gerhold.net>
 <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
 <YVNVj68WjBBXef3h@yoga>
 <CAL_Jsq+pLhWMeObzbq2xQVK3+vVLqd3L0BNGd=CCZmhVZM8dDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+pLhWMeObzbq2xQVK3+vVLqd3L0BNGd=CCZmhVZM8dDw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Sep 14:51 CDT 2021, Rob Herring wrote:

> On Tue, Sep 28, 2021 at 12:49 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Tue 28 Sep 12:34 CDT 2021, Rob Herring wrote:
> >
> > > On Tue, Sep 28, 2021 at 5:22 AM Stephan Gerhold <stephan@gerhold.net> wrote:
> > > >
> > > > On Mon, Sep 27, 2021 at 09:45:44PM -0700, Bjorn Andersson wrote:
> > > > > In the olden days the Qualcomm shared memory (SMEM) region consisted of
> > > > > multiple chunks of memory, so SMEM was described as a standalone node
> > > > > with references to its various memory regions.
> > > > >
> > > > > But practically all modern Qualcomm platforms has a single reserved memory
> > > > > region used for SMEM. So rather than having to use two nodes to describe
> > > > > the one SMEM region, update the binding to allow the reserved-memory
> > > > > region alone to describe SMEM.
> > > > >
> > > > > The olden format is preserved as valid, as this is widely used already.
> > > > >
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > ---
> > > > >  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
> > > > >  1 file changed, 30 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > > index f7e17713b3d8..4149cf2b66be 100644
> > > > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > > > [...]
> > > > > @@ -43,6 +55,20 @@ examples:
> > > > >          #size-cells = <1>;
> > > > >          ranges;
> > > > >
> > > > > +        smem@fa00000 {
> > > >
> > > > I think this is a good opportunity to make a decision which node name
> > > > should be used here. :)
> > >
> > > reserved-memory node names are kind of a mess, so I haven't tried for
> > > any standard... It needs to be solved globally.
> > >
> >
> > I'd be happy to paint the shed any color you decide :)
> 
> I didn't ask for it to be painted. Unless it is for everyone, I don't
> care unless there's some clear pattern used already.
> 

As Stephan indicated, I feel that I'll set precedence when I change
"memory" -> "smem" in the last patch.

> > That said, the binding itself doesn't mandate any node name, so it's
> > just the example here that would be "wrong" - and just as wrong as it
> > currently is.
> 
> The example is right. The dts is wrong.
> 

But I can't both not paint the node and resolve the fact that the dts is
wrong. So which one should I go with?

Should we leave the node name as is until we've decided what to do with
the reserved-memory children? Or should I start accepting patches that
changes "memory" to a list of non-generic names?

> Perhaps we need a schema for 'any node name that doesn't match already
> defined ones'.
> 
> > > > You use smem@ here but mentioned before that you think using the generic
> > > > memory@ would be better [1]. And you use memory@ in PATCH 3/3:
> > > >
> > > > -               smem_mem: memory@86000000 {
> > > > +               memory@86000000 {
> > > > +                       compatible = "qcom,smem";
> > > >                         reg = <0x0 0x86000000 0 0x200000>;
> > > >                         no-map;
> > > > +                       hwlocks = <&tcsr_mutex 3>;
> > > >                 };
> > > >
> > > > However, if you would use memory@ as example in this DT schema,
> > > > Rob's bot would complain with the same error that I mentioned earlier [2]:
> > > >
> > > > soc/qcom/qcom,smem.example.dt.yaml: memory@fa00000: 'device_type' is a required property
> > > >         From schema: dtschema/schemas/memory.yaml
> > > >
> > > > We should either fix the error when using memory@ or start using some
> > > > different node name (Stephen Boyd suggested shared-memory@ for example).
> > > > Otherwise we'll just keep introducing more and more dtbs_check errors
> > > > for the Qualcomm device trees.
> > >
> > > A different node name. A node name should only have 1 meaning and
> > > 'memory' is already defined.
> > >
> > > The main issue here is what to name nodes with only a size and no address.
> > >
> >
> > This particular node has both address and size (as does all of the other
> > reserved-memory regions we use upstream today)...
> 
> I'm not talking about *just* QCom. If we define something here, it's
> got to cover everyone.
> 
> In summary, you can't use 'memory' or anything other established,
> standard node name.
> 

I know that "memory" is wrong, but I'm not sure about what you're asking
me to do.

Regards,
Bjorn
