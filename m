Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEE471226
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 08:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbfGWG4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 02:56:14 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44014 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729771AbfGWG4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 02:56:13 -0400
Received: by mail-ot1-f65.google.com with SMTP id j11so18716033otp.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 23:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lUBHi4V0jbs+PI1x2E2emk4h7AlczmgN17NIDpKKEzg=;
        b=GdHL0OLR9MMU8MGJo4otr/TdZFsSA0UxqtOQui0zEfIqQlhLK2CGfZW8ytl1ZmR9Ib
         +b/U7OBC/YLwNeCzwVa6A6bH+wTX+0/gB+ti7Al0AU7B3pb6o+1hFUgBKqUK0Y7uF5bS
         rre/ivpXSJS4E+oMcmCW+2h3serP6aFzMyvhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lUBHi4V0jbs+PI1x2E2emk4h7AlczmgN17NIDpKKEzg=;
        b=ds2bhjsRfXFlqrjl2TPUU9T4BdWtHL9WjuejWcqS+gra990JA4ngqK9o4I+kx9e6VN
         OZENdraCh3LjBDofwFV1KEBOHeHBgUjq49MJr7zbbDeVLeyr1of3cw8OgquPnK+c8EMD
         T+INr/E3N7Hdxcg/R8IJObesOhbSu0SkEeisL5H4ZWw4xD77ZeBt6QpGLfPPzl66d6OO
         T1qbp5ELLuhAPqWv/qWpT/127VBT6CFWbdvajlvtq/85QODNcZouBl5f04krkLSNtsOt
         l6ihb7/ZS7VhSX5QKpPC+iPMNTbl7OZp3H6aqhoEa5UIVyqhpGETHiaiGvBPwdKYxYc2
         xclw==
X-Gm-Message-State: APjAAAVBuRDhms67Oa7T0MwlVLKmnOVQe2jl9LuLJG9NvcUgJrRLTGfC
        uW65tDbADAsoxj5eDoDwdE795Vaz2o9WTVYARZw=
X-Google-Smtp-Source: APXvYqxMG/SxPI5o04z/vlx8y6fiZNp1fU+33+6t/Qmm0N2gqxRxW2D8d6Jjq1vmwqH0e9bSahJ/ztLebu4OqaAYz0w=
X-Received: by 2002:a05:6830:ce:: with SMTP id x14mr36930304oto.188.1563864972359;
 Mon, 22 Jul 2019 23:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local> <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local> <20190719135558.GC104440@art_vandelay>
 <20190719141528.GN5942@intel.com> <20190719142959.GD104440@art_vandelay> <afaf9da1143534422a277c2bbe8c84db@codeaurora.org>
In-Reply-To: <afaf9da1143534422a277c2bbe8c84db@codeaurora.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 23 Jul 2019 08:56:00 +0200
Message-ID: <CAKMK7uEv-UB=AobTcNoqbHL2+rXTQae-MtDNkgtfgWVVHGTR_w@mail.gmail.com>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
To:     Jeykumar Sankaran <jsanka@codeaurora.org>
Cc:     Sean Paul <sean@poorly.run>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        pdhaval@codeaurora.org, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 23, 2019 at 1:50 AM Jeykumar Sankaran <jsanka@codeaurora.org> w=
rote:
>
> On 2019-07-19 07:29, Sean Paul wrote:
> > On Fri, Jul 19, 2019 at 05:15:28PM +0300, Ville Syrj=C3=A4l=C3=A4 wrote=
:
> >> On Fri, Jul 19, 2019 at 09:55:58AM -0400, Sean Paul wrote:
> >> > On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
> >> > > On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
> >> > > > On 2019-07-16 02:07, Daniel Vetter wrote:
> >> > > > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wr=
ote:
> >
> > /snip
> >
> >> > > > > >   drm: add mode flags in uapi for seamless mode switch
> >> > > > >
> >> > > > > I think the uapi is the trivial part here, the real deal is ho=
w
> >> > > > > userspace
> >> > > > > uses this. Can you pls post the patches for your compositor?
> >> > > > >
> >> > > > > Also note that we already allow userspace to tell the kernel w=
hether
> >> > > > > flickering is ok or not for a modeset. msm driver could use th=
at to at
> >> > > > > least tell userspace whether a modeset change is possible. So =
you can
> >> > > > > already implement glitch-free modeset changes for at least vid=
eo mode.
> >> > > > > -Daniel
> >> > > >
> >> > > > I believe you are referring to the below tv property of the conn=
ector.
> >> > > >
> >> > > > /**
> >> > > >  * @tv_flicker_reduction_property: Optional TV property to contr=
ol the
> >> > > >  * flicker reduction mode.
> >> > > >  */
> >> > > > struct drm_property *tv_flicker_reduction_property;
> >> > >
> >> > > Not even close :-)
> >> > >
> >> > > I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl=
. This
> >> > > is not a property of a mode, this is a property of a _transition_ =
between
> >> > > configurations. Some transitions can be done flicker free, others =
can't.
> >> >
> >> > Agree that an atomic flag on a commit is the way to accomplish this.=
 It's pretty
