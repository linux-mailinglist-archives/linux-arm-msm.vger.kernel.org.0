Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E783C2325
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 13:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhGILte (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 07:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhGILte (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 07:49:34 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C88C0613E7
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 04:46:50 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h2so7312774qtq.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONSgbSybDS3aq6XRVOEGbplrYREJdvsgJ8FcbeYsWZQ=;
        b=X1DMeut+wlmbqF5RrAzcCPZPJFuU49aQnYR241lLwaVbyP8bU8ILEeVloVcyws0Z43
         DnBmrijkudd2Foqjg1XzAnqd7AldKERLw874LIjj1kT5Hazd0DnnRnsyGk73zjpv67AT
         5wtkQgtCubBtWV8RbEcZw5f4rQjTyboeq3eCr0vECIidbkqusnOOmqnYej6o6q7krJ3Y
         eo7bv1t5oeVVDG20YjinIonwJA18y/ym9brtXgcaLp4IaK3pFF/2HrgmfwsBmIyseThm
         WOQU5cZT+4tZWrkx1IAzqE8X4sJfDC8/T/RzifHmArNLvId0LqJH/hhGVF96rNoe5z9g
         gL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONSgbSybDS3aq6XRVOEGbplrYREJdvsgJ8FcbeYsWZQ=;
        b=IbN9ZIVmW/PxckxS5xac16zzNibP6BeaeQYdssgHNW1Og+z/MT1sZmFSUWpVn8J1et
         oIf9q8a1/WMsYLn4M9rxLfBmbOtAc4hwyDOSsHuoPUbwqS8rdtKVPcCMseWDfyXqhHop
         +QhGyqrLiUjGv6j0MKCBFBBlUaoXPpvZ+Hb3GZAm3nLzqoRyZTzOthEjwZokJbh/X67L
         o1X7yTa3DwJFLnhq58egKuLDTWKxR82IfpVMwkn0SWPx7s3cj3UJ3jFtnZYq7K6eeC08
         ojgIzD0GtKUXMpVA2Xsb0ADrvjXFMg0g2iRLU7LXXxLadnYz8aiW0+QkaWeKQwjdpJBQ
         ykGQ==
X-Gm-Message-State: AOAM532aHQv3xrFq9yjOTYNwC3xYnIcmr+YdCVO9y1KefuSQIEtK40Rl
        +XaBjhn3rnlwZmjRrP9ICsXyg5sx36QgHqIRlbZu1Q==
X-Google-Smtp-Source: ABdhPJxEmzRWpMruBIId+kQ7gKz2U0whpes7FmT5IdlbX0im5aKGJf4rT18bQiHy9N/1kwulsFpkdTs5e29KGfTZ/Z8=
X-Received: by 2002:ac8:59ca:: with SMTP id f10mr16013910qtf.298.1625831210069;
 Fri, 09 Jul 2021 04:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org> <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
In-Reply-To: <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Jul 2021 14:46:39 +0300
Message-ID: <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
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

On Fri, 9 Jul 2021 at 12:33, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 9 Jul 2021 at 06:32, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On sm8250 dispcc and videocc registers are powered up by the MMCX power
> > domain. Currently we used a regulator to enable this domain on demand,
> > however this has some consequences, as genpd code is not reentrant.
> >
> > Teach Qualcomm clock controller code about setting up power domains and
> > using them for gdsc control.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> [...]
>
> > diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> > index 51ed640e527b..9401d01533c8 100644
> > --- a/drivers/clk/qcom/gdsc.c
> > +++ b/drivers/clk/qcom/gdsc.c
> > @@ -427,6 +427,7 @@ int gdsc_register(struct gdsc_desc *desc,
> >                         continue;
> >                 scs[i]->regmap = regmap;
> >                 scs[i]->rcdev = rcdev;
> > +               scs[i]->pd.dev.parent = desc->dev;
> >                 ret = gdsc_init(scs[i]);
> >                 if (ret)
> >                         return ret;
> > @@ -439,6 +440,8 @@ int gdsc_register(struct gdsc_desc *desc,
> >                         continue;
> >                 if (scs[i]->parent)
> >                         pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
>
> So dev_pm_domain_attach() (which calls genpd_dev_pm_attach() is being
> called for gdsc platform device from the platform bus', to try to
> attach the device to its corresponding PM domain.
>
> Looking a bit closer to genpd_dev_pm_attach(), I realize that we
> shouldn't really try to attach a device to its PM domain, when its OF
> node (dev->of_node) contains a "#power-domain-cells" specifier. This
> is because it indicates that the device belongs to a genpd provider
> itself. In this case, a "power-domains" specifier tells that it has a
> parent domain.
>
> I will post a patch that fixes this asap.

I think there is nothing to fix here. The dispcc/videocc drivers
provide clocks in addition to the gdsc power domain. And provided
clocks would definitely benefit from having the dispcc device being
attached to the power domain which governs clock registers (MMCX in
our case). Thus I think it is perfectly valid to have:

rpmhpd device:
 - provides MMCX domain.

dispcc device:
 - is attached to the MMCX domain,
 - provides MDSS_GDSC
 - provides clocks

>
> > +                       pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> >         }
> >
> >         return of_genpd_add_provider_onecell(dev->of_node, data);
> > @@ -457,6 +460,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
> >                         continue;
> >                 if (scs[i]->parent)
> >                         pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> > +               else if (!IS_ERR_OR_NULL(dev->pm_domain))
>
> Ditto.
>
> > +                       pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> >         }
> >         of_genpd_del_provider(dev->of_node);
> >  }
> > --
> > 2.30.2
> >
>
> Kind regards
> Uffe



-- 
With best wishes
Dmitry
