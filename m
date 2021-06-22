Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA6993AFB86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 05:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFVDzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 23:55:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFVDzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 23:55:05 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E59C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 20:52:37 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id s20-20020a4ae9940000b02902072d5df239so5045265ood.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 20:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AU+tWXOji54LjjaoRG6OyKC2CGXKLIzcMVRv39k4Hj8=;
        b=DR2zVAHZcxBcxA4fV1KDu36W9rCAiq0FWJmPZFMIJX9YWaJ35UajD+t/vVu8yy0yXk
         WTL/lRn0AdZHTUTC337uB7DpQViZwK99r0CM10RBo+U1mRhsJ50Ft72F6cmnWfJKLJPa
         u78YjMioTOMGGGeAQkZOHcl30lYu0ErbOW8uZJDdRRAWHufiaGSH4AdwEBhT7Z1YufOP
         tbqelJy+3/0QVTDyca87IOq/RdaBQDoLLAWBgSGC9OUu4dMuY+qwR0VJDVfBKTy8dNEN
         sO6Hju30vQwYRa5tdYk9gISIqQTyFgo+QL0tc0S/zfQLU6Tj8BWuyPWHAyBFaePULeAC
         BmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AU+tWXOji54LjjaoRG6OyKC2CGXKLIzcMVRv39k4Hj8=;
        b=fTxg7oot9y6UJa07C0PfKYu1jcA1mfF6PmRx2mYSOtVOPhSVDdLRD/fZUDyRiWXgwn
         rZUpVWulMpqbowtCVyMubi8zuIu9hZGwVS1ap4FroUPrLE08toyOQKuzC2v6/KA7M2Jm
         zfcoJqJBms01iLxOjDdPburpj0MLDikjTNGSRbywaC0gw66drzMcM5AVnMlm//Cu8/Ru
         XrtR7FOiS+1eZJRfqhrHRVLXmUB6Z1OWcGMgRHUhb7K24Z/ep963ErfHG09QJfga1obx
         g7zei47eA4t9a+y7QDQMzLrfJmwKk3seCxj2KZk0EszYZFjKzOEUp77nZ6DmDMcXNjNH
         nuag==
X-Gm-Message-State: AOAM533Wa0BmTrhdM87kVE/mdICFNz6cC8wyPYp5R8VT3rwRQecxuJ5+
        YFcj+zrspbTJgu4WKrFj/C+TbQ==
X-Google-Smtp-Source: ABdhPJy1HmQ1gHZDzA+hsJGSLhIep0RS7cnefS95NEdLm0b2spxk4/qMuRCx/69z1Gz7IPxY0kHdEA==
X-Received: by 2002:a4a:e2d0:: with SMTP id l16mr1408034oot.80.1624333956657;
        Mon, 21 Jun 2021 20:52:36 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r2sm4395683otd.54.2021.06.21.20.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 20:52:36 -0700 (PDT)
Date:   Mon, 21 Jun 2021 22:52:34 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
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
Subject: Re: [PATCH V3 3/3] mailbox: qcom-apcs: Add SM6125 compatible
Message-ID: <YNFegmmCzk6JUTN+@yoga>
References: <20210612094631.89980-1-martin.botka@somainline.org>
 <20210612094631.89980-3-martin.botka@somainline.org>
 <CABb+yY3BYYC2na8EFunEeu0XCfLXrUQon=hF3q5p=+FUoigoyw@mail.gmail.com>
 <CAL_JsqLWqtAtqLRF-MAnq80NMfD0a+CfWPv8JWjjNTJFgMjCxg@mail.gmail.com>
 <CABb+yY0sdSinTm788pMFrqEZ6QMC2OwCP7Kkto+pG9h1aGMzwQ@mail.gmail.com>
 <CAL_JsqKdoMwpL_tYC7VQRAG2AC5nR4diShMQCgDseObcgU+egQ@mail.gmail.com>
 <YNEiUMBqGAx1zLVX@yoga>
 <CABb+yY2wy4iSKjn+SihQ=FE=YwcEzUNOpGw_CV22Anzgbba8hA@mail.gmail.com>
 <YNFKpvhXyZbs8RE1@yoga>
 <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABb+yY3RpQYvNBHvpwZearpBPph0uj8YQwX2qu=TX=QAO6OFBw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Jun 22:34 CDT 2021, Jassi Brar wrote:

