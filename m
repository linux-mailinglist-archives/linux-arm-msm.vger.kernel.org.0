Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5EA41B564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 19:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241977AbhI1Rur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 13:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241520AbhI1Ruq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 13:50:46 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A559C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:49:07 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so7943864otu.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ee67sOAid6wHL8yrDSwQ2wW8ZqBQe7W4ic7SnZyjfy8=;
        b=XkGwrkSb1R6uAaHn7U04oOGdQRt47kH/S27GgW65TXmlE2fbFeeveSEdrLCk/4MOUO
         /UTt5ME2isOVlwZaH5OYnnx5uoCTuNYj2nC/tSN4SOk1NWhTh6eZ/GZrTFaIqDpRPdzO
         lh8UaOwqd9ldEX1quDBn4WgxDwjWY+quVKSRdhmOoI7p1j2mQZ5qZCSmBpFqyO6WlneW
         uxi9yt+oXIlsFXRw2bGVeNC958u+tqz2r7Sa447ChWP7mMjwV3wQ0752wig/oKUVO3Eh
         dXpiYW5tTaGKlkp6KDA7eumj6IqqImgef08A2BUG+5vdyAL7/TR/8Gz867Ge239byU3X
         vNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ee67sOAid6wHL8yrDSwQ2wW8ZqBQe7W4ic7SnZyjfy8=;
        b=gVVIpxbhT2NHtiPK3doItn6Dl6Tp+LLBHLT4izD2KQa6usUbefI8gak2Gf4x1Igt3j
         6p0MS8T75pizD7AW31R4W8ssnNUATRRfHirYCo7a6WUV0U3xLjulqFWuQtKNULbD/+oi
         KWi/FDqDy8QP9NdOO+80q7dEzVhR7T4Ea1f/0v332+EHl9yZYRgvc1V1oOHP/p4YPOfI
         h7fykDtulG9i/d+2ydmZwtE5D82X/nerIm47m5p4rbOJrsKYWO0Sg4YHpff8AWt60xFt
         v8WLGPOkTk7lovQ/HAlLMLBd9HXiAx758qXfuprtEiN0CFmkOCrFB/R/b3DGwp6m7A9a
         W+/g==
X-Gm-Message-State: AOAM531k266hDWMBIpnI5HOKuUEZ5czzk+H5e1IXbCnQfIppcAGI/nkl
        C/iV0/jKzA8yv8rC6MF3VY2akQ==
X-Google-Smtp-Source: ABdhPJyfTt/EzawBdjDkqYLPD5aqWqzUHFwedZ70wOMrQFJJcvuAQrUVr0u3d53SZEuqTVmefmT9tg==
X-Received: by 2002:a9d:7093:: with SMTP id l19mr6345851otj.15.1632851346478;
        Tue, 28 Sep 2021 10:49:06 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u2sm3080220otg.51.2021.09.28.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 10:49:06 -0700 (PDT)
Date:   Tue, 28 Sep 2021 12:49:03 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: smem: Make indirection optional
Message-ID: <YVNVj68WjBBXef3h@yoga>
References: <20210928044546.4111223-1-bjorn.andersson@linaro.org>
 <YVLszZ7U7D91oIH2@gerhold.net>
 <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+66j8Y5y+PQ+mezkaxN1pfHFKz524YUF4Lz_OU5E-mZQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 28 Sep 12:34 CDT 2021, Rob Herring wrote:

> On Tue, Sep 28, 2021 at 5:22 AM Stephan Gerhold <stephan@gerhold.net> wrote:
> >
> > On Mon, Sep 27, 2021 at 09:45:44PM -0700, Bjorn Andersson wrote:
> > > In the olden days the Qualcomm shared memory (SMEM) region consisted of
> > > multiple chunks of memory, so SMEM was described as a standalone node
> > > with references to its various memory regions.
> > >
> > > But practically all modern Qualcomm platforms has a single reserved memory
> > > region used for SMEM. So rather than having to use two nodes to describe
> > > the one SMEM region, update the binding to allow the reserved-memory
> > > region alone to describe SMEM.
> > >
> > > The olden format is preserved as valid, as this is widely used already.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  .../bindings/soc/qcom/qcom,smem.yaml          | 34 ++++++++++++++++---
> > >  1 file changed, 30 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > index f7e17713b3d8..4149cf2b66be 100644
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> > > [...]
> > > @@ -43,6 +55,20 @@ examples:
> > >          #size-cells = <1>;
> > >          ranges;
> > >
> > > +        smem@fa00000 {
> >
> > I think this is a good opportunity to make a decision which node name
> > should be used here. :)
> 
> reserved-memory node names are kind of a mess, so I haven't tried for
> any standard... It needs to be solved globally.
> 

I'd be happy to paint the shed any color you decide :)

That said, the binding itself doesn't mandate any node name, so it's
just the example here that would be "wrong" - and just as wrong as it
currently is.

> >
> > You use smem@ here but mentioned before that you think using the generic
> > memory@ would be better [1]. And you use memory@ in PATCH 3/3:
> >
> > -               smem_mem: memory@86000000 {
> > +               memory@86000000 {
> > +                       compatible = "qcom,smem";
> >                         reg = <0x0 0x86000000 0 0x200000>;
> >                         no-map;
> > +                       hwlocks = <&tcsr_mutex 3>;
> >                 };
> >
> > However, if you would use memory@ as example in this DT schema,
> > Rob's bot would complain with the same error that I mentioned earlier [2]:
> >
> > soc/qcom/qcom,smem.example.dt.yaml: memory@fa00000: 'device_type' is a required property
> >         From schema: dtschema/schemas/memory.yaml
> >
> > We should either fix the error when using memory@ or start using some
> > different node name (Stephen Boyd suggested shared-memory@ for example).
> > Otherwise we'll just keep introducing more and more dtbs_check errors
> > for the Qualcomm device trees.
> 
> A different node name. A node name should only have 1 meaning and
> 'memory' is already defined.
> 
> The main issue here is what to name nodes with only a size and no address.
> 

This particular node has both address and size (as does all of the other
reserved-memory regions we use upstream today)...

Regards,
Bjorn
