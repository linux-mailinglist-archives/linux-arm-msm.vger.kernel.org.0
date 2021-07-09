Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BBD3C2358
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 14:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhGIMVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 08:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhGIMVm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 08:21:42 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7A4C0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 05:18:58 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id j2so2959484vsi.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0i2x0AMVYzqLw8AMYlE+qzyfnD3fj5LQp89veWdpxEY=;
        b=d1OMO9RO63Kf5IJ9DxyClEBbwJB/uY6CtJD/ZpW1b9/95BlVPm3FgIT6QqjYt9Ht78
         onFQ/K0MoXr9KJqU12bLjy2FDtrywjB+XB/EH9L+kTJuMkyqZkv1we9ZXJ2S6ki8srXo
         gz9cJ+F9r911uW31xKHVVCcJ+F7l3BSe1Vmz4+l3nTotZEXKIHOzgiQTLodDsjmdN5b8
         z1ajubYXsEJP8z/v+AwgKxb0BxhWkiksI1uxeNOHsyf5TmP3ETHIUEw+0c7I4zmtGU4w
         QLE7oA/l5FaNf9YQRqKKSym2CF4sezVwGq6jdx73wmRBttDr6jFmo893G7GCaoQdBb6a
         etLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0i2x0AMVYzqLw8AMYlE+qzyfnD3fj5LQp89veWdpxEY=;
        b=WV+7+qdIKD9c0aPNyylYplAORf5o/AE/Aib8cVT/rLgdN2b1rcEVtbhodZxGBvhCPb
         5HdS3OxmCgf7MSxjkjWsuwVPWK1jwnFNFpMku4JUrCaoaSQG8CLOkqX4NciUDYKAYFEO
         jqhEXiDbpwDDjvR582BhnPEUrjT92e2nsC4pgsD0rZuCa6H0s97fJ07wMVcu7TXe4YJ6
         KLZNBHGTU8EpguxvvG8LOKzDp0gAhxFMZ8hGxllVM9qIZXagSjT2oZeruwv/AvgPx2+M
         BiKC8KVZ/4amhrsa5LFwpXpS0vFtcKkNUCXOL3dhGYlw9DdPd7MWLS+c8Vi08cmZaUax
         9PUA==
X-Gm-Message-State: AOAM533ralDiBrssS7WYtC+XjHgyWIJvul4D8r1WbbMR2Su5aOpGweUX
        Gh5jWMdK/c8wH0hHeM0bYOe1Er+A+vmgcMyMWwUpbw==
X-Google-Smtp-Source: ABdhPJz7iTeFUYjs06Wx3TYcdeZ70mtZT8uIbNNFQrb+7zjXxrg/7/QeIdMzya8bZ++XTTu+Sd6CTrbJGw0ZI9z1fmg=
X-Received: by 2002:a67:8783:: with SMTP id j125mr35621090vsd.42.1625833137493;
 Fri, 09 Jul 2021 05:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org> <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
 <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
In-Reply-To: <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 9 Jul 2021 14:18:20 +0200
Message-ID: <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power
 domain support
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

On Fri, 9 Jul 2021 at 13:46, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 12:33, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > > domain. Currently we used a regulator to enable this domain on demand,
> > > however this has some consequences, as genpd code is not reentrant.
> > >
> > > Teach Qualcomm clock controller code about setting up power domains and
> > > using them for gdsc control.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > [...]
> >
> > > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > > index 51ed640e527b..9401d01533c8 100644
> > > --- a/drivers/clk/qcom/gdsc.c
> > > +++ b/drivers/clk/qcom/gdsc.c
> > > @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
> > >                         continue;
> > >                 scs[i]->regmap = regmap;
> > >                 scs[i]->rcdev = rcdev;
> > > +               scs[i]->pd.dev.parent = desc->dev;
> > >                 ret = gdsc_init(scs[i]);
> > >                 if (ret)
> > >                         return ret;
> > > @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
> > >                         continue;
> > >                 if (scs[i]->parent)
> > >                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> >
> > So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
> > called for gdsc platform device from the platform bus', to try to
> > attach the device to its corresponding PM domain.
> >
> > Looking a bit closer to genpd_dev_pm_attach(), I realize that we
> > shouldn't really try to attach a device to its PM domain, when its OF
> > node (dev->of_node) contains a "#power-domain-cells" specifier. This
> > is because it indicates that the device belongs to a genpd provider
> > itself. In this case, a "power-domains" specifier tells that it has a
> > parent domain.
> >
> > I will post a patch that fixes this asap.
>
> I think there is nothing to fix here. The dispcc/videocc drivers
> provide clocks in addition to the gdsc power domain. And provided
> clocks would definitely benefit from having the dispcc device being
> attached to the power domain which governs clock registers (MMCX in
> our case). Thus I think it is perfectly valid to have:
>
> rpmhpd device:
>  - provides MMCX domain.
>
> dispcc device:
>  - is attached to the MMCX domain,

We don't need this, it's redundant and weird to me.

Also I am kind of worried that you will hit another new path in genpd,
causing locking issues etc, as it has not been designed to work like
this (a provider device and a child domain sharing the same "parent").

>  - provides MDSS_GDSC

It's perfectly fine that dispcc acts as a genpd provider. In this
case, the corresponding PM domain should be assigned as a child for
the parent MMCX domain. That should make this work, I think.

>  - provides clocks

That sounds reasonable as well.

>
> >
> > > +                       pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > >         }
> > >
> > >         return of_genpd_add_provider_onecell(dev->of_node, data);
> > > @@ -457,6 +460,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
> > >                         continue;
> > >                 if (scs[i]->parent)
> > >                         pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> > > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
> >
> > Ditto.
> >
> > > +                       pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> > >         }
> > >         of_genpd_del_provider(dev->of_node);
> > >  }
> > > --
> > > 2.30.2
> > >
> >

Kind regards
Uffe
