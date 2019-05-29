Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B552D375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 03:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfE2Bmb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 21:42:31 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:40945 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfE2Bmb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 21:42:31 -0400
Received: by mail-io1-f65.google.com with SMTP id n5so414679ioc.7;
        Tue, 28 May 2019 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EoH2CWs7MbhK17fbwkAfBOhK3xMnc8wfuzTcqK+dRok=;
        b=t/LCSr8xmnGFbrNlwWwdHzTqfSnxCY2L4yCEWv+eDYxqZr3lB3ryKGh4LzLhjSQNrA
         /RzeI3aRYUCJYc2fpYuKQ6a7s3kTDGOn+u1K6KS95Fy29F/65tEHFbRROzeTZsoFON/J
         6jSXvJvo52WVnjvtiWDpecOIosufjGsRBjuBzdqtMT1rHp7TfW21zouiqAL1lFg9YZq9
         GxkFbgBcbG059EuX4wD2RjgfFV2K7lKeBFUMppxU+n0yhqxCfw3Mk2BGGqk4S/p920Vl
         nC++iL0Zl55Hkb52NgL7I+R7Ap9cWXPWP3S3YW2aTGy1ehGKMAPdZdYzt7AXhHEcmWhf
         ZBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EoH2CWs7MbhK17fbwkAfBOhK3xMnc8wfuzTcqK+dRok=;
        b=muUXydfBHXo9XJ4wIHCPSHiBm/U/rEFZc82wc3PD3eaG4lLjD3hS2p6VFabAi0t8xy
         AJt4jbyIAQ7pX7sacOcy7dW/pWd7GLf47/JJU0LszENuTwSP33ZxImb7NhX20e51oXKe
         xulWQxPYDeQdqb5vwm1AcQs+97fTfTWorQb0WG+rLDQ3QQKegmQOzfl1SNaw+S61bOua
         8DXGqUDTo+8VniCfGwTa5pJKA8zNIXVbSySCrLV+v2mWstQrwlh42VAXlZWk6KaLeq5i
         Tui0qsLlEpkFVz8LfUhIw8YUYMhD8/6PUajZF5R719vQJQk/aNEhdQUKSpAG5oL5oJXd
         J3aw==
X-Gm-Message-State: APjAAAUaJuII9b7YdXMTzExJSu8phTLl5gXl9oCqeBGGhjI0NIjqP/p4
        dTmg5FmtHB2MhFkO/wZ13Ahb2RUOzRYoZIUJpMw=
X-Google-Smtp-Source: APXvYqxwxeY+R7quqY3oZRbtrIXfoVBb/W64nxddsmJtcEguN5jt64SgwZTJCAwkvdH/eBAnKMXkPnr9tECqxSYmXJI=
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr7942229iod.166.1559094150520;
 Tue, 28 May 2019 18:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org> <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp> <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
In-Reply-To: <20190529013713.GA13245@basecamp>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 28 May 2019 19:42:19 -0600
Message-ID: <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 7:37 PM Brian Masney <masneyb@onstation.org> wrote:
>
> On Tue, May 28, 2019 at 07:32:14PM -0600, Jeffrey Hugo wrote:
> > On Tue, May 28, 2019 at 7:17 PM Brian Masney <masneyb@onstation.org> wrote:
> > >
> > > On Tue, May 28, 2019 at 03:46:14PM +0200, Linus Walleij wrote:
> > > > On Thu, May 9, 2019 at 4:04 AM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > > Here is a patch series that adds initial display support for the LG
> > > > > Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> > > > > of these patches are RFC until we can get it fully working.
> > > > >
> > > > > The phones boots into terminal mode, however there is a several second
> > > > > (or more) delay when writing to tty1 compared to when the changes are
> > > > > actually shown on the screen. The following errors are in dmesg:
> > > >
> > > > I tested to apply patches 2-6 and got the console up on the phone as well.
> > > > I see the same timouts, and I also notice the update is slow in the
> > > > display, as if the DSI panel was running in low power (LP) mode.
> > > >
> > > > Was booting this to do some other work, but happy to see the progress!
> > >
> > > Thanks!
> > >
> > > I've had three people email me off list regarding the display working on
> > > 4.17 before the msm kms/drm driver was converted to the DRM atomic API so
> > > this email is to get some more information out publicly.
> > >
> > > I pushed up a branch to my github with 15 patches applied against 4.17
> > > that has a working display:
> > >
> > > https://github.com/masneyb/linux/commits/display-works-4.17
> > >
> > > It's in low speed mode but its usable. The first 10 patches are in
> > > mainline now and the last 5 are in essence this patch series with the
> > > exception of 'drm/atomic+msm: add helper to implement legacy dirtyfb'.
> > > There's a slightly different version of that patch in mainline now.
> > >
> > > I'm planning to work on the msm8974 interconnect support once some of
> > > the outstanding interconnect patches for the msm kms/drm driver arrive
> > > in mainline. I'd really like to understand why the display works on
> > > 4.17 with those patches though. I assume that it's related to the
> > > vblank events not working properly? Let me preface this with I'm a
> > > total DRM newbie, but it looked like the pre-DRM-atomic driver wasn't
> > > looking for these events in the atomic commits before the migration?
> > > See commit 70db18dca4e0 ("drm/msm: Remove msm_commit/worker, use atomic
> > > helper commit"), specifically the drm_atomic_helper_wait_for_vblanks()
> > > call that was added.
> >
> > Do you know if the nexus 5 has a video or command mode panel?  There
> > is some glitchyness with vblanks and command mode panels.
>
> Its in command mode. I know this because I see two 'pp done time out'
> messages, even on 4.17. Based on my understanding, the ping pong code is
> only applicable for command mode panels.

Actually, the ping pong element exists in both modes, but 'pp done
time out' is a good indicator that it is command mode.

Are you also seeing vblank timeouts?

Do you have busybox?

Can you run -
sudo busybox devmem 0xFD900614
sudo busybox devmem 0xFD900714
sudo busybox devmem 0xFD900814
sudo busybox devmem 0xFD900914
sudo busybox devmem 0xFD900A14
