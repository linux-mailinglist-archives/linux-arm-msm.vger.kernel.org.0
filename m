Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8823C24DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 15:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbhGINZX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 09:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbhGINZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 09:25:12 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46865C0617A7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 06:22:28 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id f5so4485282qvu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aUdetFpscS7z5mzy6zDPEGWjEPyrEwCZ6IQKdhH5RqU=;
        b=f+1d67OBKROioDqaoZP3olVJvJePOGGDY4hvk8uwOWpHh81rQi3F7lWMDqXIMfN9Zi
         fdeKziL1dyXDjYTe3hQXSjxqdOBDg73SMN0xtwj0FaXUyCjdr+QcfE2Tz8b4E6DzSiB3
         rIFUTrxkcBLEeLk7HSsMH3nr7rJYfiGfZ5gYzq+jQ3RN+5FVJWzFzC5aZvE0aI1XaqbG
         EdS9PwNe9S0NYTtJ9q7Ooc9wa+3SMjdfjCHg2t/UUUmhQJ9CYPRbSGnWwoNDJ6A/jybj
         l9FApuUjfv6J4EOgB1vpgRhFHIp7N1+cGjesePlupAOQfUVQm+AlvDQdIK+vrMJ7kg/L
         fdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUdetFpscS7z5mzy6zDPEGWjEPyrEwCZ6IQKdhH5RqU=;
        b=MVijkOoEAFnPqSvt5O4TASP6yPyyDoqGIbbx0jqDa3PQ0E1zPAUyv2rFZxfKVDOtd0
         G5fSu+p4PjejbZ+HIAcbhJyu1H3Wg4wO2Acb6P3LZddzGLTlTAnzzjnOfApVwrhWvKGh
         u/sGkrvYVB1yokR3YPxkWuf0TP2Iyxnf5UP8lSEs+uX+/MlTt/4AUiJW4ZFwalHBUJ/k
         M1uf8KPnq3nMyxyCTRl8sNM3IXQ8w+l/IXgVFD8OsSgHQrbuAhGWjxMFX0CveRwY9whB
         PRtN5vIly1fSL/ln5qS2NcMTEmXo9pSaQwApaT9zoJ9SkGNcdnybHrhJ2HHj6Ypyh3U0
         NU/w==
X-Gm-Message-State: AOAM530RddOiT9gfyUVm8OqJOxwOauMTTFeYKWoRjz6ITL8fQEJcAxBR
        V6lQFjrzMbQWBfo4vb8ImjolUYOmwdl6q3QpdwMPAw==
X-Google-Smtp-Source: ABdhPJzdB0FYlrfuu64VS+J5VILBGu9IkUAR2Hrqo8yWahFjCk3lhWfpwC7c5b1gLQOHxPFY72rpDJMVgx2wawg2s40=
X-Received: by 2002:a05:6214:1cb:: with SMTP id c11mr36374856qvt.47.1625836947110;
 Fri, 09 Jul 2021 06:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org> <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
 <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
 <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
 <CAA8EJpr2HEm4R+bGrH6DHA_z8bjN69Zam9UUiAeKAr5vsCKr3A@mail.gmail.com> <CAPDyKFr+-qXbi4z4_wzDRaMMLKSKM7zNr55Kt-AOk97mVKM+8A@mail.gmail.com>
In-Reply-To: <CAPDyKFr+-qXbi4z4_wzDRaMMLKSKM7zNr55Kt-AOk97mVKM+8A@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jul 2021 16:22:15 +0300
Message-ID: <CAA8EJpr+N-GwY63SSpqURBrQ=Xmx51MAFZzXqSiD6x89yB-DAQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power
 domain support
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Jul 2021 at 16:14, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 14:59, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 9 Jul 2021 at 15:18, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Fri, 9 Jul 2021 at 13:46, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, 9 Jul 2021 at 12:33, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > >
> > > > > On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > > however this has some consequences, as genpd code is not reentrant.
> > > > > >
> > > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > > using them for gdsc control.
> > > > > >
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >
> > > > > [...]
> > > > >
> > > > > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > > > > index 51ed640e527b..9401d01533c8 100644
> > > > > > --- a/drivers/clk/qcom/gdsc.c
> > > > > > +++ b/drivers/clk/qcom/gdsc.c
> > > > > > @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
> > > > > >                         continue;
> > > > > >                 scs[i]->regmap = regmap;
> > > > > >                 scs[i]->rcdev = rcdev;
> > > > > > +               scs[i]->pd.dev.parent = desc->dev;
> > > > > >                 ret = gdsc_init(scs[i]);
> > > > > >                 if (ret)
> > > > > >                         return ret;
> > > > > > @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
> > > > > >                         continue;
> > > > > >                 if (scs[i]->parent)
> > > > > >                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > > > > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > > > >
> > > > > So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
> > > > > called for gdsc platform device from the platform bus', to try to
> > > > > attach the device to its corresponding PM domain.
> > > > >
> > > > > Looking a bit closer to genpd_dev_pm_attach(), I realize that we
> > > > > shouldn't really try to attach a device to its PM domain, when its OF
> > > > > node (dev->of_node) contains a "#power-domain-cells" specifier. This
> > > > > is because it indicates that the device belongs to a genpd provider
> > > > > itself. In this case, a "power-domains" specifier tells that it has a
> > > > > parent domain.
> > > > >
> > > > > I will post a patch that fixes this asap.
> > > >
> > > > I think there is nothing to fix here. The dispcc/videocc drivers
> > > > provide clocks in addition to the gdsc power domain. And provided
> > > > clocks would definitely benefit from having the dispcc device being
> > > > attached to the power domain which governs clock registers (MMCX in
> > > > our case). Thus I think it is perfectly valid to have:
> > > >
> > > > rpmhpd device:
> > > >  - provides MMCX domain.
> > > >
> > > > dispcc device:
> > > >  - is attached to the MMCX domain,
> > >
> > > We don't need this, it's redundant and weird to me.
> > >
> > > Also I am kind of worried that you will hit another new path in genpd,
> > > causing locking issues etc, as it has not been designed to work like
> > > this (a provider device and a child domain sharing the same "parent").
> >
> > So, which domain should the dispcc device belong to? It's registers
> > are powered by the MMCX domain. I can not attach it to the child
> > (GDSC) domain either: in the case of videocc there are 4 child
> > domains.
>
> The dispcc device should *not* be attached to a PM domain.
>
> Instead it should be registered as a genpd provider and the
> corresponding PM domains it provides, should be assigned as child
> domains to the MMCX domain.
>
> This is exactly what the child/parent domain support in genpd is there
> to help with.

This is done in this patchset. If we stop attaching dispcc to the MMCX
genpd, I'll have to locate it in a different way, but the idea is
implemented here.

> > An alternative would be to request that all users of the provided
> > clocks power on one of the child domains. However this is also not
> > perfect. If some generic code (e.g. clock framework) calls into
> > provided clocks (e.g. because of assigned-clock-rates), this can
> > happen w/o proper power domain being powered up yet.
>
> Issues with power on/off synchronization during genpd initializations
> and genpd provider registration, certainly need to be fixed and I am
> happy to help. However, my point is that I think it's a bad idea to
> fix it through modelling the PM domain hierarchy in an incorrect way.

So, which device should I pass to clk_register to handle runtime PM
for the provided clocks? dispcc, should I not?
Then if the dispcc is not attached, we will have to manually handle
MMCX from dispcc's runtime pm callbacks. Correct?

Could you please be more specific, why is it so wrong to attach dispcc
to the MMCX genpd?


-- 
With best wishes
Dmitry
