Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02D53B078E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 16:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbhFVOkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 10:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbhFVOkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 10:40:23 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13806C061574;
        Tue, 22 Jun 2021 07:38:06 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id r12so327333ioa.7;
        Tue, 22 Jun 2021 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DzzkeguR/nrxazN/TGnT3TfflLlbT2VClQmTxoJCeAA=;
        b=ic/vMrEyPRjHpxQqxJjYPe0hHUf0zJQCxbPrM23RAzyTMjUC3ObuYjzX/PuB7zfm5C
         ry9oJDsbeOubGjhcnnK8dx5+33aM+JOhQBnkX/2/2gMz0ehlxFTBmzzTpVNbqQToqlih
         runRl8eWBfxkRVXSCthqg3m4jXLktI+R7wA0jQTF1jl0+ffNQWjqcDnVqWrFhYwU590q
         RhxGFkXDWdpkAtmLkb8WgQWtTnm6zZiiq1XiCHwnmFTdxtvfPcN0ThDaqmcgYecabPoM
         OHC9xZX20qx775MuqIR7xyBbLcSBxmSEvLoErHOd84vhPDAtE/M2yXmWVjQ7b9B8h11R
         BD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DzzkeguR/nrxazN/TGnT3TfflLlbT2VClQmTxoJCeAA=;
        b=b4++Z9WbA7BteTuxYbAe5JBQStFhcSkaQ0bHSaEEwkYNdeZJiU9+KrdVhrcBOYPjes
         /O0FJCx9+uRU4tumNELmTbqaaqX83C2cbpDuHiDFe1TPc2lt3wQ5Ch2fTUTN6W63WtcR
         aA/kN1PoVOtu0kjvL+lFU9eXQgylJUW2vtf8enyzgpiL1mW23zN4G5ULogHDp+hXGnVW
         TPR2aqRJwDYMk0WLdBuERDoY9dui03roVpmacGqfBLhIwTUezfocrufyOdHYmF+GWepG
         uF0aVDU1N4069mosznYYGeZvKl9D8tsV10kBGxgcU6mgCNYt1ntSlXxx03kk6LumVjZm
         ehvQ==
X-Gm-Message-State: AOAM530cDP0j7d/KnRYIhS5Qa+kN3ixQ2bwp3B7OTm7mgeplOlN5UgRI
        sftxB/z0SVJRfucrSe3DIyeLU78csARpLFU/K1vYev5Y
X-Google-Smtp-Source: ABdhPJxz5Fo9nOW024fve0al2gRl+3QICrg9pstMFkpPNjG+10GR6yw5ri47cJjJ0tc+cJipcSgqP4P1xbnuahiTUrM=
X-Received: by 2002:a05:6638:1446:: with SMTP id l6mr3810822jad.14.1624372685555;
 Tue, 22 Jun 2021 07:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga> <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga> <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
 <YNFegmmCzk6JUTN+@yoga>
In-Reply-To: <YNFegmmCzk6JUTN+@yoga>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Tue, 22 Jun 2021 09:37:54 -0500
Message-ID: <CABb+yY1PB+AqjGkRP3rgDbN6Sy4HUCh3gME2+aQTA4oeO01F6w@mail.gmail.com>
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        jamipkettunen@somainline.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 10:52 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:


> > > > > > In any case, we can't really get rid of the first 13 instances though...
> > > > > >
> > > > >
> > > > > Right, we have the problem that we have DTBs out there that relies on
> > > > > these compatibles, but as Jassi requests we'd have to start describing
> > > > > the internal register layout in DT - which this binding purposefully
> > > > > avoids.
> > > > >
> > > > Not these strings, but 'offset' and 'clock-name' as optional
> > > > properties that new platforms can use.
> > > >
> > >
> > > Relying on completely generic compatibles to match the driver and then
> > > distinguish each platform using additional properties is exactly what
> > > Qualcomm does downstream.  The community has clarified countless times
> > > that this is not the way to write DT bindings.
> > >
> > Yes, and I don't suggest it otherwise. For h/w quirks and
> > extra/missing features, it does make sense to have different
> > compatibles.
> >
>
> But what you're suggesting assumes that they are the same and that we're
> done implementing all the software for this block. The platform specific
> compatible allows us to postpone that question.
>
It has been 4yrs and 13 platforms. The compatible strings are used
only to match the hardcoded 'offset' values. Maybe we cross the bridge
when we get to it.
I think, when the drivers are enhanced and the kernel binary needs to
be updated, we could update the dtb as well? Or is it too hard on
these platforms?

cheers.
