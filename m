Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E0C402AD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Sep 2021 16:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231362AbhIGOfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Sep 2021 10:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234290AbhIGOfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Sep 2021 10:35:46 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37839C0613C1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Sep 2021 07:34:40 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m28so19957705lfj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Sep 2021 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCEk6hLFpYFZNzpm9UU+CTkqXyAjw51d6n8hDCnfs50=;
        b=JOoH5mmNdxb7W0iZVCKlwCuDC6TSHto30Ls7RSjmB+2RApz8Yctqil2lCHtGeRrN9Y
         Z7kbJ2j1g0FJCF81zx3/ZhGcZdZ2K1UVo++3Nvcy3r8goO5Q5aOkqHB99QVNBezpLH4O
         58EcbrGI6BIeDMPS3FYP3PmYAcL1GDu4SoY8jjeTEeYN5ALWmIGuvs/jTUk1bPuvL8Lq
         3L83lVga5gLM0i9nLyH9HTb5keyfdyTAh4V4RL9y3/zFzCxwPZAcrVSEcU/xHQhlcdCC
         3eqRI8wqqkaSGP+Wef/2c/bEmw9Ce8apuVoJZ+7ROa0XmgGK+m+DSt/a3sQe2sPbPq6L
         IZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCEk6hLFpYFZNzpm9UU+CTkqXyAjw51d6n8hDCnfs50=;
        b=bBvSmh+j1wMUwy4YV7IbsaC7E72XegTMjjrMYushqNbEAkyyk85ihoSVKiJSQHBpfH
         4bWzerEwPlOJhZA/D4KtMuxXz0F+9a8Cly5Kw4h/nVdNvthZf+TmFWZG7ARD1kcDDkfK
         7lNsba+LTSvBwTEyltR2Cc5AsFEV4Oj4RMLW8tHF3hgf8iuwm/b1bq4HVNoogWNP0VVP
         fFtgJMzQhBn0q+bwwZbpFACCoR3AYH9hw2fj0i6ea1C3pNWmbbRgvloWk7/PCdC2oiEi
         PkNrO6KjYX2AU0oi+w/t+pab2pEepXp8iWSOPJitU286fBbQCdV6pwuRzPTeicnm+l/C
         NXuA==
X-Gm-Message-State: AOAM5312My0S8MTVhhqR9bRY0QMkNyI5U1ENJ1Oph16ThIT8wMaZnth8
        vXT1b9gd2q5b7qgsT+bhprBL+fp8Fy5zuA15mGyvXA==
X-Google-Smtp-Source: ABdhPJyqL+F+/YykfnoB9oEeLu/I1Xfp9XyG6yopHhm1QX7RHxXU6JKarEkVx5/eW4SnQdSHnokUbEnY1AMCVNzEnSY=
X-Received: by 2002:a05:6512:6cd:: with SMTP id u13mr12905659lff.184.1631025278471;
 Tue, 07 Sep 2021 07:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
 <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com>
 <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org> <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
 <CAA8EJppo8Zze5ViYOWooHy=RR4ueXNeWiBFyKdtpUcm5Cs69ew@mail.gmail.com>
In-Reply-To: <CAA8EJppo8Zze5ViYOWooHy=RR4ueXNeWiBFyKdtpUcm5Cs69ew@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Sep 2021 16:34:02 +0200
Message-ID: <CAPDyKFrv9HM9y1zgPj6x2K84cPuYXOqaQYqtvKZ51itPtt3ghw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 29 Aug 2021 at 17:54, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 29 Aug 2021 at 06:51, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2021-08-26 14:56:23)
> > > On 26/08/2021 21:31, Stephen Boyd wrote:
> > > > Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> > > >> On SM8250 both the display and video clock controllers are powered up by
> > > >> the MMCX power domain. Handle this by linking clock controllers to the
> > > >> proper power domain, and using runtime power management to enable and
> > > >> disable the MMCX power domain.
> > > >>
> > > >> Dependencies:
> > > >> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
> > > >>    (pending)
> > > >
> > > > Does this patch series need to go through the qcom tree? Presumably the
> > > > dependency is going through qcom -> arm-soc
> > >
> > > It looks like Bjorn did not apply his patches in the for-5.15 series, so
> > > we'd have to wait anyway. Probably I should rebase these patches instead
> > > on Rajendra's required-opps patch (which is going in this window).
> > >
> >
> > Ok. Thanks. I'll drop it from my queue for now.
>
> Just for the reference. I've sent v7 of this patchset. After thinking
> more about power domains relationship, I think we have a hole in the
> abstraction here. Currently subdomains cause power domains to be
> powered up, but do not dictate the performance level the parent domain
> should be working in.

That's not entirely true. In genpd_add_subdomain() we verify that if
the child is powered on, the parent must already be powered on,
otherwise we treat this a bad setup and return an error code.

What seems to be missing though, is that if there is a performance
state applied for the child domain, that should be propagated to the
parent domain too. Right?

> While this does not look like an issue for the
> gdsc (and thus it can be easily solved by the Bjorn's patches, which
> enforce rpmhpd to be powered on to 'at least lowest possible'
> performance state, this might be not the case for the future links. I
> think at some point the pd_add_subdomain() interface should be
> extended with the ability to specify minimum required performance
> state when the link becomes on.

I guess that minimum performance state could be considered as a
"required-opp" in the DT node for the power-domain provider, no?

Another option would simply be to manage this solely in the
platform/soc specific genpd provider. Would that work?

> Until that time I have changed code to
> enforce having clock controller in pm resume state when gdsc is
> enabled, thus CC itself votes on parent's (rpmhpd) performance state.
>
>
> --
> With best wishes
> Dmitry

Kind regards
Uffe
