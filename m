Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455911FA3D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 01:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgFOXFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 19:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFOXFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 19:05:11 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2394DC061A0E;
        Mon, 15 Jun 2020 16:05:10 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id p20so948226iop.11;
        Mon, 15 Jun 2020 16:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VFv24iOZv9KF5trz0flSTD/rWAv9Y05l58tQASHoWIg=;
        b=kQD+05pHpznMTPV9+Two/R6GytrwdxDxzKo83oW+1gco16CFz/ug3zBMKAMho0aCXF
         yIYAiej8OhyU5LxyzDZnHLNreRRCbGmeMXu0FqiJ02acS/T/sH7g8D2fDQ0O0xagtkFY
         i7bMk0V3Joke5vnlkHnT+L5Ws9NJgcMlK4aDU03riyPjmKoQpAiwcY6g0EKEUp6vk8j5
         mqhXM0Sk5iJqgW3AylowHf9G5p1VrFRuNRrVTfSJhTr9mL6npN4W0fYEkW3eS33S445p
         4TfIJHUu2GOE2wHAyZ7AQvuYz9u4Dy9bYacQ3HjJMO2tP0QEc32I4Ux9N/iy/Yh3srnW
         eVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VFv24iOZv9KF5trz0flSTD/rWAv9Y05l58tQASHoWIg=;
        b=APEvz8ei4bTLMCAF/Rx6NHA8erG5LKEgwqR4tJGz6+amDF4rmIzl6kvbSh2gb3WYKX
         UaqziihEfW3j4FtJ8e7tfpJryWsH73ScbqBrvoHZUggvNEn1NkdMLquD6DCU1kX1UaUo
         VBKAR54A8ArPhZYpaDh8ybXV4SKEmIP7+Pnx4EG6FLziMbP7ADNrwsZrkfNV/YNAJTp3
         LZPOG0LnY7R5jm03N1nEbMJsC5rF16kwctdy+UanHVy+IqFe3CVqwoOGxWGzEiJquUUl
         3H42jTlALvnQemqIdwib088IHHVNwINpKfLoSxXYTYSGSGjbGl10MZclKLXcaCQSIj91
         +5nA==
X-Gm-Message-State: AOAM530X2m/8o1rvHIkGugfBL3U6IorcvuJPuYehyUdBQv4VFkY25Ucb
        aG5LiBwRB0bNlsBRYvTr646hLsV8KgCZiWUJqe8=
X-Google-Smtp-Source: ABdhPJyo/ojNDoI/BEqlvGOGeUOvo9mXeqcYNWw009OTq0g74atntpiKvyM0XDPNO+z656j1sxQZkGIM5rT+4fO5hiI=
X-Received: by 2002:a6b:8b12:: with SMTP id n18mr227575iod.160.1592262309281;
 Mon, 15 Jun 2020 16:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200612015030.16072-1-tanmay@codeaurora.org> <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
 <1eda01da33b620ddee5162be3326853f@codeaurora.org>
In-Reply-To: <1eda01da33b620ddee5162be3326853f@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 15 Jun 2020 17:04:57 -0600
Message-ID: <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
To:     tanmay@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        DTML <devicetree@vger.kernel.org>, aravindh@codeaurora.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 15, 2020 at 4:51 PM <tanmay@codeaurora.org> wrote:
>
> On 2020-06-12 16:26, Stephen Boyd wrote:
>
> Thanks for reviews Stephen.
>
> > Quoting Tanmay Shah (2020-06-11 18:50:25)
> >> These patches add support for Display-Port driver on SnapDragon
> >> hardware. It adds
> >> DP driver and DP PLL driver files along with the needed device-tree
> >> bindings.
> >>
> >> The block diagram of DP driver is shown below:
> >>
> >>
> >>                  +-------------+
> >>                  |DRM FRAMEWORK|
> >>                  +------+------+
> >>                         |
> >>                    +----v----+
> >>                    | DP DRM  |
> >>                    +----+----+
> >>                         |
> >>                    +----v----+
> >>      +------------+|   DP    +----------++------+
> >>      +        +---+| DISPLAY |+---+      |      |
> >>      |        +    +-+-----+-+    |      |      |
> >>      |        |      |     |      |      |      |
> >>      |        |      |     |      |      |      |
> >>      |        |      |     |      |      |      |
> >>      v        v      v     v      v      v      v
> >>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
> >>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
> >>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
> >>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
> >>     |                              |     |
> >>  +--v---+                         +v-----v+
> >>  |DEVICE|                         |  DP   |
> >>  | TREE |                         |CATALOG|
> >>  +------+                         +---+---+
> >>                                       |
> >>                                   +---v----+
> >>                                   |CTRL/PHY|
> >>                                   |   HW   |
> >>                                   +--------+
> >>
> >
> > I've never seen a block diagram for a driver before...
> >
> It is here for v5. https://patchwork.freedesktop.org/series/74312/

I think Stephen is nitpicking your wording, and you seem to not be
understanding his comment.  I'm sorry if I am mistaken.

The "DP driver" would seem to refer to the linux software driver you
are proposing patches for, however this diagram looks like a hardware
diagram of the various hardware blocks that the Linux driver code (the
"DP driver") is expected to interact with.  I believe you should
re-word "The block diagram of DP driver is shown below:" to be more
specific of what you are describing with your figure.  IE your words
say this is a block diagram of the software, when it looks like it is
a block diagram of the hardware.
