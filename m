Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8CF30E5C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 23:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhBCWJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 17:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbhBCWJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 17:09:17 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20A4C061573;
        Wed,  3 Feb 2021 14:08:36 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u14so1115516wri.3;
        Wed, 03 Feb 2021 14:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZJlDPDMrWIWcvU77LN9zrfIUHEDl26zI6D0g0M5VBNs=;
        b=KKOWlEja+/AN4ZDOQfMlGTaDqB/3f4EgGuQYgDHFonB391/crY8+r3unb4wW/tD3TT
         oHEnUmRHPmgfjU3GCIo7iH9fF/EGfw9ZHRGdTKmMsm8eFDvI5ynmtSVUs+mXqfW+EjRb
         AOzJC43ibtL00Gu7F1cyuRuUkh/tH/SNRjql146pFtizqpeIv5nPTa4PPj1SjaOZibyu
         t7VFDmkMEJ2GUOxm2PcgsHnlWCPHMjLxuhb3C28/VYbWXMOz8NTeRGILcfO6yc1oUOSC
         wv3pgZ+AXppO+vtMEztRDR2ZUdTSFtwujf2krr6GjgnflNR5jTE82rsMmBAXWJD0umND
         qZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZJlDPDMrWIWcvU77LN9zrfIUHEDl26zI6D0g0M5VBNs=;
        b=tPnwrCgBEE8G8EMLvy6ipmZdC9tdGIUI3/Gprx+l/KLYMBtwJ5q7DA7N7+EguXApj6
         7kUp/PBxa5rCisD2I6w/UWDP38wZX/zUm8UzeyxDRup5XZWPleC+BfPLsUqExFvegWYu
         wRnPhis9NJL1vE5Z4Lpis7EUvSFbOoiGDmAGG0uZB9M6CONpBqz3iYUdZ+etghGKbh7b
         eEgNI0cOlovvbSY01c8DqHBMlWWftGhRQjJSck3GmeaVLhjw9Q+LSNV5jyWAj0yzhBP3
         wx2QEU7ys7y/mevsWdcji1SJIIMzZ0MmzoYVuD0pgQCknF8g1INgoSO9a4tsTV2hWZap
         sdwQ==
X-Gm-Message-State: AOAM531AfwqBCVuOok/SwFkF1ZmzP6ECDfDOL/In/7UxeSa53qS09fCS
        IF1AsBDy0Ifc46TOQ46kUCftRKzrVAwWzZByT24s6uktILiFCg==
X-Google-Smtp-Source: ABdhPJzPuTDC2UxOsfIOLS/x+mXyaWz64C5FDMl4EEVGmPuEJH3/QBYrpUjTZy1XmvRfFdOQ3sgCQ9/RIPzy4POu7w0=
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr5884454wrq.132.1612390115324;
 Wed, 03 Feb 2021 14:08:35 -0800 (PST)
MIME-Version: 1.0
References: <20210125234901.2730699-1-swboyd@chromium.org> <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
 <YBp2h2cVXrF6lBno@phenom.ffwll.local> <CAF6AEGvTrfYYTfReGbAm9zcBNhjZvX0tko4kZUeQcyNZv4cM6w@mail.gmail.com>
 <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
In-Reply-To: <161238950899.76967.16385691346035591773@swboyd.mtv.corp.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 3 Feb 2021 14:11:09 -0800
Message-ID: <CAF6AEGtFpjpYoY_iu8F2z-RMJ=0+tBYo-akKJ1JbgKagBuQWtA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 3, 2021 at 1:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Rob Clark (2021-02-03 09:29:09)
> > On Wed, Feb 3, 2021 at 2:10 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> > > > On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > >
> > > > > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > > > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > > > > the same lock, when they actually aren't. That's because we call
> > > > > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > > > > lock initialized in this loop. Let's allocate a dynamic number of
> > > > > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > > > > out an AA deadlock isn't possible here.
> > > > > >
> > > > > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > > > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > > > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > > >
> > > > > This smells like throwing more bad after initial bad code ...
> > > > >
> > > > > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > >
> > > Some technical on the patch itself: I think you want
> > > mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
> > > classes hand-rolled. It's defacto the same, but much more obviously
> > > correct since self-documenting.
> >
> > hmm, yeah, that is a bit cleaner.. but this patch is already on
> > msm-next, maybe I'll add a patch on top to change it
>
> How many CRTCs are there? The subclass number tops out at 8, per
> MAX_LOCKDEP_SUBCLASSES so if we have more than that many bits possible
> then it will fail.

conveniently MAX_CRTCS is 8.. realistically I don't *think* you'd ever
see more than 2 or 3

BR,
-R
