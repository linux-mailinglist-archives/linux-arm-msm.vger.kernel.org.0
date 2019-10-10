Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E179D3112
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 21:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfJJTAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 15:00:04 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34186 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbfJJTAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 15:00:04 -0400
Received: by mail-io1-f65.google.com with SMTP id q1so16194748ion.1;
        Thu, 10 Oct 2019 12:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cA1nu7WjrWAqmer6330wc0ijhhk83SGo4tS7biMmkzM=;
        b=ZgAEAuKGNSm1/2mqvjdNeg2BeAXi21dVyn9q62E+Iu/ozmBo3wcCaT/7BKIoBAZOTj
         dDAHRUs/OzQ4mTOWyMfo+0XcOuQL0I26UncPEfNPzUC804jb3T4Ly123g8ax48QIngr6
         ER3d5u50DZRrZBkNfjBnSDd9Ru7og2vz6dQCKOlRmNo8Q6gP2XcFXUmp1fISS1lJQO3C
         7yVg8gGSq3+aJ1brvf7pGPBu/31vmXwMNyeEIdVATaihqc7Q3kjg9bKwkGJF57w2L3RJ
         /5EEERwn/sqHHPy8HoLZ9eMxPloJNKEjdVsMYUrO2tZps2E0fU1HCPGcaKdEWGBDtoXi
         1xRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cA1nu7WjrWAqmer6330wc0ijhhk83SGo4tS7biMmkzM=;
        b=UMk6RqdR6KqStIrYl8SpVKGtXuj+KFH7cr5jJcU8FJ1++tE0iQrRcQXLdjixNU6Bl8
         UrhQFgXODB6n5TMw0CnLsBNeyoXfbvic6Tmcaz0S1+2pzZcQJixpEhFs+AXP7RqIdtx0
         Ze4etB7bv6mMwikRukb7lvH8lNTg/kByFxQlkR88t4AaYw9RaGUQvXsFJwXwuj9KbFFt
         tzrqjsqBxYvXLSZKHJA1YreA2OnJX8hBFpmJJHKRztkAGdoQiv2kXChNZEc/UbyfngF9
         nJGZ9IaJx2FiIHel2kgG8YelbO4OB0eDDQZtf95/RTNtSUaLmwDqLJIQq7ZMzKoj/SOa
         jEog==
X-Gm-Message-State: APjAAAV14vbXTlVxjIYl4nJHDe0SqSnVIzhRaC6FCBYJ0qbbQf5pt9hb
        fGL9CjuMl9L5lU6NF8+auLBq5H5Zpo7W2dFgg8U1vQ==
X-Google-Smtp-Source: APXvYqy2jIsV/0okFyYF1KBC8/M37CPZIxf/tq3+cYPkx00MgiScI6/1sGtqXgBQgssHUI2lYs/pujp8uSI9sAIhI4E=
X-Received: by 2002:a5d:904e:: with SMTP id v14mr11728084ioq.33.1570734003178;
 Thu, 10 Oct 2019 12:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191009213454.32891-1-jeffrey.l.hugo@gmail.com>
 <20191010184544.GK85762@art_vandelay> <CAMavQKJ7iMD+4a0eftNre9xMvyoZy_=sAPRAuMctX5bueugk1g@mail.gmail.com>
In-Reply-To: <CAMavQKJ7iMD+4a0eftNre9xMvyoZy_=sAPRAuMctX5bueugk1g@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 10 Oct 2019 12:59:52 -0600
Message-ID: <CAOCk7NqW=85qduSFquCgivHTDxDpJ7xK9zBjgbd1nM8QS7xM=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Implement reset correctly
To:     Sean Paul <sean@poorly.run>
Cc:     Rob Clark <robdclark@gmail.com>, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 10, 2019 at 12:49 PM Sean Paul <sean@poorly.run> wrote:
>
> On Thu, Oct 10, 2019 at 2:45 PM Sean Paul <sean@poorly.run> wrote:
> >
> > On Wed, Oct 09, 2019 at 02:34:54PM -0700, Jeffrey Hugo wrote:
> > > On msm8998, vblank timeouts are observed because the DSI controller is not
> > > reset properly, which ends up stalling the MDP.  This is because the reset
> > > logic is not correct per the hardware documentation.
> > >
> > > The documentation states that after asserting reset, software should wait
> > > some time (no indication of how long), or poll the status register until it
> > > returns 0 before deasserting reset.
> > >
> > > wmb() is insufficient for this purpose since it just ensures ordering, not
> > > timing between writes.  Since asserting and deasserting reset occurs on the
> > > same register, ordering is already guaranteed by the architecture, making
> > > the wmb extraneous.
> > >
> > > Since we would define a timeout for polling the status register to avoid a
> > > possible infinite loop, lets just use a static delay of 20 ms, since 16.666
> > > ms is the time available to process one frame at 60 fps.
> > >
> > > Fixes: a689554ba6ed (drm/msm: Initial add DSI connector support)
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > ---
> > >
> > > Rob et al, is it possible for this to go into a 5.4-rc?
>
> Sorry, I missed this on the first go-around, I'm Ok with this getting
> into 5.4. Rob, if you're Ok with this, I can send it through -misc
> unless you're planning an msm-fixes PR.
>
> > >
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 663ff9f4fac9..68ded9b4735d 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -986,7 +986,7 @@ static void dsi_sw_reset(struct msm_dsi_host *msm_host)
> > >       wmb(); /* clocks need to be enabled before reset */
> > >
> > >       dsi_write(msm_host, REG_DSI_RESET, 1);
> > > -     wmb(); /* make sure reset happen */
> > > +     msleep(20); /* make sure reset happen */
> >
> > Could you please pull this out into a #define used for both in case we decide to
> > tweak it? I don't want these 2 values to drift.
> >

Oh, yeah.  That's a really good point.  Will fix.

>
> oh yeah, and with that fixed,
>
> Reviewed-by: Sean Paul <sean@poorly.run>

Thanks.

>
> > Thanks,
> > Sean
> >
> > >       dsi_write(msm_host, REG_DSI_RESET, 0);
> > >  }
> > >
> > > @@ -1396,7 +1396,7 @@ static void dsi_sw_reset_restore(struct msm_dsi_host *msm_host)
> > >
> > >       /* dsi controller can only be reset while clocks are running */
> > >       dsi_write(msm_host, REG_DSI_RESET, 1);
> > > -     wmb();  /* make sure reset happen */
> > > +     msleep(20);     /* make sure reset happen */
> > >       dsi_write(msm_host, REG_DSI_RESET, 0);
> > >       wmb();  /* controller out of reset */
> > >       dsi_write(msm_host, REG_DSI_CTRL, data0);
> > > --
> > > 2.17.1
> > >
> >
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
