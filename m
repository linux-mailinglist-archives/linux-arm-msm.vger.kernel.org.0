Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120003C25AD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 16:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhGIORm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 10:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232200AbhGIORl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 10:17:41 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2164BC0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 07:14:57 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id a6so9423675qka.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=igRa73Ep9fDKPnsyNmc5V2ieW+E+odN7WzNW9RCcwxw=;
        b=J6azk59ix+0PU2toomtSuFZVu9fQRhRJqIgschSBWLXFE0e42W4vVLmhiiYkmObgpM
         BDUsVxNiO8oW6qlbp7gTp1dUXArSvrEJxNhfwD28yqOX1z9OHgL2WslTvbIZAc3acZ4h
         wymEWYBCZjaySKQ4LpzREGZvcpcOf2aaPXevuR6M44doGD5Jk30GsLKNzlPJw6Vb1HEh
         LreEEVIwG9vaV3dl2Jp8RIR61g/6zsLh5Omj6EaAptaj0d9iib1/OnGQhsQSTT6a0mqh
         xMVy4I5aaTnBt4XGdHQbGVJF0oe3hzVOB/gQu+94TtMHqEWZ5yNwec6RUt2r4kjAG5TB
         UJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=igRa73Ep9fDKPnsyNmc5V2ieW+E+odN7WzNW9RCcwxw=;
        b=TczCk5VBDZq7akLHeq3JLX3NaC3+hJTz2mgrKSjWb9vQCt+tb+XI/DYiwhxFMEc8Od
         uwKpDOu3b4h3t+tln/kqNs0dlzNs3Ke5mGTiTiNyUsCW+8VZ6oem9OA7h6bQiJuyL7cc
         zs6G4hTP6joPNSJz8oCFutYJsxEycYSo8SmpptStubyHeVoxpOSSUT1UoHiT53Ia6YDx
         BryGb2TEbhHzPMjUf4ALK6yA4Zd5bIozk5JW9dcXZqYQwARktD+ELc6GZs6sRTksT03I
         C+v5Yd/RIRZfhFpET6p6suqq514IVhJMNyHXDdXcQjbT802wwnFD/cZWKTsVP0j5W6EW
         zS/g==
X-Gm-Message-State: AOAM532yCPqxMeTa7V9FKDHhwo+EzU3P4D8pYY1h7XvRj7QAserdMLVl
        9bwrIpX8ZTfDSnxhzJKQOq1j1eMqk/L56B8oLM2gmQ==
X-Google-Smtp-Source: ABdhPJw6Jq6Jvctn4bU55o8MGFoXji5V6u32cBfCAnYqa1YfeUZo+HZW3nJNwMx7aTSlO7/isQiA3mqToUJDuPKouGo=
X-Received: by 2002:ae9:e643:: with SMTP id x3mr31130102qkl.162.1625840096249;
 Fri, 09 Jul 2021 07:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org> <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
 <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
 <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
 <CAA8EJpr2HEm4R+bGrH6DHA_z8bjN69Zam9UUiAeKAr5vsCKr3A@mail.gmail.com>
 <CAPDyKFr+-qXbi4z4_wzDRaMMLKSKM7zNr55Kt-AOk97mVKM+8A@mail.gmail.com>
 <CAA8EJpr+N-GwY63SSpqURBrQ=Xmx51MAFZzXqSiD6x89yB-DAQ@mail.gmail.com> <CAPDyKFp8xfaBhNoR1KzKwBpnvEnRPfby8SeJ7TAeyaS4LTYjrA@mail.gmail.com>
In-Reply-To: <CAPDyKFp8xfaBhNoR1KzKwBpnvEnRPfby8SeJ7TAeyaS4LTYjrA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jul 2021 17:14:43 +0300
Message-ID: <CAA8EJpp_oFgT66FPavw0WBe71MiPLy+aqqdY3+deTayJRa1kYg@mail.gmail.com>
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

