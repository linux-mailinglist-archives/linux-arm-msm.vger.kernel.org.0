Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3F12D332
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 03:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbfE2BRH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 21:17:07 -0400
Received: from onstation.org ([52.200.56.107]:41432 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbfE2BRH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 21:17:07 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id DC95F3E93F;
        Wed, 29 May 2019 01:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559092626;
        bh=624x27QESSEqdHdt8jzd0ud8U0qgsoYwZR247KGLs0E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bhY0pU6QI6vSQUXwTbKMMbwo2QHJ971xqn7eUiLTyXSQeUKqVNIqC7ifzFhdxZgNT
         l98hUA5Uw9EK3nVmwFcPc4oFA+11WCN0M2L59LyFp97/pKisUVlzaN6JGOMNdO/Kcd
         OzcTKkDDlXjjeGCT/xTywIbT0MNrBbaAZ2MZWuz4=
Date:   Tue, 28 May 2019 21:17:05 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190529011705.GA12977@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 03:46:14PM +0200, Linus Walleij wrote:
> On Thu, May 9, 2019 at 4:04 AM Brian Masney <masneyb@onstation.org> wrote:
> 
> > Here is a patch series that adds initial display support for the LG
> > Nexus 5 (hammerhead) phone. It's not fully working so that's why some
> > of these patches are RFC until we can get it fully working.
> >
> > The phones boots into terminal mode, however there is a several second
> > (or more) delay when writing to tty1 compared to when the changes are
> > actually shown on the screen. The following errors are in dmesg:
> 
> I tested to apply patches 2-6 and got the console up on the phone as well.
> I see the same timouts, and I also notice the update is slow in the
> display, as if the DSI panel was running in low power (LP) mode.
> 
> Was booting this to do some other work, but happy to see the progress!

Thanks!

I've had three people email me off list regarding the display working on
4.17 before the msm kms/drm driver was converted to the DRM atomic API so
this email is to get some more information out publicly.

I pushed up a branch to my github with 15 patches applied against 4.17
that has a working display:

https://github.com/masneyb/linux/commits/display-works-4.17

It's in low speed mode but its usable. The first 10 patches are in
mainline now and the last 5 are in essence this patch series with the
exception of 'drm/atomic+msm: add helper to implement legacy dirtyfb'.
There's a slightly different version of that patch in mainline now.

I'm planning to work on the msm8974 interconnect support once some of
the outstanding interconnect patches for the msm kms/drm driver arrive
in mainline. I'd really like to understand why the display works on
4.17 with those patches though. I assume that it's related to the
vblank events not working properly? Let me preface this with I'm a
total DRM newbie, but it looked like the pre-DRM-atomic driver wasn't
looking for these events in the atomic commits before the migration?
See commit 70db18dca4e0 ("drm/msm: Remove msm_commit/worker, use atomic
helper commit"), specifically the drm_atomic_helper_wait_for_vblanks()
call that was added.

Brian
