Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73A82D356
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 03:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfE2BcZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 21:32:25 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:32940 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfE2BcZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 21:32:25 -0400
Received: by mail-it1-f194.google.com with SMTP id j17so4134309itk.0;
        Tue, 28 May 2019 18:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIfvpAwcUL5aEcXjuJeQ2M0pAhR/Zr/nyVu2Et28hv0=;
        b=C7CgTaK82YvBIf4VqQZ1gYpGRtU608zv44voHBNeDAcYIU7bv1Mgb7g30FYTu40lwO
         zhdd9h0dxduIt62RQVCc8h1fzpgFKcPqXxV4MRWqjWckPxc8X29Gjh5k/HC6CWbzRc47
         vofESGt2DjeRHO1PWS2uIyLDUqI+hLaMOVQiPNifJtnvc5zmxut2xvuJVwaPccNM0jkb
         Z4SPYUoKO8G8T2TvIaFoHZoeF+E9SL2pI8XS3ISFzJLkSJ4osCyn1ZWU/rwDvESjn/UD
         Pb9wYesQCGZHQGPnLpy37hVAyeDR+pohWh9gsBc+oZhrHKJYSBBPt5SGMFhyQWsTzaOb
         kE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIfvpAwcUL5aEcXjuJeQ2M0pAhR/Zr/nyVu2Et28hv0=;
        b=Nq38QFaS35w+NcHzZo1d7u+KQaD7R3w1/K+xideJmSEUOgd5jTm6ibTywo1fz4G7Cb
         Hpp6pgyEUVWNpym5YHU1hXCa7+TExeD9SA+4ygrs4kEmSO/Kz/X69EpCOLiQ0xWeEEi+
         bU+qQaW1Sf2miF4HBH6U9KoL7thjT/DLb/FTsI+CMNRfNBn0m4dBRgtNGyBbTp09N7qD
         W3qr0fDBaM+hWXA7i9IhKm+5+YBwVW26htBz/FzMxtPpXHi/KMxEdQ/mdJX5aoGqhIk1
         NNg82U/9t+wAHW4+1a9GdVdNCrPyyDhAWVpvlsktUITKBZcdYsfI/wXIoHsEpeOWjWaE
         3OwQ==
X-Gm-Message-State: APjAAAVjbhiMaxDnd7Mlit2BgwJEAbjxtozZHsX30EFnMFQ7AQS/CqO7
        MrzvwrjKypr31MRMLl0A0K64FkBJouldvYGPPvo=
X-Google-Smtp-Source: APXvYqyviJ1M9Qn4lMTmVfNca0S4nsXUtbXTlNjutUOnT584whK0rl7+oPDULSNBLe94uMh6uSFlFMrgzR416XD0phM=
X-Received: by 2002:a24:7289:: with SMTP id x131mr1588107itc.62.1559093544804;
 Tue, 28 May 2019 18:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org> <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
In-Reply-To: <20190529011705.GA12977@basecamp>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 28 May 2019 19:32:14 -0600
Message-ID: <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
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

On Tue, May 28, 2019 at 7:17 PM Brian Masney <masneyb@onstation.org> wrote:
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

Do you know if the nexus 5 has a video or command mode panel?  There
is some glitchyness with vblanks and command mode panels.
