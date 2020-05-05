Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B3D1C618F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 22:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgEEUFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 16:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728076AbgEEUFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 16:05:09 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B89C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 13:05:09 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id a16so911781uaq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 13:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=is9Xg/jDY2hlvzxxkj8gSJyN4nwiexBQ6VoJdlH2pRs=;
        b=FiZXSAJuepSv7GIyhKWdKF4kwyFRL5ILWzC4rUfRGiXbPxFUNekK3boOx0lu9xI00h
         t/aEEr/a+5eY/N4p6Fsj2HjVywB8vHh6BxPihAgUTHhV7xVhNQqsZ7T/MNZfXCI6cBI6
         UYIwPsMGXQy15XvJ8oGbgKJTQdCwM7KsMNJ44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=is9Xg/jDY2hlvzxxkj8gSJyN4nwiexBQ6VoJdlH2pRs=;
        b=nMTNaN0YC95CHM4cqdNd6qA/wRg69DhWWu0a3xaTAfNqjZdcwxorWLl/4MV79kUtaN
         p+jMGGdEL1Q4EjoyY13AfYP1PLArUgiEcsQnNQaGuP0lWcj2PENXVzAglafp+vtu85Wp
         C64s2pCvDVuY/V4ftLBKVa10TvKtVKBkL+K/mw2d16a8YPPrtbf9j5/2EAOkiiD7w/b0
         YsZPwIgw0h/UBhCx6FmZ/Tv+3YKuf9fHXMGCChXFuL7+LCBTbqjTsJtMpmiytiLkt3Rf
         bOypDkiJorUOqJgd3+EnVP+kvQZjn2G6LIQhsk9LOZ9d4a9oyv4v0UDTdKWlzUYrFmHS
         jZIg==
X-Gm-Message-State: AGi0Puby+V6bRR17Fgh8PiD5xxamtUFtZ9fGmHmfLXZ4evnncOKcwedk
        gZeZwWIXGlTSN6x2nsq+RBDfNKfMuuQ=
X-Google-Smtp-Source: APiQypIBh1NIFW9qGR9ipoCZN5Fg4oEtaKtUesxy9eXVAp8ddPep6grEdHDOU7nR8QkELxij704QvQ==
X-Received: by 2002:a9f:2b0a:: with SMTP id p10mr4216839uaj.10.1588709107772;
        Tue, 05 May 2020 13:05:07 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id k184sm1499879vke.42.2020.05.05.13.05.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 13:05:07 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id a5so15764vsm.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 13:05:06 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr4973549vsq.169.1588709106441;
 Tue, 05 May 2020 13:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200425175312.124892-1-swboyd@chromium.org> <20200425175312.124892-2-swboyd@chromium.org>
 <CAD=FV=WDmk9+e+ZXaUdhegwLCszCZXCQaiMQa_vkKsE+s6XZ0Q@mail.gmail.com> <158866060708.24786.3695568539661593702@swboyd.mtv.corp.google.com>
