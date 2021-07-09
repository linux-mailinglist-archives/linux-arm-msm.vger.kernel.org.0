Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9DC3C2587
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 16:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232261AbhGIOHF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 10:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbhGIOHE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 10:07:04 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5235C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 07:04:19 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id w8-20020a0568304108b02904b3da3d49e5so5509131ott.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TX6vfvV6xPvXi865OM1f31aZqqq3YhvC3wszTwMxnp4=;
        b=Enfw0QZT6nGJCd93wxNDAwj/LnOC4v2LdX0LKGX8PnY9FD8sh7hVcMrvUYKSC5O+uW
         mQpCuBp8FuvGl3r7lxgaqwSvFEc252QTk6urF+S8Z+bO8M1Phjb3JJQHETCS0Pc1/kjX
         TB40ETeL+wHrLl+Hh/0tWT8DvfKw+k4NzeEF0rdjZ1td8cvugFa59ODqfrJ0zkoN32Zz
         2MV24X3n0gVvO9N5P0tX16PfgZxP+1JheIPji83Hxw4pv78H09UWhFLxKwWFgcZQMUAf
         9iYXw58TYO9bz7ZQuMaTtdoAtBYPYN9BD0gnl2NO5zjmfAGDQmQn2x5S0dCjGn6eKihc
         GdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TX6vfvV6xPvXi865OM1f31aZqqq3YhvC3wszTwMxnp4=;
        b=foIOfjHjSLu/BUuhBATCe9yEQlTNqzcB04t7qnz2K5XGNjR5619tLNDDlE5DV0GgI2
         6VkKnIiPh+WoR/wHVMAFenYJWMOgd2rPmd+xWQPDoabh/ydrabmXN9I4AJ6WZTMOXlfO
         aG1Xe3Jyu0RVXGZbMlE/vI2QH8pFD2cMI9Y98qyqwE++AkahGskWrAd783ZUbVey5ijc
         0SFCvRLv7YCzDWT/epmO/96E6fZ2vUly2udaHME+9RQ40eYTwWO7/stzftRPTAj5Xxse
         6gOCHpfL1RO/7CpkLcb/RsN/luVY+Qj1XFMK3ThrzqRbeAv1iAALBlIHDuIIT2MPvXNl
         xQWg==
X-Gm-Message-State: AOAM531PgTWgdLGOY4AgM020XHMDZmui5Z2t3a0Xt5ul0x6KbzRjv0HC
        SsL1msxbJWlDPgQ28cDWITSwPQ==
X-Google-Smtp-Source: ABdhPJzIDhSJUTRPozTPQGyrBSmsmXhiPyvTgmPQE7N0Ls7GRZrApt6swvIwy5tScjMirF6BHjw7UA==
X-Received: by 2002:a05:6830:138b:: with SMTP id d11mr28190492otq.341.1625839459066;
        Fri, 09 Jul 2021 07:04:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r186sm1219318oia.6.2021.07.09.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:04:18 -0700 (PDT)
Date:   Fri, 9 Jul 2021 09:04:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v2 4/7] clk: qcom: gdsc: enable optional power
 domain support
Message-ID: <YOhXX+u9HuScTDp6@yoga>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
 <20210709043136.533205-5-dmitry.baryshkov@linaro.org>
 <CAPDyKFprYK8bSk+rdnDt3xRUR9BRNdyRiBdefO+s7qzOwHf7hg@mail.gmail.com>
 <CAA8EJprrjz=o7Ymt1mNBZASzTeX==1ceRTeKA4f3QrVMcpO6xg@mail.gmail.com>
 <CAPDyKFoLcsYLisEiOF66dDsV+759c5k0PD64uxU11jc5VTdNYQ@mail.gmail.com>
 <CAA8EJpr2HEm4R+bGrH6DHA_z8bjN69Zam9UUiAeKAr5vsCKr3A@mail.gmail.com>
 <CAPDyKFr+-qXbi4z4_wzDRaMMLKSKM7zNr55Kt-AOk97mVKM+8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr+-qXbi4z4_wzDRaMMLKSKM7zNr55Kt-AOk97mVKM+8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 09 Jul 08:14 CDT 2021, Ulf Hansson wrote:

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

dispcc is powered by the MMCX power domain, so it needs to be on if you
want to touch the registers.

I presume that for genpd this might not be a problem as long as all the
exposed power domains are parented by the genpd provider's parent, as
the core would turn the parent on before and turn off after performing
those operations. But without attaching to the domain we don't have
power to get through probe/registration.

Further more, dispcc is also a clock driver and there's certainly
operations where the genpd framework won't save us.

> Instead it should be registered as a genpd provider and the
> corresponding PM domains it provides, should be assigned as child
> domains to the MMCX domain.
> 

Right, this relationship is today missing and is what Dmitry needs to
add - so that the parent domains stays powered even when we're not
keeping the parent domain enabled to poke the dispcc.

> This is exactly what the child/parent domain support in genpd is there
> to help with.
> 
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
> 

This was my initial feeling to the patch as well and I think it might be
better to push the pm_runtime_get/put operations into gdsc.c - in
particular if you're saying that the general case is not for the genpd
provider itself to be powered by the specified parent domain.

At least we could start by doing it manually in gdsc.c and possibly move
it into the framework if we're confident that it's a good idea.

Regards,
Bjorn
