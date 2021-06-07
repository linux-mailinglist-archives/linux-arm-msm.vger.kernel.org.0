Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48FFD39DC7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 14:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhFGMeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 08:34:23 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:36454 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhFGMeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 08:34:06 -0400
Received: by mail-oi1-f179.google.com with SMTP id a21so17869510oiw.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tvr2LpJO+zoZVn/wehOpfwJd2m7kH19dGowal30QNMo=;
        b=aH7lHOFR5B7dsCa2m5tbQCoN750DuUFWr0HiN5vZAs6LAs+CGFdJpeEVFHtXY0kvoU
         jrIBJ8bF0F4lN3VniDDO/EdA3I7SbMGk0BzQnunqQSI9dNlewZtGbkgt9ClHH5oR4h5E
         Gjz2gUjjV+hDNF+tW0h7hRI+XSXv8XVKpZvgQO7VFo9uk4nvKKAL9bDRDG3G0lc++FyG
         SG5s88en7owxCA5IjiLYZy5zQZroX82O9IVLHv1pHQPnS3TGR8X7mxEIKCVFWESbkgWl
         52CoisHehVZ2VJcHrwk0XQse6tNIXeW7iKgCoQuLyfKTb9Ew86ZbFhzSdESJnT60zhuw
         e45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tvr2LpJO+zoZVn/wehOpfwJd2m7kH19dGowal30QNMo=;
        b=aAiyTl8zXZJvRElbNtvO0MW6xMMTTOnvAD6+lPI0CkkWhRZCggECZo3fMzCvE5qi+g
         yOaDD3Kei6vpvp5rkjwUa9nVi5/Mwj9VoI2y98D2SHh56YE4vcEbmxaHP1V7rh6Uuub5
         /2mvuuKrJDJMoSIUiCk4xFtXIifLHjsqTL0sj6Y2F9C44hLTavv12TBdVaRrH5xn6iRg
         bglesY5DB0HpKFVNSi0bDL0NWLCfnac/kjo4OJfEhrgIitKaKrUG8zss76G29j7qiC5+
         xiaQMNUSAbMuOI9+DHn0tp7nkpxqGrhYZGtnS9Pj4XfVc7BV7O1yK8SiCdKKkzLNseRG
         Dl4w==
X-Gm-Message-State: AOAM532R+Zuj252ENj/dZIUi1LnYGamTvlgDjGV/G3mDa6dkC+zfnkWU
        ZrIOFUseSp10PSnmn0n9ys60J+Pv25NjA5LEeFbAmA==
X-Google-Smtp-Source: ABdhPJxujfBEdFxkSmhJaaZBeJGlg2pawxqj0/1hGlU+4+i8J0LQb3IRXrgR10on+BxmXf/59rZHa0pvqkZakHHmsmo=
X-Received: by 2002:a54:438e:: with SMTP id u14mr17939700oiv.126.1623069060601;
 Mon, 07 Jun 2021 05:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-5-bhupesh.sharma@linaro.org> <CAHp75Vd7z6ivOxHikqP5j+yPtV7C8GBogwVUAziLznSatH+8EA@mail.gmail.com>
In-Reply-To: <CAHp75Vd7z6ivOxHikqP5j+yPtV7C8GBogwVUAziLznSatH+8EA@mail.gmail.com>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 7 Jun 2021 18:00:48 +0530
Message-ID: <CAH=2NtxtzRhOzekHxn+V4DSYmwncX1wSRbKOe=PNkcTsQ3jqiQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] regulator: qcom-rpmh: Add new regulator types found
 on SA8155p adp board
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
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

On Mon, 7 Jun 2021 at 17:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jun 7, 2021 at 2:41 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
> >
> > SA8155p-adp board has two new regulator types - pmm8155au_1 and
> > pmm8155au_2.
> >
> > The output power management circuits in these regulators include:
> > - FTS510 smps,
> > - HFS510 smps, and
> > - LDO510 linear regulators
>
> ...
>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
>
> Use --cc or similar option when run `git send-email`, no need to
> pollute the commit message with these.

It's just a matter of preference IMO. I prefer to use a Cc list
here.

> > +static const struct rpmh_vreg_init_data pmm8155au_1_vreg_data[] = {
>
>
> > +       {},
>
> Comma is not needed in the terminator line.

Hmm.. it's similar to the syntax already used at several places in this file.
See ' struct rpmh_vreg_init_data pm8150l_vreg_data[] ' for example.

Unless there is an obvious issue with it, let's use the same to keep
things similar from a syntax p-o-v.

Thanks,
Bhupesh

>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
