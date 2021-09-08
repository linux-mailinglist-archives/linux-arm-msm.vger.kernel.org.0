Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA80403659
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 10:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348350AbhIHIvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 04:51:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348369AbhIHIvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 04:51:47 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D355C061757
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 01:50:40 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id t4so1464539qkb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 01:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bLPU6JwzUvt2Ww93ncZhtHocO2yM5T3pJGHQ+IZpZfU=;
        b=OZP730trRpvheHITclDnfyTURcdwmi3WpMyRMR9uvyEnDlM5gu4XtT9OOb946BL88y
         aoobd6ZfdDXNAfaXRN2234HBTx2quqjElIzh8mvd6Avu28Pvtr0HH8TZoNluYy5aKZ1h
         NTFki7ws8S+oMddEWszNl+Fm3hO+z/gyr2+d53BQLlFQIrtT/frz4FeMqnPDQ9rkhB9H
         vV1LNwCsqvax8ptYH7oTGIUICD3WqGcPsRgjiPfomfvUxscjjrk8mwgvDQhO1Lrarpvc
         WfA9sGwzkWT4IDARoC6V0daOPQD7FXHgQUphv7cBTpL1FnepBCKuGgTt6PGk0Jp3LExO
         unJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bLPU6JwzUvt2Ww93ncZhtHocO2yM5T3pJGHQ+IZpZfU=;
        b=dzMtQPsc0sxaLRn15/W2jeH66zfSp4+geIC8xvrXuiNXinzIOt4rJBP2id0zMf5lje
         QeTWTrtJOS+i1mCAHU2xUbDmS8l3wjAveaYicUyTXMVxuNYaBxzMwk/w14e+mAY5q90J
         TjYjD4YNuAJusqqIaZVdH4E7ZGaa9GQO7ztK73LAlo5Qm8dPaKoEUD1gOX5UTZzF+noy
         mNVjbmbwAluA8QSdknpZ3iv51NAapG9ixEwbocaFEDREgVOT9DRblpR2ZnN7DrDUO8QZ
         oKNN9SkMCl1RdGRj5JV6GF6Khavvo+Y1iHhCnC0L4EKM5kjdiaiLpqqTi4XHJn/G+mKg
         IC7g==
X-Gm-Message-State: AOAM533C/ZTkY7mRYsQ9mU8kUCx4/utn9QFdpn66wqbSPUobgfTk2tbj
        G1BijesKcseoxUX8Mdp8ZfHQGEiGzRRY7RXWhsBGxg==
X-Google-Smtp-Source: ABdhPJw+8k/oeEzk9TVfggI6r5py/ts2bV4nIu0GfPNFNB6fEmyxhd2se0g23I3XJt0EjFVWLutNVQZqBr5vuxSg3fo=
X-Received: by 2002:a37:541:: with SMTP id 62mr2254933qkf.478.1631091039128;
 Wed, 08 Sep 2021 01:50:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210727202004.712665-1-dmitry.baryshkov@linaro.org>
 <163000270629.1317818.2836576068466077505@swboyd.mtv.corp.google.com>
 <42c3fa20-7ffa-255f-ca28-6f0aa2aa4a13@linaro.org> <163020909027.2218116.11109424225803296345@swboyd.mtv.corp.google.com>
 <CAA8EJppo8Zze5ViYOWooHy=RR4ueXNeWiBFyKdtpUcm5Cs69ew@mail.gmail.com> <CAPDyKFrv9HM9y1zgPj6x2K84cPuYXOqaQYqtvKZ51itPtt3ghw@mail.gmail.com>
In-Reply-To: <CAPDyKFrv9HM9y1zgPj6x2K84cPuYXOqaQYqtvKZ51itPtt3ghw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 8 Sep 2021 11:50:28 +0300
Message-ID: <CAA8EJpokEq5JB63wYCpjssKt8neEpeW71pD9nUTjZ0Z_o6U=0A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] clk: qcom: use power-domain for sm8250's clock controllers
To:     Ulf Hansson <ulf.hansson@linaro.org>
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

On Tue, 7 Sept 2021 at 17:34, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Sun, 29 Aug 2021 at 17:54, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sun, 29 Aug 2021 at 06:51, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2021-08-26 14:56:23)
> > > > On 26/08/2021 21:31, Stephen Boyd wrote:
> > > > > Quoting Dmitry Baryshkov (2021-07-27 13:19:56)
> > > > >> On SM8250 both the display and video clock controllers are powered up by
> > > > >> the MMCX power domain. Handle this by linking clock controllers to the
> > > > >> proper power domain, and using runtime power management to enable and
> > > > >> disable the MMCX power domain.
> > > > >>
> > > > >> Dependencies:
> > > > >> - https://lore.kernel.org/linux-arm-msm/20210703005416.2668319-1-bjorn.andersson@linaro.org/
> > > > >>    (pending)
> > > > >
> > > > > Does this patch series need to go through the qcom tree? Presumably the
> > > > > dependency is going through qcom -> arm-soc
> > > >
> > > > It looks like Bjorn did not apply his patches in the for-5.15 series, so
> > > > we'd have to wait anyway. Probably I should rebase these patches instead
> > > > on Rajendra's required-opps patch (which is going in this window).
> > > >
> > >
> > > Ok. Thanks. I'll drop it from my queue for now.
> >
> > Just for the reference. I've sent v7 of this patchset. After thinking
> > more about power domains relationship, I think we have a hole in the
> > abstraction here. Currently subdomains cause power domains to be
> > powered up, but do not dictate the performance level the parent domain
> > should be working in.
>
> That's not entirely true. In genpd_add_subdomain() we verify that if
> the child is powered on, the parent must already be powered on,
> otherwise we treat this a bad setup and return an error code.
>
> What seems to be missing though, is that if there is a performance
> state applied for the child domain, that should be propagated to the
> parent domain too. Right?
>
> > While this does not look like an issue for the
> > gdsc (and thus it can be easily solved by the Bjorn's patches, which
> > enforce rpmhpd to be powered on to 'at least lowest possible'
> > performance state, this might be not the case for the future links. I
> > think at some point the pd_add_subdomain() interface should be
> > extended with the ability to specify minimum required performance
> > state when the link becomes on.
>
> I guess that minimum performance state could be considered as a
> "required-opp" in the DT node for the power-domain provider, no?

Yes, up to some point. But this enforces a particular driver code
(that I've had to change from v6 to v7).

In v6 the gdsc's power_on code would pm_runtime_get() the provider
device, power on the domain and the pm_runtime_put() the provider
device. Thus the gdsc genpd would be powered on (keeping parent
domains in the on state), but the provider device itself would be
runtime-suspended (neat idea by Bjorn). However this relied on changes
in rpmhpd behaviour (which still did not make it to linux-next).

In v7 we have to keep the provider device in resumed state while the
gdsc genpd is powered on (to keep the required-opps vote in place).

I suppose that 'child requires minimum parent's performance state'
might become common property at some point, allowing us to drop this
pm_runtime handling.

> Another option would simply be to manage this solely in the
> platform/soc specific genpd provider. Would that work?

Yes, I've had this in the very old iteration of mmcx fixup patchset
(even before mmcx-regulator came into play). It ended up with quite an
ugly piece of code.

>
> > Until that time I have changed code to
> > enforce having clock controller in pm resume state when gdsc is
> > enabled, thus CC itself votes on parent's (rpmhpd) performance state.
> >
> >
> > --
> > With best wishes
> > Dmitry
>
> Kind regards
> Uffe



-- 
With best wishes
Dmitry
