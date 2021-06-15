Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789953A7616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 06:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229931AbhFOEtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 00:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhFOEtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 00:49:23 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1643EC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 21:47:19 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so13084339otu.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 21:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nngriT+7I5tBGdgHEeOVhQ16xcR1u7wZ3t5HbdfW8Z4=;
        b=lp5W+n4oYwyvQD2qxXRtPuLq+miZglxCfYAqf9CAnQ4bMl9+R/43fgL94AgAHz205a
         f8rSSQIk0JKew14zfLonjTJBToVck8l7qJjXQCf44113WPA+d2VyMHJzz6mvB86dR51m
         P6i0gCX8Mez2PzLZdgvaSd0/I4uUbSTjqQ3wNuYra2dmuv4BV8f555lYp/z/vb/CyVgQ
         VyYNb271xmCVwqGLbGr4Y4fFh0/ninI+QpGtlNRjfyPxLTUzPYdcurCAKPMRuobAIpA5
         gYm7sHfjJouxVWof6d+3lFxZixtbXyX81OywFOVIhoRJonE/M8ApxCpldZfRZ2um0cFO
         L6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nngriT+7I5tBGdgHEeOVhQ16xcR1u7wZ3t5HbdfW8Z4=;
        b=WGwm/D8+ScYhp5K+/2jroShmDOsbROyFYBtU+ZcuDBeYKbY6LFBsPMCEGE8cxb617F
         3dhkdhzsouvTh0S0FcagSlqGdRXVgaaZg6ExeuwA7hjieyI5472MaQfC/qBriJ9AjtUS
         DdRMaw8njzAnhrKNaYr14ZBz+nxqIxZHsCMRrn3vnP80P+Iy2yD5PWvuJgU4z9hwizsv
         Oz1lJL50ZVqxlA/E9imiYCkln81hzRNjlYfg3qT792KyrOTNMtydr9p18wD0Uov4jFbw
         9eUXwBCM9fdJyt/M6LJIo16rXjXo7FaiiGDUN/qt5DXa0w+1uDPYX7ZqKj79hCI1t70f
         hgrw==
X-Gm-Message-State: AOAM532NNzPkYsKkYo7gLEQr9254UBU3vSp/sjZz60EsUFFdWhr4kWHO
        66mhkpXWbu5Xu5Zu1qih2CGLH3DH6GmdzPKtN70UlQ==
X-Google-Smtp-Source: ABdhPJwIjnzDAGWEPWyfPs9YdC7k0RYUBiPJTLKDbEmeUW9F0RNyfETdyIC5ptMaQ0ffkA33XteJvJvxzo73fBMkNzg=
X-Received: by 2002:a9d:74d4:: with SMTP id a20mr15893473otl.28.1623732438466;
 Mon, 14 Jun 2021 21:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-5-bhupesh.sharma@linaro.org> <CAHp75Vd7z6ivOxHikqP5j+yPtV7C8GBogwVUAziLznSatH+8EA@mail.gmail.com>
 <CAH=2NtxtzRhOzekHxn+V4DSYmwncX1wSRbKOe=PNkcTsQ3jqiQ@mail.gmail.com> <YMeBJRujxoxj9no4@yoga>
In-Reply-To: <YMeBJRujxoxj9no4@yoga>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 15 Jun 2021 10:17:07 +0530
Message-ID: <CAH=2NtzSjdMr+tCLtY1W7-vLiRvqtL3hE+HKLU3UTds3_arE_w@mail.gmail.com>
Subject: Re: [PATCH 4/8] regulator: qcom-rpmh: Add new regulator types found
 on SA8155p adp board
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 14 Jun 2021 at 21:47, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 07:30 CDT 2021, Bhupesh Sharma wrote:
>
> > On Mon, 7 Jun 2021 at 17:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Mon, Jun 7, 2021 at 2:41 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> > > >
> > > > SA8155p-adp board has two new regulator types - pmm8155au_1 and
> > > > pmm8155au_2.
> > > >
> > > > The output power management circuits in these regulators include:
> > > > - FTS510 smps,
> > > > - HFS510 smps, and
> > > > - LDO510 linear regulators
> > >
> > > ...
> > >
> > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > Cc: Andy Gross <agross@kernel.org>
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-gpio@vger.kernel.org
> > > > Cc: bhupesh.linux@gmail.com
> > >
> > > Use --cc or similar option when run `git send-email`, no need to
> > > pollute the commit message with these.
> >
> > It's just a matter of preference IMO. I prefer to use a Cc list
> > here.
> >
>
> The Cc list in the commit message will be committed to the git history
> and there it carries the information that you specifically made sure
> that these people saw the patch. So please limit the use to that
> purpose.

I understand, but different maintainers like different formats here.
Infact, there
are suggestions not to use --cc as some opens-source lists are known to drop
folks from Cc list accidentally (mentioned via --cc) , so some folks
prefer the git log to contain the Cc list instead.

But I can trim the same for v2.

> > > > +static const struct rpmh_vreg_init_data pmm8155au_1_vreg_data[] = {
> > >
> > >
> > > > +       {},
> > >
> > > Comma is not needed in the terminator line.
> >
> > Hmm.. it's similar to the syntax already used at several places in this file.
> > See ' struct rpmh_vreg_init_data pm8150l_vreg_data[] ' for example.
> >
> > Unless there is an obvious issue with it, let's use the same to keep
> > things similar from a syntax p-o-v.
> >
>
> Those other places shouldn't use the ',' either, so please help set a
> better precedence.

Sure, I will send that out as a separate clean-up patch.

Regards,
Bhupesh
