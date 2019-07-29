Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C99A788DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2019 11:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfG2JuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jul 2019 05:50:23 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:34252 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbfG2JuX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jul 2019 05:50:23 -0400
Received: by mail-vs1-f67.google.com with SMTP id m23so40358122vso.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2019 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CzaFJVRP7rz1Xn1j1tEOM0QcT+gEL6pO8dvc2N0dP2Y=;
        b=C8j5yjkNZ6U/VPHZ4r62V8CWeH8KpzPm515Ag1x9FEsL4k5LgOauwRMq9s+vF+BHfX
         fFDTwZKzLi7ns6fudr/PsdNzbJQRfUt2hkSs1aY6tkz7xxYkzDZ3UFtieCr8kh+itmaP
         b5uMvUIDsqYX//X70H483L2sa60IKMlXfvYgBY2yjauqypYn367UNoUx7ovyiQIhcqWW
         6wTZ3pZbLiWMTDClMOFRiTM7xK3JcdJIJPsG7LEeqeX3fbcQn1OV+N5KVhZGQXUMSU4p
         +mh8+9bXjLFF5yNmINoPvfv6qrS7SjoC+2lFQNGz964P3XcomoP1lugux4bdCCfpHDJX
         GoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzaFJVRP7rz1Xn1j1tEOM0QcT+gEL6pO8dvc2N0dP2Y=;
        b=t4QA3/ikAIBtDRZYBet408yqsTgFxo1BEE1aVui80Tbkz5/xhFYyueSPO4FGO8UAk+
         fuuqIEm9Jwa/Bg69mxabS24J5KhRuFWmQ/sI+5merxZETbyCrqn1EB/ZySOMcJ33a3vB
         zLP2BQ7K79dV9nO7XDiLjeiJK4gb/buziuFcLymHdifM49zOLd5ctoALgkaGchBMAy+g
         JmwaQQglX8rn0YZxdYnyxyeb8gzZeR2L5MRoV1Pw9ryMwvwv6UtE2yW7leyj4HNxX3Wh
         STrFCq5OeydStN4uM8KUyLi6+vIAPfsvxqMMMSVe3i9BcdtwouRu0F8NTBx+N0uwfRCg
         0CRg==
X-Gm-Message-State: APjAAAXeeHLa92HgbbDWjOJYtrUkq/f47jDIPChbmrFCEbh4/QZsVYd7
        8zJD98P6EB0Y0hnmLirEUiCj7WNwlZRSoqa1/Gk=
X-Google-Smtp-Source: APXvYqzt+e0TkSyD2IjnZbOc+XZRv78fmNUciBSTvrIVx4syul/AuxdFZue2ZFYiBb+W0cbiB67nPhUSWFOOcrTGMH8=
X-Received: by 2002:a67:2e0e:: with SMTP id u14mr68681759vsu.182.1564393822065;
 Mon, 29 Jul 2019 02:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564091601.git.amit.kucheria@linaro.org>
 <CAHLCerNay31+RNQvQZyxMMVyb1mLLfN5BoZbz-M+bMqbmbYwtA@mail.gmail.com>
 <20190729090735.GA897@onstation.org> <2123341.TWUfUUIiFt@g550jk>
In-Reply-To: <2123341.TWUfUUIiFt@g550jk>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 29 Jul 2019 15:20:11 +0530
Message-ID: <CAHLCerNU3oAZd6aGw1pgN-SLOJTebi5usqxaFHbQUd+sC2sc9g@mail.gmail.com>
Subject: Re: [PATCH 00/15] thermal: qcom: tsens: Add interrupt support
To:     Luca Weiss <luca@z3ntu.xyz>,
        Niklas Cassel <niklas.cassel@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <andy.gross@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 29, 2019 at 3:03 PM Luca Weiss <luca@z3ntu.xyz> wrote:
>
> On Montag, 29. Juli 2019 11:07:35 CEST Brian Masney wrote:
> > On Sat, Jul 27, 2019 at 12:58:54PM +0530, Amit Kucheria wrote:
> > > On Fri, Jul 26, 2019 at 4:59 PM Brian Masney <masneyb@onstation.org> wrote:
> > > > On Fri, Jul 26, 2019 at 04:40:16PM +0530, Amit Kucheria wrote:
> > > > > How well does cpufreq work on 8974? I haven't looked at it yet but
> > > > > we'll need it for thermal throttling.
> > > >
> > > > I'm not sure how to tell if the frequency is dynamically changed during
> > > > runtime on arm. x86-64 shows this information in /proc/cpuinfo. Here's
> > >
> > > > the /proc/cpuinfo on the Nexus 5:
> > > Nah. /proc/cpuinfo won't show what we need.
> > >
> > > Try the following:
> > >
> > > $ grep "" /sys/devices/system/cpu/cpufreq/policy?/*
> > >
> > > More specifically, the following files have the information you need.
> > > Run watch -n1 on them.
> > >
> > > $ grep "" /sys/devices/system/cpu/cpufreq/policy?/scaling_*_freq
> >
> > There's no cpufreq directory on msm8974:
> >
> >     # ls -1 /sys/devices/system/cpu/
> >     cpu0
> >     cpu1
> >     cpu2
> >     cpu3
> >     cpuidle
> >     hotplug
> >     isolated
> >     kernel_max
> >     modalias
> >     offline
> >     online
> >     possible
> >     power
> >     present
> >     smt
> >     uevent
> >
> > I'm using qcom_defconfig.
> >
> > Brian
>
> Hi Brian,
> cpufreq isn't supported on msm8974 yet.
> I have these patches [0] in my tree but I'm not sure they work correctly, but I haven't tested much with them. Feel free to try them on hammerhead.
>
> Luca
>
> [0] https://github.com/z3ntu/linux/compare/b0917f53ada0e929896a094b451219cd8091366e...6459ca6aff498c9d12acd35709b4903effc4c3f8

Niklas is working on refactoring some of the Krait code[1]. I'm not
sure if he looked at 8974 directly as part of the refactor adding him
here to get a better sense of the state of cpufreq on 8974.

[1] https://lore.kernel.org/linux-arm-msm/20190726080823.xwhxagv5iuhudmic@vireshk-i7/T/#t