In-Reply-To: <158866060708.24786.3695568539661593702@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 5 May 2020 13:04:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmXvQ+=coxQrnRiB1Sgfanumo-MLUW4cv=OhDFZbEeSQ@mail.gmail.com>
Message-ID: <CAD=FV=VmXvQ+=coxQrnRiB1Sgfanumo-MLUW4cv=OhDFZbEeSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] soc: qcom: rpmh-rsc: Remove tcs_is_free() and
 find_free_tcs() APIs
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, May 4, 2020 at 11:36 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > -static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
> > > -                                 const struct tcs_request *msg)
> > > +static int check_for_req_inflight_and_find_free(struct rsc_drv *drv,
> > > +       const struct tcs_group *tcs, const struct tcs_request *msg)
> > >  {
> > >         unsigned long curr_enabled;
> > >         u32 addr;
> > > -       int i, j, k;
> > > -       int tcs_id = tcs->offset;
> > > -
> > > -       for (i = 0; i < tcs->num_tcs; i++, tcs_id++) {
> > > -               if (tcs_is_free(drv, tcs_id))
> > > -                       continue;
> > > +       int j, k;
> > > +       int i = tcs->offset;
> > > +       unsigned long max = tcs->offset + tcs->num_tcs;
> > > +       int first_free = i;
> >
> > The way "first_free" is calculated definitely adds complexity to this
> > function.  Are we sure it's justified compared to just calling
> > find_next_zero_bit() if the function doesn't return -EBUSY?  If you
> > really like it this way I won't object too strongly, but I'm not
> > convinced that it makes the code size smaller (vs. jumping to a common
> > implementation in the kernel) and it seems unlikely to have any
> > real-world speed impact.
>
> I was trying to coalesce the double loop over the free bits here by
> adding a couple more lines to keep track of the first free bit and to
> set the bit when it's found. It almost feels like it would be better to
> inline this whole function into the one call site too.

Definitely a bike shed color issue.  I know it was double-looping before, but:

* Neither loop was very long, a few bits at most.

* The 2nd loop was in common code.  That means the "number of
instructions" to implement this loop is small--just a function call.
For code that isn't a hot spot it can be better to optimize for code
size rather than speed since it means you're taking up fewer cache
lines and thus less likely to kick out other code.  ;-)  ...but we're
getting into micro optimization.

In any case, I probably haven't convinced you.  I'm fine with your
code and I'll shut up now.


> > > -               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, tcs_id);
> > > +       for_each_set_bit_from(i, drv->tcs_in_use, max) {
> > > +               /* Find a free tcs to use in this group */
> > > +               if (first_free == i)
> > > +                       first_free = i + 1; /* Maybe the next one is free? */
> > >
> > > +               curr_enabled = read_tcs_reg(drv, RSC_DRV_CMD_ENABLE, i);
> > >                 for_each_set_bit(j, &curr_enabled, MAX_CMDS_PER_TCS) {
> > > -                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, tcs_id, j);
> > > +                       addr = read_tcs_cmd(drv, RSC_DRV_CMD_ADDR, i, j);
> > >                         for (k = 0; k < msg->num_cmds; k++) {
> > >                                 if (addr == msg->cmds[k].addr)
> > >                                         return -EBUSY;
> > > @@ -526,28 +514,11 @@ static int check_for_req_inflight(struct rsc_drv *drv, struct tcs_group *tcs,
> > >                 }
> > >         }
> > >
> > > -       return 0;
> > > -}
> > > +       if (first_free >= max)
> > > +               return -EBUSY;
> > >
> > > -/**
> > > - * find_free_tcs() - Find free tcs in the given tcs_group; only for active.
> > > - * @tcs: A pointer to the active-only tcs_group (or the wake tcs_group if
> > > - *       we borrowed it because there are zero active-only ones).
> > > - *
> > > - * Must be called with the drv->lock held since that protects tcs_in_use.
> > > - *
> > > - * Return: The first tcs that's free.
> > > - */
> > > -static int find_free_tcs(struct tcs_group *tcs)
> > > -{
> > > -       int i;
> > > -
> > > -       for (i = 0; i < tcs->num_tcs; i++) {
> > > -               if (tcs_is_free(tcs->drv, tcs->offset + i))
> > > -                       return tcs->offset + i;
> > > -       }
> > > -
> > > -       return -EBUSY;
> > > +       set_bit(first_free, drv->tcs_in_use);
> >
> > Function is not documented to also set the bit.  Do we really gain
> > anything by setting it in this function, or can it just stay with the
> > caller?  I'd hate to call this function
> > check_for_req_inflight_and_find_free_and_claim_it().
>
> Maybe the function can be named claim_tcs_for_req() or something like
> that. Anything to make it shorter would be good!

Sure.  ...though moving the set_bit() here is just pure churn, right?
It can be here or it can be in the calling function and there's really
no advantage either way.  If you really like it here then fine.  I
just see no benefit and it's just an extra line to change.


-Doug
