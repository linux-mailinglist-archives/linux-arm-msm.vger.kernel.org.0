Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF11F6B75
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Nov 2019 21:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfKJU6D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Nov 2019 15:58:03 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43217 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfKJU6D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Nov 2019 15:58:03 -0500
Received: by mail-oi1-f196.google.com with SMTP id l20so9765796oie.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Nov 2019 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fRTdHuzP7m8CyOp9cDpSU/GZ7mMvua7uneamg00/xxk=;
        b=BlFYLLlsrBlk/zp7DpiwKHajHilCOcCDFbciFqi/Ai0DowE9OG56G3wu+P6NAcBGQu
         yJCTqJHk7FP6VbF8Nj66oVJ29kbTVYs2M0vDCaRdlrnfn+xG9vM15xF+krCZzUsMD9ox
         qMXqUBKIxFpDNutYIJQsdrl3MByNLimKQGjI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fRTdHuzP7m8CyOp9cDpSU/GZ7mMvua7uneamg00/xxk=;
        b=S2cZePiEkjl/cVamQbzSX+6xQF3nS33YDUokYG0ZvBr91n5l70h0HDBWqZGZZJpnjM
         h8apEN/fLGLS/woA2XHVwhgU5mkqKsYRHzaISmFGs6zhj3xUSd2l7rQWQgdooKh4Lv6B
         9EAisRs8XnOrQLzHIUUXVh7JY0zGdnbf3TrVkkAsyU7+ZRVCdpr6nozU64z4pg2Nch3w
         kmhxoL14stPVfWUu4jhG6z99Zl94sl6ZyJjHiiSG+Z6qxQCpXInIyNAaqs9a2LsAtfsl
         2M1K/cYF2FusN1Xbiijh0EWbfB+owlIUQZSRp+q2FX0dtqSQ+mPwwfZiLljMtMn4J0bs
         IigA==
X-Gm-Message-State: APjAAAXacuR/KVkbvOZ0jTT8wjG2GcnPcfIZrOJzeBFwoDdnh1zP4rSH
        H0rg2Nc2DX7IPXjrLkmtHnngrIuAXvZ1pd3Q5aoylA==
X-Google-Smtp-Source: APXvYqwHLRwA27/vFHXGERGx8OmEl04NIMIDQkB4Ll0Uhe6ss1fHvqRkaCbwM/AYDcVvRerzgKapnIHxtZ9YRoeAxJY=
X-Received: by 2002:aca:3889:: with SMTP id f131mr21084303oia.14.1573419480881;
 Sun, 10 Nov 2019 12:58:00 -0800 (PST)
MIME-Version: 1.0
References: <1573155554-16248-1-git-send-email-cohens@codeaurora.org>
 <20191108083448.GU23790@phenom.ffwll.local> <7072bcc51eb44d49ab4266e0ec216df6@codeaurora.org>
In-Reply-To: <7072bcc51eb44d49ab4266e0ec216df6@codeaurora.org>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Sun, 10 Nov 2019 21:57:48 +0100
Message-ID: <CAKMK7uEi=sBsmumX5Fxm1jcM665yL3P6tWVhS_p9zCic02N3HA@mail.gmail.com>
Subject: Re: [PATCH 0/3] allow DRM drivers to limit creation of blobs
To:     Steve Cohen <cohens@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Alistair Strachan <adelva@google.com>, pdhaval@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Nov 9, 2019 at 1:01 AM <cohens@codeaurora.org> wrote:
>
> On 2019-11-08 03:34, Daniel Vetter wrote:
> > On Thu, Nov 07, 2019 at 02:39:11PM -0500, Steve Cohen wrote:
> >> Fuzzers used in Android compliance testing repeatedly call the
> >> create blob IOCTL which eventually exhausts the system memory.
> >> This series adds a hook which allows drivers to impose their own
> >> limitations on the size and/or number of blobs created.
> >
> > Pretty sure this isn't just a problem for msm/dpu alone, why this very
> > limited approach?
> >
> I'm not familiar enough with the blob requirements for other
> vendor's drivers to impose any restrictions on them. The idea
> was to provide the hook for vendors to implement their own
> checks. Support for msm/mdp* drivers will be added in v2 if this
> approach is acceptable.

Yeah, but I don't think different limits (and then maybe different
tunables for these different limits) on drivers isn't a great idea.
Plus I thought this kind of stuff was supposed to be catched by the
kernel memory cgroup controller. Does that not work? The blob stuff is
maybe a bit too direct way to allocate kernel memory, but there's many
others I've thought. This all just feels a lot like busywork to check
an android compliance checkbox, without really digging into the
underlying problem and fixing it for real.

One approach that would work I think would be:
- Extended the blob property type to have min/max size (we might need
a range for some), set it for all current blob properties. To do that
we'd need to create a new property creation function for blobs, which
takes those limits. There's not a hole lot of them, so should be
doable.
- In the create blob function we walk all property (or book-keep that
somewhere) and check the blob isn't too big.
- We also validate the size when setting the property, at least some
of that code from various places.

I think this would actually improve the situation here, instead of
whack-a-mole. The cheaper cope-out would be if we simply limit the
total property size to something big enough, but not unlimited, like
16MB or something like that.

> > Also, why are your fuzzers not also allocating enormous amounts of gem
> > buffers, which will also exhaust memory eventually?
>
> Excellent question... This will likely come in a follow-up series.

Would be good to know that, so we can solve this for real, not just a
one-off for the compliance checkbox. Also really wondering why cgroups
doesn't catch this.
-Daniel

>
> > -Daniel
> >
> >>
> >> Steve Cohen (3):
> >>   drm: add driver hook for create blob limitations
> >>   drm/msm: add support for createblob_check driver hook
> >>   drm/msm/dpu: check blob limitations during create blob ioctl
> >>
> >>  drivers/gpu/drm/drm_property.c          |  7 +++++++
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
> >>  drivers/gpu/drm/msm/msm_drv.c           | 25
> >> +++++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/msm_kms.h           |  1 +
> >>  include/drm/drm_drv.h                   |  9 +++++++++
> >>  5 files changed, 56 insertions(+)
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> >> Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
