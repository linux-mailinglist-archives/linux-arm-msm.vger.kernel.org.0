Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21621D0486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 03:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgEMBtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 21:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgEMBtd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 21:49:33 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FF01C061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 18:49:33 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id t9so10430192pjw.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 18:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=U2hp63rB3CAsIMl65Ej4coylrrRKqe2rh9YYq0s3+D4=;
        b=fjo2f4jjwjlGrZLW0umi8KQVQ/SpOTRvxPCxg7/SXNWvLZ8NY0bQjILkLvMijENLAL
         DaYjYVCogiZ8Mzq9wc4I6XvuoU8bwwJCm9lP2cm7idra2RkODAuxrLQ+BybX+BSfJFcj
         1WGHR86kiV0W51KHc8dOh31+3kiii6qmc4nQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=U2hp63rB3CAsIMl65Ej4coylrrRKqe2rh9YYq0s3+D4=;
        b=IDvZ/yek9jjX6zzWwjJkxY1mZ9FA+2fzKZshfYDIR0lMLW8IyljQJLhUKuRlsuRmwu
         lwu4uWZEuC13BXSZpNImh8LREl5h+OVhPM7OhPs+B4u7gr+/zN98nsw6S8kmHo7uN5Q4
         iUl7UhriPDKABJUryM9eDi17n7R3jb84mAdhRLexUzZ6H/AZjP7YlNLypWzmZAzXE2/s
         spo+3XeQ0in95LjlWVZQpkmk/EbXNqB2GrpfNaUwmXjaYz2tTYs8wmF/XM17E6SEJtNn
         bPdGmhTvqsiCgJ6wbBq0eCsy5mDuR1+JUhy97I0o2pOhYDaTBsEwvuW5n2zGbu9um01z
         S7lQ==
X-Gm-Message-State: AOAM532xHmm2TwErzUvRVicgFUQejToGzabuoPt2XAIQqcoTpJ+iyvJu
        WY2Su/GdN5CE1i3TisES0FizBQ==
X-Google-Smtp-Source: ABdhPJyTgU82y5UQvggP1k+g6dpTekcpClcW+m31+DiTuU/jeT9Hw0cvKUFxkM4ZDZI8daX7aleqAg==
X-Received: by 2002:a17:90b:357:: with SMTP id fh23mr7538321pjb.225.1589334572331;
        Tue, 12 May 2020 18:49:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f136sm12739777pfa.59.2020.05.12.18.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 18:49:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org> <b8c1cc35846d425a1677c73fddf5874d@codeaurora.org> <eee1b9a90266eed9a9c75401f0679777@codeaurora.org> <CAJ9a7Vjd0XG+rAvHptAAjGtE6xRhYsPaOSC_Bf9B-w-FZFu_Qw@mail.gmail.com> <47f6d51bfad0a0bf1553e101e6a2c8c9@codeaurora.org> <37b3749e-2363-0877-c318-9c334a5d1881@arm.com> <d47271ee6a2a6f0f30da7e140b6f196c@codeaurora.org> <CAJ9a7Vg95tcgMXgQKLAZc=TpV6FnPZ7wdF=Kwbuy7d2kRCjYQw@mail.gmail.com> <364049a30dc9d242ec611bf27a16a6c9@codeaurora.org> <CAJ9a7VjAoUmMG9pLEzE_rMSpOjwVOi-ZCinF87n9H0JgfMDsiQ@mail.gmail.com>
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple connections
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>
To:     Mike Leach <mike.leach@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Tue, 12 May 2020 18:49:30 -0700
Message-ID: <158933457051.215346.13515171569230202840@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Mike Leach (2020-05-12 14:52:33)
> HI Sai,
>=20
> On Tue, 12 May 2020 at 18:46, Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
> >
> > Hi Mike,
> >
> > On 2020-05-12 17:19, Mike Leach wrote:
> > [...]
> >
> > >> >>
> > >> >> Sorry for hurrying up and sending the patch -
> > >> >> https://lore.kernel.org/patchwork/patch/1239923/.
> > >> >> I will send v2 based on further feedbacks here or there.
> > >> >>
> > >> >>>
> > >> >>> 1) does this replicator part have a unique ID that differs from =
the
> > >> >>> standard ARM designed replicators?
> > >> >>> If so perhaps link the modification into this. (even if the part=
 no
> > >> >>> in
> > >> >>> PIDR0/1 is the same the UCI should be different for a different
> > >> >>> implementation)
> > >> >>>
> > > I have reviewed the replicator driver, and compared to all the other =
CS
> > > drivers.
> > > This driver appears to be the only one that sets hardware values in
> > > probe() and expects them to remain in place on enable, and uses that
> > > state for programming decisions later, despite telling the PM
> > > infrastructure that it is clear to suspend the device.
> > >
> > > Now we have a system where the replicator hardware is behaving
> > > differently under the driver, but is it behaving unreasonably?
> >
> > Thanks for taking your time to review this. For new replicator behaving
> > unreasonably, I think the assumption that the context is not lost on
> > disabling clock is flawed since its implementation defined. Is such
> > assumption documented in any TRM?
> >
>=20
> Looking at the AMBA driver there is a comment there that AMBA does not
> lose state when clocks are removed. This is consistent with the AMBA
> protocol spec which states that AMBA slaves can only be accessed /
> read / write on various strobe signals,  or state reset on PRESET
> signal, all timed by the rising edge of the bus clock. state changes
> are not permitted on clock events alone. Given this static nature of
> AMBA slaves then removing the clock should not have any effect.

I believe the "clock" that is being used here is actually a software
message to the power manager hardware that the debug subsystem isn't
being used anymore. When nothing is requesting that it be enabled the
power manager turns off the power to the debug subsystem and then the
register context is lost. It shouldn't be a clock in the clk subsystem.
It should be a power domain and be attached to the amba devices in the
usual ways. Then the normal runtime PM semantics would follow. If amba
devices require a clk then we'll have to provide a dummy one that
doesn't do anything on this platform.

>=20
> The AMBA driver only /drivers/amba/bus.c  gives permission to
> remove/restore the clocks from the devices (pm_suspend pm_resume
> callbacks) - this reduces the power consumption of these devices if
> the clock is not running, but state must be retained.
>=20

Ideally the drivers can have enough knowledge about this situation to do
the proper save/restore steps so that if the coresight hardware isn't
being used we don't keep it powered forever and so that across system
wide suspend/resume we can properly power it off.
