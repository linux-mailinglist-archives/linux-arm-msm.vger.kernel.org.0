Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 502E53AFA61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 03:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFVBCm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 21:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhFVBCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 21:02:41 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C84C061574;
        Mon, 21 Jun 2021 18:00:25 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id f10so12345271iok.6;
        Mon, 21 Jun 2021 18:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mt21cFemr1uGIYO6Ni8xKf8eOU75PbYRiUnsYWmiaWA=;
        b=UXxu4eiXCBNp3XRrs97cNQdLCSuki1lNkO5xcdCdE356Qg7cRy276nOxILNgBcxzsl
         ZxJX0Qu+MEMiybwpd8mL82hZmgZkrn0o/gMXU3Oa3eKtObR+W65rPF2B19ousmx0LKJX
         4NEo0oNipD6kL5xg1PBBWSGX2/ykQi2wI1I6z5cKrp/ymTnWXezPAhCv8MY6gxyHZwA9
         pDhCvdcf4IIhROu6g+3oygcsE+mDeQXfkpWBVmJXQ+2M9R1hCiYXDCdeR2b9+ydEnKSB
         Fwsklylbmwdhnu4NFbnWn3REhsnlOf6TjlND2XhwPzxZW2VWpWS3SClTWDO+SMVL7okY
         V/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mt21cFemr1uGIYO6Ni8xKf8eOU75PbYRiUnsYWmiaWA=;
        b=bs3DQD93z+NrugmukuQuaGVqHbZ4OR4NwqrqJKDnyrPRS0h0gvpxt7+Xf6HTxbske/
         h1I2fC3swWNXyHq1rc3473JeUAB+PIl/lkqWKIgzV1jOrsbBxJpxRG1pWT+UdVVjHIxn
         DCEQ+5RbA8+Ywsr5FL/LCWrWXN9o0/yJfztUbaeeeprM6DgDDcBu3FIuiEjaqTYK3lFH
         C2v+0j1hGQ+gTMucAeoIrUlXOBhw6og37x/6S/W6RM0+Z9b5x/odO/eicUuKlQRiJTzQ
         Rfb3bcOAvCDCNaGV3NPiurD8lBSrbU8dUXkU6ih7KVdKboPoquq3RPpbuJt59jBIIXFA
         99lw==
X-Gm-Message-State: AOAM532GbQI+D3zCq3IY4vAJL23tb3mvc+HwS8B6Z9SyzYvMBY5L9AZn
        AyaaRfpZ6uGBQjGtO+2qQZHD2QypQ/n2ihRNcDXBdH2dCyUPow==
X-Google-Smtp-Source: ABdhPJwYBbXcefLhcu+PWD1HrBfsDhAre9yVj7OYRvNyQ7YV5qYnx6zoiZBqLfiwE1E64JxyAcZjhvQiyT9tr77xAtc=
X-Received: by 2002:a5d:8242:: with SMTP id n2mr663422ioo.198.1624323625054;
 Mon, 21 Jun 2021 18:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org> <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com> <YNEiUMBqGAx1zLVX@yoga>
In-Reply-To: <YNEiUMBqGAx1zLVX@yoga>
From:   Jassi Brar <jassisinghbrar@gmail.com>
Date:   Mon, 21 Jun 2021 20:00:14 -0500
Message-ID: <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
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

On Mon, Jun 21, 2021 at 6:35 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:
>
> > On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > >
> > > > On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > >
> > > > > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > > > > <martin.botka@somainline.org> wrote:
> > > > > >
> > > > > > This commit adds compatible for the SM6125 SoC
> > > > > >
> > > > > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > > > > ---
> > > > > > Changes in V2:
> > > > > > None
> > > > > > Changes in V3:
> > > > > > Change compatible to apcs-hmss-global
> > > > > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > > > > >  1 file changed, 5 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > index f25324d03842..f24c5ad8d658 100644
> > > > > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > > > > >         .offset = 8, .clk_name = NULL
> > > > > >  };
> > > > > >
> > > > > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > > > > +       .offset = 8, .clk_name = NULL
> > > > > > +};
> > > > > > +
> > > > > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > > > > >         .offset = 12, .clk_name = NULL
> > > > > >  };
> > > > > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > > > > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > > > > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > > > > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > > > > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > > > > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > > > > >         {}
> > > > > >
> > > > > These all are basically different names for the same controller.
> > > > > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > > > > is basically some "always-on" clock.
> > > > > I am sure we wouldn't be doing it, if the controller was third-party.
> > > >
> > > > If newer implementations are 'the same', then they should have a
> > > > fallback compatible to the existing one that is the same and no driver
> > > > change is needed. If the differences are board or instance (within an
> > > > SoC) specific, then a DT property would be appropriate.
> > > >
> > > The controllers (13 now) only differ by the 'offset' where the
> > > registers are mapped. Clock-name is a pure s/w artifact.
> > > So, maybe we could push all these in DT.
> >
> > Why is 'reg' not used for the offset?
> >
>
> The DT node and its "reg" describes the whole IP block.
>
> The particular register that we care of has, as you can see, moved
> around during the various platforms and some incarnations of this IP
> block provides controls for CPU-related clocks as well.
>
> We can certainly have the multiple compatible points to the same
> apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
> given that I don't see any natural groupings.
>
Any platform that comes later may reuse the already available compatible.
For example drop this patch and reuse "qcom,sdm660-apcs-hmss-global" ?

> > In any case, we can't really get rid of the first 13 instances though...
> >
>
> Right, we have the problem that we have DTBs out there that relies on
> these compatibles, but as Jassi requests we'd have to start describing
> the internal register layout in DT - which this binding purposefully
> avoids.
>
Not these strings, but 'offset' and 'clock-name' as optional
properties that new platforms can use.

cheers.
