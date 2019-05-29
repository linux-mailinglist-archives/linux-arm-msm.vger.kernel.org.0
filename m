Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C02A72D3A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 04:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfE2CPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 22:15:05 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35163 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbfE2CPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 22:15:05 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so1131852edr.2;
        Tue, 28 May 2019 19:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MVuq7lYaXanQ2+muRBv1fL9MjUsN0jmBARMWs3+IXa4=;
        b=TI6pGipGG6Tmo7+0fwdqTp7wV3+aiOpsbht6be1dsWP2ku4I1dSCYO4gVu6KPzUuZS
         NnX8I9sQKcYRBPlwfle7uM66O8mHfggCXWP7BGbCb3beoGCVCid6ik75HNmMbeMgjHvx
         eDZwhDHipnxUE0I4rPjzPGXq1mqPyXndXUFxPWkR2kT3LLfC7nZ+KKyae6VYlFh6cKhT
         j9rZFyCnO3myUsy15l36yvHsrhFRGq9XCTJfVpBKyVSLJJ4x955ScGyl4wGeAJdPEkCD
         Tky+G1WtRi6GRjqJGi33sUaYvVSc0yMtncd6Rtxl2+KeBIHLIY3iWAJsvyyyqSwWxUrY
         lutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MVuq7lYaXanQ2+muRBv1fL9MjUsN0jmBARMWs3+IXa4=;
        b=br4Y9QlqKW0SJKIAK8GX1l053V1ZlJ4H3Ds+QmjpCbudfWLfkfoyDscMbQHSmUFWXE
         aFjyqL/ikpbm+TJIfYTR6M9vfRE/HI7iLwHc0P4QedYYcqGo52d2S5Gj1EzZ4qvkdoq3
         B6YqwaAtSIj8Ca6fNYEGSCY2u0GEUiJZBFypPsWwlHzQSDpBCgalRWO3OMZXfiTu5xDm
         nAYhfoOaCee6TJAevaFX6PuDpax4VGq4V9jUoEHI4mReUhOu7fn07SkexSs5HmICM3xh
         FH2sbfkkuLyYyaBoBH0ZzgGfBLUUg4qsJBtDvT8xC7ukETW1UMiMQihv91AO/J08xzHY
         JGoQ==
X-Gm-Message-State: APjAAAVeiHvwhxczgfO1y6Awur3fcjdwebKs+rULlfKv8rtNOuHw45YD
        fiXrBh4+rOD7ECQkoKPSnJuvyTN12J2vI0BLfLE=
X-Google-Smtp-Source: APXvYqyOg5fgYNs1hVcgXxnSIALAf/v2b0IbtA6UkMpm8Me8LtYEdvXve0H0HiVXQItgpL6SOU+F0L3Z0HgnhF+z4oc=
X-Received: by 2002:a05:6402:1484:: with SMTP id e4mr2931835edv.57.1559096103705;
 Tue, 28 May 2019 19:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org> <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 28 May 2019 19:14:50 -0700
Message-ID: <CAF6AEGu4JNePimAmBG6GFT8DAaQ56OXYqu5BSN_JQB4KaBt29Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
To:     Brian Masney <masneyb@onstation.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 6:17 PM Brian Masney <masneyb@onstation.org> wrote:
>
> On Tue, May 28, 2019 at 03:46:14PM +0200, Linus Walleij wrote:
> > On Thu, May 9, 2019 at 4:04 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > > Here is a patch series that adds initial display support for the LG
> > > Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> > > of these patches are RFC until we can get it fully working.
> > >
> > > The phones boots into terminal mode, however there is a several second
> > > (or more) delay when writing to tty1 compared to when the changes are
> > > actually shown on the screen. The following errors are in dmesg:
> >
> > I tested to apply patches 2-6 and got the console up on the phone as well.
> > I see the same timouts, and I also notice the update is slow in the
> > display, as if the DSI panel was running in low power (LP) mode.
> >
> > Was booting this to do some other work, but happy to see the progress!
>
> Thanks!
>
> I've had three people email me off list regarding the display working on
> 4.17 before the msm kms/drm driver was converted to the DRM atomic API so
> this email is to get some more information out publicly.
>
> I pushed up a branch to my github with 15 patches applied against 4.17
> that has a working display:
>
> https://github.com/masneyb/linux/commits/display-works-4.17
>
> It's in low speed mode but its usable. The first 10 patches are in
> mainline now and the last 5 are in essence this patch series with the
> exception of 'drm/atomic+msm: add helper to implement legacy dirtyfb'.
> There's a slightly different version of that patch in mainline now.
>
> I'm planning to work on the msm8974 interconnect support once some of
> the outstanding interconnect patches for the msm kms/drm driver arrive
> in mainline. I'd really like to understand why the display works on
> 4.17 with those patches though. I assume that it's related to the
> vblank events not working properly? Let me preface this with I'm a
> total DRM newbie, but it looked like the pre-DRM-atomic driver wasn't
> looking for these events in the atomic commits before the migration?
> See commit 70db18dca4e0 ("drm/msm: Remove msm_commit/worker, use atomic
> helper commit"), specifically the drm_atomic_helper_wait_for_vblanks()
> call that was added.

interconnect probably good to get going anyways (and I need to find
some time to respin those mdp5/dpu patches) but I guess not related to
what you see (ie. I'd expect interconnect issue would trigger
underflow irq's)..

I'm not entirely sure why atomic would break things but cmd mode
panels aren't especially well tested.  I can't find it now but there
was a thread (or IRC discussion?) that intf2vblank() should be
returning MDP5_IRQ_PING_PONG_<n>_DONE instead of
MDP5_IRQ_PING_PONG_<n>_RD_PTR, which seems likely and possibly related
to vblank timing issues..

BR,
-R



>
> Brian