> >> > similar to the psr transitions, where we want to reuse most of the a=
tomic
> >> > circuitry, but in a specialized way. We'd also have to be careful to=
 only
> >> > involve the drm objects which are seamless modeset aware (you could =
imagine
> >> > a bridge chain where the bridges downstream of the first bridge don'=
t care).
> >> >
> >> > >
> >> > > There's then still the question of how to pick video vs command mo=
de, but
> >> > > imo better to start with implementing the transition behaviour cor=
rectly
> >> > > first.
> >> >
> >> > Connector property? Possibly a terrible idea, but I wonder if we cou=
ld [re]use
> >> > the vrr properties for command mode. The docs state that the driver =
has the
> >> > option of putting upper and lower bounds on the refresh rate.
> >>
> >> Not really sure why this needs new props and whatnot. This is kinda
> >> what
> >> the i915 "fastset" stuff already does:
> >> 1. userspace asks for something to be changed via atomic
> >> 2. driver calculates whether a modeset is actually required
> >> 3. atomic validates need_modeset() vs. DRM_MODE_ATOMIC_ALLOW_MODESET
> >> 4. if (need_modeset) heavyweight_commit() else lightweight_commit()
> >>
> >> Ie. why should userspace really care about anything except the
> >> "flickers are OK" vs. "flickers not wanted" thing?
> >
> > Agree, I don't think the seamless modeset (ie: changing resolution
> > without
> > flicker) needs a property. Just need to test the commit without
> > ALLOW_MODESET
> > and commit it if the test passes.
> >
>
> Agreed that a TEST_ONLY commit without ALLOW_MODESET flag can be used to
> check
> whether the modeset can be done seamless. But since there are no error
> code returns,
> the client cannot distinguish the test_only commit failures from other
> invalid config failures.
>
> Also, note that when the client sees two 1080p modes (vid/cmd) and it is
> interested only
> to do *only* seamless switches, without any additional flag it cannot
> distinguish between
> these two 1080p modes. The client has to invoke two test_only commits
> with these
> modes to identify the seamless one. Is that a preferred approach?
>
> Intel's "fastset" calculates the need for modeset internally based on
> the
> configuration and chooses the best commit path. But the requirement here
> is to expose the information up-front since the use case cannot afford
> to fall back to the normal modeset when it has requested for a seamless
> one.
>
> >>
> >> Also what's the benefit of using video mode if your panel supportes
> >> command mode? Can you turn off the memory in the panel and actually
> >> save power that way? And if there is a benefit can't the driver just
> >> automagically switch between the two based on how often things are
> >> getting updated? That would match how eDP PSR already works.
> >
> > I'm guessing video mode might have some latency benefits over command
> > mode?
> >
> > Sean
>
> Yes. Pretty much those are reasons we need to switch to video mode. But
> instead
> of making the decision internal to the driver based on the frequency of
> frame updates,
> we have proprietary use cases where the client has to trigger the switch
> explicitly.
> So we are trying to find ways to represent the same resolution in both
> video/cmd modes.

If "proprietary" here means closed source or not upstream, then that's
the part you need to fix first. See

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspac=
e-requirements

Cheers, Daniel

>
> Thanks and Regards,
> Jeykumar S.
>
> >
> >>
> >> --
> >> Ville Syrj=C3=A4l=C3=A4
> >> Intel
>
> --
> Jeykumar S



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