> On Mon, Jun 21, 2021 at 9:27 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 21 Jun 20:00 CDT 2021, Jassi Brar wrote:
> >
> > > On Mon, Jun 21, 2021 at 6:35 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > On Mon 21 Jun 18:19 CDT 2021, Rob Herring wrote:
> > > >
> > > > > On Mon, Jun 21, 2021 at 5:10 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 21, 2021 at 2:46 PM Rob Herring <robh+dt@kernel.org> wrote:
> > > > > > >
> > > > > > > On Sun, Jun 20, 2021 at 10:03 PM Jassi Brar <jassisinghbrar@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Jun 12, 2021 at 4:46 AM Martin Botka
> > > > > > > > <martin.botka@somainline.org> wrote:
> > > > > > > > >
> > > > > > > > > This commit adds compatible for the SM6125 SoC
> > > > > > > > >
> > > > > > > > > Signed-off-by: Martin Botka <martin.botka@somainline.org>
> > > > > > > > > ---
> > > > > > > > > Changes in V2:
> > > > > > > > > None
> > > > > > > > > Changes in V3:
> > > > > > > > > Change compatible to apcs-hmss-global
> > > > > > > > >  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 5 +++++
> > > > > > > > >  1 file changed, 5 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > > index f25324d03842..f24c5ad8d658 100644
> > > > > > > > > --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > > +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> > > > > > > > > @@ -57,6 +57,10 @@ static const struct qcom_apcs_ipc_data sdm660_apcs_data = {
> > > > > > > > >         .offset = 8, .clk_name = NULL
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +static const struct qcom_apcs_ipc_data sm6125_apcs_data = {
> > > > > > > > > +       .offset = 8, .clk_name = NULL
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > >  static const struct qcom_apcs_ipc_data apps_shared_apcs_data = {
> > > > > > > > >         .offset = 12, .clk_name = NULL
> > > > > > > > >  };
> > > > > > > > > @@ -166,6 +170,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
> > > > > > > > >         { .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > > >         { .compatible = "qcom,sdm660-apcs-hmss-global", .data = &sdm660_apcs_data },
> > > > > > > > >         { .compatible = "qcom,sdm845-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > > > +       { .compatible = "qcom,sm6125-apcs-hmss-global", .data = &sm6125_apcs_data },
> > > > > > > > >         { .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
> > > > > > > > >         { .compatible = "qcom,sdx55-apcs-gcc", .data = &sdx55_apcs_data },
> > > > > > > > >         {}
> > > > > > > > >
> > > > > > > > These all are basically different names for the same controller.
> > > > > > > > The 'offset' is a configuration parameter and the 'clock', when NULL,
> > > > > > > > is basically some "always-on" clock.
> > > > > > > > I am sure we wouldn't be doing it, if the controller was third-party.
> > > > > > >
> > > > > > > If newer implementations are 'the same', then they should have a
> > > > > > > fallback compatible to the existing one that is the same and no driver
> > > > > > > change is needed. If the differences are board or instance (within an
> > > > > > > SoC) specific, then a DT property would be appropriate.
> > > > > > >
> > > > > > The controllers (13 now) only differ by the 'offset' where the
> > > > > > registers are mapped. Clock-name is a pure s/w artifact.
> > > > > > So, maybe we could push all these in DT.
> > > > >
> > > > > Why is 'reg' not used for the offset?
> > > > >
> > > >
> > > > The DT node and its "reg" describes the whole IP block.
> > > >
> > > > The particular register that we care of has, as you can see, moved
> > > > around during the various platforms and some incarnations of this IP
> > > > block provides controls for CPU-related clocks as well.
> > > >
> > > > We can certainly have the multiple compatible points to the same
> > > > apcs_data, but I'm not able to spot a reasonable "catch-all compatible"
> > > > given that I don't see any natural groupings.
> > > >
> > > Any platform that comes later may reuse the already available compatible.
> > > For example drop this patch and reuse "qcom,sdm660-apcs-hmss-global" ?
> > >
> >
> > The problem is that this would change the meaning of
> > "qcom,sdm660-apcs-hmss-global" from meaning "The apcs hmss global block
> > _in_ sdm660" to "any random apcs block with the mailbox register at
> > offset 8".
> >
> To me, the deeper problem seems to be naming a controller "The apcs
> hmss global block _in_ sdm660" just because the h/w manual hasn't
> given a name to it.  But that is okay too, if we name the subsequent
> controllers as "the same as one in sdm660" and provide the h/w
> configuration 'offset' via a DT property.
> 

As I said, I'd need to dig through the hardware documentation for the
various platforms to see if I can find what the common denominators are.
We've always seen this as "the apcs hmss global block _in_ <platform>".

> > > > > In any case, we can't really get rid of the first 13 instances though...
> > > > >
> > > >
> > > > Right, we have the problem that we have DTBs out there that relies on
> > > > these compatibles, but as Jassi requests we'd have to start describing
> > > > the internal register layout in DT - which this binding purposefully
> > > > avoids.
> > > >
> > > Not these strings, but 'offset' and 'clock-name' as optional
> > > properties that new platforms can use.
> > >
> >
> > Relying on completely generic compatibles to match the driver and then
> > distinguish each platform using additional properties is exactly what
> > Qualcomm does downstream.  The community has clarified countless times
> > that this is not the way to write DT bindings.
> >
> Yes, and I don't suggest it otherwise. For h/w quirks and
> extra/missing features, it does make sense to have different
> compatibles.
> 

But what you're suggesting assumes that they are the same and that we're
done implementing all the software for this block. The platform specific
compatible allows us to postpone that question.

> However, for _trivial_ variations let us get that value from DT.
> 'offset' is anyway a h/w property.
> That way we won't be distinguishing platforms using dt properties, but
> only support different platforms seamlessly.
> 

As I said previously, this goes against the direction provided by the DT
maintainers. If a property is platform specific this should be expressed
by the compatible.

> On second thought, we have grown from 2 to 13 aliases in 4 yrs. I only
> have to ignore 3 times/annum to lead a peaceful life ;)
> 

True, but I'll try to find some time to see if we have some reuse of the
IP block to allow us to use some generic compatible.

We'd still need a patch in the DT binding for every single platform, but
we should be able to avoid the compatible additions in the driver.

Regards,
Bjorn