On Fri, 9 Jul 2021 at 17:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 15:22, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Fri, 9 Jul 2021 at 16:14, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Fri, 9 Jul 2021 at 14:59, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > On Fri, 9 Jul 2021 at 15:18, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > >
> > > > > On Fri, 9 Jul 2021 at 13:46, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > >
> > > > > > On Fri, 9 Jul 2021 at 12:33, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > > >
> > > > > > > On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> > > > > > > <dmitry.baryshkov@linaro.org> wrote:
> > > > > > > >
> > > > > > > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > > > > > > domain. Currently we used a regulator to enable this domain on demand,
> > > > > > > > however this has some consequences, as genpd code is not reentrant.
> > > > > > > >
> > > > > > > > Teach Qualcomm clock controller code about setting up power domains and
> > > > > > > > using them for gdsc control.
> > > > > > > >
> > > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >
> > > > > > > [...]
> > > > > > >
> > > > > > > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > > > > > > index 51ed640e527b..9401d01533c8 100644
> > > > > > > > --- a/drivers/clk/qcom/gdsc.c
> > > > > > > > +++ b/drivers/clk/qcom/gdsc.c
> > > > > > > > @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
> > > > > > > >                         continue;
> > > > > > > >                 scs[i]->regmap = regmap;
> > > > > > > >                 scs[i]->rcdev = rcdev;
> > > > > > > > +               scs[i]->pd.dev.parent = desc->dev;
> > > > > > > >                 ret = gdsc_init(scs[i]);
> > > > > > > >                 if (ret)
> > > > > > > >                         return ret;
> > > > > > > > @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
> > > > > > > >                         continue;
> > > > > > > >                 if (scs[i]->parent)
> > > > > > > >                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > > > > > > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> > > > > > >
> > > > > > > So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
> > > > > > > called for gdsc platform device from the platform bus', to try to
> > > > > > > attach the device to its corresponding PM domain.
> > > > > > >
> > > > > > > Looking a bit closer to genpd_dev_pm_attach(), I realize that we
> > > > > > > shouldn't really try to attach a device to its PM domain, when its OF
> > > > > > > node (dev->of_node) contains a "#power-domain-cells" specifier. This
> > > > > > > is because it indicates that the device belongs to a genpd provider
> > > > > > > itself. In this case, a "power-domains" specifier tells that it has a
> > > > > > > parent domain.
> > > > > > >
> > > > > > > I will post a patch that fixes this asap.
> > > > > >
> > > > > > I think there is nothing to fix here. The dispcc/videocc drivers
> > > > > > provide clocks in addition to the gdsc power domain. And provided
> > > > > > clocks would definitely benefit from having the dispcc device being
> > > > > > attached to the power domain which governs clock registers (MMCX in
> > > > > > our case). Thus I think it is perfectly valid to have:
> > > > > >
> > > > > > rpmhpd device:
> > > > > >  - provides MMCX domain.
> > > > > >
> > > > > > dispcc device:
> > > > > >  - is attached to the MMCX domain,
> > > > >
> > > > > We don't need this, it's redundant and weird to me.
> > > > >
> > > > > Also I am kind of worried that you will hit another new path in genpd,
> > > > > causing locking issues etc, as it has not been designed to work like
> > > > > this (a provider device and a child domain sharing the same "parent").
> > > >
> > > > So, which domain should the dispcc device belong to? It's registers
> > > > are powered by the MMCX domain. I can not attach it to the child
> > > > (GDSC) domain either: in the case of videocc there are 4 child
> > > > domains.
> > >
> > > The dispcc device should *not* be attached to a PM domain.
> > >
> > > Instead it should be registered as a genpd provider and the
> > > corresponding PM domains it provides, should be assigned as child
> > > domains to the MMCX domain.
> > >
> > > This is exactly what the child/parent domain support in genpd is there
> > > to help with.
> >
> > This is done in this patchset. If we stop attaching dispcc to the MMCX
> > genpd, I'll have to locate it in a different way, but the idea is
> > implemented here.
>
> Right. Perhaps it's not such a bad idea after all as it gives you two things:
>
> 1) The handle to the MMCX PM domain, which makes sure it has been
> registered too before dispcc gets probed.
> 2) The possibility to control power for the MMCX PM domain via runtime
> PM for the dispcc device. This seems useful for your use case.
>
> >
> > > > An alternative would be to request that all users of the provided
> > > > clocks power on one of the child domains. However this is also not
> > > > perfect. If some generic code (e.g. clock framework) calls into
> > > > provided clocks (e.g. because of assigned-clock-rates), this can
> > > > happen w/o proper power domain being powered up yet.
> > >
> > > Issues with power on/off synchronization during genpd initializations
> > > and genpd provider registration, certainly need to be fixed and I am
> > > happy to help. However, my point is that I think it's a bad idea to
> > > fix it through modelling the PM domain hierarchy in an incorrect way.
> >
> > So, which device should I pass to clk_register to handle runtime PM
> > for the provided clocks? dispcc, should I not?
>
> Right, anything but dispcc seems wrong.
>
> > Then if the dispcc is not attached, we will have to manually handle
> > MMCX from dispcc's runtime pm callbacks. Correct?
>
> Yep - and we don't want that either.
>
> >
> > Could you please be more specific, why is it so wrong to attach dispcc
> > to the MMCX genpd?
>
> In the end it seems like I just needed to make my brain feel a little
> more comfortable with the ideas that you put forward.
>
> It should work fine, I think! My apologies for all the noise.

No problem, it is always better to have a discussion (and a
conclusion) rather than not to have it.

Thank you for your comments!


-- 
With best wishes
Dmitry
