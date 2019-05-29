Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C7B2D3C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 04:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfE2CYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 22:24:21 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:37723 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfE2CYV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 22:24:21 -0400
Received: by mail-it1-f193.google.com with SMTP id s16so1119728ita.2;
        Tue, 28 May 2019 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pkI2uXRAShxqXkSUvpvwJ4ItMDdl8/Q41df8coamHk0=;
        b=LX+X2Ny7LZpwASE6RSVor7y3/lpFmffZt9vd3p4i+CdDT9yJn+B04Lc7DmEm/WrZV8
         Gm5jBfDpQt6e7gWn/yJQlEIfCAmMvLeuexPyULZsToNY7DjhKd4yD2b3eYQzyLj5a0xS
         cY/28OKxSy8xY47dxsMMWITaiXvhuhIucoCfgiinU8Ftu5KKUq8uZ3JXz06DJkewLKnP
         KRAohIHXkViAZFFL0mWlU6ZL9KTre4i6QT37E6Jb76PCU1bE0Wqv4hWeMF3TkTYcEnv6
         IMtVtOP8Ii9Jzw/jUL7CNRhe/0QdEqlDPfDyEI7V2Y9h5xQl0FXZFyUGjnMYwnqT+oTa
         jOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pkI2uXRAShxqXkSUvpvwJ4ItMDdl8/Q41df8coamHk0=;
        b=RhVaFU9E8pN/UxnkPpqpQbbrtKuUJwEoT7TazoSPod4j/238o98zuFOQCa+nT0T0Ot
         znmZwjq0X45nvoAMbFG8pc+dcA9FletKW9W2jxzOFsEzRGaI+KqwsQbTDKJMP44aVPZv
         teCXkO4hx79jnFWqUM5g7BuKftz62eK4yoZLF8lhGVK5sZ4Di4eb3xf9yGSuJCRRC9x+
         seEjzRju6POHLZwFE6UhPVOBmgMjBySH486ZOO1zJYO+qbAQnz1wmTk1smitr3PdWc13
         ry6nhfKyfeF4D5NMnWV2Zsi25NR68/90goS00e9GC1027aUDlmSvSldixlIWP5qtfEFA
         WJ/g==
X-Gm-Message-State: APjAAAXneMX1Ht5xHxpZvCc5NnjE8rdJe9lTOac+MAXhzr/NieQTKW+n
        JsGspatCPQK+ZYPCfecc0fN6FjDDKLMwvQMIgl8=
X-Google-Smtp-Source: APXvYqzvE5182ciT1TB9K19vtHHojeePX9Mas/KsfGZ6QiNvfa3aalA7WoBVYO+NTqQoODG9q3QtMCdcwyFBijqVObo=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr5835760itb.128.1559096659929;
 Tue, 28 May 2019 19:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org> <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp> <CAF6AEGu4JNePimAmBG6GFT8DAaQ56OXYqu5BSN_JQB4KaBt29Q@mail.gmail.com>
In-Reply-To: <CAF6AEGu4JNePimAmBG6GFT8DAaQ56OXYqu5BSN_JQB4KaBt29Q@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 28 May 2019 20:24:09 -0600
Message-ID: <CAOCk7Nq4zh_tY1aPQ3vJLxR-YDCfYY+iMqx+i5aXUX-wnyPP3w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To:     Rob Clark <robdclark@gmail.com>
Cc:     Brian Masney <masneyb@onstation.org>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 8:15 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, May 28, 2019 at 6:17 PM Brian Masney <masneyb@onstation.org> wrote:
> >
> > On Tue, May 28, 2019 at 03:46:14PM +0200, Linus Walleij wrote:
> > > On Thu, May 9, 2019 at 4:04 AM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > > Here is a patch series that adds initial display support for the LG
> > > > Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> > > > of these patches are RFC until we can get it fully working.
> > > >
> > > > The phones boots into terminal mode, however there is a several second
> > > > (or more) delay when writing to tty1 compared to when the changes are
> > > > actually shown on the screen. The following errors are in dmesg:
> > >
> > > I tested to apply patches 2-6 and got the console up on the phone as well.
> > > I see the same timouts, and I also notice the update is slow in the
> > > display, as if the DSI panel was running in low power (LP) mode.
> > >
> > > Was booting this to do some other work, but happy to see the progress!
> >
> > Thanks!
> >
> > I've had three people email me off list regarding the display working on
> > 4.17 before the msm kms/drm driver was converted to the DRM atomic API so
> > this email is to get some more information out publicly.
> >
> > I pushed up a branch to my github with 15 patches applied against 4.17
> > that has a working display:
> >
> > https://github.com/masneyb/linux/commits/display-works-4.17
> >
> > It's in low speed mode but its usable. The first 10 patches are in
> > mainline now and the last 5 are in essence this patch series with the
> > exception of 'drm/atomic+msm: add helper to implement legacy dirtyfb'.
> > There's a slightly different version of that patch in mainline now.
> >
> > I'm planning to work on the msm8974 interconnect support once some of
> > the outstanding interconnect patches for the msm kms/drm driver arrive
> > in mainline. I'd really like to understand why the display works on
> > 4.17 with those patches though. I assume that it's related to the
> > vblank events not working properly? Let me preface this with I'm a
> > total DRM newbie, but it looked like the pre-DRM-atomic driver wasn't
> > looking for these events in the atomic commits before the migration?
> > See commit 70db18dca4e0 ("drm/msm: Remove msm_commit/worker, use atomic
> > helper commit"), specifically the drm_atomic_helper_wait_for_vblanks()
> > call that was added.
>
> interconnect probably good to get going anyways (and I need to find
> some time to respin those mdp5/dpu patches) but I guess not related to
> what you see (ie. I'd expect interconnect issue would trigger
> underflow irq's)..
>
> I'm not entirely sure why atomic would break things but cmd mode
> panels aren't especially well tested.  I can't find it now but there
> was a thread (or IRC discussion?) that intf2vblank() should be
> returning MDP5_IRQ_PING_PONG_<n>_DONE instead of
> MDP5_IRQ_PING_PONG_<n>_RD_PTR, which seems likely and possibly related
> to vblank timing issues..

That was an irc discussion, and I've changed my mind on that.

My big issue ended up being that autorefresh was enabled (which
basically turns the command panel into a pseudo video mode panel),
which appears incompatible with using the start kick.  If FW is
configuring things in autorefresh mode, the driver likely doesn't
know, and will make a mess of things by using the start kick.

Disabling autorefresh would make the driver work as is, but fbcon
wouldn't work well (you'd need to do a start kick per frame, which
doesn't seem to happen).  Removing the start kick and using the
autorefresh feature seemed better in my testing, but I haven't cleaned
up my code tree to send something up.

However, lets see how the hardware is actually configured in Brian's case.
